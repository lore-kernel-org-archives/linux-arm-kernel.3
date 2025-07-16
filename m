Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A921C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxLqchhpsDLFz+pjioksJJmkqEQJUzRiCzL5lic7InA=; b=o9tOGJht1SW7TNSZcsGDUS37KD
	LvVDm6Z9Bz3Ry/mj57gMA2w+cvl3FkhjS0nxOSbmp5cm9gfQmdc2zf6sHLpL1+key1qLdENL3GYHC
	BFCEqMM3I2/JFRzIyaPFTqDf/KeUCKVUKcIb96j86cN6lV3WA9y2ge713jM6RRAde9LT/HspKusCl
	V2smCjW1RN9aLkdpgxiIYbKHIJSeVFf4jkZ4IGEALY2dEWtmPThMBnm9D0PyzQQfVTWM3CYgIxyYI
	dItHNf7I6gIFLyTVDb8mW8C0nm87IgjOoi6xIggGQGOoQHkWaRyCXWbs8zegFqkqzIaDhIUVw44d+
	utKQG5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvhB-00000006tmF-0zo3;
	Wed, 16 Jul 2025 06:32:49 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvMr-00000006rCo-3MBW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+NDDBXHfGQJTlhYbOw37BIe97ixoxDjyiwwDeR5f58S2rRYYEueX3sKFBZGZuT/43HXwIMbcNAi2Lyj6NcR4iEdOZHDsky0ZN5bHC3YarhQfONgI4fpqAyVnU60jrZLjBlIINyFPoplrzmGUDuAe0zSSM1Hxtic9/Ybg99sI9Zwrku/2fz9jN3uxIthUwVAIKUV0Vzq6GCChSNk6bCVKl6Wnk+SaDvgTrHhvFHC3OtArHEl0rkUhZlBboAD+4x2MQxEZOQlLldvdgVXTSuH5TWtxkKHszGsDKXLw64k8B8d5njD5HG/qrObwII/ZhxBNiOiKkQLClBDK1mQLX6d8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxLqchhpsDLFz+pjioksJJmkqEQJUzRiCzL5lic7InA=;
 b=jEs2Y9A/A1giS2mX0caaxgeEMpwKZKyPIu7pK4i+gfJafAC8Dy+AKAUS1YZ7VRH9z0gWVXSI6pfNdzAFAYFLomizNebVYSwyDxDpSKquRPtQSDcr8jl8XZREj5UbRINJgCkvE75aXAcszMe0hCxFqDF7+85BRvYQmZkPHikUMGtnzfjOdDZ+vsxX4FsXW3NCkXkXbwSPkx+R6vwNK7OVBHzpW04VB75/iW1BNiUyM3yNH45bOzVUjDh6zInkcs7aF4033QlhcbzRPmr2Br7ArilmCFpGSCbdVYpfxtRJL5XUYoMCSOzuNjEE5kE1r3h74gMkSmkei6bp2IJykMG9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxLqchhpsDLFz+pjioksJJmkqEQJUzRiCzL5lic7InA=;
 b=f24ek3tnhS+wgykGpRN2rJ/Vds5Om3g2D6l5KN/vDQGewOD1S3NU0D6d5hyuTYT5nADe6EiKdilADgicT0n5Gu0/CRe+Un75iypKOq96tM8TsAb4SC2kVPEcq09HcBVJKZhhcFNbfygsziMzTNzAelIvouZZR0ZF5FHzQ/nESlqoQynBodqsyX3fvPeIj9/NPmcdcLuiwd9hB5Fsi8zR7S5p41Fd84pSAem/f0VtElxrG+bib8mkze+PKrH8nq6kDFHW32W/08SyA+WOYS/tehdY+Bnx8pQ1FBBYnqsCfRiAoNfckWfBLi9NLKmHkqJfJQM6gLUi8CpF26BhKefZaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB10102.eurprd04.prod.outlook.com (2603:10a6:800:249::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 06:11:47 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 06:11:47 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH 3/3] arm64: dts: imx8mn-evk: support more sample rates for wm8524 card
Date: Wed, 16 Jul 2025 14:11:14 +0800
Message-Id: <20250716061114.2405272-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250716061114.2405272-1-shengjiu.wang@nxp.com>
References: <20250716061114.2405272-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::18) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB10102:EE_
X-MS-Office365-Filtering-Correlation-Id: 6183d7c4-fba7-4ebb-a6d6-08ddc42fa576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EtGY7TioAtVB+m19hyLF4LXmYicfwG5D1xsl1etK0aMZgMXH00L3uWtXNTCg?=
 =?us-ascii?Q?5CoYY8nzL6TvTVMZ5WVDel0892LoBFlpPz1oT4RYXJ3C/GyJWPdDJxSPek8m?=
 =?us-ascii?Q?VVUiM3cBi6RHXezbDtqL+Lqp2Xyk3IF5QSVn6ihqc3V94DCfsCSYkjjL52nb?=
 =?us-ascii?Q?8zapRUpbqKmQPZ7rCeOWG7ltLyY7fi6LdjsTup6S4a60dV6rVwQ6tPgmoRl5?=
 =?us-ascii?Q?iHaZaHerC3u/AdcKs9zMPOsFbSLa0AjkBitD/UkJHwroNJC3yIUu2uns9iXc?=
 =?us-ascii?Q?IrWUEnyVTTPOz0pSrw7pPEWYsEBkix6AkJ96dFA05nD4vf/lTy5/bb2AsJop?=
 =?us-ascii?Q?phWC5ggM/FNmh7dBcbzAYht6gbbLmIZyd4DxqkPdl4uuYAN+L2p5aTbIhytT?=
 =?us-ascii?Q?ieJQa95FdvPwkmnZ53Mq7rC+Dot0LNMk0Dyk9hycT+/va3p9Qr1KfHvsHdaW?=
 =?us-ascii?Q?PsbFyPozM7Gp1zB3+6+YVFqI6BJXqhruDLsneuRDfVEujqjVotLBFiZLzNcs?=
 =?us-ascii?Q?x5QqpG85WDnSiXG5geZDoyujRLp21R61HGlXfIdK2eadiOfFXbejhJGnqxqB?=
 =?us-ascii?Q?IUG3pJTeQbbWyd6t+tkVNp2ysr0F5gTakUuVfTovt7Dev+AEXWyrjJURb0Pl?=
 =?us-ascii?Q?PZpM6ZSaX18nxP67MvUUf9vmxAIHevK7Z7Bw14pWmmFj/vEXY4UaA/fGLiNH?=
 =?us-ascii?Q?Zs/dVWvfPJG2QvK1kBRN2uDdA1AGB6tRRIsLl5rW7RdqshfP2QvWrSC7ff24?=
 =?us-ascii?Q?nlgUntXoke38l3N0PNwHg40KpM8Ygy8Y9yJ5RT7faVQfL40sCuL4Rtx/J0++?=
 =?us-ascii?Q?I9K86hFMzUFyDWo+HBWwonUxh3Dv3haxpNDCUYcG5kjMecVeZWHWXPONtkeX?=
 =?us-ascii?Q?EmbdUmf32wCH71CMv98Wej9Cz515aGHEhOZCO9z067fA+7bCwcVrFnR9T8sN?=
 =?us-ascii?Q?Wh1H0FElawiojl8s9OSuwmtX1pWgrsAI1VYON5In/zrJk/1vWNNuGoQ15ThI?=
 =?us-ascii?Q?zfVNN0i7IRZPm6Fn/qTlQAZz4ZInbKXp+ZeXP7AERKjcfNZGdOYpaQQDa3Gl?=
 =?us-ascii?Q?TL6HnqHfhDTSuPzMkd/1jJH1IbO1404cqy+4pqdVBdIWqAxiPQQ1sXk+GJhC?=
 =?us-ascii?Q?CZiC/DFYQm/2crurcc0pmnzPioKSWnsBmUtdrl7TDKWD2bVOlraNgoTQIBJ/?=
 =?us-ascii?Q?gNUTtJj5Wz/CpTogpXDoP7y9li1dRuXDaOZaqLBkcpuUaBa0lB+XQDBfFYJr?=
 =?us-ascii?Q?+qT5S5WI5ly/9S0SSEPbPArm9trWKPkkAHQnJEy+0toKZ3WoRyWCoHp2z/mH?=
 =?us-ascii?Q?CY7l3GMLRpxE4qyoxbR8+cZe0WZoyJekSvlbl/cet6rjcTYSmtEOcW7bxyuJ?=
 =?us-ascii?Q?8GmmWHwZ94ZizBFBTSPOAN9Az03ouv5lIjTo/mDnd+dymdyqwiem0pyrIFR2?=
 =?us-ascii?Q?s/oNhSNZ6FAJlrhePaWLBaTct+MVfyJ8biaOHoeWFMuBUC0zhL2ft030Lbff?=
 =?us-ascii?Q?v+monr71pZTlYI0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AlesdRyP0jPDqjunDmHKxGobzGPTrC7Cvt5qVtoCe/N2dKVq9jhAA52+yRCI?=
 =?us-ascii?Q?qjDmvgzH3Yw/xNEt2rVncUZo2Oooi/o3f/Fr7SLVwReMHw2J5q8zauCmgaLY?=
 =?us-ascii?Q?5PG9oX1XZQdkkt5PR0PGiQ+jxrHKCi1+ce3rlcI/lrvTvFemGbgTBv+Jcval?=
 =?us-ascii?Q?mF9DjjqsFywn5LylJdr65nuA8rvcgvogow0iJc2WoJikYagIgNYTpA0ui6ij?=
 =?us-ascii?Q?hVgU787KL7T3drn+5HA0e8bc3+fhYgI+L04wM9yOq8VjBmVbFLlabK60aoFI?=
 =?us-ascii?Q?3dEWkwiQwZKdtjYkRLrsBRzCXWtmLO1CJcw2Twz6vvgjpNgGceK+vb8mGsWS?=
 =?us-ascii?Q?iroDTzAbTB/vidmLe19GJ1OvhSJARPq+lQWzdD73DTva97SpSejMlL3kovmB?=
 =?us-ascii?Q?tR6e3NsUd1lrpOn6/i7NXqHVGCRgyL4mBvtnKf4lpIhxUSJ0pCvcgfBTsRjz?=
 =?us-ascii?Q?RY4/kHI3e+pX9NcvwGHLVpV37vuS7lnFdv3eathIZlnWhpQ0uauXJ6YtG1+n?=
 =?us-ascii?Q?QFWbmq+huxHaU3oJxJtzgcKcNcrP04AHFmTBMv5PoNZeJQ3/1D3eo2X9ocqM?=
 =?us-ascii?Q?713g+qcA/OojaY/chsi2atvUoOTeysJb748ZrkIifqnem9oNwxyGWNjoJoDU?=
 =?us-ascii?Q?qxVKbpgGkH9MzyHP5LPKDSCR25MD/nzNUCEuptl4N06ADUk5fN9FCKVFGr0E?=
 =?us-ascii?Q?5eCfuFsw5094/+vA3XvCMjCDd7qMEuruARbAr32N1JheFAV6lDOxEeNkh9+e?=
 =?us-ascii?Q?XN/xzpV3UN0ueFUMJgYlAkYgRQJYaFvvxYlei7KS5/0WqdbrE2VBtL3IMpcc?=
 =?us-ascii?Q?lCqHY+Wu1/emvq3luT+WO0ZIo/2bYUB5wEJ9vM63WL9gfdgB4MT4ftcM5IdX?=
 =?us-ascii?Q?Ik2krvUBDWCvu69RtNUlp7pUJ2m9vGxuGSRlVSddRDgOmHB/RPdO9wNkWgKi?=
 =?us-ascii?Q?oDKcNlDgvaUlXhPUqCRHcqZKHnMHQNykglf/bNZJC2ZhMDc55Rv99N9uT4ru?=
 =?us-ascii?Q?wSwXh+SuPxY0LIQDYfyc+8suBR7ww0W+8B/Ukz389Hl0h32kqHX5cbrNDJ6R?=
 =?us-ascii?Q?lpdB7521+MneI7wTMPSikN3Fe9oJeDRWzWhr7sHi6ACwqoHsO1NWHaJw3nAN?=
 =?us-ascii?Q?2vDdrWq5v9ZKnQLl21Xnj1SMJlDSOnXq7uY6m3dtTRdPlipZIYvFcUcbuQGK?=
 =?us-ascii?Q?sEkJe2QOW4LNvsFB0jGhKtThiPpzOB1oeqqenEmn0x4Td1FjB2l0/Px7ICI0?=
 =?us-ascii?Q?4ykKqvqO6hnrJ0GNSmefdSDrbnu76EAIoxgxzGBrRyBvQtrOj1FULrppANhX?=
 =?us-ascii?Q?uYoWLyOXBAHCFfRshWFBlAnXjzc2pRfxoBFkn79C+8dbaYCUWTz5HuDj+wWI?=
 =?us-ascii?Q?P+r/l7Xg2gGIFYl5j4KvAbfwypSpU9wTdZctUsVmdsuXPSyziV+fiLDHcYvY?=
 =?us-ascii?Q?stNNJ6DJDqt/X/iCdfyuj1vwV1anPkky4biU75MiPi6AIybU8VIhXud4keqO?=
 =?us-ascii?Q?WnV/byQZgw/gw5kFL/43F6vt1382jM/jZI8k439RDB3GaAEQ4+Uw2YYTiioB?=
 =?us-ascii?Q?2ycf133X4UNSx0DUYxFFXA2yjxYS5wp6JuRCCayi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6183d7c4-fba7-4ebb-a6d6-08ddc42fa576
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 06:11:47.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0t1/N7b7WShCYd3mzL8P41uaL8DlTk2w49A72yWCK/M46PS1LcK27gQ5toT4AedzXJ/udojoJnMjIIc+Y0fgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_231149_852085_9861F417 
X-CRM114-Status: GOOD (  11.15  )
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

The wm8524 codec is connected to the SAI interface. There are two audio
plls on i.MX8MN, one pll can be the clock source of 44kHz series rates,
another pll can be clock source of 48kHz series rates.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 33d73f3dc187..145355ff91b4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -387,6 +387,11 @@ &sai3 {
 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	fsl,sai-mclk-direction-output;
+	clocks = <&clk IMX8MN_CLK_SAI3_IPG>, <&clk IMX8MN_CLK_DUMMY>,
+		<&clk IMX8MN_CLK_SAI3_ROOT>, <&clk IMX8MN_CLK_DUMMY>,
+		<&clk IMX8MN_CLK_DUMMY>, <&clk IMX8MN_AUDIO_PLL1_OUT>,
+		<&clk IMX8MN_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
 	status = "okay";
 };
 
-- 
2.34.1


