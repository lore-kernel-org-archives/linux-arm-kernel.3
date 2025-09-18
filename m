Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E7ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgtFq/MA29QqkPhJaASZLF9GXw8xYjR++7AyWDz4ZvY=; b=p/IgC+9xm/3Q8hjRf1GnS0qa7n
	BFWcLs+NtNh6MhF0WGHqPo7QP9xeq0X89ry6jnPyIjK+vadx9MhAA4GlmMv3Pppfqzfllud/k1lzY
	j/0gq9onjPFQmfOXr30Ree6Ntx2d9bwL9SPGeroEebvjBw1/UCCuk+G5aTrBBW0jZ/If8u2p3Rz2U
	FFNp0bzAyadeqhoM3K4VX5Gdt1PYXK9hJakX0N6zK3alDnPxFz4ryVgAKV5OgO7Cw1Szp2DDdttU/
	0pa8JedUZHdz0CRYA7XqnwrQNvBs2NpUTHjT/BWIzyUwX4VEFYinNaHGugCbVZvW3hc/TgGziTEQg
	BcU0Tl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzM0a-00000001Da8-1oVx;
	Thu, 18 Sep 2025 21:17:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzX-00000001CBr-1Znv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230196; x=1789766196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vVhRnuOxtx40U4X6AiR/OMJ1gOwse9+LnGmz9ZDzWwY=;
  b=Pkky1DHSN20JuaIuYMgzMfWjyeEI7gtFUFokobHiNeNkjVN+sVnt/y26
   0/duYKXumw2mxRUoBMzmm/8FBwKWXswgYUp4bmJ/98x0AbYcis5Y6qqG2
   nnwGJ3m+vDZem171JGH7KJMEbq2xTEnEsoewz3eVqLqY+T88e5VggHx7R
   KHhEaw/+1J+b3ZFiyGvCNNU9XKWq9b7eC439DdBwtH9pz+qCi/3bcVYp6
   m+fxhej+87CpNqFYUzJPf8+JgDG6PzSs66vc6wwxxSI1PKk65XeRyPpat
   +ottwlBv3bsPxZlShSepvJCbfsNqWY7tAbSOIqYKDqC8VcUDvHrzQhuvM
   w==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: CW3luNmXSj6B+P7uGSImMg==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071404"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 14:16:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 14:15:55 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 14:15:55 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
Subject: [PATCH v4 28/31] clk: at91: at91sam9260: switch to parent_hw and parent_data
Date: Thu, 18 Sep 2025 14:16:10 -0700
Message-ID: <a85eafe6b462d385c399f8e56773dbedaa1f3260.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141635_501875_6B5BCDC2 
X-CRM114-Status: GOOD (  15.35  )
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

Switch AT91SAM92600 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/at91sam9260.c | 120 ++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 53 deletions(-)

diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
index 55350331b07e..2ac2a340da2f 100644
--- a/drivers/clk/at91/at91sam9260.c
+++ b/drivers/clk/at91/at91sam9260.c
@@ -9,7 +9,7 @@
 
 struct sck {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	u8 id;
 };
 
@@ -24,7 +24,7 @@ struct at91sam926x_data {
 	const struct clk_pll_layout *pllb_layout;
 	const struct clk_pll_characteristics *pllb_characteristics;
 	const struct clk_master_characteristics *mck_characteristics;
-	const struct sck *sck;
+	struct sck *sck;
 	const struct pck *pck;
 	u8 num_sck;
 	u8 num_pck;
@@ -72,11 +72,11 @@ static const struct clk_pll_characteristics sam9260_pllb_characteristics = {
 	.out = sam9260_pllb_out,
 };
 
-static const struct sck at91sam9260_systemck[] = {
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
+static struct sck at91sam9260_systemck[] = {
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
 };
 
 static const struct pck at91sam9260_periphck[] = {
@@ -213,15 +213,15 @@ static const struct clk_pll_characteristics sam9261_pllb_characteristics = {
 	.out = sam9261_pllb_out,
 };
 
-static const struct sck at91sam9261_systemck[] = {
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
-	{ .n = "pck2",  .p = "prog2",    .id = 10 },
-	{ .n = "pck3",  .p = "prog3",    .id = 11 },
-	{ .n = "hclk0", .p = "masterck_div", .id = 16 },
-	{ .n = "hclk1", .p = "masterck_div", .id = 17 },
+static struct sck at91sam9261_systemck[] = {
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
+	{ .n = "pck2",  .id = 10 },
+	{ .n = "pck3",  .id = 11 },
+	{ .n = "hclk0", .id = 16 },
+	{ .n = "hclk1", .id = 17 },
 };
 
 static const struct pck at91sam9261_periphck[] = {
@@ -277,13 +277,13 @@ static const struct clk_pll_characteristics sam9263_pll_characteristics = {
 	.out = sam9260_plla_out,
 };
 
-static const struct sck at91sam9263_systemck[] = {
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
-	{ .n = "pck2",  .p = "prog2",    .id = 10 },
-	{ .n = "pck3",  .p = "prog3",    .id = 11 },
+static struct sck at91sam9263_systemck[] = {
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
+	{ .n = "pck2",  .id = 10 },
+	{ .n = "pck3",  .id = 11 },
 };
 
 static const struct pck at91sam9263_periphck[] = {
@@ -330,12 +330,11 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 					 struct at91sam926x_data *data)
 {
 	const char *slowxtal_name, *mainxtal_name;
+	struct clk_parent_data parent_data[4];
 	struct pmc_data *at91sam9260_pmc;
 	u32 usb_div[] = { 1, 2, 4, 0 };
-	const char *parent_names[6];
-	const char *slck_name;
+	struct clk_hw *usbck_hw, *hw;
 	struct regmap *regmap;
-	struct clk_hw *hw;
 	int i;
 	bool bypass;
 
@@ -363,12 +362,13 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
+	hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+					&AT91_CLK_PD_NAME(mainxtal_name),
 					bypass);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_rm9200_main(regmap, "mainck", "main_osc", NULL);
+	hw = at91_clk_register_rm9200_main(regmap, "mainck", NULL, &AT91_CLK_PD_HW(hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -382,20 +382,17 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 		if (IS_ERR(hw))
 			goto err_free;
 
-		parent_names[0] = "slow_rc_osc";
-		parent_names[1] = "slow_xtal";
-		hw = at91_clk_register_sam9260_slow(regmap, "slck",
-						    parent_names, NULL, 2);
+		parent_data[0] = AT91_CLK_PD_HW(hw);
+		parent_data[1] = AT91_CLK_PD_NAME(slowxtal_name);
+		hw = at91_clk_register_sam9260_slow(regmap, "slck", NULL, parent_data, 2);
 		if (IS_ERR(hw))
 			goto err_free;
 
 		at91sam9260_pmc->chws[PMC_SLOW] = hw;
-		slck_name = "slck";
-	} else {
-		slck_name = slowxtal_name;
 	}
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL,
+				   &AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_MAIN]), 0,
 				   data->plla_layout,
 				   data->plla_characteristics);
 	if (IS_ERR(hw))
@@ -403,7 +400,8 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	at91sam9260_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllbck", "mainck", NULL, 1,
+	hw = at91_clk_register_pll(regmap, "pllbck", NULL,
+				   &AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_MAIN]), 1,
 				   data->pllb_layout,
 				   data->pllb_characteristics);
 	if (IS_ERR(hw))
@@ -411,12 +409,12 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	at91sam9260_pmc->chws[PMC_PLLBCK] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack";
-	parent_names[3] = "pllbck";
+	parent_data[0] = AT91_CLK_PD_NAME(slowxtal_name);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_PLLACK]);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL,
+					   NULL, parent_data,
 					   &at91rm9200_master_layout,
 					   data->mck_characteristics,
 					   &at91sam9260_mck_lock);
@@ -424,7 +422,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL,
+					  NULL, &AT91_CLK_PD_HW(hw),
 					  &at91rm9200_master_layout,
 					  data->mck_characteristics,
 					  &at91sam9260_mck_lock,
@@ -434,21 +432,23 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	at91sam9260_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91rm9200_clk_register_usb(regmap, "usbck", "pllbck", NULL, usb_div);
-	if (IS_ERR(hw))
+	usbck_hw = at91rm9200_clk_register_usb(regmap, "usbck", NULL,
+					       &AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_PLLBCK]),
+					       usb_div);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack";
-	parent_names[3] = "pllbck";
+	parent_data[0] = AT91_CLK_PD_NAME(slowxtal_name);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_PLLBCK]);
 	for (i = 0; i < data->num_progck; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 4, i,
+						    NULL, parent_data, 4, i,
 						    &at91rm9200_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -457,9 +457,22 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 		at91sam9260_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	data->sck[0].parent_hw = usbck_hw;
+	data->sck[1].parent_hw = usbck_hw;
+	data->sck[2].parent_hw = at91sam9260_pmc->pchws[0];
+	data->sck[3].parent_hw = at91sam9260_pmc->pchws[1];
+	if (data->num_sck == 6) {
+		data->sck[4].parent_hw = at91sam9260_pmc->pchws[2];
+		data->sck[5].parent_hw = at91sam9260_pmc->pchws[3];
+	}
+	if (data->num_sck == 8) {
+		data->sck[6].parent_hw = at91sam9260_pmc->chws[PMC_MCK];
+		data->sck[7].parent_hw = at91sam9260_pmc->chws[PMC_MCK];
+	}
 	for (i = 0; i < data->num_sck; i++) {
-		hw = at91_clk_register_system(regmap, data->sck[i].n,
-					      data->sck[i].p, NULL,
+		hw = at91_clk_register_system(regmap, data->sck[i].n, NULL,
+					      &AT91_CLK_PD_HW(data->sck[i].parent_hw),
 					      data->sck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
@@ -470,7 +483,8 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 	for (i = 0; i < data->num_pck; i++) {
 		hw = at91_clk_register_peripheral(regmap,
 						  data->pck[i].n,
-						  "masterck_div", NULL,
+						  NULL,
+						  &AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_MCK]),
 						  data->pck[i].id);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.43.0


