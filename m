Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C61C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoMnaB+b+lvsINB8I24rzueLAoeqmF8kWqd3/FKLBUk=; b=fyBZZVfslQ+IHi4HfeeiZmJla4
	8spc/FbFTwMH8wtExRtSOsKuWkGkhNSbNRlYNzl+i6ZIWK85/+muNFvRu2lMc1QwI4TUqT2AQqz++
	d4u4lWeSJVn1ENfzB3AUhFcKJNC2CiM7dVt8gLHSvYH9UOpZYRygemAaR3Jux26uCKC6QGAYAcfD3
	RP2OQqME4NH2FtV2jv9rsn1RlCactPZyAtks3w9dmnauBabEyEWANtm/j785qc7zgUiLFKxauCTlm
	C5wBQYpE8K3/D5cDfZhea/z5G2Kz2PKTFUl3xgaXT9iy+9aiA5ag77sLV0Gghvyj6FUq78tW7O0OY
	nq5nfOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq7R-0000000ElFE-0Rp3;
	Fri, 16 Jan 2026 20:08:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6k-0000000EkN6-1o7T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594067; x=1800130067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ooDYCmBCZih6oejY6gt4+eT3U3V3rEDD88ZRToGBFxQ=;
  b=eDl9DYYXLRVvpzKgC03HfjemL8DmV3m9bWqe/4oMvjQsb28oL2y6geL1
   WN1xVHuFfmpkwZkw12MjMlztQSZKEmedyoVw3420CoJl9TD0HObi9zLKY
   cpMR+WeKeXDSEr6LCppgpmL5pS2O5cN4EQyamf57No+XBOWKsFJhDXZk3
   eQroRQlUsXCX/HTN6z+VADzulBX72U2RLL3XmKX7P+7MexDp9qgG+zQu3
   A1J9lbdplCO4HmDYRTUpwDehFC9b+2I5QEL1FfEAI7YD1Q777NTbyXKJg
   GfGW98NkyRj4KqvuNrWlHQ7mc7a300haUZ9HskqNJX0nvwMXaqsgTxcjL
   g==;
X-CSE-ConnectionGUID: MqTcJu0RSESfeq27zLZvsQ==
X-CSE-MsgGUID: nanzQAmhQhWZl+2FzKF+Sg==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="52013864"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jan 2026 13:07:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 16 Jan 2026 13:07:07 -0700
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
Subject: [PATCH v5 23/31] clk: at91: sama5d2: switch to parent_hw and parent_data
Date: Fri, 16 Jan 2026 13:07:16 -0700
Message-ID: <df4421219824d026b0183d5469bbb658ffd7a40e.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120746_872135_0D83AC84 
X-CRM114-Status: GOOD (  17.10  )
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

Switch SAMA5D2 clocks to use parent_data and parent_hw whenever possible.
Having parent_data instead of parent names improves to clock registration
speed and re-parenting. Update the clock registration functions to use
parent_data and to use clk_hw Macros.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Adjust commit message.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama5d2.c | 153 ++++++++++++++++++++-----------------
 1 file changed, 83 insertions(+), 70 deletions(-)

diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index f5d6c7a96cf2..cfff4aabdb3a 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -37,9 +37,9 @@ static const struct clk_pcr_layout sama5d2_pcr_layout = {
 	.pid_mask = GENMASK(6, 0),
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	unsigned long flags;
 	u8 id;
 } sama5d2_systemck[] = {
@@ -47,14 +47,14 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
-	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
-	{ .n = "uhpck", .p = "usbck",        .id = 6 },
-	{ .n = "udpck", .p = "usbck",        .id = 7 },
-	{ .n = "pck0",  .p = "prog0",        .id = 8 },
-	{ .n = "pck1",  .p = "prog1",        .id = 9 },
-	{ .n = "pck2",  .p = "prog2",        .id = 10 },
-	{ .n = "iscck", .p = "masterck_div", .id = 18 },
+	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
+	{ .n = "lcdck", .id = 3 },
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
+	{ .n = "pck2",  .id = 10 },
+	{ .n = "iscck", .id = 18 },
 };
 
 static const struct {
@@ -164,12 +164,12 @@ static const struct clk_programmable_layout sama5d2_programmable_layout = {
 
 static void __init sama5d2_pmc_setup(struct device_node *np)
 {
-	struct clk_range range = CLK_RANGE(0, 0);
+	struct clk_hw *hw, *audio_fracck_hw, *usbck_hw, *main_rc_hw, *main_osc_hw;
 	const char *slck_name, *mainxtal_name;
-	struct pmc_data *sama5d2_pmc;
-	const char *parent_names[6];
+	struct clk_range range = CLK_RANGE(0, 0);
+	struct clk_parent_data parent_data[6];
 	struct regmap *regmap, *regmap_sfr;
-	struct clk_hw *hw;
+	struct pmc_data *sama5d2_pmc;
 	int i;
 	bool bypass;
 
@@ -195,51 +195,51 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	if (!sama5d2_pmc)
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
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d2_pmc->chws[PMC_MAIN] = hw;
-
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL,
+				   &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]), 0,
 				   &sama5d3_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
+	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, &AT91_CLK_PD_HW(hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d2_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_audio_pll_frac(regmap, "audiopll_fracck",
-					      "mainck", NULL);
-	if (IS_ERR(hw))
+	audio_fracck_hw = at91_clk_register_audio_pll_frac(regmap, "audiopll_fracck", NULL,
+							   &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]));
+	if (IS_ERR(audio_fracck_hw))
 		goto err_free;
 
-	hw = at91_clk_register_audio_pll_pad(regmap, "audiopll_padck",
-					     "audiopll_fracck", NULL);
+	hw = at91_clk_register_audio_pll_pad(regmap, "audiopll_padck", NULL,
+					     &AT91_CLK_PD_HW(audio_fracck_hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d2_pmc->chws[PMC_AUDIOPINCK] = hw;
 
-	hw = at91_clk_register_audio_pll_pmc(regmap, "audiopll_pmcck",
-					     "audiopll_fracck", NULL);
+	hw = at91_clk_register_audio_pll_pmc(regmap, "audiopll_pmcck", NULL,
+					     &AT91_CLK_PD_HW(audio_fracck_hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -249,25 +249,26 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap_sfr))
 		regmap_sfr = NULL;
 
-	hw = at91_clk_register_utmi(regmap, regmap_sfr, "utmick", "mainck", NULL);
+	hw = at91_clk_register_utmi(regmap, regmap_sfr, "utmick", NULL,
+				    &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d2_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
+	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
+	parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_UTMI]);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL,
+					   NULL, parent_data,
 					   &at91sam9x5_master_layout,
 					   &mck_characteristics, &mck_lock);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL,
+	hw = at91_clk_register_master_div(regmap, "masterck_div", NULL,
+					  &AT91_CLK_PD_HW(hw),
 					  &at91sam9x5_master_layout,
 					  &mck_characteristics, &mck_lock,
 					  CLK_SET_RATE_GATE, 0);
@@ -276,31 +277,32 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 
 	sama5d2_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div", NULL);
+	hw = at91_clk_register_h32mx(regmap, "h32mxck", NULL,
+				     &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MCK]));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d2_pmc->chws[PMC_MCK2] = hw;
 
-	parent_names[0] = "plladivck";
-	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	parent_data[0] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_PLLACK]);
+	parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_UTMI]);
+	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_data, 2);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
-	parent_names[4] = "masterck_div";
-	parent_names[5] = "audiopll_pmcck";
+	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
+	parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_UTMI]);
+	parent_data[4] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MCK]);
+	parent_data[5] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_AUDIOPLLCK]);
 	for (i = 0; i < 3; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 6, i,
+						    NULL, parent_data, 6, i,
 						    &sama5d2_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -309,9 +311,18 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		sama5d2_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	sama5d2_systemck[0].parent_hw = sama5d2_pmc->chws[PMC_MCK];
+	sama5d2_systemck[1].parent_hw = sama5d2_pmc->chws[PMC_MCK];
+	sama5d2_systemck[2].parent_hw = usbck_hw;
+	sama5d2_systemck[3].parent_hw = usbck_hw;
+	sama5d2_systemck[4].parent_hw = sama5d2_pmc->pchws[0];
+	sama5d2_systemck[5].parent_hw = sama5d2_pmc->pchws[1];
+	sama5d2_systemck[6].parent_hw = sama5d2_pmc->pchws[2];
+	sama5d2_systemck[7].parent_hw = sama5d2_pmc->chws[PMC_MCK];
 	for (i = 0; i < ARRAY_SIZE(sama5d2_systemck); i++) {
-		hw = at91_clk_register_system(regmap, sama5d2_systemck[i].n,
-					      sama5d2_systemck[i].p, NULL,
+		hw = at91_clk_register_system(regmap, sama5d2_systemck[i].n, NULL,
+					      &AT91_CLK_PD_HW(sama5d2_systemck[i].parent_hw),
 					      sama5d2_systemck[i].id,
 					      sama5d2_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -324,7 +335,8 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sama5d2_pcr_layout,
 							 sama5d2_periphck[i].n,
-							 "masterck_div", NULL,
+							 NULL,
+							 &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MCK]),
 							 sama5d2_periphck[i].id,
 							 &range, INT_MIN,
 							 sama5d2_periphck[i].flags);
@@ -338,7 +350,8 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sama5d2_pcr_layout,
 							 sama5d2_periph32ck[i].n,
-							 "h32mxck", NULL,
+							 NULL,
+							 &AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MCK2]),
 							 sama5d2_periph32ck[i].id,
 							 &sama5d2_periph32ck[i].r,
 							 INT_MIN, 0);
@@ -348,17 +361,17 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		sama5d2_pmc->phws[sama5d2_periph32ck[i].id] = hw;
 	}
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
-	parent_names[4] = "masterck_div";
-	parent_names[5] = "audiopll_pmcck";
+	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
+	parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_UTMI]);
+	parent_data[4] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_MCK]);
+	parent_data[5] = AT91_CLK_PD_HW(sama5d2_pmc->chws[PMC_AUDIOPLLCK]);
 	for (i = 0; i < ARRAY_SIZE(sama5d2_gck); i++) {
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sama5d2_pcr_layout,
 						 sama5d2_gck[i].n,
-						 parent_names, NULL, NULL, 6,
+						 NULL, parent_data, NULL, 6,
 						 sama5d2_gck[i].id,
 						 &sama5d2_gck[i].r,
 						 sama5d2_gck[i].chg_pid);
@@ -369,19 +382,19 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	}
 
 	if (regmap_sfr) {
-		parent_names[0] = "i2s0_clk";
-		parent_names[1] = "i2s0_gclk";
+		parent_data[0] = AT91_CLK_PD_HW(sama5d2_pmc->phws[54]); /* i2s0_clk */
+		parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->ghws[54]); /* i2s0_gclk */
 		hw = at91_clk_i2s_mux_register(regmap_sfr, "i2s0_muxclk",
-					       parent_names, NULL, 2, 0);
+					       NULL, parent_data, 2, 0);
 		if (IS_ERR(hw))
 			goto err_free;
 
 		sama5d2_pmc->chws[PMC_I2S0_MUX] = hw;
 
-		parent_names[0] = "i2s1_clk";
-		parent_names[1] = "i2s1_gclk";
+		parent_data[0] = AT91_CLK_PD_HW(sama5d2_pmc->phws[55]); /* i2s1_clk */
+		parent_data[1] = AT91_CLK_PD_HW(sama5d2_pmc->ghws[55]); /* i2s1_gclk */
 		hw = at91_clk_i2s_mux_register(regmap_sfr, "i2s1_muxclk",
-					       parent_names, NULL, 2, 1);
+					       NULL, parent_data, 2, 1);
 		if (IS_ERR(hw))
 			goto err_free;
 
-- 
2.43.0


