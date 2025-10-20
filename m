Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7F3CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onBLaR3b5p0TKSaA4XAOR/ezLcGXv9VkB9uwhzqsH8k=; b=f0d5/psfBcP/3sOuBJQLV3AbUC
	uB5/l5axy6YbNFILBH4v7L+zEhcs2+M/XepsrX67hA6A4/WMrIP8CI0RVlu+68raj8POFgPaHEwSI
	wYGDDV8KEuTQoWjj+kSKiU/mi6rJsh3RidQQrp789JQcjtQDiekAT8VWdvrO/rjCyyzkuQRzuiFWv
	LQ5jSEFFye6aonn73RaInkgfkdMwV9K9rYSBFdtI5/v904XOjwhc8tfW26k3A2eQNgD8NbpfVNWxB
	/QDqcvhkNR3lrPbzeUWHOkXMOMjjeroEn+XGINhwbyOZtR9b5IDqMvxHQL/pOCht4Ate/uZqI0lJ/
	hcry5p4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvl2-0000000EoIx-3nwQ;
	Mon, 20 Oct 2025 19:41:28 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvl1-0000000EoIQ-0Krw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:41:28 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b456d2dc440so777804466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989285; x=1761594085; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=onBLaR3b5p0TKSaA4XAOR/ezLcGXv9VkB9uwhzqsH8k=;
        b=gmGU1T459ttXaThmonnRMZAR5GFFpSome3c0Mq0U2LrFWLmFmYLzHb2xccvMOatQyx
         xNEHw5RoB/IqKxu3TX5EgbpYX/Zy+40IPGkyIz8QISQLuPPXu5SKgqdKL6YL79Zbxx5l
         ViKKmJRT/e6ExVF9XwxIjUtmUdgG/5lb14W01CyCHe90RW36irGEwcCXy1QkI3FX99nL
         XG93UzueszeYtEejQ3AIdfKaGhbRh4W+oXG2y28XeIIGjcr0U1p9+JQgF3dvd8goW2oy
         Vmm2WS5eJ5rNT7ijMkumynknIFzbWIRcXt/wAC7BqKxPv5r6UMUZpCKDxAROlS9Vk0Zm
         7mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989285; x=1761594085;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onBLaR3b5p0TKSaA4XAOR/ezLcGXv9VkB9uwhzqsH8k=;
        b=W3xq21ETxndyCo2sP6Uu7o2YjADG4wm4z53ALTGH5vH/vZwA6Yrcfy4uX8Jbn/KQOr
         iZ6ID26vQVIW0bwokxj3ChST3Ggp1TbGMPIglRmgMhGCEQrijqxoo6/N5WWEVH4bzpSs
         uzaTB30O9+CBtugc3E8RQfgh1b0vVXCWSqF5KDzhMXpXJXrXAPsv1TUiNry0ht4nQzh7
         Afcm1P3m/295TV/zDIcHXTPOsw2/ndi7xkGa9Dp6z9DNNplxBUP37Y4NEQ1fps6XGRoa
         3tMNCnsXjlocdVZC6cHl2DBDpDGuCyANETWCt9UxqVjO9X2Mz4VI1N3WflNsbqvwBJNG
         zY4w==
X-Forwarded-Encrypted: i=1; AJvYcCXOVZ6ui1AhdqZlHG9MfTkTBAglemw+EoFJn+f3iTX6K9PzBRbPhcHhoKOUmIMfYFjnuEObyoZjyFzWfvss3Wv+@lists.infradead.org
X-Gm-Message-State: AOJu0YysCPBURiK/PwlcjjuVrRtnAsWNfcdMovHs0c2pX1pGNmlgcPH5
	/h3kJqw0r4m3qDk7R36M3BU5VH1bTRecfnbihbXu63lfbf7NIiEDESiPAIAJ7nzJ49E=
X-Gm-Gg: ASbGncvf8L32K3drNmouBZDcW2UkXurlOofebA0tF7sx92eUDdBj43DVppcUMwwnbHQ
	nLlilgVRMR4d3r72lVLphGO0cOStS4E5ANxX/3aUbd4Lx99rrPmXzbRQPfbP6SwOip+dYCUve9l
	LHTjLjQRVT4hxG0NTW10TEpS3OGUOE1rrhHoQuhiPTO+NMRQkwt9XkH3mpE769SEM4WLEsBKP5b
	Cdc0Zo/10wVYnklgpLMaQtgJ/HmmVYfJhjpExMPTR2QmXCg3VC3PwE675wug4tbDh18i074XfNo
	YWXUPBE1g0sxxFPVHU3zs4uOZinheUw354kpY/Jbw8aIpenOC8QejxGKAJDs/+vl06uoKgSlU6v
	dqPf3HtAHYiLAOHavSjt51y9YTfIWXwDx+ln/LHNNqhALOdz2wIFoU6qBJKCsiLU7lv4CGrfySs
	HfzgOQ3hjCUtt3fmSYFp4=
X-Google-Smtp-Source: AGHT+IHhbdQhGKSUACguShRdbXAdYLQ8jkoHnOdr5MaV8eZ6H913I1UyhQF3tXQ/94Cx59O+/3xyDQ==
X-Received: by 2002:a17:907:3f04:b0:b3f:a960:e057 with SMTP id a640c23a62f3a-b64749411b1mr1769618466b.31.1760989285272;
        Mon, 20 Oct 2025 12:41:25 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb526175sm878800966b.56.2025.10.20.12.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:41:24 -0700 (PDT)
Message-ID: <253d329d-12f9-478b-833e-096fafa4b109@tuxon.dev>
Date: Mon, 20 Oct 2025 22:41:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 04/31] clk: at91: clk-sam9x60-pll: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <259824455f5325b35d0fb85163866a81ff24304e.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <259824455f5325b35d0fb85163866a81ff24304e.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_124127_252068_07B88C45 
X-CRM114-Status: GOOD (  27.98  )
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
> Get the main_xtal name via of_clk_get_parent_name() to consistently get
> the correct name for the main_xtal.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X75 SoCs to the change set.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
>  drivers/clk/at91/pmc.h             |  5 +++--
>  drivers/clk/at91/sam9x60.c         |  8 +++++---
>  drivers/clk/at91/sam9x7.c          | 16 +++++++++++-----
>  drivers/clk/at91/sama7d65.c        | 25 ++++++++++++++-----------
>  drivers/clk/at91/sama7g5.c         | 26 +++++++++++++++-----------
>  6 files changed, 53 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
> index 3dc75a394ce1..9895881c67d7 100644
> --- a/drivers/clk/at91/clk-sam9x60-pll.c
> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
> @@ -630,19 +630,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
>  
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name, const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>  			      const struct clk_pll_characteristics *characteristics,
>  			      const struct clk_pll_layout *layout, u32 flags)
>  {
>  	struct sam9x60_frac *frac;
>  	struct clk_hw *hw;
>  	struct clk_init_data init = {};
> -	unsigned long parent_rate, irqflags;
> +	unsigned long irqflags;
>  	unsigned int val;
>  	int ret;
>  
> -	if (id > PLL_MAX_ID || !lock || !parent_hw)
> +	if (id > PLL_MAX_ID || !lock || !parent_data)
>  		return ERR_PTR(-EINVAL);
>  
>  	frac = kzalloc(sizeof(*frac), GFP_KERNEL);
> @@ -650,10 +650,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  		return ERR_PTR(-ENOMEM);
>  
>  	init.name = name;
> -	if (parent_name)
> -		init.parent_names = &parent_name;
> -	else
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	init.parent_data = (const struct clk_parent_data *)parent_data;
>  	init.num_parents = 1;
>  	if (flags & CLK_SET_RATE_GATE)
>  		init.ops = &sam9x60_frac_pll_ops;
> @@ -684,7 +681,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  		 * its rate leading to enabling this PLL with unsupported
>  		 * rate. This will lead to PLL not being locked at all.
>  		 */
> -		parent_rate = clk_hw_get_rate(parent_hw);
>  		if (!parent_rate) {
>  			hw = ERR_PTR(-EINVAL);
>  			goto free;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 16c2559889aa..d3fc38cf90eb 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -258,8 +258,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
>  
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name,
> +			      const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>  			      const struct clk_pll_characteristics *characteristics,
>  			      const struct clk_pll_layout *layout, u32 flags);
>  
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index 18baf4a256f4..bee35c65aceb 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -242,7 +242,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>  	sam9x60_pmc->chws[PMC_MAIN] = hw;
>  
>  	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
> -					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
> +					   &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]),
> +					   clk_hw_get_rate(sam9x60_pmc->chws[PMC_MAIN]),
>  					   0, &plla_characteristics,
>  					   &pll_frac_layout,
>  					   /*
> @@ -268,8 +269,9 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>  	sam9x60_pmc->chws[PMC_PLLACK] = hw;
>  
>  	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
> -					   "main_osc", main_osc_hw, 1,
> -					   &upll_characteristics,
> +					   &AT91_CLK_PD_HW(main_osc_hw),
> +					   clk_hw_get_rate(main_osc_hw),
> +					   1, &upll_characteristics,
>  					   &pll_frac_layout, CLK_SET_RATE_GATE);
>  	if (IS_ERR(hw))
>  		goto err_free;
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index cb5849da494f..c80306715d90 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -752,6 +752,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>  	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> +	static struct clk_parent_data parent_data;
>  	struct clk_hw *parent_hws[9];
>  	int i, j;
>  
> @@ -799,7 +800,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  
>  	for (i = 0; i < PLL_ID_MAX; i++) {
>  		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate;
>  
>  			if (!sam9x7_plls[i][j].n)
>  				continue;
> @@ -808,21 +809,26 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  			case PLL_TYPE_FRAC:
>  				switch (sam9x7_plls[i][j].p) {
>  				case SAM9X7_PLL_PARENT_MAINCK:
> -					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck");
> +					hw = sam9x7_pmc->chws[PMC_MAIN];
>  					break;
>  				case SAM9X7_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
> +					hw = main_xtal_hw;
>  					break;
>  				default:
>  					/* Should not happen. */
> -					parent_hw = NULL;
>  					break;
>  				}
>  
> +				parent_rate = clk_hw_get_rate(hw);
> +				if (!parent_rate)
> +					return;
> +
>  				hw = sam9x60_clk_register_frac_pll(regmap,
>  								   &pmc_pll_lock,
>  								   sam9x7_plls[i][j].n,
> -								   NULL, parent_hw, i,
> +								   &parent_data, parent_rate, i,
>  								   sam9x7_plls[i][j].c,
>  								   sam9x7_plls[i][j].l,
>  								   sam9x7_plls[i][j].f);
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index ec2ef1a0249a..6229b7dfbea1 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1093,7 +1093,7 @@ static const struct clk_pcr_layout sama7d65_pcr_layout = {
>  
>  static void __init sama7d65_pmc_setup(struct device_node *np)
>  {
> -	const char *main_xtal_name = "main_xtal";
> +	const char *main_xtal_name;
>  	struct pmc_data *sama7d65_pmc;
>  	const char *parent_names[11];
>  	void **alloc_mem = NULL;
> @@ -1108,10 +1108,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  
>  	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
>  	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> -	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
> +	i = of_property_match_string(np, "clock-names", "main_xtal");

Same as in the previous patch, please keep it close to
of_clk_get_parent_name() for main_xtal above and check check also negative
error numbers return by of_property_match_string(). Valid for the other
similar occurrences in this or next patches.


