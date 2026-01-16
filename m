Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06147C98304
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6neESFnrQDbEJu74fPv9juMnjaV9x4P0DLg27+4rKw=; b=xi2ikyWISF4E3czxieXDSKEagx
	tSUQTba8CdEQka6d6ngcu99qjACgJn15VUEkhhSX83PYHDxiDOCg2PW0MYYzElI4eo4JktMwACxZk
	GBH89cWNJHxc1zryqapmwVAaJgn5iI+as0BRcJHXFOmc+pebSRF91hAhb/YzrYWCoRiqUfciuw6ZX
	WI5qRmV9/nw5rpyn8OBRnbh2u4v3bIEcn3vMFv+xGM43biovMfxhMxrWD9qMH0C5zVArA3EXdeEj/
	NaC+Ky6RN8PNESDuTKCnMQ55SPSrHW94rKIffFKpcwkYw5U2arTnfiFKEIumKW7V+1Dtm+sFGu3h+
	CtRKGReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6Z-0000000EkAI-45N8;
	Fri, 16 Jan 2026 20:07:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6S-0000000Ejy3-3JSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594048; x=1800130048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XOrLmDo0oGGZJwZMsl4Pm7e6/n02yWFCI7Nm5wQaK7M=;
  b=TY4UmhnXkQ+d7HovFgTd1o0K+uPl6ARJKE/Fy13jhX8Zzo3Lpsn5bWU2
   AUgAQmnhM7iEsLF8mSlHdNsbgdsoYEfIVevYHKqTTBdGgvbVEc0s/oFVL
   Xx42fiGutk9VmDS4yDcrUyVfDaVeZKw8ppgl2zFoWsDBVBwEZ592hnqpB
   r2BZpkhBwdZSp2Z+BiUhQJCa9anGhB7NQsOJq+lAS5/U2BVQTGyKfjwI7
   OzeuG9bTfwOCYMjfw2oKfihZMsCf4aZx4UjMiSqCxGwllTRlPZN/c18ff
   xNB5UvU7pbV8KcUMT/2TNi1KUfDa03PEMcZXxrVy2Gdqc5DGJ4IHNiVq7
   g==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: iEJe53QyQOa4M5YYxeqD2A==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042247"
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
Subject: [PATCH v5 27/31] clk: at91: at91rm9200: switch to parent_hw and parent_data
Date: Fri, 16 Jan 2026 13:07:20 -0700
Message-ID: <806fd8452ad32be1d129fd541b5cbd1be7fbb9f1.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120728_879306_DA4E5FE7 
X-CRM114-Status: GOOD (  14.54  )
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

Switch AT91RM9200 clocks to use parent_hw and parent_data where possible.
Having parent_hw instead of parent names improves to clock registration
speed and re-parenting. Update clock registration functions to use
clk_hw struct.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/at91rm9200.c | 79 ++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index 623e232ec9c6..20bb51ec683f 100644
--- a/drivers/clk/at91/at91rm9200.c
+++ b/drivers/clk/at91/at91rm9200.c
@@ -11,7 +11,7 @@ static DEFINE_SPINLOCK(rm9200_mck_lock);
 
 struct sck {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	u8 id;
 };
 
@@ -39,13 +39,13 @@ static const struct clk_pll_characteristics rm9200_pll_characteristics = {
 	.out = rm9200_pll_out,
 };
 
-static const struct sck at91rm9200_systemck[] = {
-	{ .n = "udpck", .p = "usbck",    .id = 1 },
-	{ .n = "uhpck", .p = "usbck",    .id = 4 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
-	{ .n = "pck2",  .p = "prog2",    .id = 10 },
-	{ .n = "pck3",  .p = "prog3",    .id = 11 },
+static struct sck at91rm9200_systemck[] = {
+	{ .n = "udpck", .id = 1 },
+	{ .n = "uhpck", .id = 4 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
+	{ .n = "pck2",  .id = 10 },
+	{ .n = "pck3",  .id = 11 },
 };
 
 static const struct pck at91rm9200_periphck[] = {
@@ -77,11 +77,11 @@ static const struct pck at91rm9200_periphck[] = {
 static void __init at91rm9200_pmc_setup(struct device_node *np)
 {
 	const char *slowxtal_name, *mainxtal_name;
+	struct clk_hw *usbck_hw, *main_osc_hw, *hw;
+	struct clk_parent_data parent_data[6];
 	struct pmc_data *at91rm9200_pmc;
 	u32 usb_div[] = { 1, 2, 0, 0 };
-	const char *parent_names[6];
 	struct regmap *regmap;
-	struct clk_hw *hw;
 	int i;
 	bool bypass;
 
@@ -108,18 +108,21 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
-					bypass);
-	if (IS_ERR(hw))
+	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+						 &AT91_CLK_PD_NAME(mainxtal_name),
+						 bypass);
+	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
-	hw = at91_clk_register_rm9200_main(regmap, "mainck", "main_osc", NULL);
+	hw = at91_clk_register_rm9200_main(regmap, "mainck", NULL,
+					   &AT91_CLK_PD_HW(main_osc_hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91rm9200_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL,
+				   &AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_MAIN]), 0,
 				   &at91rm9200_pll_layout,
 				   &rm9200_pll_characteristics);
 	if (IS_ERR(hw))
@@ -127,7 +130,8 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
 	at91rm9200_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllbck", "mainck", NULL, 1,
+	hw = at91_clk_register_pll(regmap, "pllbck", NULL,
+				   &AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_MAIN]), 1,
 				   &at91rm9200_pll_layout,
 				   &rm9200_pll_characteristics);
 	if (IS_ERR(hw))
@@ -135,20 +139,19 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
 	at91rm9200_pmc->chws[PMC_PLLBCK] = hw;
 
-	parent_names[0] = slowxtal_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack";
-	parent_names[3] = "pllbck";
+	parent_data[0] = AT91_CLK_PD_NAME(slowxtal_name);
+	parent_data[1] = AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_PLLBCK]);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL,
+					   NULL, parent_data,
 					   &at91rm9200_master_layout,
 					   &rm9200_mck_characteristics,
 					   &rm9200_mck_lock);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL,
+	hw = at91_clk_register_master_div(regmap, "masterck_div", NULL, &AT91_CLK_PD_HW(hw),
 					  &at91rm9200_master_layout,
 					  &rm9200_mck_characteristics,
 					  &rm9200_mck_lock, CLK_SET_RATE_GATE, 0);
@@ -157,21 +160,23 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
 	at91rm9200_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91rm9200_clk_register_usb(regmap, "usbck", "pllbck", NULL, usb_div);
-	if (IS_ERR(hw))
+	usbck_hw = at91rm9200_clk_register_usb(regmap, "usbck", NULL,
+					       &AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_PLLBCK]),
+					       usb_div);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = slowxtal_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack";
-	parent_names[3] = "pllbck";
+	parent_data[0] = AT91_CLK_PD_NAME(slowxtal_name);
+	parent_data[1] = AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_PLLBCK]);
 	for (i = 0; i < 4; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 4, i,
+						    NULL, parent_data, 4, i,
 						    &at91rm9200_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -180,9 +185,16 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 		at91rm9200_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	at91rm9200_systemck[0].parent_hw = usbck_hw;
+	at91rm9200_systemck[1].parent_hw = usbck_hw;
+	at91rm9200_systemck[2].parent_hw = at91rm9200_pmc->pchws[0];
+	at91rm9200_systemck[3].parent_hw = at91rm9200_pmc->pchws[1];
+	at91rm9200_systemck[4].parent_hw = at91rm9200_pmc->pchws[2];
+	at91rm9200_systemck[5].parent_hw = at91rm9200_pmc->pchws[3];
 	for (i = 0; i < ARRAY_SIZE(at91rm9200_systemck); i++) {
-		hw = at91_clk_register_system(regmap, at91rm9200_systemck[i].n,
-					      at91rm9200_systemck[i].p, NULL,
+		hw = at91_clk_register_system(regmap, at91rm9200_systemck[i].n, NULL,
+					      &AT91_CLK_PD_HW(at91rm9200_systemck[i].parent_hw),
 					      at91rm9200_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
@@ -193,7 +205,8 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 	for (i = 0; i < ARRAY_SIZE(at91rm9200_periphck); i++) {
 		hw = at91_clk_register_peripheral(regmap,
 						  at91rm9200_periphck[i].n,
-						  "masterck_div", NULL,
+						  NULL,
+						  &AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_MCK]),
 						  at91rm9200_periphck[i].id);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.43.0


