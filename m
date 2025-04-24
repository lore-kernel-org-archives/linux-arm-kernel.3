Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D1FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shIzA963Lo2lTTnLI/8ljoUTJ7M+v9ZtnKJNYj4HQfY=; b=NrgmCRJjW5mj+c4tfyNCU3Qrik
	ThsLIwdGKfFe8lrtgUZb51e2HCFotBXmlSf3vt3RPQ+7egHe9dzp0ORrYkZlMkjsOuUal799M9335
	FNF/eZK4aO9UfecqJMoiUt5KqL4X/CTwJ9Lq7Wq95YJ5Zki+JRRQZYuZXZY08/eqhhFvXVxu555Yf
	7vAwX3lALbTIqfJkG6/6UzPYCe3pSqNMVz8ii5NKy7nJ5p+7YDq3tzsHG72shz4rSp+q1d0djV/om
	30FdMWtLlaUMA2cWX97BwgOTwZyoB1+MrHgYeTtbPgqLHd0agbmXP29ni7yLGCsedSAlWIWUZtbtF
	qiefWzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wBZ-0000000E7aY-2yNp;
	Thu, 24 Apr 2025 13:00:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uWV-0000000Dofo-17wL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:13:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAdO9l013281;
	Thu, 24 Apr 2025 11:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shIzA963Lo2lTTnLI/8ljoUTJ7M+v9ZtnKJNYj4HQfY=; b=IbkZwFxp1DzvDhw9
	qSqhdzcFWQSTRuCs/83et+Vk2X8LVElMvJgJLoUsSuP3jsmo07ClU+tB2iARioz/
	vKtShp7SWnR7aNokWZuo09SnEdwlgSZUoRndqT/PeZ8VYaqZ5r4+q54mar672QX7
	J1g4YsUc09JF9AQWl52es6YpQSp22DzTuvAd+uTZelHg8uKCSl6b3FyqV26tI2ec
	xTWLD0E5IFSDVmP3X7vaqAoxGrr2EWqoQo7E26oYqwCa14xMMRqCk1TX0Hu9Gi33
	IkE8ARN6Qsma6OJnM1WVPrvxymP21FHJ4XieKoM8wUI2QX7oud0TeCLzumPLHNSL
	wzWV/g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2dc52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:13:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBDZZD027959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:13:35 GMT
Received: from [10.218.40.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 04:13:29 -0700
Message-ID: <8552c048-df45-49ba-83b3-5c39d4b770fe@quicinc.com>
Date: Thu, 24 Apr 2025 16:43:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
 <94a5f0d7-b152-4fe3-b312-a0f7792cc076@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <94a5f0d7-b152-4fe3-b312-a0f7792cc076@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QwcuLQ2fOdGA4MdtepztO8BSvrMGgiwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3NSBTYWx0ZWRfXya3lKDoAoTGA /HdZM624Sxdt4t86JF7wcClRguyIgulS5kO2DvAxGc0H7+nDO9fpYPkhk9wF+gzX9TwCG6kSBXg 6gGiUMKBXfkX/I5PyCsVbGnjjksALoAFcj704tWAx0XefDRDu9YO8NRuVnQ/qiwaDN/k5pg65ey
 y1z9vGvGdFU5qD+23GftZYLfZ2BAAudvmY0fbyepKT5bsabVEKbzYpXyE4F+Q1KjIeyuRfEVuwG 8iEdzsKXhqBA5IBuS4qg5tk/5q7TOiG4njDxOJlVVyYjougkRwKwsDWXLsVCpMRp4YaXjgFon+t kq0ftQjGdmkE1NklJQx0zdahF3cRaQqUzPkBEVJi9krE19ZPbwmraBM4tLuJXWpC4a6hE0VhqgR
 /hXLylcw12HTZwQnd57EheYEqy3YtTPHBeCu2hMuj5cKVagme0kUniVRHVL7dHRNGaCBglME
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a1ce0 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=N3UdhDyx_QaI1jzwTiwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QwcuLQ2fOdGA4MdtepztO8BSvrMGgiwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=973 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_041343_322977_D658D907 
X-CRM114-Status: GOOD (  11.94  )
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



On 4/24/2025 4:40 PM, Krzysztof Kozlowski wrote:
> On 24/04/2025 11:32, Taniya Das wrote:
>> Add support for multimedia clock controllers on Qualcomm QCS615 platform.
>> Update the defconfig to enable these clock controllers.
>>
>> Global clock controller support
>> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
>>
>> Changes in v8:
>> - Drop the properties which are already covered as part of gcc.yaml [Krzysztof]
>> - Drop the RB tag for dt-bindings for Camera clock controller.
> 
> Why?

It had comments, so wanted to share the latest RB-by.
> 
> Best regards,
> Krzysztof


