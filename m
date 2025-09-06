Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB35CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 18:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buoc/vdaWZrT+rT15h0myZbMJ9Oax8n0JeLAsKw2hOE=; b=keKgGa8EUrtQ5DyU+1ENt8/YrJ
	48W71yG54AICklW3rrolf+18kqrMKpxpQ0ghGcktjAjGt8jFZalUlgy9UKsCzxBYJ2qM4lnupsvwZ
	OL//4B1dqD3D3pKyon0PWKO1u7Zpi9dZTPLBcDyfGxPLTSu9cuaOUPz+2QG2XMw44NfI/ox+8EAkV
	LrV0H7qyjqmiUNuM1NhFmdGoZJgFwvjN4FXu8UPktCqj2e2MALZU1VrUFcNmymXnHN0jQvwBGrkai
	2kEioxZgFENdoZaClp6nR8pJhLy5c/091hPtIKwQufIvGtOLGUIQMzmWwLC0Sae8SVA/6bDcjdwbD
	GQZqHmXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxri-00000008HCR-1psg;
	Sat, 06 Sep 2025 18:42:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxk0-00000008GEl-1yrJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:34:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45de2132c49so1185615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183663; x=1757788463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=buoc/vdaWZrT+rT15h0myZbMJ9Oax8n0JeLAsKw2hOE=;
        b=C950o0KJn1uewnhFHNGS29F+dquncjpJ6UytscMMYgM731rAPG+kO0SA2+g58beS1N
         qNMQ1egJQldZ+YR0iAIjyEWcjxqnQbqswjXeHG/Z6mnqteafpQQZE3upWm8qi8lO+lWs
         xdZGCNAVP5Ux3B7rxje/a5QsLpMy5YPBEr5DilADJaYXVs9ybvk3TT83XyLGQ2N3Xi/Q
         4eRgGxXI9XPtEkzV1MaDeZpP5/+s8WkEzSiKnuHkoxnihUu70yzLhI3iBL6bDOMw/EAD
         f4tRfb904sGVoVAWSJGbogW0v7yv4untkfte3ESTjdPrmEJ6mvq1t4kQYVzxtKQ298dk
         ds5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183663; x=1757788463;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=buoc/vdaWZrT+rT15h0myZbMJ9Oax8n0JeLAsKw2hOE=;
        b=hDVvIMfoMte/xoyvE202woSDoH4Ue4LQvZI3gykQuiB8RjZKIDIr8BGf9qyuEribpg
         McdLu6K853zDSADqJ2CcOh3vAiLBWr0UzG8eprChBfdpEGZviJwIvo5n5+XillfIe0tv
         JwxnwOiFGAWx5o6dZeMk5GzhfKQG7H5nKeQH698BIqi1YCTgxMaVtZ41AQc0euBLt3Ov
         XEBYMgYzHhCeZ/Kw/x0fQzbideSHO443R4/3hmUMsFTpnRD+ePepzgpvyunbRwiJBUak
         m4db1f/EfoDh+IBQ5mfpyJ7zmAFZ+O7NX+rAZlK310JSasiKvG7urEdPtzhoELCpwD7Q
         +E9g==
X-Forwarded-Encrypted: i=1; AJvYcCWA6B+TRkTt/9g3tOqt8gNYV08JfSYcqVnBvw9gyynk6gZa1IDoeHL26ZgRjPUF1sFP3nM2s9ZCEBpBr/xtckJU@lists.infradead.org
X-Gm-Message-State: AOJu0YxslbAND5Y+lWa47STBfa9o4nvDZSJ1U0V+hU/yzmzR8VuansO1
	+ec6yBVIB5eG0SQKL/2iGAZpiJOhR+3MkkeihJVUIRQXYi79NuXQpGnW3kRsDTDyxgY=
X-Gm-Gg: ASbGncswofRlJPaziOD/TRJEaTb42HZSGX/so8KvI77yWEGB9uCICeh+cg3PwrvToUA
	Of6WL78vLiJ5wfiq1VeHotguufSpRVB9uE3MkqwYUTnhwBGTBsCC7vF+Cgw25NrcKBXhVTP77TG
	p1lF5f63JorqFnjODXJgu8HPT7DGxwNT4p+GZqKq8oMDySHvhZ4RHu1KJK9eOKKPNLnRJFbo5rJ
	XQ84bc4yE2ojqbM0LiqBR1v0J4dmq3x061bGIijD9G8Nh04gpiJDi2TtwOPDXP5D9NjT3MTM7HV
	6DImbs2SqU3AxhUAQWsEz6Foe9LobWvU5tkW+Ivq+Q5jMyZDOW+e6OT5lNHOIOO77phzVDQcHVS
	GaXo/3Jan9PAqL6xVx4hbGoxH6OPo8JqTH5Ve7t9pq8uxZIf0bL5g
X-Google-Smtp-Source: AGHT+IH/u05DieqBh2vOhG6vUGVc6Da7cbpzGc0XIEqyjVwk+v7uSz+2ZOna7S0oGMd9KF1SW1sSYQ==
X-Received: by 2002:a05:600c:4694:b0:45c:b601:660a with SMTP id 5b1f17b1804b1-45dddec84cfmr20521055e9.23.1757183662869;
        Sat, 06 Sep 2025 11:34:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddbc70fffsm26613185e9.3.2025.09.06.11.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:34:22 -0700 (PDT)
Message-ID: <0f776b28-a623-4984-8cae-2faa716ddb0d@tuxon.dev>
Date: Sat, 6 Sep 2025 21:34:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 04/32] clk: at91: clk-sam9x60-pll: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <2e7902b73fa6bb5bc8698b3ca0fa7cef583b76f5.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <2e7902b73fa6bb5bc8698b3ca0fa7cef583b76f5.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113424_524258_303B4C94 
X-CRM114-Status: GOOD (  26.30  )
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

On 7/10/25 23:06, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures. As clk-sam9x60-pll need to know
> parent's rate at initialization we pass it now from SoC specific drivers.
> This will lead in the end at removing __clk_get_hw() in SoC specific
> drivers (that will be solved by subsequent commits).
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X75 SoCs to the change set.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
>   drivers/clk/at91/pmc.h             |  5 +++--
>   drivers/clk/at91/sam9x60.c         |  8 +++++---
>   drivers/clk/at91/sam9x7.c          | 17 ++++++++++++-----
>   drivers/clk/at91/sama7d65.c        | 16 +++++++++++-----
>   drivers/clk/at91/sama7g5.c         | 17 ++++++++++++-----
>   6 files changed, 48 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
> index cefd9948e103..03a7d00dcc6d 100644
> --- a/drivers/clk/at91/clk-sam9x60-pll.c
> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
> @@ -630,19 +630,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
>   
>   struct clk_hw * __init
>   sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name, const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>   			      const struct clk_pll_characteristics *characteristics,
>   			      const struct clk_pll_layout *layout, u32 flags)
>   {
>   	struct sam9x60_frac *frac;
>   	struct clk_hw *hw;
>   	struct clk_init_data init = {};
> -	unsigned long parent_rate, irqflags;
> +	unsigned long irqflags;
>   	unsigned int val;
>   	int ret;
>   
> -	if (id > PLL_MAX_ID || !lock || !parent_hw)
> +	if (id > PLL_MAX_ID || !lock || !parent_data)
>   		return ERR_PTR(-EINVAL);
>   
>   	frac = kzalloc(sizeof(*frac), GFP_KERNEL);
> @@ -650,10 +650,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>   		return ERR_PTR(-ENOMEM);
>   
>   	init.name = name;
> -	if (parent_name)
> -		init.parent_names = &parent_name;
> -	else
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	init.parent_data = (const struct clk_parent_data *)parent_data;
>   	init.num_parents = 1;
>   	if (flags & CLK_SET_RATE_GATE)
>   		init.ops = &sam9x60_frac_pll_ops;
> @@ -684,7 +681,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>   		 * its rate leading to enabling this PLL with unsupported
>   		 * rate. This will lead to PLL not being locked at all.
>   		 */
> -		parent_rate = clk_hw_get_rate(parent_hw);
>   		if (!parent_rate) {
>   			hw = ERR_PTR(-EINVAL);
>   			goto free;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 63d4c425bed5..b43f6652417f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -255,8 +255,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
>   
>   struct clk_hw * __init
>   sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name,
> +			      const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>   			      const struct clk_pll_characteristics *characteristics,
>   			      const struct clk_pll_layout *layout, u32 flags);
>   
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index db6db9e2073e..fd53e54abf88 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -240,7 +240,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>   	sam9x60_pmc->chws[PMC_MAIN] = hw;
>   
>   	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
> -					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
> +					   &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]),
> +					   clk_hw_get_rate(sam9x60_pmc->chws[PMC_MAIN]),
>   					   0, &plla_characteristics,
>   					   &pll_frac_layout,
>   					   /*
> @@ -266,8 +267,9 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>   	sam9x60_pmc->chws[PMC_PLLACK] = hw;
>   
>   	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
> -					   "main_osc", main_osc_hw, 1,
> -					   &upll_characteristics,
> +					   &AT91_CLK_PD_HW(main_osc_hw),
> +					   clk_hw_get_rate(main_osc_hw),
> +					   1, &upll_characteristics,
>   					   &pll_frac_layout, CLK_SET_RATE_GATE);
>   	if (IS_ERR(hw))
>   		goto err_free;
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 31184e11165a..edd5fd3a1fa5 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -739,6 +739,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
>   	struct clk_range range = CLK_RANGE(0, 0);
>   	const char *main_xtal_name = "main_xtal";
> +	u8 main_xtal_index = 2;
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
>   	void **clk_mux_buffer = NULL;
> @@ -795,7 +796,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
>   		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate = 0;

The initialization could be dropped. Same for the other similar places in
this patch.

>   
>   			if (!sam9x7_plls[i][j].n)
>   				continue;
> @@ -804,21 +805,27 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sam9x7_plls[i][j].p) {
>   				case SAM9X7_PLL_PARENT_MAINCK:
> -					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					hw = sam9x7_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAM9X7_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> +								       main_xtal_index);

Here AT91_CLK_PD_NAME(main_xtal_name) should be used (with a single
argument) but the main_xtal_name should be retrieved with
of_clk_get_parent_name().


Same for the other similar places in this patch.

> +					hw = main_xtal_hw;
>   					break;
>   				default:
>   					/* Should not happen. */
> -					parent_hw = NULL;
>   					break;
>   				}
>   
> +				parent_rate = clk_hw_get_rate(hw);
> +				if (!parent_rate)
> +					return;
> +
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   								   &pmc_pll_lock,
>   								   sam9x7_plls[i][j].n,
> -								   NULL, parent_hw, i,
> +								   &parent_data, parent_rate, i,
>   								   sam9x7_plls[i][j].c,
>   								   sam9x7_plls[i][j].l,
>   								   sam9x7_plls[i][j].f);
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index b74813a288a8..17725c175d3b 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1090,6 +1090,7 @@ static const struct clk_pcr_layout sama7d65_pcr_layout = {
>   static void __init sama7d65_pmc_setup(struct device_node *np)
>   {
>   	const char *main_xtal_name = "main_xtal";
> +	u8 main_xtal_index = 2;
>   	struct pmc_data *sama7d65_pmc;
>   	const char *parent_names[11];
>   	void **alloc_mem = NULL;
> @@ -1150,7 +1151,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
>   		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate = 0;>
>   			if (!sama7d65_plls[i][j].n)
>   				continue;
> @@ -1159,20 +1160,25 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7d65_plls[i][j].p) {
>   				case SAMA7D65_PLL_PARENT_MAINCK:
> -					parent_hw = sama7d65_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					hw = sama7d65_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> +								       main_xtal_index);
> +					hw = main_xtal_hw;
>   					break;
>   				default:
>   					/* Should not happen. */
> -					parent_hw = NULL;
>   					break;
>   				}
> +				parent_rate = clk_hw_get_rate(hw);
> +				if (!parent_rate)
> +					return;
>   
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   					&pmc_pll_lock, sama7d65_plls[i][j].n,
> -					NULL, parent_hw, i,
> +					&parent_data, parent_rate, i,
>   					sama7d65_plls[i][j].c,
>   					sama7d65_plls[i][j].l,
>   					sama7d65_plls[i][j].f);
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index bf6092fea217..733e4fc6a515 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -970,6 +970,7 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
>   static void __init sama7g5_pmc_setup(struct device_node *np)
>   {
>   	const char *main_xtal_name = "main_xtal";
> +	u8 main_xtal_index = 2;
>   	struct pmc_data *sama7g5_pmc;
>   	void **alloc_mem = NULL;
>   	int alloc_mem_size = 0;
> @@ -1029,7 +1030,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
>   		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate = 0;>
>   			if (!sama7g5_plls[i][j].n)
>   				continue;
> @@ -1038,20 +1039,26 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7g5_plls[i][j].p) {
>   				case SAMA7G5_PLL_PARENT_MAINCK:
> -					parent_hw = sama7g5_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					hw = sama7g5_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> +								       main_xtal_index);
> +					hw = main_xtal_hw;
>   					break;
>   				default:
>   					/* Should not happen. */
> -					parent_hw = NULL;
>   					break;
>   				}
>   
> +				parent_rate = clk_hw_get_rate(hw);
> +				if (!parent_rate)
> +					return;
> +
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   					&pmc_pll_lock, sama7g5_plls[i][j].n,
> -					NULL, parent_hw, i,
> +					&parent_data, parent_rate, i,
>   					sama7g5_plls[i][j].c,
>   					sama7g5_plls[i][j].l,
>   					sama7g5_plls[i][j].f);


