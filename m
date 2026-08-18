Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8653BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AR63W86huyTC+rw0PzA57AHSP66X1TTLmySgglMpyT4=; b=OqLJzjw6asPmCZld106tYhekR3
	MpN5nezuBgpHKJrrUq1M0Gd6IuFNE0FZDxJQTo50HR8eb60SmE8sxQHIPzVq8snKtEAZXB0PHa/4P
	MKq/hkYqXGBR9ZmSlveJITs/ypxP7OyQSE4esIIglOk/JKJYEINrNxYkGg20YHgcNHOOuZ3DiE1Lk
	f84gZQgfEcWgzORYudERl1DZ0e4C0FdV/0q5ePLXunXyo23odYtIHAmMjTn8wMZFjwLs2taSzsuQo
	lMFLRiCGm4pGV8EWQu4UkONZzf5a/JgDhLz1CXTRYo3/FDdW7rpR1qf+itH35oIMAbmZMma2W0s01
	1ohbZuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA6r-000000078fH-3u4x;
	Tue, 18 Aug 2026 03:03:30 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA6o-000000078bu-2WG9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:03:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rA+1fqYBtPh/GGl+mEUNPjQ9suItrMNGjT+63wEQTiUDlFe0IdU8u+bSSx9Ezuxvl4ehlvzRVKEmZ9ryO1KOL0Ic/lHHpLbo5tNPgZ8YOLrwSzLJt7m8wTmihGDG6fSW6ATJv3Wz4Exc88v9746oHTC2fx1/0PYhfbe4Tr7anv1XtevAB5jxROHJ/PmiW6NDjDwwmbqN8Kf9iyw/7uzm5jsmO8C3X62wMEwyOHDpmp5e/8U5kn+TUbQosHMTfq7YaFeL2KXZqsdfkj1hPEEiV2KhGOW7K4MQ93JhpRpjDVfdwjbY38YP5Knll4gz+O5/Ssdng1qmxPYlUqGsKbhG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AR63W86huyTC+rw0PzA57AHSP66X1TTLmySgglMpyT4=;
 b=ZFHCM4N8Ocj7/5l///4N/txp9mk/g70HPBJCDJ1JcwEUAMFH2teEDVGIvD9FVVk0wFlgjCHsfKg/etH1G99GP/o6Frzpr5mBYFT6n6tN+vo/ov00CRWahnADBw0tYnrLrA1iPO6g+LwNA+jYhnDxM4pXd3Dh6xOQI7EvHpTUUHPTACAOHO2lrWDVerPWZrlTc5IDwIc14oV/OWLcrVRmibOvxPJVL7N0VKyDeTetZNBE+P5G7YcFxfcOW8ZShEYQFCYuW0Gfrb270eWxnp+nN5gGGNYmcrUsCpHL8UshJiKL9RIGgXfRqceHq97as3aBfJ5UvinSY1q/tG6Y4q0Tvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AR63W86huyTC+rw0PzA57AHSP66X1TTLmySgglMpyT4=;
 b=YmDebGJL2MN2dcDsW/MkBw/ipY+Ec5d6NvTH2eXwnRhnfkWtnC0Q5qCNNqOTrHnJC4e0oh/ZzDf7TwG/kjFBkI/eHWoi4/BhLQ6yqlKu1GS98sKOvMuS3rznBbjKqkXRBqag1q7OEPqpUAej4yzAxoixbBPzwBmzC1dLa4AvzD8gayKYQV7GswAqxuqb9IIsFBo7upWouOPJte8gBqBwHoDhprVVIfF01IvjEtNb4bGgmY4mtY6nSRrm1WBMdIZg5a56TOAdU5tVYGuAbPZ5yeqS8ZKIt3pyplidEMOToqvQQuDg4/8oZ81DRfuVUWhZ+VxHzFEwU2TLoBSDnOZ20w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:03:22 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:03:22 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/17] arm64: dts: imx943-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Tue, 18 Aug 2026 12:02:04 +0900
Message-ID: <20260818030211.3141710-11-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::19) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: 737f02d3-8d29-4378-af6f-08defcd54353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: 0eBeffvKRGSCMVxM+pxQvQfHCiDoqQvfJitX+ehDTTSOKiniIKxhXv6anuSt3SiaqxqmL3aaoZBgQhkJE45JEUytaTnJRc6cOWqYfN4XJsSiz/s08q5xGxkvPXfjruGPeFcW/BaQAxzk88x0IrC1GfAo5QLHLxN9L4hZgWL2xzGShN/j8Aw3u8DQhEzHVGd28LDEoOrkD019O/aZ4w1wNBO/OAek8bq4MZPYEjj8f2tUY428sdy0InTuWsM5DX4jaJXzJghVjihIMzPuJjsgYhufS8odhDReKzmVVlHkju7a6QcvJtUpsrZZbkVoMZhiVBQBawhj0L3X4jYvzoPbJxndfPsQRvLSF60+PYy3pJbBYiAR5s+VG9PdbEi2m54CkIl9JyY7Q+twsbjxGI1SR8EYdT1f2vdqFn3e/+kZVty/w+AzMGoZRH5zpT0n8MmaMa73fv4ba8bclO3TsvMJx93cbgPiXo3xVfANOOkJqhepzQvhAcjcQDbFvxcDjV3QF5KfjOXJ6iGFX1moybr1ZCjRC7uOHB+qr+I1iDMEINLqzPDu8Ee7U30pM2WNswiwu4sk9hOAtMzIx3mCLSYAmkIn0/BgSAatNdK6BVH6kgQDc/xmUIRtjq3V+3f/gaewD+quy/S1G8DlG+NQCFqjS+l98pS16XtUJNlanfljsug=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jZXa0lIDey1aFRzpoZ8MMDJJcB6Fw8dQnZ5w/YbNxL64fadEBQweei52Dplh?=
 =?us-ascii?Q?QvScRW2pmqEo7NBttXVcOTatclHET4ee5MwSTjd4kR8ECbmGBsExlNRU/4V5?=
 =?us-ascii?Q?kNqLtafN6TX74zObgaIXQAhP8lr7+fX2KDYEyqrjZ0SN18mpPnyHP7ATvNxX?=
 =?us-ascii?Q?mAlilzXvGlm/cO1QF+rGLH0WkjTWghn7bI+cKIcZqJRpbLjIHUGDflQ2qmr/?=
 =?us-ascii?Q?+BVnfBbSgaXqXHw220rPJOJvEsYTDZFz6ABtJvBoa/Y+CNg/srolhAx25k9r?=
 =?us-ascii?Q?3kyAUgJy7JTpEXtreS54LX3e9tGhDKMS7jgViqMLUOKJWH7hZ57QIS4VJEYZ?=
 =?us-ascii?Q?Dj0owiqyVPUcfLi5XMZb7yHg3oUhmVvT6N5Cte8c3oBGjhBVvgZ6vMtUk4AI?=
 =?us-ascii?Q?skdV2eOBB6NxgEWwxuFE3d36HitUBuwZ5XiWkRbB78SVFUdyy+kbOvYvRRE/?=
 =?us-ascii?Q?f+Q5iGIqdT/MgNe52Jeky7kj0jraFRcCi2YcessNtVD2lEC7icAo+dCtb77F?=
 =?us-ascii?Q?NTszbKKv9qFYlrA2wATQICm0sk09aIVSRZk9tDcfy3dRVh+UHJsIsfj5vLN+?=
 =?us-ascii?Q?hVRyFg8EV5cvL5ix1IqcGaozJ0Pb9107xsuV33G392/4KWKHxQUxHcc8VjTr?=
 =?us-ascii?Q?i5CHFCc66xHikhxJPF+08hw1+dEgXLDCyHk/Nf/vyvstz/UUDrNQvQolOXFo?=
 =?us-ascii?Q?u++DbDfwVBtngJee5H2BcYXoh5XP3wqxhpS10XKUS7pBDBD7PAVWOoRBxDCg?=
 =?us-ascii?Q?2eU8D12lW4j69cGpcRVxEUWu9F343knOpqQiN71d2Bc0UBH741ThfhVrSEi/?=
 =?us-ascii?Q?E00BP882btkFqNmebPObHP6Ycfp+r41DW+JUMV+pQ8Zx7df5akbfMDi3sQdK?=
 =?us-ascii?Q?Omd41RELqnY7xuPsi3o86OSlHJUpRI+ky5lvJOaAj8R6WzzN+2DsOr6chVJT?=
 =?us-ascii?Q?QYt2p1vlQrj/vOehAjff2alw6NPO5Biyyh/+gCUI7hzablrRVtX+CoIWteBF?=
 =?us-ascii?Q?g+889suRjpG/QLE6e0fmllf2dXDTRtfi5xnGLBudY3y+uWuKzsk7sIVLrkXZ?=
 =?us-ascii?Q?s3QAp61DXiAxy5EfBeXiQw2qNjswx0+NT4REgo+aY7tXtiIRxPQZgZ8YjB5W?=
 =?us-ascii?Q?pR+ivIQoWypUshfLi1oQoA3q/TgGl04/S/Jt/tkyhJiXQ54fGbRm3Wom4tHr?=
 =?us-ascii?Q?uzm8AWc6hsVlqwbTndHKggSTjjAVHu+TAGUxewjyjRo08YzWbJLdGnjfgMdo?=
 =?us-ascii?Q?GG2y2z6I2GIVu3mHlNK0BOHBzBZmR5IJnXmFoCdruhVU3Hx7UJgVFQVE51L+?=
 =?us-ascii?Q?lwGTx/ZKGJwdOdR+MgHmgXivf6jxkwFpEKwPKljf6i3oZRev1+PtsI3SOeGN?=
 =?us-ascii?Q?+jWKCmmkecoVTOe8TOlLz+oomjlDdYWVGJ9tBwfOjyjaOttutucaFFoeoz8V?=
 =?us-ascii?Q?E9OdciFqj73tNHnXjHLhEwIfMt2fHkhs+OeI3o0nBVrv+ywBd3qXGOS9jBSO?=
 =?us-ascii?Q?dNFDErEMEAHXGKPcxClhM10/SS6rpCtv8rUpsqLQMS9kztspNVLh/v4wQ89M?=
 =?us-ascii?Q?WqLH1BfE1gEqV11ygNaSo39mb05uVI34Wes4W+krlpNWDTgyVtRSfb3oebSf?=
 =?us-ascii?Q?pILLALjbfVrrb+utqTYARUZa4WaxOV/mwP1hGp4SeTPryKvIDRm5gRIQIRL6?=
 =?us-ascii?Q?WNWRBCORAaP2HOFeD91+pqZks7fwjI8VdBVR0nJ0/bpRx0hh8a4pxNZcFhxu?=
 =?us-ascii?Q?FT7jqEvzcLEkif8iKNZ8CMDn/iAFtZgIpSfQ4g9SoDOksavzhIYt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737f02d3-8d29-4378-af6f-08defcd54353
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:03:22.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2t1ji5De0kidiPaEvgvi1rP8eaVLsl4NYBgWvkvAa6opAhoqzkFBIQm01ZkJav/ZQJoBPBG7AF4+8F/ABtTCRuiR6Vl8AFUEX0tU235WwNvfafgQ+oTw0QbrBBkxUd1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_200326_658639_D59E01D5 
X-CRM114-Status: GOOD (  10.84  )
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

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the WM8962
sound card. Add the MQS1 pinctrl group and label the conflicting device
and card so the shared imx9-mqs overlay can disable them. The overlay
and its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 21 ++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 07b782ef698a..389def180b6d 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -341,7 +341,7 @@ cpu {
 		};
 	};
 
-	sound-wm8962 {
+	mqs1_conflict_card: sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		audio-codec = <&wm8962>;
 		audio-cpu = <&sai1>;
@@ -720,7 +720,7 @@ bluetooth {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
@@ -736,6 +736,11 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>, <&pdm_fun>;
+	pinctrl-names = "default";
+};
+
 &mu11 {
 	status = "okay";
 };
@@ -782,6 +787,11 @@ &netc_timer1 {
 };
 
 &sai1 {
+	clocks = <&scmi_clk IMX94_CLK_BUSAON>, <&dummy>,
+		 <&scmi_clk IMX94_CLK_SAI1>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX94_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX94_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
 	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
@@ -904,6 +914,13 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX94_PAD_PDM_CLK__MQS1_LEFT		0x31e
+			IMX94_PAD_PDM_BIT_STREAM0__MQS1_RIGHT	0x31e
+		>;
+	};
+
 	pinctrl_pcie0: pcie0grp {
 		fsl,pins = <
 			IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B	0x4000031e
-- 
2.50.1


