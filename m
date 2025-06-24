Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82D6C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 18:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRsMsx7UbMWfsNNSnWe9ZfCcTdlLMneoXchSx49jXIk=; b=f4ES2LFbbg3Vl+jNQTNa2EV5b8
	jY6ftzPpTnoAD+Y3AZUpSsLIv8BQldD8dsGWAGbbzqKHUQ/PAceYrfLRxoFcmAiTPsOkmLcP804Sk
	ibG7kXTh2wR4+ww21QXiq66N+oxlkRifw1RUTWlJ0XUPSuorSSZ7XadOfjNMVuaFf2T1KAbMRGfCi
	1dHCDkeUi52ccTOfqUyCL95K4iCX6iKxehXhWaahsLEHdTt2foQI/cubmm9MZIoyFjGKHGkZ8wpvh
	rOcu2l8FIy+PJvfs7CZLkayWFUWIYFwANd569dRvgcolmd1gRxkE3lla4HuRE7EAUSNRQlgLGQlPP
	1VZqhGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8Pt-00000006VoY-0P6T;
	Tue, 24 Jun 2025 18:30:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5H1-000000062ei-0IMn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777762; x=1782313762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j4U0G9PmAbm5SXv2TgKAMjj1kvsuGzzoXlg5TgpL514=;
  b=T6+Csz0XPFCKCRuABFU3lxLInlV90QuHsVY1r6WCARlZBQiW3i1w2LeF
   oNzm0BWbqMYJ7wp/K72YWS0NUhoetwFVoP/exhzwGo3HZ4Wwq6uPFxPoT
   sxg97n3n2eJCWolLExn/MoeVOgvu6rBO0s4ZkzqfXRMM7rXlHhyHuD6lU
   /pHnmiaJ9Y/ypZx0WEQLfjoqRmu3SI9o9TZAUma0+lX7MfcIlc+9vSZXB
   xL6JaOftmXqO77RF2hZI3VMAUWWeKAlR4m2wvPIrzjI2lZwxLGUVYdvX9
   I73EiolIa/L2fDs18zsqxQdMMUi/fSLPk0rJDLIY0Y2/SWH/1JuD5g6eD
   g==;
X-CSE-ConnectionGUID: ticneE1VRpCt6c5L3blMOw==
X-CSE-MsgGUID: 45hWAS1ySROWMxp9r7X/gA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="210641600"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:40 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:40 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 29/32] clk: at91: at91sam9rl: switch to clk_parent_data
Date: Tue, 24 Jun 2025 08:08:26 -0700
Message-ID: <330369706e18903b56fbc69926013557802439d0.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080923_176306_0587BE03 
X-CRM114-Status: GOOD (  15.09  )
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

Switch AT91SAM9RL clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/at91sam9rl.c | 63 ++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/at91/at91sam9rl.c b/drivers/clk/at91/at91sam9rl.c
index 969f809e7d65..5b342b707213 100644
--- a/drivers/clk/at91/at91sam9rl.c
+++ b/drivers/clk/at91/at91sam9rl.c
@@ -28,13 +28,12 @@ static const struct clk_pll_characteristics sam9rl_plla_characteristics = {
 	.out = sam9rl_plla_out,
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
 	u8 id;
 } at91sam9rl_systemck[] = {
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
 };
 
 static const struct {
@@ -67,24 +66,14 @@ static const struct {
 
 static void __init at91sam9rl_pmc_setup(struct device_node *np)
 {
-	const char *slck_name, *mainxtal_name;
+	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
+	u8 slow_clk_index = 0, main_xtal_index = 1;
+	struct clk_parent_data parent_data[6];
 	struct pmc_data *at91sam9rl_pmc;
-	const char *parent_names[6];
 	struct regmap *regmap;
 	struct clk_hw *hw;
 	int i;
 
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
-
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
 		return;
@@ -95,13 +84,15 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	if (!at91sam9rl_pmc)
 		return;
 
-	hw = at91_clk_register_rm9200_main(regmap, "mainck", mainxtal_name, NULL);
+	hw = at91_clk_register_rm9200_main(regmap, "mainck", NULL,
+					   &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9rl_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL,
+				   &AT91_CLK_PD_HW(at91sam9rl_pmc->chws[PMC_MAIN]), 0,
 				   &at91rm9200_pll_layout,
 				   &sam9rl_plla_characteristics);
 	if (IS_ERR(hw))
@@ -109,18 +100,19 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 
 	at91sam9rl_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL,
+				    &AT91_CLK_PD_HW(at91sam9rl_pmc->chws[PMC_MAIN]));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	at91sam9rl_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack";
-	parent_names[3] = "utmick";
+	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9rl_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91sam9rl_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91sam9rl_pmc->chws[PMC_UTMI]);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL,
+					   NULL, parent_data,
 					   &at91rm9200_master_layout,
 					   &sam9rl_mck_characteristics,
 					   &sam9rl_mck_lock);
@@ -128,7 +120,7 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL,
+					  NULL, &AT91_CLK_PD_HW(hw),
 					  &at91rm9200_master_layout,
 					  &sam9rl_mck_characteristics,
 					  &sam9rl_mck_lock, CLK_SET_RATE_GATE, 0);
@@ -137,18 +129,18 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 
 	at91sam9rl_pmc->chws[PMC_MCK] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack";
-	parent_names[3] = "utmick";
-	parent_names[4] = "masterck_div";
+	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9rl_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91sam9rl_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91sam9rl_pmc->chws[PMC_UTMI]);
+	parent_data[4] = AT91_CLK_PD_HW(at91sam9rl_pmc->chws[PMC_MCK]);
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 5, i,
+						    NULL, parent_data, 5, i,
 						    &at91rm9200_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -158,8 +150,8 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(at91sam9rl_systemck); i++) {
-		hw = at91_clk_register_system(regmap, at91sam9rl_systemck[i].n,
-					      at91sam9rl_systemck[i].p, NULL,
+		hw = at91_clk_register_system(regmap, at91sam9rl_systemck[i].n, NULL,
+					      &AT91_CLK_PD_HW(at91sam9rl_pmc->pchws[0]),
 					      at91sam9rl_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
@@ -170,7 +162,8 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	for (i = 0; i < ARRAY_SIZE(at91sam9rl_periphck); i++) {
 		hw = at91_clk_register_peripheral(regmap,
 						  at91sam9rl_periphck[i].n,
-						  "masterck_div", NULL,
+						  NULL,
+						  &AT91_CLK_PD_HW(at91sam9rl_pmc->chws[PMC_MCK]),
 						  at91sam9rl_periphck[i].id);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.43.0


