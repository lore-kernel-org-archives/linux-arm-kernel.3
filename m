Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74C0CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNRZZlhMUNPFuGvD80GCZ3/dVvMdossbSTWgLDCgjMM=; b=FU7h1yphC+cpkycCNKl1X5vLJH
	SzbwqTicKniZ9688QnCU3fMBWdAVC+lZBaf1W7uG465nQL3rJQuyvy4xCcEiql6y8/A4M7J3SPPLG
	2y5aCTPoXTvsq6hFaqbotd0GCrAUdOKNpY9HoX3hu+4VIBsrMicorfnOz/JsPRtgoILV/gYXT/vN/
	rr33zlCfLZNdF3Px49GeD0x5hUcHbTco6SMScy2+bZrRRW3yTBWv/cd7DE+fi1nd4Ait2JjOk/nAJ
	ExLr6fJUsVHZLXyPOxJg6MbXDT2DIWd1uo5ohk+nCmVHS6nEU6PB2EghYJmYKwrOGaVqlaxOtCOKq
	oSXSrGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzY-00000001CPP-1s4j;
	Thu, 18 Sep 2025 21:16:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzN-00000001CBG-1g7s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230186; x=1789766186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7//6SEF4/nqy23m5qcrWxDmvp9XtxNmHgq9vRtxZiFk=;
  b=OJJnNazxoUCRnTHDHRHg22u+opFqvac8neGT5t4GnFNRL8csGU5P+0e2
   xMcssWi7VnxDJLigkHVk/VYmh6c1An1unAxCAfUIFsIris5iicJHR7R2S
   jSCQ7AAeyuJVXaJtRQCtESGL+VS/FVlNhJGKgpB+5NQyK0UN/dqsdtuI4
   byZzbuskS5bjMPp20RWf3krYhgTSLpLCtcXbLw0WFkPnFs+M9ZgE68KX9
   aiZr8e5qqO4rdyRHF8i06V658F7HGBykiLDngcKvorLwD2VbKVxR5OCPH
   7OKIy9UFOgNsKAl3RFXGmOch4XkmRcC5UUz+Cor7jaj24sqtd/OdIWPlx
   Q==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: TIB6OPY+RsS8E3zaqlRJsA==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071379"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 14:16:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 14:15:51 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 14:15:51 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
Subject: [PATCH v4 05/31] clk: at91: clk-peripheral: switch to clk_parent_data
Date: Thu, 18 Sep 2025 14:15:47 -0700
Message-ID: <b0635913503630a8e1880b0b9ba8656465020181.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758226719.git.Ryan.Wanner@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141625_449065_8AC7DD86 
X-CRM114-Status: GOOD (  14.74  )
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

Use struct clk_parent_data instead of parent_hw for peripheral clocks.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X7 SoCs to the use the
structs.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-peripheral.c | 16 ++++++++--------
 drivers/clk/at91/pmc.h            |  4 ++--
 drivers/clk/at91/sam9x7.c         |  2 +-
 drivers/clk/at91/sama7d65.c       |  2 +-
 drivers/clk/at91/sama7g5.c        |  2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index c173a44c800a..ed97b3c0a66b 100644
--- a/drivers/clk/at91/clk-peripheral.c
+++ b/drivers/clk/at91/clk-peripheral.c
@@ -97,7 +97,7 @@ static const struct clk_ops peripheral_ops = {
 
 struct clk_hw * __init
 at91_clk_register_peripheral(struct regmap *regmap, const char *name,
-			     const char *parent_name, struct clk_hw *parent_hw,
+			     const char *parent_name, struct clk_parent_data *parent_data,
 			     u32 id)
 {
 	struct clk_peripheral *periph;
@@ -105,7 +105,7 @@ at91_clk_register_peripheral(struct regmap *regmap, const char *name,
 	struct clk_hw *hw;
 	int ret;
 
-	if (!name || !(parent_name || parent_hw) || id > PERIPHERAL_ID_MAX)
+	if (!name || !(parent_name || parent_data) || id > PERIPHERAL_ID_MAX)
 		return ERR_PTR(-EINVAL);
 
 	periph = kzalloc(sizeof(*periph), GFP_KERNEL);
@@ -114,8 +114,8 @@ at91_clk_register_peripheral(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &peripheral_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -448,7 +448,7 @@ struct clk_hw * __init
 at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 				    const struct clk_pcr_layout *layout,
 				    const char *name, const char *parent_name,
-				    struct clk_hw *parent_hw,
+				    struct clk_parent_data *parent_data,
 				    u32 id, const struct clk_range *range,
 				    int chg_pid, unsigned long flags)
 {
@@ -457,7 +457,7 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 	struct clk_hw *hw;
 	int ret;
 
-	if (!name || !(parent_name || parent_hw))
+	if (!name || !(parent_name || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	periph = kzalloc(sizeof(*periph), GFP_KERNEL);
@@ -465,8 +465,8 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index d3fc38cf90eb..9b0c641e747b 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -229,13 +229,13 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
 
 struct clk_hw * __init
 at91_clk_register_peripheral(struct regmap *regmap, const char *name,
-			     const char *parent_name, struct clk_hw *parent_hw,
+			     const char *parent_name, struct clk_parent_data *parent_data,
 			     u32 id);
 struct clk_hw * __init
 at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 				    const struct clk_pcr_layout *layout,
 				    const char *name, const char *parent_name,
-				    struct clk_hw *parent_hw,
+				    struct clk_parent_data *parent_data,
 				    u32 id, const struct clk_range *range,
 				    int chg_pid, unsigned long flags);
 
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index c80306715d90..ff9dbaac5f04 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -925,7 +925,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sam9x7_pcr_layout,
 							 sam9x7_periphck[i].n,
-							 NULL, sam9x7_pmc->chws[PMC_MCK],
+							 NULL, &AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]),
 							 sam9x7_periphck[i].id,
 							 &range, INT_MIN,
 							 sam9x7_periphck[i].f);
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 6229b7dfbea1..6367fa7efd06 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1307,7 +1307,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 							 &sama7d65_pcr_layout,
 							 sama7d65_periphck[i].n,
 							 NULL,
-							 sama7d65_mckx[sama7d65_periphck[i].p].hw,
+							 &AT91_CLK_PD_HW(sama7d65_mckx[sama7d65_periphck[i].p].hw),
 							 sama7d65_periphck[i].id,
 							 &sama7d65_periphck[i].r,
 							 sama7d65_periphck[i].chgp ? 0 :
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 654c9f43fcf8..091845ca251c 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1180,7 +1180,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 						&sama7g5_pcr_layout,
 						sama7g5_periphck[i].n,
 						NULL,
-						sama7g5_mckx[sama7g5_periphck[i].p].hw,
+						&AT91_CLK_PD_HW(sama7g5_mckx[sama7g5_periphck[i].p].hw),
 						sama7g5_periphck[i].id,
 						&sama7g5_periphck[i].r,
 						sama7g5_periphck[i].chgp ? 0 :
-- 
2.43.0


