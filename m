Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0685CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/afa+kv2Lz5RKZtvNmWgTzIvifY9Vb7PPR36VvNXyQ=; b=dGJeMjc6IgKqVSTrtB3wZGUkpX
	d6i9xMI50/PySyqJTZxQF5HrZj0cnuB6WpRQZw8W6lmJMN9c9W5+uvp4grUWrHk4pLjvuvzewzIH4
	7NKV1bhezXbsG0RyKi/4a8vvR4NfJRmFzkPMM1XbEcAsG3G9DEQBZAEbYjs3HwaTNV1qJsVwEakB7
	blz1xOi8hiI69tXiqLCp+4v4PL64BMGWcnqL40aI9E65EX0TSBz4QJJ5SkvROw4oQKw8CxKhhNkqL
	fgFgzZ4G1Yecgl6vvN/zsgfbKfMNQPNByC73UYaEOUXGkAGiVuaw4BBOeLWHMNfLsDDoltZF1zNB2
	aF7r7j9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFM0-00000006yc0-2Y12;
	Fri, 09 Oct 2026 18:30:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLm-00000006yOc-0lGo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:51 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c4d870d54so58419f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570584; x=1792175384; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/afa+kv2Lz5RKZtvNmWgTzIvifY9Vb7PPR36VvNXyQ=;
        b=R6BYIpIdn7Imk9FjfnSJii7fOIHvjEc3LlBw2JbOWSnfI4D8iVY27pwjVESnNbqBX5
         OVaAxVKgwv+6wzDdbTrdT3+PYhIIvJZQzIhJBce/5KMMEjTuH41uB03y89KDeUm2zIxw
         qlINf+0s+Mi1V5oHQs7NzjEGJkmoGk6bnrR2vk79TqwalG32NnHVAcvPh0cZ69Kg11Dk
         y1e7QUQo/2tPnHw0eLY6FqiIXx/MLp2ssHL/gY1CQezNjBkbg9VLnqhsyZHm9+YxEPIU
         qp3h1MFIscNxttPtyI7lDL6TJaiFp+U2FZUzcFWvUjwUQyuk1MpaiVwq28sRDsuAZKw1
         hqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570584; x=1792175384;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/afa+kv2Lz5RKZtvNmWgTzIvifY9Vb7PPR36VvNXyQ=;
        b=1wDS8rqrbnOBUOrj0CfqxLRkEw/noEPIp+rzyuxgLFtWo2GC4YntbSo7JUBXKhH0c0
         uveqVO7SHDSzRRRFB2lM7mysK+btfo2SrTtNPGT6bz+CCKwNa6iwt0Cin8DlD4b+rQA+
         7KTgt3i0W3T6BH5IoGdy34WXCyO78ILQdhbG9CpA8Ug9iwnWc0nFz89uEB+TNNVm/bST
         9rRSApliBf02YH3VGCG60B+alL8+HZEdok2oMIvZSoBndzBAf1iinUpIDo8dzUUZ6C53
         F+r8vGRf/23Wzn4A6CNsdGuTVLQlCgP2tAeyysXsdI6bOh3MfsStnw0lWtHFYFw0VyKh
         c0Ug==
X-Forwarded-Encrypted: i=1; AKwUvBxgoZfaU+TvwTHxzYTYBD3/L7Jiw/Yan0Ks3HaaUvGlocIOFbvFLGxVtN+HkFlriPshBVl7rqYB3nJFSnLO0LnK@lists.infradead.org
X-Gm-Message-State: AFq9FYK2XISYTwjgGVbONfBV8mR0s2DX0uCkKa9eXCNFiwAUZhtqPA0R
	Xz3eEiT43HqcOQe4NTwCQn3IhTunew9f0XCve9WmyWPU35fR/G4j+vI8/GVg3pzVAew=
X-Gm-Gg: AYBFou2kyGFjN50Gu3d3qQnb6Rr8eBPjWEvodK0M43NpQ4ZBLSxC6Z73YJGIPT4mK94
	yah9m5ggJ8ti/bSOJHCy5V4M6AHjup2MNN835K2gB4iXEeRqkR/Tr4Z+fBeXM9zJW8sUKlVVGUT
	nYUl4OQOlq6tS2+ohIGQr/Qrs4gYTr8LPx27QD34ZR7qI2viZH9pJssoweicaYXszyIJIW0hEpR
	0J21yuCQRJcRYOnhmPo8IkbiKa0Hy8TGx9M7BcMOh3kUSuw2c/468z4cU95dzpgcSneG3z8nOIy
	fKgzmE0rUV8DZ7GmPbjBq9bQuxiA8b3wGYqQE+Nj9nh4CYiAoDMVUpg4JUq4nqVTc40Vh+d6+11
	Mcxihg6Gp1wSPL9vp9+zT7W8QuMB+aXnbel16c+SvuKwUjB8wzI2hZB+SSpiYLuZN2z0/EVB4p4
	YGrggb6MM5jKYjmmUNwUZjsd5EEwPHpEi8aSZMasgHgB2qYxMysR01KP2qs2MqcLuACRwY6cdOw
	xQyLV2AE4JpML4oEw==
X-Received: by 2002:a05:6000:46c8:b0:487:1c89:f158 with SMTP id ffacd0b85a97d-48dbaadebc8mr3400904f8f.14.1791570584563;
        Fri, 09 Oct 2026 11:29:44 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm5786376f8f.9.2026.10.09.11.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:44 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 05/11] clk: realtek: Add support for phase locked
 loops (PLLs)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-6-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-6-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057524.266328.7662236812996349329.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8040; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hqh6Oz8jthBJvM6D58JFS6alnDs/Glpqv2ePGiXx8QM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaZ6XD2gxBc7UcxvMqv66R9tfMfl32j8upP+fZ6id
 0cV50mLjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEyEcz4jw5qAl/6Cpc9TZ9UG
 hx7OtNFZ/ahMVML8S+MftuzfBf+fiDH8T+W6Knej7crxOQvKtGPbr8wI4mm59qhhz7Q3nA0zFIU
 u8QIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112946_288402_FADF1462 
X-CRM114-Status: GOOD (  27.40  )
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

> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 13000ed4ba11..71edc18121c6 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,3 +2,5 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += clk-rtk-common.o
> +clk-rtk-y += clk-pll.o
> +clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
> new file mode 100644
> index 000000000000..31670b8316cd
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/export.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +#include "clk-pll.h"
> +
> +#define TIMEOUT 500
> +
> +static inline struct rtk_clk_regmap_pll *to_rtk_clk_regmap_pll(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_pll, clkr);
> +}
> +
> +static int wait_freq_ready(struct rtk_clk_regmap_pll *clkp)
> +{
> +	u32 pollval;
> +
> +	/* reg == 0 means not configured.
> +	 * Register offset 0 is never a valid address on Realtek SoCs.

Fix the comment style please

> +	 */
> +	if (!clkp->freq_ready_reg)
> +		return 0;

Do you need to protect against your own driver providing bad offset ?

> +
> +	return regmap_read_poll_timeout_atomic(clkp->clkr.regmap, clkp->freq_ready_reg, pollval,
> +		(pollval & clkp->freq_ready_mask) == clkp->freq_ready_val, 1, TIMEOUT);
> +}
> +
> +static bool is_power_on(struct rtk_clk_regmap_pll *clkp)
> +{
> +	u32 val;
> +
> +	/* reg == 0 means not configured (assume always on).
> +	 * Register offset 0 is never a valid address on Realtek SoCs.
> +	 */

You've already said this. It would be more helpful to tell us that PLL that does not
provider a power reg is considered to be always powered, if that is the case

> +	if (!clkp->power_reg)
> +		return true;
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->power_reg, &val))
> +		return false;
> +
> +	return (val & clkp->power_mask) == clkp->power_val_on;
> +}
> +
> +static void rtk_clk_regmap_pll_disable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +
> +	if (!clkp->seq_power_off)
> +		return;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);

What do you protect with this ?
regmap does provide some locking already and CCF too. Do you expect something
to poke the registers you are writing ?

> +
> +	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
> +			       clkp->num_seq_power_off);
> +
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +}
> +
> +static int rtk_clk_regmap_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	ret = is_power_on(clkp);
> +
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int rtk_clk_regmap_pll_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	const struct rtk_freq_table *ftblv = NULL;
> +
> +	ftblv = ftbl_find_by_rate(clkp->freq_tbl, req->rate);

Doesn't this completly disregard the parent rate ?

I understand that SoC vendor may expect a single frequency as input but it
it is pretty fragile to do so.

A PLL is usually some sort of (fractional) multiplier.
It is way better to provide the table of multiplier you support, along with their
sequence and properly doing the calculation here.

> +
> +	if (ftblv && ftblv->rate >= req->min_rate) {
> +		req->rate = ftblv->rate;
> +		return 0;
> +	}
> +
> +	/* floor result is below min_rate; find the smallest rate >= min_rate */
> +	ftblv = ftbl_find_ceil_by_rate(clkp->freq_tbl, req->min_rate);
> +	if (!ftblv || ftblv->rate > req->max_rate)
> +		return -EINVAL;

This is not how determine_rate() works. You just round to the closest rate the PLL
supports. You are free to round as you wish (bellow or closest)

Just test the different multipliers you support and return what is best compared to
the request. There is no reason to return EINVAL for this.

> +
> +	req->rate = ftblv->rate;
> +
> +	return 0;
> +}
> +
> +static unsigned long rtk_clk_regmap_pll_recalc_rate(struct clk_hw *hw,
> +						    unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	const struct rtk_freq_table *fv;
> +	unsigned long flags;
> +	u32 freq_val;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->freq_reg, &freq_val)) {
> +		spin_unlock_irqrestore(&clkp->lock, flags);
> +		return 0;
> +	}
> +
> +	freq_val &= clkp->freq_mask;
> +
> +	fv = ftbl_find_by_val_with_mask(clkp->freq_tbl, clkp->freq_mask,
> +					freq_val);
> +
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return fv ? fv->rate : 0;
> +}
> +
> +static int rtk_clk_regmap_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +				       unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	const struct rtk_freq_table *fv;
> +	unsigned long flags;
> +	int ret;
> +
> +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> +	if (!fv || fv->rate != rate)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (clkp->seq_pre_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> +					     clkp->num_seq_pre_set_freq);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> +				 clkp->freq_mask, fv->val);
> +	if (ret)
> +		goto unlock;
> +
> +	if (clkp->seq_post_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> +					     clkp->num_seq_post_set_freq);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	if (is_power_on(clkp)) {
> +		ret = wait_freq_ready(clkp);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +unlock:
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int rtk_clk_regmap_pll_enable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	if (!clkp->seq_power_on)
> +		return ret;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (is_power_on(clkp))
> +		goto unlock;
> +
> +	ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
> +				     clkp->num_seq_power_on);
> +	if (ret)
> +		goto unlock;
> +
> +	ret = wait_freq_ready(clkp);
> +	if (ret)
> +		goto unlock;
> +
> +unlock:
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return ret;
> +}
> +
> +const struct clk_ops rtk_clk_pll_ops = {
> +	.enable         = rtk_clk_regmap_pll_enable,
> +	.disable        = rtk_clk_regmap_pll_disable,
> +	.is_enabled     = rtk_clk_regmap_pll_is_enabled,
> +	.recalc_rate    = rtk_clk_regmap_pll_recalc_rate,
> +	.determine_rate = rtk_clk_regmap_pll_determine_rate,
> +	.set_rate       = rtk_clk_regmap_pll_set_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ops, "CLK_REALTEK");
> +
> +const struct clk_ops rtk_clk_pll_ro_ops = {
> +	.recalc_rate = rtk_clk_regmap_pll_recalc_rate,

is_enabled ?

-- 
Jerome


