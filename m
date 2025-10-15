Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEF0CCD196
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAlI6O6iKUZf6HH7X5Y11Ys6TYCGaB7Pgxo5CVhd9VI=; b=xLATo9MkNqdtRg9e2XUZ76083R
	HK8Kh4zL8OB22NbhRElEr37QJf12RccxfYLzQqdtiwK9Pzn0dTW4YaSqEjz8kVjpI04yaffGyJPZ0
	ZiTyjykV1BG/4TrcH/epShHRmYw805+qMCHHs6sRP87atxUBXRysFOx0Thu9uqFPF56YNxPlFkLYF
	9uRBrJA2KOy1FcoQ/CyeYP398ii1BSItXfQcfr7XNHHEabWqXYtRutB1t2LINGIg5RB3a9sKnS7JC
	4WG1uX+jnei6dJ8GiyD/KeNVe8pPKk+nMUKOGso9swG29dKyzS6pSeUYqlOly6ObR7jJYd6wnZDOv
	iGrzr3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZn-000000014ac-070o;
	Wed, 15 Oct 2025 09:13:43 +0000
Received: from mail-m19731105.qiye.163.com ([220.197.31.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZf-000000014Hu-2zjH;
	Wed, 15 Oct 2025 09:13:38 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 25fe01673;
	Wed, 15 Oct 2025 17:13:28 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	sugar.zhang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com
Subject: [PATCH v1 1/5] clk: rockchip: Implement rockchip_clk_register_armclk_v2()
Date: Wed, 15 Oct 2025 17:13:21 +0800
Message-Id: <20251015091325.71333-2-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015091325.71333-1-zhangqing@rock-chips.com>
References: <20251015091325.71333-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99e725585b03a3kunmdd11480e6b207f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRgdQ1ZKSBgYHxpISU0ZHUxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kxe+SKL+80fNX2Z0IQZBZ809SNLUjcnZFxr16RHnaMCHi8rCX6s/j7lT9EOgIDzStQko76rXEytVVwDPfeKGPzllWKQieRXr4wuA4W+YRT4J+Wn/CcwV/Y72K0KFt4xhx6Zzt7NfyogcGS2hvy+cTLuk3KVy0bIpXPGsjW0WPBg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=WAlI6O6iKUZf6HH7X5Y11Ys6TYCGaB7Pgxo5CVhd9VI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_021335_918095_4FD664DD 
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

The clock path of CPU may be simplified as follows:

    --gpll--|--\
            |   \
            |    \
            |     \
   --v0pll--| mux |--[gate]--[div]--clk_core--
            |     /
            |    /
   --v1pll--|   /
            |--/

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/clk/rockchip/clk-cpu.c | 165 +++++++++++++++++++++++++++++++++
 drivers/clk/rockchip/clk.c     |  24 +++++
 drivers/clk/rockchip/clk.h     |  15 +++
 3 files changed, 204 insertions(+)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index dcc9dcb597ae..a48628e5c095 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -396,3 +396,168 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
 	kfree(cpuclk);
 	return ERR_PTR(ret);
 }
+
+static int rockchip_cpuclk_v2_pre_rate_change(struct rockchip_cpuclk *cpuclk,
+					      struct clk_notifier_data *ndata)
+{
+	unsigned long new_rate = roundup(ndata->new_rate, 1000);
+	const struct rockchip_cpuclk_rate_table *rate;
+	unsigned long flags;
+
+	rate = rockchip_get_cpuclk_settings(cpuclk, new_rate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for cpuclk\n",
+		       __func__, new_rate);
+		return -EINVAL;
+	}
+
+	if (new_rate > ndata->old_rate) {
+		spin_lock_irqsave(cpuclk->lock, flags);
+		rockchip_cpuclk_set_dividers(cpuclk, rate);
+		spin_unlock_irqrestore(cpuclk->lock, flags);
+	}
+
+	return 0;
+}
+
+static int rockchip_cpuclk_v2_post_rate_change(struct rockchip_cpuclk *cpuclk,
+					       struct clk_notifier_data *ndata)
+{
+	unsigned long new_rate = roundup(ndata->new_rate, 1000);
+	const struct rockchip_cpuclk_rate_table *rate;
+	unsigned long flags;
+
+	rate = rockchip_get_cpuclk_settings(cpuclk, new_rate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for cpuclk\n",
+		       __func__, new_rate);
+		return -EINVAL;
+	}
+
+	if (new_rate < ndata->old_rate) {
+		spin_lock_irqsave(cpuclk->lock, flags);
+		rockchip_cpuclk_set_dividers(cpuclk, rate);
+		spin_unlock_irqrestore(cpuclk->lock, flags);
+	}
+
+	return 0;
+}
+
+static int rockchip_cpuclk_v2_notifier_cb(struct notifier_block *nb,
+					  unsigned long event, void *data)
+{
+	struct clk_notifier_data *ndata = data;
+	struct rockchip_cpuclk *cpuclk = to_rockchip_cpuclk_nb(nb);
+	int ret = 0;
+
+	pr_debug("%s: event %lu, old_rate %lu, new_rate: %lu\n",
+		 __func__, event, ndata->old_rate, ndata->new_rate);
+	if (event == PRE_RATE_CHANGE)
+		ret = rockchip_cpuclk_v2_pre_rate_change(cpuclk, ndata);
+	else if (event == POST_RATE_CHANGE)
+		ret = rockchip_cpuclk_v2_post_rate_change(cpuclk, ndata);
+
+	return notifier_from_errno(ret);
+}
+
+struct clk *rockchip_clk_register_cpuclk_v2(const char *name,
+					    const char *const *parent_names,
+					    u8 num_parents, void __iomem *base,
+					    int muxdiv_offset, u8 mux_shift,
+					    u8 mux_width, u8 mux_flags,
+					    int div_offset, u8 div_shift,
+					    u8 div_width, u8 div_flags,
+					    unsigned long flags, spinlock_t *lock,
+					    const struct rockchip_cpuclk_rate_table *rates,
+					    int nrates)
+{
+	struct rockchip_cpuclk *cpuclk;
+	struct clk_hw *hw;
+	struct clk_mux *mux = NULL;
+	struct clk_divider *div = NULL;
+	const struct clk_ops *mux_ops = NULL, *div_ops = NULL;
+	int ret;
+
+	if (num_parents > 1) {
+		mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+		if (!mux)
+			return ERR_PTR(-ENOMEM);
+
+		mux->reg = base + muxdiv_offset;
+		mux->shift = mux_shift;
+		mux->mask = BIT(mux_width) - 1;
+		mux->flags = mux_flags;
+		mux->lock = lock;
+		mux_ops = (mux_flags & CLK_MUX_READ_ONLY) ? &clk_mux_ro_ops
+							: &clk_mux_ops;
+	}
+
+	if (div_width > 0) {
+		div = kzalloc(sizeof(*div), GFP_KERNEL);
+		if (!div) {
+			ret = -ENOMEM;
+			goto free_mux;
+		}
+
+		div->flags = div_flags;
+		if (div_offset)
+			div->reg = base + div_offset;
+		else
+			div->reg = base + muxdiv_offset;
+		div->shift = div_shift;
+		div->width = div_width;
+		div->lock = lock;
+		div_ops = (div_flags & CLK_DIVIDER_READ_ONLY)
+						? &clk_divider_ro_ops
+						: &clk_divider_ops;
+	}
+
+	hw = clk_hw_register_composite(NULL, name, parent_names, num_parents,
+				       mux ? &mux->hw : NULL, mux_ops,
+				       div ? &div->hw : NULL, div_ops,
+				       NULL, NULL, flags);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto free_div;
+	}
+
+	cpuclk = kzalloc(sizeof(*cpuclk), GFP_KERNEL);
+	if (!cpuclk) {
+		ret = -ENOMEM;
+		goto unregister_clk;
+	}
+
+	cpuclk->reg_base = base;
+	cpuclk->lock = lock;
+	cpuclk->clk_nb.notifier_call = rockchip_cpuclk_v2_notifier_cb;
+	ret = clk_notifier_register(hw->clk, &cpuclk->clk_nb);
+	if (ret) {
+		pr_err("%s: failed to register clock notifier for %s\n",
+		       __func__, name);
+		goto free_cpuclk;
+	}
+
+	if (nrates > 0) {
+		cpuclk->rate_count = nrates;
+		cpuclk->rate_table = kmemdup(rates,
+					     sizeof(*rates) * nrates,
+					     GFP_KERNEL);
+		if (!cpuclk->rate_table) {
+			ret = -ENOMEM;
+			goto free_cpuclk;
+		}
+	}
+
+	return hw->clk;
+
+free_cpuclk:
+	kfree(cpuclk);
+unregister_clk:
+	clk_hw_unregister_composite(hw);
+free_div:
+	kfree(div);
+free_mux:
+	kfree(mux);
+
+	return ERR_PTR(ret);
+}
diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 19caf26c991b..460b5fa462ce 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -722,6 +722,30 @@ void rockchip_clk_register_armclk(struct rockchip_clk_provider *ctx,
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_register_armclk);
 
+void rockchip_clk_register_armclk_v2(struct rockchip_clk_provider *ctx,
+				     struct rockchip_clk_branch *list,
+				     const struct rockchip_cpuclk_rate_table *rates,
+				     int nrates)
+{
+	struct clk *clk;
+
+	clk = rockchip_clk_register_cpuclk_v2(list->name, list->parent_names,
+					      list->num_parents, ctx->reg_base,
+					      list->muxdiv_offset, list->mux_shift,
+					      list->mux_width, list->mux_flags,
+					      list->div_offset, list->div_shift,
+					      list->div_width, list->div_flags,
+					      list->flags, &ctx->lock, rates, nrates);
+	if (IS_ERR(clk)) {
+		pr_err("%s: failed to register clock %s: %ld\n",
+		       __func__, list->name, PTR_ERR(clk));
+		return;
+	}
+
+	rockchip_clk_set_lookup(ctx, clk, list->id);
+}
+EXPORT_SYMBOL_GPL(rockchip_clk_register_armclk_v2);
+
 void rockchip_clk_protect_critical(const char *const clocks[],
 				   int nclocks)
 {
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 7c5e74c7a2e2..0b356689032d 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -622,6 +622,17 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
 			const struct rockchip_cpuclk_rate_table *rates,
 			int nrates, void __iomem *reg_base, spinlock_t *lock);
 
+struct clk *rockchip_clk_register_cpuclk_v2(const char *name,
+					    const char *const *parent_names,
+					    u8 num_parents, void __iomem *base,
+					    int muxdiv_offset, u8 mux_shift,
+					    u8 mux_width, u8 mux_flags,
+					    int div_offset, u8 div_shift,
+					    u8 div_width, u8 div_flags,
+					    unsigned long flags, spinlock_t *lock,
+					    const struct rockchip_cpuclk_rate_table *rates,
+					    int nrates);
+
 struct clk *rockchip_clk_register_mmc(const char *name,
 				const char *const *parent_names, u8 num_parents,
 				void __iomem *reg,
@@ -1208,6 +1219,10 @@ void rockchip_clk_register_armclk(struct rockchip_clk_provider *ctx,
 			const struct rockchip_cpuclk_reg_data *reg_data,
 			const struct rockchip_cpuclk_rate_table *rates,
 			int nrates);
+void rockchip_clk_register_armclk_v2(struct rockchip_clk_provider *ctx,
+				     struct rockchip_clk_branch *list,
+				     const struct rockchip_cpuclk_rate_table *rates,
+				     int nrates);
 void rockchip_clk_protect_critical(const char *const clocks[], int nclocks);
 void rockchip_register_restart_notifier(struct rockchip_clk_provider *ctx,
 					unsigned int reg, void (*cb)(void));
-- 
2.34.1


