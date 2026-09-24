Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A37C98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=02HH54Jxdo6SkdM8L/jhPn3pO4rb1Ubx2oZIP7unn84=; b=atjUHe0xPrVYovYf1PsMVpaZ4M
	lp6trdXX1HbHJsZMBV0Kbd5Pmoks0U34aHdcPSVNMwnanoq1a/7KvML0X73q8BJwfCt4xvaEDf64S
	29EGJ3vHMC4E+kOjm1fLDXDzYGsgdFuaC4mbuin/Yt18/Lty2pFC4TnplfnzFJI3rpaitFyahlAc3
	0BVO6gni8GYgAWOhqoGu3n7+z8kh6bB6WrH6NMRHaN5Ja7Djk/TTQTYGwwq7Gc03FRhBwxC+ocAuM
	ttk7RhtN7DztnewQxS94xPz0EX2ujpexGJq4XRl9bPF95jpSOtzDyabzRlJN/BFxfeeXJ1UE536zz
	Kj9Kt/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ewz-0000000AS27-3pIA;
	Thu, 24 Sep 2026 08:37:05 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ewx-0000000AS0U-32w3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:37:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P15TEeEXA1hj3kZnjzdEWjCZHG4rzghpEVzTGY3mTVVbK2ONto1f6xtQT1pZhtbwsPQT7SM1NDv+v7MQSx7h0t025SHzbNsZTJUUvLiaS/WivyqPREiPoM33ZI3mSZUMXMTwzkwWKP9Tg6Fr6wSFlspisXwedZPYN+GXe4DM7sOP9BrRmCk0k1iias7C1g65dqMUqAVHLbV2mSQgkkq9BEIk3WyV4Jp5Aw73tsnAesmdva9RGZ0KKMX5hGLvsQF3eZ0mmg3mPtPt8Nw5zlmATh7I72nmncUWxtVeva3slXBnFLgvkUM3P9+yieDmHsjjKMjA7/dgprAHVQHvjkh9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02HH54Jxdo6SkdM8L/jhPn3pO4rb1Ubx2oZIP7unn84=;
 b=pkccV1BcriNNonGc4B1nAbEWYy3MTI664eBlr1WapgINgdDQLy9xL5ZVS6bgfRwtapKH/gnAVbJDvZfRSTnDi6rfTxkNm8l+ho87qymzLVf5xH1k+IdLi/OAoC2uEOZfQnPnaZC4gP9ujOdk/xrC62GbAzuXYNXryrbjY175lEfO87o7HloXZ3AVMY+J23fREymKgpuCg84WEVkevStK/eAsjKfx/DmJY39V3VsXbyirDzxejd/Ve4O1sdEcC/wCthd29MI3/1CL0nLA9HPghcfe9JJSUEVXVYCulG8kzsp0tT6uSGW3n0RJY7/1mzvwuYVHDHW5MnceyxvHIdCBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02HH54Jxdo6SkdM8L/jhPn3pO4rb1Ubx2oZIP7unn84=;
 b=m45AY3lgi513c2+qOgFAtKZR+OEGdLyTQkKapt+KymeCW9SoEf3zzQjoO+dH/AwXZ2lvpA0wOVYrihgDVVbWRs1j/1Z7mlRxKEwVpjsrf0z3cI92b/bcIuUqnETp/TPNvNN75bUfeiPQBe7Unk6Z2lVeEpuLnv9SPUEHhAbNQGd+o70CTR1tNyN8BXMpIbBi2kMeCYjIkpkYRenUfTA70ynDdJlLQUjwnmQ0JCIcRuyugUG34aOvxaRLc0D43pJQQ2y4/6n2a7twrQqwTfB+M6XfyHm4GTR2s6dw/Ug19ls0979Dk7Wp2lIm+CNJ8fl5AuIXJUf1zlvBgEY+mDbQ8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB11339.eurprd04.prod.outlook.com (2603:10a6:10:5ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 08:36:58 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 08:36:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH] PCI: dwc: imx6: use regmap_assign_bits() for conditional set/clear
Date: Thu, 24 Sep 2026 16:34:28 +0800
Message-ID: <20260924083429.461746-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB11339:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ac0b56-9314-431e-8138-08df1a16ff5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|19092799006|10067099003|56012099006|11063799006|18002099003|921020;
X-Microsoft-Antispam-Message-Info: oMTBOJXNsjASu3xZMDVmBeaaNagxMk/ffsLOquNKgRlALGoaf/xXWMXiOzPYBHQ7BMXlLpzIEZsMgSLsmS2H5cEQC9mkqDmurqNg5AmMkO3/3IQiq/n/P/IHtCG0frjBhzNx6OCaiPUtH8huDnpI8IXyxFHm24aO0YRItBdgGAheLOffo9STO566qWBheF2MIBBasy3jiPzd6qjn7TQgtZrruXZe5i8sFzoTsSwHxX5xEJG7955MbOoHlW/FtXa6Uid6oji4QhYhe+OK3dG4No4kNBU4wX+xMF/PF9aoCNhIeC1JRG1h+i6CMoXCz91OK6weTp07Btb7xLG70zsRm3KAOUy7SuqtRK6PXN8OlB2Whr7bTB1xv7vikdiPOPu0tqcp/ZO1rRq/6DMoMpUFptx+M9lKAfGeyzevHudI5sWABU5D1bMSPwQfbKlBS3MkihbRAA3AJRWZUaud78M+q+tQ5TnHKMbLhT7p5hKrHWKEKRS6oNyite+UpUhMvCcOryzwL6pD/BDFLx23rN1rQ+BP/ghs+Pufj65OmdmjArX8Aa69a5ReE6AetPAXN0cOCZopbVR0lo/0N2IIZOMwLUqRTimJkbcS2Yb29tRPlxKvj6L32ukcqK564bdc75gZcZ5kCiI1y3qDo1QAY4jXeWN66PVIaKLPsKJ5YoZdxixG/onhu1V9i5+ssTcBmipuOIS55X8AA/nVm1NlflMB1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(19092799006)(10067099003)(56012099006)(11063799006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F0byQGaIQJAWNmiEd5rkItje7aBVDrV8UunoZkF/t2QEPVHpF6pUyw4f1R29?=
 =?us-ascii?Q?T7880g7uv7Y7mcZG6dJ0XYaK+SVn7cAuk8IPriN7BJSzDiyNEJKR2alG6MzZ?=
 =?us-ascii?Q?iEG/2KHbnPLZ4D5M6UlocTEKm1b1dScpVwtELuUGpUHE7NFV8cHlgAtut/8O?=
 =?us-ascii?Q?fuXEj7QHRdV+FoQnFgcbltw55h4OfOMARP/przJfeJ4ePcq1OPwMCGsGtQSG?=
 =?us-ascii?Q?ws39z/IQFUvYM5tPEUfLpQXWsLAgNq/ju8LjL0wIeOqbtpbb1WIaz+YcqyKm?=
 =?us-ascii?Q?mhBtRI1DtgI89c4IZeVNbFQFbcABufzZI/gRgpSQxzGL88veqIQyB6Z1On/y?=
 =?us-ascii?Q?yXTJb26oeI06it6VcZmlBR03Na80EA5/AIU0IhbDf0WVcGPphkpT5MD23iCq?=
 =?us-ascii?Q?u03SsGNI7mimu9QFJ4vnT7kejudE0eZHP1JAiTLo6xpn6oXQHNa/Kljift9+?=
 =?us-ascii?Q?HbKuqV8NFFa8XZUDsl4JZq5UBPS1jZJVdiamqXrqVpK3NK0zNy5p+k9q9Wpr?=
 =?us-ascii?Q?AXC3WEfRuPnY/AiXe8jVznyIQ2pZdq4dWOL9080aIuzAz4eTn/P8gvpMbdsJ?=
 =?us-ascii?Q?Dtt4Tgw0pNpkF3WsMKzE6our8Yk4cIVBUblmmVGGW/BmwpPqQZiqZTeIRB4C?=
 =?us-ascii?Q?T7OHarzgvFjGU4g5pXIISpOneoG5zR5UZVih7i8Io2gr9qQ5ddWLpiPhwkay?=
 =?us-ascii?Q?F34sQ6UjKnPMSnln/DL/SXX7JnRukSD+Z4DSyqnmHcJTa/Yr7do4EqMPbnsE?=
 =?us-ascii?Q?mjbnWHWd0/FqdRFDbqCveR1J+JSLkoBFcBrEBJlue5mstsqT5q6tX4UJZIFH?=
 =?us-ascii?Q?3j5cG/lfexM2i/pvg/FdCBd7/vb41FFs/3JaV5ck2azb6JhBX1K2CmczLnql?=
 =?us-ascii?Q?Tw5GK9hfQNYQZUnZO0t87Ylc00qbPIaS14cUdgVTTX1jXWkhTY/PzcAcTjDG?=
 =?us-ascii?Q?TDFHPunU9kAr78Q0JdSOP84qi18+u3Czmg1loQ0JWTqmSuE1AcaoOC+InuVJ?=
 =?us-ascii?Q?xUkf65YNRyuQaQZ3GiSmFgSB8/0h1Qvr11yHgv50/74BC7V1SAyZ00+VH7gU?=
 =?us-ascii?Q?IBez5MDewOw8k13oFgueqi7kARKr656SGRzS8ytVFQ9Qu0oEFFEfNzhcst0+?=
 =?us-ascii?Q?SSpOQ0WhcJfMle0iinPgY9Xj0+F2zyWFwXV4J034pw1dn/vrT5s7hiwgb2x3?=
 =?us-ascii?Q?TFbex1M5i94Adql7Vzkf6NS1pITB0myMFjOnuuVRJgwUSCiJ6NdmVr5yzyjM?=
 =?us-ascii?Q?DryWQXToY7rLAzkfJq+xYvfHO2yfXEnKfBBb/Svcei3dL3Vn3HittXxYEuRg?=
 =?us-ascii?Q?nIoVkVxzGv2kyH49mQKl6UybherYA5M22IyrzHG2D0ZI0LTIvJVprYdJbHUR?=
 =?us-ascii?Q?kFi5VeKtqbuV5lQsyihNCun54XfaAeeLIUBgw4vaLYu+IoYx2Re7vfDSptQA?=
 =?us-ascii?Q?btaDAZnisPw5D2arrhoHbS0kF/rbEOlZtxxk5B+zTMzt82/bucV1seK47+ec?=
 =?us-ascii?Q?5CzzOEnmjT4o2skcBkI9nFRlue33Is4+1YkZUcwiu8BLJk1EZNYGI3QM92pt?=
 =?us-ascii?Q?+ROM+JeODKlYRpTCWIm11rh140ifgu2+4yyVLE0bSC7A6x1JEFS3+PFDgId/?=
 =?us-ascii?Q?DyvZ1vSMEUrxiLvdIlW/60jRDqM3sFEFIIHCvXqGNxLVyrglg/CyLMKU6jtW?=
 =?us-ascii?Q?GtKipvCpPeLlGD+vNtVjPHB79A2EhLpK4+1TgtNogOy8u8H7/NtAk1ktdDos?=
 =?us-ascii?Q?XJf1zpoIC8wjsX/sbqAkN0m7Q+3FeY/VlyLhudlmUELI+hxWsP07?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ac0b56-9314-431e-8138-08df1a16ff5f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 08:36:58.8486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrfepesmHZGWlwwTcTTpqy6M1lJRyCgZBYGRAeT6pnkVm0w5F+9RSnY1bUzTfvUhh4F5JR8HynAWuVkT+i7786eDxypI26hXdvG+mwZFszuOtTySrb9St8CIIf/pgk5j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_013703_831393_D384923A 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Peng Fan <peng.fan@nxp.com>

Replace multiple if/else blocks using regmap_set_bits()/regmap_clear_bits()
with the simpler regmap_assign_bits() calls.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 32 +++++++--------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 28fed010b503f..e2e55a88e0132 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -747,12 +747,8 @@ static int imx_pcie_attach_pd(struct device *dev)
 
 static int imx6q_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
 {
-	if (enable)
-		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
-				IMX6Q_GPR1_PCIE_REF_CLK_EN);
-	else
-		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
-				  IMX6Q_GPR1_PCIE_REF_CLK_EN);
+	regmap_assign_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
+			   IMX6Q_GPR1_PCIE_REF_CLK_EN, enable);
 
 	return 0;
 }
@@ -868,12 +864,8 @@ static void imx_pcie_clk_disable(struct imx_pcie *imx_pcie)
 
 static int imx6sx_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 {
-	if (assert)
-		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
-				IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
-	else
-		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
-				  IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
+	regmap_assign_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
+			   IMX6SX_GPR12_PCIE_TEST_POWERDOWN, assert);
 
 	/* Force PCIe PHY reset */
 	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR5, IMX6SX_GPR5_PCIE_BTNRST_RESET,
@@ -883,12 +875,8 @@ static int imx6sx_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 
 static int imx6qp_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 {
-	if (assert)
-		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
-				IMX6Q_GPR1_PCIE_TEST_PD);
-	else
-		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
-				  IMX6Q_GPR1_PCIE_TEST_PD);
+	regmap_assign_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
+			   IMX6Q_GPR1_PCIE_TEST_PD, assert);
 
 	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1, IMX6Q_GPR1_PCIE_SW_RST,
 			   assert ? IMX6Q_GPR1_PCIE_SW_RST : 0);
@@ -901,12 +889,8 @@ static int imx6qp_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 
 static int imx6q_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 {
-	if (assert)
-		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
-				IMX6Q_GPR1_PCIE_TEST_PD);
-	else
-		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
-				  IMX6Q_GPR1_PCIE_TEST_PD);
+	regmap_assign_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR1,
+			   IMX6Q_GPR1_PCIE_TEST_PD, assert);
 
 	if (!assert)
 		usleep_range(200, 500);
-- 
2.50.1


