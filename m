Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FCBCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFvHwBgw7SDS0ea7gVysmplnDFATWu2WitfyMZ3Xaps=; b=SRX5i2OkDWnNUL/nPQsq0Kbd4W
	pqxQgGUK/+E7EIwKtURWLY+tDKsT+c6moU+nDQwUoIT4gBER5oasjF6vWRpNEetHLkKRPRUP9bzN2
	Q0oWNcKebm3Agqz1ImiKoBd/6b9FYVpIHBe+8Kr4Ja+NrfGDycQqGpgCuckTB28M4aa5Jp1V5sgcz
	+sziuevkA466eONYRxKzH6UrhO7eOakq66ekKlCxIolDb9NBE4Zql1ShA8JbawuTh9m2NFUD/50g7
	y1CXcMph0tRXuN8DlBUoXqE6LMvJeROMrtAgf08prFyJC7D0vwsW3+wU84BCk5GAX9SXYjVNfFEyW
	JcAdUJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSxc-0000000E7HE-46KB;
	Mon, 11 May 2026 15:54:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSxb-0000000E7Gb-0F1F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778514861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EFvHwBgw7SDS0ea7gVysmplnDFATWu2WitfyMZ3Xaps=;
	b=iWW10nDwn6StvNmfUhoXSi8l0paTUkL1oaC+bGPOFMjnJ4iQcA59r1pu0l5IF/n6fnztmV
	sgj12ajMssNji458X6ihT/yktkgsOg/S13na6NBOcpR67Tcfp7Azy3Ak7D27/a3fcvey1O
	hNnl8+Pn7OJ3cj5ZFg5U2uGlk+O0rz0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-SDeD5l56PmC0NyOuF46RoQ-1; Mon, 11 May 2026 11:54:20 -0400
X-MC-Unique: SDeD5l56PmC0NyOuF46RoQ-1
X-Mimecast-MFC-AGG-ID: SDeD5l56PmC0NyOuF46RoQ_1778514859
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ee1a909037so833266285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514859; x=1779119659;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFvHwBgw7SDS0ea7gVysmplnDFATWu2WitfyMZ3Xaps=;
        b=b6Xz3PPqZ/wOyAjAQO4LJ78rGakrtPqZFlVnbmTBsvBN5snqTcV5ZfOStbWBSlAPqa
         oxNNb/ERvRMC5Yczh+UKYkwvXeGy9JIv4xPNL/8/UKD8kpAFfvmO7XhxFiE1Kq+oEzYF
         ul/16zSug/IQ+7d1DJDceQTN/LuYI5zctWVE4QS5b2b2uHy8BhZf0BwcesbQBxyHjg54
         ZWYeT6WhY2d8fiFqXGSKyrUZjBIferKArl+GRmGPOKCsY3KRpDjtkUufnVxquj0lL9tu
         9dDv1+lO4L2ZHKic1b0wdwVcT+mAaIfonyrpDx+50B9AgGQSAUhIyF26RUBUH1q0BySz
         DxfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BynRT0ANISg+RMvZJIIhzS7xUislGEXzH8iTG7rd7c1wvsJviwIgfAeedwhwJFRgn0ijGC/mgaaunZsHYmI/R@lists.infradead.org
X-Gm-Message-State: AOJu0YwqeiIWCxu4EVqsY+WWoK1rwkCxae8MTNIYN0Xth2YiRKPb3VcZ
	rlk78Ap3Rsu1ofDdPkAVPE2mjma4tRqdVIheXTNHru/dnnV8yiHmojO9u6gzcHD2/h3lWjGaKoP
	+BGA8UL+Rl77TQVTaDAfbUCtqCe1f4tCsyQCAZTvXeqWjqQZYbqKzZfBdw/HpaNid5LnmUxZ0+U
	uu
X-Gm-Gg: Acq92OEbQtJb7VPVDEouPzYbaMw6ZWrdS8YzzwLFO9d/IIZot2CMAHmAWTOAqUaIaA4
	/Mi4glytlshsgMC3STtqatxncgjWz3jqImfJ5M2Esy6H7iDj+zhAIyVz6ovTzAIAPZahubJu2ct
	72Yb6D5R19j1cSPV9XakpdGl9ze9wbVdnajptAYW/AYBntstPLfkfD/iFku7OSpAaTU1dzyqQbM
	BXANOBTVOnlFninN9+MUhbk4Beiw3AjjlBAkKFj+kHYDi4y9ZV2RCCOnx0IonGYhdQOkrnvQiY5
	ZY8X6Y4AGoc7rdR/wIC7/tLyVU+C/JO8qIpajQD+UuLv/Yr6OIuzpIAgp0Yt7Y6g2VIqee3lVij
	KvoF0Y3z7koynfDykI9qIDIO53FFGdQF0b+u4oVSxOzzulJKumJgsaiFx
X-Received: by 2002:a05:620a:178f:b0:8cd:9322:d449 with SMTP id af79cd13be357-907bbda9b99mr2293085885a.56.1778514859248;
        Mon, 11 May 2026 08:54:19 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:8cd:9322:d449 with SMTP id af79cd13be357-907bbda9b99mr2293079485a.56.1778514858771;
        Mon, 11 May 2026 08:54:18 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c9229c8sm3387777485a.36.2026.05.11.08.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:54:18 -0700 (PDT)
Date: Mon, 11 May 2026 11:54:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: nuvoton: ma35d1: fix PLL frequency calculation
Message-ID: <agH7qJypv48vkZOr@redhat.com>
References: <20260511031600.31929-1-a0987203069@gmail.com>
 <20260511031600.31929-2-a0987203069@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260511031600.31929-2-a0987203069@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SwdU8ivdvMqooM7FDvZadoDx72_CFuDzWPLKTYtIIXw_1778514859
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_085423_171404_20435691 
X-CRM114-Status: GOOD (  26.92  )
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

Hi Joey,

On Mon, May 11, 2026 at 11:15:59AM +0800, Joey Lu wrote:
> Fix four bugs in the MA35D1 PLL driver:
> 
> 1. PLL_CTL1_FRAC was defined as GENMASK(31, 24) (8 bits), but the
>    hardware fractional field spans bits [31:8] (24 bits). This caused
>    wrong frequency calculation in fractional and spread-spectrum modes.
> 
> 2. div_u64() does not modify its argument in-place; the quotient must
>    be assigned from the return value. Both ma35d1_calc_smic_pll_freq()
>    and ma35d1_calc_pll_freq() discarded the return value, leaving
>    pll_freq undivided and orders of magnitude too high.
> 
> 3. The fractional-mode calculation divided x by FIELD_MAX(PLL_CTL1_FRAC)
>    to get 2 decimal digits. After correcting the mask to 24 bits, update
>    the arithmetic to use 3 decimal digits with proper 24-bit fixed-point
>    rounding.
> 
> 4. ma35d1_clk_pll_determine_rate() called ma35d1_pll_find_closest()
>    unconditionally before the switch, but then overwrote its result by
>    reading the current hardware registers for every PLL type. Move the
>    find_closest() call inside the configurable-PLL branch (APLL, EPLL,
>    VPLL). CAPLL and DDRPLL do not support runtime rate changes and
>    correctly return the current hardware rate.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

Thanks for the patch, however this should really be broken up into more
patches. If possible, one patch for each of the fixes.

Brian


> ---
>  drivers/clk/nuvoton/clk-ma35d1-pll.c | 34 +++++++++++++--------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> index 4620acfe47e8..314b81e7727c 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> @@ -48,7 +48,7 @@
>  #define PLL_CTL1_PD		BIT(0)
>  #define PLL_CTL1_BP		BIT(1)
>  #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
> -#define PLL_CTL1_FRAC		GENMASK(31, 24)
> +#define PLL_CTL1_FRAC		GENMASK(31, 8)
>  #define PLL_CTL2_SLOPE		GENMASK(23, 0)
>  
>  #define INDIV_MIN		1
> @@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
>  	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
>  	outdiv = 1 << p;
>  	pll_freq = (u64)parent_rate * n;
> -	div_u64(pll_freq, m * outdiv);
> +	pll_freq = div_u64(pll_freq, m * outdiv);
>  	return pll_freq;
>  }
>  
> @@ -110,12 +110,12 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
>  
>  	if (mode == PLL_MODE_INT) {
>  		pll_freq = (u64)parent_rate * n;
> -		div_u64(pll_freq, m * p);
> +		pll_freq = div_u64(pll_freq, m * p);
>  	} else {
>  		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
> -		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
> -		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
> -		pll_freq = div_u64(parent_rate * n, 100 * m * p);
> +		/* x is 24-bit fractional part, convert to 3 decimal digits */
> +		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
> +		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
>  	}
>  	return pll_freq;
>  }
> @@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
>  	if (req->best_parent_rate < PLL_FREF_MIN_FREQ || req->best_parent_rate > PLL_FREF_MAX_FREQ)
>  		return -EINVAL;
>  
> -	ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
> -				      reg_ctl, &pll_freq);
> -	if (ret < 0)
> -		return ret;
> -
>  	switch (pll->id) {
>  	case CAPLL:
> +	case DDRPLL:
> +		/* Read-only PLLs: return current rate */
>  		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
> -		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
> +		if (pll->id == CAPLL) {
> +			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
> +		} else {
> +			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
> +			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
> +		}
>  		req->rate = pll_freq;
> -
>  		return 0;
> -	case DDRPLL:
>  	case APLL:
>  	case EPLL:
>  	case VPLL:
> -		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
> -		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
> -		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
> +		/* Configurable PLLs: find closest achievable rate */
> +		ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
> +					      reg_ctl, &pll_freq);
> +		if (ret < 0)
> +			return ret;
>  		req->rate = pll_freq;
> -
>  		return 0;
>  	}
>  
>  	req->rate = 0;
> -
>  	return 0;
>  }
>  
> -- 
> 2.49.0


