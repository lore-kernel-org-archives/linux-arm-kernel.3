Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FD7C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RbuWXfWeTNc9Z59aUxO2yHLJm1uyxENuU1CrMHNhdk=; b=ON66AWL41CTTLcCVdBUL6isfUm
	E9tvRiYZFz7UhZf4Nkaqk6fFq9xoWV7dGS5OoLDk7/Vjqf3gCu4I1SHltPf1L+dzoITubxouFpyRP
	2ldB2IAQp8947Z0kS6byVIdSdeJQS3Z6GyM6quharzsE7BdrBa+VRW+mBdrAyamKqGHxJEZAhEfar
	5clJX7E+KoH4ouOIQvtwZQxlnKjT/hnc47B8VZvf/KLnVX6EyyLSQ2J8DfMEvYyK1bnVRcX1u0bcy
	wYOLBFQECI2JWPrdYfvoV3f2tdI+EMmXVyWqug6tO3ihFIU5G/LKhlxzPMX38Clb1kKX4bghVDOnJ
	oTbhvsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7uC-00000006RTN-0pg2;
	Tue, 24 Jun 2025 17:58:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5GV-000000062UL-32rj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777731; x=1782313731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ewK93IZBE5AdW/boaGsKbjjZ+eEA2xMxJ1F5syBIWcM=;
  b=oVVgBx4P/T9bd1D6dajEZwIKEdEntMyt3cg/HubRJSXztMZcZbnlyaOv
   QyKAUsqSlJor6qgbkPsKUdr1vTSxlP2ide4S1UzV7JuuA1pauOgb42kU7
   elnnenuvwcTW8mG2VQOJ00DUvzgy4GiclvBDDePTvGfGmpfnHqFpe2yo9
   7JVw0t0mjXfwfgU7eN2yiylK+Qnyn/xW/CKVokYdb0MQSevgye5A5dh4f
   AZx6nzl3NyHyjFi0PCtLpIud/TRUMPBKLqt8tvTNPdydv3a+Cp46165NZ
   6R3PbnbBI1P8qTaDXg5zZR36Ht+JT1NoLRnCqd228IjdYTh8PpGYeJG+i
   Q==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: JmQSy8bSSGanE8uo8FA/cA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688191"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:38 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:38 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 14/32] clk: at91: clk-plldiv: add support for parent_hw
Date: Tue, 24 Jun 2025 08:08:11 -0700
Message-ID: <b235fe4435a124cf29b9fb8ada9a81523c0cd161.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080851_833473_7F3EE990 
X-CRM114-Status: GOOD (  15.16  )
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
[ryan.wanner@microchip.com: Remove SoC specific changes as they are
going to be coalesced into one SoC specific commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-plldiv.c | 11 +++++++----
 drivers/clk/at91/dt-compat.c  |  2 +-
 drivers/clk/at91/pmc.h        |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

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
index 519d71652619..df2deb134a8d 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -243,7 +243,7 @@ at91_clk_register_pll(struct regmap *regmap, const char *name,
 		      const struct clk_pll_characteristics *characteristics);
 struct clk_hw * __init
 at91_clk_register_plldiv(struct regmap *regmap, const char *name,
-			 const char *parent_name);
+			 const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
-- 
2.43.0


