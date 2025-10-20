Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D85CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+POII8yE39Tn3Tv94O818PXGkTF4y8feAyeQOz6HMQ=; b=tlL0xILoe1q0VE1OzhAGU5qS1A
	7SKlvH5r8PcDluA/DWMNHBNIgdKpw7quwlOG9qnJqMlFUkIPCMbsLny6UWY9Ly3JoOGUj1tt1p7Qe
	B6hhePjucGwvlr1JuqnXJL4KAmgEYepuqJL2zMZjwN5/XLefsFueQg4kVLOAjwUUdR8ZUHwX4UKYv
	zwG0PNh2OwHKuIRbu199c/AoJVraHNmygCKxfzIBiOfRN4uMTvCrRvWn/MdW2m8twEhRV31Tdchmj
	u9ErHe37VpCLz+f9ta6Za/1U8gQPI0bqvHV41wZ7nP4qbVgqWKaB86r2cSwZ65p+pxI8CdG6/z3/Q
	4117j5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAviD-0000000EnsS-0fHE;
	Mon, 20 Oct 2025 19:38:33 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAviA-0000000Enrj-0Hpo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:38:31 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b660019ac2aso604186666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989108; x=1761593908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i+POII8yE39Tn3Tv94O818PXGkTF4y8feAyeQOz6HMQ=;
        b=owiBqtaGPp3nFf1gejtWlozsx1ZfMezmLZQ/rHRp0mS6d68sA/P+Hbj7aK3mxib0R4
         n0TxOUz3s1SjvyBvUA1HFldt7yqxooS5LfsgiXRU6INbWkyzgQeFhH/8ZXVB0IqRZ3l0
         /hVYD/A+Kt3ltXpMwy59FCn9rV/1ECWQFUiuvuILiS0jUPzF9Qh6tmAIFE7IKJakOHnJ
         S2Qo/RDUlKJlwQ7tbE7Mqa5IQbbEgwdFCGLuWlv6RR4G/U7lhoscJtKuB2HT83YbHdeb
         tvHh6bERGv25WVAmsozG9jYYfhXJrlKWfsTX5OOnrUhn5pvO9GLH2o7wxd7/o0pFGBZl
         RQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989108; x=1761593908;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+POII8yE39Tn3Tv94O818PXGkTF4y8feAyeQOz6HMQ=;
        b=ZeHXjoW2BUFaLa0qXbSSnBKsBa53XMzu9WzTy9UYAuyWtGzBIsbk6VKQ/6vYon1oG+
         uW3HPCS+d5/lm82B0KYQPOdYZYfiTLPZgwIzkg8mQwKRoBwCvgKdQiTIQoJwySvdZIk1
         rOhbibzID2PHfgIpZmjuPcLuIBO2VQrD4ry6KZ96aPM/lMpW1EtG19ynMCrSSJmKy/Dg
         h6IgdTmK6YnWsHS/ut4p9qvizwkr4QJ76+u+E++JhiiFFnxVkEiVAVeFwo2rCPuBwNdZ
         IHlIzjmltZMgeA+p1cDV3ZdcmBL1WcuGiztJlRd2t1AVTgkrljxLp9cREVHaCZ9aCA8x
         wfxA==
X-Forwarded-Encrypted: i=1; AJvYcCUA+HfMdCt8amy0M9h6DOVi8uPsAx9eqjnSWvch+AOefwdzvib4VzBwTZtiak1+6glQYWBKAy97IS9KMCgSsWHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwAZZU/maqHbjJB8gIKC6z8ZqQtQ6VCcEYDZ18pQuGNduI+ifbL
	imJRRHqwSP31tTIJIZzqH+RyYkIyX95Fd05x5HjiQyiMalRKhyYB38hhfavsqozDZSw=
X-Gm-Gg: ASbGnctULPqQXuzmH5sx+qrBpzMb57Lhr138NF9Zd7+Yy2+I9IVJfXjfWDrv/RsIHq/
	ajJilPpyuUMtpcxqiHPyzMNROJDYSXd8GAEsi0KFT2cAItMfoPAe5WAXJRyKU2pgmzeb/RDgHmj
	v1OSLsEI9MWK1owKUxSNeak3I1KkveMFhelp5LvC6/y8qJzpufpvEKhqeAFAGmlS38Ft0gT7/E0
	PB9ER+prKra6siSsRRk7kq6StIV1L7Cj2+FuinwLgkbY+j1f8FRq39xqpibW+q+LkzsnfrBMMJK
	yP4/qTX9Di1vFHiXZi9rVcQPSQMyB4YqOs0ZCCwLK3aNreNTJg80G4wzCPu5ipbYHcn+P9HbbMd
	yQU1eithjZgWfutX262z2VP3snrh7Jy1buw+8/mrJIwemrgMedm/SPl4l1WDQ1x0SflUJAe7EsK
	s5nALbPdArMI28+zFT/TDGYVXiZMPFiA==
X-Google-Smtp-Source: AGHT+IFdcQDIo2mOF/i8zi/X2ww0d2oBPJM2lD8zVmbbp1jaSiX2zU6I5RocEU06qb06iAN1mVpxnA==
X-Received: by 2002:a17:907:2d23:b0:b55:c837:f6f5 with SMTP id a640c23a62f3a-b6472b5f7c3mr1647314766b.1.1760989107987;
        Mon, 20 Oct 2025 12:38:27 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83914d0sm861289966b.21.2025.10.20.12.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:38:27 -0700 (PDT)
Message-ID: <63bcb444-7baf-4332-bca5-9582818691b3@tuxon.dev>
Date: Mon, 20 Oct 2025 22:38:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 03/31] clk: at91: sam9x75: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <42d01c533eecf4018174ab5c3e0a6130e3dc34f0.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <42d01c533eecf4018174ab5c3e0a6130e3dc34f0.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_123830_274529_DE0B36FE 
X-CRM114-Status: GOOD (  26.42  )
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

Hi, Ryan,

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Switch SAM9X75 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> The USBCLK will be updated in subsequent patches that update the clock
> registration functions to use parent_hw and parent_data.
> 
> __clk_get_hw() will be removed in subsequent patches in this series.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sam9x7.c | 308 +++++++++++++++++++++-----------------
>  1 file changed, 173 insertions(+), 135 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 89868a0aeaba..cb5849da494f 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -33,10 +33,22 @@ enum pll_ids {
>  	PLL_ID_UPLL,
>  	PLL_ID_AUDIO,
>  	PLL_ID_LVDS,
> -	PLL_ID_PLLA_DIV2,
>  	PLL_ID_MAX,
>  };
>  
> +/*
> + * PLL component identifier
> + * @PLL_COMPID_FRAC: Fractional PLL component identifier
> + * @PLL_COMPID_DIV0: 1st PLL divider component identifier
> + * @PLL_COMPID_DIV1: 2nd PLL divider component identifier
> + */
> +enum pll_component_id {
> +	PLL_COMPID_FRAC,
> +	PLL_COMPID_DIV0,
> +	PLL_COMPID_DIV1,
> +	PLL_COMPID_MAX,
> +};
> +
>  /**
>   * enum pll_type - PLL type identifiers
>   * @PLL_TYPE_FRAC:	fractional PLL identifier
> @@ -185,6 +197,18 @@ static const struct clk_pll_layout pll_divio_layout = {
>  	.endiv_shift	= 30,
>  };
>  
> +/*
> + * SAM9X7 PLL possible parents
> + * @SAM9X7_PLL_PARENT_MAINCK: MAINCK is PLL a parent
> + * @SAM9X7_PLL_PARENT_MAIN_XTAL: MAIN XTAL is a PLL parent
> + * @SAM9X7_PLL_PARENT_FRACCK: Frac PLL is a PLL parent (for PLL dividers)
> + */
> +enum sam9x7_pll_parent {
> +	SAM9X7_PLL_PARENT_MAINCK,
> +	SAM9X7_PLL_PARENT_MAIN_XTAL,
> +	SAM9X7_PLL_PARENT_FRACCK
> +};
> +
>  /*
>   * PLL clocks description
>   * @n:		clock name
> @@ -192,22 +216,24 @@ static const struct clk_pll_layout pll_divio_layout = {
>   * @l:		clock layout
>   * @t:		clock type
>   * @c:		pll characteristics
> + * @hw:		pointer to clk_hw
>   * @f:		clock flags
>   * @eid:	export index in sam9x7->chws[] array
>   */
> -static const struct {
> +static struct {
>  	const char *n;
> -	const char *p;
>  	const struct clk_pll_layout *l;
>  	u8 t;
>  	const struct clk_pll_characteristics *c;
> +	struct clk_hw *hw;
>  	unsigned long f;
> +	enum sam9x7_pll_parent p;
>  	u8 eid;
> -} sam9x7_plls[][3] = {
> +} sam9x7_plls[][PLL_COMPID_MAX] = {
>  	[PLL_ID_PLLA] = {
> -		{
> +		[PLL_COMPID_FRAC] = {
>  			.n = "plla_fracck",
> -			.p = "mainck",
> +			.p = SAM9X7_PLL_PARENT_MAINCK,
>  			.l = &plla_frac_layout,
>  			.t = PLL_TYPE_FRAC,
>  			/*
> @@ -218,9 +244,9 @@ static const struct {
>  			.c = &plla_characteristics,
>  		},
>  
> -		{
> +		[PLL_COMPID_DIV0] = {
>  			.n = "plla_divpmcck",
> -			.p = "plla_fracck",
> +			.p = SAM9X7_PLL_PARENT_FRACCK,
>  			.l = &pll_divpmc_layout,
>  			.t = PLL_TYPE_DIV,
>  			/* This feeds CPU. It should not be disabled */
> @@ -228,21 +254,35 @@ static const struct {
>  			.eid = PMC_PLLACK,
>  			.c = &plla_characteristics,
>  		},
> +
> +		[PLL_COMPID_DIV1] = {
> +			.n = "plla_div2pmcck",
> +			.p = SAM9X7_PLL_PARENT_FRACCK,
> +			.l = &plladiv2_divpmc_layout,
> +			/*
> +			 * This may feed critical parts of the system like timers.
> +			 * It should not be disabled.
> +			 */
> +			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
> +			.c = &plladiv2_characteristics,
> +			.eid = PMC_PLLADIV2,
> +			.t = PLL_TYPE_DIV,
> +		},
>  	},
>  
>  	[PLL_ID_UPLL] = {
> -		{
> +		[PLL_COMPID_FRAC] = {
>  			.n = "upll_fracck",
> -			.p = "main_osc",
> +			.p = SAM9X7_PLL_PARENT_MAIN_XTAL,
>  			.l = &pll_frac_layout,
>  			.t = PLL_TYPE_FRAC,
>  			.f = CLK_SET_RATE_GATE,
>  			.c = &upll_characteristics,
>  		},
>  
> -		{
> +		[PLL_COMPID_DIV0] = {
>  			.n = "upll_divpmcck",
> -			.p = "upll_fracck",
> +			.p = SAM9X7_PLL_PARENT_FRACCK,
>  			.l = &pll_divpmc_layout,
>  			.t = PLL_TYPE_DIV,
>  			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
> @@ -253,18 +293,18 @@ static const struct {
>  	},
>  
>  	[PLL_ID_AUDIO] = {
> -		{
> +		[PLL_COMPID_FRAC] = {
>  			.n = "audiopll_fracck",
> -			.p = "main_osc",
> +			.p = SAM9X7_PLL_PARENT_MAIN_XTAL,
>  			.l = &pll_frac_layout,
>  			.f = CLK_SET_RATE_GATE,
>  			.c = &audiopll_characteristics,
>  			.t = PLL_TYPE_FRAC,
>  		},
>  
> -		{
> +		[PLL_COMPID_DIV0] = {
>  			.n = "audiopll_divpmcck",
> -			.p = "audiopll_fracck",
> +			.p = SAM9X7_PLL_PARENT_FRACCK,
>  			.l = &pll_divpmc_layout,
>  			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
>  			     CLK_SET_RATE_PARENT,
> @@ -273,9 +313,9 @@ static const struct {
>  			.t = PLL_TYPE_DIV,
>  		},
>  
> -		{
> +		[PLL_COMPID_DIV1] = {
>  			.n = "audiopll_diviock",
> -			.p = "audiopll_fracck",
> +			.p = SAM9X7_PLL_PARENT_FRACCK,
>  			.l = &pll_divio_layout,
>  			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
>  			     CLK_SET_RATE_PARENT,
> @@ -286,18 +326,18 @@ static const struct {
>  	},
>  
>  	[PLL_ID_LVDS] = {
> -		{
> +		[PLL_COMPID_FRAC] = {
>  			.n = "lvdspll_fracck",
> -			.p = "main_osc",
> +			.p = SAM9X7_PLL_PARENT_MAIN_XTAL,
>  			.l = &pll_frac_layout,
>  			.f = CLK_SET_RATE_GATE,
>  			.c = &lvdspll_characteristics,
>  			.t = PLL_TYPE_FRAC,
>  		},
>  
> -		{
> +		[PLL_COMPID_DIV0] = {
>  			.n = "lvdspll_divpmcck",
> -			.p = "lvdspll_fracck",
> +			.p = SAM9X7_PLL_PARENT_FRACCK,
>  			.l = &pll_divpmc_layout,
>  			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
>  			     CLK_SET_RATE_PARENT,
> @@ -306,22 +346,6 @@ static const struct {
>  			.t = PLL_TYPE_DIV,
>  		},
>  	},
> -
> -	[PLL_ID_PLLA_DIV2] = {
> -		{
> -			.n = "plla_div2pmcck",
> -			.p = "plla_fracck",
> -			.l = &plladiv2_divpmc_layout,
> -			/*
> -			 * This may feed critical parts of the system like timers.
> -			 * It should not be disabled.
> -			 */
> -			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
> -			.c = &plladiv2_characteristics,
> -			.eid = PMC_PLLADIV2,
> -			.t = PLL_TYPE_DIV,
> -		},
> -	},
>  };
>  
>  static const struct clk_programmable_layout sam9x7_programmable_layout = {
> @@ -339,9 +363,9 @@ static const struct clk_pcr_layout sam9x7_pcr_layout = {
>  	.pid_mask = GENMASK(6, 0),
>  };
>  
> -static const struct {
> +static struct {
>  	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>  	u8 id;
>  	unsigned long flags;
>  } sam9x7_systemck[] = {
> @@ -349,10 +373,10 @@ static const struct {
>  	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>  	 * to keep it enabled in case there is no Linux consumer for it.
>  	 */
> -	{ .n = "ddrck",		.p = "masterck_div",	.id = 2,	.flags = CLK_IS_CRITICAL },
> -	{ .n = "uhpck",		.p = "usbck",		.id = 6 },
> -	{ .n = "pck0",		.p = "prog0",		.id = 8 },
> -	{ .n = "pck1",		.p = "prog1",		.id = 9 },
> +	{ .n = "ddrck",		.id = 2,	.flags = CLK_IS_CRITICAL },
> +	{ .n = "uhpck",		.id = 6 },
> +	{ .n = "pck0",		.id = 8 },
> +	{ .n = "pck1",		.id = 9 },
>  };
>  
>  /*
> @@ -426,7 +450,8 @@ static const struct {
>  /*
>   * Generic clock description
>   * @n:			clock name
> - * @pp:			PLL parents
> + * @pp:			PLL parents (entry formed by PLL components identifiers
> + *			(see enum pll_component_id))
>   * @pp_mux_table:	PLL parents mux table
>   * @r:			clock output range
>   * @pp_chg_id:		id in parent array of changeable PLL parent
> @@ -435,7 +460,10 @@ static const struct {
>   */
>  static const struct {
>  	const char *n;
> -	const char *pp[8];
> +	struct {
> +			int pll_id;
> +			int pll_compid;

2 tabs here should be enough.

> +	} pp[8];
>  	const char pp_mux_table[8];
>  	struct clk_range r;
>  	int pp_chg_id;
> @@ -445,7 +473,7 @@ static const struct {
>  	{
>  		.n = "flex0_gclk",
>  		.id = 5,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -454,7 +482,7 @@ static const struct {
>  	{
>  		.n = "flex1_gclk",
>  		.id = 6,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -463,7 +491,7 @@ static const struct {
>  	{
>  		.n = "flex2_gclk",
>  		.id = 7,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -472,7 +500,7 @@ static const struct {
>  	{
>  		.n = "flex3_gclk",
>  		.id = 8,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -481,7 +509,7 @@ static const struct {
>  	{
>  		.n = "flex6_gclk",
>  		.id = 9,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -490,7 +518,7 @@ static const struct {
>  	{
>  		.n = "flex7_gclk",
>  		.id = 10,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -499,7 +527,7 @@ static const struct {
>  	{
>  		.n = "flex8_gclk",
>  		.id = 11,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -509,7 +537,7 @@ static const struct {
>  		.n = "sdmmc0_gclk",
>  		.id = 12,
>  		.r = { .max = 105000000 },
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 6, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -518,7 +546,7 @@ static const struct {
>  	{
>  		.n = "flex4_gclk",
>  		.id = 13,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -527,7 +555,7 @@ static const struct {
>  	{
>  		.n = "flex5_gclk",
>  		.id = 14,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -536,7 +564,7 @@ static const struct {
>  	{
>  		.n = "flex9_gclk",
>  		.id = 15,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -545,7 +573,7 @@ static const struct {
>  	{
>  		.n = "flex10_gclk",
>  		.id = 16,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -554,7 +582,7 @@ static const struct {
>  	{
>  		.n = "tcb0_gclk",
>  		.id = 17,
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 6, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -563,7 +591,7 @@ static const struct {
>  	{
>  		.n = "adc_gclk",
>  		.id = 19,
> -		.pp = { "upll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(UPLL, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 5, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -573,7 +601,7 @@ static const struct {
>  		.n = "lcd_gclk",
>  		.id = 25,
>  		.r = { .max = 75000000 },
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 6, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -583,7 +611,7 @@ static const struct {
>  		.n = "sdmmc1_gclk",
>  		.id = 26,
>  		.r = { .max = 105000000 },
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 6, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -593,7 +621,7 @@ static const struct {
>  		.n = "mcan0_gclk",
>  		.id = 29,
>  		.r = { .max = 80000000 },
> -		.pp = { "upll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(UPLL, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 5, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -603,7 +631,7 @@ static const struct {
>  		.n = "mcan1_gclk",
>  		.id = 30,
>  		.r = { .max = 80000000 },
> -		.pp = { "upll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(UPLL, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 5, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -612,7 +640,7 @@ static const struct {
>  	{
>  		.n = "flex11_gclk",
>  		.id = 32,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -621,7 +649,7 @@ static const struct {
>  	{
>  		.n = "flex12_gclk",
>  		.id = 33,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -631,7 +659,7 @@ static const struct {
>  		.n = "i2s_gclk",
>  		.id = 34,
>  		.r = { .max = 100000000 },
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 6, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -641,7 +669,7 @@ static const struct {
>  		.n = "qspi_gclk",
>  		.id = 35,
>  		.r = { .max = 200000000 },
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 6, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -650,7 +678,7 @@ static const struct {
>  	{
>  		.n = "pit64b0_gclk",
>  		.id = 37,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -660,7 +688,7 @@ static const struct {
>  		.n = "classd_gclk",
>  		.id = 42,
>  		.r = { .max = 100000000 },
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 6, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -669,7 +697,7 @@ static const struct {
>  	{
>  		.n = "tcb1_gclk",
>  		.id = 45,
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 6, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -678,7 +706,7 @@ static const struct {
>  	{
>  		.n = "dbgu_gclk",
>  		.id = 47,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -688,7 +716,7 @@ static const struct {
>  		.n = "mipiphy_gclk",
>  		.id = 55,
>  		.r = { .max = 27000000 },
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -697,7 +725,7 @@ static const struct {
>  	{
>  		.n = "pit64b1_gclk",
>  		.id = 58,
> -		.pp = { "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 8, },
>  		.pp_count = 1,
>  		.pp_chg_id = INT_MIN,
> @@ -706,7 +734,7 @@ static const struct {
>  	{
>  		.n = "gmac_gclk",
>  		.id = 67,
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> +		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
>  		.pp_mux_table = { 6, 8, },
>  		.pp_count = 2,
>  		.pp_chg_id = INT_MIN,
> @@ -716,33 +744,25 @@ static const struct {
>  static void __init sam9x7_pmc_setup(struct device_node *np)
>  {
>  	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *td_slck_name, *md_slck_name, *mainxtal_name;
> +	const char *main_xtal_name;
>  	struct pmc_data *sam9x7_pmc;
>  	const char *parent_names[9];
>  	void **clk_mux_buffer = NULL;
>  	int clk_mux_buffer_size = 0;
> -	struct clk_hw *main_osc_hw;
>  	struct regmap *regmap;
> -	struct clk_hw *hw;
> +	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> +	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> +	struct clk_hw *parent_hws[9];
>  	int i, j;
>  
> -	i = of_property_match_string(np, "clock-names", "td_slck");
> -	if (i < 0)
> -		return;
> -
> -	td_slck_name = of_clk_get_parent_name(np, i);
> -
> -	i = of_property_match_string(np, "clock-names", "md_slck");
> -	if (i < 0)
> -		return;
> -
> -	md_slck_name = of_clk_get_parent_name(np, i);
> -
> +	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> +	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
>  	i = of_property_match_string(np, "clock-names", "main_xtal");

Could you please move this above:

        main_xtal_name = of_clk_get_parent_name(np, i);

and have it like:

	i = of_property_match_string(np, "clock-names", "main_xtal");
	if (i < 0)
		return;
	mainxtal_name = of_clk_get_parent_name(np, i);


> -	if (i < 0)
> +
> +	if (!td_slck_hw || !md_slck_hw || !i)

I would keep the checking of i close to of_property_match_string(). Also,
you changed check only zero as invalid value. Is that right?
of_property_match_string() can return negative error numbers as well.

>  		return;
> -	mainxtal_name = of_clk_get_parent_name(np, i);
>  
> +	main_xtal_name = of_clk_get_parent_name(np, i);
>  	regmap = device_node_to_regmap(np);
>  	if (IS_ERR(regmap))
>  		return;
> @@ -760,26 +780,25 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  	if (!clk_mux_buffer)
>  		goto err_free;
>  
> -	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> -					   50000000);
> -	if (IS_ERR(hw))
> +	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> +						   50000000);
> +	if (IS_ERR(main_rc_hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
> -	if (IS_ERR(hw))
> +	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL, &AT91_CLK_PD_NAME(main_xtal_name), 0);

Could you please add a line break before &AT91_CLK_PD_NAME() ?



