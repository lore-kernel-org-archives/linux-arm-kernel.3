Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA507CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sNrlugfK/ReEEsswHOVnkuXHG4woHRRwll3bNurIPe8=; b=G+RrzZoiG7kSATOQsEnX0bgqCn
	Drddo3SX4vtrukHdWs0H9YbwaTc20iiug8a8ZGQVNg5jF2guwoJPFTTUrFd0MAKfh4Fo6tvV3Ga9N
	BtP1N8bmUDuKRkAcZgvCu+bwjc5DkSlQv52a+ODcvzwu5VN/7neL5l7laJSdqGgklQ6hef2yj40Mg
	mY6DW4tCDZlZQ0WQkCMVMdrV6XNveK0UZzlOBuS4k3GIIf9fNlmctF/HZpNpKMPpy3CrXUrX7wlQa
	1aXZJtcVrBiJYanpiW7u3xNvSWtWoBIozHYb4beSQId0BMYCV0b0IKQZU/6XiWH+ixGoxlm8Ekqic
	NGz51ADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJju-0000000GHhp-1W5v;
	Wed, 27 Aug 2025 17:15:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHlZ-0000000FrWK-2T36
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756307329; x=1787843329;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vsVLlhcQ+KKqzieS00XnTv/gOmjF8ih5RO9duEOOEO0=;
  b=Emr131HqZ6//i4tDoxANIJqYNPB9k4ttuYqYsoCiLdOtMQ8OJ6n9M+8Y
   zzeFuGO01IIUATb6q5xkmNpeq0QgbyYxKuJW8hjlNWDVTwez9E7NkikNd
   CzAE4iQ7UC4kWUyCIhT44+toQssrmshu9oXPK5pE82/M68i49y/fbPJYa
   tvfhnaj2Gn6eUzj11dYwM6LVHzFlHF0QIrdSORPzroGVCqQA0LzPcPZVk
   NUuhSirkFFOAJy2w8aYtNcaL0Ld/52b2Lz5tl1JwvmZaJTt/acEWVMOl4
   CO8y7uUS14SZEfSthr2OhDaY2TmeemZLT5LA5kQev2D6T73vlHFYW+AS/
   A==;
X-CSE-ConnectionGUID: 7fWiaBvWRQeT6mu/Pdi95A==
X-CSE-MsgGUID: fEGIRcgxSdiXsdcob521EQ==
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="213137835"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Aug 2025 08:08:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 27 Aug 2025 08:08:18 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 27 Aug 2025 08:08:16 -0700
From: <nicolas.ferre@microchip.com>
To: ARM Maintainers <arm@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ryan Wanner <ryan.wanner@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: Linux CLK <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>
Subject: [PATCH] clk: at91: clk-sam9x60-pll: force write to PLL_UPDT register
Date: Wed, 27 Aug 2025 17:08:10 +0200
Message-ID: <20250827150811.82496-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_080849_698428_C5785ED7 
X-CRM114-Status: GOOD (  15.40  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

This register is important for sequencing the commands to PLLs, so
actually write the update bits with regmap_write_bits() instead of
relying on a read/modify/write regmap command that could skip the actual
hardware write if the value is identical to the one read.

It's changed when modification is needed to the PLL, when
read-only operation is done, we could keep the call to
regmap_update_bits().

Add a comment to the sam9x60_div_pll_set_div() function that uses this
PLL_UPDT register so that it's used consistently, according to the
product's datasheet.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Tested-by: Ryan Wanner <ryan.wanner@microchip.com> # on sama7d65 and sam9x75
---
 drivers/clk/at91/clk-sam9x60-pll.c | 33 ++++++++++++++++--------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index cefd9948e103..a3198323126f 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -93,7 +93,7 @@ static int sam9x60_frac_pll_set(struct sam9x60_pll_core *core)
 
 	spin_lock_irqsave(core->lock, flags);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_ID_MSK, core->id);
 	regmap_read(regmap, AT91_PMC_PLL_CTRL1, &val);
 	cmul = (val & core->layout->mul_mask) >> core->layout->mul_shift;
@@ -128,7 +128,7 @@ static int sam9x60_frac_pll_set(struct sam9x60_pll_core *core)
 		udelay(10);
 	}
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
 			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
@@ -136,7 +136,7 @@ static int sam9x60_frac_pll_set(struct sam9x60_pll_core *core)
 			   AT91_PMC_PLL_CTRL0_ENLOCK | AT91_PMC_PLL_CTRL0_ENPLL,
 			   AT91_PMC_PLL_CTRL0_ENLOCK | AT91_PMC_PLL_CTRL0_ENPLL);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
 			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
@@ -164,7 +164,7 @@ static void sam9x60_frac_pll_unprepare(struct clk_hw *hw)
 
 	spin_lock_irqsave(core->lock, flags);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_ID_MSK, core->id);
 
 	regmap_update_bits(regmap, AT91_PMC_PLL_CTRL0, AT91_PMC_PLL_CTRL0_ENPLL, 0);
@@ -173,7 +173,7 @@ static void sam9x60_frac_pll_unprepare(struct clk_hw *hw)
 		regmap_update_bits(regmap, AT91_PMC_PLL_ACR,
 				   AT91_PMC_PLL_ACR_UTMIBG | AT91_PMC_PLL_ACR_UTMIVR, 0);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
 			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
@@ -262,7 +262,7 @@ static int sam9x60_frac_pll_set_rate_chg(struct clk_hw *hw, unsigned long rate,
 
 	spin_lock_irqsave(core->lock, irqflags);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
 			   core->id);
 	regmap_read(regmap, AT91_PMC_PLL_CTRL1, &val);
 	cmul = (val & core->layout->mul_mask) >> core->layout->mul_shift;
@@ -275,7 +275,7 @@ static int sam9x60_frac_pll_set_rate_chg(struct clk_hw *hw, unsigned long rate,
 		     (frac->mul << core->layout->mul_shift) |
 		     (frac->frac << core->layout->frac_shift));
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
 			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
@@ -284,7 +284,7 @@ static int sam9x60_frac_pll_set_rate_chg(struct clk_hw *hw, unsigned long rate,
 			   AT91_PMC_PLL_CTRL0_ENLOCK |
 			   AT91_PMC_PLL_CTRL0_ENPLL);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
 			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
@@ -338,7 +338,10 @@ static const struct clk_ops sam9x60_frac_pll_ops_chg = {
 	.restore_context = sam9x60_frac_pll_restore_context,
 };
 
-/* This function should be called with spinlock acquired. */
+/* This function should be called with spinlock acquired.
+ * Warning: this function must be called only if the same PLL ID was set in
+ *          PLL_UPDT register previously.
+ */
 static void sam9x60_div_pll_set_div(struct sam9x60_pll_core *core, u32 div,
 				    bool enable)
 {
@@ -350,7 +353,7 @@ static void sam9x60_div_pll_set_div(struct sam9x60_pll_core *core, u32 div,
 			   core->layout->div_mask | ena_msk,
 			   (div << core->layout->div_shift) | ena_val);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
 			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
@@ -366,7 +369,7 @@ static int sam9x60_div_pll_set(struct sam9x60_pll_core *core)
 	unsigned int val, cdiv;
 
 	spin_lock_irqsave(core->lock, flags);
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_ID_MSK, core->id);
 	regmap_read(regmap, AT91_PMC_PLL_CTRL0, &val);
 	cdiv = (val & core->layout->div_mask) >> core->layout->div_shift;
@@ -398,13 +401,13 @@ static void sam9x60_div_pll_unprepare(struct clk_hw *hw)
 
 	spin_lock_irqsave(core->lock, flags);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_ID_MSK, core->id);
 
 	regmap_update_bits(regmap, AT91_PMC_PLL_CTRL0,
 			   core->layout->endiv_mask, 0);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
 			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
 			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
@@ -518,7 +521,7 @@ static int sam9x60_div_pll_set_rate_chg(struct clk_hw *hw, unsigned long rate,
 	div->div = DIV_ROUND_CLOSEST(parent_rate, rate) - 1;
 
 	spin_lock_irqsave(core->lock, irqflags);
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
 			   core->id);
 	regmap_read(regmap, AT91_PMC_PLL_CTRL0, &val);
 	cdiv = (val & core->layout->div_mask) >> core->layout->div_shift;
@@ -574,7 +577,7 @@ static int sam9x60_div_pll_notifier_fn(struct notifier_block *notifier,
 	div->div = div->safe_div;
 
 	spin_lock_irqsave(core.lock, irqflags);
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
 			   core.id);
 	regmap_read(regmap, AT91_PMC_PLL_CTRL0, &val);
 	cdiv = (val & core.layout->div_mask) >> core.layout->div_shift;
-- 
2.43.0


