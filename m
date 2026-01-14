Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5D8D29FE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=; b=WCGlPQEL/9uHxyDyEHh6PvCZMr
	Cx4D+LDIbkUuf0aEvq312sCoxh9fE/rD8bqYwtHdL+n9zqEYFNJitALvf0B5h4dMrlfGaMrL7WM2D
	J0ciVHjcBxLL7Pl95Q0j91L0xWgvDUzHAbA4SAMZHqn9fxylkt/zmjEBHAW5jRzKsMjMvxS0gImLF
	cQc+mlUUrm5gPIDepRvi9KaIpFj39qGrom7ujX+/KYFOLSaSPAcOdkI11aHIAuR7JMtRpbvbVJmoz
	exXZxXpwfHNK2cOyokXvPEA12F+SxHlnElWlFweoKJmKe7w9Bv/pdAi/5JE3tjkR1k20Auf4ie31i
	ygO6aP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyBD-00000008niG-3Fez;
	Wed, 14 Jan 2026 10:32:47 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyB9-00000008nfe-1YZk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:32:44 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EAGBug190844;
	Wed, 14 Jan 2026 11:31:33 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bne8knvsh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:31:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0uRbcfaBAxIMA0OxeQuOl2rdSmf1+j/sjwgOIiyulpNQgrSG/a/gyrtnfd06FhDWck/pvslz3+cpYrndMfmaFC13YR6lTG9Xf6eaukQC3nvD24K1a4wZsJ+rkjHNZPmnF745VXp6o/4AiXIgathzcaVzsrIzIvXP+e2BIBF3y5WEdUGZ/fFxQsFo0s/lJbbnVq7YPsT0ePGJSM6fJIvuc0pGDGOnPmFUEj0mTxlvZq3dFOibLv3jBLoFw2UQit4Us768pCsSmCLwxljzZ31FqhFdhD8rv4wir8dgy25dRs2EeHiN99eJNnjskG5Iq+3C/vZtnGc4Bf9aeL40qkswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=;
 b=tDKJUprAghUgi3OYm1Wm3cKSuUNaEgRWmObfVVZztvJhjGZPK7K1yklPlKeumSN4iPZWE4SUA1ouWYWJKmCRKfPJv/MPc85GHkHrts+I/QkKzZIMzaVvv+wegGe15s6f60xagWg1getPDSG5D3Izxe65ovyyqFOH5Qx7TXVBHO4z9k4VEWtPfelDw6wtUe66hjuokiiYGS7eMWHZy7gnSFkgjojQeTDs8fwWCQAVtJTmY1YTeFVgotbnSckp/IsgZQ2W3xsXGQmsQrUgEUnGh0vmePLiTdUK9nxnTSdLbUks0GTJ7q0ZSGk3//ntNsWrigy2O5biSImNAKoGBPWImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=;
 b=Iez5wOXfgOJA0dDiYEPSBGu2kpdaJif+OxtkPkoWJ9SfmOUYd1UCbYnwX4CMmU0s5SczY+q5YmHOH+qUt2mfDp659S2lKBs9JjzVJYqLS01tjj8Dkcsl2rLrYlN15mimqE5IPAf2+WAXMSWqz67jdjjT4MTnQtnqdnO/WmcxboZhjs2zF5jXdfT4qm/wfGNJ9vnCH565YxvjaBGnt4rSrspRTD0lOQ3Cb4eyLQCFQkr+DJx3CcUQkKyWP7r1u8zi4yjuEG0ajg3/9ji35KtH5DDA15l+R0iF6OZDL/YM5mZO0RrbA45JXeKEoZp87RyE1FwfN3cSXdlnIPWh/HcGIQ==
Received: from DU7P250CA0030.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::34)
 by DB8PR10MB3628.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 10:31:31 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::87) by DU7P250CA0030.outlook.office365.com
 (2603:10a6:10:54f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:31:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:32:47 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:31:30 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:24 +0100
Subject: [PATCH v2 10/11] arm: dts: stm32: enable CoreSight on the
 stm32mp135f-dk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-debug_bus-v2-10-5475c7841569@foss.st.com>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
In-Reply-To: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|DB8PR10MB3628:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd03850-2918-424c-dca0-08de53581527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d25vRlZvUmZUMjlUaWNrbDZnTUg5V0srM000RVRMZ1FZS1hTdTk2dWFZZExX?=
 =?utf-8?B?NkJtVFFWQUIxa2FGbUU4dCtkRnBlT2loRkhDb1hyUkNnMmhvem4zWmFGYUlw?=
 =?utf-8?B?dkxoNFJZSlh1WVRraFZNVm5xM282WHVqYjROTXdZSGo1SE1QRFhxdnpGeFU3?=
 =?utf-8?B?cFRhcHFzVWxncm1GVWMwVkZub2NzWGtWWFQ5Q0h6eG45bW54YUc5TUJYMmlK?=
 =?utf-8?B?OUc5N0dSaDFkWjgzYWxsdVRQWmlYUDZjUjNONVlodytNUUdpTVZEQWhwTWNN?=
 =?utf-8?B?M2xRaXVWRXQxeVgwRXpYa3hHb01DSzZ3Q3VEUkRaNWUrc1cvcUlGWGdwOWdI?=
 =?utf-8?B?NTFhdzFKK0xPOXZIWEZHOHdsMlhTMzNCUG5GOXlzQ0JwNW5qU29LMnFuS2s3?=
 =?utf-8?B?b0JxaGxMWmY1M2t1aHNGRWlDY3dJUFZkQlhzWUJERkZ5WWRCVksxbmhZYWRs?=
 =?utf-8?B?UnBkeW1Mc0p1L0ZIUXRTanRvTkVTNWZBdzB2LzJmTlBFNHZGcFkvN1B5QmZK?=
 =?utf-8?B?Q1VUM2pDVC82Qy9odURXV2pBVnY5Rk4zNlBad2ViNEo3NHlldXFFc1JEZEtM?=
 =?utf-8?B?cm9RY0RuTnVXbDVGcmNpSCtpT1VJRFNYSEp2NGVHbjQ2TWRKbDVoMFVxNTZy?=
 =?utf-8?B?c3dTZ1JjcWM5UXlUeHF3cndyMitValRrdFpxUC9DVG1QbEhOQTZjcktVNTAy?=
 =?utf-8?B?ZXU1bDA3eVJEcy83alBha05mM01MQ3VBTjB6bm5xNENVOEtDai9YRWtxZWdu?=
 =?utf-8?B?ZXFMVThEM1pEYjE1eVNUNiszT2dEQUUwS20wbUxZc0g5ZFpDMFVmdXVFNVFV?=
 =?utf-8?B?ckRGamIxTmxJOHpuaFh0WGtFMmx6bkhrb2JPNlkwakwzRDdpV3NmZDFCNWJE?=
 =?utf-8?B?Um1QMndFeE5ob0R2V2dPLzFCNWp6NFJEWldhMVNLOVhKb2dDeWNFN3hoNWpW?=
 =?utf-8?B?c0lzSnJndDRtenFxZnBUUC9Ddy9vM3hoaWZldjJ0c3NtK1lOSnQ0ZDZiZnlt?=
 =?utf-8?B?VDA0djAwbnQ0RVIrZ1hLaGJpZVRDVUZBQnpVRDRwSmhHVTQ5aHRxazV3T1JH?=
 =?utf-8?B?cG9pS0RxTUV4RitoNGNBSE5IbFhxMDZxd1ExNWl2a25ZNlFGK1BZTW1rNjlt?=
 =?utf-8?B?RlFxOW95NVFza2YvcFY3ZE9zTkpPVlNIdWR4cUQ1b0Vvbis5bmpNUDRMM1M0?=
 =?utf-8?B?MTl5STIzdW4vaTBqeU9PbEptK2tEQk0xZjRaelczS3ZQNzBIMUVmTVBjczI3?=
 =?utf-8?B?MHFlTGVjWG1xWTB0RGJ6ZldOUXc1MVN1TWpINEM5dHVzOXl6T0xQK3BOMVpV?=
 =?utf-8?B?SFJZaWFqaFdGMlhJVFZnV0VwQ1h2MVdaN3poZ2dmT2puNmQyQWpYclBwd2hw?=
 =?utf-8?B?aWJiVkxEdXEzZDY0ZTV5ajU5STdTcCtDK3VvQTd5Tlg5SHdldEwwbTZmZW13?=
 =?utf-8?B?ODhJR281ZHpDWklkYlRSZ2doSi85alBsRTNkVzRIc0M2Rk9YNCtkczRsQ0hk?=
 =?utf-8?B?VEpNWVNSL2RFT28vSDJKYnd6dTBLMzBVM3lKTE4rTHJ2T2RBN0dmOVB2WTl1?=
 =?utf-8?B?ZFFYeHJXaFZVQzdhdXArM0t0YXBFbCt3bUJrSTFVTWk2UzhaUE8xMUJwN3pt?=
 =?utf-8?B?dDhGbHFJbCtJK21vSGtmb0R6Qkk2S3hHbVdTVElBL0U0UTlIc3NoRGQyblE1?=
 =?utf-8?B?NHlsNi9DY3hza2NPVWZWdXhDckY3NlM0MXoycWxrQ3NWZUFhUEtjMDZHUFpm?=
 =?utf-8?B?c3E2Yzkxb1pkcHhXN0FpYjNqampzUCsrSElnWDhINnZiQ3c1TTBWNXZPRWsy?=
 =?utf-8?B?aGpGRzVIRlJ6MGZ4NWhNd0c4ZGY3S3NRSjFDQyszejFDV1VySGN0bUFuSDBY?=
 =?utf-8?B?YTBXK1RiR20rS2N1ODRuMEllWFBLREpvWVNNSFI1QjNKYkU3bWNXbHVxTjZB?=
 =?utf-8?B?SVZ1c3NYWGVRVkVxbiswWE95cXR4ZjlXamI4SWJZaXpPQjJ2eDIvd2Y3VE5j?=
 =?utf-8?B?WjFwWTBjWkh3UTV5UFJQc1g1QmszbkVIRUhzRnZVa1l4ajJxOXlFa1FKWCta?=
 =?utf-8?B?NFdxcFV5dVM0cGJuZXlIWkpIUXZwRWppODlXMzZMblJ1ZEt2K2JXbkNIWHpi?=
 =?utf-8?B?cTViSm1PUE1nSHlHVkRIK0ZzY1VTNzZrNUdkYm81WHFoOHNMSUxjNUVOVUI4?=
 =?utf-8?B?SVNJOHZsN1piQnhPMjdWdHp5VG9URndJcDBLY1A2UG1pbkRWaWs3NTdIVFZm?=
 =?utf-8?Q?fSAdmYsONm5CHk7nEGkzNm3yOPUktjtwYbJQEibC9c=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:31:30.9209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd03850-2918-424c-dca0-08de53581527
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3628
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfX5zndToIso6Su
 GWfU3QlzxFCUNdT+aP0bRDyY2XXmzvM9kMvPppYwEIaDSlT1kYT/NuJcvQO17VxU5IR5iQVDCFE
 pp/G/HVyjxoMSDPD1TXBV1AYFYvoLoUyKTRKY/Pb3u5RaBovc86PG3dnBNmLJM/n/veBGc0sHxJ
 s2tmiD7obBAsqHbR8pW9uo2f+MBvjuShFD7OAq3cxwk7hWuGIe8cCoKVsYM+J6/2uR4mTtPXkBc
 42hJRnClKtIxOMsMgtrAjK1HjttAgk0h+UaqRkBfXdNR+irRzz1gjlpZxllC3sdJc5JdO5nf0BN
 QgKMlXG9ML12GovpcA8D9thQuIFflPGQhkAxrnfhXlGan9VlrVprUGoLieWacVcJ3Y7vE2D/ZNz
 qLNboT1F0IPCmGwBUxVkA2OR3zfsOnUZmZ23a1MIfuuQK3FnJBXXnWVDRDWSmhk85E/tlqx27M8
 9TIyw+C9bFiTr472rKA==
X-Proofpoint-ORIG-GUID: VTcSnvIqysw49uvFrkA5rJTTkaFhp6Xm
X-Proofpoint-GUID: VTcSnvIqysw49uvFrkA5rJTTkaFhp6Xm
X-Authority-Analysis: v=2.4 cv=BpGQAIX5 c=1 sm=1 tr=0 ts=69677085 cx=c_pps
 a=XUICzFq2jMvQ1xz5VZc7ew==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=134C2J0RlIERMqBQ30UA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_023243_699481_561200B7 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

Enable CoreSight peripherals on the stm32mp135f-dk board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index ebc719797271..2ce38e46c6d0 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -174,6 +174,26 @@ &cryp {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0


