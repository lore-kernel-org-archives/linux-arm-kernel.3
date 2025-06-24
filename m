Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1355BC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELxOZPN1hbzhHy7YA0JDKA56OLuDAaqWr+N64DO8/Hc=; b=UPSmusLsOeGNMUhgrd9kfDpsx6
	xSWLGWH4DLGPvclG95Pa1t7KQtkmVqXwXKfC76lv51oa+RVHhYD+y/BzPUKt6Vg5dfC1PIWz6YYtn
	ESGgd4BSXkt+1g2aIv5rvFgckTTotndUYCkFhdhzE/j/EtDG4JJJTMk2ACWy+zmMHlKLKTumVKTow
	rsl42I4vt1rH3dOAyjmWUJP6CnvyqTDF8V4TCNIdoMMgvuoKsmdLofzPmXzHbo/40nrcz99QN5G1R
	rgBewalCNQfAYZs+FhJEV7b4lV8JcKdr/U9/KDI4PiSrQUQwFfZklcM/GqeRoobKNHzmVOntx05ru
	Dct1RV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7wR-00000006RZS-3pRU;
	Tue, 24 Jun 2025 18:00:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5Gu-000000062eN-2yts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777756; x=1782313756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p8hKSAxPTGypFQ4ukRy4fkUp3r3iUW8ues0RYFqVcIo=;
  b=MVYVftdj84JIqjRVWJqBWntdIj3CgjVxbP/6zuUgmO85uM/ouBpD0Xua
   unoECKWH2XH5tAelL45nhmM8kW1dITFDtEcG+Xa41zx5pBKRiBP/n0XMs
   1pgWg33w5iBVLWT2XZUfR20FgysDgUURPyssoYJ8D4PzqsZr4FWSv6DKx
   FWfJB3ZAI498SIGarO7f3cQ21s5Y9sI+GqcfDYQ4ra8n4zqMehSSEIQKW
   vkMq6IoPnCLOsMGp7WbGNtIqtLqHJlBuqRImxl+sYB0DM1T5sZ7qyvNzf
   gjKZndHsOyXREp74b3GbSxa+L8ebQ4MP33t0NIPQx+iF0VJVEuDNCEbSW
   A==;
X-CSE-ConnectionGUID: ticneE1VRpCt6c5L3blMOw==
X-CSE-MsgGUID: o7aRdA0LRuObY6L1IPtmtA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="210641583"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
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
Subject: [PATCH v2 16/32] clk: at91: clk-i2s-mux: add support for parent_hw
Date: Tue, 24 Jun 2025 08:08:13 -0700
Message-ID: <d94b3c0c9958469ca1c5c34961ad27d0d0b7160b.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080916_813828_E7669AC6 
X-CRM114-Status: GOOD (  16.12  )
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

Add support for parent_hw in i2s mux clock driver.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-i2s-mux were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes as they are
going to be coalesced into one SoC specific commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-i2s-mux.c | 6 +++++-
 drivers/clk/at91/dt-compat.c   | 2 +-
 drivers/clk/at91/pmc.h         | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-i2s-mux.c b/drivers/clk/at91/clk-i2s-mux.c
index fe6ce172b8b0..04d9fcf940fb 100644
--- a/drivers/clk/at91/clk-i2s-mux.c
+++ b/drivers/clk/at91/clk-i2s-mux.c
@@ -51,6 +51,7 @@ static const struct clk_ops clk_i2s_mux_ops = {
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 			  const char * const *parent_names,
+			  struct clk_parent_data *parent_data,
 			  unsigned int num_parents, u8 bus_id)
 {
 	struct clk_init_data init = {};
@@ -63,7 +64,10 @@ at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &clk_i2s_mux_ops;
-	init.parent_names = parent_names;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = parent_names;
 	init.num_parents = num_parents;
 
 	i2s_ck->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index ccdeba3a1130..2b1aa834f111 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -239,7 +239,7 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
 			continue;
 
 		hw = at91_clk_i2s_mux_register(regmap_sfr, i2s_mux_np->name,
-					       parent_names, 2, bus_id);
+					       parent_names, NULL, 2, bus_id);
 		if (IS_ERR(hw))
 			continue;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index fe42700df6db..a380054d580d 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -182,6 +182,7 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 			  const char * const *parent_names,
+			  struct clk_parent_data *parent_data,
 			  unsigned int num_parents, u8 bus_id);
 
 struct clk_hw * __init
-- 
2.43.0


