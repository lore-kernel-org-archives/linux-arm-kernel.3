Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767AEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lxTdjbEk1sfLzP0wc/O19h3pFzyNdhq3cCDf6xkISg=; b=Odn6pGkTq14CPd5VIPF0EaMBkw
	f6VKop6h7UCrRb/ogPDLnAZ4BNAHPnLF6Q9nwbfNJUUeP+/Rksv5Ag5Givw/fK/xQfnY30oIYjXiI
	P3SWRc/4inuZNVMO0VP8hyGndPzsvIacrEK4mqx4G4XIkBLJo00keOHXHcil9n5DozhzhqIPeQmc1
	QWFJYTHpN5rUB2f4K7RV9ECKkT0HpysREJzh1xMi7vlrVBkLIZROXiZbB4zk5kNPgUThIBxv7YWKa
	EimYClAsXjQH6l3q0B0FGjTcQprGqXIN7hC30ujtKSDYcLw4ueGfbE9vNwiaDBqUpwdSqIJqidPF0
	HQhA7mAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzLd-0000000D7I1-2VhJ;
	Thu, 10 Jul 2025 22:02:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYf-0000000Ct2O-04Ex
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+lxTdjbEk1sfLzP0wc/O19h3pFzyNdhq3cCDf6xkISg=; b=od927HDqHCy25MA+C3A1pZOJs1
	tkDeRmkyYpV9Af45Q4GVhaRFnOi/EOCyzaHF+hS8GxqGhejKW2JXT0C9R4AcDYpPRvglIRF8ct462
	5SzPBt/1OPjYcPoNuNyCpoRknMtBSePljN3wwQU9DcTCVd0AvKxZqTfdBijDdkuRC08ADUwU8dBaC
	3fbwYjDn4AUO4KBxtju81kv+k2h80H9LmqwA7VbVRXuWYiKQPMcU9MY1bmfhqqs+wivcm/gpL8HhQ
	hVTN5ElK0+bbO29qWYQQ4q35chiHYwPWXQuUVf8SlLzCWj4tA9+yp+JCsvkc5y7zkMQ94lnvKxny0
	w7/FBdhQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYb-000000098mU-2SdU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178070; x=1783714070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0hAK7L1RYs0Sv39pZp/DbF7t/kadiEUNsBjaVw2GFMk=;
  b=LB10F2311RvaV6gGJ8SdAykIovyRY11V3PuofZ8vTY2SqVYIvxK75eD2
   hRKi1FnVUk/XCZckkT2FbddjgoEXCWYwVDPLXOLukLj1nE4/mlYfgSxq0
   3U/LvjraDOCVx04mAaEDs7ByqGAtjWET9IPVMhKp9aJbJd32iqftDcaKo
   sxd/tGf4/QNtr66us+KWb21y7hZ9dfaaxGs8BvPqFf1jihDGy3oY1MpSj
   AbGaq/2K9y0229EQeReGOXBTEhljv3Mw/9W7EIGWUNaRcDRdeCBQ2jQ1h
   NYdMTBGIxru2xUTEVY5fFzUYh0VbXpbO6LTJ6X2idDkQIWyKORi35L4ry
   A==;
X-CSE-ConnectionGUID: qOQSLemoQZOGUxBCHa7nXg==
X-CSE-MsgGUID: vlmqaKiyRa6YYYB1Cz4tvQ==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="275215685"
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
Subject: [PATCH v3 27/32] clk: at91: at91rm9200: switch to parent_hw and parent_data
Date: Thu, 10 Jul 2025 13:07:20 -0700
Message-ID: <a2adb10299993c0d8167a5eb443304022485d4ea.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210750_219525_7E2069A8 
X-CRM114-Status: GOOD (  15.33  )
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

Switch AT91RM9200 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/at91rm9200.c | 95 ++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 46 deletions(-)

diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index 623e232ec9c6..b834ca5ed092 100644
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
@@ -76,25 +76,15 @@ static const struct pck at91rm9200_periphck[] = {
 
 static void __init at91rm9200_pmc_setup(struct device_node *np)
 {
-	const char *slowxtal_name, *mainxtal_name;
+	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
+	struct clk_hw *usbck_hw, *main_osc_hw, *hw;
+	u8 slow_clk_index = 0, main_xtal_index = 1;
+	struct clk_parent_data parent_data[6];
 	struct pmc_data *at91rm9200_pmc;
 	u32 usb_div[] = { 1, 2, 0, 0 };
-	const char *parent_names[6];
 	struct regmap *regmap;
-	struct clk_hw *hw;
-	int i;
 	bool bypass;
-
-	i = of_property_match_string(np, "clock-names", "slow_xtal");
-	if (i < 0)
-		return;
-
-	slowxtal_name = of_clk_get_parent_name(np, i);
-
-	i = of_property_match_string(np, "clock-names", "main_xtal");
-	if (i < 0)
-		return;
-	mainxtal_name = of_clk_get_parent_name(np, i);
+	int i;
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
@@ -108,18 +98,21 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
-					bypass);
-	if (IS_ERR(hw))
+	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
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
@@ -127,7 +120,8 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
 	at91rm9200_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllbck", "mainck", NULL, 1,
+	hw = at91_clk_register_pll(regmap, "pllbck", NULL,
+				   &AT91_CLK_PD_HW(at91rm9200_pmc->chws[PMC_MAIN]), 1,
 				   &at91rm9200_pll_layout,
 				   &rm9200_pll_characteristics);
 	if (IS_ERR(hw))
@@ -135,20 +129,19 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
 	at91rm9200_pmc->chws[PMC_PLLBCK] = hw;
 
-	parent_names[0] = slowxtal_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack";
-	parent_names[3] = "pllbck";
+	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
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
@@ -157,21 +150,23 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
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
+	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
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
@@ -180,9 +175,16 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
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
@@ -193,7 +195,8 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
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


