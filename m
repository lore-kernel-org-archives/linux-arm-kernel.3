Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF9AC98303
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEQIOk2o7/36/v2jJmM4/paPawcZ+rsqWs2aJYBcaT8=; b=udKa9BLXN8FbeiuNDVK0F/RJ2r
	t3AY8DwjL3NuAZehyhZdPWDzMxi2gYgWbmiA4PEItuG4sLk5hbhMDxdP28Bbwb5SiIG7oo/PvNlKa
	tjUethLv/NelExaELtQIbUV4R2NxWHN2A0riWeUQINdZXpIXwzCbsGoAZ7j86kBXwFRsS7MAk9Wbh
	0037Ig9i6IbUXLOaP2xe9AdbOCXTWy1TwLYF+5z3HgFTfav/V3L6eQPFw2AZY8pukGqDCjWaxGS4F
	XCtP7xldPNl8BQrPvx/01syfvEXTVUBjJAYrPsfO8ZODtroryKUNepZn9UaYKOfGUWXFzs0stgcv+
	FEcY6e4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6K-0000000EjvT-1yut;
	Fri, 16 Jan 2026 20:07:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6G-0000000Ejt4-2k6I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594037; x=1800130037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OTMXgJdF/7MTA4sJqHAQpMGm2af+yWIy+XmatDrrxP4=;
  b=XHCnZLbN3yYUk05h5iVBPcV3EtlNQeK0EDbaW889auuiweQjvqhugqb8
   UNaj/qifeXggVwgzqJVhlxmDFyW7/70YndyDwfJ8MIOUrbuDU1FEzvdGR
   Lqv5BP5RuZVlm9sKI5TESfw1GGaVvv7RxXLZzZYYZ46dIFLzMLmJK669h
   7Md+hm3Ek9nooljDVjVLf8NHZHx3vMC8GL0HLf/D+nLALBtpQBDV+5UmX
   urLJEoRPGb7jlh9FCo0YPdO5fZwRZTbEHBbw+pZg/bNRH5FJjWI7sVZAf
   +wv+QmqT0DBqOQzeVLK0O0EY5RgAs9CRFUp1WbHJkn2vKz5oq/dnuY+Y+
   A==;
X-CSE-ConnectionGUID: +9RSiAtvRY+RhxWEUm06Wg==
X-CSE-MsgGUID: 5FgGJAS1SOCVS7wRgzOGOQ==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="283397048"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:04 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:04 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 07/31] clk: at91: clk-utmi: use clk_parent_data
Date: Fri, 16 Jan 2026 13:07:00 -0700
Message-ID: <e7757e961b1ba514bcab3178ac65b4ee8040b80c.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120716_932230_CDE441C9 
X-CRM114-Status: GOOD (  16.24  )
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

Use struct clk_parent_data instead of struct parent_hw as this leads
to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
conversion of existing SoC specific clock drivers from parent_names to
modern clk_parent_data structures.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-utmi.c | 16 ++++++++--------
 drivers/clk/at91/pmc.h      |  4 ++--
 drivers/clk/at91/sama7g5.c  | 19 ++++++++++++-------
 3 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
index b991180beea1..38ffe4d712a5 100644
--- a/drivers/clk/at91/clk-utmi.c
+++ b/drivers/clk/at91/clk-utmi.c
@@ -144,7 +144,7 @@ static struct clk_hw * __init
 at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 				struct regmap *regmap_sfr,
 				const char *name, const char *parent_name,
-				struct clk_hw *parent_hw,
+				struct clk_parent_data *parent_data,
 				const struct clk_ops *ops, unsigned long flags)
 {
 	struct clk_utmi *utmi;
@@ -152,7 +152,7 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (!(parent_name || parent_hw))
+	if (!(parent_name || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	utmi = kzalloc(sizeof(*utmi), GFP_KERNEL);
@@ -161,8 +161,8 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 
 	init.name = name;
 	init.ops = ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -185,10 +185,10 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 struct clk_hw * __init
 at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
 		       const char *name, const char *parent_name,
-		       struct clk_hw *parent_hw)
+		       struct clk_parent_data *parent_data)
 {
 	return at91_clk_register_utmi_internal(regmap_pmc, regmap_sfr, name,
-			parent_name, parent_hw, &utmi_ops, CLK_SET_RATE_GATE);
+			parent_name, parent_data, &utmi_ops, CLK_SET_RATE_GATE);
 }
 
 static int clk_utmi_sama7g5_prepare(struct clk_hw *hw)
@@ -287,8 +287,8 @@ static const struct clk_ops sama7g5_utmi_ops = {
 
 struct clk_hw * __init
 at91_clk_sama7g5_register_utmi(struct regmap *regmap_pmc, const char *name,
-			       const char *parent_name, struct clk_hw *parent_hw)
+			       const char *parent_name, struct clk_parent_data *parent_data)
 {
 	return at91_clk_register_utmi_internal(regmap_pmc, NULL, name,
-			parent_name, parent_hw, &sama7g5_utmi_ops, 0);
+			parent_name, parent_data, &sama7g5_utmi_ops, 0);
 }
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 2d2e7c20d72d..dcb678732471 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -302,10 +302,10 @@ at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
 struct clk_hw * __init
 at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
 		       const char *name, const char *parent_name,
-		       struct clk_hw *parent_hw);
+		       struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_sama7g5_register_utmi(struct regmap *regmap, const char *name,
-			       const char *parent_name, struct clk_hw *parent_hw);
+			       const char *parent_name, struct clk_parent_data *parent_data);
 
 #endif /* __PMC_H_ */
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index d7fb42166a14..058004379ce9 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -976,7 +976,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
 	struct regmap *regmap;
-	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
+	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw;
 	struct clk_parent_data parent_data[2];
 	struct clk_hw *parent_hws[10];
@@ -1042,19 +1042,23 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7g5_plls[i][j].p) {
 				case SAMA7G5_PLL_PARENT_MAINCK:
-					parent_data = AT91_CLK_PD_NAME("mainck");
-					hw = sama7g5_pmc->chws[PMC_MAIN];
+					parent_data[0] = AT91_CLK_PD_NAME("mainck");
+					parent_rate = clk_hw_get_rate(sama7g5_pmc->chws[PMC_MAIN]);
 					break;
 				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
-					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
-					hw = main_xtal_hw;
+					struct clk *main_xtal;
+					main_xtal = of_clk_get_by_name(np, main_xtal_name);
+					if (IS_ERR(main_xtal))
+						goto err_free;
+					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name);
+					parent_rate = clk_get_rate(main_xtal);
+					clk_put(main_xtal);
 					break;
 				default:
 					/* Should not happen. */
 					break;
 				}
 
-				parent_rate = clk_hw_get_rate(hw);
 				if (!parent_rate)
 					return;
 
@@ -1138,7 +1142,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			sama7g5_pmc->chws[sama7g5_mckx[i].eid] = hw;
 	}
 
-	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL, main_xtal_hw);
+	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL,
+					    &AT91_CLK_PD_NAME(main_xtal_name));
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.43.0


