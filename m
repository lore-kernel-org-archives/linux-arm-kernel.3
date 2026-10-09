Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C7FCA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OR0B7gxjQXP7SQsiz6aV3vPuWAutmo5psfSXuZCrJdw=; b=KoVHHpQK8IG9vx1vwrP91iXDBQ
	6CuN71ctCafFtoh418U4J6R+Hx78SSobZ78SY6fkX+O+ERxLq+lKh/7fPW7TJAKmQGDNjfFKjJXQt
	BJJNrfS0j1gMUXuX3lmEv3xIZmZBhu/14ndDQysgMOVyGKJY6vX8mu6eZ+ASVUG6j/l5w5+eJ73v3
	KvMe1VS6dp5MLah0Wa3OvpJPN2CZJiWw2q+JYn8+Sbk9qfvWbBqe8j5rrkVu1yJzBWoK3FWFP0EBJ
	iMm+ZVVKdn29NY8Y3yznYH6U1Vq9GzNQiv21PSt8F47AlAIh8bgOrzvRghln3m03yQaZ2kzlfq7TS
	0teeHWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDZY-00000006fIF-0QsH;
	Fri, 09 Oct 2026 16:35:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDZV-00000006fGr-2oLe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:35:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so588675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791563748; x=1792168548; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OR0B7gxjQXP7SQsiz6aV3vPuWAutmo5psfSXuZCrJdw=;
        b=dmHPkjqb+vdj9tyllP5cE9KkkE1rSKuGrxjXbxr6gzN83WMMA7j8smiiKOpMdFeKLf
         lEXu/NGbzzgdS4RZ2/adTmoBHGXZEE2vdhdhCcRYfyokHPzFcIusxAYyV50knxD3zVZ/
         piaQaP0orEdJ7C+6761uY4Bh1EuBa3SVsknjD2V/YKKSc9T1VlXs0GvIyPyA4ZHoG+ei
         0JK02+QU3aIH900B3yqH6HVw0jwCSF25gjslQYabkAeW80Bdl/2xZyezTpFA/7LtAdyv
         23Vf+S3PTlg6rE5eokTXdsYCBQQyvhsxlpV+cSjSlMFLENQ6gmsqRiQx7AYtvwvHPdzK
         QkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563748; x=1792168548;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OR0B7gxjQXP7SQsiz6aV3vPuWAutmo5psfSXuZCrJdw=;
        b=HpgsIE/2QjEU/MjysXlxqRi4OoGN3tHOwlbiZdC8hpy0ldJ9UlGIrkkj9/CCWi19Bf
         Xz2ddWfX+tktV5Q9H4ejfHaLyTZQU4Nf+d650OQHon/S7kB+8ysm19JMhAJxE8LfFwjk
         I1qvSx9PdBOUCW1nnItYg/96yjsDDlR3NeJwOHOTYEiLsNcWn5ex+QzXgPAza432eceu
         7ZrXG5eJyY764zVuIt7n7kdsC2+2WXHjcsnhMfFy56RMOhKVomD81/zaUTQG2+1pu5gk
         oefzwc4PSU91jaVgJyCUwGB/0yxpT8bLDuRtWq9kLooLAN8wROFjKFPF3taM635Osj7C
         bTkw==
X-Forwarded-Encrypted: i=1; AKwUvBz7BFa7rq76rugu63nV+MH3Q9K3stDETKiRBCk969ihb7oac0y1alXQlO1MCzPJ8opCdB7xXj2NF40dvkdQpAEk@lists.infradead.org
X-Gm-Message-State: AFuF++nABXjxHDzvTGRRCuOGJGhILM6LJaWBf46I308cNRCdkL3jdBGL
	gQgo22oSkUVg7rbi7x0mo5xHFmJkJ8Yf3QABWkHAFQW4P2YzcbPFORVRjXxvOnCSRZk=
X-Gm-Gg: AYBFou2hUgxda+38R90jpk7VM5aPnl/BFAKRCLVXxJVJufsU3IMeWYBATRRgUSWIYVQ
	daxOWoSnj/K1A5hmokdXIjW7zq+ZXdnjo5BfgXYlA9s1wwKh/zIk0fLbUMAmsZ509upEkW9L8Wb
	nukCdbtvFGLxUx4sB3arOpAqhFQH8mD+D1HVDDC/TZk0RW1iaKZOrepusR/eJDvg8JW3AzYuPwe
	nQSr+K3OvRPhu5TIFyXpmRnvL+UWWBZ4nEf8xygWM1SfT81J8/CnIXqKif8n5OY30ohuwzfJizJ
	NSWUcFmeYabFRugzplqnzZZO8bCGvSdhmBlqdOcPIX0EptzWjEmjbn7+5POhDE4PD4hfNNidWY5
	2nt8QkOEVwAKuxATRTuAOyHm75D5BinEPo47KULxkHTWjl+vvDBZupH+l0NwMaaCiyoP8asAMOS
	uxoow5GvqBKm/BzRVFeXb18s36fT3x9sjlgBbiDZ4FMa71p0HTE1roi0U08m3x0w6dfiwsvkz05
	7IO+hPSsulq5/wwGA==
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a18e4b6241mr55388775e9.16.1791563747862;
        Fri, 09 Oct 2026 09:35:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm105678505e9.2.2026.10.09.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:35:45 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct
 formula instead of divider table
From: Jerome Brunet <jbrunet@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: sboyd@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com, 
 yclu4@nuvoton.com, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008064307.2757324-2-a0987203069@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
 <20261008064307.2757324-2-a0987203069@gmail.com>
Date: Fri, 09 Oct 2026 18:35:25 +0200
Message-Id: <179156372588.266328.3848259565001346041.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3913; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=xzv9srNKau9QTm0+BVYd1p9jfOptiwQ8hJqbnIEu1ag=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknxa9oVTKL1DDcnNHJUbsxhyX63p9tu7xNUk72fLzCt
 GjzZubzHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIiv8M/4uzg8JbXP7rHJwz
 Se2iTZTq8cuHD7rn7GE73Cft3nVJMpXhf/lC0fW5d6+8KpBJash7IDtlVcG55gONT641Xu8XWii
 RzwcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_093549_751205_115BB237 
X-CRM114-Status: GOOD (  25.67  )
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

> The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),

Are you open-coding CLK_DIVIDER_EVEN_INTEGERS ?

 * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
 *	Formula is 2 * (value read from hardware + 1)

Am wondering if this driver is necessary at all ? Can you just use the
regular divider here ?

> which was previously modeled by building a clk_div_table with one entry per
> possible divider value (up to 2^width entries) and feeding it through the
> generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
> helpers. That is unnecessary overhead (a large table allocation and a
> linear scan on every rate lookup) for a relationship with a simple
> closed-form expression, so compute the rate directly instead.
> 
> Drop the mask_bit/mask mechanism as well. The previous code unconditionally
> OR'd an arbitrary bit into the divider register on every set_rate() call,
> and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
> rather than a bit index, so BIT() shifted by an out-of-range amount, which
> is undefined behavior. The divider field write already clears and rewrites
> only its own bits, so no extra forced bit is needed.
> 
> Select the divider with a single helper shared by determine_rate() and
> set_rate(), using closest rounding as before, so the rate promised by
> determine_rate() is the rate that set_rate() programs. The helper clamps
> the divider to the valid range and avoids overflowing 2 * rate for very
> large requested rates, which would otherwise lead to a division by zero.
> Reject a rate of 0 with -EINVAL.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> index e992e7c30341..12a946c989e9 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> @@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
>  	void __iomem *reg;
>  	u8 shift;
>  	u8 width;
> -	u32 mask;
> -	const struct clk_div_table *table;
>  	/* protects concurrent access to clock divider registers */
>  	spinlock_t *lock;
>  };
> @@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
>  
>  static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>  {
> -	unsigned int val;
>  	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> +	unsigned int val;
>  
>  	val = readl_relaxed(dclk->reg) >> dclk->shift;
>  	val &= clk_div_mask(dclk->width);
> -	val += 1;
> -	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
> -				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
> +
> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
> +}
> +
> +static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
> +					  unsigned long parent_rate,
> +					  unsigned long rate)
> +{
> +	unsigned long max = clk_div_mask(dclk->width) + 1;
> +	unsigned long val;
> +
> +	if (rate > parent_rate / 2)
> +		return 1;
> +
> +	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
> +
> +	return clamp(val, 1UL, max);
>  }
>  
>  static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
>  					struct clk_rate_request *req)
>  {
>  	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> +	unsigned int val;
>  
> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
> -				      CLK_DIVIDER_ROUND_CLOSEST);
> +	if (!req->rate)
> +		return -EINVAL;
> +
> +	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);

Rate propagation support is lost with this.

-- 
Jerome


