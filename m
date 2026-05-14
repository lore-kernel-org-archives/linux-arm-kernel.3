Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FECCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wx8lC1fUKhwWFd1n2FvjAaQKoQIAt3R5OYaP0iJN8Cw=; b=27O4hqI9usbIGbERON2AG9IoRw
	5Jr9iMBwy/rR3Jh/NhymDd6eK7mFNQ5CkxJoc3RhzzhdwvKgVGu3251S2QAnQxITUVoSoSD1wVpRX
	BnMhcsoLVDb0GrLdF+Zqm9KGQE3YVb3RsbY6Get1s16BTA1YJp/yxPBghAf5s421JXPQ1dtWfl0pu
	PBybGsq/wvZbjAchxB5WFaMSJs6KNB4/PP/JPyhLS8zjfrMsZpHJM0nSxXBGkwabYZjQDuBEFbcIn
	2E+2lUKvE8EQ3sX+e9NoeW2onxfiK8uUU2rySj91ePa700DlK857O3YV1IQAbr4+I0511f5pqpi5n
	6ZFAnSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXnn-00000005sZp-1iRq;
	Thu, 14 May 2026 15:16:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXnk-00000005sYY-2qZU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:16:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488d2079582so82627255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778771799; x=1779376599; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wx8lC1fUKhwWFd1n2FvjAaQKoQIAt3R5OYaP0iJN8Cw=;
        b=qcYmSbrTpejw7ppEE+j5huyaaJObOj0izbHes333W4vKKgz/d+VjRRM01U9N2/1xt0
         p6Dv7Pn8VMPlDVzO00zCwtzGTKAas3LgIyXWbYRPehT7gwJlAIAkXim/obPPqQk5DN7I
         KVkou8jPkZMTU104tfAoZ1Q1DD9QabwLyx34XazK0B4xykn5szPlS2nxyOb2YOsA+k0D
         Hq3HsmjDpibeEcYvt1EP/ST5KF3mINN++SCdO+GIHoTFjZ4pMAH/uVX5g4NaSeUM5Wi6
         DcY7zGsdqqIpWO9DYLfH9MvkM4IhzV6HwBjE2mhNld4AzCFCGtDaOjVXAtmSZKBd1rYL
         EF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771799; x=1779376599;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wx8lC1fUKhwWFd1n2FvjAaQKoQIAt3R5OYaP0iJN8Cw=;
        b=KdhfY5+xVUYMDKfYkSu+A8fUzNuEKoRAHD/d1MqoRT2dyVxx5K7s45RWgZ0oPJiDHf
         BirIXJJ6wJWpQyJho2H+wNQt9hHjxmX/Uc/m7+oPcLJH7Xr3v1fzlSdq7KLgztO10B2W
         8Ez5iIiH64DVr1/GqC2j8mHRoNzZTPGnvqOXoNq8CJaZM+CdgY7GGiD/l+YNGNetaJi0
         y+ZDY2O6ZiiNrHLYPag5MUVYkS60gx1+cIWEOeoUkgXXuRA/hLhBqXVJgU3ri76ZAjXJ
         sdpETBDNqkYqQ4EG/OHmqjISPIexFJ9M0+4lhuonIbkxWYG92Gwoz6OfUDfoaKkiB8SC
         0TWg==
X-Forwarded-Encrypted: i=1; AFNElJ/X1INkW04utpoF6QxQ7x0PyPTtJZ4FKmCYbaSHcvNEW/NDJl/40a43ep8L2H0XIaH6Xd/LfPdtr9UHouZg1cIW@lists.infradead.org
X-Gm-Message-State: AOJu0YyF2+Q9OrajFT3zTaq/aPjVt5YhNZGfLT1xlLpm3LPJHuybWYk6
	kLZafZ05+0K++8S8GHM5R53Gq1kkIxaVWqzCPggQsWvDRDNqjb99mDX+27svzzCRIas=
X-Gm-Gg: Acq92OGYNnDPdgW0zRfZkCtQ10lJZjiWQdQlFTD+bT6UYo/ry16RLDCahYlwd70Rbmh
	fu604EkOu4thyXTZ7K/bbjmfz74R+c9b8snAEDoO9TbHrGCBFFevTkF7miDI7MfIiyWYy0LYtCS
	kqLuBkTsrzezntJVjhL3uHdeWYcNTViamfaQEFZvrGHB27AwtEYwNaG319leDUDn1GYwojXeYbt
	hgz55E7Zckv6oopMNA2uw2HZdBk6xMO5fB1dXr4UFxrl3z6JdiG/pzTo4Etq4BRQ9sVfs9dcqNn
	DxcJR2XNLPGsbLY+af/G9PgzWGIj0OGosyhEBfza4rhdMSuIFkLOFCZikZr4x92pOZzwIHG3e3V
	da/kkcpX5aql8ga5uhLYj2bZk5cXCOey20zr5SuPFcyTz2p5TLcJasHFuIwRdi3fBoU/HJq3KRu
	v5jeksxwGat68mqmg7OQA=
X-Received: by 2002:a05:600c:154a:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48fce9da5e0mr109291805e9.18.1778771798692;
        Thu, 14 May 2026 08:16:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f63:bf1e:b5:28d8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fd7290007sm31793235e9.5.2026.05.14.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:16:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] clk: amlogic: PLL reset signal supports
 active-low configuration
In-Reply-To: <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:28 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 14 May 2026 17:16:36 +0200
Message-ID: <1jmry26my3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_081640_743586_BB816225 
X-CRM114-Status: GOOD (  23.87  )
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

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> In the A9 design, the PLL reset signal is configured as active-low.
>
> Add the flag 'CLK_MESON_PLL_RST_N' to indicate that the PLL reset signal
> is active-low.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 42 +++++++++++++++++++++++++++++++-----------
>  drivers/clk/meson/clk-pll.h |  2 ++
>  2 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 5a0bd75f85a9..8568ad6ba7b6 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -295,10 +295,14 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> +	unsigned int rst;
>  
> -	if (MESON_PARM_APPLICABLE(&pll->rst) &&
> -	    meson_parm_read(clk->map, &pll->rst))
> -		return 0;
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		rst = meson_parm_read(clk->map, &pll->rst);
> +		if ((rst && !(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)) ||
> +		    (!rst && (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)))

Again not a great usage of binary ops. What you've written above is the
verbose version of a XOR.

The code duplication remarks applies to the rest of the patch too

> +			return 0;
> +	}
>  
>  	if (!meson_parm_read(clk->map, &pll->en) ||
>  	    !meson_parm_read(clk->map, &pll->l))
> @@ -326,14 +330,22 @@ static int meson_clk_pll_init(struct clk_hw *hw)
>  		return 0;
>  
>  	if (pll->init_count) {
> -		if (MESON_PARM_APPLICABLE(&pll->rst))
> -			meson_parm_write(clk->map, &pll->rst, 1);
> +		if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +				meson_parm_write(clk->map, &pll->rst, 0);
> +			else
> +				meson_parm_write(clk->map, &pll->rst, 1);
> +		}
>  
>  		regmap_multi_reg_write(clk->map, pll->init_regs,
>  				       pll->init_count);
>  
> -		if (MESON_PARM_APPLICABLE(&pll->rst))
> -			meson_parm_write(clk->map, &pll->rst, 0);
> +		if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +				meson_parm_write(clk->map, &pll->rst, 1);
> +			else
> +				meson_parm_write(clk->map, &pll->rst, 0);
> +		}
>  	}
>  
>  	return 0;
> @@ -363,15 +375,23 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		return 0;
>  
>  	/* Make sure the pll is in reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 1);
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +			meson_parm_write(clk->map, &pll->rst, 0);
> +		else
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +	}
>  
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
>  
>  	/* Take the pll out reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 0);
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +		else
> +			meson_parm_write(clk->map, &pll->rst, 0);
> +	}
>  
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 97b7c70376a3..1be7e6e77631 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -31,6 +31,8 @@ struct pll_mult_range {
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
>  /* l_detect signal is active-high */
>  #define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
> +/* rst signal is active-low (Power-on reset) */
> +#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(3)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome

