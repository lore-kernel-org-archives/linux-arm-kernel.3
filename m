Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B356EC98303
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Beq1Yvkt+JD16VGqkXkuOE/+wg9p10VJLAEymQShFds=; b=XdcTE6/7X5uI5xeb0xgDM0vVVh
	JiHFQWCzD1O7SaFnlHC3lBrmhhwzyH73WQm5Zr6YGoZdUVHp6+6JhUCLhWZYxH0bclQ/JVEa1lQwG
	VWeFnqLcds1b23Nu/we4PwJHmlTwaq6fnKCOscQG9SGDADhDPxs3A3AROjlxCjioIMyxJDJ0iQ7t7
	YUJcI5tmKprGbDeW+TfN1QhZXJVtN2Ad8CJQqiVXPb34qObqw7kIZITn0nx6PUotlWXFvTm17yIVW
	HnaqOkAbD7OdC4/M+brTihOZzJOY/bHdRhwRp4wskhk716j1Pn9GKCRmnxxj2ooaHR1Et1Pto3Abg
	hJMOh4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6Y-0000000Ek8k-3sfX;
	Fri, 16 Jan 2026 20:07:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6R-0000000Ejy3-250g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594047; x=1800130047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4j7JJmu0bl4xjlY1WxBs2ZZlXxj0JOHqAkmnYdAEZ7g=;
  b=0a00VPA1URuhmtDvxiLLg2uX59m1Oz9AO2AEz1aib7A9QWcb/vz7pqPK
   8zm842OpeiUcDTnt6XzXD2x/oQNIPrACVRoF3UPrMscR3Cd1/EYtQq+Rs
   7QzkuDp1ByTdL1W1qUJH6TUyyochBpf/WjSlxy7lGiEONavOCwYk0JeRn
   gEVYZqqk8yW4duExO4pF4LS5GSdGs/EHHu4XJ1+BSYJEIQxsoq1rLVRp+
   aPPU43x2VIjTKy7bcI2huLgy+Yi0W/d602GbAK5uZzZtZYvg+QO1UUm9X
   jMTgFMt4JOQFxxZFbHofT1pOODjcNVQhfHckzsHC1mMEo/rJ2sVVGTkl/
   Q==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: M6+9SkXyQtu+UZN+kxO0mQ==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042241"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:06 -0700
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
Subject: [PATCH v5 18/31] clk: at91: clk-i2s-mux: add support for parent_data
Date: Fri, 16 Jan 2026 13:07:11 -0700
Message-ID: <0d5517f708a262924c6aa6f97a23d078891c218a.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120727_571570_202A928F 
X-CRM114-Status: GOOD (  15.80  )
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

Add support for parent_data in i2s mux clock driver.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-i2s-mux were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-i2s-mux.c | 6 +++++-
 drivers/clk/at91/dt-compat.c   | 2 +-
 drivers/clk/at91/pmc.h         | 1 +
 drivers/clk/at91/sama5d2.c     | 4 ++--
 4 files changed, 9 insertions(+), 4 deletions(-)

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
index 32bb041c1466..3680e2d489d8 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -185,6 +185,7 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 			  const char * const *parent_names,
+			  struct clk_parent_data *parent_data,
 			  unsigned int num_parents, u8 bus_id);
 
 struct clk_hw * __init
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index 8c7ff0108b41..f5d6c7a96cf2 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -372,7 +372,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		parent_names[0] = "i2s0_clk";
 		parent_names[1] = "i2s0_gclk";
 		hw = at91_clk_i2s_mux_register(regmap_sfr, "i2s0_muxclk",
-					       parent_names, 2, 0);
+					       parent_names, NULL, 2, 0);
 		if (IS_ERR(hw))
 			goto err_free;
 
@@ -381,7 +381,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		parent_names[0] = "i2s1_clk";
 		parent_names[1] = "i2s1_gclk";
 		hw = at91_clk_i2s_mux_register(regmap_sfr, "i2s1_muxclk",
-					       parent_names, 2, 1);
+					       parent_names, NULL, 2, 1);
 		if (IS_ERR(hw))
 			goto err_free;
 
-- 
2.43.0


