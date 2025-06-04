Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BB6C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 10:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJVGKhhOoBBMz6Lfc3F7j9n9ExT0noSInChv9O1rnkc=; b=E9lb9QthqU37n/SVUyko8kQA7P
	I244S/cLqtoMeM2jMsLEzL30GQ26n0q46udx56ZL426XhcB8rc3+QhilX8V3pkDhdplpMyEQHso74
	EeFsOssslAfcnxQSkFLYlRHzWg/iDURhFE3DXaM+Xk6emDSnftYmVFkjD+oGPtNx8rHL13ZSbgUVT
	OCtkHl4RndszlQFOobMnMBWXB7ZkHqyu6+nzsGBVHDjzqODMaufkzYRgqCWZvYNzp0AMpyNi/erLp
	5xzF1MO4g2iARnW5NyZCG7+EKXM5HyBREsUz+MLVz6VY1YSNTv2p5CBvRy6wpQEVQRzJHK8kmDaCe
	1zUsdkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlYW-0000000D95i-2m0a;
	Wed, 04 Jun 2025 10:41:12 +0000
Received: from mail-vi1eur05on20620.outbound.protection.outlook.com ([2a01:111:f403:2613::620] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlWQ-0000000D8xR-2qjU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 10:39:03 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JdEvLMCHhVTW5G18zJyuNfadM26d8OZxjX7UKSlhzjlrGjXhCnfm6XKtHNhpEM8B6K+RVwaw42KDhPZCfRgktsEaXchycFuXT6X0gHQF7REMQLqqvmlyYoAuWabdEHlctrLDrCUMAvc0PJHih0iMHCRYCVddGYCa1OLuiJKwf7ViWq4S5rsU/jaXFL4D4oGVMK8quGCJq+cYTnkkJw9QC+J7CpMWQwdonYrTfR8XGoJGDEdNm7bgdDnVK28iI+tRvxBK+08AwF3vhn724PLWejq6jsMO1wDtc/4Fv46OYAfpjco/MT9BAQzntPK1FmA88OmAlaCGPso+ZOqm2bHmWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJVGKhhOoBBMz6Lfc3F7j9n9ExT0noSInChv9O1rnkc=;
 b=UpmT20GyZ+T2T4xoXOtYOB29WifYVCd6LvbSgsf9yAFBPQvQXCf8j2NA1bnp73/EMLh/84uhh49TFXEWPnnsaPS1m5ArkFVOZOyeOLFCMhGsH8+CQYEA6s/tAFr+kyNtYYI6JGNEMUn40ifTelSM1P5tQHeavVjq9t7b3hHqMM2zLCMH3cBAAPTqGWa/Ykrjd8AFpWdFdCRnlzrWapqAnitWipPHX/YBwmufIsZHDBoV/BWRqAYZi8sGK1Uw1UV3Yd1ePni0gEyzwC8E2+By+M00PwNwka7j0tRvDRPYOzfRiwV8eKhEDNCCkeJlB0nZoBsLaiely8VYdPqiwx8nRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJVGKhhOoBBMz6Lfc3F7j9n9ExT0noSInChv9O1rnkc=;
 b=Ki2z953OViXoJaOsnVAwWSIoVsXGRJ2uKyPf9YH9cfQOR3f3wn3e0u5c/GLE+nhHxT+MobmPw84YGtOS3aWmgfRA2KpYCyD8p5aEOkyZVycv12cxdmYgJ+gYGAw0EIzGJVEZ71FOlOYczJsDUzhWennfVgisU18B346RFMqO5y4=
Received: from AS4P192CA0032.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::15)
 by DU0PR08MB8137.eurprd08.prod.outlook.com (2603:10a6:10:3ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 10:38:50 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::6a) by AS4P192CA0032.outlook.office365.com
 (2603:10a6:20b:658::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Wed,
 4 Jun 2025 10:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Wed, 4 Jun 2025 10:38:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2AqI1zRD8eT4NGFKOBn2QzQoS3hEtPTAYZ1ByuxrkEM5/24zKwi3BYmtks6I1+ZruTzcoAlYviRIOqOP+Y83NPB/+HvP5j5Y6LBpwrZDFXdmV9gKiYQZXesAdBuBJm6OcWUaJ2+sq+YcVFViyMrydk53+9aRn+NZkuJj3f4zgE7jEMTlKspIQKyvgCQsT45VxhLTYlBrRtDEwTGTLGjyxQOOEQ4LWhVVljvemEDasRLSN85HF1k1EAv3pAD7+hl9UCjnYo+pkH0JR8oKo5KHTLw8v1YxdYFha8puR91xl+/GDFlO1DSfkTyEF5UO1jinaD41TWk1vT3EQ8CGCu95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJVGKhhOoBBMz6Lfc3F7j9n9ExT0noSInChv9O1rnkc=;
 b=A+8/7cjJxaZ5fYNGtiktGVsnX3CdI/jnKL/5m/ZnSsMqOL4l3sqGBt4+zZD+8Vr5dNQ+zu60g0PJRUxr6nIh73mJIsvBdqSYJ2LXOVnI3xXidXv8qJAR/G4CQ6punvEG0lxo1CnHybxQdf9qqo26awCs18wRaTxKdb6tmdEQYVlVx68c5RURQ1htSPOzGgFWnhdz/prB5/cGmp842H/20QTHrNLdVF81xByZHyPdJNdOJ+k7TkRhh5g7T16P0PznQIvnz2TzGC/LcbJQiF2y9pLdsQTpsbRxubphRLd1hY+1ecaG3mWutY0ERc/UP5uYPM+moiZhorVKumgBXXeH+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJVGKhhOoBBMz6Lfc3F7j9n9ExT0noSInChv9O1rnkc=;
 b=Ki2z953OViXoJaOsnVAwWSIoVsXGRJ2uKyPf9YH9cfQOR3f3wn3e0u5c/GLE+nhHxT+MobmPw84YGtOS3aWmgfRA2KpYCyD8p5aEOkyZVycv12cxdmYgJ+gYGAw0EIzGJVEZ71FOlOYczJsDUzhWennfVgisU18B346RFMqO5y4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PR3PR08MB5690.eurprd08.prod.outlook.com (2603:10a6:102:86::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 10:38:15 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8792.033; Wed, 4 Jun 2025
 10:38:15 +0000
Message-ID: <92cc1bfb-ab7a-4abc-afd0-49f8f2d12da0@arm.com>
Date: Wed, 4 Jun 2025 16:08:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-2-dev.jain@arm.com>
 <912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com>
 <76afb4f3-79b5-4126-b408-614bb6202526@arm.com>
 <25c0c700-656c-4a8a-8ef1-5093581cf25c@redhat.com>
 <4f97491c-b0dd-406a-9ddb-4f4424571704@arm.com>
 <8c389ee5-f7a4-44f6-a0d6-cc01c3da4d91@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <8c389ee5-f7a4-44f6-a0d6-cc01c3da4d91@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB7120:EE_|PR3PR08MB5690:EE_|AM3PEPF0000A78F:EE_|DU0PR08MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: f8129009-d835-4eda-0902-08dda353fd45
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SUNyVXk4MWlzcWxQNS9Vd2xpREdpYkx6SG5YbnRxeUNQSmNpWm9SajVzTmZC?=
 =?utf-8?B?Y0xQdVIzYThheThFbVFyZk1ISzFYOG5iamtQL1dOdGUra0NDRlJVa3RiVjFN?=
 =?utf-8?B?YitjNmpKOFZIZ0RVNHE4MjRWSDBXMEVWYnRObUxhalBlZ2E5R2RUT21XL0pJ?=
 =?utf-8?B?L21DUFZvY09VM0NyV2VrQUtPbERnM2Q2QXFrT1FiUG9HZm8yYXV5cUQ2YnI0?=
 =?utf-8?B?S1hIbHM5UXkrOFpHelU4Z2ZJTVhTT0ppMnFxNVY2ZWNqaFVlOVBwaFNYK2dD?=
 =?utf-8?B?WkgrVmNzQk1pWVRiNFphb3dWWjRVY3JoSDR2OFlFdVk1b0ZOSndUNkxFOHRH?=
 =?utf-8?B?MldBUTRXR1RrNUVKaGFPMk1FbTFpSGRPSVhFa1JOV2xIa05PRUs1bkcwbGdr?=
 =?utf-8?B?UW1ENDlSWWhmMkRMVE5MaVpVZ2tqTU1LcmtwSENFM216U2FZZ0t5RTQ1eTd6?=
 =?utf-8?B?L25qTjFwb1FGbHNpdHNJbmRwQWVTNExzU1BEU29kTDVXZlRIR1ZiLzFzempx?=
 =?utf-8?B?YVpXL0VrMXFodjJkbTZNQm1ZbmdJeVloWCs4ejllS0pMc0xoa3U1NnBMNjlY?=
 =?utf-8?B?VlFyRElXMitmOGhMV2czbXVhcmtWbVB3dlYxOExpV3JUZHJyOEFTT0ZCL2ZL?=
 =?utf-8?B?bG9vakZYdG56U3NXMjRrRVZGSnFGVWRhVWtZMkc1aUEvb1hzZ1YxVkNpRUs0?=
 =?utf-8?B?Y1ZHSjhhNVRIYzlINGN5Um5ycHJRRHFQd0t5T2lyanMzN1Z1VTJRNTZKaGNx?=
 =?utf-8?B?Q3RNbmovSmRybEQ2VUp1d0d6aU1lWGtvRUNrY29CdDJxZ3RtQVlNblA4SmpO?=
 =?utf-8?B?TXN5TVNIdlZIK2E0My9vUWl0RmZTMmVBTkEzNmppMXp6RjJQTkJ6ZllucHdq?=
 =?utf-8?B?WDByMmZGMVMwblRtMHhHUU8yaEhWVXNPYWtPZ2tqK01rWldDSUk3ejdqTE5N?=
 =?utf-8?B?WXpwalROWlQ5bmMyV0xxNDZJSVZIanZlUmF6NHY2bHlGRjM1Vmd5R3AzNER5?=
 =?utf-8?B?Qm5PYjA4UTZoVGk4TEUzZWpwRDRVSGVTdEx6ZFI2Z2pGYXI3R3ZkSmpnN1Vo?=
 =?utf-8?B?Yi9wdzBlY2hpZStiSHZPcU5GMjRuQU1OZVc4OGVrNFNldUJRcmNEMCs4QXdR?=
 =?utf-8?B?alR0SWJNalo3WTJmZUFWbUtoQ0hlN2RzOXdwTFV3UDVwbGpGSlpnWDJMK0RU?=
 =?utf-8?B?SGU5U3RtUSs4OHFLc3p5cEUxSFVsSlhQd0NYZGhkYzJFVjQzMDFNdlpnaXkr?=
 =?utf-8?B?ZWZVNmcvdEQ1K3o1dm40bU5WK21sM3JoV2QxeUl1bmhmc25KaERDRGszbW5j?=
 =?utf-8?B?dWxGSGpaemxBOW92dld5OG10bDkrdDI0blIvTTdZWkZQcDMzV1B1dTJDTVdJ?=
 =?utf-8?B?UjBzMzZQZzBmRzcvYWoxRDluYlN0R1VINGRCa3h3dFNIWE4rcjF0Y08rNmY0?=
 =?utf-8?B?aGFocFQ1UVN0VWhpa29aVFVIdnJwUlpYQ2hSOFlCVTE3aGdFVHE5dkZUd2Iy?=
 =?utf-8?B?MnFiZzNtNnByd2d1SFVBc2l6NnFQdllJbEZpNXAvSUxLVUgyVjV1QjZ1KzNs?=
 =?utf-8?B?cGhYRzFmSytVZTh2cXMweTFCTGxzKzkzQnErdWdxTDgweTloRHhNbGs0K2tt?=
 =?utf-8?B?KzBUdWZ1UG13WkdhN3ArTzMydkVsL3BKQ2NpTnMwYVJyY3BjMUE0T3Rub3BZ?=
 =?utf-8?B?MndQOURxcW5rVk5VUmg3TmFrckdWUUE4aVhaY1UrK1h0SGZYREtRbDVMMzBx?=
 =?utf-8?B?N0NKcENmZEVXVkZwaExFTHNEcHlwUEVvemlFUGhWb0M4WTRTQ05MbWZRK20w?=
 =?utf-8?B?V1ZUZGwyUTloZ3Vaamp4aGNnaXlpbnVxaGJBNXNGWURhTnRvWjRVK0x6VmpF?=
 =?utf-8?B?cUJzSlRSbmVJT1o2bi8vMTVLcUNGbkVhNmxuWHN5RU1uMUQ1YkFSL2Q1WmlJ?=
 =?utf-8?Q?I6TTEGnJzZQ=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5690
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fe3c9fa5-3669-4f6f-f985-08dda353e925
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zmd3UEgza2tFM0xyYm0rY0NMWWEwM1o4bUkzZVZoeUtPN1NBZWgxWFZ4eTBo?=
 =?utf-8?B?QWlySkJ3SHIxdDhkdTZaRzI2WnlmSWRheXNFSUtQMzFsNTFzZmxFSTZQaUZT?=
 =?utf-8?B?NjdCNUZ0b2x0ZGp6K2toVlV3SlBMdjJrbXAwb0RKa0pUSHRlNFNLd0ZvWVo4?=
 =?utf-8?B?SEVkZU80ZFFYOFpLc0hIYTQrcnUxbnZvVXU1NDdibzluR2YydVo5YTRmNTNG?=
 =?utf-8?B?T1R3NTF5MEhGRVZsQUV1aUJzaDBONzhZWmFoVEV2UXhIbEd5NVhlRlRuTXpW?=
 =?utf-8?B?ckw0RFZRMTdqY0R6bWJ1Z2IrMEpVSG9LaS80U21uaEhZSnpsamlTbG12MDA0?=
 =?utf-8?B?RDh3cWU3Nkd5VVV4dkw0T3ZHS3N6QnBIVnNOUVlNdm83NXV4T2lVN00vdHg0?=
 =?utf-8?B?a2tocUR6WDlXQm9wSUx0cFlhdDlIaGEvbnFtMGhybDVUZGpVamhYWE9rQjBI?=
 =?utf-8?B?dWdvMGtWVFpRamlqS1luelVjRE0xYnJyZndMVmxCVUk1WitubHZKcEduQUJ6?=
 =?utf-8?B?VzR1SUZVT1kzcFBLejZHR0NUNUl3TGpXb2VkazJ1QUI0S2tQcW8vTmxHWXFo?=
 =?utf-8?B?ZHFnS08rakZHS0xZU3J6Z285SXgyemlESmR4Y09yYzZHcDJOZlhKMmJIUHNh?=
 =?utf-8?B?T2d1TkVma2g0WE0yVlVjOENlOUdCUDdGMXMrem1vRThoaEloMUxHbHFXVDBr?=
 =?utf-8?B?RUZ3V1Eyck5oN1Yrbi9GN25GYmhtYkl5aEROTFROVXQrV1RsMm9uSXg2Y2hv?=
 =?utf-8?B?a29TMXZ3QUdSQTRGRmFiVlRNdm5FVGpubDFUaitoM0xmMDZuV2VPYlFXVXRB?=
 =?utf-8?B?YmxLUzR6UHBWZzhhdVJGMkU5WHhBeDBNdC9HZ2JhaVJsUjJ3KzhGZXA2eUVZ?=
 =?utf-8?B?c29OYXlqdGJSMDZ3SEw0R0lJWWVpV0laRGlhckJ1RldJdXltTlRLdG5KWU1Y?=
 =?utf-8?B?VS9XeVZpNmpCRWt2YlVVd0ZuL0lmWllZZWZiWFlLY01pcXFnMnNZZjduYzdj?=
 =?utf-8?B?RnJpUWpwZWk0S0d0Q3k5b25FNWVLQWx0dVdFQkx6SlgxSTdsVHRBUXovQ1p1?=
 =?utf-8?B?cHFUR200THl4RUdhSUhJQ0EyK08veEl4SjF6TFZHbmh0cWxvZUpvNFBES1o3?=
 =?utf-8?B?TmJ6RWtBU0N6cnVQaUczZFRYaUJiTDFya0FaaUIzaTAwUWtURmlwRnJNU3VE?=
 =?utf-8?B?MGFhT2RnVXNyT0dTUzdZcThEdXFjZDg2c0dxS1g2Rm1BNDZiLzRrd3hJdkJr?=
 =?utf-8?B?Z01PdUpXUXVHMEpaUXhORVhHRHNyRWpHb1hrNmRDZUJIOXlBM2JhY3lGbDN3?=
 =?utf-8?B?UGcwVlhpUTFhZlVjaEw4dkV2NzhqSjREdVE4dVNrSFd2Y3NuU3dBMU85K1Y4?=
 =?utf-8?B?MFMrVWZuMDlMWjBqUUs4UVllOEdFQnAxc3pvTUtQSHJkV0RrK0NrSXI4L1cx?=
 =?utf-8?B?azlWaDVqUEJMR1daQkdTdFhwWlZpQThJbVErTFdSK2plejJPV3RiaWVzY0Yz?=
 =?utf-8?B?SlljWjQ1MEY4VmZMa29Qd3JnN3dWZFdSbG5ReVNWQWNaQWRYQ1RuZUE4eXV3?=
 =?utf-8?B?QzZ6cmQvbjlFckl2MFc3TVZxTWtwZ2k1QVFzSTA4RkhoclExWFJZd3ZrUzdQ?=
 =?utf-8?B?VlB4UkhEcDBQWDQ4dXZtMTFhcURYTmdFZUpFZFV3SzRzQlNKZkduWDByYkF3?=
 =?utf-8?B?Q3NhVDlnUWx2TjF1UFg3c2xBaGVRMHRPWW1WQWZuN1BIT1BYRWJjWWxjNEFk?=
 =?utf-8?B?bCs1VEc5QkhTUzhmTXZZRkZHdElweGNycS9neG16Q3lpQUdVR2xkSzROR3lz?=
 =?utf-8?B?RzhMV3pwNC9WTEdjYm13M1NaTnRrcndMSG8zSkQvSEpzZG1DRVcrVXh0Mll0?=
 =?utf-8?B?SlhzMHg5bGFpRTRwUzFiWTlGME5NTjlJb3pubURvNGJBVTF0VnoyOVBQUktB?=
 =?utf-8?B?WDVOSDgvQkJEUDFxUVBGYWVRamxLVWg5MDFFV2k5YVh4cjZwK1ZMMWxlVVM1?=
 =?utf-8?B?aWtEcUp4NTNIdzduRm1MRDJwRTRQRlAzTGYvSEs2UnVXWXJ3TGMyTFNDUEVh?=
 =?utf-8?Q?IFfyeM?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 10:38:48.2296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8129009-d835-4eda-0902-08dda353fd45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_033902_879713_C3C12E59 
X-CRM114-Status: GOOD (  13.59  )
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


On 22/05/25 9:48 pm, David Hildenbrand wrote:
> On 22.05.25 09:47, Dev Jain wrote:
>>
>> On 22/05/25 12:43 pm, David Hildenbrand wrote:
>>>
>>>>> ... likely with a better function name,
>>>>
>>>>
>>>> I want to be able to reuse the folio from vm_normal_folio(), and we 
>>>> also
>>>> need
>>>>
>>>> nr_ptes to know how much to skip, so if there is no objection in 
>>>> passing
>>>> int *nr_ptes,
>>>>
>>>> or struct folio **foliop to this new function, then I'll carry on with
>>>> your suggestion :)
>>>
>>> Can you quickly prototype what you have in mind and paste it here?
>>> Will make it easier :)
>>
>>
>> if (prot_numa)
>>
>>       func(vma, addr, oldpte, &nr);
>
> I'd probably return "nr_ptes" and return the folio using a &folio 
> instead.
>
> That way, you can easily extend the function to return the folio in 
> the patch where you really need it (not this patch IIUR :) )

Just confirming, you mean to return nr_ptes and get the folio by passing 
&folio, and the function parameter will be struct folio **foliop?

