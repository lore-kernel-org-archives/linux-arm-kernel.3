Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92679C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 21:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DH38jih2wBvwR0GzGL5iHGio6oGVtcrjjH1qZMSSWg=; b=1oYclbvq+/RD2/bO2EKFIQNRPl
	2kYu7yeoRjbVM6cfvY4f2isGbRS7ibCOlyrsLPXFNBQZnP6NMIRzQa/ZeFcUjjGz1cG8j6z1/TLeA
	fLYtX0jZ/RqLXvJHnjtAVPLy9uMlRyV7cXceqZJfP/r+gBJAFBCi9mB91nLO0f32a96j318Sab+tH
	lAmq/NMem4LcQiZ4HBf5SNgRqnzENWVrv/CVKCseWuDugpPPM11qxZazBWzCCpPBTjx+O9GGUDFlt
	RMAR2O+UhcjPZjNEyvwyIjpVC0fSA1BfNYWwHNok/Efl7JW5Z+h/8KcUpe7WKEDAoCO0ZnxGOHg7U
	eX+K24kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzH1-0000000D6ks-0WXo;
	Thu, 10 Jul 2025 21:57:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYd-0000000CsxW-12uZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178072; x=1783714072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uSbOsS3FXv1UTdeQlZUIeau4pGAIq3naxncUHCNStF0=;
  b=mGeqAp3W+c9W38ZIy5nTWXOdtvpwC7/IW0O5h0rTRaZazHTGKBg/mnD2
   oFuvgZ32dSbOIvXB9KNGxzHfboWCcHeJBo+uQyrZj0CBnNz56+7/xIoae
   1Q2CCdz70vntFfG2qHxKzNQgpmuSnJ8UvNw7TFNQuxDXouNi1H9e82K8V
   1FdIjXyqKRHa6f4RnuxhhGJyZlXqalDP++tI/XmASBebe7pbvb/fWyOd2
   Cblld08DCetV95cGs2nr0rsOxqQ9QDaNFqNvRRqYR0tzS0zRYwwTkGWMD
   FFPNaOBOGvARfBGdG7Uhktvn7YBKt9L3akqfCVZrLCOz1KUXVbGKSMH/K
   w==;
X-CSE-ConnectionGUID: qOQSLemoQZOGUxBCHa7nXg==
X-CSE-MsgGUID: 08JIcXYiRxm8MJmwoTxBEg==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="275215687"
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
Subject: [PATCH v3 29/32] clk: at91: at91sam9g45: switch to parent_hw and parent_data
Date: Thu, 10 Jul 2025 13:07:22 -0700
Message-ID: <21100b0a61e22028b471555c6684c545ff3a9400.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_130751_298522_4B7EFFC2 
X-CRM114-Status: GOOD (  17.45  )
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

Switch AT91SAM9G45 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/at91sam9g45.c | 89 +++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index cb98d22c2e30..54cc4e1bbdc3 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -37,9 +37,9 @@ static const struct clk_pll_characteristics plla_characteristics = {
 	.out = plla_out,
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	unsigned long flags;
 	u8 id;
 } at91sam9g45_systemck[] = {
@@ -47,10 +47,10 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
-	{ .n = "uhpck", .p = "usbck",        .id = 6 },
-	{ .n = "pck0",  .p = "prog0",        .id = 8 },
-	{ .n = "pck1",  .p = "prog1",        .id = 9 },
+	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
 };
 
 struct pck {
@@ -92,24 +92,14 @@ static const struct pck at91sam9g45_periphck[] = {
 
 static void __init at91sam9g45_pmc_setup(struct device_node *np)
 {
-	const char *slck_name, *mainxtal_name;
+	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
+	u8 slow_clk_index = 0, main_xtal_index = 1;
+	struct clk_parent_data parent_data[5];
 	struct pmc_data *at91sam9g45_pmc;
-	const char *parent_names[6];
+	struct clk_hw *usbck_hw, *hw;
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
@@ -123,40 +113,43 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
+	hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+					&AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
 					bypass);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_rm9200_main(regmap, "mainck", "main_osc", NULL);
+	hw = at91_clk_register_rm9200_main(regmap, "mainck", NULL, &AT91_CLK_PD_HW(hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9g45_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL,
+				   &AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_MAIN]), 0,
 				   &at91rm9200_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
+	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, &AT91_CLK_PD_HW(hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9g45_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL,
+				    &AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_MAIN]));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9g45_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
+	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_UTMI]);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL,
+					   NULL, parent_data,
 					   &at91rm9200_master_layout,
 					   &mck_characteristics,
 					   &at91sam9g45_mck_lock);
@@ -164,7 +157,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL,
+					  NULL, &AT91_CLK_PD_HW(hw),
 					  &at91rm9200_master_layout,
 					  &mck_characteristics,
 					  &at91sam9g45_mck_lock,
@@ -174,24 +167,24 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 
 	at91sam9g45_pmc->chws[PMC_MCK] = hw;
 
-	parent_names[0] = "plladivck";
-	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	parent_data[0] = AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_PLLACK]);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_UTMI]);
+	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_data, 2);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
-	parent_names[4] = "masterck_div";
+	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_UTMI]);
+	parent_data[4] = AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_MCK]);
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 5, i,
+						    NULL, parent_data, 5, i,
 						    &at91sam9g45_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -200,9 +193,14 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 		at91sam9g45_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	at91sam9g45_systemck[0].parent_hw = at91sam9g45_pmc->chws[PMC_MCK];
+	at91sam9g45_systemck[1].parent_hw = usbck_hw;
+	at91sam9g45_systemck[2].parent_hw = at91sam9g45_pmc->pchws[0];
+	at91sam9g45_systemck[3].parent_hw = at91sam9g45_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(at91sam9g45_systemck); i++) {
-		hw = at91_clk_register_system(regmap, at91sam9g45_systemck[i].n,
-					      at91sam9g45_systemck[i].p, NULL,
+		hw = at91_clk_register_system(regmap, at91sam9g45_systemck[i].n, NULL,
+					      &AT91_CLK_PD_HW(at91sam9g45_systemck[i].parent_hw),
 					      at91sam9g45_systemck[i].id,
 					      at91sam9g45_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -214,7 +212,8 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	for (i = 0; i < ARRAY_SIZE(at91sam9g45_periphck); i++) {
 		hw = at91_clk_register_peripheral(regmap,
 						  at91sam9g45_periphck[i].n,
-						  "masterck_div", NULL,
+						  NULL,
+						  &AT91_CLK_PD_HW(at91sam9g45_pmc->chws[PMC_MCK]),
 						  at91sam9g45_periphck[i].id);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.43.0


