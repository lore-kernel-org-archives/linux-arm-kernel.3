Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939C0CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSP74IIL89adH6HobIomB2eLHNewKE5rXhBO/EQo/s8=; b=zn+E9F0gAT91Lh4e2khS8XS6Qk
	7HvytpZmnd3ahwuHS9bZpTSzaSB/l2vMhibF03ch6tdy9U5kmOR2T7XX7o2KnBzd6VGmOslhRTSdw
	zDxybo7jns5czJAXp/1rGNuA0oTArAofjfDAPFti9PJaOhIwZucXA44yY3Z4uCKj7fLpv1sfaQLt3
	tEut0dXjiFAqCYTTvMs7pJ87YEnpAEt6jCQ3xQF//viIvjP9EljZrHgqaykb9rfqH0kUfR/rJNOkE
	IQwCTzIjir1UhogOq2FnEND39L3YglhHdmNu0zW8E1HMHm9USPdm2no7hfhKMU4i9+0sBKknYCSHN
	ciw7X7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzM02-00000001Cvt-3ckk;
	Thu, 18 Sep 2025 21:17:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzT-00000001CBI-1l5g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230192; x=1789766192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dtc6B1UvbIsG8HdKb8XJYGcqdo1EPUsmQ9nFCtQkpDM=;
  b=GPVeFscemluYH/WfVlkFjQZCsojwZJv3TavgD+/0uMxnAMQAquwT0lZr
   ucGnIcQJmFYq9AQxvWn9/7h4nvQ0dG+DaegkAbsC4+Lxoj5os0JGzMHcy
   nvFarmOYW/p+K5TRqVTR7yhDayCSzsiTt8AwP2jtUYtgnYuOB1h/v+94O
   QkSh3DYBM9xffqcux5F6aCT9YLf7j3lxrY54J4KITvvw+AQ3UhWd9f3yh
   JKxcSjX+udfguFVRteBT6FZlWMskYS5naOvqh46dXdLLCews9TNJ7uMcH
   Zg++JIJ/QVlSWbG07Vv5MrYG7B9FcnOMSWeXPgp65wLR0Z2GumTxDNFjN
   g==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: +v74NaneQRq7ezlDHErkgQ==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071391"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 14:16:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 14:15:53 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 14:15:53 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
Subject: [PATCH v4 16/31] clk: at91: clk-plldiv: add support for parent_hw
Date: Thu, 18 Sep 2025 14:15:58 -0700
Message-ID: <ab562d7a5492e45878aa3d4160ad9079571625b0.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141631_486904_C37E1259 
X-CRM114-Status: GOOD (  16.41  )
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

Add support for parent_hw in plldiv clock driver.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-plldiv were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/at91sam9g45.c |  2 +-
 drivers/clk/at91/at91sam9n12.c |  2 +-
 drivers/clk/at91/at91sam9x5.c  |  2 +-
 drivers/clk/at91/clk-plldiv.c  | 11 +++++++----
 drivers/clk/at91/dt-compat.c   |  2 +-
 drivers/clk/at91/pmc.h         |  2 +-
 drivers/clk/at91/sama5d2.c     |  2 +-
 drivers/clk/at91/sama5d3.c     |  2 +-
 drivers/clk/at91/sama5d4.c     |  2 +-
 9 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index 3436a09a6e8a..cb98d22c2e30 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -139,7 +139,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack");
+	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
index 80ccd4a49df3..34dd7645f964 100644
--- a/drivers/clk/at91/at91sam9n12.c
+++ b/drivers/clk/at91/at91sam9n12.c
@@ -165,7 +165,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack");
+	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 6b8c755fefdf..37280852f086 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -187,7 +187,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack");
+	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/clk-plldiv.c b/drivers/clk/at91/clk-plldiv.c
index ba3a1839a96d..c5d0c6e27397 100644
--- a/drivers/clk/at91/clk-plldiv.c
+++ b/drivers/clk/at91/clk-plldiv.c
@@ -72,11 +72,11 @@ static const struct clk_ops plldiv_ops = {
 
 struct clk_hw * __init
 at91_clk_register_plldiv(struct regmap *regmap, const char *name,
-			 const char *parent_name)
+			 const char *parent_name, struct clk_parent_data *parent_data)
 {
 	struct clk_plldiv *plldiv;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	plldiv = kzalloc(sizeof(*plldiv), GFP_KERNEL);
@@ -85,8 +85,11 @@ at91_clk_register_plldiv(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &plldiv_ops;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
+	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE;
 
 	plldiv->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 22bcaa3b28dd..3285e3110b58 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -724,7 +724,7 @@ of_at91sam9x5_clk_plldiv_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91_clk_register_plldiv(regmap, name, parent_name);
+	hw = at91_clk_register_plldiv(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 37ef6f63de26..db067177e6ef 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -246,7 +246,7 @@ at91_clk_register_pll(struct regmap *regmap, const char *name,
 		      const struct clk_pll_characteristics *characteristics);
 struct clk_hw * __init
 at91_clk_register_plldiv(struct regmap *regmap, const char *name,
-			 const char *parent_name);
+			 const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index d2af421abddc..7904f2122ed7 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -220,7 +220,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack");
+	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 9d86c350a1e7..7f2ac8f648dd 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -166,7 +166,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack");
+	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 8491b1e0391d..7cda8032653e 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -181,7 +181,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack");
+	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.43.0


