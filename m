Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41272C36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XAoUUayoifpo55P//Cqrg5SgnVcz0v+hTrWQ+934mc=; b=HMyPq63Nl/SKnCpWkLjZN3INio
	y7N/76p9Pv+FR6USN5KzNUb6vC2rIAx55Qj0FrMY+51u2cjX6ea4pDuCqYDGEnPQYqZ0/saS0spJE
	LIe4XEFTW7HxqpTvsEcenmCtvA0gR45RdJgK4I33i+U4aUE/0IrALFVpcY+p+P5BSwtwIxOd6az9p
	VjQdnIB+2oHmZdOiuCiKR2jxIHm00rbZ+4ELP6620QGMez3ZUghKXmmUwvAoMWnu71iP+4DiN3MUR
	RBVjloIpdaamwYF5kkWcqvlPjsYtakm6ttWeg++UrbVLwobFTvikXF8IHqYg9fKb/3PPoF9W4Hus3
	Kxc4OgoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u08VD-00000007VGy-3Ixz;
	Thu, 03 Apr 2025 00:32:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u08TS-00000007VAX-11wW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 00:30:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532KDUZH010705;
	Thu, 3 Apr 2025 00:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1XAoUUayoifpo55P//Cqrg5SgnVcz0v+hTrWQ+934mc=; b=caQgEfccM3lZ3dQ5
	WiUl/fv42O8PHC//5U9tl32ChayLC25HVaiDHx1bXh6byd6Mc4trdPSiUwu8pqN5
	2ntNosVtTR4AE/bhnj/s1Jxm7GBdAsrNAWUKPBgJ+IdkUigkJO5YADkxCInAdjb9
	D9bpP4NPO+gjftC5I/LBl4rL+HKPrJ6sBjYU/opeAj3ed2BnflpZ1RDyqgj4Yr3t
	GGAWDnvqJvIaR6l4+TyNOQeQTVzaRjP5TwCM+bvn4G1EY+a3ueo9KbfZtNgO2CNJ
	hVNlcD71/6cM4NWzEX/OehKzJw8pSuzwu0U8yFoGTxItjv8UVSafpxPbIm90Gyp1
	W27rQg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc2yrdwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 00:30:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5330TwxS016430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Apr 2025 00:29:58 GMT
Received: from [10.133.33.117] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Apr 2025
 17:29:55 -0700
Message-ID: <1a496341-cb74-4636-a3dd-9644dee4fc36@quicinc.com>
Date: Thu, 3 Apr 2025 08:29:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 9/9] coresight: Consolidate clock enabling
To: Leo Yan <leo.yan@arm.com>
CC: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Anshuman
 Khandual <anshuman.khandual@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Rob Herring <robh@kernel.org>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
 <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
 <8a34b1ac-5681-4cd8-b960-a154d8678fa2@quicinc.com>
 <20250402090147.GF115840@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20250402090147.GF115840@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=AMoviu7M c=1 sm=1 tr=0 ts=67edd688 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ffThkBl6m3zit5QCpSIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yfsHR0kEGPzQucPIHdfVV8GGndp5T9Xh
X-Proofpoint-ORIG-GUID: yfsHR0kEGPzQucPIHdfVV8GGndp5T9Xh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_11,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=834 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_173026_420873_0A4B19B3 
X-CRM114-Status: GOOD (  25.51  )
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



On 4/2/2025 5:01 PM, Leo Yan wrote:
> Hi Jie,
> 
> [ + Rob ]
> 
> On Wed, Apr 02, 2025 at 08:55:51AM +0800, Jie Gan wrote:
> 
> [...]
> 
>>>>    {
>>>> -    struct clk *pclk = NULL;
>>>> +    WARN_ON(!pclk);
>>>>        if (!dev_is_amba(dev)) {
>>>> -        pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>>> -        if (IS_ERR(pclk))
>>>> -            pclk = devm_clk_get_enabled(dev, "apb");
>>>> +        *pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>>> +        if (IS_ERR(*pclk))
>>>> +            *pclk = devm_clk_get_enabled(dev, "apb");
>>>> +        if (IS_ERR(*pclk))
>>>> +            return PTR_ERR(*pclk);
>>>> +    } else {
>>>> +        /* Don't enable pclk for an AMBA device */
>>>> +        *pclk = NULL;
>>>
>>> Now the "apb" clock won't be enabled for amba devices. I'm assuming
>>> that's fine if the clock was always called "apb_pclk" for them, but the
>>> commit that added the new clock name didn't specify any special casing
>>> either.
>>>
>>> Can we have a comment that says it's deliberate? But the more I think
>>> about it the more I'm confused why CTCU needed a different clock name to
>>> be defined, when all the other Coresight devices use "apb_pclk".
>>
>> Hi James,
>>
>> The original clock-name for CTCU is apb_pclk, but the dt-binding maintainer
>> request me to change it to apb, that's why the clock name is different from
>> others.
>>
>> I am not why we need apb instead of apb_pclk in dt-binding. Maybe some rules
>> have changed for dt-binding requirement.
> 
> My conclusion is that if a device is an Arm Primecell peripheral, it
> should use the clock name "apb_pclk" (See the DT binding doc [1]).
> 
> CTCU is not an Arm Primecell peripheral, so it does not need to strictly
> follow up the clock naming for Primecell peripheral.
> 
> In Arm CoreSight framework, for code consistency, I would suggest
> using the clock naming "apb_pclk" for the APB clock for a newly added
> device that even it is not a Primecell peripheral.
> 
> (We don't need to make any change to the CTCU driver, as we need to
> remain compatible with existed DTB blobs).
> 
> Cc'ing Rob in case he has any suggestions.

Hi Leo,

Thanks for the explanation. I agree with you, we should use the 
"apb_pclk" for the APB clock for a newly added device.

Thanks,
Jie

> 
> Thanks,
> Leo
> 
> [1] Documentation/devicetree/bindings/arm/primecell.yaml


