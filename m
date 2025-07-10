Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA10C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1oOS9D8vJnZkDp6311p4lymE0OzRh7Qm8lD0QDapx0=; b=NVsXjBomTojSzI5eNhe8Iy82qS
	bFy4L9l1j5uSPq8XdYJpYO8c/JbAn/xSMjynB3jzzAkJJpAN8p5Ch3TeajelCOQPpTHjT3NUn8ggp
	5BwWt7mY6pQWrmNak8zCUIAjwOOI0A6DBuC1efemeZ0NdDdnpthG3E5EWLBPo9Whb19yKTHjxbPya
	IbnBNb5KYbQZScfUToEnB02ro8wSjMPDttc5vbyAFQrn8N+849cCxnYpnbgRMfwLlucnUj5rjSxEh
	NBm3NvRQoXhmtGu/0YkM0WBc1rmr1ORndn/gq098vNQMDPCWF0u0oQGwjmTKxbfHwwZM1ictQT+Qt
	qQGMAAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzJJ-0000000D6y9-3WYF;
	Thu, 10 Jul 2025 22:00:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYe-0000000Ct2N-3wVx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h1oOS9D8vJnZkDp6311p4lymE0OzRh7Qm8lD0QDapx0=; b=nQGvvhueCt1ATC01bhXrIX8t1B
	axvigKpo0qyPjKhCMEPbm8MuiKDFJ2zqxHKQuFLxUHmLCNOi9rI1w0ESEOeUl8l9FrmXOVg+mdVW4
	p/m5UFIWNHgrsQjeXpKQwYuvRPolLeOl3kRxNTVU47u7uh3jYtCXpkdwnfbQY6O3C9EXKnBRMedzY
	9LkotgyjB3Zj4Cx5hlUplVU1QIqhvaxDyd7TES140GeitdkTkGr89WC3ej9aTS/ilEaznVUh/WbRL
	eN0rewfgwOSxnd/Difn3WOauBaYilgUSxJMC3X3Kp3Z61PpcdTnA18zNVGqJ+bgM/EK4NV0s0H+Tj
	0Wj9Jgjw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYb-000000098nE-2J8B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178070; x=1783714070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jzYztbhucQBjrkyhvMzJJ6CLrRz/GWzZeFHmLtaV35c=;
  b=OKjjNoDkQYiyvMR2/218z9NSZ1Xh4S4XAK+FG/ZzZvVlqOmwpF3lri1z
   yqW/utc08l41D4KuN1ezVST6IGoXPQuj1AII4FkI7Tm3aghDrKq2od9OA
   h0wC+Wu8bJ0l7sOZIzk3MHbsmJwmvL5g/nrx3awAtcngzO5WsRoJdFN9r
   WmDCV5wR9rRv3kpfpWXuMN3zVM+QA/sROf+uvaApIwKDF+/BTIRPkPwq0
   6CjbZnSlbRITjgPnULlQNklVAJomft/5M+rkllzLdIzJQYpdolFP53qwd
   kZsn+lRA6pFNamxt3+iJPg641rERkaT3NEIYt5a8m2M8UiliSwhUELwpT
   A==;
X-CSE-ConnectionGUID: qOQSLemoQZOGUxBCHa7nXg==
X-CSE-MsgGUID: 3RNE+kkESJ6BXYfE3Cmu7A==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="275215684"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Jul 2025 13:07:34 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 10 Jul 2025 13:07:34 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>
Subject: [PATCH v3 26/32] clk: at91: at91sam9x5: switch to parent_hw and parent_data
Date: Thu, 10 Jul 2025 13:07:19 -0700
Message-ID: <95cbe3653752bc3c0b6f068949706313e3778fe5.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210750_150121_A5A3DF25 
X-CRM114-Status: GOOD (  17.16  )
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

Switch AT91SAM9X5 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/at91sam9x5.c | 125 ++++++++++++++++++----------------
 1 file changed, 65 insertions(+), 60 deletions(-)

diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 13331e015dd7..f6138622ab50 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -38,9 +38,9 @@ static const struct clk_pll_characteristics plla_characteristics = {
 	.out = plla_out,
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	unsigned long flags;
 	u8 id;
 } at91sam9x5_systemck[] = {
@@ -48,12 +48,12 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
-	{ .n = "smdck", .p = "smdclk",   .id = 4 },
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
+	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
+	{ .n = "smdck", .id = 4 },
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
 };
 
 static const struct clk_pcr_layout at91sam9x5_pcr_layout = {
@@ -133,25 +133,16 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 					const struct pck *extra_pcks,
 					bool has_lcdck)
 {
+	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
+	struct clk_hw *main_rc_hw, *main_osc_hw, *hw;
+	u8 slow_clk_index = 0, main_xtal_index = 0;
 	struct clk_range range = CLK_RANGE(0, 0);
-	const char *slck_name, *mainxtal_name;
+	struct clk_parent_data parent_data[6];
+	struct clk_hw *smdck_hw, *usbck_hw;
 	struct pmc_data *at91sam9x5_pmc;
-	const char *parent_names[6];
 	struct regmap *regmap;
-	struct clk_hw *hw;
-	int i;
 	bool bypass;
-
-	i = of_property_match_string(np, "clock-names", "slow_clk");
-	if (i < 0)
-		return;
-
-	slck_name = of_clk_get_parent_name(np, i);
-
-	i = of_property_match_string(np, "clock-names", "main_xtal");
-	if (i < 0)
-		return;
-	mainxtal_name = of_clk_get_parent_name(np, i);
+	int i;
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
@@ -162,56 +153,59 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	if (!at91sam9x5_pmc)
 		return;
 
-	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
-					   50000000);
-	if (IS_ERR(hw))
+	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
+						   50000000);
+	if (IS_ERR(main_rc_hw))
 		goto err_free;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
-					bypass);
-	if (IS_ERR(hw))
+	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
+						 bypass);
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
 
 	at91sam9x5_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL,
+				   &AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MAIN]), 0,
 				   &at91rm9200_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
+	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, &AT91_CLK_PD_HW(hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9x5_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL,
+				    &AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MAIN]));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9x5_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
+	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_UTMI]);
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
@@ -220,28 +214,30 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 
 	at91sam9x5_pmc->chws[PMC_MCK] = hw;
 
-	parent_names[0] = "plladivck";
-	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	parent_data[0] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_PLLACK]);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_UTMI]);
+	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_data, 2);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	parent_data[0] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_PLLACK]);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_UTMI]);
+	smdck_hw = at91sam9x5_clk_register_smd(regmap, "smdclk", NULL, parent_data, 2);
+	if (IS_ERR(smdck_hw))
 		goto err_free;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
-	parent_names[4] = "masterck_div";
+	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_UTMI]);
+	parent_data[4] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MCK]);
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 5, i,
+						    NULL, parent_data, 5, i,
 						    &at91sam9x5_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -250,9 +246,16 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 		at91sam9x5_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	at91sam9x5_systemck[0].parent_hw = at91sam9x5_pmc->chws[PMC_MCK];
+	at91sam9x5_systemck[1].parent_hw = smdck_hw;
+	at91sam9x5_systemck[2].parent_hw = usbck_hw;
+	at91sam9x5_systemck[3].parent_hw = usbck_hw;
+	at91sam9x5_systemck[4].parent_hw = at91sam9x5_pmc->pchws[0];
+	at91sam9x5_systemck[5].parent_hw = at91sam9x5_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(at91sam9x5_systemck); i++) {
-		hw = at91_clk_register_system(regmap, at91sam9x5_systemck[i].n,
-					      at91sam9x5_systemck[i].p, NULL,
+		hw = at91_clk_register_system(regmap, at91sam9x5_systemck[i].n, NULL,
+					      &AT91_CLK_PD_HW(at91sam9x5_systemck[i].parent_hw),
 					      at91sam9x5_systemck[i].id,
 					      at91sam9x5_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -262,8 +265,8 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	}
 
 	if (has_lcdck) {
-		hw = at91_clk_register_system(regmap, "lcdck", "masterck_div",
-					      NULL, 3, 0);
+		hw = at91_clk_register_system(regmap, "lcdck", NULL,
+					      &AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MCK]), 3, 0);
 		if (IS_ERR(hw))
 			goto err_free;
 
@@ -274,7 +277,8 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &at91sam9x5_pcr_layout,
 							 at91sam9x5_periphck[i].n,
-							 "masterck_div", NULL,
+							 NULL,
+							 &AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MCK]),
 							 at91sam9x5_periphck[i].id,
 							 &range, INT_MIN, 0);
 		if (IS_ERR(hw))
@@ -287,7 +291,8 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &at91sam9x5_pcr_layout,
 							 extra_pcks[i].n,
-							 "masterck_div", NULL,
+							 NULL,
+							 &AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MCK]),
 							 extra_pcks[i].id,
 							 &range, INT_MIN, 0);
 		if (IS_ERR(hw))
-- 
2.43.0


