Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46ADCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02NHwmt4Q/1Wwv24vtMYzG1XiCeSXVTnDMbrgdzumy0=; b=b7QcbueT80hmR6uaX9yJ5v28jN
	rG5eXJepKzZpGkeEjmb6RjuYGHRR7Ed5ePifSXCvAXbgYzGYzuuHGSlyX1hrt7XHwFIbe3YpfCoR9
	rg5n6p1y1XPn4P0aHc4ujP9l8LEjIvVief+VUHxDAcjBFFB+5TFBFXMhAKwNbfDlh29z8NQpsPwLy
	FJcXhoNOvbRAkqE7Zj7JS0ITkFDQm8QVJ1A7cTqEd88r0hESP05p4FXqVotmDlxUZ04dW04JCsZuJ
	OVl3QwFgsa8zLXMgs4BOuFKmNhqM02ARmR9E7b0OqROos9kVMNOcTdeq6qVqLsFMgaYCiXurzQCY/
	vOeggS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXiS-00000005rJV-1XOo;
	Thu, 14 May 2026 15:11:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXiQ-00000005rHK-3uYG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 15:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=02NHwmt4Q/1Wwv24vtMYzG1XiCeSXVTnDMbrgdzumy0=; b=ENF4L1a/dUPqMRDeXpmWFKVxkI
	OPcFHgEzf/f0+5w5Y+hXPyEUi6WqX4f1pcP7YvYDrH3/3+T+9ubvhFWpKiKfrmmt7ZO3wqyBsg4kr
	BaEaNus+e/7h/s3OAmQW8w+Hut8c1xtyX2/EeLqV07BiFUA9wf4+59y4Ihpp2B1yheRo4cEARr+2j
	laAB8ogW/cOltpW3RyB2D7Tb/WKwz4iJyngwLGHdXLrxW7V38mbPcbvJQuhHHqxO0APj4B7a4wXbi
	9YqQnzIgzz4uLA+uqt2oMSyfS1WLi+TICC9yUwBTYsKNUZRIgvq6XCfnfDczZzsjrgn92lS2F5Z12
	zrnY/05A==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXiM-00000003E1m-0OTx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:11:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-449de065cb3so7410702f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 08:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778771464; x=1779376264; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02NHwmt4Q/1Wwv24vtMYzG1XiCeSXVTnDMbrgdzumy0=;
        b=hWgNH2jn1I6aX84Y99F227P8heEKoUcmNLoqLi3FeeXrPkxCF5LOpyGm7O7GzTYc0r
         VxlrxwmYCWGQWfWFRs3aarJAoMP1QMjCYshtWhHldbFQIxFafTFcYmqb8rjSBJ6yEYfa
         TCe5geOPkzvMxj86Yb/CHbtF3uniODvRktFb1AKAFAtkowovcgV/OQK201GW5ezWIHun
         rTviAvpTpVWENb3u45T/dks2ycHKfXz39RQ3NjGwUCWmrZ2AVvgYnRZlv7Y4GTzsgZyd
         E5TtFIPC7llQhEpfDJhxPQFyoM4aW1TONphF9a0c7wFMoHXoZ5Co8AZQWem9/LNuT9Iy
         fy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771464; x=1779376264;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=02NHwmt4Q/1Wwv24vtMYzG1XiCeSXVTnDMbrgdzumy0=;
        b=ssY1aJOLy4y8E9yWkPY0i792RX/ynHSZx9UbmDjD7S6v7SG9BWP3F2PUADaiotFEPn
         mFkk1UF7M/cwwBVekgLSAysebXxzz1PrMZK9DLSAioUe/0x04oGcrpqTBN9mdIRF0Q+z
         Ho2dq9xURyp38wk1SYUnEZH2Z8SspZOKwkRz8AADEQWKi3bExLL8PVS87ZZKU6AWzVpA
         SoGz6K7Zm07Rl9YCEt84vBUzyt+7PtNc9KkEBDMWkI79ui+ftGodjzW/2T80wmyH3d4G
         Ba40bWrrFAtkdbwF7dGkuQsAziKoQ/DsNG6GFwL8isR/klgg1BrvlgLaY/eCm2Ak0nv1
         Sq4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/mwg/CTaHK+KhBe2h8ShaYU1FovIOahkWaOP9VJ+B6NJa/GDnN1pIXGCX+vQWVCtLXX9ogkqD+vQeTD6XiBs1v@lists.infradead.org
X-Gm-Message-State: AOJu0YwYz/nwUkn7TiIHoSW5aUwj+py2X7BGOowKA4ay7mEiJ0mzGcoT
	nF7X/CKJDIF1yWJAGADzeWYVHHKLDJnCdXGjf9orYiGErq227WPCFxC8Eojb89PdPg0=
X-Gm-Gg: Acq92OHs+IusX5wJIw9636elU7xI52Y1psWuF7XI0T9S1B8TPahctZUlT7p4sjwdWeP
	jiqkVdO2CAqI8yHoNBR0NNDoH/gktEOc91mf4rg9V/b4T3tAc8Leks3BhjgNXw5S9EQf8U9qfv/
	UfXrd0vEwQK2/3pTzyDPKxgxx3gYwFUEzQFcm7uWyfoJqVOIsDMNqzZ7UrvtOnopLIUFt9cNUuu
	+bNteW649MqysQ92Ter9F1YjMY5U3g2P6ZkXbjVNfewnHfmzAyLE8zqHTWZM7hk0OAAvqXH8sZh
	UysPlolVJevav20jpinzNFF9tBEdzOPGdXakuYanKP21OdFZTFlTwIOYRCPg1eRDc30XxAm+ogs
	h4oS0m73IjkS28x2lldQfxzzLO22VpMwPd+rmcZaNFlyIQHZUVERLts89UnotVVAGMN7t1x2RvC
	gYetZBs0H1EhVa5ssgUw9bmPimQ89YYg==
X-Received: by 2002:a05:6000:26c1:b0:439:c62a:6dc2 with SMTP id ffacd0b85a97d-45c7bb4a90emr12856516f8f.41.1778771463953;
        Thu, 14 May 2026 08:11:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f63:bf1e:b5:28d8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9ed30110sm8047555f8f.13.2026.05.14.08.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:11:03 -0700 (PDT)
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
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
In-Reply-To: <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:29 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 14 May 2026 17:11:01 +0200
Message-ID: <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_161106_607041_92448A40 
X-CRM114-Status: GOOD (  24.75  )
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
> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
> duty cycle of 50% after predivision.
>
> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
> pre-divider division factor is 2^n.

I understand what you are doing here but I have to ask why this can't be
implemented with independent dividers that already supports power of 2 ?

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 28 +++++++++++++++++++++++-----
>  drivers/clk/meson/clk-pll.h |  2 ++
>  2 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 8568ad6ba7b6..49483e431d44 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -66,6 +66,9 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
>  		rate += DIV_ROUND_UP_ULL(frac_rate, frac_max);
>  	}
>  
> +	if (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)
> +		n = 1 << n;
> +
>  	return DIV_ROUND_UP_ULL(rate, n);
>  }
>  
> @@ -83,7 +86,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
>  	 * it would result in a division by zero. The rate can't be
>  	 * calculated in this case
>  	 */
> -	if (n == 0)
> +	if (n == 0 && !(pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))
>  		return 0;
>  
>  	m = meson_parm_read(clk->map, &pll->m);
> @@ -103,7 +106,12 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
>  {
>  	unsigned int frac_max = pll->frac_max ? pll->frac_max :
>  						(1 << pll->frac.width);
> -	u64 val = (u64)rate * n;
> +	u64 val;
> +
> +	if (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)
> +		n = 1 << n;
> +
> +	val = (u64)rate * n;
>  
>  	/* Bail out if we are already over the requested rate */
>  	if (rate < parent_rate * m / n)
> @@ -142,7 +150,8 @@ static int meson_clk_get_pll_table_index(unsigned int index,
>  					 unsigned int *n,
>  					 struct meson_clk_pll_data *pll)
>  {
> -	if (!pll->table[index].n)
> +	if (!pll->table[index].n &&
> +	    !(pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))
>  		return -EINVAL;
>  
>  	*m = pll->table[index].m;
> @@ -156,7 +165,12 @@ static unsigned int meson_clk_get_pll_range_m(unsigned long rate,
>  					      unsigned int n,
>  					      struct meson_clk_pll_data *pll)
>  {
> -	u64 val = (u64)rate * n;
> +	u64 val;
> +
> +	if (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)
> +		n = 1 << n;
> +
> +	val = (u64)rate * n;
>  
>  	if (__pll_round_closest_mult(pll))
>  		return DIV_ROUND_CLOSEST_ULL(val, parent_rate);
> @@ -173,11 +187,15 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
>  {
>  	*n = index + 1;
>  
> +	if ((pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))
> +		*n = index;
> +
>  	/* Check the predivider range */
>  	if (*n >= (1 << pll->n.width))
>  		return -EINVAL;
>  
> -	if (*n == 1) {
> +	if ((*n == 1 && !(pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO)) ||
> +	    (*n == 0 && (pll->flags & CLK_MESON_PLL_N_POWER_OF_TWO))) {
>  		/* Get the boundaries out the way */
>  		if (rate <= pll->range->min * parent_rate) {
>  			*m = pll->range->min;
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 1be7e6e77631..60b2772a54c8 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -33,6 +33,8 @@ struct pll_mult_range {
>  #define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
>  /* rst signal is active-low (Power-on reset) */
>  #define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(3)
> +/* The division factor of the PLL pre-divider is 2^n */
> +#define CLK_MESON_PLL_N_POWER_OF_TWO	BIT(4)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome

