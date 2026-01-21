Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9CDC44521
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+qQruqp/r8Hzekq2l/RZFNMp6cVsCEBVM5HG63tx6Y=; b=HJoUJRO1jGK97ScTsnsdG33/Si
	joxMiLM878bxw9mFSSlMOx05jyozD/ZLPJy5dFiXyOXwEl8d05ACQGsEIBTQrdwttU9xUPCt8iCHG
	wcPa2rOb0gRjfEpggTsvN9R7POmyKljXzqPJDqjcPTWeTIMgvfYFxirTbGAp1Tly74+d+8TqJFyMz
	hZl1pGk9sgBHY0uUZgvi1WHlW2CBUv18fHzuQ9YHlXgesZA9wTM/beUSJHnhSiyHvaX1FXXcVL+Tj
	mDd1+V5XQp6fGNEx4KxTPL6rdkiE6cbgO6htyo5DjqtvjZZk1POiLhl77SNJvwepAZX3vCAlAYjV3
	HYpZ0a3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXRB-00000005QaY-44fq;
	Wed, 21 Jan 2026 12:35:53 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXR9-00000005QZ0-12WE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 12:35:53 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCRhSW1991221;
	Wed, 21 Jan 2026 13:35:38 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010004.outbound.protection.outlook.com [52.101.84.4])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btcn4ukq5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 13:35:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpEK1E0SPS95t17ns6HY7at5lJDqz4oiV6FL4S4YEyKbnnunck98VNXAXYpNfSfB+BbtjS59pem1cWCoZitNRjWkaS48A25nZX/RfasueeEy8fhEaMXxseAJXraht+Ds3Mc9+hDOBcSe/tDfdhGekkAKXoMcrj/yqa4HXm56bvXq7PNw8Mlj5/WwkhviGMt2/EbVQxFOFYXt6xGu4jzsJIrutHKOZcppRKVENB4Yq4UkvVds0PJz5TD1kywpnPWlPUtT1HRhpYr237SCBeqY8wNH88igsmJcoMiAQmA5VqKtXjVXSElPeYpGtHg+bqXDXVf4Yvy64H6zm53DDrUCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+qQruqp/r8Hzekq2l/RZFNMp6cVsCEBVM5HG63tx6Y=;
 b=bd3tY6N46mhrepxhIE97GCrz4oCRN9MtfXe71HgJoikb2aHAa5yQK5hbEIDoeXfQKFmOI1f3AvssjYRSr25q5W82nvz9uAWMFc/wxEvmtGjUX4VaEzmJHQs9YcXaYBxz9KMjzUaEQUumMtw7J7hjJZ424dM0eks8r3MooU/2sOfKoUbahqTgdETngOftyBzwLbBG4Mg+HEHjR/QEGfYD9xOg8JfkP9SB1LUQFb6ec16vtigeD/bTC4yS4qHa5uwOFLLYTOBI1wJRLspM2IBi2aL+VXGQeNP0u96rKa+5ENnLd8SDO0enGZ3lt6d/vkiuyg5BGnnYgzdG7GjC+egRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+qQruqp/r8Hzekq2l/RZFNMp6cVsCEBVM5HG63tx6Y=;
 b=QkodBLSvdDX2qdt/7IZrb4HCKn94BJix9sW3fvO8HszwlJnd1M638816Qt9jQRLMdL7ZG5O9tLQpovrgXU3n1m412uqyDnNo5/pDAo4GMkGiVpEdSPusfgKowJHiEAufRfneWSzaIWDw3rMefZqDwElTHhp2t6UXuILjDVIFFxXirEaXHHXgYPKm1dyNvSuPfC35rJ3Z1A2Pdt/8thJClA2+SLoww84Ly/SnnGSfhvrw8WdzwQ3r0YmkVRmYh8Eb8rzfUnBacgyjCsAJxOFGX17PdSJ+Dm7iM73C85IjiauYVZZNufSl/KE1itX4Myv00n3zizoWoFnqmQ69JHbwvA==
Received: from CWLP123CA0125.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::17)
 by GVXPR10MB8987.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:35:33 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:401:87:cafe::b7) by CWLP123CA0125.outlook.office365.com
 (2603:10a6:401:87::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 12:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:35:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:37:02 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:35:32 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:39 +0100
Subject: [PATCH v3 05/12] bus: stm32_firewall: add
 stm32_firewall_get_grant_all_access() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260121-debug_bus-v3-5-4d32451180d0@foss.st.com>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
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
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004C:EE_|GVXPR10MB8987:EE_
X-MS-Office365-Filtering-Correlation-Id: b45dada2-6e49-4032-c10c-08de58e991e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3lkbEFQQTIxZmo1RE1Nc0UycERUMVFPaGM2SExnWERWYUlFaEtDZlF4RHVK?=
 =?utf-8?B?dGE4TjRnYW9sWHBrYmRWSWE0bFhQL1g1VGJQN0pRMlRjTXo2UXQrT1lPeGpv?=
 =?utf-8?B?MllHUkljb1cwQmdvV2JkNVF2Nng5anBEU2laNDZtVHRJWWNhVGU1Ry95a01C?=
 =?utf-8?B?cHlFeVZvQkduaGNwSVNENmtyTkpPRlpRd01SWDFMVnV1QVBXcjNJa0E5U2RU?=
 =?utf-8?B?d0REbnhuMFBKZ2RvTUgxNzRvTDBZTUduZ2VhSTJVUlIzd3Yya25GMDFISmQ4?=
 =?utf-8?B?TFQzYkk3UjFmeGNRQmMyMW1BK1pyNlZKQ2crZUNoOWFCemFvbjFMbFQwd0p2?=
 =?utf-8?B?UHRKaHZWYk5KcEd5aXNVZXdGRGd6eUM5c0xMV1ZhSmpQU3YvQ1pkenVRSm90?=
 =?utf-8?B?WkRoMnhwS0lteVZnK25MV0VTRktXVlR6WXNWczgzQ0tRZUUzOHpEZTVnOGto?=
 =?utf-8?B?UnBFVjEzVitVeHR1NXpab0c4UDZIbGlQeTlqUWVCSzRmaHVFWDJYNHFxV3R0?=
 =?utf-8?B?V0dXZWRjUjZJRXNVY0t0d3ZaVzJxRlJkOWNhdEpaZysyb2kvTWdYNS9COU51?=
 =?utf-8?B?UTEyTFB5c3F3VVRCR2ZVT0dYRm5kbjdCM3ZUWVRnSHBXL0ptb0cveG96V2lB?=
 =?utf-8?B?M3Fwd3d4KzFQVjVKYk5vVmdwbGJjekgwS1ZFbVRQaUcyNW1ZWEFNMTE2a1E5?=
 =?utf-8?B?WTNqRUh3a1BVTmgreEp5K3JtOEdabU5ya0NvL3FHQmhteStPUXVLUE56VXBF?=
 =?utf-8?B?K0F1SEl1bUllNWJ0YXc0TTA3aTBoaUhLb2g3emQzT3U2c2djVUxZWXkvSVpW?=
 =?utf-8?B?bktsMFVRR1VZU29XZFppTVpUajdpMmczc2lzbWM4YXpQa3Ywd053QklheVUy?=
 =?utf-8?B?N3g2cEZmb2lyOG1GYmV4R09zdDNlNEVCOGtrUkUxOVNRSEI0YmlCYnhCdlY0?=
 =?utf-8?B?VDBqSEVWTTN4OXluaXloTDdRK2lIL01TVUFRQkhwaXFpby9zeUczK2JKVlEw?=
 =?utf-8?B?YjRHVjYwZnJUYlF5dXNPTjJzbmtZcU56SENuejRUbmFPVkVsSkwwc2R0TE4z?=
 =?utf-8?B?QnlPNlB2UlBJajVWV2ZWdkNMVUI2eTgwMUg1WkNCbVl3VjFZQzRvWFEwamkz?=
 =?utf-8?B?ak1IRmJTbk5iTWNXNGc1OVNUc1FhRk8rWVVKUmdBcXFESGxPaUs0ZkhyMWVB?=
 =?utf-8?B?VXRNeHVkTVIvRHh6MkczVDZReDdNOWhvTkQ4QnNNbkw3SW1qK0Y0NlVLNW83?=
 =?utf-8?B?SzhCTVZpQzNwVUJSS3M3LzFVNkVRU2hGR1hhcjczOXNNNlVoRVVZZlJVRERW?=
 =?utf-8?B?YjJCREtNRStEb1k4QVAwVi85V1BuOC9WcTBjSkEvZmJ0QU1vUElOL1J2d0pz?=
 =?utf-8?B?TTV3QVQvUkJJZ3lkQXZ0bUl6bHZ6VW5aMGI5YktVeTMrSkVrTTRUdnRyVnRQ?=
 =?utf-8?B?dXllc0pUS3BocW1MQWdlSmNCUStDU285MWlDeGtJTHV5VDhDTGZ0ZURFTVhk?=
 =?utf-8?B?dktiSk0vdklTSS9HRnpZWVI3WGJzV0RqRi9qcHh6ZS9XR3d4ckpFNmNxTEZP?=
 =?utf-8?B?VGpIWDRveFJEeUxXeVRjTnB4bEpiWUFHaWZCTm0vdnNnZVArc2lXdVkrYWVj?=
 =?utf-8?B?N042cDZ5TFpMOGdqbkN5WG9pSjJlajdBbEtXK29TN0FoSDVrdXBaUS9LdXEw?=
 =?utf-8?B?UjZac2txSkI3aTRUdUVFMUcvdDJwUEkyaEJlVk0zRWx6NjRpeWNxYmVNRm9M?=
 =?utf-8?B?a3NkTlFmRmdNQnR4dDhMRjlvUzYwZFFRbWJJMmpuQzNZQ1A3bkNka29PZFh3?=
 =?utf-8?B?RGE1SzJWelVqUDFxUmpJUFp6QXQrM1o3ZEc1eTROZ05KalUzVjErelcrQmxs?=
 =?utf-8?B?TDc3YWVjWGM3dVVPUGlNRWVWRCs2WmdxTG5DWmIwcUJCTDBkdVBmNFZRNUxj?=
 =?utf-8?B?REhodFBXVHBDVFF2REREL0lSd250NmVHOVAwUjFoYzNXWDk2WGEwWXN6SXND?=
 =?utf-8?B?Sm1DTWh4TW00Z1hyMlZmVTJkazdGSTNCeUVHU25mU25peHM2eVova1JQRUJ3?=
 =?utf-8?B?alZPTXU0SU5rNi82Q1hXM0RZVUc4Yld0bjdlTktsNkJTbXBaRjRpYTVqejZD?=
 =?utf-8?B?ZGJCZmJTSEE0M0R1eFNNc3B2dTAwRCs3K1Rjd2Z6bTNvdWRJb1IyZENqMVgv?=
 =?utf-8?B?SUZtblZiMVluZkJJaUNuMzFjU3lHQ2U1Vi8rT2tWeUZsWmlVY0E3eFBoOUY0?=
 =?utf-8?Q?aTLx+552fQBE5N5y3ohtI5juOs7TL8TVTJgX7I0pqc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:35:33.0510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b45dada2-6e49-4032-c10c-08de58e991e2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8987
X-Authority-Analysis: v=2.4 cv=Fec6BZ+6 c=1 sm=1 tr=0 ts=6970c81a cx=c_pps
 a=vlIvg6dUmXHfJ8RUMa/6TA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=7cbN4eHG_OvaAO0uNUwA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX2CIdM0PFQ044
 GNAN+EqB+1oqSTTWvxomoZl7hayxkqlBoAWngkX4D56qV57tY33XJI0rk2Mg6ZK3BTLsj2yulUi
 FpdMRraDIdDzkYzHMyalrSY7lRRSuQeKQoRKSQrxl2FPahei6uLcPzU9fIFp8Qn2Kmk3cTevoOh
 4mC98SqUoJD/q+udcnMwbdnRW8B2tq8iHbXuI0SA5Za/sVzw7uZfwJISGMIN4qGbm2bwmnKo0in
 5oczpaMrXLZFP8ypsN1ax7YZxJwQkd1GCXsqscFb2LSEkLbMzpVmCk4eAdbDNtNQ48Q9Xm5wdnT
 CklAVcs4Db1dNoo2YMVz17WfIim85NplICQIlQ25jNjP1GWDxUaYSOFK+XNlkId5NsLxNj5b5+i
 10Hqmdvfn4wQOyOR8mE7WIE5yQKV2RBmAo/YrHdEUcW2pWKWMu7JSXOV5/iDYzs6UsC6Lz8Xrxv
 D8ci1PI3FqMfbJ0C6cw==
X-Proofpoint-GUID: gvGSd3400auKRfBu7fpg-1UO3yGE32Os
X-Proofpoint-ORIG-GUID: gvGSd3400auKRfBu7fpg-1UO3yGE32Os
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_043551_556681_8C3E12CC 
X-CRM114-Status: GOOD (  17.71  )
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

Add the stm32_firewall_get_grant_all_access() API to be able to fetch
all firewall references in an access-controllers property and try to grant
access to all of them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/stm32_firewall.c              | 42 +++++++++++++++++++++++++++++++
 include/linux/bus/stm32_firewall_device.h | 26 +++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2717754d811d..c9e6299197c3 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -185,6 +185,48 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
 }
 EXPORT_SYMBOL_GPL(stm32_firewall_release_access_by_id);
 
+int stm32_firewall_get_grant_all_access(struct device *dev, struct stm32_firewall **firewall,
+					int *nb_firewall)
+{
+	struct stm32_firewall *loc_firewall;
+	int err;
+	int i;
+
+	*nb_firewall = of_count_phandle_with_args(dev->of_node, "access-controllers",
+						  "#access-controller-cells");
+	if (*nb_firewall < 0)
+		return *nb_firewall;
+
+	if (!*nb_firewall) {
+		*firewall = NULL;
+		return 0;
+	}
+
+	loc_firewall = devm_kcalloc(dev, *nb_firewall, sizeof(*loc_firewall), GFP_KERNEL);
+	if (!loc_firewall)
+		return -ENOMEM;
+
+	/* Get stm32 firewall information */
+	err = stm32_firewall_get_firewall(dev->of_node, loc_firewall, *nb_firewall);
+	if (err)
+		return err;
+
+	for (i = 0; i < *nb_firewall; i++) {
+		err = stm32_firewall_grant_access(&loc_firewall[i]);
+		if (err) {
+			while (i--)
+				stm32_firewall_release_access(&loc_firewall[i]);
+
+			return err;
+		}
+	}
+
+	*firewall = loc_firewall;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_get_grant_all_access);
+
 /* Firewall controller API */
 
 int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller)
diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index eaa7a3f54450..6c878f3ca86f 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -112,6 +112,25 @@ int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsy
  */
 void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
 
+/**
+ * stm32_firewall_get_grant_all_access - Allocate and get all the firewall(s) associated to given
+ *					 device. Then, try to grant access rights for each element.
+ *					 This function is basically a helper function that wraps
+ *					 both stm32_firewall_get_firewall() and
+ *					 stm32_firewall_grant_access() on all firewall references of
+ *					 a device along with the allocation of the array.
+ *					 Realease access using stm32_firewall_release_access* APIs
+ *					 when done.
+ *
+ * @dev:			Device performing the checks
+ * @firewall:			Pointer to the array of firewall references to be allocated
+ * @nb_firewall:		Number of allocated elements in @firewall
+ *
+ * Returns 0 on success, or appropriate errno code if error occurred.
+ */
+int stm32_firewall_get_grant_all_access(struct device *dev, struct stm32_firewall **firewall,
+					int *nb_firewall);
+
 #else /* CONFIG_STM32_FIREWALL */
 
 static inline int stm32_firewall_get_firewall(struct device_node *np,
@@ -141,5 +160,12 @@ static inline void stm32_firewall_release_access_by_id(struct stm32_firewall *fi
 {
 }
 
+static inline int stm32_firewall_get_grant_all_access(struct device *dev,
+						      struct stm32_firewall **firewall,
+						      int *nb_firewall)
+{
+	return -ENODEV;
+}
+
 #endif /* CONFIG_STM32_FIREWALL */
 #endif /* STM32_FIREWALL_DEVICE_H */

-- 
2.43.0


