Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3996D35E5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3tnjdf9vw/udV24JmpTNkCVenZwSRuG1YlYfCb6FGI=; b=dhokGJ69LX3zAlQY+EZC/X7N3U
	2agGBkZF8JdfCuAcDUNGKfK1aurklBGutvaPGZr1IFuWEbL0ZoPz/jyaBCevbw2bfrBoJ12+XMCJC
	TTiCHCL+bT0SCF/b3JjjR7EOS28VOki5DEqdlSgZXeKJNzuM/f3e5lQsc2bxnjAE9KKtHvlTg1IhA
	FKmp4W8RS46yVvQuBWiDNWR9vpY282KZtr2/v9pZ0TxZG+e4TjC88nBSZuSmq9bADE9DS4PvTf5ZD
	a3cfjrkxI/qfNBdaIV4QIh5a1XmrS0sFDNrABNU/Pu8YF+Hc56gbJpV/b5RtTVl40XUcIososADZh
	2EFA5FUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8za5-00000006RAu-2nG5;
	Thu, 07 Nov 2024 10:17:37 +0000
Received: from mail-am6eur05on20626.outbound.protection.outlook.com ([2a01:111:f403:2612::626] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zTi-00000006Pwg-3s8M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlPUZhSJkHJb0xN5X9Dgd6cg/b2AwJiSocAK2ePhBIMf2bJco9wJ0bM1ooj2JAQkAFr3Mya8adfvcvPIh/WhsLT5WXTcNMqm1KMJ6s/PrMoZ0nPcelYdtc3f3JPUVDPgDQk6CcNUUuAlaC9ntjnc1tXmzrEx8l4BtCCEitZBUp7repbfS73h8ipq9Y8cLkzy/tGAHhYR9ZHzvo0o076CqA6GuVHYRfUTIr24NO2cdJUFZrAhMKX/ug+yu95AnC4UPyQybM0BlyrUNmBt3q6ur+eiUWQROwR3RdFACEfOau8DGLiUbfnjZYy3EmwV3GlGUBl48flEz9Glt2JC9GCUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3tnjdf9vw/udV24JmpTNkCVenZwSRuG1YlYfCb6FGI=;
 b=rszB9FN+/DJ+WHPOTSMNXp1fr9RuPwKNb7dHNhYTFRB6/3vVHB8J3w/p9Ty2vYgGFkmrpYvlDsEa60gpNbJTF2f/H3mp7JOaMsMLJc/aKIb6L0ehTSEsvk7SmphRI6uupM7qYXREFl1OvgNqb/mVQna7N7BVulDlE/LH3NibuJMqb5TLOO1VPRFSYfjIevAu4jyDhUXIsrALVUMzlf0EkCEJ2JSpNYCgAL7CeuUNaF5DwVVpPgUeAOU01ZaPupkYXSVCM1NRAy4ymLGxLqxFpQxpSoSDQ+hvIU2mMguhPWlrbAqlLL1wSSGQJM4WZOEq3nvDpP/4CGT731ipj0k6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3tnjdf9vw/udV24JmpTNkCVenZwSRuG1YlYfCb6FGI=;
 b=EEjgDuuJBeFZyLlTQ0Tr9wK/2CnqNgnj1bEzYcLHD0XrLOcsI/fRJ1go3rcqb8E1g0USgtuwscxcFeLff2RsrlUQ6+ilqn680bHsyLwzcSrKrCHLwm1WX2a6b+hhkXutbrzdEH2QCoKu6n+fIj2EI3Dqe3DAT6e5olGCyVU3qnxRtd9Yc/j6ix6zOZsgC3vyFlwGzPnmWCq/gJRidTJjUNVbkDp4vnygvj2wn7RYZ6pqUlg/5EGVs2CVWHsJXTBXyiXKOLLmcXM2CiHYAQKe8ktSFeLTbewoxgYD3vTPJaVMoIKqPSHZfrVhoABmSlQU62d6L0g51UAy45dGqjJcig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by PAXPR04MB8991.eurprd04.prod.outlook.com (2603:10a6:102:20e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 10:10:50 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%3]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 10:10:50 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	shengjiu.wang@gmail.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
Date: Thu,  7 Nov 2024 18:20:07 +0800
Message-Id: <20241107102008.3626023-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241107102008.3626023-1-shengjiu.wang@nxp.com>
References: <20241107102008.3626023-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|PAXPR04MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c7bb1b-7c74-478e-5384-08dcff146eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IEs+iUGcuO9zcY3cBzlpRgZiiOi0o4dnQ/b02bdi5K0BPjnXYf/x3lLQkSyS?=
 =?us-ascii?Q?a2+wWNCoO2DVE0UosYto/Zp5lwGbcLf4v64JcfJWuXgKp7Vl85gCiooY/qY2?=
 =?us-ascii?Q?jROM7VXqCM9BFlwozWTiLiBNaBNB5GthGxjaSV/iTDiUm584/TrIraR2N/Im?=
 =?us-ascii?Q?wH3qzFfDeMTj7ifmacGZ4la6Fn/FIWE5QxLOmJH8SZMsy4iX/g3smw4svdFd?=
 =?us-ascii?Q?5JjDsigsvs8tZ8WI6sRqq+68d00iaKbgg0K6THc2zGsEERZ9i+6J4lGbP3Yd?=
 =?us-ascii?Q?DQ6UxmVaj7T4aho4aituT5vGMODI2RZL+13EPCP2P5SzqjCqUCOEpkqPVNV4?=
 =?us-ascii?Q?hVdPCSNfbsKHC7nSX+rn/ZA9FbinrmMA36W4nDldGwP2L73AKYaN4uVj3/4r?=
 =?us-ascii?Q?MiS4ldC5QoePFBQoRd+UbIEKb2q3ujJIGH7KXic3pmow6lIBmuDfawvgM4b/?=
 =?us-ascii?Q?wlxvh/7aKIzEBAYHOWdLnyBfleFA+URAq2kP89S6gu2E87DuPGir9LFqqaQQ?=
 =?us-ascii?Q?rNmgZbWmQYIgbFZj9zpZ2gJxx8jM9IPQfUH14qVKRjoHlHzu/9EppMtL2bXv?=
 =?us-ascii?Q?MCFos4pmkiXO2S/Hc3z4Bc4vnkP+7r7H/+OhSgamK2juKFvsfMMLmnEqRgKT?=
 =?us-ascii?Q?pTsZg92O5o1LXd7tgqQ49XEgr/E8f7+do4M743PoO2Grv1TIqmkyrZGVZZsa?=
 =?us-ascii?Q?Mlq42zUmwp1o+dA/AS6xYTLkuPKxG3DZEaaA7tdSftF2ad5MkzCAgt9gVG9b?=
 =?us-ascii?Q?0Y6yvPIzpdwSO7Xe8ey4hVsYTbHusAAEMG91Y89JEw0Bw7SzQue4BJh7rlBX?=
 =?us-ascii?Q?WarFSnmEaclK18rrcpIi9Yj6A66bUdMVLeuI0ZSRkk989xjfqp+dVH52qOhx?=
 =?us-ascii?Q?czgBhlJNzSBpy0tKIkZYF9FAdu+9IYLrz06yyFD3F3H0OPh8Lw/gWuBbRLTN?=
 =?us-ascii?Q?Vyn0GrdrXtdQsLSpZcO1cBrAZQ0YMQTPzgvXssykOYSZdAjY3PC0gWUp6TX1?=
 =?us-ascii?Q?fBxRmm5X6EiNvXgZc4/JcU2quTd4oXi4Wy5Q05Z654+HNBWWV2tcogES4g4a?=
 =?us-ascii?Q?PdAhFsqVlPNc3SOMChony3U+WylplY733Nq6FiKr1509Q/m453oTGmXI5KfL?=
 =?us-ascii?Q?GUAgL0vcgOsnsTWl6c5OSi88/0J10lTFSRD/nR4MugYiZ+AGJPxf2P2ZzHR7?=
 =?us-ascii?Q?td1Hb/RRMby34XRSXnrBOP35c6ieg7EK1mLHUtEjoEIzUIWvu7hdRbJYW5Mp?=
 =?us-ascii?Q?bu/iHf2HLv+cmu88AoU/sXbj7xABVSjiZ8mTGdx+vVhz4Jnppdo8SNThjK7f?=
 =?us-ascii?Q?NgK9PJgL4ji+WM8KlYNPMCtBVnqjqS8ZKJNrN82d7yyVy1mF6EkmjGpnnqHV?=
 =?us-ascii?Q?QMp+KGuVwLQNEpgVxunBSiJ73W8x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pD2kFEvtvq3iY6qWgIQKOnQ3pAYyU9fdu2Fh2W6WBlCrY3RxZKyoVQmlwQYG?=
 =?us-ascii?Q?m6Hn2pL4eWjSGW6NivekaeGhPOIlo1qp8TYBjw4dwi8om16Vb5ATqeiZgJMq?=
 =?us-ascii?Q?3VbhCz9LjIWdX+G1kAOiWvNfp8PKdgBjgg/vjeb/rIkaWeoXObYTZos6Ls7W?=
 =?us-ascii?Q?opALhc7YnFwjazFn8b9V/LidVGMJjz+iqZhbuLJPhoEY1j1nxZxc69kI6nqr?=
 =?us-ascii?Q?nTkxtVPQjFwbvvJHQEoCWGeOLNb5ma7/7vGbLkwLl+wZiOEBLxfRbpyiS9W5?=
 =?us-ascii?Q?l3AlEUMUQDHViC4L0ETnnEG5GZDLFFV10MDQuldDNmqoY8ZboTjjE0Jc0VlK?=
 =?us-ascii?Q?Q0Wxb/mNYXN7GyLMhZ/yE2NscMK3FotSHaHjMQsmOWczr6UuCT0ibNbpZLpm?=
 =?us-ascii?Q?A3BNQeFSCP8xDHzM0ni1W7GKNt11sD+4QteCYdbY6cYHjgA1jEvnqhFiP6E2?=
 =?us-ascii?Q?gmW/qcWQSgRgy0nxPn7pz7r8S+5y0nCcDComPKWZWNAnCtTkEDxEBC1GAHnR?=
 =?us-ascii?Q?BWzOABQ5N+h2BKiTQF4O7M/v98BtELDxWbMwbrHteTPWnYbI7pyvIzzl6TMq?=
 =?us-ascii?Q?CkAalFx8RykewmEcU74gAm9ZGV8Tn4KomAaYxl2FoVb9ORyhcL0lrZEtlpO3?=
 =?us-ascii?Q?vqudBIFnku3OcFm6alw7cCVgVEcjwp/3FHsSWCzIPyl6/EIZR+2Ie/0P2V07?=
 =?us-ascii?Q?exZ1YDx9MhJG88uFNaj3us7dfBv9VhxB7XjkQKD1f9vs3FDFPQNqaAjDY1Tk?=
 =?us-ascii?Q?rFsO7hwevluRxKZmYUYnQxn9LL5qhzxPbrNFXOu3ew5tvkrOlp5oYomJSMsi?=
 =?us-ascii?Q?g+ePAswsc8RAK68fGcDpfL9oPW6x6Y4ZP1+pVVrsNySEPvu5OMGuL5HziOaS?=
 =?us-ascii?Q?SEZzB516+yFdKs5CYx930918YwMsMsXIcHMuLoYJWQY/s5i3tlIfpBQheOxk?=
 =?us-ascii?Q?ULS7orIqhjjbCVQihgvGz6rzVGEfCNzuiOea39wWE7kIzb3+3ELeksOwqlsk?=
 =?us-ascii?Q?spdUf38eKigN1+UZnsTcXJI4+geoqINZY+AVZJ9X7fEcSxfu6RWgaAh7NCRk?=
 =?us-ascii?Q?hxkWbN9neSmLn3FV+JF4eT0vXpzpZttzk8yS9u6rjTeHYh/D2SU1cChdj2Gw?=
 =?us-ascii?Q?HV9zZTn7xQnhQwmninJHlCrMjzVwLkdhFGvyajJadFpFJTRU9ntFw6RUt2l2?=
 =?us-ascii?Q?sHQJJyeAu4DfVfPI3vCdmTTAfONHPHbbw8JdhXJDIO+qHty7mywvdE6h6TRb?=
 =?us-ascii?Q?11NhOLvMYBPYHpaKCcEUMVzNMmJUYHI8IFlfqfkh9hsEh1FdOUvMSPJ11CTS?=
 =?us-ascii?Q?J1CKVTv2DZaEJSMAo2MSQi5Yob1uD8iRP0iBJ9gO4NQwdK5EDI76STkA1h2M?=
 =?us-ascii?Q?vajsTkNTkUBpERG3wiCEZzGzpJznBqIwKYSpptlgc+fgujN5LfJrJDYA/hz+?=
 =?us-ascii?Q?B/lcWoKJjJ7adgDhnM42kg2LHJVUvEuJFP5EOzwyesv1CcJE0lw2Gc8yETQe?=
 =?us-ascii?Q?peHTWSQflBwZVLfHzXotoBeWcamgaTLFTJ3H+5edrY2SJ3GkXVu0IjzkNKwz?=
 =?us-ascii?Q?qioXGTrE3tD304H2g48IlaNCF1xKCBW4y5lOZPnj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c7bb1b-7c74-478e-5384-08dcff146eed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 10:10:40.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYFNObD2etF+OuHpu9nMFjFzZUTss71FzEOyBCskof27GeZDWOUr95ptc+7D9t3P9kf4AR/0KwR4Q6gS0k7Hnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_021103_000116_C6834331 
X-CRM114-Status: GOOD (  12.57  )
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

The IMX93_CLK_SPDIF_GATE also controls the gate of IPG clock
and root clock, need to define them separately.
Otherwise driver disable IMX93_CLK_SPDIF_GATE will cause
IPG clock is also disabled, then register accessing fail.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/clk/imx/clk-imx93.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index 58a516dd385b..eb818db008fb 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -15,7 +15,7 @@
 
 #include "clk.h"
 
-#define IMX93_CLK_END 207
+#define IMX93_CLK_END 208
 
 #define PLAT_IMX93 BIT(0)
 #define PLAT_IMX91 BIT(1)
@@ -38,6 +38,7 @@ static u32 share_count_sai2;
 static u32 share_count_sai3;
 static u32 share_count_mub;
 static u32 share_count_pdm;
+static u32 share_count_spdif;
 
 static const char * const a55_core_sels[] = {"a55_alt", "arm_pll"};
 static const char *parent_names[MAX_SEL][4] = {
@@ -252,7 +253,8 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_MQS1_GATE,		"mqs1",		"sai1_root",		0x9b00, },
 	{ IMX93_CLK_MQS2_GATE,		"mqs2",		"sai3_root",		0x9b40, },
 	{ IMX93_CLK_AUD_XCVR_GATE,	"aud_xcvr",	"audio_xcvr_root",	0x9b80, },
-	{ IMX93_CLK_SPDIF_GATE,		"spdif",	"spdif_root",		0x9c00, },
+	{ IMX93_CLK_SPDIF_IPG,		"spdif_ipg_clk", "bus_wakeup_root",	0x9c00, 0, &share_count_spdif},
+	{ IMX93_CLK_SPDIF_GATE,		"spdif",	"spdif_root",		0x9c00, 0, &share_count_spdif},
 	{ IMX93_CLK_HSIO_32K_GATE,	"hsio_32k",	"osc_32k",		0x9dc0, },
 	{ IMX93_CLK_ENET1_GATE,		"enet1",	"wakeup_axi_root",	0x9e00, 0, NULL, PLAT_IMX93, },
 	{ IMX93_CLK_ENET_QOS_GATE,	"enet_qos",	"wakeup_axi_root",	0x9e40, 0, NULL, PLAT_IMX93, },
-- 
2.34.1


