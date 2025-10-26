Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1907CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGc4tmDZJ76mwoiS18YjqUZ4hOQ4rbY3Qe4eF4Nt39o=; b=Gw0GtzGk8/7i3102lKHPlORDbq
	PPc1NVzq2JiP8wwhEHzxcAKX9DqcxkmcebpbRF1imgDS1W9PJhcOYdv9Sd7N5PCvlVN7l1Jakflqh
	Lzw5GAqKlHcmLuH59ekXYqgsKFWP5XEAs4Ebn7AqUy016LF3MpFaYkmDiZVrJPiti+8NET4q6AO3c
	WRJZXODxX4E71Ei0QmnZlF8ce3BX/HpvIQyUuPaCc2/pQ3eZ6pq/FsWtFQIbS+LL+kPjQFR+NQ/6X
	XSlIY1qs4WqTOqleBnuuSlLfOrqROj9eucFFrJfco5IPafgxLmnpJYToYm6Mg4w7xF2oODh0BB02h
	mOhkm7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD25O-0000000CSKo-1qLJ;
	Sun, 26 Oct 2025 14:51:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD25N-0000000CSIz-03fp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 14:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E510F6043B;
	Sun, 26 Oct 2025 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D37BC4CEF1;
	Sun, 26 Oct 2025 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490267;
	bh=2Zk0BrTQrIpGuIeefScq3Jbl10WMyfDwjyfD4QAcohw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ugAn5cXW7N6RjkEyB6SrOxAF1o5jFsnte5rEtZpGXOobVH2xXiTcbinOYmzvP2+8Y
	 p/9ecx3Ink8eX+T3s+ksK1BSDmIEMY5AJ+VFme66kLlLl2REFGnQLzGrwe0idYUW8B
	 mZYcgYaB0byucM1PCjStKUqQvwIMOGPkgK1DRxgKSqaqWSrcSjivbpBL7P2kEA8VtU
	 P9YB32FFkWMr0x3/9SPIeeOSWrEdA2t5i7VMMMiRXfffF+753TU8MOq67Ob7eQlO+x
	 BPsnpkpNUFgIwStsEx2MzVvqAs9BRTlZIm7p35v5jDHiOaM8SkYcFy8OO/TIfFutoU
	 7t00Iaro6KiAg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sasha Levin <sashal@kernel.org>,
	alexandre.belloni@bootlin.com,
	alexandre.f.demers@gmail.com,
	cristian.birsan@microchip.com,
	andrei.simion@microchip.com,
	bmasney@redhat.com,
	Ryan.Wanner@microchip.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.1] clk: at91: clk-sam9x60-pll: force write to PLL_UPDT register
Date: Sun, 26 Oct 2025 10:49:10 -0400
Message-ID: <20251026144958.26750-32-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

[ Upstream commit af98caeaa7b6ad11eb7b7c8bfaddc769df2889f3 ]

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
Link: https://lore.kernel.org/r/20250827150811.82496-1-nicolas.ferre@microchip.com
[claudiu.beznea: fix "Alignment should match open parenthesis"
 checkpatch.pl check]
Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- `regmap_update_bits()` skips the hardware write when the target value
  matches the current value, so repeated programming of the PLL update
  register could silently do nothing. The replacement with
  `regmap_write_bits()`—which forces the transaction by passing
  `force=true` down to `_regmap_update_bits()` (see
  `include/linux/regmap.h:1340` and
  `drivers/base/regmap/regmap.c:3247`)—guarantees every update command
  actually reaches the PMC.
- The fix touches every path that modifies PLL state: the PLL enable
  sequence now forces the ID latch and both update pulses in
  `sam9x60_frac_pll_set()` (`drivers/clk/at91/clk-sam9x60-pll.c:96`,
  `:128`, `:136`), and the disable path does the same (`:164-175`).
  Without these forced writes, the “apply changes” strobes could be
  dropped, leaving MUL/FRAC reprogramming or ENPLL clears
  unapplied—manifesting as PLLs that refuse to retune or power down.
- Divider programming follows the same requirement:
  `sam9x60_div_pll_set()`, `_unprepare()`, `_set_rate_chg()`, and the
  notifier all now force the ID and UPDATE pulse (`drivers/clk/at91/clk-
  sam9x60-pll.c:365-413`, `:528-599`). This prevents cases where DVFS
  notifier transitions or runtime rate changes fail because the write
  was skipped, which can lead to over-clocking or clocks stuck at stale
  divisors.
- Read-only users are intentionally left on `regmap_update_bits()` (e.g.
  `sam9x60_div_pll_is_prepared()` at `drivers/clk/at91/clk-
  sam9x60-pll.c:427-434`), and the new comment at `:343-348` documents
  the datasheet requirement that the correct PLL ID already be latched
  before issuing the forced update. That keeps behaviour consistent and
  avoids accidental misuse.
- The change is localized to the AT91 SAM9x60 PLL driver, introduces no
  new APIs, and simply guarantees the hardware sequencing works as
  documented; it has been validated on Sama7D65/Sam9x75 hardware per the
  Tested-by tag. The bug being fixed—lost update strobes leading to PLLs
  that won’t reliably enable/disable—is severe for users, while the
  regression risk from issuing guaranteed writes is minimal.

 drivers/clk/at91/clk-sam9x60-pll.c | 75 ++++++++++++++++--------------
 1 file changed, 39 insertions(+), 36 deletions(-)

diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index cefd9948e1039..a035dc15454b0 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -93,8 +93,8 @@ static int sam9x60_frac_pll_set(struct sam9x60_pll_core *core)
 
 	spin_lock_irqsave(core->lock, flags);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_ID_MSK, core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_ID_MSK, core->id);
 	regmap_read(regmap, AT91_PMC_PLL_CTRL1, &val);
 	cmul = (val & core->layout->mul_mask) >> core->layout->mul_shift;
 	cfrac = (val & core->layout->frac_mask) >> core->layout->frac_shift;
@@ -128,17 +128,17 @@ static int sam9x60_frac_pll_set(struct sam9x60_pll_core *core)
 		udelay(10);
 	}
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
-			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
+			  AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
 	regmap_update_bits(regmap, AT91_PMC_PLL_CTRL0,
 			   AT91_PMC_PLL_CTRL0_ENLOCK | AT91_PMC_PLL_CTRL0_ENPLL,
 			   AT91_PMC_PLL_CTRL0_ENLOCK | AT91_PMC_PLL_CTRL0_ENPLL);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
-			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
+			  AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
 	while (!sam9x60_pll_ready(regmap, core->id))
 		cpu_relax();
@@ -164,8 +164,8 @@ static void sam9x60_frac_pll_unprepare(struct clk_hw *hw)
 
 	spin_lock_irqsave(core->lock, flags);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_ID_MSK, core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_ID_MSK, core->id);
 
 	regmap_update_bits(regmap, AT91_PMC_PLL_CTRL0, AT91_PMC_PLL_CTRL0_ENPLL, 0);
 
@@ -173,9 +173,9 @@ static void sam9x60_frac_pll_unprepare(struct clk_hw *hw)
 		regmap_update_bits(regmap, AT91_PMC_PLL_ACR,
 				   AT91_PMC_PLL_ACR_UTMIBG | AT91_PMC_PLL_ACR_UTMIVR, 0);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
-			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
+			  AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
 	spin_unlock_irqrestore(core->lock, flags);
 }
@@ -262,8 +262,8 @@ static int sam9x60_frac_pll_set_rate_chg(struct clk_hw *hw, unsigned long rate,
 
 	spin_lock_irqsave(core->lock, irqflags);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
-			   core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
+			  core->id);
 	regmap_read(regmap, AT91_PMC_PLL_CTRL1, &val);
 	cmul = (val & core->layout->mul_mask) >> core->layout->mul_shift;
 	cfrac = (val & core->layout->frac_mask) >> core->layout->frac_shift;
@@ -275,18 +275,18 @@ static int sam9x60_frac_pll_set_rate_chg(struct clk_hw *hw, unsigned long rate,
 		     (frac->mul << core->layout->mul_shift) |
 		     (frac->frac << core->layout->frac_shift));
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
-			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
+			  AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
 	regmap_update_bits(regmap, AT91_PMC_PLL_CTRL0,
 			   AT91_PMC_PLL_CTRL0_ENLOCK | AT91_PMC_PLL_CTRL0_ENPLL,
 			   AT91_PMC_PLL_CTRL0_ENLOCK |
 			   AT91_PMC_PLL_CTRL0_ENPLL);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
-			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
+			  AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
 	while (!sam9x60_pll_ready(regmap, core->id))
 		cpu_relax();
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
@@ -350,9 +353,9 @@ static void sam9x60_div_pll_set_div(struct sam9x60_pll_core *core, u32 div,
 			   core->layout->div_mask | ena_msk,
 			   (div << core->layout->div_shift) | ena_val);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
-			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
+			  AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
 	while (!sam9x60_pll_ready(regmap, core->id))
 		cpu_relax();
@@ -366,8 +369,8 @@ static int sam9x60_div_pll_set(struct sam9x60_pll_core *core)
 	unsigned int val, cdiv;
 
 	spin_lock_irqsave(core->lock, flags);
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_ID_MSK, core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_ID_MSK, core->id);
 	regmap_read(regmap, AT91_PMC_PLL_CTRL0, &val);
 	cdiv = (val & core->layout->div_mask) >> core->layout->div_shift;
 
@@ -398,15 +401,15 @@ static void sam9x60_div_pll_unprepare(struct clk_hw *hw)
 
 	spin_lock_irqsave(core->lock, flags);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_ID_MSK, core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_ID_MSK, core->id);
 
 	regmap_update_bits(regmap, AT91_PMC_PLL_CTRL0,
 			   core->layout->endiv_mask, 0);
 
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT,
-			   AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
-			   AT91_PMC_PLL_UPDT_UPDATE | core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT,
+			  AT91_PMC_PLL_UPDT_UPDATE | AT91_PMC_PLL_UPDT_ID_MSK,
+			  AT91_PMC_PLL_UPDT_UPDATE | core->id);
 
 	spin_unlock_irqrestore(core->lock, flags);
 }
@@ -518,8 +521,8 @@ static int sam9x60_div_pll_set_rate_chg(struct clk_hw *hw, unsigned long rate,
 	div->div = DIV_ROUND_CLOSEST(parent_rate, rate) - 1;
 
 	spin_lock_irqsave(core->lock, irqflags);
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
-			   core->id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
+			  core->id);
 	regmap_read(regmap, AT91_PMC_PLL_CTRL0, &val);
 	cdiv = (val & core->layout->div_mask) >> core->layout->div_shift;
 
@@ -574,8 +577,8 @@ static int sam9x60_div_pll_notifier_fn(struct notifier_block *notifier,
 	div->div = div->safe_div;
 
 	spin_lock_irqsave(core.lock, irqflags);
-	regmap_update_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
-			   core.id);
+	regmap_write_bits(regmap, AT91_PMC_PLL_UPDT, AT91_PMC_PLL_UPDT_ID_MSK,
+			  core.id);
 	regmap_read(regmap, AT91_PMC_PLL_CTRL0, &val);
 	cdiv = (val & core.layout->div_mask) >> core.layout->div_shift;
 
-- 
2.51.0


