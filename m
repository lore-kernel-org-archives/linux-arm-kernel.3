Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B4DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXUEAjZIQHV+sl5xhm/8lBsvOWsmaJOkObjxV8G1Q8w=; b=JkC+qINvIrjRIsQzC7ngJ8mFuU
	qLUKWsyarrwPqhqDAqiw/np1z4jznzwDh9FU3OQAd4BPdbmL5d7Xlm39qo6LSiSpLDB0ENd/MrQxP
	g52qqTQYwHGC4CbNuSfj+duSLcIALWBRGafdmhkPIjK5BoqJsUhGVdmDTm/gDkQkG6lUEmyiueh0e
	bXGmoh5aLnQjjYqMGek3MK5XY0UMV3hEkRP2DqghMKBaX6/Rzwux89YZJGEBYw63IzLCkyWIoL56E
	cOMq8cT8EXqZEnbQn1FgUfBcMjNbnPHyoZzaiRlODUYRwKsnyv5W4Kyz3/PtkKB8U5kMjGPF5wujx
	d/aLv42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnlg-0000000EFS1-2qtv;
	Tue, 11 Aug 2026 14:47:52 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnld-0000000EFR9-191f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:47:50 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67BDWcTf2111195;
	Tue, 11 Aug 2026 09:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=IXUEAjZIQHV+sl5xhm/8lBsvOWsmaJOkObjxV8G1Q
	8w=; b=MWpLdFKhh1gMhWZ2KwEVJZkzvCMe9o0tzbTNrx0p/HrVt4QNdLPrwzCgK
	Ot7gPxHNlKnUs++xpRPXcE7JpSXyqqIGYzgTlADfZcpBGnhfWHGQaEAGGZJpG+aV
	0Z+40p2fbbl2wYJOveJCuAGnd/Q/VZqRBjHQqYJuPQC18ooeD9zgKaYe96I23ChD
	32X4Tyr+Vq9YavhRlDwacdbrAdrHGFN+UQLxUG0FH4uTzPh1KBbJGe+z2BSlRn4i
	oXzCCdzM1b9B5ql23qDo3jfM+QRpmIBQHahRVR7q8I3OOFD90LaugRavWxzHwwP3
	HwAMD9PhneJDepb8fC6/EPk2DfcaA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g00wu1w50-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 09:47:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prna+nfU1ja9c39KgFdZ8x3/BZbDUFZVg40KfL8vjUmEquec+dQaNsdDblcUDFwX5to3RTV2+UaHOOFx3G7s/vbY8d3xKH6f9OYbBnLagzNLuHlA5v9MkbKoNwd6EmqBsgRLH03JHaw6e7xBsnwHDT9J/z9ekQrrz4jydgW4jIqirfRqOgx+TvGHauSkOrvnmQ40GAHgqgkoTcuoo3bXPMQlx8GUruLb/HDAgc1kbOpC9tn7rhVW2fLoVMfBOD2IQtyJSWA1WMxdaAQ/vn6XLzwgdTV6yefrw5tyLpvevvqnwAdVQ2KikXqPeVR/1wAzB8fYgycuZwNIOVvF+9pWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXUEAjZIQHV+sl5xhm/8lBsvOWsmaJOkObjxV8G1Q8w=;
 b=xj2nBxzeEiO/p3Ye5C7jIIug/mJVQvFVQI16RL+9e3rDt3Bee1/4x63WuW7RvtBoaFadhovESKfL2L8HXj30oOlMj1h65BxqGS1B8I7uwJ5uOTRaox+BD0OXRbtgEorv2qn7Sf+jzjcDI/CUnBhkIKbQcJZtjl3O/Jk4/k7I3aFqJXnUNquU5aGW5MW0JFg5uXvKbUjxWR0qz1+CRWTAObJ3mWwHsESL3EEUuvfUBsRErS3Nn5ieGsq4Cyrj8MKu5PzIvsvJr1Kf7XOQWdeO/4sitwPYxJwB0GXRzuQwRGVnE0bYQmjeaLVLY/+siuW7CXWRD4wZe2aJshjzXZNYOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXUEAjZIQHV+sl5xhm/8lBsvOWsmaJOkObjxV8G1Q8w=;
 b=MIssqAV6ffgczClcrOFRmxklIP87wByaWI5f28bCW2pCRxW8VzQK/nR+crVeDKJCu36n6hnVbi8ZAVg49FYQ6E/OU8gNMgbOjZb4xw7EVv9MCtR14zfZPDuF6wGhdNSN3qtDWZOtSqt5ns8U25ag/67Lervpdn9gzYWU95BBfIo=
Received: from SJ0PR03CA0069.namprd03.prod.outlook.com (2603:10b6:a03:331::14)
 by BN0PR10MB4853.namprd10.prod.outlook.com (2603:10b6:408:115::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 14:47:32 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::a9) by SJ0PR03CA0069.outlook.office365.com
 (2603:10b6:a03:331::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 14:47:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 14:47:31 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 09:47:29 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 09:47:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 09:47:29 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BElSXv1366132;
	Tue, 11 Aug 2026 09:47:28 -0500
Message-ID: <265d3c78-c7ae-4d0f-b6c0-5f9500121d86@ti.com>
Date: Tue, 11 Aug 2026 09:47:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Add SRAM Nodes for VPU
To: Brandon Brnich <b-brnich@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260810205206.685971-1-b-brnich@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260810205206.685971-1-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|BN0PR10MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: b9928445-4745-4a86-0b1c-08def7b77921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|13003099007|18002099003|22082099003|921020|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: gg4dfJP5koqmiJyoH2tY9oyzVDAXiounhEa9q2r46Zan1Uur50G2QTux0vxyrUBkJ5UjqhjSz8zyF7VIQ7UzMilWtzmhaGg9oVBdz31FpEvpH6LYRtx2823g+rArJSRZCkBWbP3BhXwYa+Q6Ww6vvsw801dbGubtrWSbZ63gCg7cPCEEYRjnvhFIyGbu13HpACz/8ODP+Pr89U5HWxSR8mHgCcsuf0Gs+cynUUz4toa83JalZvzohFjvbDtv4oi23pi+MVYEPrJ52Gp/dMY1dvZI1y7jbde9jeklwjaZytQn0Hv7kgX+eRmrd3p2H8JR+3CTesUjNbyzn771oQTmJ8UDtIgkVQ5rr2tEfww0P5NrjRMY6ngG5cPc0d+7R99TNa0JfANuWtaGYOMSIavn1uOB4lgyTQZaX2/PB718kaCIlXbXfFgMFpNkoGJ88l4YyohCfZCUBtrKoe8ApGfQnb9h1EwpEtmymUTvZ0JfD0domed2IR29XybKmkzRk3amXjgfwFbkjHkLX0KcfMKYL9Ibn4M1untzvzy23Z3rtxBnS/OAZYD//ZQtITpDJ9GEP+gCB8Leh2B2Lsc2YXZNx+M2LPY8y/Zk166kXqTP/M07mUWMS0fevnnLy5uXNm3zIggI3BawJG9S49DS8smueLs82Y1HGwyhI0Um4jHknTSPIDLP7HhgfhLv0HfYXjZbXGdddQPCyPj2hxCt5VnQB6d6XT5cQw2uu4ezp46KcJBQqIAAQq9QWeP0FhXGy2Nx
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(13003099007)(18002099003)(22082099003)(921020)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0FWggLDAlsEquO2Mgw8sP1SYYMfx538ZsNr19WwJR8K/SjjddhiIS8yfgRdFfMc06D1ZcVz5pZ2bCnNy3hXvzkqQAUkNZwAs/FaQT84fC4LvUp/gG5gPGXrmydkbQFdMhfSfkv/V3CVEWu4uspoyteSKiWRj7pQLWeUJ7Fkamqm/qO12rtE5z35GOVFyZNILI4dJy0NV+TZLxkP65rcQ3JfijShnPmMVDdZVSHpVYfKj/XCPOwLs1C3CCow8Ar50ZCb7kf0kjczMWg9Hx6BA0rRtjHuB8+jXj3nNtVSrW4Nc/utZFvmjUPWTL8z1Axj2KYXX4b86W0aOJ8XAqJUnsDja2zqtyezZdZ1Qpt3Y7XNWaBKvfYEhLZYnES/4sMc1WEUXHV8FxaCXcidQmOwzPg0vKdfLaTJXSt9UG2WL/U5ZOEBcKRp6yTaCMJuZ+UUG
X-Exchange-RoutingPolicyChecked: gBWHaQojbVekyUT5CLy9j1DYfpR3SXrGq+K1QkmDvCufvxaPaqD1tTMTh96ywfk8xXmDZr5RMPGt82pCPJX7poLnjy/WabwsutAiBN9q+REv8p8uNOofkxJvUIjnTU/+xYLoX+O/0CJTMd8TR0H63dQU08q38q7mJk2mdBfG/k8D+Yg9eaYH6SeWxK7URAJsDLZEMjb2/uQLHrNrkjTtJ8hXiaV06BqKPH80RxLb6RPyBm/yrCoM6un32aB7FamIw4fOlKCD4M+TNtlJWL+jUXlk2PsYNEDwGid8wEJ/Uyewwi9sxnpYvHfrY/KQnEPIf9OBrIAfL9eWlIvsLwSyKg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:47:31.5216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9928445-4745-4a86-0b1c-08def7b77921
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4853
X-Authority-Analysis: v=2.4 cv=M+V97Sws c=1 sm=1 tr=0 ts=6a7b3609 cx=c_pps
 a=OmH7RzXgq2BZ7BLjxN5ZDg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=LmidpCQ9ei3Tofd3yhMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9_N8RDUeSJ5pif6ebIetViAeuAFrFzdU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyMyBTYWx0ZWRfX8cu+Dut31MjJ
 q6C4galNzVF09FPaB1xA0COb58lhFfSHmHMsc8FsB9z9maEIDkX4bHYW3JeCpS0JPYcfcNsg1vf
 2vA3Xj/ksnosfymYMdtQYFhE/Iw/5W0=
X-Proofpoint-GUID: 9_N8RDUeSJ5pif6ebIetViAeuAFrFzdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyMyBTYWx0ZWRfX3bO/CQR9MBUw
 UN+9Lp+SNswvjhbBUctfsdQhd6wJCMJ+a1+Wpzn7E/bdgIOlUyJC+rJXzO0pdv1TPFdNdxREE1v
 geVnb/QLAaF2HjShYxREq9nyHjX5V6UM2qkqNl2GSfSE+a7l9USthSGJK+WfUAGDJYCnxf2xaax
 /EGX0pR7xbHKzgYPVoudrwkAYpiuqUyv00xeq8ZTygB1oaKekJVeQ0+JSDFr/9G0w0W0eCTffAU
 u+kpLawvkuLh6TPYOkwil2Y5QM8jqdPkGoTxoZ8W1x8w3MAQ2aDq5XynWkktPOl9MVIDMZOKCMd
 fdlPtZjHeIUbHu09e8iSLXNQr1Kqwk2dkllDzXV3tCjWiZo9dSfqQFo/skjnbYTste3Wys6C/KO
 o3+aKzDDxWVzTvVVm0aun89XEooNR7If2xop3BQswVD9YkeB4sz/RxRdVf5FYnPdNyFR/OxPN18
 qo6wWZ11AU8/oR9/YVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_074749_321340_6C645BDE 
X-CRM114-Status: GOOD (  15.57  )
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

On 8/10/26 3:52 PM, Brandon Brnich wrote:
> Hello All,
> 
> This series is responsible for adding the SRAM nodes for the Wave5 VPU
> to use. The first 2 patches are responsible for carving out the SRAM
> pool from main_navss that the VPU will then reference in patches 3 and
> 4. The last 2 patches use the existing oc_sram pool already found in the
> relevant device trees.
> 
> v2 properly updates the nodename in the first two patches to pass
> dtbs_check. I have talked with Andrew offline and he has said I can keep
> his reviewed-by on the first 4 patches based on v1[0].
> 

The two new patches for the Sitara platforms also look good, so for the
whole series,

Acked-by: Andrew Davis <afd@ti.com>

> Best,
> Brandon
> 
> [0]: https://lore.kernel.org/all/7d8582bc-e88d-40a7-be39-57045fa4c010@ti.com/
> 
> Brandon Brnich (6):
>    arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to main_navss
>    arm64: dts: ti: k3-j784s4-j742s2-main-common: Add mmio-sram node to
>      main_navss
>    arm64: dts: ti: k3-j721s2-main: Assign SRAM to VPU node
>    arm64: dts: ti: k3-j784s4-j742s2-main-common: Assign SRAM to VPU nodes
>    arm64: dts: ti: k3-am62a-main: Assign SRAM to VPU node
>    arm64: dts: ti: k3-am62p-j722s-common-main: Assign SRAM to VPU node
> 
>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              |  1 +
>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi |  1 +
>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi             |  9 +++++++++
>   .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi      | 10 ++++++++++
>   4 files changed, 21 insertions(+)
> 


