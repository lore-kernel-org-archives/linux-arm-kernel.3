Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DAEC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnyEwJIwHpM3sUV8HHMVrKonmXU9Fjt55znIp0O48VY=; b=naEebpmZ0OR1kUZhPqKWbPpn44
	mW3v18Yg1bvZPhcLcpXWEjmHrtmilsjqqu92OwkeobquB/lMgMHB2CYe+k+/wtao8KhMpNlSgMEoL
	A89xDj1uGLrU2+aVOMQfvRi4+oviVwG0JvUSjENS6MZ7nxLymyBNh6GHLhPLyKRw444MH9AGiLri1
	mPzXzfiBBmhDLSuakHenEi98HZcFHMJ9mw95PrIIp9iRGKOxtnXVYVA6m4rO1nPIoitKtJWjqPVcu
	eEUXvhLXhxwruSyKPZ1aL/2i3gz1S/V+3DxNSPkA5NFkjlzSZhBTNHepqfpBd414mqhI2t1OCkijc
	JaoBVhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq7J-0000000El4B-18jZ;
	Fri, 16 Jan 2026 20:08:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6e-0000000EkAK-1CtQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594058; x=1800130058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GxvQznf2eXLiKCsYUlxA1ko9KsUsTDGByQa+O4mTKYs=;
  b=KaZsfAS5/tB47RLx5cnUoUvyFeR+uzBLwO6O8yInqV1Cq1F6kYDhJKFZ
   zFpsGmmzsWi9i0nEPznQaffEXnnrpPgFsMLewXssVxmXcxVkGjgopasjg
   0rsqoioVm5R0bEEYhfs8cJQdMq2xR/dnuDlNXlHYnSvIFW14HfaRET6lx
   txl+U6vo9vWtdNQgY//gyUnpnpC2C/0QQAQDlZetxXiUaxoZtTRcLcccu
   gjhNeTh6ab/lp2hBroKV6RedA7T7Iv4mUzwhhExj6onqkWRlVi+nYWKtX
   m21AbesIdLnKP7JOOR9xSX5y2ZaOjPSa4TWFRgPoECqD30I6mAAaDPUeq
   g==;
X-CSE-ConnectionGUID: 3LvvvroxTJyR6T9mab+TNA==
X-CSE-MsgGUID: GGrG8uPeQfClVkJ01q9C8A==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="51290370"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jan 2026 13:07:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 16 Jan 2026 13:07:06 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:06 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 16/31] clk: at91: clk-plldiv: add support for parent_data
Date: Fri, 16 Jan 2026 13:07:09 -0700
Message-ID: <ec232782a91db7a345deea48785bfe3ca35d60f0.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120740_527739_AAFD3D75 
X-CRM114-Status: GOOD (  15.75  )
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

Add support for parent_data in plldiv clock driver.
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
index 3ac09fecc54e..43de0543e8d1 100644
--- a/drivers/clk/at91/clk-plldiv.c
+++ b/drivers/clk/at91/clk-plldiv.c
@@ -84,11 +84,11 @@ static const struct clk_ops plldiv_ops = {
 
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
@@ -97,8 +97,11 @@ at91_clk_register_plldiv(struct regmap *regmap, const char *name,
 
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
index f4b2a07db0d5..e6465259521e 100644
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


