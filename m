Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C62C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bh0BdyixRnDd6O7y8OvWoe7BilB3MF8CQqhr1ip8jM=; b=HVLSffBXsqwmSdAYi0Ox1Mkh0A
	OZYmeEf/njenA7Np49rz140ed2PmSlNkVBd9Npv0d17ZOvla2XWaYEIdVhGGQ4vSXxcG+derockJ6
	o76d1Z6YnkI39EyA7bZ1qCWdzXn+fOLqUfJXeWLX/eahJTZgJA4yLTrVPorSLAl7WRfj1DmT3tQgY
	ghR8avMU4LjnxbVkCmM0ODUiS/DRsbTyPKa0gSfq+uEKx2YrLMYP6aO6FjIyHOtrwCmkFI4MUeEDF
	mvnXgMa0mv1wThNTsmlMpCZLP2XXmqs46DA2ZqJnbFK6KJf8FIiIh+jvSGM7P/PCQnDX1C8jeLpNh
	M9+MNTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhjJ-0000000Av2C-3J1H;
	Thu, 26 Jun 2025 08:13:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhao-0000000Asxu-0tEw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:04:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0EXZa027655;
	Thu, 26 Jun 2025 08:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9bh0BdyixRnDd6O7y8OvWoe7BilB3MF8CQqhr1ip8jM=; b=B47zkZ5P/f5rZs0C
	sv+zpXXegSp5V8D03Yqf02SdiNEdjGQzExSCEYkckthqnlcdZpuananbDe9RDliW
	yKJMC6P3CZ4l1KU3xgj3EGRfXaUXXhlJ++zbJ05eS5aO6/EOh6Xt3iZ1hOaI+/cV
	38ihwf+qDFBbCerJgzDji4O4mEA7K/oPKX6qT4iiMwbNewYQfBJDx6ecaLjrU82R
	WkXuN3/NVoY1PIvoHEcqb1Ha30sYrvIs5bWem8vgP3upWf3xie4h7o8IdAU6Z2iw
	fU0hubREb791B34FjJoKuWgyAzljIzOh66TRY01tuk2Dzss39W78HrGJAREY6kcK
	25hzsQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5umfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 08:04:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55Q84Brl031370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 08:04:11 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 01:04:07 -0700
Message-ID: <3905c8ab-941a-4171-a1d9-7721059a7490@quicinc.com>
Date: Thu, 26 Jun 2025 16:04:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: arm: Add qcom,qmi-id for remote etm
To: Bjorn Andersson <andersson@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-4-quic_jinlmao@quicinc.com>
 <ugxijerhh5yfgpvmuaatvenh7yrk5uoiracfp7xknsxrb73dcl@hwsatze4rjuq>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <ugxijerhh5yfgpvmuaatvenh7yrk5uoiracfp7xknsxrb73dcl@hwsatze4rjuq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lkzTFagtO3N3ZaAkJPjolOa-R_hAEndf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA2NSBTYWx0ZWRfXw+rmMdNYNj/b
 FDIWbb6LfSWXdLmOXQIs7bMkYQ0f1i3ekwh9XG7MX1ShPY9oED+xgAuVNs6oMUrvODR0rc1epUJ
 iZ+mn7P92bWZwsg1g88877kyAWKMK/M60Fe3yHA7sfXCK12opzP1kZ1r1x9HfmdguQgEYAdoqKA
 HQLpil9QA6btULs8U/DThickdN29S0FMHOmZx3HZvmZ6kJ4FzqOSxrk2zyABE1JnHilcm6j8xOL
 1ktDVc/Q82+phCFlM+xz45jnOYmAL6VZddPc7e6mApngYgYt56K/kLFPauHTJ8g4jM4wrmj8tVC
 3lj81PaXCxnQtAiqwwTs9Bv6r1gqDssLDdxPRZAg71n9RfYJpau8IvdeT8+NS6ffIL8aaujPbsH
 X1CICqoyBl8OhHBuRdMsrpAb4Wd7EpY3CWtP6FWM/R8KxQS+pmGmldbFoW1biPrGGjSrTwAI
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685cfefc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=GsXIiSCn9My1Hi_4oy0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lkzTFagtO3N3ZaAkJPjolOa-R_hAEndf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_010422_271946_1E9623A9 
X-CRM114-Status: GOOD (  20.72  )
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



On 2025/6/18 11:16, Bjorn Andersson wrote:
> On Thu, Apr 24, 2025 at 04:58:52AM -0700, Mao Jinlong wrote:
>> qcom,qmi-id is required for remote etm driver to find the remote
>> subsystem connection. It is the instance id used by qmi API to
>> communicate with remote processor.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> index 4fd5752978cd..947fe33738a3 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> @@ -20,6 +20,13 @@ properties:
>>     compatible:
>>       const: qcom,coresight-remote-etm
>>   
>> +  qcom,qmi-id:
> 
> Why isn't this "qcom,qmi-instance-id" if that's what it represents?

ok.

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      This id is used by qmi API to communicate with remote processor for
>> +      enabling and disabling remote etm. Each processor has its unique instance
>> +      id.
> 
> DeviceTree describes the hardware and firmware interface, so don't
> describe properties in terms of what Linux will do with this value, but
> what it represents.

Sure. I will update it.

> 
>> +
>>     out-ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>       additionalProperties: false
>> @@ -32,6 +39,7 @@ properties:
>>   required:
>>     - compatible
>>     - out-ports
>> +  - qcom,qmi-id
> 
> How can this suddenly be required, did devices described by this binding
> up until this point not work?

Without this instance id, remote etm won't work.

> 
> If this is the case, make sure to clearly describe this in the commit
> message.
> 
> Regards,
> Bjorn
> 
>>   
>>   additionalProperties: false
>>   
>> @@ -40,6 +48,8 @@ examples:
>>       etm {
>>           compatible = "qcom,coresight-remote-etm";
>>   
>> +        qcom,qmi-id = <2>;
>> +
>>           out-ports {
>>               port {
>>                   modem_etm0_out_funnel_modem: endpoint {
>> -- 
>> 2.25.1
>>


