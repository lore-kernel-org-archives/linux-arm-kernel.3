Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25C2C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryAgKLfALFr2Ez2BKH25nahygdP4xFd8CVGLpA3hM3A=; b=sYn1vDici8ne+898DkJdG/mE/x
	m3Ht56ra+T70/SmXsW/wqmNCgtWb9eIzTln2lvYXu3vNzq/eqje3+rBfEYtQo5hfcP0q+ZOipO5PB
	XTbsoso5y+FykzUOAWcfSCxinwccad6eaOXBERHY2hDctlpUFLCvsaHREoiADuV4p/z4+suDoh6vp
	K8PHnsPX3+o3FNHy7EQ2H7mhcXwpF5eYLHasmKV1iCqPKIFkiH77pOCq/ieoqBFIAAmAAltFJHwQw
	E/5HZt/IAqcni1fivDcQlIroY5df3gyjQ32LWHaNhEs1XWnHgEHHhK6eLtiS/raLY9qFvDDvNRR/8
	W2uZLNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrPQ-0000000AiZt-3mGZ;
	Fri, 31 Jan 2025 13:50:12 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrMo-0000000AiKG-3esO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 13:47:33 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:a916:3147:9f19:c260])
	by baptiste.telenet-ops.be with cmsmtp
	id 7pmw2E00V0naHe801pmwxG; Fri, 31 Jan 2025 14:47:24 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tdrM6-0000000FHxv-23Wi;
	Fri, 31 Jan 2025 14:46:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tdrMG-0000000DFVT-1zgZ;
	Fri, 31 Jan 2025 14:46:56 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Alex Elder <elder@ieee.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	qat-linux@intel.com,
	linux-gpio@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/3] clk: renesas: Use bitfield helpers
Date: Fri, 31 Jan 2025 14:46:52 +0100
Message-ID: <a407704e1efc9239e8b65cc66b16efbcb8ea8882.1738329459.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738329458.git.geert+renesas@glider.be>
References: <cover.1738329458.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_054731_046610_9C615927 
X-CRM114-Status: GOOD (  14.90  )
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

Use the FIELD_{GET,PREP}() and field_{get,prep}() helpers for const
respective non-const bitfields, instead of open-coding the same
operations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebase on top of commit 470e3f0d0b1529ab ("clk: renesas: rcar-gen4:
    Introduce R-Car Gen4 CPG driver").
---
 drivers/clk/renesas/clk-div6.c      |  6 +++---
 drivers/clk/renesas/rcar-gen3-cpg.c | 15 +++++----------
 drivers/clk/renesas/rcar-gen4-cpg.c |  9 +++------
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 3abd6e5400aded6a..f7b827b5e9b2dd32 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -7,6 +7,7 @@
  * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -171,8 +172,7 @@ static u8 cpg_div6_clock_get_parent(struct clk_hw *hw)
 	if (clock->src_mask == 0)
 		return 0;
 
-	hw_index = (readl(clock->reg) & clock->src_mask) >>
-		   __ffs(clock->src_mask);
+	hw_index = field_get(clock->src_mask, readl(clock->reg));
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
 		if (clock->parents[i] == hw_index)
 			return i;
@@ -191,7 +191,7 @@ static int cpg_div6_clock_set_parent(struct clk_hw *hw, u8 index)
 	if (index >= clk_hw_get_num_parents(hw))
 		return -EINVAL;
 
-	src = clock->parents[index] << __ffs(clock->src_mask);
+	src = field_prep(clock->src_mask, clock->parents[index]);
 	writel((readl(clock->reg) & ~clock->src_mask) | src, clock->reg);
 	return 0;
 }
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 027100e84ee4c429..ca8f6a68771628fb 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -54,10 +54,8 @@ static unsigned long cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
 	unsigned int mult;
-	u32 val;
 
-	val = readl(pll_clk->pllcr_reg) & CPG_PLLnCR_STC_MASK;
-	mult = (val >> __ffs(CPG_PLLnCR_STC_MASK)) + 1;
+	mult = FIELD_GET(CPG_PLLnCR_STC_MASK, readl(pll_clk->pllcr_reg)) + 1;
 
 	return parent_rate * mult * pll_clk->fixed_mult;
 }
@@ -94,7 +92,7 @@ static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	val = readl(pll_clk->pllcr_reg);
 	val &= ~CPG_PLLnCR_STC_MASK;
-	val |= (mult - 1) << __ffs(CPG_PLLnCR_STC_MASK);
+	val |= FIELD_PREP(CPG_PLLnCR_STC_MASK, mult - 1);
 	writel(val, pll_clk->pllcr_reg);
 
 	for (i = 1000; i; i--) {
@@ -176,11 +174,7 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
 					   unsigned long parent_rate)
 {
 	struct cpg_z_clk *zclk = to_z_clk(hw);
-	unsigned int mult;
-	u32 val;
-
-	val = readl(zclk->reg) & zclk->mask;
-	mult = 32 - (val >> __ffs(zclk->mask));
+	unsigned int mult = 32 - field_get(zclk->mask, readl(zclk->reg));
 
 	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * mult,
 				     32 * zclk->fixed_div);
@@ -231,7 +225,8 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
 		return -EBUSY;
 
-	cpg_reg_modify(zclk->reg, zclk->mask, (32 - mult) << __ffs(zclk->mask));
+	cpg_reg_modify(zclk->reg, zclk->mask,
+		       field_prep(zclk->mask, 32 - mult));
 
 	/*
 	 * Set KICK bit in FRQCRB to update hardware setting and wait for
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 31aa790fd003d45e..a63114a1d431968f 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -279,11 +279,7 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
 					   unsigned long parent_rate)
 {
 	struct cpg_z_clk *zclk = to_z_clk(hw);
-	unsigned int mult;
-	u32 val;
-
-	val = readl(zclk->reg) & zclk->mask;
-	mult = 32 - (val >> __ffs(zclk->mask));
+	unsigned int mult = 32 - field_get(zclk->mask, readl(zclk->reg));
 
 	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * mult,
 				     32 * zclk->fixed_div);
@@ -334,7 +330,8 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
 		return -EBUSY;
 
-	cpg_reg_modify(zclk->reg, zclk->mask, (32 - mult) << __ffs(zclk->mask));
+	cpg_reg_modify(zclk->reg, zclk->mask,
+		       field_prep(zclk->mask, 32 - mult));
 
 	/*
 	 * Set KICK bit in FRQCRB to update hardware setting and wait for
-- 
2.43.0


