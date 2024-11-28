Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146D3D690E8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFSpMM/1LZHGjcfYNl5o7E5Lgs4vzBhEEiU4tRaP+Yw=; b=r0oYJT8LJEy/qGIZaFAFR/Im8V
	lCP5HTFNc6TNXWbHLnLWRM2+yg2smav2hlHUiaMoouDIVN7JlYWspsXJXnDeclb5G61OcRTRL7vre
	RgvH5e45ppMRtfFoTqsfhW8ZmOl4CDEgc3+AXPWcxdqm0M3npAJF9niP43+NmDu4dRV1Mx3CMANWC
	cNK10ulbvn1vmc2AXSSNUJkh72nl+oPmdXu20gDceoHh2Vq3aVnIIPq4sXsexbNQwcqWt995y/qlc
	9/oNahyPRlV6SOmrb4LKOZ8oh/P9Yut9jPRkBpA+uUOdShqpFvRwj+ppAxukSVq/69s/h8wM359Mb
	rrmAeKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZtW-0000000F0Ot-0yKh;
	Thu, 28 Nov 2024 08:29:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZrf-0000000F00d-48Mf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 08:27:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGQaCw028888;
	Thu, 28 Nov 2024 08:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFSpMM/1LZHGjcfYNl5o7E5Lgs4vzBhEEiU4tRaP+Yw=; b=ReHHuzBioMEX3OBI
	OeFmjRGSQLFlMUt3EBxpuOs4BLcabEuC1YJHnT9NVHt1yQnndP0ikWDeQde1YBza
	a8kZ5vhQPBg6op63YBb8AuEmnZwnnKP4B4Lg7Lakv6PAxGzUJCbdE3SZsItDKzuY
	BHXyuvGRzU89DJGxQDSJ0yr3IrpbOJbPV33Wnn/Y6PxbcEU9WV8Rl0gDRUKRtO3+
	Sz/Aih4cYOQkQFc7GHwtyizxgezYdX04JRVYqyiBXBoAKmlpnWoAZsnbl4XRNi09
	oQXKaeHIzlUe28+sQ9zsDjYTpE8AAXAt3WJUlLvyoQp8G95RNoL/KfA7dfUjXWrw
	x4neMw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xxhvf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:26:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS8Qw5b012341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:26:58 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 00:26:54 -0800
Message-ID: <c73dfff4-2945-401c-a292-9225a6bd415b@quicinc.com>
Date: Thu, 28 Nov 2024 16:26:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add initial support for QCS8300 SoC and QCS8300
 RIDE board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, Zhenhua Huang <quic_zhenhuah@quicinc.com>,
        Xin Liu
	<quic_liuxin@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>,
        "Tingguo
 Cheng" <quic_tingguoc@quicinc.com>,
        Raviteja Laggyshetty
	<quic_rlaggysh@quicinc.com>
References: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
 <5a4a80e7-b6dc-4c01-a16d-ed8ea1aefe44@kernel.org>
 <766219f6-a535-4eaa-b1cc-768e0522d71c@kernel.org>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <766219f6-a535-4eaa-b1cc-768e0522d71c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iA9UYIi4wpziYCCT4S4fx7PYBmaNVJti
X-Proofpoint-ORIG-GUID: iA9UYIi4wpziYCCT4S4fx7PYBmaNVJti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_002708_158970_7AACC61D 
X-CRM114-Status: GOOD (  12.24  )
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



On 11/27/2024 5:40 PM, Krzysztof Kozlowski wrote:
> On 25/09/2024 16:01, Krzysztof Kozlowski wrote:
>> On 25/09/2024 12:43, Jingyi Wang wrote:
>>> Introduce the Device Tree for the QCS8300 platform.
>>>
>>> Features added and enabled:
>>> - CPUs with PSCI idle states
>>> - Interrupt-controller with PDC wakeup support
>>> - Timers, TCSR Clock Controllers
>>> - Reserved Shared memory
>>> - GCC and RPMHCC
>>> - TLMM
>>> - Interconnect
>>> - QuP with uart
>>> - SMMU
>>> - QFPROM
>>> - Rpmhpd power controller
>>> - UFS
>>> - Inter-Processor Communication Controller
>>> - SRAM
>>> - Remoteprocs including ADSP,CDSP and GPDSP
>>> - BWMONs
>>>
>>> binding dependencies:
>>> - remoteproc: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com/
>>> - ufs-phy: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com/
>>> - ufs-controller: https://lore.kernel.org/all/20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com/ - Reviewed
>>> - smmu: https://lore.kernel.org/all/20240911-qcs8300_smmu_binding-v2-1-f53dd9c047ba@quicinc.com/ - Applied
>>> - ipcc: https://lore.kernel.org/all/20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com/ - Applied
>>> - qfprom: https://lore.kernel.org/all/20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com/ - Reviewed
>>> - tcsr: https://lore.kernel.org/all/20240911-qcs8300_tcsr_binding-v2-1-66eb5336b8d1@quicinc.com/ - Reviewed
>>> - rmphpd: https://lore.kernel.org/all/20240920-add_qcs8300_powerdomains_driver_support-v1-1-96a2a08841da@quicinc.com/ - Reviewed
>>> - bwmon: https://lore.kernel.org/all/20240925-qcs8300_bwmon_binding-v1-1-a7bfd94b2854@quicinc.com/ - Reviewed
>>> - others: https://lore.kernel.org/all/20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com/ - Reviewed
>>
> This submission has bugs and instead of fixing it, some other people are
> sending already patches on top.
> 
> No, fix this patchset instead.
> 
> Best regards,
> Krzysztof
> 
Had an internal discussion with Cong Zhang, will combine the fixup in the
following up series.

Thanks,
Jingyi


