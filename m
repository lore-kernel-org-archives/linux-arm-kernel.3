Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42319CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrSyCAB1vEPdy1w5fKJRLLKutuE+dlt/ZF5IOf7tnnw=; b=kn7dIesqsc7N1OiuFBT/D1Yqsq
	4uBmDmb+c/cakWhLlS8LCXjQQRKQXNIKcHiV0cYmMoTFqm0KMaOI8j3pqH4Augc267St3QljKZoxr
	9X5ge6p+e785GXuwpvMqD8R5dPrCaaDsz5k54BdU7zGgqY4VfrwXq0oxATqmPfgMXdINHc3X5dxJu
	hCeM2XMSZtOhkeN4MqitPHNEY/r3KI5WjCakyqYSW1cKyDgPEfyqB8Bk1Q6JAq3LZF1TPQxRsC5wP
	iiNgbIrSqpyHY3soF9Pw9ueGHHxwBuYS4LGiCqdQATfOVySjbg2UFS9Dbz4SVmQEDNDUUownWESGq
	0Jz/lCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzM0K-00000001DFc-2fxA;
	Thu, 18 Sep 2025 21:17:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzV-00000001CBG-1CWr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230194; x=1789766194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iAP3KtoYiGiAIDJG+rRnha3nTkdIhSYADFJkd7bf+bU=;
  b=hCaFTj3PHomXMepRnYq1NXpg5oKk8vXGMfP1hUPpEcHpO12WJpZm09Ne
   1PjyJBtgBJUvZCaPyB4nbKMfa5XjUT434oFcBCO7e6lO1lIPkhaoMxi02
   Q4X+RTSg9iB6Z0QlmHCONFStUcTgmNcpUkOywQwgQXsbfnpAbBlP7M7j0
   Zu3p1GyfswBdkQ2WQYfqTst1+pLqkZdsAYFhUoDvZbzYXbkD97+gMuP8c
   GLRpgUcKj2CeUab7srMEtOt1E5KsMk2LOV/D9gg89n+T9Ni338Vb/OgUG
   A7ukFJ4VOtE6+1MYSyuJUxAWr2TDGKCs+teOb34prAXnj+7CT55YdlBeG
   g==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: PRQVu+OTROaUqDILN1QvBg==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071397"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 14:16:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 14:15:54 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 14:15:54 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
Subject: [PATCH v4 22/31] clk: at91: sam9x60: switch to parent_hw and parent_data
Date: Thu, 18 Sep 2025 14:16:04 -0700
Message-ID: <17196aeed3bcba15219b7e6513aa3badc2540066.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141633_371965_F5D52D61 
X-CRM114-Status: GOOD (  16.64  )
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
 drivers/clk/at91/sam9x60.c | 93 +++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index 2ab7deab95f3..97131de5ba20 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -81,9 +81,9 @@ static const struct clk_pcr_layout sam9x60_pcr_layout = {
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
@@ -91,11 +91,11 @@ static const struct {
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
@@ -186,13 +186,13 @@ static const struct {
 
 static void __init sam9x60_pmc_setup(struct device_node *np)
 {
+	const char *main_xtal_name, *td_slck_name, *md_slck_name;
+	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
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
 
 	i = of_property_match_string(np, "clock-names", "td_slck");
@@ -210,7 +210,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	i = of_property_match_string(np, "clock-names", "main_xtal");
 	if (i < 0)
 		return;
-	mainxtal_name = of_clk_get_parent_name(np, i);
+
+	main_xtal_name = of_clk_get_parent_name(np, i);
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
@@ -223,19 +224,20 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
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
+						 &AT91_CLK_PD_NAME(main_xtal_name),
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
 
@@ -256,7 +258,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		goto err_free;
 
 	hw = sam9x60_clk_register_div_pll(regmap, &pmc_pll_lock, "pllack_divck",
-					  "pllack_fracck", NULL, 0, &plla_characteristics,
+					  NULL, hw, 0, &plla_characteristics,
 					  &pll_div_layout,
 					   /*
 					    * This feeds CPU. It should not
@@ -277,7 +279,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		goto err_free;
 
 	hw = sam9x60_clk_register_div_pll(regmap, &pmc_pll_lock, "upllck_divck",
-					  "upllck_fracck", NULL, 1, &upll_characteristics,
+					  NULL, hw, 1, &upll_characteristics,
 					  &pll_div_layout,
 					  CLK_SET_RATE_GATE |
 					  CLK_SET_PARENT_GATE |
@@ -287,17 +289,17 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 
 	sam9x60_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack_divck";
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
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
@@ -305,26 +307,26 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 
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
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
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
@@ -333,9 +335,15 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
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
@@ -348,7 +356,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sam9x60_pcr_layout,
 							 sam9x60_periphck[i].n,
-							 "masterck_div", NULL,
+							 NULL,
+							 &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MCK]),
 							 sam9x60_periphck[i].id,
 							 &range, INT_MIN,
 							 sam9x60_periphck[i].flags);
@@ -362,7 +371,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
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


