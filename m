Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBE6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rN9crZQwa829klYKtrB43tN/i7Kes3bnrrK4amlyO0=; b=shT6Sxa/0SCnYwPuHKQdMtrLpu
	85SbGI4YNOfin/Jl81Jh43z6/CZNp1WwtDOiCzBMqA/R/Uvt4hBdUibhwKNxeycpcgfDKLBWFsL/L
	P+ZYz/4ecp5jDAi1gDBZLOpgwjqbocnnV+X2mcb7K1Ispdxu1rnfnuwnDhPiE3YQATZI3h0o1umRY
	WByciHP7kEUO7932q/VWYNgathjogz0Q81+0XvrEOpG+n5oFi1AzLDLJCc/yQXj2GKOGymuvzQ+TH
	oVKpfr8uCHe847opemuUS6LYqOtXEFWrpNa302y3vHaQye607NlubCOb4XUSIzMp8XgDOqEljQYTR
	Rn2abp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzSX-0000000D86s-3K3n;
	Thu, 10 Jul 2025 22:09:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYi-0000000Ct3m-0bjF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8rN9crZQwa829klYKtrB43tN/i7Kes3bnrrK4amlyO0=; b=gaUVJOrVSVU+1HK9vpcSiFlVwU
	lXlCAcwItNESGeKOKAUxTp90GOOHDt/4bFlV6UTarXzGwQZ2nUjscJMEpb2w0xdKyushnIaB3Vbhr
	Tr56LqcRCJ3h/bnFlt7JKlt6nNddUQmxaXQZSth9h0TWPSs8pGUL/DisG5UpE1lWvf++6IYlJ4wv+
	vHY8VgqDTB78/L9P3+ywvDzYKs0eeznYWBiDLJA6CcENvHRNWGrsRKW9jsht9DoGpESHON0pN7b7A
	eL+Nr5BQhIP4PruuJsdafQfEUzBTcFYaSji+WViLKtZ6Ih5KFZQ8h6sxDdAsMgYFHQswA7F+/wRyS
	+ww647ww==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYe-000000098mU-23jB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178073; x=1783714073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tqLyTJ/R1N6GSxPsKi/6prq6NuZYzrpB23w6AH6DbSw=;
  b=PR4LnRb6xauKukPTXuzRPtUHLG4SMBMNlr3qHNWqB4yZZq8ZPZvdePTJ
   qa40Rhik5D1ai6moi0OoMSkKzbg9lB0jHiEF9z731pIJXNlKNSmX33KVa
   FkQYUwX0AfQrOSG1Wec2LWouEp2q9RtMs3H8DUWuQUx/mCce5MfA1JB8F
   cRLcQINZQ2zzDlUWXZvaISch9U4W94LC8OPYL2zaCKhd9ycr/gUXVuQf2
   pLEQZ0LIiLN70DdxJ7zx1lVh1W5P7/XJwA1lR6/Wv+5RdBl9xT8WLspQo
   UKixJGmA05bxMuDf4f5XJ2jkyino/F/alv9/1SBd19WAhZFCXgT+MLGH5
   A==;
X-CSE-ConnectionGUID: qOQSLemoQZOGUxBCHa7nXg==
X-CSE-MsgGUID: k/ggPkAwQgao9E5iDykMoA==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="275215689"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:41 -0700
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
Subject: [PATCH v3 31/32] clk: at91: at91sam9rl: switch to clk_parent_data
Date: Thu, 10 Jul 2025 13:07:24 -0700
Message-ID: <d69e0e09d03bbd2dc6c5c83f9cefc6aa1c5914df.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210753_275929_E476F497 
X-CRM114-Status: GOOD (  14.76  )
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
index 0e8657aac491..5b342b707213 100644
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
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
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


