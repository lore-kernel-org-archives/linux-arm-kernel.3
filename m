Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA36BCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVtf2pQp/0IRBXuQ57ceA7mPcsECGPpSxWk6BqT/gNo=; b=uQHLsol30hT8irCuK/5Iy/RJkQ
	kuaik4lxBsUSJDlYRs25rKMKdbqlurMgUpVy/AP5aWnk5yOaxvQKnrazMcKp262s7wQRY/7P/kxNN
	8IvFzhr24b30gzLVayjkp2ASqJ3hGpb/miD3wZR0F71qKDD2VONDMnuWGVehFhx/LXdKAxY0TWx1e
	Ns1cGeNobgdec+bCVMTOZFdmmgcPm+jsxIMTGQ+AfJzRzIlyPdHFy9uBK2kciTyiMyaO2mAixGGOy
	2lLSIUj3BvxKewpaXHStqXJkWe6lz6XGZwviY8TMXi1bwo+qrTITuCFZUCi0ACiUyQzZCTZa7kW87
	+VRyw9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLza-00000001CSC-1CxW;
	Thu, 18 Sep 2025 21:16:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzO-00000001CBr-1Whk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230187; x=1789766187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=87vLGMW5OjSBWLqBweghZ7yHNC7moDT8cDc12mxnWN0=;
  b=pB1/ILs2f6bkagihq48943dFnFbUd2OXo/rSmWSV/SZX8Q5dVdthU53X
   ZRrAJNA7KFjJKPYZDMMOBX4IkbeivADrPDwUxNRhdiYXJmLF1AWR1/WXh
   EeHC1UBpjNlgsT0pnnpGkme4rvbClxvENuN4XQTPdjRTOrRgA2ai1zERY
   vzvDGK+zNgfTXaR1ZrJ6NW2tqqNx+65bBJgq5944yhkNXApG5i3+cOw4Y
   uy+K9sbgEJ7SzHhX2SC4gQXW/ruexqIezNf8t0oOGWlaLs6XVjAv6GLSa
   /WyYYf2YQw8yieh5S6jAj8yooDyaMSMRAezgdUhWJE3G4KNtt78ZfTJsr
   Q==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: mAIXgCm0TBKiGhgmGwBc7g==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071380"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 14:16:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 14:15:51 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 14:15:51 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
Subject: [PATCH v4 06/31] clk: at91: clk-main: switch to clk parent data
Date: Thu, 18 Sep 2025 14:15:48 -0700
Message-ID: <0f8054488ac3cd658d7a6fc0d5cd4f684ce8355a.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141626_438476_A12A9FC4 
X-CRM114-Status: GOOD (  15.45  )
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

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Use struct clk_parent_data instead of parent_hw for the main clock
to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
conversion of existing SoC specific clock drivers from parent_names to
modern clk_parent_data structures. This will lead in the end at removing
__clk_get_hw() in SoC specific drivers
(that will be solved by subsequent commits).

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to use parent_data.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-main.c | 16 ++++++++--------
 drivers/clk/at91/pmc.h      |  4 ++--
 drivers/clk/at91/sam9x7.c   | 14 +++++++-------
 drivers/clk/at91/sama7d65.c | 14 +++++++-------
 drivers/clk/at91/sama7g5.c  |  8 ++++----
 5 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index 9b462becc693..514c5690253f 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -402,7 +402,7 @@ struct clk_hw * __init
 at91_clk_register_rm9200_main(struct regmap *regmap,
 			      const char *name,
 			      const char *parent_name,
-			      struct clk_hw *parent_hw)
+			      struct clk_parent_data *parent_data)
 {
 	struct clk_rm9200_main *clkmain;
 	struct clk_init_data init = {};
@@ -412,7 +412,7 @@ at91_clk_register_rm9200_main(struct regmap *regmap,
 	if (!name)
 		return ERR_PTR(-EINVAL);
 
-	if (!(parent_name || parent_hw))
+	if (!(parent_name || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	clkmain = kzalloc(sizeof(*clkmain), GFP_KERNEL);
@@ -421,8 +421,8 @@ at91_clk_register_rm9200_main(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &rm9200_main_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -552,7 +552,7 @@ struct clk_hw * __init
 at91_clk_register_sam9x5_main(struct regmap *regmap,
 			      const char *name,
 			      const char **parent_names,
-			      struct clk_hw **parent_hws,
+			      struct clk_parent_data *parent_data,
 			      int num_parents)
 {
 	struct clk_sam9x5_main *clkmain;
@@ -564,7 +564,7 @@ at91_clk_register_sam9x5_main(struct regmap *regmap,
 	if (!name)
 		return ERR_PTR(-EINVAL);
 
-	if (!(parent_hws || parent_names) || !num_parents)
+	if (!(parent_data || parent_names) || !num_parents)
 		return ERR_PTR(-EINVAL);
 
 	clkmain = kzalloc(sizeof(*clkmain), GFP_KERNEL);
@@ -573,8 +573,8 @@ at91_clk_register_sam9x5_main(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &sam9x5_main_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 9b0c641e747b..13d125793216 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -198,11 +198,11 @@ struct clk_hw * __init
 at91_clk_register_rm9200_main(struct regmap *regmap,
 			      const char *name,
 			      const char *parent_name,
-			      struct clk_hw *parent_hw);
+			      struct clk_parent_data *parent_data);
 struct clk_hw * __init
 at91_clk_register_sam9x5_main(struct regmap *regmap, const char *name,
 			      const char **parent_names,
-			      struct clk_hw **parent_hws, int num_parents);
+			      struct clk_parent_data *parent_data, int num_parents);
 
 struct clk_hw * __init
 at91_clk_register_master_pres(struct regmap *regmap, const char *name,
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index ff9dbaac5f04..f00045d4f425 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -752,7 +752,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
-	static struct clk_parent_data parent_data;
+	struct clk_parent_data parent_data[2];
 	struct clk_hw *parent_hws[9];
 	int i, j;
 
@@ -790,9 +790,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
-	parent_hws[0] = main_rc_hw;
-	parent_hws[1] = main_osc_hw;
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
+	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
+	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -809,11 +809,11 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sam9x7_plls[i][j].p) {
 				case SAM9X7_PLL_PARENT_MAINCK:
-					parent_data = AT91_CLK_PD_NAME("mainck");
+					parent_data[0] = AT91_CLK_PD_NAME("mainck");
 					hw = sam9x7_pmc->chws[PMC_MAIN];
 					break;
 				case SAM9X7_PLL_PARENT_MAIN_XTAL:
-					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
+					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name);
 					hw = main_xtal_hw;
 					break;
 				default:
@@ -828,7 +828,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 				hw = sam9x60_clk_register_frac_pll(regmap,
 								   &pmc_pll_lock,
 								   sam9x7_plls[i][j].n,
-								   &parent_data, parent_rate, i,
+								   parent_data, parent_rate, i,
 								   sam9x7_plls[i][j].c,
 								   sam9x7_plls[i][j].l,
 								   sam9x7_plls[i][j].f);
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 6367fa7efd06..b12d796cbea4 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1101,7 +1101,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw;
-	static struct clk_parent_data parent_data;
+	struct clk_parent_data parent_data[2];
 	struct clk_hw *parent_hws[10];
 	bool bypass;
 	int i, j;
@@ -1143,9 +1143,9 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
-	parent_hws[0] = main_rc_hw;
-	parent_hws[1] = main_osc_hw;
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
+	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
+	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -1162,11 +1162,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7d65_plls[i][j].p) {
 				case SAMA7D65_PLL_PARENT_MAINCK:
-					parent_data = AT91_CLK_PD_NAME("mainck");
+					parent_data[0] = AT91_CLK_PD_NAME("mainck");
 					hw = sama7d65_pmc->chws[PMC_MAIN];
 					break;
 				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
-					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
+					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name);
 					hw = main_xtal_hw;
 					break;
 				default:
@@ -1179,7 +1179,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 				hw = sam9x60_clk_register_frac_pll(regmap,
 					&pmc_pll_lock, sama7d65_plls[i][j].n,
-					&parent_data, parent_rate, i,
+					parent_data, parent_rate, i,
 					sama7d65_plls[i][j].c,
 					sama7d65_plls[i][j].l,
 					sama7d65_plls[i][j].f);
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 091845ca251c..b1b0e9e67228 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1020,9 +1020,9 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
-	parent_hws[0] = main_rc_hw;
-	parent_hws[1] = main_osc_hw;
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
+	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
+	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -1057,7 +1057,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 				hw = sam9x60_clk_register_frac_pll(regmap,
 					&pmc_pll_lock, sama7g5_plls[i][j].n,
-					&parent_data, parent_rate, i,
+					parent_data, parent_rate, i,
 					sama7g5_plls[i][j].c,
 					sama7g5_plls[i][j].l,
 					sama7g5_plls[i][j].f);
-- 
2.43.0


