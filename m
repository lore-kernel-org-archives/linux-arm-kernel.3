Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C058ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0VlmLCGsLBPFV2NaDNVlh0B+9ynwtjL1fhSb42whqc=; b=jOhw/e4L/aFOnN/zOD+MBmmcGn
	Q12ldK0jh4ME2yfr6J52g5BlkQC8xZhOZ8JrHXUFa1QRzK+lDW10tHNDuilI/HYJWzlNQGvo/s1p4
	Geo/pj2db3QMfrNYwY+sO0FSefNFcp17ggFLhYyer17uEjnWNYf4W6ET8YZPIYi/IiP4uWXe//YN7
	sOoz8sR3FVdVhRn5KtuBOT1zCwAXHuVnC2aPKeqXxXYbEH4SEpJvLQ69ZkBMbBAIQe/clK0QfkBCa
	1QbeX19enYwyzsp5qP6vrAPaSOel0hFCURakqhLfP8wx66hL/LUGGWGLaZhbUbWQ61DhMp8Gd/Dzl
	Y44Lc+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzx-00000001Cmw-1Hgn;
	Thu, 18 Sep 2025 21:17:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzQ-00000001CBI-0LTy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230189; x=1789766189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PXB6tTjcet0UbEtDutZyM+jMVOH38XEQs3nmOg59YOw=;
  b=nEioD4zXv45dm4gGn93gWJf//51b7QifwUYyIAcjd2DGzOYx00CY6LZF
   by8OXBk2+CnMMfoNVWH2fm6y8uqUQ5/lbXrZ4PQGs0ebH0aQJs1HqThc4
   Gg7aniqXN47iXMaIJ8KOvwV/2W0HHEUuaRYiogP2WBdYGK743hNwMJOGQ
   tQOLie/OvsVzq8PJVuVFhN+RWCta/6fc8QFWbWjRjbAUfeO8TQbXBjdvp
   r6O4uGT5E192GUtCVx12yCFK4ctdTKWkD+X8sLD7Ww91hT3ZS8VqOTroS
   lJo+EXqeomn1EjzOASO98N6UJ/kBg3ESwLXHt6J9irQ/ia6OCDC8nYUpH
   A==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: qBTcqfinSUmp0herXLu/kA==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071383"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 14:16:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 14:15:52 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 14:15:52 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
Subject: [PATCH v4 09/31] clk: at91: clk-programmable: use clk_parent_data
Date: Thu, 18 Sep 2025 14:15:51 -0700
Message-ID: <acc2a48c53096e7da246eff771654fb43a036f5d.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141628_196435_B7598085 
X-CRM114-Status: GOOD (  16.79  )
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

Use struct clk_parent_data instead of struct parent_hw as this leads
to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
conversion of existing SoC specific clock drivers from parent_names to
modern clk_parent_data structures.

Subsequent patches will aim to completely remove __clk_get_hw().

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Add the clk-programmable changes to the
SAMA7D65 and SAM9X75 SoCs.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-programmable.c |  8 ++++----
 drivers/clk/at91/pmc.h              |  2 +-
 drivers/clk/at91/sam9x7.c           | 16 ++++++++--------
 drivers/clk/at91/sama7d65.c         | 20 ++++++++++----------
 drivers/clk/at91/sama7g5.c          | 20 ++++++++++----------
 5 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index 1195fb405503..275ca701f294 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -215,7 +215,7 @@ static const struct clk_ops programmable_ops = {
 struct clk_hw * __init
 at91_clk_register_programmable(struct regmap *regmap,
 			       const char *name, const char **parent_names,
-			       struct clk_hw **parent_hws, u8 num_parents, u8 id,
+			       struct clk_parent_data *parent_data, u8 num_parents, u8 id,
 			       const struct clk_programmable_layout *layout,
 			       u32 *mux_table)
 {
@@ -224,7 +224,7 @@ at91_clk_register_programmable(struct regmap *regmap,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (id > PROG_ID_MAX || !(parent_names || parent_hws))
+	if (id > PROG_ID_MAX || !(parent_names || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	prog = kzalloc(sizeof(*prog), GFP_KERNEL);
@@ -233,8 +233,8 @@ at91_clk_register_programmable(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &programmable_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index c7973c063b59..51a87a535504 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -266,7 +266,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 at91_clk_register_programmable(struct regmap *regmap, const char *name,
-			       const char **parent_names, struct clk_hw **parent_hws,
+			       const char **parent_names, struct clk_parent_data *parent_data,
 			       u8 num_parents, u8 id,
 			       const struct clk_programmable_layout *layout,
 			       u32 *mux_table);
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 191e2566d64a..6afa4e6bcbad 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -885,20 +885,20 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
-	parent_hws[4] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
+	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
+	parent_data[4] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    NULL, parent_hws, 7, i,
+						    NULL, parent_data, 7, i,
 						    &sam9x7_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index ab63e36cf0da..8538c3e5fa5a 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1264,22 +1264,22 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
-	parent_hws[4] = sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
-	parent_hws[7] = sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
-	parent_hws[8] = sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
+	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
+	parent_data[4] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw);
+	parent_data[7] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
+	parent_data[8] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw);
 
 	for (i = 0; i < 8; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
-		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
+		hw = at91_clk_register_programmable(regmap, name, NULL, parent_data,
 						    9, i,
 						    &programmable_layout,
 						    sama7d65_prog_mux_table);
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index acf45319abe7..ddd5ad318990 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1143,21 +1143,21 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	sama7g5_pmc->chws[PMC_UTMI] = hw;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
-	parent_hws[4] = sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sama7g5_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
-	parent_hws[7] = sama7g5_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
-	parent_hws[8] = sama7g5_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
+	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
+	parent_data[4] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw);
+	parent_data[7] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
+	parent_data[8] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw);
 	for (i = 0; i < 8; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
-		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
+		hw = at91_clk_register_programmable(regmap, name, NULL, parent_data,
 						    9, i,
 						    &programmable_layout,
 						    sama7g5_prog_mux_table);
-- 
2.43.0


