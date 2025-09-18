Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8F6CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uibrf+aswhaF5OcUjZKQZEjkxsB73sGDJ9t6vZfq3os=; b=eVdr4KhaVFoKeR9+WMJTP69mPs
	bJxyGWo3pDpIMdMudq3+hkShMUuMQqz8hTiXiQw34JAw/bLzeX90Rt9AiPpDXyEnRfuceq5R4cxYz
	AyQJiLXWqf2b9xhg9NwIr0KbTJaHEySW+Gua4cvJUWQ+NhgJ+/WIH4tU4YbiJDSTzmKbJXpddpsa9
	AKpavdedU0kt/d2l68R0mq+cKHRMldL0jFUvUdCv+R9b8rOhoVTixWnm+3q/FYuGPHKuZj0sVOBai
	hlkghZb2qRNp6DnKKJs+xrpqPAi9hPma/qMe9SbXM6Zh6rIza44E+9ruhnJ4xDil13c5do4W7IK1X
	zO1qQRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzM0D-00000001D7k-1Y6Y;
	Thu, 18 Sep 2025 21:17:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzV-00000001CBI-0vKK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230194; x=1789766194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l9bNuAZzkq8mBVyacoUSJx8C49OSIJiPibpV3FonOUY=;
  b=04Qy0tmcEeU0G1rgo+WVIaoks94/v8ZnCeQPiPZrkaAdzW1W+t0CYxYs
   7cNglUUtiihvVLqNIH2PLeJXUDdnHQVZgdzXkmfKFbZiIwQ9Z8GSzeKv3
   uqnnN1KU3X5hxAiYKYV/jbOew708u5ZpOG0nPPal/zsE6TY/HtO7ArXyN
   tEBxFbfB4OOC3A6/FxcWDSEBaIqmhQgjiivogEA3jpxuE4DSenmTPhC/h
   AAO9hCt2Np+O5E2zmlglwAgx0sWawblyPClEh1CS2rxqmrS1KFXj/tBUI
   2pvtlI9uLviXfzkjvRZh+6L1Jz3C7Gc+jB4yx40eM6xs/zdWVh5a9+mE9
   w==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: rIFI/dNBSJSYZRQDALX+QA==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071396"
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
Subject: [PATCH v4 21/31] clk: at91: dt-compat: switch to parent_hw and parent_data
Date: Thu, 18 Sep 2025 14:16:03 -0700
Message-ID: <628859234f4b2523f43b3ac05d5e29ceb05a7f61.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141633_301244_2FC9E7A5 
X-CRM114-Status: GOOD (  14.15  )
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

Switch old dt-compat clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/dt-compat.c | 80 +++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index fa8658d3be7b..9ca871b817e0 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -43,7 +43,8 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_audio_pll_frac(regmap, name, parent_name, NULL);
+	hw = at91_clk_register_audio_pll_frac(regmap, name, NULL,
+					      &AT91_CLK_PD_NAME(parent_name));
 	if (IS_ERR(hw))
 		return;
 
@@ -69,7 +70,8 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_audio_pll_pad(regmap, name, parent_name, NULL);
+	hw = at91_clk_register_audio_pll_pad(regmap, name, NULL,
+					     &AT91_CLK_PD_NAME(parent_name));
 	if (IS_ERR(hw))
 		return;
 
@@ -95,7 +97,7 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_name, NULL);
+	hw = at91_clk_register_audio_pll_pmc(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
 	if (IS_ERR(hw))
 		return;
 
@@ -129,6 +131,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
 	struct clk_hw *hw;
 	unsigned int num_parents;
 	const char *parent_names[GENERATED_SOURCE_MAX];
+	struct clk_parent_data parent_data[GENERATED_SOURCE_MAX];
 	struct device_node *gcknp, *parent_np;
 	struct clk_range range = CLK_RANGE(0, 0);
 	struct regmap *regmap;
@@ -149,6 +152,8 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
+	for (unsigned int i = 0; i < num_parents; i++)
+		parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
 	for_each_child_of_node(np, gcknp) {
 		int chg_pid = INT_MIN;
 
@@ -171,7 +176,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
 
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &dt_pcr_layout, name,
-						 parent_names, NULL, NULL,
+						 NULL, parent_data, NULL,
 						 num_parents, id, &range,
 						 chg_pid);
 		if (IS_ERR(hw))
@@ -201,7 +206,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
+	hw = at91_clk_register_h32mx(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
 	if (IS_ERR(hw))
 		return;
 
@@ -228,6 +233,8 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
 		return;
 
 	for_each_child_of_node(np, i2s_mux_np) {
+		struct clk_parent_data parent_data[2];
+
 		if (of_property_read_u8(i2s_mux_np, "reg", &bus_id))
 			continue;
 
@@ -238,8 +245,10 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
 		if (ret != 2)
 			continue;
 
+		parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
+		parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
 		hw = at91_clk_i2s_mux_register(regmap_sfr, i2s_mux_np->name,
-					       parent_names, NULL, 2, bus_id);
+					       NULL, parent_data, 2, bus_id);
 		if (IS_ERR(hw))
 			continue;
 
@@ -269,7 +278,8 @@ static void __init of_at91rm9200_clk_main_osc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91_clk_register_main_osc(regmap, name, parent_name, NULL, bypass);
+	hw = at91_clk_register_main_osc(regmap, name, NULL,
+					&AT91_CLK_PD_NAME(parent_name), bypass);
 	if (IS_ERR(hw))
 		return;
 
@@ -323,7 +333,7 @@ static void __init of_at91rm9200_clk_main_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91_clk_register_rm9200_main(regmap, name, parent_name, NULL);
+	hw = at91_clk_register_rm9200_main(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
 	if (IS_ERR(hw))
 		return;
 
@@ -336,6 +346,7 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
 {
 	struct clk_hw *hw;
 	const char *parent_names[2];
+	struct clk_parent_data parent_data[2];
 	unsigned int num_parents;
 	const char *name = np->name;
 	struct regmap *regmap;
@@ -354,7 +365,9 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	hw = at91_clk_register_sam9x5_main(regmap, name, parent_names, NULL,
+	parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
+	parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
+	hw = at91_clk_register_sam9x5_main(regmap, name, NULL, parent_data,
 					   num_parents);
 	if (IS_ERR(hw))
 		return;
@@ -396,6 +409,7 @@ of_at91_clk_master_setup(struct device_node *np,
 	struct clk_hw *hw;
 	unsigned int num_parents;
 	const char *parent_names[MASTER_SOURCE_MAX];
+	struct clk_parent_data parent_data[MASTER_SOURCE_MAX];
 	const char *name = np->name;
 	struct clk_master_characteristics *characteristics;
 	struct regmap *regmap;
@@ -419,13 +433,15 @@ of_at91_clk_master_setup(struct device_node *np,
 	if (IS_ERR(regmap))
 		return;
 
+	for (unsigned int i = 0; i < MASTER_SOURCE_MAX; i++)
+		parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", num_parents,
-					   parent_names, NULL, layout,
+					   NULL, parent_data, layout,
 					   characteristics, &mck_lock);
 	if (IS_ERR(hw))
 		goto out_free_characteristics;
 
-	hw = at91_clk_register_master_div(regmap, name, "masterck_pres", NULL,
+	hw = at91_clk_register_master_div(regmap, name, NULL, &AT91_CLK_PD_HW(hw),
 					  layout, characteristics,
 					  &mck_lock, CLK_SET_RATE_GATE, 0);
 	if (IS_ERR(hw))
@@ -489,8 +505,8 @@ of_at91_clk_periph_setup(struct device_node *np, u8 type)
 			name = periphclknp->name;
 
 		if (type == PERIPHERAL_AT91RM9200) {
-			hw = at91_clk_register_peripheral(regmap, name,
-							  parent_name, NULL, id);
+			hw = at91_clk_register_peripheral(regmap, name, NULL,
+							  &AT91_CLK_PD_NAME(parent_name), id);
 		} else {
 			struct clk_range range = CLK_RANGE(0, 0);
 			unsigned long flags = 0;
@@ -511,8 +527,8 @@ of_at91_clk_periph_setup(struct device_node *np, u8 type)
 								 &pmc_pcr_lock,
 								 &dt_pcr_layout,
 								 name,
-								 parent_name,
 								 NULL,
+								 &AT91_CLK_PD_NAME(parent_name),
 								 id, &range,
 								 INT_MIN,
 								 flags);
@@ -665,7 +681,8 @@ of_at91_clk_pll_setup(struct device_node *np,
 	if (!characteristics)
 		return;
 
-	hw = at91_clk_register_pll(regmap, name, parent_name, NULL, id, layout,
+	hw = at91_clk_register_pll(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name),
+				   id, layout,
 				   characteristics);
 	if (IS_ERR(hw))
 		goto out_free_characteristics;
@@ -724,7 +741,7 @@ of_at91sam9x5_clk_plldiv_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91_clk_register_plldiv(regmap, name, parent_name, NULL);
+	hw = at91_clk_register_plldiv(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
 	if (IS_ERR(hw))
 		return;
 
@@ -743,6 +760,7 @@ of_at91_clk_prog_setup(struct device_node *np,
 	struct clk_hw *hw;
 	unsigned int num_parents;
 	const char *parent_names[PROG_SOURCE_MAX];
+	struct clk_parent_data parent_data[PROG_SOURCE_MAX];
 	const char *name;
 	struct device_node *progclknp, *parent_np;
 	struct regmap *regmap;
@@ -763,6 +781,8 @@ of_at91_clk_prog_setup(struct device_node *np,
 	if (IS_ERR(regmap))
 		return;
 
+	for (unsigned int i = 0; i < PROG_SOURCE_MAX; i++)
+		parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
 	for_each_child_of_node(np, progclknp) {
 		if (of_property_read_u32(progclknp, "reg", &id))
 			continue;
@@ -771,7 +791,7 @@ of_at91_clk_prog_setup(struct device_node *np,
 			name = progclknp->name;
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, num_parents,
+						    NULL, parent_data, num_parents,
 						    id, layout, mux_table);
 		if (IS_ERR(hw))
 			continue;
@@ -805,6 +825,7 @@ static void __init of_at91sam9260_clk_slow_setup(struct device_node *np)
 {
 	struct clk_hw *hw;
 	const char *parent_names[2];
+	struct clk_parent_data parent_data[2];
 	unsigned int num_parents;
 	const char *name = np->name;
 	struct regmap *regmap;
@@ -823,7 +844,9 @@ static void __init of_at91sam9260_clk_slow_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	hw = at91_clk_register_sam9260_slow(regmap, name, parent_names, NULL,
+	parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
+	parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
+	hw = at91_clk_register_sam9260_slow(regmap, name, NULL, parent_data,
 					    num_parents);
 	if (IS_ERR(hw))
 		return;
@@ -841,6 +864,7 @@ static void __init of_at91sam9x5_clk_smd_setup(struct device_node *np)
 	struct clk_hw *hw;
 	unsigned int num_parents;
 	const char *parent_names[SMD_SOURCE_MAX];
+	struct clk_parent_data parent_data[SMD_SOURCE_MAX];
 	const char *name = np->name;
 	struct regmap *regmap;
 	struct device_node *parent_np;
@@ -859,7 +883,9 @@ static void __init of_at91sam9x5_clk_smd_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91sam9x5_clk_register_smd(regmap, name, parent_names, NULL,
+	for (unsigned int i = 0; i < SMD_SOURCE_MAX; i++)
+		parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
+	hw = at91sam9x5_clk_register_smd(regmap, name, NULL, parent_data,
 					 num_parents);
 	if (IS_ERR(hw))
 		return;
@@ -909,7 +935,8 @@ static void __init of_at91rm9200_clk_sys_setup(struct device_node *np)
 		if (!strcmp(sysclknp->name, "ddrck"))
 			flags = CLK_IS_CRITICAL;
 
-		hw = at91_clk_register_system(regmap, name, parent_name, NULL,
+		hw = at91_clk_register_system(regmap, name, NULL,
+					      &AT91_CLK_PD_NAME(parent_name),
 					      id, flags);
 		if (IS_ERR(hw))
 			continue;
@@ -928,6 +955,7 @@ static void __init of_at91sam9x5_clk_usb_setup(struct device_node *np)
 	struct clk_hw *hw;
 	unsigned int num_parents;
 	const char *parent_names[USB_SOURCE_MAX];
+	struct clk_parent_data parent_data[USB_SOURCE_MAX];
 	const char *name = np->name;
 	struct regmap *regmap;
 	struct device_node *parent_np;
@@ -946,7 +974,9 @@ static void __init of_at91sam9x5_clk_usb_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91sam9x5_clk_register_usb(regmap, name, parent_names, NULL,
+	for (unsigned int i = 0; i < USB_SOURCE_MAX; i++)
+		parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
+	hw = at91sam9x5_clk_register_usb(regmap, name, NULL, parent_data,
 					 num_parents);
 	if (IS_ERR(hw))
 		return;
@@ -976,7 +1006,7 @@ static void __init of_at91sam9n12_clk_usb_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91sam9n12_clk_register_usb(regmap, name, parent_name, NULL);
+	hw = at91sam9n12_clk_register_usb(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
 	if (IS_ERR(hw))
 		return;
 
@@ -1009,7 +1039,8 @@ static void __init of_at91rm9200_clk_usb_setup(struct device_node *np)
 	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
-	hw = at91rm9200_clk_register_usb(regmap, name, parent_name, NULL, divisors);
+	hw = at91rm9200_clk_register_usb(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name),
+					 divisors);
 	if (IS_ERR(hw))
 		return;
 
@@ -1056,7 +1087,8 @@ static void __init of_at91sam9x5_clk_utmi_setup(struct device_node *np)
 			regmap_sfr = NULL;
 	}
 
-	hw = at91_clk_register_utmi(regmap_pmc, regmap_sfr, name, parent_name, NULL);
+	hw = at91_clk_register_utmi(regmap_pmc, regmap_sfr, name, NULL,
+				    &AT91_CLK_PD_NAME(parent_name));
 	if (IS_ERR(hw))
 		return;
 
-- 
2.43.0


