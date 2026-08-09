Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56520C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 21:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQDk0f/CX/nJddxBbewiApCN1TYaT4l9+ANcNSyara4=; b=GyAVJ80EXevTN19UUGl6scnGQl
	DPcvmhNHnK5YqPM55wneUlJ2q3Sq7sIUDkcLt8VwQHq4zuuup4Ne1gEP3rBvcDIeEfQKxhfg5zwdV
	UP3CPOSlrwHiWvNTDEuxPmOXfNZgYPij1ZAAd9vzN2V8GZNeuUqtWpONUPp1g6CbGKQPt5AzLZVWg
	8/kWPP94ff7+mfQlDIws+emyvXH5TMmnipUiiv8Y++UqTS5B53l6gZGP9BQU8C4odgXnPytlwip/F
	TK/9WdvVGfTwYS0JmY8pRCNG2HVq7a/5Xc1M0rlqiXGagRsz+8BwQtHbe5aV9zuk2MvYnI8OPUeu3
	xxw/psSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtB5B-0000000AkHS-2qet;
	Sun, 09 Aug 2026 21:29:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtB58-0000000AkDN-3TSL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 21:29:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49954b88fffso12523635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 14:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310961; x=1786915761; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQDk0f/CX/nJddxBbewiApCN1TYaT4l9+ANcNSyara4=;
        b=dg4sdQoS3qkgzxp9DVmd8MexP95X8IdQRAQY25QF8/bH1kYE5TxSfiDA8rpnsdLepu
         hv7e3ePCCTY0nkHpO2lp/gT7YjPZ3VEXHmLKXxDmhFdxiPAOAeR1brOHphz0JSd7nmWk
         Isr2wDBQz2psmUxORENh96Rcc0uCirsjZCIdGHKSYmScVQc6MUeoExqRr5t+4oGBkFkD
         rsswTx10G0JzFmvf4BRq+mLXZtlgRqent+iQp45piUPXkmJuW8tf75bvrXw3/+ClVpDK
         0gEGA5iMTLbqsQ8QSj9a9/V0K+p37DjKyvtb63eCIet1rICjlZMpYIsCjwn0+sGa+lC+
         r65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310961; x=1786915761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQDk0f/CX/nJddxBbewiApCN1TYaT4l9+ANcNSyara4=;
        b=Ykj4223qb/yWwGE0dr4uHVC+thaOXBQUAOcvk/edQuPmEEnhqUH6jV0eyxAxxq1nJc
         Mf+mwyAjWLSWQ9Pdc8OFlvfGXtS8Tski3v86EMsoYYQJoUIFQxsFyFs1q/QIfWdi+U4S
         4f4ECeLWg4HVVPNeNRdIJZwNWv6HMhPrxQbSfbhA3DdYd8n92sANuuOBHg7l1QMKLy2g
         92x4GQb1S7l00R4W874otqGqFgel++aII0pkp1N6H/Wu5p1+xZe8v+ypzva+B8MREI2e
         T0yqUfY87B6nNXzLbkXEmaKF/coRGtM3E7uBoGOkidKWofaN/n+HTkddbv/+Ua+ziD3W
         eDMA==
X-Forwarded-Encrypted: i=1; AHgh+RqxJ/ETbEwFJKGHnjAJu4uNszseMX6UhWEG2lAumJ7S/V64z6+GtT/TkMn8K6+2qm3nHWnmFfm/xUELZRdTd9my@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8ha4g5CdiKS1fXkAydte6B7IqJPKu41LVJ7n1T/6FK8M/ntHG
	ndGjo32o/nf3AhOuCIzy3SOg4E+W24mdOhnlDnoo5JWTXDbllxynoT7E
X-Gm-Gg: AR+sD107kMUqEvptC/guSv/9z8eH0ErdLJSpKk89kShMeh3SWBiqearxOZzZ5JYjId2
	fwoLbvdzIXoSp16jHsQip8rrTVm40Xu9+Kme+9gc1rIZgwFRCHiH0uesB3A9mCOIAbmNc2cefpT
	62NjI9cU8C0l4+79BDs1AcIRrdCCz1V7Xpu88oxEel/OMfup0Kq7zAXSFyyT9ZZJvVD84KdvzHf
	RQ/BuIDkQ/WOwU+i/8Qcj8ID3mZXs+7mveEgY+n6BmkJu53lfooanCI0mJh5TdvTa5aaYTtJUSn
	8DtixOJGHVM42IRfNEeqELIJt6OgbvNq9FQRmrAcfVdy/yPH7f+XFC+cyekI0tSbGEelbBna3H0
	7CJ8VJOeH5woDybISqmZbhV5IcIwY5zEc6NuUO878d2/DaXjm4fDSyhWKcM4U4vXur/OqxvEi3e
	TLV2wylejkKs0MR8U3x1olewI32PydafHL5/guCpKsslTVhdr1lpbvdron6iefpRoQxaoIFHEmF
	QIAQ8ht4Q==
X-Received: by 2002:a05:600c:3b93:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-4996193de3fmr201180815e9.2.1786310960960;
        Sun, 09 Aug 2026 14:29:20 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 10 Aug 2026 00:28:25 +0300
Subject: [PATCH v10 06/12] clk: zte: Add regmap-based clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-zx29clk-v10-6-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ZNxJpzwsBO3OBV6aHCCiuyx42Ef/rjHbiRWZumnp96k=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEObWXRtKfarCx01D6fhXjDV487TIvwmkZzF
 Coi2W0vEheJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxDhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKNmQ/+MrhQUGhu5/mlbTjDgGqPO48LTQMNRnR
 Y/8GxNsJE9/yZUfV0bQGelbfJzwRK7mFYdc3RfEMdlRwPUqtjxGnCYRn84PJYM0NSDVOHVxiXoe
 aTiXCPO3S8JzKPbJUBq9MyKW7iS5GY/obxR+yjOar7sZasaaetNJyZCWpgbafk2E0tKTSVha7R+
 b4Tn+luIyBUWxbKg9sy2zWQhkaddYxD+qCtYflpTx3RewUlTLqeEdxvpTUlnRdVXDuHeoycbuR2
 XfM6dNZxZtxGfpWd9acSz5YtylbT05s+D72bOm8Vd3pXQVYPAhK/tmgZoqj6zpR1cq271kSNUdn
 8T4LSMpBtkCDf2HtL/8ONtrYgOmADnX21y9ASeiNohISjB8vNXUPW0i6jYgJfWLPV/NPQDGMa7X
 3nQWXVCsryf23iAToCg0q5J57tpzBUO3vUZ8xoFys9ia7vSCVqdM2XRRe4b9ItR3PC5Q7L7pTZ1
 0ZJnGNqj19GVTAv1VkKtpkXjU7VFbMFTZ5GeMZrlHRV3xECDpSPg2ddn/fnLuEyvYBVrn7cMwtU
 QDJDzAo+yNipcg/shjeYH3Ab9cfCUvOBjkTR78o+JnbU6L6oWD7dSCY625bTw0XjgJL+FWd8LPr
 q1Z5ZeRCW1MAXCXZL585VXQ+CrUZXNzOHHPsMOK1Bzu6LzPOTvxI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_142922_923803_39FA58BE 
X-CRM114-Status: GOOD (  21.23  )
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

This is based on meson/clk-regmap.c, although slightly simplified. I
have kept the copyright lines at the top of the file to indicate its
origin.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

I see that numerous clock drivers have their own incarnation of regmap-
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code like clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Version 9:
Register single clocks per function invocation, remove
ZX297520V3_CLK_NO_EXPORT again

Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 219 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 212 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 80332dba97f6..022b2be7bb3d 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -1,32 +1,237 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2018 BayLibre, SAS.
  * Copyright (c) 2026 Stefan Dösinger
  */
 
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
 #include "clk-zx.h"
 
+struct zte_clk_regmap {
+	struct clk_hw	hw;
+	struct regmap	*map;
+	u16		reg;
+	u8		shift;
+	u8		size;
+};
+
+static inline struct zte_clk_regmap *to_zte_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct zte_clk_regmap, hw);
+}
+
+static int zte_clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_set_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static void zte_clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	regmap_clear_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static int zte_clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_test_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static const struct clk_ops zte_clk_regmap_gate_ops = {
+	.enable		= zte_clk_regmap_gate_enable,
+	.disable	= zte_clk_regmap_gate_disable,
+	.is_enabled	= zte_clk_regmap_gate_is_enabled,
+};
+
 struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
-				    const struct zx_gate_desc *desc,
-				    struct clk_hw * const *clocks)
+				    const struct zx_gate_desc *desc, struct clk_hw * const *clocks)
+{
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_gate_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT | desc->flags;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = 1;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
+}
+
+static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
+						    unsigned long prate)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		return 0; /* Gives a hint that something is wrong */
+
+	val >>= clk->shift;
+	val &= clk_div_mask(clk->size);
+
+	return divider_recalc_rate(hw, prate, val, NULL, 0, clk->size);
+}
+
+static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
+}
+
+static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
 {
-	return ERR_PTR(-ENODEV);
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << clk->shift;
+
+	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
 }
 
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
 				       const struct zx_div_desc *desc,
 				       struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_divider_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
 }
 
+static u8 zte_clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		return 0xff;
+
+	val >>= clk->shift;
+	val &= GENMASK(clk->size - 1, 0);
+
+	return clk_mux_val_to_index(hw, NULL, 0, val);
+}
+
+static int zte_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val = clk_mux_index_to_val(NULL, 0, index);
+
+	return regmap_update_bits(clk->map, clk->reg,
+				  GENMASK(clk->size - 1, 0) << clk->shift,
+				  val << clk->shift);
+}
+
+static int zte_clk_regmap_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return clk_mux_determine_rate_flags(hw, req, 0);
+}
+
+static const struct clk_ops zte_clk_regmap_mux_ops = {
+	.get_parent = zte_clk_regmap_mux_get_parent,
+	.set_parent = zte_clk_regmap_mux_set_parent,
+	.determine_rate = zte_clk_regmap_mux_determine_rate,
+};
+
 struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
-				   const struct zx_mux_desc *desc,
-				   struct clk_hw * const *clocks)
+			  const struct zx_mux_desc *desc, struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parents[CLK_ZX_MAX_PARENTS];
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	if (WARN_ON(desc->num_parents > ARRAY_SIZE(parents)))
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < desc->num_parents; ++i)
+		parents[i] = zx_get_parent(&desc->parents[i], clocks);
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_mux_ops;
+	init.parent_data = parents;
+	init.num_parents = desc->num_parents;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
 }

-- 
2.54.0


