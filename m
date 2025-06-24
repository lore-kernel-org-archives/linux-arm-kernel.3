Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF971C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 18:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVhXQ/j8t8BvP1WvxfLiAowIN1MUgn1CQqUVtUF/AKg=; b=iLSbs0yqNGfkwQlG90x5q1URik
	Ql9clxd3NwdQPpXImpwz14P2h5v4F0q2I0ctRxior9MCTrSCoJ4zmagX7iULzcVp73aLrD8kWBRfn
	i3z3D5m3EwbMi/L2yibCtQE4Ak5a07hfjEC4hQszcqT9aBWrmQc2UadsHEm8L1VyL9AeSh1TK8cuZ
	mGIqFcOyR8AIckela225175WwJHhoQ0OQAehc16oLi3QBw8rUjNwuOqh0V+lhZyz6AsPAPbro4xs0
	uUWZoziP6QKL/XSmxfOyNE9Mhn+L3wvhvegTHfpuw41eC6vLRy5KQIh8HoNUKfMxdGe4RgBY6/tN2
	ETdtcPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU85W-00000006SzS-02kO;
	Tue, 24 Jun 2025 18:09:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5Gx-000000062ei-0C76
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777758; x=1782313758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wy1k6qwxcZ9zyVWU7NiKahrw8iO6B4PQen0dkvULY20=;
  b=SawWPHphXbmah+QIUHADRugg89MDngQV95rO342KZWSnwabpLSZ4yrQv
   5eEinXESnIO6sg55IRXyvCOCIX00LqHEAhEAgFsiAIQRHIQ89YnUqCaw7
   QxcTZVzIlo0Hngvd1i9NKsd/vwrzaEZF7OOrNrjdB6PKNsS2HtIfqxZwG
   vRn3MX8UvX7wb1VYSu1xx8Wl/3PCk03jQhwVHFLYoTDfoOosTHGCi1Plz
   hRswAB5XcsYZrJiIhnW1n88sgJd+iUUtmla9RmqaxoPytq035wcC8zpCC
   jSbpNOZLny5fKL2b3/5q8Sc7Swl0Pn8J2xAK5c+L7Qzmrwc9qDKRa1cCU
   Q==;
X-CSE-ConnectionGUID: ticneE1VRpCt6c5L3blMOw==
X-CSE-MsgGUID: t8VN0KghR3u1IUAGV/7HMg==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="210641588"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:39 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:39 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 20/32] clk: at91: sam9x60: switch to parent_hw and parent_data
Date: Tue, 24 Jun 2025 08:08:17 -0700
Message-ID: <7b54ed71ce0cc8134c77b6f5914bf0e95ffa4d77.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080919_149168_DC4ACF85 
X-CRM114-Status: GOOD (  17.00  )
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

Switch SAM9X60 clocks to use modern parent_hw and parent_data.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sam9x60.c | 117 ++++++++++++++++++-------------------
 1 file changed, 56 insertions(+), 61 deletions(-)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index d959b30e1352..b2e86e600a9f 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -79,9 +79,9 @@ static const struct clk_pcr_layout sam9x60_pcr_layout = {
 	.pid_mask = GENMASK(6, 0),
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	unsigned long flags;
 	u8 id;
 } sam9x60_systemck[] = {
@@ -89,11 +89,11 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck",  .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
-	{ .n = "uhpck",  .p = "usbck",    .id = 6 },
-	{ .n = "pck0",   .p = "prog0",    .id = 8 },
-	{ .n = "pck1",   .p = "prog1",    .id = 9 },
-	{ .n = "qspick", .p = "masterck_div", .id = 19 },
+	{ .n = "ddrck",  .id = 2, .flags = CLK_IS_CRITICAL },
+	{ .n = "uhpck",  .id = 6 },
+	{ .n = "pck0",   .id = 8 },
+	{ .n = "pck1",   .id = 9 },
+	{ .n = "qspick", .id = 19 },
 };
 
 static const struct {
@@ -184,32 +184,17 @@ static const struct {
 
 static void __init sam9x60_pmc_setup(struct device_node *np)
 {
+	const char *td_slck_name = "td_slck", *md_slck_name = "md_slck";
+	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
+	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
+	const char *main_xtal_name = "main_xtal";
 	struct clk_range range = CLK_RANGE(0, 0);
-	const char *td_slck_name, *md_slck_name, *mainxtal_name;
+	struct clk_parent_data parent_data[6];
 	struct pmc_data *sam9x60_pmc;
-	const char *parent_names[6];
-	struct clk_hw *main_osc_hw;
+	struct clk_hw *usbck_hw;
 	struct regmap *regmap;
-	struct clk_hw *hw;
 	int i;
 
-	i = of_property_match_string(np, "clock-names", "td_slck");
-	if (i < 0)
-		return;
-
-	td_slck_name = of_clk_get_parent_name(np, i);
-
-	i = of_property_match_string(np, "clock-names", "md_slck");
-	if (i < 0)
-		return;
-
-	md_slck_name = of_clk_get_parent_name(np, i);
-
-	i = of_property_match_string(np, "clock-names", "main_xtal");
-	if (i < 0)
-		return;
-	mainxtal_name = of_clk_get_parent_name(np, i);
-
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
 		return;
@@ -221,26 +206,28 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (!sam9x60_pmc)
 		return;
 
-	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
-					   50000000);
-	if (IS_ERR(hw))
+	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
+						   50000000);
+	if (IS_ERR(main_rc_hw))
 		goto err_free;
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
+	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
+						 0);
 	if (IS_ERR(hw))
 		goto err_free;
-	main_osc_hw = hw;
 
-	parent_names[0] = "main_rc_osc";
-	parent_names[1] = "main_osc";
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
+	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
+	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sam9x60_pmc->chws[PMC_MAIN] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
-					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
+					   &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]),
+					   clk_hw_get_rate(sam9x60_pmc->chws[PMC_MAIN]),
 					   0, &plla_characteristics,
 					   &pll_frac_layout,
 					   /*
@@ -253,7 +240,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		goto err_free;
 
 	hw = sam9x60_clk_register_div_pll(regmap, &pmc_pll_lock, "pllack_divck",
-					  "pllack_fracck", NULL, 0, &plla_characteristics,
+					  NULL, hw, 0, &plla_characteristics,
 					  &pll_div_layout,
 					   /*
 					    * This feeds CPU. It should not
@@ -266,14 +253,15 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	sam9x60_pmc->chws[PMC_PLLACK] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
-					   "main_osc", main_osc_hw, 1,
-					   &upll_characteristics,
+					   &AT91_CLK_PD_HW(main_osc_hw),
+					   clk_hw_get_rate(main_osc_hw),
+					   1, &upll_characteristics,
 					   &pll_frac_layout, CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	hw = sam9x60_clk_register_div_pll(regmap, &pmc_pll_lock, "upllck_divck",
-					  "upllck_fracck", NULL, 1, &upll_characteristics,
+					  NULL, hw, 1, &upll_characteristics,
 					  &pll_div_layout,
 					  CLK_SET_RATE_GATE |
 					  CLK_SET_PARENT_GATE |
@@ -283,17 +271,17 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 
 	sam9x60_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack_divck";
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_PLLACK]);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 3,
-					   parent_names, NULL, &sam9x60_master_layout,
+					   NULL, parent_data, &sam9x60_master_layout,
 					   &mck_characteristics, &mck_lock);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL, &sam9x60_master_layout,
+					  NULL, &AT91_CLK_PD_HW(hw), &sam9x60_master_layout,
 					  &mck_characteristics, &mck_lock,
 					  CLK_SET_RATE_GATE, 0);
 	if (IS_ERR(hw))
@@ -301,26 +289,26 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 
 	sam9x60_pmc->chws[PMC_MCK] = hw;
 
-	parent_names[0] = "pllack_divck";
-	parent_names[1] = "upllck_divck";
-	parent_names[2] = "main_osc";
-	hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, NULL, 3);
-	if (IS_ERR(hw))
+	parent_data[0] = AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_PLLACK]);
+	parent_data[1] = AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_UTMI]);
+	parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
+	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_data, 3);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = td_slck_name;
-	parent_names[2] = "mainck";
-	parent_names[3] = "masterck_div";
-	parent_names[4] = "pllack_divck";
-	parent_names[5] = "upllck_divck";
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MCK]);
+	parent_data[4] = AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_PLLACK]);
+	parent_data[5] = AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_UTMI]);
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 6, i,
+						    NULL, parent_data, 6, i,
 						    &sam9x60_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -329,9 +317,15 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		sam9x60_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	sam9x60_systemck[0].parent_hw = sam9x60_pmc->chws[PMC_MCK];
+	sam9x60_systemck[1].parent_hw = usbck_hw;
+	sam9x60_systemck[2].parent_hw = sam9x60_pmc->pchws[0];
+	sam9x60_systemck[3].parent_hw = sam9x60_pmc->pchws[1];
+	sam9x60_systemck[4].parent_hw = sam9x60_pmc->chws[PMC_MCK];
 	for (i = 0; i < ARRAY_SIZE(sam9x60_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sam9x60_systemck[i].n,
-					      sam9x60_systemck[i].p, NULL,
+					      NULL, &AT91_CLK_PD_HW(sam9x60_systemck[i].parent_hw),
 					      sam9x60_systemck[i].id,
 					      sam9x60_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -344,7 +338,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sam9x60_pcr_layout,
 							 sam9x60_periphck[i].n,
-							 "masterck_div", NULL,
+							 NULL,
+							 &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MCK]),
 							 sam9x60_periphck[i].id,
 							 &range, INT_MIN,
 							 sam9x60_periphck[i].flags);
@@ -358,7 +353,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sam9x60_pcr_layout,
 						 sam9x60_gck[i].n,
-						 parent_names, NULL, NULL, 6,
+						 NULL, parent_data, NULL, 6,
 						 sam9x60_gck[i].id,
 						 &sam9x60_gck[i].r, INT_MIN);
 		if (IS_ERR(hw))
-- 
2.43.0


