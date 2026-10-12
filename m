Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ACBCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zLuY+/+ESi4JJhmc3hnMkOLSBz9DtESmIsl3yGIgb8=; b=PEQSpmL0KDjC3Hu/M8YKnOxyBm
	Ep8zZmYBdQ6gWYZ0Y/4rOn4JLDqUoIgVBOu+AsXjFrfyMYj21ixqReSnos38zIuKdrDBObK8ED2pD
	tMnTTbf5aEhxWB8yNZj0z3jh7jIa8bj6vUPU6vV1PAAVXcGLHGEp+Mr9zUGDfZ8UipD5yEjw9kxnG
	N7hrUwpZPucGHBZK/4Pib7yHdNFxIIMAS/5VRepVw7h+Qucrp+pP5xBd+t0pVK4PBuVFBqmoJQOEp
	7XLquZK2fgLWTwOszbvh2CtjaIRABsSWM0XAM4Lm+ubglHtV/TwnFy+pLayo6Ep/5Zmua2Lb/YOgV
	qqjhs0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBDe-00000009utf-1KWh;
	Mon, 12 Oct 2026 08:17:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBDa-00000009ut6-3Ej3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:17:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so14459985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 01:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791793028; x=1792397828; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zLuY+/+ESi4JJhmc3hnMkOLSBz9DtESmIsl3yGIgb8=;
        b=bVmei02PowWHF+3LHrZDdW59MaI0LK8Ap9WTATzrS5bGlLAXFtlBFcrCYileiY1mHU
         tOCuQ2FFRXaUFFqUpA0nmDX2OF1nYP5RPQdLUyrRfxntlMlWKBATTXD5IfVk5HPzU4Cs
         vmCMgprknsTiylUHH9ILKbiblSz3uasdf/ERWYsk5GH5nCXyZmOxXZjuq+N4e/CaVfOI
         EhTvoQgjWYMPr8npr5FNxr5mJ/jjl22a7nn5QQESw2knA/2XfWbZlWBvlD8B7fjgGWge
         Xh5bQj6GedHS7oKrRFIUDD4+A9ubHH68PNrAgWm20bRd3MebytEnvB/2OXiRB/L9LzXg
         oXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793028; x=1792397828;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zLuY+/+ESi4JJhmc3hnMkOLSBz9DtESmIsl3yGIgb8=;
        b=LWNCqohTJILpoIzcysDMVonxijMqT965qa/trFepIMlfAakfZm/24MjCDruD8nkEN2
         T4nZK1j0ceQXaXiODzVZIS5Ib+2tljv3qe5hYO1gjN1JV3+xu3dfXC9TITx9ZfKMMcQH
         Z3skfTCgGFPQvGAamr5nhU9ncNaQKovEspa6Y+gRzjPloDTC2/OQp2T2Ot9k91AfHNfD
         /xEXBapcDiW3g7E3EW1m8k1ruDsY0Rzo7P32xXyQtlAJrza5xDhGUiUkKgEtNtsM8kP2
         Q2RuyEuvirPL+3JQlARaLq4mfe09F2zVkPSKsvH6VqLnze7hM3iBYD1pRq082tgTTEvn
         SHLg==
X-Forwarded-Encrypted: i=1; AKwUvBwOuht+38gN0OUwuyIWCEO6v5QSjHjyjttpKnPR6r9u5jQpyWFFJ00wnKpQM3rZFbaDf1IHFkiBhsRX6zoEia85@lists.infradead.org
X-Gm-Message-State: AFq9FYKFcD3TzW7xaUExFVK/Bo6P1k7IPcPkig9dJnD2rEb02yrFi1k/
	6jAVv4RVwmOcchMAkmElYYtJno1lTmzUSNDG6W2b+TwXrrg8OjFv4pXwk3BWucUgQT/TpRPQhfr
	jJbx+Qak=
X-Gm-Gg: AYBFou0CfM0N8pO3xGk4xScMSFrRRBEwudQAZc5H5qfjp6gAHxk0Nvgg3t91RdxYuZH
	RHZ7ndiby4knxG//hxnuWBVheuVt7aNCpLmxB6PKd6Ao2pwcV88nW+DbTpAiilJOEyy14gaGZ/2
	NdYcZ0wBef6xEqoSedSJk6YQ4WtGx/g0nVY8KjDJwo8xs4z/r7nUyDebvDcXglwFT7t5+ptj7Kt
	5IOQwLP1Rgl4I6AKPuXcxlNyxOPHzVFhyi8mxxmNi4B4O/vfMfUUFXIRkVBnktN9X5LuqPsm/nj
	/IKKkuwFYm7X9CLUQNnZzJOFangZ5qrdGbI/+wNA3SFzegaoHkBtVv49M72uCg+4c6il8Jt+Yqf
	74a6UGSCF3SwI9VCAJhqpBLT+rpmlI8Gk+w7/Hv5/eraTJ20y8J+f1eFwkxkquLVbFDEbLR4cnT
	vITQ1KxhHA46fcxP8Ayi1a8pAVJmZsNYZLyXFmd5WniaKwnobRh8EsL1H9ZcUFtR5V/pplfR7l7
	od1pgSq7X/zRxXJkQ==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr160793515e9.33.1791793028350;
        Mon, 12 Oct 2026 01:17:08 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm57721225e9.3.2026.10.12.01.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:17:07 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct
 formula instead of divider table
From: Jerome Brunet <jbrunet@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sboyd@kernel.org, 
 ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <2e5f4ca4-ccb7-4328-9bcb-32a2c4f73694@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
 <20261008064307.2757324-2-a0987203069@gmail.com>
 <179156372588.266328.3848259565001346041.b4-review@b4>
 <2e5f4ca4-ccb7-4328-9bcb-32a2c4f73694@gmail.com>
Date: Mon, 12 Oct 2026 10:16:56 +0200
Message-Id: <179179301672.27179.2823663473263190790.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LBNk5mSEvmb/JFtueibojf+Rw2v4KwD8FDbTwjMrtbo=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnplc8itQ6ebFhz7PLFXFem37ylAreXbdi7sTPN7eYM
 Jc09kbO7yhlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEZjcyMhzdfDuAOaxMoPl6
 sk+FDJemiyVzs2R57KKZV43+qbAHTGBkuFg9wfvj6y83hK/fqfx/7/r8KtuUbjnGT74nysN7uKU
 vsQMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_011710_851384_7F844B5E 
X-CRM114-Status: GOOD (  36.67  )
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

On 2026-10-12 13:36 +0800, Joey Lu wrote:
> 
> On 10/10/2026 12:35 AM, Jerome Brunet wrote:
> >> The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),
> > Are you open-coding CLK_DIVIDER_EVEN_INTEGERS ?
> >
> >   * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
> >   *	Formula is 2 * (value read from hardware + 1)
> >
> > Am wondering if this driver is necessary at all ? Can you just use the
> > regular divider here ?
> >
> >> which was previously modeled by building a clk_div_table with one entry per
> >> possible divider value (up to 2^width entries) and feeding it through the
> >> generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
> >> helpers. That is unnecessary overhead (a large table allocation and a
> >> linear scan on every rate lookup) for a relationship with a simple
> >> closed-form expression, so compute the rate directly instead.
> >>
> >> Drop the mask_bit/mask mechanism as well. The previous code unconditionally
> >> OR'd an arbitrary bit into the divider register on every set_rate() call,
> >> and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
> >> rather than a bit index, so BIT() shifted by an out-of-range amount, which
> >> is undefined behavior. The divider field write already clears and rewrites
> >> only its own bits, so no extra forced bit is needed.
> >>
> >> Select the divider with a single helper shared by determine_rate() and
> >> set_rate(), using closest rounding as before, so the rate promised by
> >> determine_rate() is the rate that set_rate() programs. The helper clamps
> >> the divider to the valid range and avoids overflowing 2 * rate for very
> >> large requested rates, which would otherwise lead to a division by zero.
> >> Reject a rate of 0 with -EINVAL.
> >>
> >> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> >> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> >>
> >> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> >> index e992e7c30341..12a946c989e9 100644
> >> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
> >> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> >> @@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
> >>   	void __iomem *reg;
> >>   	u8 shift;
> >>   	u8 width;
> >> -	u32 mask;
> >> -	const struct clk_div_table *table;
> >>   	/* protects concurrent access to clock divider registers */
> >>   	spinlock_t *lock;
> >>   };
> >> @@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
> >>   
> >>   static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> >>   {
> >> -	unsigned int val;
> >>   	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> >> +	unsigned int val;
> >>   
> >>   	val = readl_relaxed(dclk->reg) >> dclk->shift;
> >>   	val &= clk_div_mask(dclk->width);
> >> -	val += 1;
> >> -	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
> >> -				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
> >> +
> >> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
> >> +}
> >> +
> >> +static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
> >> +					  unsigned long parent_rate,
> >> +					  unsigned long rate)
> >> +{
> >> +	unsigned long max = clk_div_mask(dclk->width) + 1;
> >> +	unsigned long val;
> >> +
> >> +	if (rate > parent_rate / 2)
> >> +		return 1;
> >> +
> >> +	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
> >> +
> >> +	return clamp(val, 1UL, max);
> >>   }
> >>   
> >>   static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
> >>   					struct clk_rate_request *req)
> >>   {
> >>   	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> >> +	unsigned int val;
> >>   
> >> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
> >> -				      CLK_DIVIDER_ROUND_CLOSEST);
> >> +	if (!req->rate)
> >> +		return -EINVAL;
> >> +
> >> +	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
> >> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);
> > Rate propagation support is lost with this.
> Thanks for the review.
> On open-coding CLK_DIVIDER_EVEN_INTEGERS: you're right. The ADC divider 
> is exactly 2 * (val + 1), so the regular divider covers it. The 
> dedicated driver is not needed. You're also right that my 
> determine_rate() lost rate propagation, because it never forwarded the 
> request to the parent the way divider_determine_rate() does.
> I tested the regular divider on hardware. That showed a separate problem 
> in the existing clock tree. The mux parents are declared with .fw_name 
> only, but the controller node has no clock-names, so the lookup fails. 
> sysclk1_mux and everything below it (pclk0, adc_div, and so on) end up 
> as orphans at 0 Hz. As a result clk_set_rate() on the ADC clock returns 
> early without writing the divider register. That hid the real behaviour 
> of the divider.
> So I will drop this series and send a new series that:
> 1. fixes the parent lookup in the clock tree, and
> 2. switches the ADC divider to the regular divider and removes the 
> dedicated driver together with the unused mask_bit parameter.

Have you looked at this series ?

https://lore.kernel.org/all/20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com/

It does address several problems the existing driver has when it comes to
parents and incorrect usage of .fw.name

Please sync with Miquel on this.

-- 
Jerome


