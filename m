Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C4ACAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24qopBD4D7vUX2YQRmT6x7tfIZWLRl/HPlv+8D95Vuc=; b=p5nynsyDOkdxvHrA/szzUf/jxQ
	b2211ekZDCkwoEH2f/1ifB83E3b5cno/7XSxyXPocF1+qZ+fo6skqYl0KJUdEIHGXYo8E7shyCegv
	ns/EEuyVyXZxQZ42ED2+VRto33xRASKDA5PIxYPSADgpJ/CzcMko9QM05FWCEZ5f3mwcGRYV04m5K
	jttWXLXOrNXhNmGO3IRJ5pPdWqUnKSAA91SMLr6ohkrA+yjjT/cWWVlXEpKJDhBHeB5RRC21rxgt3
	7U1Mh+9HeRQn1VNUUpgS4Ht01lbkeFCNzumtxvH7lWzUmhAvU4Oj5kwq3os6+MQhn+qqiNzyZaXMt
	GSfDycYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzx-00000001Cna-3EZK;
	Thu, 18 Sep 2025 21:17:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzQ-00000001CBG-1ECw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230189; x=1789766189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WCJq+bPBE6oP69qXgqacpPnfJrw13T86YvENIHlj29w=;
  b=jZsTpiRRoz/XFOKrUBzetEoN8Uhtju1voD1gnzi7OYoOQb0TmkP0LVMr
   FG1BAyM8pDcmTnGNurDznNYi0qTt8+2yUiX/lyGIdIcfOO/vNKmlFADk0
   nH4dwdv3J0yaZQLbX9fuffA+wXbGFnhTPILmi1rJzf37C/mKsNupqmRrN
   5fC1ROLpTT+sRrm11K0KaBdWnQ4chBB2Oi3DWViUd3y93bNL4WnYsRB4V
   7v7wpuJwnh+sQZnsIldwfCvmDzfW8wLnjxBbNwQyWsLk4Bmm5Jfi51+G8
   /MjtxQ75ejY86PFKTTsqkNieUyN/qrUc9nUmihcAh0NUYGgudza8qG/DJ
   A==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: mePe3jeWRDmWpD2tNFx1NQ==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071384"
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
Subject: [PATCH v4 10/31] clk: at91: clk-generated: use clk_parent_data
Date: Thu, 18 Sep 2025 14:15:52 -0700
Message-ID: <645beaecf4b81c7e08f8adf3b9c74fa4b0176993.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141628_396233_1B1BAC08 
X-CRM114-Status: GOOD (  17.79  )
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

Remove the last of the usage of __clk_get_hw().

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Added SAMA7D65 and SAM9X75 SoCs to the
clk-generated changes. Adjust clk name variable order.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-generated.c |  8 +++----
 drivers/clk/at91/pmc.h           |  2 +-
 drivers/clk/at91/sam9x7.c        | 38 ++++++++++++++---------------
 drivers/clk/at91/sama7d65.c      | 41 +++++++++++++++++---------------
 drivers/clk/at91/sama7g5.c       | 39 ++++++++++++++++--------------
 5 files changed, 67 insertions(+), 61 deletions(-)

diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
index 4b4edeecc889..d9e00167dbc8 100644
--- a/drivers/clk/at91/clk-generated.c
+++ b/drivers/clk/at91/clk-generated.c
@@ -319,7 +319,7 @@ struct clk_hw * __init
 at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 			    const struct clk_pcr_layout *layout,
 			    const char *name, const char **parent_names,
-			    struct clk_hw **parent_hws,
+			    struct clk_parent_data *parent_data,
 			    u32 *mux_table, u8 num_parents, u8 id,
 			    const struct clk_range *range,
 			    int chg_pid)
@@ -329,7 +329,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 	struct clk_hw *hw;
 	int ret;
 
-	if (!(parent_names || parent_hws))
+	if (!(parent_names || parent_data))
 		return ERR_PTR(-ENOMEM);
 
 	gck = kzalloc(sizeof(*gck), GFP_KERNEL);
@@ -338,8 +338,8 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 
 	init.name = name;
 	init.ops = &generated_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 51a87a535504..2aa84c49bd2f 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -174,7 +174,7 @@ struct clk_hw * __init
 at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 			    const struct clk_pcr_layout *layout,
 			    const char *name, const char **parent_names,
-			    struct clk_hw **parent_hws, u32 *mux_table,
+			    struct clk_parent_data *parent_data, u32 *mux_table,
 			    u8 num_parents, u8 id,
 			    const struct clk_range *range, int chg_pid);
 
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 6afa4e6bcbad..0266119e125e 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -744,22 +744,26 @@ static const struct {
 static void __init sam9x7_pmc_setup(struct device_node *np)
 {
 	struct clk_range range = CLK_RANGE(0, 0);
-	const char *main_xtal_name;
+	const char *main_xtal_name, *td_slck_name, *md_slck_name;
 	struct pmc_data *sam9x7_pmc;
 	const char *parent_names[9];
 	void **clk_mux_buffer = NULL;
 	int clk_mux_buffer_size = 0;
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
-	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
+	struct clk_hw *usbck_hw;
 	struct clk_parent_data parent_data[9];
-	struct clk_hw *parent_hws[9];
 	int i, j;
 
-	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
-	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	if (!td_slck_hw || !md_slck_hw)
+	i =  of_property_match_string(np, "clock-names", "td_slck");
+	if (i < 0)
+		return;
+	td_slck_name = of_clk_get_parent_name(np, i);
+
+	i =  of_property_match_string(np, "clock-names", "md_slck");
+	if (i < 0)
 		return;
+	md_slck_name = of_clk_get_parent_name(np, i);
 
 	i = of_property_match_string(np, "clock-names", "main_xtal");
 	if (i < 0)
@@ -859,7 +863,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		}
 	}
 
-	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
 	parent_data[1] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
 	parent_data[2] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
 	parent_data[3] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
@@ -885,8 +889,8 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
-	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
 	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
 	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
 	parent_data[4] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
@@ -937,13 +941,12 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		sam9x7_pmc->phws[sam9x7_periphck[i].id] = hw;
 	}
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
+	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
 	for (i = 0; i < ARRAY_SIZE(sam9x7_gck); i++) {
 		u8 num_parents = 4 + sam9x7_gck[i].pp_count;
-		struct clk_hw *tmp_parent_hws[6];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -959,16 +962,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 			u8 pll_id = sam9x7_gck[i].pp[j].pll_id;
 			u8 pll_compid = sam9x7_gck[i].pp[j].pll_compid;
 
-			tmp_parent_hws[j] = sam9x7_plls[pll_id][pll_compid].hw;
+			parent_data[4 + j] = AT91_CLK_PD_HW(sam9x7_plls[pll_id][pll_compid].hw);
 		}
 
-		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
-			       sam9x7_gck[i].pp_count);
-
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sam9x7_pcr_layout,
 						 sam9x7_gck[i].n,
-						 NULL, parent_hws, mux_table,
+						 NULL, parent_data, mux_table,
 						 num_parents,
 						 sam9x7_gck[i].id,
 						 &sam9x7_gck[i].r,
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 8538c3e5fa5a..faad4fd28e85 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1093,24 +1093,30 @@ static const struct clk_pcr_layout sama7d65_pcr_layout = {
 
 static void __init sama7d65_pmc_setup(struct device_node *np)
 {
-	const char *main_xtal_name;
+	const char *main_xtal_name, *md_slck_name, *td_slck_name;
 	struct pmc_data *sama7d65_pmc;
 	const char *parent_names[11];
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
-	struct clk_hw *td_slck_hw, *md_slck_hw;
 	struct clk_parent_data parent_data[10];
-	struct clk_hw *parent_hws[10];
 	bool bypass;
 	int i, j;
 
-	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
-	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
+	i = of_property_match_string(np, "clock-names", "td_slck");
+	if (i < 0)
+		return;
+	td_slck_name = of_clk_get_parent_name(np, i);
+
+	i = of_property_match_string(np, "clock-names", "md_slck");
+	if (i < 0)
+		return;
+	md_slck_name = of_clk_get_parent_name(np, i);
+
 	i = of_property_match_string(np, "clock-names", "main_xtal");
 
-	if (!td_slck_hw || !md_slck_hw || !i)
+	if (i < 0)
 		return;
 	main_xtal_name = of_clk_get_parent_name(np, i);
 
@@ -1218,8 +1224,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	sama7d65_pmc->chws[PMC_MCK] = hw;
 	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
 
-	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
-	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
 	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
 		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
@@ -1264,8 +1270,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
-	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
 	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
 	parent_data[3] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
 	parent_data[4] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
@@ -1315,13 +1321,12 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 		sama7d65_pmc->phws[sama7d65_periphck[i].id] = hw;
 	}
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7d65_pmc->chws[PMC_MCK1];
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
+	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MCK1]);
 	for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
 		u8 num_parents = 4 + sama7d65_gck[i].pp_count;
-		struct clk_hw *tmp_parent_hws[8];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -1338,15 +1343,13 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			u8 pll_id = sama7d65_gck[i].pp[j].pll_id;
 			u8 pll_compid = sama7d65_gck[i].pp[j].pll_compid;
 
-			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
+			parent_data[4 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
 		}
-		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
-			       sama7d65_gck[i].pp_count);
 
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sama7d65_pcr_layout,
 						 sama7d65_gck[i].n, NULL,
-						 parent_hws, mux_table,
+						 parent_data, mux_table,
 						 num_parents,
 						 sama7d65_gck[i].id,
 						 &sama7d65_gck[i].r,
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index ddd5ad318990..ddbf69beb495 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -971,24 +971,30 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
 
 static void __init sama7g5_pmc_setup(struct device_node *np)
 {
-	const char *main_xtal_name;
+	const char *main_xtal_name, *md_slck_name, *td_slck_name;
 	struct pmc_data *sama7g5_pmc;
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
-	struct clk_hw *td_slck_hw, *md_slck_hw;
 	struct clk_parent_data parent_data[10];
-	struct clk_hw *parent_hws[10];
 	struct clk *main_xtal;
 	bool bypass;
 	int i, j;
 
-	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
-	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
+	i = of_property_match_string(np, "clock-names", "td_slck");
+	if (i < 0)
+		return;
+	td_slck_name = of_clk_get_parent_name(np, i);
+
+	i = of_property_match_string(np, "clock-names", "md_slck");
+	if (i < 0)
+		return;
+	md_slck_name = of_clk_get_parent_name(np, i);
+
 	i = of_property_match_string(np, "clock-names", "main_xtal");
 
-	if (!td_slck_hw || !md_slck_hw || !i)
+	if (i < 0)
 		return;
 	main_xtal_name = of_clk_get_parent_name(np, i);
 
@@ -1099,8 +1105,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[PMC_MCK] = hw;
 
-	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
-	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
 	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7g5_mckx); i++) {
 		u8 num_parents = 3 + sama7g5_mckx[i].ep_count;
@@ -1143,8 +1149,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	sama7g5_pmc->chws[PMC_UTMI] = hw;
 
-	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
-	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
 	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
 	parent_data[3] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
 	parent_data[4] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
@@ -1193,12 +1199,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 		sama7g5_pmc->phws[sama7g5_periphck[i].id] = hw;
 	}
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
+	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
 	for (i = 0; i < ARRAY_SIZE(sama7g5_gck); i++) {
 		u8 num_parents = 3 + sama7g5_gck[i].pp_count;
-		struct clk_hw *tmp_parent_hws[8];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -1213,15 +1218,13 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			u8 pll_id = sama7g5_gck[i].pp[j].pll_id;
 			u8 pll_compid = sama7g5_gck[i].pp[j].pll_compid;
 
-			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
+			parent_data[3 + j] = AT91_CLK_PD_HW(sama7g5_plls[pll_id][pll_compid].hw);
 		}
-		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
-			       sama7g5_gck[i].pp_count);
 
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sama7g5_pcr_layout,
 						 sama7g5_gck[i].n, NULL,
-						 parent_hws, mux_table,
+						 parent_data, mux_table,
 						 num_parents,
 						 sama7g5_gck[i].id,
 						 &sama7g5_gck[i].r,
-- 
2.43.0


