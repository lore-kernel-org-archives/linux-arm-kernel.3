Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB815C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6w9zAXrFNthoikb8I3DDDFP3MuuqyDHpnrpdtCvS1sc=; b=Hv43bDK0O4A2lTIppN3Zg6WSIE
	M1hQ6gaAD6YQW6GIf3gqC/aOqYewMu9y9dyNXMOfKTDaYUlrU9rGi/Yu2LcvztHlxhi5AJIra01Tx
	mwwfieq+qgfXq96OLFRyT6lwh+VOekbQUK8kapvWYp2HFfiFFeSyZMS/InssR83u2JLiiBZbN9XeO
	TfUcgzGrwOlLdMJiXmBdKxopepjR3N8GmJpan/XtsH0+TvIReZV2UXVlRgKUHEHvN2o2il4Ij2IJC
	MEgyhOLMo3qBEEf7N+6FCB5ufEMGUrtpVC48PKekcAWyC/JS9Y9eSrqDeDISLPiPcbvbCvfWWvpL5
	MJe5duiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLbA-0000000CdmJ-38C2;
	Fri, 07 Mar 2025 00:29:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLXx-0000000Cd4a-2uOc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:26:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00C741BC0;
	Thu,  6 Mar 2025 16:26:50 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54A573F673;
	Thu,  6 Mar 2025 16:26:35 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/14] clk: sunxi-ng: mp: introduce dual-divider clock
Date: Fri,  7 Mar 2025 00:26:15 +0000
Message-ID: <20250307002628.10684-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307002628.10684-1-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_162637_817868_27FEA3F5 
X-CRM114-Status: GOOD (  16.01  )
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

The Allwinner A523 SoC introduces some new MP-style mod clock, where the
second "P" divider is an actual numerical divider value, and not the
numbers of bits to shift (1..32 instead of 1,2,4,8).
The rest of the clock is the same as the existing MP clock, so enhance the
existing code to accommodate for this.

Introduce the new CCU feature bit CCU_FEATURE_DUAL_DIV to mark an MP
clock as having two dividers, and change the dividing and encoding code
to differentiate the two cases.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_common.h |  1 +
 drivers/clk/sunxi-ng/ccu_mp.c     | 51 +++++++++++++++++++++++++------
 2 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index dd330426a6e5f..50fd268329671 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -19,6 +19,7 @@
 #define CCU_FEATURE_SIGMA_DELTA_MOD	BIT(7)
 #define CCU_FEATURE_KEY_FIELD		BIT(8)
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
+#define CCU_FEATURE_DUAL_DIV		BIT(10)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)
diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index 2bb8987ddcc20..354c981943b6f 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -10,15 +10,23 @@
 #include "ccu_gate.h"
 #include "ccu_mp.h"
 
+static unsigned int next_div(unsigned int div, bool shift)
+{
+	if (shift)
+		return div << 1;
+	return div + 1;
+}
+
 static unsigned long ccu_mp_find_best(unsigned long parent, unsigned long rate,
 				      unsigned int max_m, unsigned int max_p,
+				      bool shift,
 				      unsigned int *m, unsigned int *p)
 {
 	unsigned long best_rate = 0;
 	unsigned int best_m = 0, best_p = 0;
 	unsigned int _m, _p;
 
-	for (_p = 1; _p <= max_p; _p <<= 1) {
+	for (_p = 1; _p <= max_p; _p = next_div(_p, shift)) {
 		for (_m = 1; _m <= max_m; _m++) {
 			unsigned long tmp_rate = parent / _p / _m;
 
@@ -43,7 +51,8 @@ static unsigned long ccu_mp_find_best_with_parent_adj(struct clk_hw *hw,
 						      unsigned long *parent,
 						      unsigned long rate,
 						      unsigned int max_m,
-						      unsigned int max_p)
+						      unsigned int max_p,
+						      bool shift)
 {
 	unsigned long parent_rate_saved;
 	unsigned long parent_rate, now;
@@ -60,7 +69,7 @@ static unsigned long ccu_mp_find_best_with_parent_adj(struct clk_hw *hw,
 	maxdiv = max_m * max_p;
 	maxdiv = min(ULONG_MAX / rate, maxdiv);
 
-	for (_p = 1; _p <= max_p; _p <<= 1) {
+	for (_p = 1; _p <= max_p; _p = next_div(_p, shift)) {
 		for (_m = 1; _m <= max_m; _m++) {
 			div = _m * _p;
 
@@ -103,18 +112,26 @@ static unsigned long ccu_mp_round_rate(struct ccu_mux_internal *mux,
 	struct ccu_mp *cmp = data;
 	unsigned int max_m, max_p;
 	unsigned int m, p;
+	bool shift = true;
 
 	if (cmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate *= cmp->fixed_post_div;
 
+	if (cmp->common.features & CCU_FEATURE_DUAL_DIV)
+		shift = false;
+
 	max_m = cmp->m.max ?: 1 << cmp->m.width;
-	max_p = cmp->p.max ?: 1 << ((1 << cmp->p.width) - 1);
+	if (shift)
+		max_p = cmp->p.max ?: 1 << ((1 << cmp->p.width) - 1);
+	else
+		max_p = cmp->p.max ?: 1 << cmp->p.width;
 
 	if (!clk_hw_can_set_rate_parent(&cmp->common.hw)) {
-		rate = ccu_mp_find_best(*parent_rate, rate, max_m, max_p, &m, &p);
+		rate = ccu_mp_find_best(*parent_rate, rate, max_m, max_p, shift,
+					&m, &p);
 	} else {
 		rate = ccu_mp_find_best_with_parent_adj(hw, parent_rate, rate,
-							max_m, max_p);
+							max_m, max_p, shift);
 	}
 
 	if (cmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
@@ -167,7 +184,11 @@ static unsigned long ccu_mp_recalc_rate(struct clk_hw *hw,
 	p = reg >> cmp->p.shift;
 	p &= (1 << cmp->p.width) - 1;
 
-	rate = (parent_rate >> p) / m;
+	if (cmp->common.features & CCU_FEATURE_DUAL_DIV)
+		rate = (parent_rate / p) / m;
+	else
+		rate = (parent_rate >> p) / m;
+
 	if (cmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate /= cmp->fixed_post_div;
 
@@ -190,20 +211,27 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long flags;
 	unsigned int max_m, max_p;
 	unsigned int m, p;
+	bool shift = true;
 	u32 reg;
 
+	if (cmp->common.features & CCU_FEATURE_DUAL_DIV)
+		shift = false;
+
 	/* Adjust parent_rate according to pre-dividers */
 	parent_rate = ccu_mux_helper_apply_prediv(&cmp->common, &cmp->mux, -1,
 						  parent_rate);
 
 	max_m = cmp->m.max ?: 1 << cmp->m.width;
-	max_p = cmp->p.max ?: 1 << ((1 << cmp->p.width) - 1);
+	if (shift)
+		max_p = cmp->p.max ?: 1 << ((1 << cmp->p.width) - 1);
+	else
+		max_p = cmp->p.max ?: 1 << cmp->p.width;
 
 	/* Adjust target rate according to post-dividers */
 	if (cmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate = rate * cmp->fixed_post_div;
 
-	ccu_mp_find_best(parent_rate, rate, max_m, max_p, &m, &p);
+	ccu_mp_find_best(parent_rate, rate, max_m, max_p, shift, &m, &p);
 
 	spin_lock_irqsave(cmp->common.lock, flags);
 
@@ -211,7 +239,10 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsigned long rate,
 	reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
 	reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
 	reg |= (m - cmp->m.offset) << cmp->m.shift;
-	reg |= ilog2(p) << cmp->p.shift;
+	if (shift)
+		reg |= ilog2(p) << cmp->p.shift;
+	else
+		reg |= (p - cmp->p.offset) << cmp->p.shift;
 
 	writel(reg, cmp->common.base + cmp->common.reg);
 
-- 
2.46.3


