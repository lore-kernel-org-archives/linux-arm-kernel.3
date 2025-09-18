Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115D9CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKNyP1dObEp73VAwUJr+5ZUeBOvp2NmNitbroQUiNZI=; b=O7toxZRHut1PKfZCGl/tde9Dra
	biD+1nkDFwZssvPxkstJMVVIg/wUhEoBnjRWYNhMKZpuGrjZDq/ciXpNheDKWvBlDnBUVTCDCmr5n
	uNTFNrzi9t2qrnmRg3pwjeawQy7xEl4q4gh8MwdHFthybwzlgTERkvK9PPa9u81dLvjVbUlBm0OOV
	x1ZJxXv5HdYn0QULMJ3o4t1lpzXcZ1Cxnd2TlisIeJpddzIGYig+fuhbmEpz6L/Eh1FOY7BW5RmVV
	e+oMr5U6rGrHO/RSOvVSSLCLqx5W65pXz8JUii1pMRS++Nk7O09YI3Rkd4PxbveXQVSqad60cde0X
	5ZX513/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzZ-00000001CRB-2vbt;
	Thu, 18 Sep 2025 21:16:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzO-00000001CBG-3Aas
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230187; x=1789766187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bzwb9+zFUpS1/Y7MegoKgHFqkUPMSfLevAbby0Iezv4=;
  b=lF2QhMDpCvDvUtjdORRxdPIgCWsTZ0c80iJzM/nC2ppU3tcXO7zaEp/k
   wVJiSdws7zWUcZlLYLL4VEwIytIfI7uqfdiBJifOfx1Euku7Xg+78BonR
   vOpxnRAX/3hStrOAc/h7Zmp4mTt1KTgEMBtCwikbSg0TyJvYDVwtDii/h
   Jk4DlhRX3in7R9XRAK4uKatc88GgHUylPBwA7N95lNeo/2uBXLvGKAUTa
   m/WdmcKENWrBp/ETcE2iZu4zaPRziPXEvzGYN2v6cBzAURuOhF8fhuufg
   eZNb/yk8JgqIGF6WNFULBBIpvmf5k0fdSYBp/4JfFSbT2fQydy8Th+6FA
   A==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: FCWrCzNISvOi8dY9NHpumw==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071382"
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
Subject: [PATCH v4 08/31] clk: at91: clk-master: use clk_parent_data
Date: Thu, 18 Sep 2025 14:15:50 -0700
Message-ID: <160f139d5a5647104826c5878ca077faa26916bc.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141626_854992_BDAFC979 
X-CRM114-Status: GOOD (  14.79  )
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

__clk_get_hw will be removed in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Add clk-master changes to SAM9X75 and
SAMA7D65 SoCs. As well as add md_slck commit message.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-master.c | 24 ++++++++++++------------
 drivers/clk/at91/pmc.h        |  6 +++---
 drivers/clk/at91/sam9x7.c     | 20 +++++++++++---------
 drivers/clk/at91/sama7d65.c   | 17 +++++++----------
 drivers/clk/at91/sama7g5.c    | 17 +++++++----------
 5 files changed, 40 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index d5ea2069ec83..b8d000b3b180 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -473,7 +473,7 @@ static struct clk_hw * __init
 at91_clk_register_master_internal(struct regmap *regmap,
 		const char *name, int num_parents,
 		const char **parent_names,
-		struct clk_hw **parent_hws,
+		struct clk_parent_data *parent_data,
 		const struct clk_master_layout *layout,
 		const struct clk_master_characteristics *characteristics,
 		const struct clk_ops *ops, spinlock_t *lock, u32 flags)
@@ -485,7 +485,7 @@ at91_clk_register_master_internal(struct regmap *regmap,
 	unsigned long irqflags;
 	int ret;
 
-	if (!name || !num_parents || !(parent_names || parent_hws) || !lock)
+	if (!name || !num_parents || !(parent_names || parent_data) || !lock)
 		return ERR_PTR(-EINVAL);
 
 	master = kzalloc(sizeof(*master), GFP_KERNEL);
@@ -494,8 +494,8 @@ at91_clk_register_master_internal(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
@@ -531,13 +531,13 @@ struct clk_hw * __init
 at91_clk_register_master_pres(struct regmap *regmap,
 		const char *name, int num_parents,
 		const char **parent_names,
-		struct clk_hw **parent_hws,
+		struct clk_parent_data *parent_data,
 		const struct clk_master_layout *layout,
 		const struct clk_master_characteristics *characteristics,
 		spinlock_t *lock)
 {
 	return at91_clk_register_master_internal(regmap, name, num_parents,
-						 parent_names, parent_hws, layout,
+						 parent_names, parent_data, layout,
 						 characteristics,
 						 &master_pres_ops,
 						 lock, CLK_SET_RATE_GATE);
@@ -546,7 +546,7 @@ at91_clk_register_master_pres(struct regmap *regmap,
 struct clk_hw * __init
 at91_clk_register_master_div(struct regmap *regmap,
 		const char *name, const char *parent_name,
-		struct clk_hw *parent_hw, const struct clk_master_layout *layout,
+		struct clk_parent_data *parent_data, const struct clk_master_layout *layout,
 		const struct clk_master_characteristics *characteristics,
 		spinlock_t *lock, u32 flags, u32 safe_div)
 {
@@ -560,7 +560,7 @@ at91_clk_register_master_div(struct regmap *regmap,
 
 	hw = at91_clk_register_master_internal(regmap, name, 1,
 					       parent_name ? &parent_name : NULL,
-					       parent_hw ? &parent_hw : NULL, layout,
+					       parent_data, layout,
 					       characteristics, ops,
 					       lock, flags);
 
@@ -815,7 +815,7 @@ struct clk_hw * __init
 at91_clk_sama7g5_register_master(struct regmap *regmap,
 				 const char *name, int num_parents,
 				 const char **parent_names,
-				 struct clk_hw **parent_hws,
+				 struct clk_parent_data *parent_data,
 				 u32 *mux_table,
 				 spinlock_t *lock, u8 id,
 				 bool critical, int chg_pid)
@@ -827,7 +827,7 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
 	unsigned int val;
 	int ret;
 
-	if (!name || !num_parents || !(parent_names || parent_hws) || !mux_table ||
+	if (!name || !num_parents || !(parent_names || parent_data) || !mux_table ||
 	    !lock || id > MASTER_MAX_ID)
 		return ERR_PTR(-EINVAL);
 
@@ -837,8 +837,8 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &sama7g5_master_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index ee77c14e8b25..c7973c063b59 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -207,14 +207,14 @@ at91_clk_register_sam9x5_main(struct regmap *regmap, const char *name,
 struct clk_hw * __init
 at91_clk_register_master_pres(struct regmap *regmap, const char *name,
 			      int num_parents, const char **parent_names,
-			      struct clk_hw **parent_hws,
+			      struct clk_parent_data *parent_data,
 			      const struct clk_master_layout *layout,
 			      const struct clk_master_characteristics *characteristics,
 			      spinlock_t *lock);
 
 struct clk_hw * __init
 at91_clk_register_master_div(struct regmap *regmap, const char *name,
-			     const char *parent_names, struct clk_hw *parent_hw,
+			     const char *parent_names, struct clk_parent_data *parent_data,
 			     const struct clk_master_layout *layout,
 			     const struct clk_master_characteristics *characteristics,
 			     spinlock_t *lock, u32 flags, u32 safe_div);
@@ -223,7 +223,7 @@ struct clk_hw * __init
 at91_clk_sama7g5_register_master(struct regmap *regmap,
 				 const char *name, int num_parents,
 				 const char **parent_names,
-				 struct clk_hw **parent_hws, u32 *mux_table,
+				 struct clk_parent_data *parent_data, u32 *mux_table,
 				 spinlock_t *lock, u8 id, bool critical,
 				 int chg_pid);
 
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index f00045d4f425..191e2566d64a 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -752,15 +752,17 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
-	struct clk_parent_data parent_data[2];
+	struct clk_parent_data parent_data[9];
 	struct clk_hw *parent_hws[9];
 	int i, j;
 
 	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
 	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	i = of_property_match_string(np, "clock-names", "main_xtal");
+	if (!td_slck_hw || !md_slck_hw)
+		return;
 
-	if (!td_slck_hw || !md_slck_hw || !i)
+	i = of_property_match_string(np, "clock-names", "main_xtal");
+	if (i < 0)
 		return;
 
 	main_xtal_name = of_clk_get_parent_name(np, i);
@@ -857,18 +859,18 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		}
 	}
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = sam9x7_pmc->chws[PMC_MAIN];
-	parent_hws[2] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
-	parent_hws[3] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
+	parent_data[1] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
+	parent_data[3] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   NULL, parent_hws, &sam9x7_master_layout,
+					   NULL, parent_data, &sam9x7_master_layout,
 					   &mck_characteristics, &mck_lock);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  NULL, hw, &sam9x7_master_layout,
+					  NULL, &AT91_CLK_PD_HW(hw), &sam9x7_master_layout,
 					  &mck_characteristics, &mck_lock,
 					  CLK_SET_RATE_GATE, 0);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index b12d796cbea4..ab63e36cf0da 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1101,7 +1101,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw;
-	struct clk_parent_data parent_data[2];
+	struct clk_parent_data parent_data[10];
 	struct clk_hw *parent_hws[10];
 	bool bypass;
 	int i, j;
@@ -1209,7 +1209,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	}
 
 	hw = at91_clk_register_master_div(regmap, "mck0", NULL,
-					  sama7d65_plls[PLL_ID_CPU][1].hw,
+					  &AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_CPU][1].hw),
 					  &mck0_layout, &mck0_characteristics,
 					  &pmc_mck0_lock, CLK_GET_RATE_NOCACHE, 5);
 	if (IS_ERR(hw))
@@ -1218,12 +1218,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	sama7d65_pmc->chws[PMC_MCK] = hw;
 	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
+	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
 		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
-		struct clk_hw *tmp_parent_hws[8];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -1240,13 +1239,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			u8 pll_id = sama7d65_mckx[i].ep[j].pll_id;
 			u8 pll_compid = sama7d65_mckx[i].ep[j].pll_compid;
 
-			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
+			parent_data[3 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
 		}
-		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
-			       sama7d65_mckx[i].ep_count);
 
 		hw = at91_clk_sama7g5_register_master(regmap, sama7d65_mckx[i].n,
-						      num_parents, NULL, parent_hws,
+						      num_parents, NULL, parent_data,
 						      mux_table, &pmc_mckX_lock,
 						      sama7d65_mckx[i].id,
 						      sama7d65_mckx[i].c,
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index dde662a6133f..acf45319abe7 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -978,7 +978,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw;
-	struct clk_parent_data parent_data[2];
+	struct clk_parent_data parent_data[10];
 	struct clk_hw *parent_hws[10];
 	struct clk *main_xtal;
 	bool bypass;
@@ -1091,7 +1091,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	}
 
 	hw = at91_clk_register_master_div(regmap, "mck0", NULL,
-					  sama7g5_plls[PLL_ID_CPU][1].hw,
+					  &AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_CPU][1].hw),
 					  &mck0_layout, &mck0_characteristics,
 					  &pmc_mck0_lock, CLK_GET_RATE_NOCACHE, 5);
 	if (IS_ERR(hw))
@@ -1099,12 +1099,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[PMC_MCK] = hw;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
+	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7g5_mckx); i++) {
 		u8 num_parents = 3 + sama7g5_mckx[i].ep_count;
-		struct clk_hw *tmp_parent_hws[8];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -1119,13 +1118,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			u8 pll_id = sama7g5_mckx[i].ep[j].pll_id;
 			u8 pll_compid = sama7g5_mckx[i].ep[j].pll_compid;
 
-			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
+			parent_data[3 + j] = AT91_CLK_PD_HW(sama7g5_plls[pll_id][pll_compid].hw);
 		}
-		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
-			       sama7g5_mckx[i].ep_count);
 
 		hw = at91_clk_sama7g5_register_master(regmap, sama7g5_mckx[i].n,
-				   num_parents, NULL, parent_hws, mux_table,
+				   num_parents, NULL, parent_data, mux_table,
 				   &pmc_mckX_lock, sama7g5_mckx[i].id,
 				   sama7g5_mckx[i].c,
 				   sama7g5_mckx[i].ep_chg_id);
-- 
2.43.0


