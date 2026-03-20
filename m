Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F390108B917
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYqjfLR1sGmdN5nx+/QoLQ9h4IQngwOkMWYVIgZh6x4=; b=r99t/P3E+4UkfAIRUWrKxvXIB0
	zJH4PFlgMf7YAsi/chWjeD6Jvx03zZXOgafvHO4pV/82Q6w1WmQAZWNwwRI0Rp6mgznnDgSMHt9gH
	+WgsbuPJzm8RWM/gfWzXBUZWpF8TDRYTFdWuklJTE+d9KKjZjTsrKIBIQIevDoNIaNcxYRjZsQ4Zb
	wJoEMyh0CDM+kt+nltPCnEBPdBpkIro7jZt0L5GEe8SSEtkPntwtiUXfHSn+UvdIccZ0TVMtLok50
	s1MJk9qlAwtKPEFlUi00/J+7XlNa/O/pDn9fEbYhNEwBU1I8OqARdBQl9e5SZorwwY8LoMmJcjuH4
	m9cg71+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YwO-0000000CmFZ-0Gx2;
	Fri, 20 Mar 2026 12:27:00 +0000
Received: from mail-francecentralazon11013067.outbound.protection.outlook.com ([40.107.162.67] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YwD-0000000Cm7J-2uvL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:26:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEAJOGUd0f5O6vcAPF2wzKHvJqO/esPG1SITUvdpb2kxF55eNcL7bHb151ekwDOnWviLbnob0NFtR5X6AZGVbLAbs6SgQsNmosLEtiI8qZJEvtMKcq8tWulyG+wt9XI/odwZfpeJZJukYUAP2wTfJVgrit94GaG61VFe9O2WcyBswQ8e+Zt8FNT+n2PCYUUphe1yTfMduhkf1/CI/tLb1DOB0D51vaH3+O2dKmMIrdtcfjBwzbqBxGNl17c/I32SjECH16bXDlqsgY7U/jTAxO7e8Y/nm8FXBT7997lcH+wD+qb6uc6KbyFFBQsme8FECKz8S65lhMnPwniSGnWx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYqjfLR1sGmdN5nx+/QoLQ9h4IQngwOkMWYVIgZh6x4=;
 b=dIVhhfG5Qjktj9sU9MAWoVfCfIShh9qpOAOfc7CvkL9u9/0vK/ClXmNj1cpuXooM1NEanBUsyW0Sum29etGnY+R3g1xXSXeNM6DZjHCjcrv0X9EF+Ud2UMazl9u2J1unFyXmrGtgMzgK/oIxkUpBtHq+8AMN8O9M4y7tNnxBXiOcJUz5Y45HyS5ya3yttA8KpvehqLmtjUip86TNuvPe+QQb548U9p1D5DosNcA28wopqgWB3fYB6erI7MM2Oamg8yNfNR8io2ZqeVfrjiB5vh38X2P8FKwBVYTJddCBIJa5ZNCbD0Xp8rtW1Fxm0gpS4KGEaU2fnGCiGiAeB4kzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYqjfLR1sGmdN5nx+/QoLQ9h4IQngwOkMWYVIgZh6x4=;
 b=NC9HdRRRvvxL1zQsw+T7fJnbDrJA8uT4H7M5G2WzZXgQymj4NgqMExesn+xbWrauqYNfes2GH0oPF1dYZjkLjQ9UHgrSDAypwPeb+8Z2gEKp1BQLP2LvSyVMKcSxnHqFL9qW96pdB3o0F5KICsWwsxE6CoVXj5EEEsKPDbmcZQZD7aapoAlWeUJK0DjZP2Id50SQtEW0h7aXdfUl7iLtm8IflRpqH7WrqDWdD5VoITDMkSYGetbODpXJMZsF5Mmon3MSY2rRXMopxTJXmQZArKDgMU9SLhQR9QHidm34vWrgBqNcFh/8hSod+RMAP6o3YmFh+7ituchs631HmsNhmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7331.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 12:26:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 12:26:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 20 Mar 2026 20:27:54 +0800
Subject: [PATCH v2 6/7] arm64: dts: imx943-evk: Add fan node and enable
 active cooling on A55
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-imx943-dts-v1-v2-6-e6eba6b3a837@nxp.com>
References: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
In-Reply-To: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Florin Leotescu <florin.leotescu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: a9adf37b-5605-4c00-85a3-08de867bf16e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: iS6Gl0wwv36A60fbie9pos8mjAznUNOqqYuHMT+1cvdPEUaw7OyN3GEOjYcYBXr0ptzH2Q4EaRZtQcrZv5GaTxQOmTXwVLvjHpSznwDR7Zgy8Te6/uuvmj60L5C4qnBHwX/CQma5H5stc3GEHeJY8CkgThAo4prK4vHdqMtjvjwIdmobALF/0AY+j7OfwtbigDlo3eCckusnnK+qQCY12J5q9k7X307dPtSGe77SDoLwPTxLgrIfVu6B+xXyVYwSnqIn5bf2BZpGZR1NL2gWYcsjwLQOe4y3XBN9MqqPCLL0xgxBFeXmVIJWtdqdFhV74eAWT7qj8Qx1PrB6qPlVfDMW26B3W7De5I6e+J7W7rj7PaGEdOrSZJ784YG7mJedW1oohQr60ndJkKDjipALiTXw0ajqK5INvxlCswyVmPaKKkRxntA5EMi5VZYeNOz7WTnpbr8Frn7GWkJOApwR84vAXUd3N0gE8eJu5sxqduEG8ilW4xEVxZtrCGGDMM8tPgkHM40wGfElWp2TqYDZF1vVZVsLWs4Qm4wbr1s1zqBN4Dtyo4PxwhrWF5gpKwfKdoW8TYfAZh2xCR3XSkQSaPom8t6ODm3vpkAJGnCmTRISBOea+M53GFmY5wsnwr351JPtVGH5kaY1fPboGjN9OXSSjBM2RPtOEqNtFF11XR5b6fX+NixSX/mZEb5u4CT0eoVuDB5/n4QIVTdIW1100QjhxVwJRG4XYCULoSu/Q8sClH8m5VNLnuavK44ltahiyrqGKAikY+TWT8avC1mZb6g90Ue/FEAOpSwwNf3AMDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjhvblYzc1pOZ2hCMTJXQzBhaXkvaFh5SHlDRi9zT1FiUkJYa3VvNGFCZVB5?=
 =?utf-8?B?Q1VCY1NhblM4aG1MNDk4anVCazhnNmRhcnVaZ1k1aWlwUTI4Um85OFZOc2RC?=
 =?utf-8?B?cStOQzViV0xNMG40UG5NNmxUZ0s0RGJ6ZlZ1Ynd1dnkvbHZxb0VxRDBOWWZq?=
 =?utf-8?B?Z3ozTGg1cFQxcDBLWlBGbHRqNVoxWmVKQlltV044aVVPTHJnVTYzT2Z0aGd3?=
 =?utf-8?B?VUN4OXZGWGNIU3Zkc2JSTEZMbXh0UERpVWFYRTZKTTlydDFkaXFMUjZRbnFw?=
 =?utf-8?B?T2w0WGVOTVE5TTlvTXlyUE15UlVEbmxWTTJwTmdURjZsUlgvSGZ6Y3g2ODJE?=
 =?utf-8?B?VHM5Umo0T2FMTWhjWlF1emRNaXFvcklySk9NUC84RzNlclZtRTdUdzNHWStB?=
 =?utf-8?B?Y0gwZ1B2azRJOWZTd0tJK3lwR0NaNzFXMUdYTXlra1h4MmpxRDBHNmY0QkZx?=
 =?utf-8?B?aW5TRzRzcmRMNE5idCtUUW05S2w0SGF0cHVwT1BoL2NRZWNZMUxuUURCcG9C?=
 =?utf-8?B?R0NCNEQ4TlEzMEFuQ2RvRkNlOEpBUzlJQmUzOEtlSDBTMHdUb0lXUmRFMCt4?=
 =?utf-8?B?Q3JvU0JKUFRYRHBPT3RxVG4yVHA2c3c5Mkw0aXE5ZGFDRE1WaCsyNzV1djJQ?=
 =?utf-8?B?ZW1TNW84OGtOUTl3NGpOR2I5MmFqRUI2M1Rvc0xTN3NUTTY1YlpBQ3lndXJk?=
 =?utf-8?B?MTc1dkRZVWg1UG1DZElEUElFRU9SWTVsQmk3QUd2TS9ZWGdqd2JhOEF1Q1JW?=
 =?utf-8?B?UjZhNEY0QnVHVDdIdGxxU1BlVTlESmhzTXRya3hkTFZzbFZwVFZndGVZaDZx?=
 =?utf-8?B?bUNvMmFlSDEyc042UUp0QVpnMmpWaWVNUlRsWmFqWGdMY25UODB6MHpOamlZ?=
 =?utf-8?B?NWdjWjk3MkhoRHZQUlZkd1pvTTdPUlNWNis1dnJ6d0tUZUViVFp5Sm5kbDlj?=
 =?utf-8?B?bTY3emFBYXRqTzFEeng3RlhhS0xuSFYvQmxrNTduYkR6WG1QZTR5bERYWGZH?=
 =?utf-8?B?cjRNZm9GbWNCWWdaWXNEempJUEp0dU14eldFTGMrOUs4ZTdVYTNMaWJSc0ZF?=
 =?utf-8?B?RkNrWFlyUFVjWW9nTHVnajFLdUxTcE90TFBHdFFFRE0ydGJ0ejZDS2loWEpi?=
 =?utf-8?B?KzhqdlhJTEMxdGNnT3pZUGU2RTNYM0NmOWZpRXhZUXAzeWtiOG9VYlkzMlZY?=
 =?utf-8?B?bTdyVkJXaFNqMUhSNDA3dEdwN0JpNlpiNUJVMWd4NzRyUW5tMmkzWDhWME5M?=
 =?utf-8?B?RHlXL2FXTWhhUWk1bmZCVEViTTBtQW9mU0RYRnJxdysyQWNyNC9QQlFxNStL?=
 =?utf-8?B?aTdRaENzRnEwT2wvem1zQy9CR3VweE9rNUo3R0oraXh3TFhTYmM2L3J4Z1l0?=
 =?utf-8?B?SjlGWis5QmZLSnZVS3Npd2ZLSXYzOHY1UVcweFd3amlqQ2lvdVE1WUc2YmU0?=
 =?utf-8?B?bHNYb0IvWFF2OVFFQ2lCaENLaG5LMnB3bFdWQ0JLUkdWSThSZ1lmUGc1eWY5?=
 =?utf-8?B?TC9sakVpRFdKcnROSUNzV3NHSnZrVHJRU3VNUUczM3N4Rk5sNkZqNUljQTZy?=
 =?utf-8?B?R1VkZTBoM1BGUGJTU2pTbW5hUmlVYjR1YmEzVWFCSjZoWm0zczJocEM1Y3hX?=
 =?utf-8?B?WWQ5cEsxc2NaaDBRRnpNYWFpNUxlOVBrR21CRzhEV0RsRHhvYzFIeXFXVUFv?=
 =?utf-8?B?Qmw5SUltVDQrQ0d3YkhaVHNKYktESzhCdFMxS1dlSDFaLzhRcnZ6dkFnMGhU?=
 =?utf-8?B?SHhacHBRTWJwWWVhRFFuaDdvOWw2dkZydXlSYjJjcHhmSnV3SWdDUEJKWUhF?=
 =?utf-8?B?MStqRG1TM29OSW1UQ1JTK1lVTDBYVnRxTFpHQkFRSDlQMTIveWRxYlUzb1o5?=
 =?utf-8?B?dVNMcWdCZWpsL29wYSt3bmhKVFNtV1lhYWhENGJJcXhsYUJTZEJNaHI0bmNN?=
 =?utf-8?B?T0xFVXNYMFNXTWNodVpZb0txVENnTVEwYTJiTjVJSDBxSjRHdzlWZkdGRm0v?=
 =?utf-8?B?K2czZi80US9wVjNWQkFtbkhsdTdsL2RoQUNjTmVyVytJVzhtdEwzRHp1N1E4?=
 =?utf-8?B?WjNWRUJXZk4ySEFwRHJWOHd1RW9yaGFxcXI2Z1pHSDZZU1ZxTVZlbmVhWFhV?=
 =?utf-8?B?RU5nOU83dlM5L1FRY2hsWTJoUE9CNitnZVpIQTAwS0tIU1dMSHdyTkMwLzRN?=
 =?utf-8?B?dE9xQVFEMGp2T1UzSm1CN25mMDM2Rm5pbGhWZWZlLzNpTkZDMHMrUy9uQlRo?=
 =?utf-8?B?Q0VxWHQ0aFhQeVg3THk1d1AvbGlJQXEwQjlZRUZ1bEZsTURJc29Db0tmdEtY?=
 =?utf-8?B?UXhGdmg0Z0xpTW5qbHg0L1pybyt5aDZ6cktyQldXcWRMQjQ0dTVWUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9adf37b-5605-4c00-85a3-08de867bf16e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:26:42.4802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jszx5JX9S0zDGv2OA2+0p2ki74HgJ7x6wEiVyXLP12Cu0NKGz0nku/BmTslClvWK3Cy6BV0E8zK4HTVX7egYgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_052649_744334_456C2197 
X-CRM114-Status: GOOD (  10.17  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

Add pwm fan node and use it for A55 cooling.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 56 ++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index ec728efbe15cf0b97deade68445b23528325b082..7125c7fc6e32999fd279b9d01af0b210d1ab843d 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -7,6 +7,7 @@
 
 #include "imx943.dtsi"
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/pwm/pwm.h>
 
 #define BRD_SM_CTRL_BT_WAKE		0x8000  /*!< PCAL6416A-3 */
 #define BRD_SM_CTRL_SD3_WAKE		0x8001  /*!< PCAL6416A-4 */
@@ -314,6 +315,20 @@ i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			fan_controller: pwm@2f {
+				compatible = "microchip,emc2301", "microchip,emc2305";
+				reg = <0x2f>;
+				#pwm-cells = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fan0: fan@0 {
+					reg = <0x0>;
+					pwms = <&fan_controller 26000 1 PWM_POLARITY_INVERTED>;
+					#cooling-cells = <2>;
+				};
+			};
+
 			wm8962: codec@1a {
 				compatible = "wlf,wm8962";
 				reg = <0x1a>;
@@ -892,6 +907,47 @@ BRD_SM_CTRL_PCIE2_WAKE		1
 			BRD_SM_CTRL_BUTTON		1>;
 };
 
+&thermal_zones {
+	a55-thermal {
+		trips {
+			atrip2: trip2 {
+				temperature = <55000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+
+			atrip3: trip3 {
+				temperature = <65000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+
+			atrip4: trip4 {
+				temperature = <75000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+		};
+
+		cooling-maps {
+			map1 {
+				trip = <&atrip2>;
+				cooling-device = <&fan0 4 6>;
+			};
+
+			map2 {
+				trip = <&atrip3>;
+				cooling-device = <&fan0 6 8>;
+			};
+
+			map3 {
+				trip = <&atrip4>;
+				cooling-device = <&fan0 8 10>;
+			};
+		};
+	};
+};
+
 &usb2 {
 	dr_mode = "otg";
 	disable-over-current;

-- 
2.37.1


