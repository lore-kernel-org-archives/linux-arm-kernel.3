Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024F5D70E02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 02:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrXm2D95YzK2XfL6//NbpfmH0gV9TCCoCZ6jVK/zfkA=; b=SqFxEhwUnNymICFb71AnOMoSsJ
	YQ3Jm5ASovpQHH3yRAS/Xx++O4PzvXF/PMYBcXvKJbWbmKpddxxqdj0g80SrDSWVUsFyKrZNJhIuY
	u6BjX3HnTkL/3nRloRcsyhQgnmRdCFR1n4w9hafd9yz3EJkeaI6MsxURxcQoxEaNYpxZRT6mFaRn3
	cOrBsLRrWmYYTEhOVpEe0IZHb8GETY/yhMD8mrQzHXG3iAGAi4Bt4CvvEVcQ2QJE3so/E2A2dc9og
	EMi29qywA8ip6/xnb17gjXcJvkwrGrIakKzXIrZzhVXQj3lBOlvgl08CRG5BUY1xhnWTolIPDBk5t
	H3p1skGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGqdl-0000000GjmZ-34Ws;
	Fri, 29 Nov 2024 02:21:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGqcm-0000000GjgP-3Ktp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 02:20:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMMssO028200;
	Fri, 29 Nov 2024 02:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrXm2D95YzK2XfL6//NbpfmH0gV9TCCoCZ6jVK/zfkA=; b=mqIa3SnimrG/wYhp
	TJt5FfXvkAbnc91gImT4m316X12LoL08h4q08seRT5WDTJf83+SbOJTnrrPcYnfi
	EiTQQ12UDy118XHRA8BH9MaglGmzLc3gmwEE6T95u2BYmLc4nnXxsavjZsPO3Rcm
	NjGZ1MsUHF0UBQ+uCadVFG3f0s+PCYo+d+tsbbo0uy4jL1tJqsZ3qWTcJ/4Uxo31
	mHGVMgLeu7rQMWuhyZ+dXNFCJlfeZvIRulG5UCGQMQ+eYJPm09ndFIHgT37O7Zji
	Gcnyvl7j5pNYKyBI3rDD1SRDr+k18i2ckggtmZ2pOr7xBlRAppauWLfPJcJgmooR
	yTjCdA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43673jc48w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:20:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT2KkFp032347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:20:46 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 18:20:42 -0800
Message-ID: <7083653c-15c6-4971-b9ca-cd7fa02a9a75@quicinc.com>
Date: Fri, 29 Nov 2024 10:20:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <quic_tengfan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-2-26aa8a164914@quicinc.com>
 <evzdrhzrr242ynfv6p4qhtjpgd4allzgw3osxalmtyfxzsjj2h@vingsirpf5su>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <evzdrhzrr242ynfv6p4qhtjpgd4allzgw3osxalmtyfxzsjj2h@vingsirpf5su>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7FY4LVx6QF9Uqp1KKhJ7dnSWgNtxdbXv
X-Proofpoint-ORIG-GUID: 7FY4LVx6QF9Uqp1KKhJ7dnSWgNtxdbXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=828 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_182052_873273_4E0634CF 
X-CRM114-Status: GOOD (  17.03  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 11/28/2024 9:12 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 28, 2024 at 04:44:44PM +0800, Jingyi Wang wrote:
>> Enable clock controller, interconnect and pinctrl for Qualcomm
>> QCS8300 platform to boot to UART console.
> 
> ... which is used on the ABC DEF board. The defconfig is being enabled
> for everybody, so at least let them know which board increases the size
> of the default kernel build.
> 
will add that
>>
>> The serial engine depends on gcc, interconnect and pinctrl. Since
>> the serial console driver is only available as built-in, so these
>> configs needs be built-in for the UART device to probe and register
>> the console.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  arch/arm64/configs/defconfig | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index d13218d0c30f..3d9e48940c96 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -608,6 +608,7 @@ CONFIG_PINCTRL_MSM8996=y
>>  CONFIG_PINCTRL_MSM8998=y
>>  CONFIG_PINCTRL_QCM2290=y
>>  CONFIG_PINCTRL_QCS404=y
>> +CONFIG_PINCTRL_QCS8300=y
>>  CONFIG_PINCTRL_QDF2XXX=y
>>  CONFIG_PINCTRL_QDU1000=y
>>  CONFIG_PINCTRL_SA8775P=y
>> @@ -1327,6 +1328,7 @@ CONFIG_MSM_MMCC_8998=m
>>  CONFIG_QCM_GCC_2290=y
>>  CONFIG_QCM_DISPCC_2290=m
>>  CONFIG_QCS_GCC_404=y
>> +CONFIG_QCS_GCC_8300=y
>>  CONFIG_SC_CAMCC_7280=m
>>  CONFIG_QDU_GCC_1000=y
>>  CONFIG_SC_CAMCC_8280XP=m
>> @@ -1634,6 +1636,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8996=y
>>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>>  CONFIG_INTERCONNECT_QCOM_QCM2290=y
>>  CONFIG_INTERCONNECT_QCOM_QCS404=m
>> +CONFIG_INTERCONNECT_QCOM_QCS8300=y
>>  CONFIG_INTERCONNECT_QCOM_QDU1000=y
>>  CONFIG_INTERCONNECT_QCOM_SA8775P=y
>>  CONFIG_INTERCONNECT_QCOM_SC7180=y
>>
>> -- 
>> 2.25.1
>>
> 
Thanks,
Jingyi


