Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E208DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUgXFlxm2F8GPsIbJpjnmsZtBtAtP65I2mig1JXkcPY=; b=0XnzET1Zs9wt17cjGUHsOmR6Eh
	yBxxS64cOgfslTCl8erLivIkQMGeNT9lX1cU5Ush6iSnMg8LcXFSpKvzOht0dyI5azcL0y1EXSjK9
	Ru8YZnwunECrJvzpJHK6KbTDs7789BcZlYsJFBD9HVTxx4KgNQj+UkTRSHvUr9SjfQzDuM1XJKfKp
	DFslawyxaITsyklP4ghKxeTSv8ahz5tYMsn2j70lDRuL7LKPfYhPTiSzdVIHTH3zhtQ18qdzwdmSu
	xAymY2pqtWk2Rqvm6r2sq0BuGOyi8NZfjlCT69DPSvfquxzHfA59kVAYUHGQNJLd8ByUafr32vXXF
	2etZtx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzrr-0000000DAYX-4B59;
	Thu, 10 Jul 2025 22:35:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYv-0000000Ct5x-2bKj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qUgXFlxm2F8GPsIbJpjnmsZtBtAtP65I2mig1JXkcPY=; b=dn9g3jhKwKcztj6gKwaK6GpV1C
	SBa9Ku+l6QyYwxiqlWDNXcbYh5gG264VKmERuimzEe7luFYkFsbCshm8aO1BqIbwPOTAsFhZHaBtF
	Hp/KvHeC/rW1CJjhXfaITzGQywo8rmtr86YAcrCt2vOzFclu0eM1pwycg7Y3GgJL/TtogI6tqPgBt
	uTpUjdbs4xkRk0TYKwdJA2c/pQTMaKBxKFYtWv1vdz43EcNVwXRRaWvdvTLtZ3G5wUf9Y4BYPO6ZQ
	zq3ykHXqM5NxFyY+0WYJVfvLSDEC0amf5fN0nk3MoVzu6jHxPV9E5GLPt575S1OBYGW6ATmiQMUMp
	8m43EsTg==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYq-000000098p4-3MsV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178084; x=1783714084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aMmv092GQeQBtAZmEdJbDY5OV3ksnoMeUpRINntQCic=;
  b=Kf6SGc8a4atrhEwUr1X2y16yX9tRAMYo9HfEbDj07YhyapyfZIsiSSJv
   FDTDahz1kCadnKTuhiupMfI9/5mYAotPLAfYTaQnG0GUiP4AoXK+Ddmtc
   Meo7+3VQr/9gCP63vBuu9WW25+0G8x7mgBiYG4XstaLfkOkUsN3wI8g4W
   5NFAfmFkWxpXe74s0irNhn9xqJMXToaEd1Y6fr65kngE5K/MWJJI0nBLt
   s+xteeaXctojU2npkVZdOZ+S1c+cBW9UvfMGWh62SOFTtpCQiqR4QYb8b
   BRLBN+3GnsFetMH7TV/Hz1sukyUO4H+mjJRoJtbJxN1w9HUvu8YSeOXO9
   g==;
X-CSE-ConnectionGUID: VcY24SkbRKSMnNSaLxS1vA==
X-CSE-MsgGUID: PvhPmzYTQ0OL19DYvW8p/A==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="44448165"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Jul 2025 13:07:31 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 10 Jul 2025 13:07:31 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>
Subject: [PATCH v3 10/32] clk: at91: clk-generated: use clk_parent_data
Date: Thu, 10 Jul 2025 13:07:03 -0700
Message-ID: <c22f1546e25cfe0d4ae3f6f2507b522311190812.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210805_605749_B3F53591 
X-CRM114-Status: GOOD (  15.70  )
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

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Added SAMA7D65 and SAM9X75 SoCs to the
clk-generated changes. Adjust clk name variable order.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-generated.c |  8 ++++----
 drivers/clk/at91/pmc.h           |  2 +-
 drivers/clk/at91/sam9x7.c        | 26 ++++++++++----------------
 drivers/clk/at91/sama7d65.c      | 31 +++++++++++++------------------
 drivers/clk/at91/sama7g5.c       | 30 +++++++++++-------------------
 5 files changed, 39 insertions(+), 58 deletions(-)

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
index 34036f2d0578..0646775dfb1d 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -171,7 +171,7 @@ struct clk_hw * __init
 at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 			    const struct clk_pcr_layout *layout,
 			    const char *name, const char **parent_names,
-			    struct clk_hw **parent_hws, u32 *mux_table,
+			    struct clk_parent_data *parent_data, u32 *mux_table,
 			    u8 num_parents, u8 id,
 			    const struct clk_range *range, int chg_pid);
 
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 86d624cd92b2..c4578944611e 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -739,8 +739,8 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 {
 	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
 	struct clk_range range = CLK_RANGE(0, 0);
-	const char *main_xtal_name = "main_xtal";
-	const char * const td_slck_name = "td_slck";
+	const char *const main_xtal_name = "main_xtal";
+	const char *const td_slck_name = "td_slck";
 	const char *const md_slck_name = "md_slck";
 	struct pmc_data *sam9x7_pmc;
 	const char *parent_names[9];
@@ -748,16 +748,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	int clk_mux_buffer_size = 0;
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
-	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
+	struct clk_hw *usbck_hw;
 	struct clk_parent_data parent_data[9];
-	struct clk_hw *parent_hws[9];
 	int i, j;
 
-	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, td_slck_name));
-	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, md_slck_name));
 	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
 
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	if (!main_xtal_hw)
 		return;
 
 	regmap = device_node_to_regmap(np);
@@ -933,13 +930,12 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		sam9x7_pmc->phws[sam9x7_periphck[i].id] = hw;
 	}
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
 	for (i = 0; i < ARRAY_SIZE(sam9x7_gck); i++) {
 		u8 num_parents = 4 + sam9x7_gck[i].pp_count;
-		struct clk_hw *tmp_parent_hws[6];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -954,15 +950,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 			u8 pll_id = sam9x7_gck[i].pp[j].pll_id;
 			u8 pll_compid = sam9x7_gck[i].pp[j].pll_compid;
 
-			tmp_parent_hws[j] = sam9x7_plls[pll_id][pll_compid].hw;
+			parent_data[4 + j] = AT91_CLK_PD_HW(sam9x7_plls[pll_id][pll_compid].hw);
 		}
-		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
-			       sam9x7_gck[i].pp_count);
 
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sam9x7_pcr_layout,
 						 sam9x7_gck[i].n,
-						 NULL, parent_hws, mux_table,
+						 NULL, parent_data, mux_table,
 						 num_parents,
 						 sam9x7_gck[i].id,
 						 &sam9x7_gck[i].r,
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 7463719260e0..4d47d20e65fb 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1092,22 +1092,20 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
 	const char * const main_xtal_name = "main_xtal";
+	const char * const td_slck_name = "td_slck";
+	const char * const md_slck_name = "md_slck";
 	struct clk_parent_data parent_data[10];
 	struct pmc_data *sama7d65_pmc;
 	const char *parent_names[11];
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
 	struct regmap *regmap;
-	struct clk_hw *td_slck_hw, *md_slck_hw;
-	struct clk_hw *parent_hws[10];
 	bool bypass;
 	int i, j;
 
-	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
-	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
 	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
 
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	if (!main_xtal_hw)
 		return;
 
 	regmap = device_node_to_regmap(np);
@@ -1216,8 +1214,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	sama7d65_pmc->chws[PMC_MCK] = hw;
 	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
 
-	parent_data[0] = AT91_CLK_PD_NAME("md_slck", md_slck_index);
-	parent_data[1] = AT91_CLK_PD_NAME("td_slck", td_slck_index);
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
 	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
 		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
@@ -1262,8 +1260,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	parent_data[0] = AT91_CLK_PD_NAME("md_slck", md_slck_index);
-	parent_data[1] = AT91_CLK_PD_NAME("td_slck", td_slck_index);
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
 	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
 	parent_data[3] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
 	parent_data[4] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
@@ -1313,13 +1311,12 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 		sama7d65_pmc->phws[sama7d65_periphck[i].id] = hw;
 	}
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7d65_pmc->chws[PMC_MCK1];
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MCK1]);
 	for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
 		u8 num_parents = 4 + sama7d65_gck[i].pp_count;
-		struct clk_hw *tmp_parent_hws[8];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -1336,15 +1333,13 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
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
index a6824d0accb9..505db97e989b 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -971,10 +971,10 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 {
 	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
 	const char * const main_xtal_name = "main_xtal";
+	const char * const td_slck_name = "td_slck";
+	const char * const md_slck_name = "md_slck";
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
 	struct clk_parent_data parent_data[10];
-	struct clk_hw *td_slck_hw, *md_slck_hw;
-	struct clk_hw *parent_hws[10];
 	struct pmc_data *sama7g5_pmc;
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
@@ -983,11 +983,6 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	bool bypass;
 	int i, j;
 
-	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
-	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	if (!td_slck_hw || !md_slck_hw)
-		return;
-
 	main_xtal = of_clk_get(np, main_xtal_index);
 	if (IS_ERR(main_xtal))
 		return;
@@ -1097,8 +1092,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[PMC_MCK] = hw;
 
-	parent_data[0] = AT91_CLK_PD_NAME("md_slck", md_slck_index);
-	parent_data[1] = AT91_CLK_PD_NAME("td_slck", td_slck_index);
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
 	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7g5_mckx); i++) {
 		u8 num_parents = 3 + sama7g5_mckx[i].ep_count;
@@ -1141,8 +1136,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	sama7g5_pmc->chws[PMC_UTMI] = hw;
 
-	parent_data[0] = AT91_CLK_PD_NAME("md_slck", md_slck_index);
-	parent_data[1] = AT91_CLK_PD_NAME("td_slck", td_slck_index);
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
 	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
 	parent_data[3] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
 	parent_data[4] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
@@ -1191,12 +1186,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 		sama7g5_pmc->phws[sama7g5_periphck[i].id] = hw;
 	}
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
 	for (i = 0; i < ARRAY_SIZE(sama7g5_gck); i++) {
 		u8 num_parents = 3 + sama7g5_gck[i].pp_count;
-		struct clk_hw *tmp_parent_hws[8];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -1211,15 +1205,13 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
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


