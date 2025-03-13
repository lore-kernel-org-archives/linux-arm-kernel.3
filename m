Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF459C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86MvSXA9jZcVHxZx0v3xVpCRurz549Nknm9xWSSqvAk=; b=l9k43RiP3ULvZrCSPT46M7ehcR
	R7bbnpLEh1nxBlYXVszW2L5wgin1m2EynCkjLcfNB3x88bT1AIbNlMaH154sdN+6KgY3baiIb3wgA
	5aQ+IuMkxRFfsP8BZ+AWUD6nygvnmwRHIPQjJfy/z0Jsv1IiHKAuFF122WBUSqXmzID2zHN8paqom
	L63E1F8wXZWCUVuVc3551CiCKqM8BlfZDkoXHZZruyAHLwGtkyDtfUxl1naecs96go1jZBuG1VGBJ
	2Xof19S0q4v251XzPQe4RmQI0RAtGETuNy6hmNOYvgGetG1QYQRVGWHxtzFSZyFgaWIGAxfJOz9ww
	DMdK+87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseRC-0000000Adb0-1KKz;
	Thu, 13 Mar 2025 09:01:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseFc-0000000AbJY-25OA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:49:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CLZYBu016092;
	Thu, 13 Mar 2025 08:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86MvSXA9jZcVHxZx0v3xVpCRurz549Nknm9xWSSqvAk=; b=JBZyEVi7GKmC4V61
	KUMiK2eJZWlJ8ITGDEoCGeg2NP0cYcfLX2wJ4UAvVwbeaz+MQaZws2CdUexW8507
	BaDQczKfoZT3F1o1hTbkSy2btFwW3Oi+osekZsrA1RYkfiWhuM5Ad9bIwnLC0E40
	M47w0BkXh2tm45xL/p4FSVUbz/wibSeWOXL9KTcpSrROC3XqbLPIXl/27s1Srm++
	46VNdH+386kKEPlL1Fff5uguROei5EN1abNdM+UZ9iipdeHaG0dAU3DxmS6v5Qvd
	6CtmQztxD1TuscvxnfxWNduOZkZHsh8PlUTyEjcBZXwPPqu1OYS4sFy1AAAXfeTY
	Iy25mQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nw7cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 08:49:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D8n5fo027308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 08:49:05 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 01:49:00 -0700
Message-ID: <d1814cd9-5c73-4ac5-a4ed-4cc2aae410d0@quicinc.com>
Date: Thu, 13 Mar 2025 14:18:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] dt-bindings: clock: Add Qualcomm QCS615 Graphics
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-6-ebf4b9a5e916@quicinc.com>
 <20250313-graceful-jackdaw-of-opportunity-62996d@krzk-bin>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250313-graceful-jackdaw-of-opportunity-62996d@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 87Qxhu8_sjEn3ryZlgN4TUBUFHm73mo7
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d29c02 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=StMH6zsOQGyCnKe-h1UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 87Qxhu8_sjEn3ryZlgN4TUBUFHm73mo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_014912_544129_0C42B6C3 
X-CRM114-Status: GOOD (  12.55  )
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



On 3/13/2025 1:54 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 13, 2025 at 12:29:43PM +0530, Taniya Das wrote:
>  +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +  - '#power-domain-cells'
>> +
> 
> I don't get why this binding is different than others and you do not
> reference qcom,gcc.yaml? Is it not applicable here? Other gpucc do
> reference.
> 

Yes, I will fix them and resend.

> 
> Best regards,
> Krzysztof
> 


