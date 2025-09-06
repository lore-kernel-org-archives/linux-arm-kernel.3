Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1939CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7c9v7WS7SgWPvY1/iQev0Y/b4zhJciSfPhNQ1aVFAg=; b=aMdYj8IDe3/m+VChW218s8jBry
	fVczCUpdfVxn4H60yyzr+pAunN7BhKpxEzlH7lXRK+FKDmPsORgQQ/KvqBRczvvHfa3/Pt3cIMcHG
	ew4Elg7RxnioFbo8iBL9/2IvYsB9zgYicyA3V1EzVbdjggqbYlgNlb18ZdYeDLJSHzs8cZvB9M9G7
	gHIhV9Yo3R3TJBqO8YaA0TIbKG6B+RTonueatTe/AGu7uFq8nLlXJMm7jqW7XgOUAfVQ+YOL0WjXY
	5kVGkjo0B3A4M5JnMZ78YaXKHbqlnChBIy0hSENSoI2uFnS/MHBIyHlgRXAVlH6PzJcLsL/wKJyy5
	CCPHGyag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuy5o-00000008Jud-18ay;
	Sat, 06 Sep 2025 18:56:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxmG-00000008GYm-0cTT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:36:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso16099225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183803; x=1757788603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+7c9v7WS7SgWPvY1/iQev0Y/b4zhJciSfPhNQ1aVFAg=;
        b=qaAjIkEnMGPkau5gP5h+Kzbv77axk3EUammalblcqBRg7pyQsmUqPkr5Ac7bR+RYz+
         sWqM0nLfumMJBmFHR1ZqqA1hcekvrvtuAmmy6TvDLdL8xrTvXgyPTRkw65+9hhSW+rGQ
         5ij7FaYKUV9osgMff45QXcER+kQLjHYF7qQgATVrTU7CUptuz11d3/ryu6Ctt3iF18GE
         xbvj1aXG2AciamC5mfg/DnC6PEovc5cnExW2PORQbYIZrEqjXQgpZ4LxyFeoUaLx/AW9
         2mHU1Wt5AFMlbnTMsP0CcIwdfumGrM/wXnlj0iZDnsWyx11oQLLi2ussItsrMkRnWnQJ
         MEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183803; x=1757788603;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7c9v7WS7SgWPvY1/iQev0Y/b4zhJciSfPhNQ1aVFAg=;
        b=HGeSlXP9jgUqwEH2sBVUZ3vMuci3RPteEQyToMUPAIQGOMynOhh1iMBECeovvm7MnD
         kgiFvKoVX0uZwzMJZWsiT/+tkM+QXbZ4UcndiMugxTnzjolH7hOK+oSTbSJarBVdtC/H
         Bd1rcKE46b8vql+kq93O6IvS8pEk+vc4NSVXOQCluvHPnkFKw1rzDogrLAlyYgESpEX4
         KkhxyMrO97YTQ9lBOdrbOL/g+d9HkQC8AOltH/dOfrg0235MT4P6zzXGTPS7aH9H0cj4
         T+gvhmw0NWYj42J6RmDTI+yMGiSZm5OzBd1mQF5/stsHDXxTm8RqU38OlHeT4m5Nxsgt
         UdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy7w/fndfbT0fC8dfvDtVI+MQvKSdyaXl6Ism1udZsf3IyYINSARZdAdQUW4ZXU/127L6+R5mLdwkuL/55PY/l@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb0oaXa5UUT/YCri7993QbX1bMBDnp34o3aOVx1nOWH/seDHhy
	rtQjM9b2Yy3yHeMsirXnIi39EFdap8qUpnoanS5iEi7E2+qVH59OoTDm0OrPny3yias=
X-Gm-Gg: ASbGncuPl/gU5r+RKOp/LUYD57+QRDmPnhWB46ARHp1mvXiD4HdhaGIMLDzjmdvmmvj
	5StXBv/A33fQcobzM1znIjHvWZ9ke4ilC7Fj4moGAIDfZjhoTzd/5mvKExPMxN7OR861/DyP1r4
	hXHqy6Eofj45BssBRZKXqQKWoxHkTh3g328wm9Y6q7DD+6IQYbSL7AF4SIjbM6piSPP034Yg5Dt
	BuKPtyxlaF6h93HbFJLFMpS4yMfm+WC+XrkBcPIOLZvLbBQCQv25FSmg24WDOEsDXrrAh37oYWd
	BTY1YhCWrsZzuiR8hEV7jvFvazu6om5dm68AFSyVfX6tjjjQtF7Krda3ekBEz2zAbetvKol2d4Q
	p7H9ptTgGhTI94htiKUPyRedsl//4adE=
X-Google-Smtp-Source: AGHT+IEn2KyTrQwMN8+aAJseCCgB1jUIJoNjfsgRExWZNCB1C5IQQmu9eW0YceImHVyoB6Oun7Fw7g==
X-Received: by 2002:a05:600c:3b1d:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-45ddde92816mr25903165e9.10.1757183802614;
        Sat, 06 Sep 2025 11:36:42 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b940bbc0dsm222805945e9.2.2025.09.06.11.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:36:42 -0700 (PDT)
Message-ID: <282ca7c4-7213-4e5d-9936-63687b5f4928@tuxon.dev>
Date: Sat, 6 Sep 2025 21:36:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 09/32] clk: at91: clk-programmable: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <aa1bae53bf124b8e46ff413b12528071262febb3.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <aa1bae53bf124b8e46ff413b12528071262febb3.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113644_198015_17BB5DC4 
X-CRM114-Status: GOOD (  20.36  )
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



On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add the clk-programmable changes to the
> SAMA7D65 and SAM9X75 SoCs. Add td_slck_name variable and index for the
> SAM9X75.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-programmable.c |  8 ++++----
>   drivers/clk/at91/pmc.h              |  2 +-
>   drivers/clk/at91/sam9x7.c           | 21 +++++++++++----------
>   drivers/clk/at91/sama7d65.c         | 20 ++++++++++----------
>   drivers/clk/at91/sama7g5.c          | 20 ++++++++++----------
>   5 files changed, 36 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
> index 1195fb405503..275ca701f294 100644
> --- a/drivers/clk/at91/clk-programmable.c
> +++ b/drivers/clk/at91/clk-programmable.c
> @@ -215,7 +215,7 @@ static const struct clk_ops programmable_ops = {
>   struct clk_hw * __init
>   at91_clk_register_programmable(struct regmap *regmap,
>   			       const char *name, const char **parent_names,
> -			       struct clk_hw **parent_hws, u8 num_parents, u8 id,
> +			       struct clk_parent_data *parent_data, u8 num_parents, u8 id,
>   			       const struct clk_programmable_layout *layout,
>   			       u32 *mux_table)
>   {
> @@ -224,7 +224,7 @@ at91_clk_register_programmable(struct regmap *regmap,
>   	struct clk_init_data init = {};
>   	int ret;
>   
> -	if (id > PROG_ID_MAX || !(parent_names || parent_hws))
> +	if (id > PROG_ID_MAX || !(parent_names || parent_data))
>   		return ERR_PTR(-EINVAL);
>   
>   	prog = kzalloc(sizeof(*prog), GFP_KERNEL);
> @@ -233,8 +233,8 @@ at91_clk_register_programmable(struct regmap *regmap,
>   
>   	init.name = name;
>   	init.ops = &programmable_ops;
> -	if (parent_hws)
> -		init.parent_hws = (const struct clk_hw **)parent_hws;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 54d472276fc9..34036f2d0578 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -263,7 +263,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>   
>   struct clk_hw * __init
>   at91_clk_register_programmable(struct regmap *regmap, const char *name,
> -			       const char **parent_names, struct clk_hw **parent_hws,
> +			       const char **parent_names, struct clk_parent_data *parent_data,
>   			       u8 num_parents, u8 id,
>   			       const struct clk_programmable_layout *layout,
>   			       u32 *mux_table);
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 945983f72140..86d624cd92b2 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -737,10 +737,11 @@ static const struct {
>   
>   static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
> +	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
>   	struct clk_range range = CLK_RANGE(0, 0);
>   	const char *main_xtal_name = "main_xtal";
> +	const char * const td_slck_name = "td_slck";
>   	const char *const md_slck_name = "md_slck";
> -	u8 md_slck_index = 1, main_xtal_index = 2;
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
>   	void **clk_mux_buffer = NULL;
> @@ -752,7 +753,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> +	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, td_slck_name));

Please use a pattern like:

i = of_property_match_string(np, "clock-names", "td_slck");
if (i < 0)
    return;

td_slck_name = of_clk_get_parent_name(np, i);

Same sama7d65, sama7g5.


>   	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, md_slck_name));
>   	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>   
> @@ -880,20 +881,20 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	if (IS_ERR(usbck_hw))
>   		goto err_free;
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
> -	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
> -	parent_hws[4] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
> -	parent_hws[5] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
> -	parent_hws[6] = sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);

AT91_CLK_PD_NAME(md_slck_name);

> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);

AT91_CLK_PD_NAME(td_slck_name);

Same sama7d65, sama7g5.

