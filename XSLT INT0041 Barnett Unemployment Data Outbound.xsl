<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:bc="urn:com.workday/bc"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xtt="urn:com.workday/xtt"
    xmlns:wd="urn:com.workday.report/CR_INT0041_Barnett_Unemployment_Data_Outbound"
    xmlns:etv="urn:com.workday/etv" xmlns:out="http://www.workday.com/integration/output"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    version="2.0" exclude-result-prefixes="xsd xsl bc out">


    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Dec 3, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Darren Ustaris</xd:p>
            <xd:p>INT0041 Barnett Unemployment Data Outbound Document Transform XSLT</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>
            <xd:p> Set the output method to xml</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes"/>

    <xd:doc>
        <xd:desc>
            <xd:p>General Description of the template</xd:p>
        </xd:desc>
        <xd:param name="Param1">Detail Record</xd:param>
    </xd:doc>
    
    

    <xsl:template match="wd:Report_Data">
        
        <File >
         
            <xsl:for-each select="wd:Report_Entry">
              
                <!--Detail Record-->
               <DetailRecord xtt:endTag="&#xA;">
                    
                   <StateCode xtt:fixedLength="2"><xsl:value-of select="wd:Worker/wd:CF_INT0041_LRV_Work_State_ISO__Worker_"/></StateCode>
                   <StateSUI xtt:fixedLength="15"><xsl:value-of select="wd:Worker/wd:State_Withholding_SUI_-_EIN"/></StateSUI>
                   <FEINS  xtt:fixedLength="9"><xsl:value-of select="wd:Company/wd:Employer_s_Federal_ID_Number"/></FEINS>    
                   <LocationCode xtt:fixedLength="12"><xsl:value-of select="wd:Worker/wd:CF_INT0041_LRV_Location_Ref_ID__Worker_"/></LocationCode>
                   <CompanyName xtt:fixedLength="40"><xsl:value-of select="wd:Company/@wd:Descriptor"/></CompanyName>
                   <Division xtt:fixedLength="40"><xsl:value-of select="wd:Worker/wd:CF_INT_LRV_GL_Division_Code__Worker_"/></Division>
                   <SSN xtt:fixedLength="9"><xsl:value-of select="wd:Worker/wd:Social_Security_Number"/></SSN>
                   <EmployeeID xtt:fixedLength="8"><xsl:value-of select="wd:Worker/wd:Employee_ID"/></EmployeeID>
                   <Name xtt:fixedLength="40"><xsl:value-of select="wd:Worker/wd:CF_INT0041_CT_Emp_Name__Worker_"/></Name>
                   <HireDate xtt:fixedLength="8" xtt:dateFormat="yyyyMMdd"><xsl:value-of select="wd:Worker/wd:Original_Hire_Date"/></HireDate>
                   <RehireDate xtt:fixedLength="8" xtt:dateFormat="yyyyMMdd"><xsl:value-of select="wd:Worker/wd:Hire_Date"/></RehireDate>
                   <SeparationDate xtt:fixedLength="8" xtt:dateFormat="yyyyMMdd"><xsl:value-of select="wd:Worker/wd:Last_Day_of_Work"/></SeparationDate>
                    
                   <TerminationDate xtt:fixedLength="8" xtt:dateFormat="yyyyMMdd"><xsl:value-of select="wd:Worker/wd:termination_date"/></TerminationDate>
                   <CurrentStatus xtt:fixedLength="1"><xsl:value-of select="wd:Worker/wd:CF_INT0041_EE_Status__Worker_"/></CurrentStatus>
                   <JobTitle xtt:fixedLength="40"><xsl:value-of select="wd:Worker/wd:Job_Title"/></JobTitle>
                   
                   
                   <PositionType xtt:fixedLength="1"><xsl:value-of select="wd:Worker/wd:CF_INT0041_EE_Position_Type__Worker_"/></PositionType>
                           
                   <SeparationCode xtt:fixedLength="6" xtt:map="Separation Code"><!--<xsl:value-of select="wd:Worker/wd:Termination_Reason"/>--></SeparationCode>
                   <SeparationDescription xtt:fixedLength="40"><xsl:value-of select="wd:Worker/wd:Termination_Reason"/></SeparationDescription>
                   <Supervisor xtt:fixedLength="30"><xsl:value-of select="wd:Worker/wd:CF_INT0041_LRV_Worker_s_Manager_Legal_Name__Worker_/@wd:Descriptor"/></Supervisor>
                   <SupervisorPhone xtt:fixedLength="10"><xsl:value-of select="wd:Worker/wd:CF_INT0041_LRV_Worker_s_Manager_Work__Phone__Worker_"/></SupervisorPhone>
                   <PayFrequency xtt:fixedLength="1"><xsl:value-of select="wd:Worker/wd:CF_INT0041_LRV_Worker_s_Manager_Pay_Frequency__Worker_"/></PayFrequency>
                   <AnnualPayRate xtt:fixedLength="10"><xsl:value-of select="wd:Worker/wd:CF_INT0041_FN_Annualized_Base_Pay__Worker_"/></AnnualPayRate>
                   <HourlyWage xtt:fixedLength="6"><xsl:value-of select="wd:Worker/wd:CF_INT0041_FN_Hourly_Wage__Worker_"/></HourlyWage>
                   <CurrentPayGross xtt:fixedLength="10"><xsl:value-of select="wd:Gross_Current_Amount"/></CurrentPayGross>
                   <GrossAmountYTD xtt:fixedLength="13"><xsl:value-of select="wd:Gross_YTD"/></GrossAmountYTD>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   <CurrentPayPeriodEnding xtt:fixedLength="8"><xsl:value-of select="wd:CF_INT0041_FN_Gross_Pay__Payroll_Result_"/></CurrentPayPeriodEnding>
                   <CurrentPayDate xtt:fixedLength="8"><xsl:value-of select="wd:CF_INT0041_FD_Payment_Date__Payroll_Result_"/></CurrentPayDate>
                   <HoursWorked xtt:fixedLength="8"><xsl:value-of select="wd:CF_INT0041_FN_Hours_Worked_for_Result__Payroll_Result_"/></HoursWorked>
                   <EmployeeAddress xtt:fixedLength="29"><xsl:value-of select="wd:Worker/wd:Primary_Address_-_Formatted_Line_1"/></EmployeeAddress>
                   <EmployeeAddress xtt:fixedLength="29"><xsl:value-of select="wd:Worker/wd:Primary_Address_-_Formatted_Line_2"/></EmployeeAddress>
                   <City xtt:fixedLength="19"><xsl:value-of select="wd:Worker/wd:Primary_Address_-_City"/></City>
                   <State xtt:fixedLength="2"><xsl:value-of select="wd:Worker/wd:CF_INT0041_LRV_Home_State_ISO__Worker_"/></State>
                   <ZipCode xtt:fixedLength="10"><xsl:value-of select="wd:Worker/wd:Primary_Home_Address_-_Postal_Code"/></ZipCode>
                   <EmployeePIN xtt:fixedLength="12"></EmployeePIN>
                   <YearsofService xtt:fixedLength="2"><xsl:value-of select="wd:Worker/wd:yearsOfService"/></YearsofService>
                   <MonthsofService xtt:fixedLength="2"><xsl:value-of select="wd:Worker/wd:CF_INT0041_ST_Length_of_Service_in_Months__Worker_"/></MonthsofService>
                   
                   
                   <!--Accumulators based on Earning Code-->
                   <!--Regular-->
                   <PayType1 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_R"/></PayType1>
                   <PayAmount1 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="wd:Regular_Current_Amount"/></PayAmount1>
                   <PayYTD1 xtt:fixedLength="13"><xsl:value-of select="wd:Regular_YTD"/></PayYTD1>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Bonus-->
                   <PayType2 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_B"/></PayType2>
                   <PayAmount2 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="wd:Bonus_Current_Amount"/></PayAmount2>
                   <PayYTD2 xtt:fixedLength="13"><xsl:value-of select="wd:Bonus_YTD"/></PayYTD2>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Commission-->
                   <PayType3 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_C"/></PayType3>
                   <PayAmount3 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="wd:Commission_Current_Amount"/></PayAmount3>
                   <PayYTD xtt:fixedLength="13"><xsl:value-of select="wd:Commission_YTD"/></PayYTD>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Gross Sui Wages-->
                   <PayType4 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_Z"/></PayType4>
                   <PayAmount4 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="Gross_SUI_Wages_Current_Amount"/></PayAmount4>
                   <PayYTD4 xtt:fixedLength="13"><xsl:value-of select="Gross_SUI_Wages_YTD"/></PayYTD4>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Vacation-->
                   <PayType5 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_V"/></PayType5>
                   <PayAmount5 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="wd:Vacation_Current_Amount"/></PayAmount5>
                   <PayYTD5 xtt:fixedLength="13"><xsl:value-of select="Vacation_YTD"/></PayYTD5>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Overtime-->
                   <PayType6 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_O"/></PayType6>
                   <PayAmount6 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="wd:Overtime_Current_Amount"/></PayAmount6>
                   <PayYTD6 xtt:fixedLength="13"><xsl:value-of select="wd:Overtime_YTD"/></PayYTD6>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                  
                   <!--Severance-->
                   <PayType7 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_E"/></PayType7>
                   <PayAmount7 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="wd:Severance_Current_Amount"/></PayAmount7>
                   <PayYTD7 xtt:fixedLength="13"><xsl:value-of select="wd:Severance_YTD"/></PayYTD7>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Sick-->
                   <PayType8 xtt:fixedLength="1"><!--<xsl:value-of select="wd:CF_INT0041_TC_S__Global_"/>--></PayType8>
                   <PayAmount8 xtt:fixedLength="10" xtt:align="right"><!--<xsl:value-of select=""/>--></PayAmount8>
                   <PayYTD8 xtt:fixedLength="13"><!--<xsl:value-of select=""/>--></PayYTD8>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Holiday-->
                   <PayType9 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_H"/></PayType9>
                   <PayAmount9 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="wd:Holiday_Current_Amount"/></PayAmount9>
                   <PayYTD9 xtt:fixedLength="13"><xsl:value-of select="wd:Holiday_YTD"/></PayYTD9>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Pension-->
                   <PayType10 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_P"/></PayType10>
                   <PayAmount10 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="wd:Pension_Current_Amount"/></PayAmount10>
                   <PayYTD10 xtt:fixedLength="13"><xsl:value-of select="wd:Pension_YTD"/></PayYTD10>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Tips-->
                   <PayType11 xtt:fixedLength="1"><!--<xsl:value-of select="wd:CF_INT0041_TC_T__Global_"/>--></PayType11>
                   <PayAmount11 xtt:fixedLength="10" xtt:align="right"><!--<xsl:value-of select=""/>--></PayAmount11>
                   <PayYTD11 xtt:fixedLength="13"><!--<xsl:value-of select=""/>--></PayYTD11>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Wage in lieu of Notice-->
                   <PayType12 xtt:fixedLength="1"><!--<xsl:value-of select="wd:CF_INT0041_TC_W__Global_"/>--></PayType12>
                   <PayAmount12 xtt:fixedLength="10" xtt:align="right"><!--<xsl:value-of select=""/>--></PayAmount12>
                   <PayYTD12 xtt:fixedLength="13"><!--<xsl:value-of select=""/>--></PayYTD12>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Workers Compensation-->
                   <PayType13 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_K"/></PayType13>
                   <PayAmount13 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="wd:Workers_Compensation_Current_Amount"/></PayAmount13>
                   <PayYTD13 xtt:fixedLength="13"><xsl:value-of select="wd:Workers_Compensation_YTD"/></PayYTD13>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
                   <!--Miscellaneous-->
                   <PayType14 xtt:fixedLength="1"><xsl:value-of select="wd:CF_INT0041_TC_M"/></PayType14>
                   <PayAmount14 xtt:fixedLength="10" xtt:align="right"><xsl:value-of select="wd:Miscellaneous_Current_Amount"/></PayAmount14>
                   <PayYTD14 xtt:fixedLength="13"><xsl:value-of select="wd:Miscellaneous_YTD"/></PayYTD14>
                   <Filler xtt:fixedLength="13"></Filler>
                   <Filler xtt:fixedLength="13"></Filler>
                   
        
                </DetailRecord>
               
            </xsl:for-each>
           
            
        </File>
    </xsl:template>

    
</xsl:stylesheet>