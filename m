Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B242D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dbe+C4JL0UZOJb7yQU/zoG/1X1vfGQr24dk72l+paQ=; b=XaAXBtTc77VSXH2HEiLYbBrR9h
	qYvzFvn0H1jbQ1s5QtAvKl2NLcZ+xN8uYSXgTO4+UjcgVxBN4pDB+LpQ1HvQIec0oqJR8q4RKUOzU
	/fYXfEpRY94wNvMCDX/U7vtR3dD97pcU5fJPdUwSfhW3Lld+LEKh/yoIoKrny0ry/ibx+3bXrthl3
	DpdEFAQAJL/ehjHnWM3ZEqhkBIZ4sTnx39HVAEjt+pm924dl1WOxqNv6+zqHm+ziufAZgOKufce90
	FucM+fihXgOm9/dVSoxA/RFOTAd6KJF7lwXVBMKkwh5Qrhx/0sg+SV83weNWxyHbxnWZjRCXFxJlj
	xRyErLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcQ-00000000LJF-2b6I;
	Thu, 08 Jan 2026 17:16:21 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcK-00000000LAJ-1dkG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:16:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=re3Ilh36utLC9MTH7d6500XRmeVQtPfrvMuz1FCAPp4GKbpzggutD5JCChIGEvCe0wzqHVduFwEJc6xC0Odr+BPgSCr2kU6pheHI99kRl0227gt8+KsMbTdFMFkuQVo2k8zrG5TTtB1QqIlNm4FgFFmMKVZf8uaRUgkKxDy/+gG33Y1unW3Y6Z+pVjPMKOroEiEXIiBYQjA9TEqi6io+htYkG11tpVsNZDAbOW4+Qgj5t9JCLSwddOqG2T+fkDAyJVN5QOi12V/50TSwB4rD+rn9vU+n1WHfXVFMDHRRtOsUX0IrtFa1+EMOynpuZZgQ4IEVh9ZmrCHYVoKDLPNd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dbe+C4JL0UZOJb7yQU/zoG/1X1vfGQr24dk72l+paQ=;
 b=p1KNiadd8jtrNrFnabmaGTl9ZY7jpKsdHHASTCD2OFtRqxtiUppZ9o+7d6sDoO+i4QbsBfZgt7zlq9+DoOWxG0jhpDkwE9c3y2KBub1YNh+YXsqmuBMYp4Xe3gNgoB3BEC0fuxB0tIwxUO5fM9pSD/LtPrZlUzDRAizXk++jfHjagwHTh11fkLQcKs1Jze64B1KkeZQSINGHuhcZ4azvoeVNqDBAbGabuwO0ABEJ8iff7QTdvbrr5ZiLw9HbmDnQaYE6GnQiNIwiPkCQ/pmRtMV6tOqQNx/zoeehYl1j2+M2MYgAZvbvRh5YfGSI6mziidNfQxtfwjt8/g/S5SeKKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dbe+C4JL0UZOJb7yQU/zoG/1X1vfGQr24dk72l+paQ=;
 b=lOitMHuK+pVokMud+yFWfPMmJNLy3Z/sclxlaTRWAm3No/thf1OlCx/kpnx3N40+xdncbeWpCJu1JiVqnlCvSvityR6qcphpSjJJxhyUv0RTw0sBxy75kD9IEQLJLvqg5te/p5FGEJtjFZ8nFvcpzVAaDIFC6aZQu0t5l4ojwJqYM+XWncFT+/Y4pptW6ai/cNWMNvymdMx9gVBNHTd5U6VsGdn74j4S5CpF3xvkdN4/PlE2YIovI60CyZ+IlITkjysRjdXPyKcHCXfMrpUi6H7aR7bXFlhYk/+Ri6/Ghkdz9BBZqU/902V+tvJCq8egJhUwIBOmTUxLjshfpNU+xQ==
Received: from AS4PR09CA0028.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::16)
 by PA1PR10MB8392.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:448::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 17:16:04 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::6a) by AS4PR09CA0028.outlook.office365.com
 (2603:10a6:20b:5d4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:16:03 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 8 Jan
 2026 18:17:18 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:16:03 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 8 Jan 2026 18:16:00 +0100
Subject: [PATCH v3 1/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f4 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260108-upstream_uboot_properties-v3-1-c1b9d4f2ce8d@foss.st.com>
References: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
In-Reply-To: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019E:EE_|PA1PR10MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2fa0ba-1c3e-4044-3e5f-08de4ed99a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGhDYXh1VWFMNUV5Z0JWNWoyUUNzc295bUdSQVFOd1AvVm8wZ0VFOXVwbWNj?=
 =?utf-8?B?ZUx1WTMzdCtJTzVZNEo5UHROYjNJOVc5SVJ3Z2Z5TE5XczNGaVlSYlVacVFR?=
 =?utf-8?B?cmh0YkppUmtvQ1V0aHR5bjNNYVFqM21XRmk2b1E4ZG5RMFFIMWkrRHl5bTl0?=
 =?utf-8?B?aWlFZVM1WExSREp5NjErVEFFaDFZWlh6MllubGtIekZVTENKdVJUZVNRNlJZ?=
 =?utf-8?B?Q0ovYlU4TXlIK2I2Y1hlSnNzSVZzTTJxcTVabGlhNGM2SExUZGx0UXpQZ2pw?=
 =?utf-8?B?dGlqNkU5aEl3WkluQW5CSzZuTEExUmJFNlZHUmhJaXNVNldYbkt1UWdHMXJJ?=
 =?utf-8?B?a0dXTHRTSmNPN0JVcGF0dnlDbXFVdFJyWEt0c1REZWphL0RFS3JtbWYzdFFX?=
 =?utf-8?B?NjFIR2EwbEpsTVNtUjNWR0ZiSm9yLzhJL1ZQMEgrcW9SSEZRaW9lZ1h0Rmgw?=
 =?utf-8?B?TmZ1N3dGTUR4TE9QckNua09MRlM5aFBySDJkK3E0MGxBYUVsQmsvWFBNSy80?=
 =?utf-8?B?Sk91S1BDOUpIZ0E2UVlEYnBMcGp5OHhTbXpWWU5QYWYxVUYwbTZMRWhjVk1D?=
 =?utf-8?B?Q0dTTVZYMnJBT280RFV2Um5YMXkwTjVWYWp4YmFpUFdnMzRqcjVQTHh1N2Jy?=
 =?utf-8?B?NU9ZbnhieWlkTU0vYVp0TFJURjlCSzIxNWFScHNWdFlpZG5NYmlKZExYTk1U?=
 =?utf-8?B?Y2RsVHdmOW5IRTZpVG92TE5DWXR3bDBzRFh1Sng1ZjhQNjJsODZJTTI0VWhw?=
 =?utf-8?B?TXYrdS9HU2E1ZXZUQ29ZcXhWQjdTNWNYNWt2V1ZteXgzdGc5Q0RGYnV6Vnoy?=
 =?utf-8?B?QVBMQUdiQktyTStBbncra0x1VGt6d09XK3RqVEJvMWVWM2JsNzMzSlI4WEJt?=
 =?utf-8?B?VVNzMXczZDVZTVBqaEY1U21sZkVUZUZFdDVNSnA3RVorYW9FeFBqeUMvMXhK?=
 =?utf-8?B?KzVGTmFMY0xPZm44RkhLOVVoTE0xN0FGTzlZYzU2ZmRZeGNUU0xMbVYwL1Nu?=
 =?utf-8?B?SXRpeHR0b3B2d0w2YXJUSGt0a0gvZ00wM1Z0SmIvamJrVXRxMHhaSnRKNStr?=
 =?utf-8?B?c3ppWW0wcHJDQ25JaTRodVJhN0hUN0VleG5wbTYzSEgzNWUxcXUvbmVkZExN?=
 =?utf-8?B?RnJGREZmU2pDTytVbStRNURUUU85eE8rT0QxZk53N01raHdrTGdRcm01MVgx?=
 =?utf-8?B?bE1aU0RRelZqN3ZWVXA3NG5qRW1iblBtWmY4aGp6ZnA1Mmp3dXM5bXFydThm?=
 =?utf-8?B?WWNjVUk4aFNYc0pwQSsyWnFOK3gwb25FLzlaRDNSZnlRUk5ZOFVzWVZ3bHlM?=
 =?utf-8?B?SWpTWTdIQ3BpUFZHb2xqMUNvakp3cGhQU3FPVTBndU9RWXUzZEVyZXdwemNy?=
 =?utf-8?B?bENnb0oxMlZhN3J6aDE0RFhmVTRwUnBwVWdVM1pieHlRVThYU0FKdjRNZ2NR?=
 =?utf-8?B?TUVtZVpUaW1qTnViOENLbW1VcWg1UXNSSVNFczlMOWJ1RnRSbk9qaHBYYkkx?=
 =?utf-8?B?bnExaWRERFpvb0xMc2F5U1VmdDFUR2xxckpGM0tRWGYyZ3l1RzgrcloxOHF0?=
 =?utf-8?B?YjhtOXBaUCtvNzdoeFlYMGVuWURLZHlSMDBuZ2pMMWZRSVR5K1ZtZDlpWDJY?=
 =?utf-8?B?bjMrMGJSMUE0WS91Nm9xZ2QyME1Qc2k2NmI1d3N5RS9MOVZxbFV6SzE0N1p0?=
 =?utf-8?B?ZEpGRmNndmJ4VEFld3FXTDJmYitOYjk4RDgzdFVLR1kxOU9yaXpQS2dwYmV1?=
 =?utf-8?B?aDBKa0FsMERuMUlaVXpzYktIb1dUa1hVNVVES3MzRER3cTg4TWlSYmZrWWpB?=
 =?utf-8?B?Yzc4UUxPeFJmOStjSXNKSVFuSUpUdDJ2MWpqSWpkZ2NmZ3AzVDBtdnI4Wktj?=
 =?utf-8?B?Y2twR0U1d1dLRWdrbk1qU1hqUWFlQ0tRUC9EWWUyWEVkSWNDbUJMY090NmdD?=
 =?utf-8?B?M1J4QW9UYW1OTGVzenVIUndyd2ZQdDR3Ti9zUGhZeElGU0I5M3B2NXNSYk5k?=
 =?utf-8?B?Q1IwdEo1ZlR0NWQrblN5c2FaTkNXYXYxRHY1dDcrR0orU1dIcEo3bTdzNzB3?=
 =?utf-8?B?VjhUa0pkZmNnckduL3FsU28xL0c5czZmQ0c2bjBLVXoxYk42QStBTDBqbnc1?=
 =?utf-8?Q?yX88=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: cybV66vTdHdkCidppG90Pry2EwTCmxuTgfIjAPdYIGo1BPF7U8I1Ftb2lnEARVU3UK9+rN6eZ07dSI8720aKuFT+Xpuhgq6ZfYafUGdpZyCYVpwSFC9GGw7b/qkIhClttGVBsZtzmMK/0h6So8DoIYwERiYFnNtA7d5+rLUg953lvAj8v/acVj/Omrnm1ae9HvG5rzy5Xw/6g7gtSFALxkcxmSnskmVK7RtYE6HtawaWDsXzvmZe6LSxk8OHgq6IfoAo71+D9VKeX2TeIK/86IW4wWsw9B+IpSD2xrTU34Za+3VbDCmI8+DhVMHXRI0NGXLYYGYOPU/m88PrWIxKGrDeO2HyYlxpmHGQBNWlPxVKjhD0NfK1mpR9wiAs3/rvaKZOucpOiRfwRjPb3T5Ud1I9jIypsvJyUVI4GYH65jNKuqg8AuYP1IWjtDcVagdxNlV+a4IwcjwSjFWxvoE+BUTyKQYcVpgd0WBbY5mL0x6xOBrIa/PQdaIEWmzPHXnIsWIT/llDcgmMHj3g3/7SaW4fGnIsTaPIkxu4RI/ksFvobbgikchEvE/BgxYvDhz+Gh6kHgqPTw6gLtgZPk5lwfBX9xEu/U8/5l5s6VfBIm+Xhc9GP6GZW8kOTitOGFt/4KI970Lr9l46CtolBgSJllhtFQhsuzoyIzr3YQOLvBJK8sx908pKILZxEHCS6JpY
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:16:03.9483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2fa0ba-1c3e-4044-3e5f-08de4ed99a83
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8392
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091612_624724_6A86112A 
X-CRM114-Status: UNSURE (   9.92  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32429i-eval.dts   | 11 +++++++++++
 arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/st/stm32f429-disco.dts  | 11 +++++++++++
 arch/arm/boot/dts/st/stm32f429.dtsi       |  9 +++++++++
 arch/arm/boot/dts/st/stm32f469-disco.dts  | 12 ++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32429i-eval.dts b/arch/arm/boot/dts/st/stm32429i-eval.dts
index afa417b34b25..3b6151fcb070 100644
--- a/arch/arm/boot/dts/st/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32429i-eval.dts
@@ -312,6 +312,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -326,6 +327,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "host";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi
index 3bb812d6399e..bcaed4618738 100644
--- a/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi
@@ -51,6 +51,7 @@ pinctrl: pinctrl@40020000 {
 			ranges = <0 0x40020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
+			bootph-all;
 
 			gpioa: gpio@40020000 {
 				gpio-controller;
@@ -60,6 +61,7 @@ gpioa: gpio@40020000 {
 				reg = <0x0 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOA)>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 			};
 
 			gpiob: gpio@40020400 {
@@ -70,6 +72,7 @@ gpiob: gpio@40020400 {
 				reg = <0x400 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOB)>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 			};
 
 			gpioc: gpio@40020800 {
@@ -80,6 +83,7 @@ gpioc: gpio@40020800 {
 				reg = <0x800 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOC)>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 			};
 
 			gpiod: gpio@40020c00 {
@@ -90,6 +94,7 @@ gpiod: gpio@40020c00 {
 				reg = <0xc00 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOD)>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 			};
 
 			gpioe: gpio@40021000 {
@@ -100,6 +105,7 @@ gpioe: gpio@40021000 {
 				reg = <0x1000 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOE)>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 			};
 
 			gpiof: gpio@40021400 {
@@ -110,6 +116,7 @@ gpiof: gpio@40021400 {
 				reg = <0x1400 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOF)>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 			};
 
 			gpiog: gpio@40021800 {
@@ -120,6 +127,7 @@ gpiog: gpio@40021800 {
 				reg = <0x1800 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOG)>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 			};
 
 			gpioh: gpio@40021c00 {
@@ -130,6 +138,7 @@ gpioh: gpio@40021c00 {
 				reg = <0x1c00 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOH)>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 			};
 
 			gpioi: gpio@40022000 {
@@ -140,6 +149,7 @@ gpioi: gpio@40022000 {
 				reg = <0x2000 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOI)>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 			};
 
 			gpioj: gpio@40022400 {
@@ -150,6 +160,7 @@ gpioj: gpio@40022400 {
 				reg = <0x2400 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOJ)>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 			};
 
 			gpiok: gpio@40022800 {
@@ -160,6 +171,7 @@ gpiok: gpio@40022800 {
 				reg = <0x2800 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOK)>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 			};
 
 			usart1_pins_a: usart1-0 {
diff --git a/arch/arm/boot/dts/st/stm32f429-disco.dts b/arch/arm/boot/dts/st/stm32f429-disco.dts
index a3cb4aabdd5a..39a80a9caa5f 100644
--- a/arch/arm/boot/dts/st/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f429-disco.dts
@@ -209,6 +209,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -223,6 +224,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	compatible = "st,stm32f4x9-fsotg";
 	dr_mode = "host";
diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st/stm32f429.dtsi
index ad91b74ddd0d..51c931f7b9d5 100644
--- a/arch/arm/boot/dts/st/stm32f429.dtsi
+++ b/arch/arm/boot/dts/st/stm32f429.dtsi
@@ -54,16 +54,20 @@ / {
 	#size-cells = <1>;
 
 	clocks {
+		bootph-all;
+
 		clk_hse: clk-hse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 
 		clk_lse: clk-lse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
+			bootph-all;
 		};
 
 		clk_lsi: clk-lsi {
@@ -76,10 +80,12 @@ clk_i2s_ckin: i2s-ckin {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 	};
 
 	soc {
+		bootph-all;
 		romem: efuse@1fff7800 {
 			compatible = "st,stm32f4-otp";
 			reg = <0x1fff7800 0x400>;
@@ -580,6 +586,7 @@ syscfg: syscon@40013800 {
 			compatible = "st,stm32-syscfg", "syscon";
 			reg = <0x40013800 0x400>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SYSCFG)>;
+			bootph-all;
 		};
 
 		exti: interrupt-controller@40013c00 {
@@ -666,6 +673,7 @@ spi6: spi@40015400 {
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
+			bootph-all;
 		};
 
 		ltdc: display-controller@40016800 {
@@ -694,6 +702,7 @@ rcc: rcc@40023800 {
 			st,syscfg = <&pwrcfg>;
 			assigned-clocks = <&rcc 1 CLK_HSE_RTC>;
 			assigned-clock-rates = <1000000>;
+			bootph-all;
 		};
 
 		dma1: dma-controller@40026000 {
diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
index 8a4f8ddd083d..de025a385e9e 100644
--- a/arch/arm/boot/dts/st/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
@@ -169,6 +169,7 @@ dsi_panel_in: endpoint {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -225,6 +226,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -239,6 +241,16 @@ &usart3 {
 	status = "okay";
 };
 
+&usart3_pins_a	{
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;

-- 
2.43.0


