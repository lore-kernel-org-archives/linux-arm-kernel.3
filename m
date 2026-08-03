Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF0FC55838
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrlG6RlhnBaNqMMkw4zNAoZMeZEfrMq/GASnuyPUjjg=; b=M+uXfYa/F4RlQGzSMiBWtMEd9Q
	5nqw0WnIyGvW33t6JnKSr/INP6p6NCtEgoOMclqI5f8uvx8r/nbOP+wVNegXQpSnEce3okRKzsiuL
	Iw3FAhKLdCZycHvlFo0CZGOVWHJH6T4HD+CpFuqB2AFwG5DsLzP+StTUHMktg/vjzNh2nM0K9MqZz
	f63omhQTsvNuf1VJ0KPZlqFGX1jILfo0F0uvNSJozvXBQ1I+frYhnsy9v7DCxI9izxkqilYS/osYo
	M5mK3xnt/Iix0ZjLpBfG1xh25K+xZne944FOnG4iw1XV01MuGXFEOBZNJZTmhk0L1w6bt/yUi88ti
	uYHguLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx54-00000000KMd-1EVZ;
	Mon, 03 Aug 2026 18:08:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx52-00000000KKx-0EeF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:08:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47fdd674e17so1062336f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780482; x=1786385282; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FrlG6RlhnBaNqMMkw4zNAoZMeZEfrMq/GASnuyPUjjg=;
        b=XB7aBIOilOcUzFczXt+05duy9dE1XhPZFtjtP+dEZ9pof7S+KRPMHurFxQKLxFnCAX
         lnlhLuFgQZQ5tVd05CCI3beJ4REvOHpr9bb4kUe6AoVIavXzPTKpqPZlneDq1wdq8MOI
         LrHRyDBaN33PzIcRsz+FXuQxMYtdi/WlZvFHwnsKAR5cGg5mYvYWNDWfX0WgkXpJiVCx
         r4sYzbOVwpNQ0p1GW+IKQTLxaj+7zDW0U0V/oqmM7APE3QJm0p46DsRla4Q5UhFLPvfY
         WMg4SO2QTYDM5C9v0NQK2gSWnZaM1Y2vXLPrvuaHAtISJmXVsx0JYwohpNoPTp5ptnSw
         hHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780482; x=1786385282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrlG6RlhnBaNqMMkw4zNAoZMeZEfrMq/GASnuyPUjjg=;
        b=P6+b/+w2+Pdw3ZQ5U9mvxI6+IMqrXYncHEG8vRz8N1WGZq1C+7gt7Us5ijiJ4XduxO
         qne4YJ4QIzTMHZvGTdS1nRq8GXJaozGwSrqcLil5TYV5RsKMhqUo6uf9g0OoFJ8OtbJX
         euoxUHFOYZnKK3bv5Nkm7NI9AXuR69zJVFD54Fi6A3M3beeq6kXDgktGb4x5WJJhJPxp
         gdZtSCGtNySxEVzZaDYLFfnT0Yuh3S9/uwng6AQ9EftjokVOvWCkqyho7aILUZp83/B2
         vRKIWMAYm183M9RvjZxEWIlX66UnqCEXLkfMCTXH28N4UfkPV8J7t2aQPaChmFWjrn7d
         NDDg==
X-Forwarded-Encrypted: i=1; AHgh+Rqt/aDQpw5Dn+/QgvrtMk0C1gqDyrWCqXL/q+/WSV1ZhyE7vD3yo72L8HYrSn3mcZ8i8y1oxbohusd4LSYOBsDL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh2aAIgJlPnl8ztgMm6w9kE8dXTM3tOy9kTj0w2K0h1Hs1lCFM
	HulXg0MiOtjKd9kUs6tWkuq6A6lmSfE/TbaNkpzD7Kdl7bwlMV/84k/D
X-Gm-Gg: AR+sD12NyW2h5oRJ2IPCpM8qXrfQ/fYgVmL0WCFmriiE7nUAlOFcUDq9jJXB5c1KCR3
	6KEM3/V1YzzhEXzZLRFZCV6aKsTboHJJmSgwSPOtiwkEM28nc/Svr971NIExlnTGNOM5I6MP/ox
	JMRat84VrXQRVABskHuwe8ikvRZwmXOhp4Ojq2T3wthfRGi3deFe3a7Erp0lyMVcxxfrV9YTJ8F
	GbMnUDiiDBRljSqOtNxsiWeMwxXEqDcUNi1ubshPHb3lQgi9OyDiNbM6pQUu2WL5T7wRfv+gSj3
	Kp2orzMeUr1Dh0zO3kDSEvrYd4ldRIfz+27O5PdtFKRCzToX5JkIZSUi+YI6HH9P+eSL26vMSN6
	zsLD9pAkyGWIwaAGxT3lBnl6MJlzPzO1A0Q9V9eETSxW5bxJQjs1UsM4MEjAVezcVnaDacHDSPf
	qgcj0Yi60uGk2Vr7w+PRwJDPPDnKt02sTwRo/qqTpLXbHwZ4j5JbQXKdZM0BG9ev8iBIqjJNQMD
	EqqeEneihdBCmnyE5vyXzM=
X-Received: by 2002:a05:6000:2709:b0:474:d7a5:4b7a with SMTP id ffacd0b85a97d-47fd73098d1mr21312162f8f.28.1785780481921;
        Mon, 03 Aug 2026 11:08:01 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm37950955f8f.14.2026.08.03.11.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:08:01 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andre.przywara@arm.com,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v2 1/3] clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type
Date: Mon,  3 Aug 2026 20:07:53 +0200
Message-ID: <20260803180755.288793-2-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
References: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110804_175668_C8A7000F 
X-CRM114-Status: GOOD (  32.42  )
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

Some mod clocks do not divide their parent with a linear M+1 divider:
the M factor masks (swallows) M pulses out of every 2^width parent
cycles, so the average output rate is

	rate = parent * (2^width - M) / 2^width

and the surviving pulses keep the parent period.  The A523/T527 GPU
clock (GPU_CLK_REG, 0x670) is such a divider: "FACTOR_M: mask M cycles
at 16 cycles", GPU_CLK = Clock Source * ((16-M)/16) (T527 user manual
v0.92, section 2.7.6.58).

Modelling these registers with the linear ccu_div type programs a
faster clock than requested for every M > 0 (e.g. M=1 on a 800 MHz
parent yields 750 MHz, not 400 MHz).

Add a small ccu type implementing the masking semantics.  Because the
masked output is not an even pulse train, determine_rate prefers, among
the parents that reach the requested rate, the one needing the least
masking, and clamps the result to the request's min_rate/max_rate
bounds.  set_rate_and_parent follows the same ordering rule as
clk_composite_set_rate_and_parent() so no intermediate configuration
overshoots both the old and the new rate, and honours the
CCU_FEATURE_UPDATE_BIT and CCU_FEATURE_KEY_FIELD features, so the type
can be reused on registers that need them.

CLK_SET_RATE_PARENT is deliberately not supported: the masking factor
and a parent rate change are two independent knobs and picking a
combination of both is out of scope for this type.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 drivers/clk/sunxi-ng/Makefile      |   1 +
 drivers/clk/sunxi-ng/ccu_common.h  |   3 +
 drivers/clk/sunxi-ng/ccu_maskdiv.c | 213 +++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_maskdiv.h |  76 ++++++++++
 drivers/clk/sunxi-ng/ccu_mux.c     |   2 -
 5 files changed, 293 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.h

diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index a1c4087d7241..26313083c2f8 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -10,6 +10,7 @@ sunxi-ccu-y			+= ccu_reset.o
 # Base clock types
 sunxi-ccu-y			+= ccu_div.o
 sunxi-ccu-y			+= ccu_frac.o
+sunxi-ccu-y			+= ccu_maskdiv.o
 sunxi-ccu-y			+= ccu_gate.o
 sunxi-ccu-y			+= ccu_mux.o
 sunxi-ccu-y			+= ccu_mult.o
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index d9dc24ad5503..0260af263d05 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -29,6 +29,9 @@
 /* Some clocks need this bit to actually apply register changes */
 #define CCU_SUNXI_UPDATE_BIT		BIT(27)
 
+/* Key value for clocks with CCU_FEATURE_KEY_FIELD (reads as zero) */
+#define CCU_MUX_KEY_VALUE		0x16aa0000
+
 struct device_node;
 
 struct ccu_common {
diff --git a/drivers/clk/sunxi-ng/ccu_maskdiv.c b/drivers/clk/sunxi-ng/ccu_maskdiv.c
new file mode 100644
index 000000000000..4ad49d51405b
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_maskdiv.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 Juan Manuel López Carrillo
+ *
+ * Cycle-masking divider: the M factor masks M pulses out of every
+ * 2^width parent cycles instead of dividing the parent rate, so
+ *
+ *	rate = parent * (2^width - M) / 2^width
+ *
+ * The masked output is not an even pulse train: the surviving pulses
+ * keep the parent period. Rate selection therefore prefers, among the
+ * parents that reach the requested rate, the one needing the least
+ * masking.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+
+#include "ccu_gate.h"
+#include "ccu_maskdiv.h"
+
+static unsigned long ccu_maskdiv_calc_rate(unsigned long parent_rate,
+					   unsigned int m, unsigned int width)
+{
+	unsigned int n = 1 << width;
+
+	return div_u64((u64)parent_rate * (n - m), n);
+}
+
+/*
+ * Smallest M (least masking) whose output does not exceed the requested
+ * rate; masking everything (M == 2^width) is never returned.
+ */
+static unsigned int ccu_maskdiv_find_m(unsigned long parent_rate,
+				       unsigned long rate, unsigned int width)
+{
+	unsigned int n = 1 << width;
+	u64 kept;
+
+	if (!parent_rate || rate >= parent_rate)
+		return 0;
+
+	kept = div64_ul((u64)rate * n, parent_rate);
+	if (!kept)
+		kept = 1;
+
+	return n - (unsigned int)kept;
+}
+
+static void ccu_maskdiv_disable(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_gate_helper_disable(&cmd->common, cmd->enable);
+}
+
+static int ccu_maskdiv_enable(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_gate_helper_enable(&cmd->common, cmd->enable);
+}
+
+static int ccu_maskdiv_is_enabled(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_gate_helper_is_enabled(&cmd->common, cmd->enable);
+}
+
+static unsigned long ccu_maskdiv_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+	unsigned int m;
+	u32 reg;
+
+	reg = readl(cmd->common.base + cmd->common.reg);
+	m = (reg >> cmd->shift) & ((1 << cmd->width) - 1);
+
+	return ccu_maskdiv_calc_rate(parent_rate, m, cmd->width);
+}
+
+static int ccu_maskdiv_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+	unsigned long best_rate = 0, best_parent_rate = 0;
+	struct clk_hw *best_parent = NULL;
+	unsigned int best_m = UINT_MAX;
+	unsigned int i;
+
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
+		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
+		unsigned long parent_rate, new_rate;
+		unsigned int m;
+
+		if (!parent)
+			continue;
+
+		parent_rate = clk_hw_get_rate(parent);
+		m = ccu_maskdiv_find_m(parent_rate, req->rate, cmd->width);
+		new_rate = ccu_maskdiv_calc_rate(parent_rate, m, cmd->width);
+
+		if (new_rate > req->rate)
+			continue;
+
+		/*
+		 * Reject rates outside the framework's bounds: a maskdiv
+		 * rounds by masking parent cycles, so it can only produce
+		 * sub-multiples of a parent rate; without this check a
+		 * consumer asking for, say, a tight [max_rate, max_rate]
+		 * window would silently get a smaller rate.
+		 */
+		if (new_rate < req->min_rate || new_rate > req->max_rate)
+			continue;
+
+		/* Closest rate first; on ties, the least masking */
+		if (new_rate > best_rate ||
+		    (new_rate == best_rate && m < best_m)) {
+			best_rate = new_rate;
+			best_parent_rate = parent_rate;
+			best_parent = parent;
+			best_m = m;
+		}
+	}
+
+	if (!best_parent)
+		return -EINVAL;
+
+	req->best_parent_hw = best_parent;
+	req->best_parent_rate = best_parent_rate;
+	req->rate = best_rate;
+
+	return 0;
+}
+
+static int ccu_maskdiv_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+	unsigned int m;
+	unsigned long flags;
+	u32 reg;
+
+	m = ccu_maskdiv_find_m(parent_rate, rate, cmd->width);
+
+	spin_lock_irqsave(cmd->common.lock, flags);
+
+	reg = readl(cmd->common.base + cmd->common.reg);
+	reg &= ~GENMASK(cmd->shift + cmd->width - 1, cmd->shift);
+	if (cmd->common.features & CCU_FEATURE_KEY_FIELD)
+		reg |= CCU_MUX_KEY_VALUE;
+	if (cmd->common.features & CCU_FEATURE_UPDATE_BIT)
+		reg |= CCU_SUNXI_UPDATE_BIT;
+	writel(reg | (m << cmd->shift), cmd->common.base + cmd->common.reg);
+
+	spin_unlock_irqrestore(cmd->common.lock, flags);
+
+	return 0;
+}
+
+static u8 ccu_maskdiv_get_parent(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_mux_helper_get_parent(&cmd->common, &cmd->mux);
+}
+
+static int ccu_maskdiv_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_mux_helper_set_parent(&cmd->common, &cmd->mux, index);
+}
+
+static int ccu_maskdiv_set_rate_and_parent(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long parent_rate, u8 index)
+{
+	/*
+	 * Same ordering rule as clk_composite_set_rate_and_parent(): if
+	 * switching the mux with the current M would overshoot the
+	 * requested rate, program the divider first, so the
+	 * intermediate rate never exceeds both the old and the new
+	 * rate.
+	 */
+	if (ccu_maskdiv_recalc_rate(hw, parent_rate) > rate) {
+		ccu_maskdiv_set_rate(hw, rate, parent_rate);
+		ccu_maskdiv_set_parent(hw, index);
+	} else {
+		ccu_maskdiv_set_parent(hw, index);
+		ccu_maskdiv_set_rate(hw, rate, parent_rate);
+	}
+
+	return 0;
+}
+
+const struct clk_ops ccu_maskdiv_ops = {
+	.disable	= ccu_maskdiv_disable,
+	.enable		= ccu_maskdiv_enable,
+	.is_enabled	= ccu_maskdiv_is_enabled,
+
+	.get_parent	= ccu_maskdiv_get_parent,
+	.set_parent	= ccu_maskdiv_set_parent,
+
+	.determine_rate	= ccu_maskdiv_determine_rate,
+	.recalc_rate	= ccu_maskdiv_recalc_rate,
+	.set_rate	= ccu_maskdiv_set_rate,
+	.set_rate_and_parent = ccu_maskdiv_set_rate_and_parent,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_maskdiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_maskdiv.h b/drivers/clk/sunxi-ng/ccu_maskdiv.h
new file mode 100644
index 000000000000..e070798f1533
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_maskdiv.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Juan Manuel López Carrillo
+ */
+
+#ifndef _CCU_MASKDIV_H_
+#define _CCU_MASKDIV_H_
+
+#include <linux/clk-provider.h>
+
+#include "ccu_common.h"
+#include "ccu_mux.h"
+
+/*
+ * struct ccu_maskdiv - cycle-masking ("fractional") divider
+ *
+ * This divider does not divide the parent clock: it masks (swallows) M
+ * pulses out of every 2^width parent cycles, so the average output rate
+ * is
+ *
+ *	rate = parent * (2^width - M) / 2^width
+ *
+ * with the remaining pulses keeping the parent period. The A523/T527
+ * GPU clock (GPU_CLK_REG, 0x670) is such a divider: "FACTOR_M: mask M
+ * cycles at 16 cycles", GPU_CLK = Clock Source * ((16-M)/16) (T527 user
+ * manual v0.92, section 2.7.6.58).
+ *
+ * This type does not support CLK_SET_RATE_PARENT: determine_rate
+ * evaluates parents at their current rate and does not propagate rate
+ * requests upstream.  If a future user needs parent rate propagation,
+ * switch to clk_hw_round_rate() in the determine_rate loop.
+ *
+ * @shift:	shift of the M field in the register
+ * @width:	width of the M field; the mask window is 2^width cycles
+ */
+struct ccu_maskdiv {
+	u32			enable;
+
+	u8			shift;
+	u8			width;
+
+	struct ccu_mux_internal	mux;
+	struct ccu_common	common;
+};
+
+#define SUNXI_CCU_MASKDIV_HW_WITH_MUX_TABLE_GATE(_struct, _name,	\
+						 _parents, _table,	\
+						 _reg,			\
+						 _mshift, _mwidth,	\
+						 _muxshift, _muxwidth,	\
+						 _gate, _flags)		\
+	struct ccu_maskdiv _struct = {					\
+		.enable	= _gate,					\
+		.shift	= _mshift,					\
+		.width	= _mwidth,					\
+		.mux	= _SUNXI_CCU_MUX_TABLE(_muxshift, _muxwidth,	\
+					       _table),			\
+		.common	= {						\
+			.reg		= _reg,				\
+			.hw.init	= CLK_HW_INIT_PARENTS_HW(_name,	\
+								 _parents, \
+								 &ccu_maskdiv_ops, \
+								 _flags), \
+		},							\
+	}
+
+static inline struct ccu_maskdiv *hw_to_ccu_maskdiv(struct clk_hw *hw)
+{
+	struct ccu_common *common = hw_to_ccu_common(hw);
+
+	return container_of(common, struct ccu_maskdiv, common);
+}
+
+extern const struct clk_ops ccu_maskdiv_ops;
+
+#endif /* _CCU_MASKDIV_H_ */
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 4503c9780c39..fa1f5fd2a1fd 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -12,8 +12,6 @@
 #include "ccu_gate.h"
 #include "ccu_mux.h"
 
-#define CCU_MUX_KEY_VALUE		0x16aa0000
-
 static u16 ccu_mux_get_prediv(struct ccu_common *common,
 			      struct ccu_mux_internal *cm,
 			      int parent_index)
-- 
2.47.3


