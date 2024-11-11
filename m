Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853F7D12D5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 00:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vo0JEcqvPxNuVPB/09CxeSjT5kvaMhjo5cwSgLbHGrk=; b=Kt+x6yelYAh7J64UfjKlLk/0IZ
	Bnog1Gn3ZQCmgc5D1YC/pSFYCtSYmd12Bti3iSxKeeoKvTLTmeYY0B4rTzakE+X9Lf/kuUqYmM+mM
	ek388dw/Jvfa4i/BjUsa617aQUX4g7SKJHk7WvTJ77SpVetcJ7qO+mH9ILUysPMwOaaQtPhk6Ms4H
	U06WXmmnciPQD7vsBkxJlIT4ds7DtSZ3JjZloOSpx1AAXQMDQOpOeV0IOXjFjlO4l630Inizu4dfZ
	26AOBi1CC7Rjji5snfe/OddvZ0uW/8JC/U3yN0hgmnnRzGrkXIHKkUnn8kSVcZcIRrSLLgre0tqDO
	2cEumhUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIhq-0000000FyD1-0IvU;
	Mon, 11 Nov 2024 00:55:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIaj-0000000FwuM-1E4J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 00:47:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE1321CDD;
	Sun, 10 Nov 2024 16:48:06 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00ECF3F66E;
	Sun, 10 Nov 2024 16:47:34 -0800 (PST)
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
	Icenowy Zheng <uwu@icenowy.me>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] clk: sunxi-ng: mp: introduce dual-divider clock
Date: Mon, 11 Nov 2024 00:47:17 +0000
Message-ID: <20241111004722.10130-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111004722.10130-1-andre.przywara@arm.com>
References: <20241111004722.10130-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_164741_442924_09885CD8 
X-CRM114-Status: GOOD (  15.95  )
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
---
 drivers/clk/sunxi-ng/ccu_common.h |  1 +
 drivers/clk/sunxi-ng/ccu_mp.c     | 51 +++++++++++++++++++++++++------
 2 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index 329734f8cf42b..4bb05207bb5df 100644
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
index cc94a694cb676..1be4668abef7c 100644
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
2.46.2


