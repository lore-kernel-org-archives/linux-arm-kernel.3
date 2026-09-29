Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88C1CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJ5b28oMDQ1JFt7ArCRl+jwTwYnaX4rf00YVBlonXGs=; b=FvYmhdnGB6qWpXmXDqwTsaSlSy
	ty59ma9VyFnoTBJ7YFT6ucEtKSSFXym4mlfbMYA986FLInPzxWFbV71kwKVx6GQAO0TQ3TbGWire1
	YrmgWOh0a1HPFt7LUqN+VYvWQjP/IvYaCyiL2JqzFqyX7Y4mdnTiqfF171Za7wVqwexIrvCd+y1Iu
	Og11TyzKimpecJXRftjPQeEIAmHQt+PVLmplxHryCaeuSG+WPLZh/89RE6VuHO8NAzEjacZzDqYVh
	QyEv5Nt8qwxbKy6qsOuprXYw6a+IqdU5OtrT2Tsc7oNMN2gn80hpdg5y7wYvdluh5k0+oHj5A19KV
	WOSr999w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS9V-00000002bIK-09uO;
	Tue, 29 Sep 2026 07:21:25 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS9L-00000002bEE-2S5y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:21:16 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0bcdf41a3so2029240a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666475; x=1791271275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJ5b28oMDQ1JFt7ArCRl+jwTwYnaX4rf00YVBlonXGs=;
        b=QFTO+89WYrDuwD9pz7I/9e1UXKD2cq+8gEDx9qgq6AZePfsBjjnDoU3orU1qNNSzTv
         tdgGCZ4TRbd0FrN0mjNc5WyFAxz4dZAj6kBcYhzzvOrynh+tMNDvRwES/JT2VhuDs1wJ
         d7tB8JnHQh6aMkQ17PlQFwSfCC2GBjLXu6jW8QhQZqfvBNheISTxJPcTPMswjFk5DK9c
         px6wWJ5W19XTiW8EpyWOQCWdvKXmg1kW91XaZr7D2LaZsiTKqR1AaeefbkQvAmV430aW
         K85bYU/OP6XPBnwcGo5wCkthtZB++EjynVH8muXsvmeR941y25qtxcYiw/sJAVQVYcAr
         hH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666475; x=1791271275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJ5b28oMDQ1JFt7ArCRl+jwTwYnaX4rf00YVBlonXGs=;
        b=F6YD7qplSmhnHWikafLuj6SkX+wvczNl0Wp8sz5ez9Ei9jgnXO2grhOiQRugQhMmt6
         FBJg7PG+Kn6rESd4rfGMtD48QIHcUZ+FBBYn7EwKrYDHuES4v9WxPqoL0vECOBX1KSFy
         BanR3FD5cmRg5fXoTFiT4Qy9bOaXdu/f+uGPPfJ/wVTtVaTosFh7a+PRcxKkF36Hr+fA
         9EHAIrGZZ1H1uTWB0YNux67Yv5YH6GammySm+WISpASa4Zq8fAD87UePrwK0Jga2Ynll
         +KG5uoFEHVz1rdj6BM+EJeu7zcimtRPVkIsG9t0dtk+1cOzq6YHGnxXuq6FFqOwy2sr1
         ILfA==
X-Forwarded-Encrypted: i=1; AKwUvBwgnK3IXCqy/omeRnP4t+rh9UWtOXyVFPhwiKakDsHLhIbtYng1MYS77ZpXf4+EykJEehsPmYmHdO1ITOeV45Zl@lists.infradead.org
X-Gm-Message-State: AFq9FYITFkgBM28TOWpWjWaMofTdT7HRbQKkjT4eflpQjVJ3AzDEdLlH
	sBBqpbJXhlatYSFdRYr8UI8zoss5nsuL0egIR+2WCJWtfq2OaQyR+078
X-Gm-Gg: AYBFou16mkf/SqE8KMnfbMH/hvc7eYw0MXSGBqU1kNQeTKsxm2DNvEQCi4XqP45TCKB
	j0q8QcQHhlB1WU5LbiNPNzDmzF4BaVjY0TnOA6yG3DncSTy3gsVSF3ycBcsPzC8kPR0OaFHF0Sm
	PAqli1yL2CPWfCBMQCE+RsLvT4qlaDTEFemOUkg4v178jssaCXxnw++tHyNA+RjNskEnZ/YipTt
	34oTzG3WFidHJyH6HzH+3lRiWmXVDV9MmQlWL32htdALmGL9zotPvuus0RG8O6p73iEN3+GFBer
	VKhFA0n8/Pwk72jx2kJnYlzEwFKAnYeMwrhunvWQMw40eBmgwhIWETMsVb2Cztd7DUS1htCu3vd
	pgmUwb7R+JtH5wCxasbD9vSI6+ntfFtswHtCoMejWreUgjIsXSeS5cHs9PF9uzAxAgfx92nbRc8
	5YARzzBUyjydy2U2TPod5rUTz3jg5nj16MXFnuRNekfm/PHytiM/7B1jbBwsNRb4Rxy3IYgmfZk
	6hscIa5bHls8Pqx/SpjvbIT3TwKj96JqcaAGE6wpwCN7OLmHqYeDHVFCPi3Zxk=
X-Received: by 2002:a17:90b:2247:b0:3a0:ca03:3e1f with SMTP id 98e67ed59e1d1-3a0ca03447amr7882860a91.32.1790666474523;
        Tue, 29 Sep 2026 00:21:14 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497edd76dsm3833931a91.7.2026.09.29.00.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:21:14 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 1/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Tue, 29 Sep 2026 15:21:06 +0800
Message-ID: <20260929072106.175202-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929072106.175202-1-a0987203069@gmail.com>
References: <20260929072106.175202-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_002115_630585_05E788C1 
X-CRM114-Status: GOOD (  23.20  )
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

The ADC clock divider register implements a simple closed-form relation,
rate = parent_rate / (2 * (N + 1)), but it was previously modeled by
building a clk_div_table with one entry per possible divider value (up
to 2^width entries) and feeding it through the generic
divider_recalc_rate()/divider_determine_rate()/divider_get_val() helpers.
This is unnecessarily expensive (a large table allocation and a linear
scan on every rate lookup) for what is just a closed-form expression.

Also drop the mask_bit/mask mechanism: the previous code unconditionally
OR'd an arbitrary bit into the divider register on every set_rate() call.
The one existing caller passed mask_bit as a bitmask value (0x1ffff)
rather than a bit index, which BIT() then shifted by an out-of-range
amount, undefined behavior. Since the divider field write already clears
and rewrites only its own bits, no extra forced bit is required, so the
parameter is removed entirely.

Compute the divisor directly in recalc_rate()/determine_rate()/set_rate()
instead, with explicit range clamping and a rate == 0 guard.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 73 +++++++++++-------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c30341..03fcf87caae1 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
 	void __iomem *reg;
 	u8 shift;
 	u8 width;
-	u32 mask;
-	const struct clk_div_table *table;
 	/* protects concurrent access to clock divider registers */
 	spinlock_t *lock;
 };
@@ -29,44 +27,60 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
 
 static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
-	unsigned int val;
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned int val;
 
 	val = readl_relaxed(dclk->reg) >> dclk->shift;
 	val &= clk_div_mask(dclk->width);
-	val += 1;
-	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
-				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
 }
 
 static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned int val;
+
+	if (!req->rate)
+		return -EINVAL;
 
-	return divider_determine_rate(hw, req, dclk->table, dclk->width,
-				      CLK_DIVIDER_ROUND_CLOSEST);
+	val = DIV_ROUND_UP(req->best_parent_rate, 2 * req->rate);
+	if (val == 0)
+		val = 1;
+	if (val > (unsigned int)clk_div_mask(dclk->width) + 1)
+		val = clk_div_mask(dclk->width) + 1;
+
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);
+
+	return 0;
 }
 
 static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
 {
-	int value;
-	unsigned long flags = 0;
-	u32 data;
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned long flags;
+	unsigned int val;
+	u32 data;
+
+	if (!rate)
+		return -EINVAL;
 
-	value = divider_get_val(rate, parent_rate, dclk->table,
-				dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
+	val = DIV_ROUND_UP(parent_rate, 2 * rate);
+	if (val == 0)
+		val = 1;
+	if (val > (unsigned int)clk_div_mask(dclk->width) + 1)
+		val = clk_div_mask(dclk->width) + 1;
 
 	spin_lock_irqsave(dclk->lock, flags);
 
 	data = readl_relaxed(dclk->reg);
 	data &= ~(clk_div_mask(dclk->width) << dclk->shift);
-	data |= (value - 1) << dclk->shift;
-	data |= dclk->mask;
+	data |= (val - 1) << dclk->shift;
 	writel_relaxed(data, dclk->reg);
 
 	spin_unlock_irqrestore(dclk->lock, flags);
+
 	return 0;
 }
 
@@ -79,39 +93,21 @@ static const struct clk_ops ma35d1_adc_clkdiv_ops = {
 struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 				     struct clk_hw *parent_hw, spinlock_t *lock,
 				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit)
+				     u8 shift, u8 width)
 {
-	struct ma35d1_adc_clk_div *div;
-	struct clk_init_data init;
-	struct clk_div_table *table;
 	struct clk_parent_data pdata = { .index = 0 };
-	u32 max_div, min_div;
+	struct ma35d1_adc_clk_div *div;
+	struct clk_init_data init = {};
 	struct clk_hw *hw;
 	int ret;
-	int i;
 
 	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
 	if (!div)
 		return ERR_PTR(-ENOMEM);
 
-	max_div = clk_div_mask(width) + 1;
-	min_div = 1;
-
-	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
-	if (!table)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < max_div; i++) {
-		table[i].val = min_div + i;
-		table[i].div = 2 * table[i].val;
-	}
-	table[max_div].val = 0;
-	table[max_div].div = 0;
-
-	memset(&init, 0, sizeof(init));
 	init.name = name;
 	init.ops = &ma35d1_adc_clkdiv_ops;
-	init.flags |= flags;
+	init.flags = flags;
 	pdata.hw = parent_hw;
 	init.parent_data = &pdata;
 	init.num_parents = 1;
@@ -119,15 +115,14 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	div->reg = reg;
 	div->shift = shift;
 	div->width = width;
-	div->mask = mask_bit ? BIT(mask_bit) : 0;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
 	if (ret)
 		return ERR_PTR(ret);
+
 	return hw;
 }
 EXPORT_SYMBOL_GPL(ma35d1_reg_adc_clkdiv);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 9f65d0623517..f91a8369a2bc 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -1017,7 +1017,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[ADC_DIV] = ma35d1_reg_adc_clkdiv(dev, "adc_div", hws[PCLK0],
 					     &ma35d1_lock, 0,
 					     clk_base + REG_CLK_CLKDIV4,
-					     4, 17, 0x1ffff);
+					     4, 17);
 	hws[ADC_GATE] = ma35d1_clk_gate(dev, "adc_gate", "adc_div",
 					clk_base + REG_CLK_APBCLK2, 24);
 
diff --git a/drivers/clk/nuvoton/clk-ma35d1.h b/drivers/clk/nuvoton/clk-ma35d1.h
index 3adee440f60a..1fdcd4658b5f 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.h
+++ b/drivers/clk/nuvoton/clk-ma35d1.h
@@ -13,6 +13,6 @@ struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const c
 struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 				     struct clk_hw *parent_hw, spinlock_t *lock,
 				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit);
+				     u8 shift, u8 width);
 
 #endif /* __DRV_CLK_NUVOTON_MA35D1_H */
-- 
2.43.0


