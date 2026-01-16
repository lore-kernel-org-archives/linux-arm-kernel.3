Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FAEC98301
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNw0G5UX6jHHFL9B5r2oWYsVSH+1fKgC4FwezRr1MuQ=; b=i+1KAif2fQgvwSyIAucA96E1kl
	BpdYxoAa4gad7JF+7FSegpxZc9KnaLk1Vr+mZf7XQWej+apuXXDQCqttTZiIs+T3MIK+BQXOfHTnv
	/UCeB7ekCS6bceRjHhjlfOSiBTgFBh9DT+AwfS1VSPIP51dMB4E5a1/G2m+T7LcPscuCFauFDWj6R
	RJZvfT9cajXtlt3DoNbKIdyaF9sGAltUYLEVT8mIgOTMX7jb4ZIq22T3hHeJUCu+P7o38L1IzNQi6
	OPznLIvvIsKPzhqbRjRuAmR660M6Q0DCKCo6JY8BZFUbLoCgka5HSOiUHnTif4t11Wd6+5JcvBV6W
	UkWyfQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6Z-0000000Ek9D-14gt;
	Fri, 16 Jan 2026 20:07:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6R-0000000EjyO-3qtz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594047; x=1800130047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u9KONUZZXMIN1MFPlUpAZCGNYH1AMj/Rto7/sC9/R2E=;
  b=Pra+l3aG3rGGjxuFdhv8cOcyEXDnfp0LDLjidJsYidURkjuPQyLqAT5V
   tRy0gSSJ9bBhzMkn/yIO+hYsyOnyrzzrM9gAoBcVTO7OZFm8YwAsODQO4
   jE0s6HFzmXe4TRH/F0SmSYJ5zEcdqTHeqKc36HRDrMIqg12KUTWhoKEJU
   YVB/qSWWAWVvLyeqQaDBSkgIoyVXQA67Etc840Lq7itq+N7sko4GFC+k9
   BTc7zqOYVNqmST8ZJhHKbkx3Y2Eew8kYpMsKSRAXRzpAUsF3UmNys9KeT
   VfIhAJWsWjhaA2XUx4QPugAIHE8ncUUvIUHvlmqKk9Ev4xVTNc9QDgCv7
   Q==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: F7MMxJ+TTSKBkh4ohbnlFA==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042243"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:07 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:07 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 25/31] clk: at91: sama5d4: switch to parent_data and parent_hw
Date: Fri, 16 Jan 2026 13:07:18 -0700
Message-ID: <67141a009da082eacfc2b1959750b479f8e03c63.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120727_967959_04DF3027 
X-CRM114-Status: GOOD (  16.20  )
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

Switch SAMA5D4 clocks to use parent_data and parent_hw where possible.
Having parent_data instead of parent names improves to clock registration
speed and re-parenting. Update clock registration functions to use
clk_hw.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama5d4.c | 112 ++++++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 1ff9286148da..1dd2c81167e9 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -36,9 +36,9 @@ static const struct clk_pcr_layout sama5d4_pcr_layout = {
 	.pid_mask = GENMASK(6, 0),
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	unsigned long flags;
 	u8 id;
 } sama5d4_systemck[] = {
@@ -46,14 +46,14 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
-	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
-	{ .n = "smdck", .p = "smdclk",       .id = 4 },
-	{ .n = "uhpck", .p = "usbck",        .id = 6 },
-	{ .n = "udpck", .p = "usbck",        .id = 7 },
-	{ .n = "pck0",  .p = "prog0",        .id = 8 },
-	{ .n = "pck1",  .p = "prog1",        .id = 9 },
-	{ .n = "pck2",  .p = "prog2",        .id = 10 },
+	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
+	{ .n = "lcdck", .id = 3 },
+	{ .n = "smdck", .id = 4 },
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
+	{ .n = "pck2",  .id = 10 },
 };
 
 static const struct {
@@ -128,12 +128,13 @@ static const struct {
 
 static void __init sama5d4_pmc_setup(struct device_node *np)
 {
-	struct clk_range range = CLK_RANGE(0, 0);
+	struct clk_hw *main_rc_hw, *main_osc_hw, *mainck_hw;
 	const char *slck_name, *mainxtal_name;
+	struct clk_hw *smdck_hw, *usbck_hw, *hw;
+	struct clk_range range = CLK_RANGE(0, 0);
+	struct clk_parent_data parent_data[5];
 	struct pmc_data *sama5d4_pmc;
-	const char *parent_names[5];
 	struct regmap *regmap;
-	struct clk_hw *hw;
 	int i;
 	bool bypass;
 
@@ -158,54 +159,53 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 	if (!sama5d4_pmc)
 		return;
 
-	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
-					   100000000);
-	if (IS_ERR(hw))
+	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
+						   100000000);
+	if (IS_ERR(main_rc_hw))
 		goto err_free;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
-					bypass);
-	if (IS_ERR(hw))
+	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+						 &AT91_CLK_PD_NAME(mainxtal_name), bypass);
+	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
-	parent_names[0] = "main_rc_osc";
-	parent_names[1] = "main_osc";
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
+	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
+	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
+	mainck_hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL, &AT91_CLK_PD_HW(mainck_hw), 0,
 				   &sama5d3_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
+	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, &AT91_CLK_PD_HW(hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d4_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, &AT91_CLK_PD_HW(mainck_hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d4_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
+	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
+	parent_data[1] = AT91_CLK_PD_HW(mainck_hw);
+	parent_data[2] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_UTMI]);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL,
+					   NULL, parent_data,
 					   &at91sam9x5_master_layout,
 					   &mck_characteristics, &mck_lock);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL,
+	hw = at91_clk_register_master_div(regmap, "masterck_div", NULL, &AT91_CLK_PD_HW(hw),
 					  &at91sam9x5_master_layout,
 					  &mck_characteristics, &mck_lock,
 					  CLK_SET_RATE_GATE, 0);
@@ -214,36 +214,35 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 
 	sama5d4_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div", NULL);
+	hw = at91_clk_register_h32mx(regmap, "h32mxck", NULL,
+				     &AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK]));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d4_pmc->chws[PMC_MCK2] = hw;
 
-	parent_names[0] = "plladivck";
-	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	parent_data[0] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_PLLACK]);
+	parent_data[1] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_UTMI]);
+	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_data, 2);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = "plladivck";
-	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	smdck_hw = at91sam9x5_clk_register_smd(regmap, "smdclk", NULL, parent_data, 2);
+	if (IS_ERR(smdck_hw))
 		goto err_free;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
-	parent_names[4] = "masterck_div";
+	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
+	parent_data[1] = AT91_CLK_PD_HW(mainck_hw);
+	parent_data[2] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_UTMI]);
+	parent_data[4] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK]);
 	for (i = 0; i < 3; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 5, i,
+						    NULL, parent_data, 5, i,
 						    &at91sam9x5_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -252,9 +251,18 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 		sama5d4_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	sama5d4_systemck[0].parent_hw = sama5d4_pmc->chws[PMC_MCK];
+	sama5d4_systemck[1].parent_hw = sama5d4_pmc->chws[PMC_MCK];
+	sama5d4_systemck[2].parent_hw = smdck_hw;
+	sama5d4_systemck[3].parent_hw = usbck_hw;
+	sama5d4_systemck[4].parent_hw = usbck_hw;
+	sama5d4_systemck[5].parent_hw = sama5d4_pmc->pchws[0];
+	sama5d4_systemck[6].parent_hw = sama5d4_pmc->pchws[1];
+	sama5d4_systemck[7].parent_hw = sama5d4_pmc->pchws[2];
 	for (i = 0; i < ARRAY_SIZE(sama5d4_systemck); i++) {
-		hw = at91_clk_register_system(regmap, sama5d4_systemck[i].n,
-					      sama5d4_systemck[i].p, NULL,
+		hw = at91_clk_register_system(regmap, sama5d4_systemck[i].n, NULL,
+					      &AT91_CLK_PD_HW(sama5d4_systemck[i].parent_hw),
 					      sama5d4_systemck[i].id,
 					      sama5d4_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -267,7 +275,8 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sama5d4_pcr_layout,
 							 sama5d4_periphck[i].n,
-							 "masterck_div", NULL,
+							 NULL,
+							 &AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK]),
 							 sama5d4_periphck[i].id,
 							 &range, INT_MIN,
 							 sama5d4_periphck[i].flags);
@@ -281,7 +290,8 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sama5d4_pcr_layout,
 							 sama5d4_periph32ck[i].n,
-							 "h32mxck", NULL,
+							 NULL,
+							 &AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK2]),
 							 sama5d4_periph32ck[i].id,
 							 &range, INT_MIN, 0);
 		if (IS_ERR(hw))
-- 
2.43.0


