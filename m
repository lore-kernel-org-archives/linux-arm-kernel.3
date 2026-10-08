Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDB6CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAIjG4ZIMr61qlNuyGnhP301Ha6G3tgAGGAQLhPz8L4=; b=a9Rp0EkGnNnSoyLh38YqD0V4DN
	ZVhZyopzosuUNT+bp1wb7X1aq740XDzmMpf/sH9ieY8WjfHDC6RSkuBS0gxZadiN5Z0qxBq8WkCrE
	JjF7KanhS7xu9h8FtJ3D4dE75yx5UP30zMJoZyza2c9u65Sf7WJk8KTLVU8ky4KjFMgL8APYl7Hxu
	db7iK0YclGVW8vJM+2kDg92/MmHeCPV0NddUziAFA1ATfhnHxB8JqjULIHBX0Lsv6qjFTfg55BdSJ
	nj9pzJ9X9KetExPeYcWOHQCOXL9A1pXCBpRvy4RpWsaYAWVIj9uC3jDrDUVPeHh0p4UcYBi5Ppww3
	2bd0FJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhqp-00000003eRe-0NeT;
	Thu, 08 Oct 2026 06:43:35 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhqm-00000003eQr-1h1j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:43:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e61f017091so6541095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791441812; x=1792046612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAIjG4ZIMr61qlNuyGnhP301Ha6G3tgAGGAQLhPz8L4=;
        b=imkCGY+z9yOWN5FTvcqAv+X9Jt4RZM6zYjcFk916Htr5vWQbf0YT9MXA1i2ao5fAcY
         sfGST5enVufEjVs8/pY3CKJgvBvDZX51UdTm7XqvVgQNoXEgAGSX+YYwY9NIpfOBn2bX
         beD4XGNwXQhLbF2HojwEmxVBfny9YYe80OCmIwiYc47HLbtXeUlg2sqfxfQ6dZ9zx0BP
         naEeoHYOlUsZbRXymErhcZgkFISNBJ/4G+OhXyDRytvXFkulyWTOkDuXU0TYZngBD+qo
         dPXss1LStAQbQnVXasdbS3LLcHSnwbbeUEtYtnKMD57VEL2q53RuZizveLetx8wnluvu
         3Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791441812; x=1792046612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAIjG4ZIMr61qlNuyGnhP301Ha6G3tgAGGAQLhPz8L4=;
        b=fh1r/TlRLMm0NIX2B35RAysLCluRT3MYLawZM8FIaMU29dGCbCoEi1VlFm/k3tivEB
         iBuXll8Wbzy/k+l2rwQbaT0kwpfppvWI5GQltEnpVdGPR2CqGUwa7repY+j2Nyy6QQO0
         0EUZGAv6msckQr3Gy0kMcKifFq8pBLJW1qquSsRYbDC3e7jdwNb2hwyTY5iJLcoxmQL4
         vVD8uDu7BhVTE9694ZOaItEEsGbXL0ZTPOi5iQIicfsXzAYshRX6QB8CqlZnaTLo+cY9
         kGbimRz1c2PeHq2TGo3dW2l2dS13vlvxi5bxzzqiX8Rk/VOauuzSBG2kjdLw0wvP5028
         a/zw==
X-Forwarded-Encrypted: i=1; AKwUvByODVVH7620LJ8eZxIW9mftwqpJ0FoWvfgDijrLl5jyHHXkTxPIAmlgQPVumzMFzoUMm5rjbN4U+wyh/cZIi8dU@lists.infradead.org
X-Gm-Message-State: AFq9FYIktjqloh2LlRKdzgRu6cp/bzpBuOLXFhxqUvyil2D6WfrTuEXs
	5HQBoll19oRvCkw5gN127uK1azLn2/7Vbgq0TeCp6fnjugfog3vpnfua
X-Gm-Gg: AYBFou2gINiMS6AWPXosutmX6djgDiq8IBvNVq4AmjqoI65GzzG0sJNP6LTyYiLrcu7
	e4RGwEDVzdG3tO5eXPg2qC48Ju3/JBiaU6fhZACxAIKkbWEIk1EOg+XCj0H48fPmV/u4jJZXugp
	e71PsT+4y+qWqK5nJD9q0AtBK95rKyUu3S85PplUKh5E5CTrYZkaW1sf5oFGRaSWXEv/PWoVv2m
	N04RoGZzLIpHP+nMH58/n5e5vMT14QcAtVcBeSTUOEurKMk1SplmrfMfjYP/YlQcMjTxyfG2+vq
	nbScGNulkMdY+Ce4Ng06oomDPQ1aoW1MvtGwOeY86LE2/bRU2E1ujDt/xqzChDjLsXLG45UVimi
	yLIAd1E5Xwx1l0cBfuqqpc+9h6lm6db4JCzblvLiCzcT056D/SqRvg+rMxK5XtxT9UI+v1PqFY1
	5ivt4pirgmCB1e1hwZwiIuu18iYsTu1mRxYQgNEIs6qWNN8iT7pW9cna1ajSE1m2QwUrjOuccWN
	0YtjIktZzECNhg243jKGPA7zaXDRru539h7XfXZeXJIzc6xb/2zANuRYqiTRHw=
X-Received: by 2002:a17:903:3c6e:b0:2e5:3451:565 with SMTP id d9443c01a7336-2e6004e63e6mr38271205ad.33.1791441811505;
        Wed, 07 Oct 2026 23:43:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046feacdsm19997845ad.18.2026.10.07.23.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:43:31 -0700 (PDT)
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
Subject: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Thu,  8 Oct 2026 14:43:07 +0800
Message-ID: <20261008064307.2757324-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008064307.2757324-1-a0987203069@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_234332_472348_16DDED48 
X-CRM114-Status: GOOD (  22.72  )
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

The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),
which was previously modeled by building a clk_div_table with one entry per
possible divider value (up to 2^width entries) and feeding it through the
generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
helpers. That is unnecessary overhead (a large table allocation and a
linear scan on every rate lookup) for a relationship with a simple
closed-form expression, so compute the rate directly instead.

Drop the mask_bit/mask mechanism as well. The previous code unconditionally
OR'd an arbitrary bit into the divider register on every set_rate() call,
and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
rather than a bit index, so BIT() shifted by an out-of-range amount, which
is undefined behavior. The divider field write already clears and rewrites
only its own bits, so no extra forced bit is needed.

Select the divider with a single helper shared by determine_rate() and
set_rate(), using closest rounding as before, so the rate promised by
determine_rate() is the rate that set_rate() programs. The helper clamps
the divider to the valid range and avoids overflowing 2 * rate for very
large requested rates, which would otherwise lead to a division by zero.
Reject a rate of 0 with -EINVAL.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 79 ++++++++++++------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c303419..12a946c989e97 100644
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
@@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
 
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
+}
+
+static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
+					  unsigned long parent_rate,
+					  unsigned long rate)
+{
+	unsigned long max = clk_div_mask(dclk->width) + 1;
+	unsigned long val;
+
+	if (rate > parent_rate / 2)
+		return 1;
+
+	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
+
+	return clamp(val, 1UL, max);
 }
 
 static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned int val;
 
-	return divider_determine_rate(hw, req, dclk->table, dclk->width,
-				      CLK_DIVIDER_ROUND_CLOSEST);
+	if (!req->rate)
+		return -EINVAL;
+
+	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
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
 
-	value = divider_get_val(rate, parent_rate, dclk->table,
-				dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
+	if (!rate)
+		return -EINVAL;
+
+	val = ma35d1_clkdiv_get_val(dclk, parent_rate, rate);
 
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
 
@@ -79,39 +99,21 @@ static const struct clk_ops ma35d1_adc_clkdiv_ops = {
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
@@ -119,15 +121,14 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
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
index 9f65d0623517a..f91a8369a2bc7 100644
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
index 3adee440f60a3..1fdcd4658b5ff 100644
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


