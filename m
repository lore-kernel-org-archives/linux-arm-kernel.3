Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AACACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 18:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dowxdedaabw9pmvRWcOU8YmdjNMCxfM0EeEvHC1enGo=; b=rgb9V0wUs3sxUBa8Rv0lFIOLcC
	r1E8LyTtQpnsWrWHazG/xNBKEKm1xVhxNVzaSKS/JC/LMxokbP6hv+Q0OFOvHSAqUgB1CIXRwE13w
	X1/xj1moQ6bS/q2fC4zYH2ggiOkWO7hgPjEPgsgF7D646FSTe6fi6uOp+5Kor5XdFndH71hCmuraV
	mWX8qxqfMPu6h6U31TxUDIdjIxhDbXh3Hd5EISpPGqmpzWW/Y5Tp2HK4CZlPbMR/JmFHGxaWrnWt5
	XhyVvAvEhsDapg+29/mwDt3jiEtieBR5tRQuhb+wgBQQA6bC+g/Rn6wZwG/hnLoqfXALhe8Mjl6qY
	J40nMcKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxxI-00000008Hvb-0PyQ;
	Sat, 06 Sep 2025 18:48:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxlC-00000008GNk-0oWR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:35:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so15903405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183737; x=1757788537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dowxdedaabw9pmvRWcOU8YmdjNMCxfM0EeEvHC1enGo=;
        b=jP8fP8FUKsfO/V9IJzXXDf7pBgIDmg1udobK8Iek3De58OKt4JQ8a+qCHlN8o0iWWu
         cKvmyKYZW9ByGJ/fLiUqEUlN2HjchJk1aMT/ozf8lBuertLMXB9iisxjS2YZkx2aDZgG
         DkrWc8NtZoNEKAXi9gipHpdbTUBab8yh5yJIOm9sp/NT1aKFQHiMZayYh9godevIeL+Q
         C63BagG944WXs7yx+4H9n3GJ4TefDH1s1i4sgKw0Mr0r/LJYF6yRcdrkcF7S/+v57vMQ
         JwUGIaMfXxCtRHNsEcICAQATrtmPKAGZlolfnMOiNugstTYEXTc5WsAoOnn5RzzhQP8L
         7yjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183737; x=1757788537;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dowxdedaabw9pmvRWcOU8YmdjNMCxfM0EeEvHC1enGo=;
        b=Nho8+yhCysAWu12GhV0CpnGgKOIiixUE61QBdt6n70RX8rQQ796q5n1ZCq+ot54VPr
         USG9YSk+3UBOsAHHVTXXa5r0ikuxiGbugTur3p3VJEjJs/RFTqLlZe9yWTrQ+idV6m6B
         cPtQmjcwPXHhmdnSomiSPsp2qk1ZvvL8hyYp07gK7AyI7ThJD5F7pC5dK4tAGB+Eo+Bh
         wWOppEcMmlLP0iThOyEjQ39ffi8NI8uAGv94+BrA1aGRQSdXOjYZrF0wNeCFcLpinpuN
         sAVMbECg6ZSGKK+cUFE0zk57R1KNC4uRi93e9vyCRHvpKxqmlSGX4HMXkpouQbUdqW4U
         2vew==
X-Forwarded-Encrypted: i=1; AJvYcCWX8aQfFAeDjID2fNIqlmkDTlKQN/q9CviibbwPiQOzMnKNzNP/FIqX9MjrmMqxwHKKRBkMypPNItlTfBLDoj8U@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq/bqstljn2TPsQ1LKjVjN9OQDIHW9Twv3PwJfT7iUXHvMLbHm
	8E6GO71JWJ79Y6ztoSaZ+sooVD70phQO7Q2j0yGNV/FMPaA1twBfcRmpkRz0hS/+31c=
X-Gm-Gg: ASbGncuRS10mCwCnTCHbGrX0On4m/0grlfBDXoFg9hwYIpDt2a6d5ZmuiI+7G8fpJvq
	0KB9MVJa+t29JvtIV6lRzuQH5EKb7UXFmR6CzywgFWd8f9Fkyisryn1RqYM5EHEr8VsURkM+e+h
	9rBJAg5cGkTi7tvFhgU25kfGXnv/9nX2C23SspioVls/+7zathuNp6xN3jD6+KJHdk6aSrIzIt2
	7frVUPslJYYnFHl6HymDc9g7U1G/W4VwXZmMofCbu+UtLKAeePO9fF5psCqG23bsAZJh9lNuMYx
	I/75eprtJ5KBxwVTS401cVpYJgKaq3ocv9O7sJaXaP62vtCt8lh+NDZx8GB0Ljggu89p6SnjlW4
	K5nBN2Cfu/RSPBH7ls4k0yffhB7f03nBhLsqDjrAp9A==
X-Google-Smtp-Source: AGHT+IFqHQftxhyWop0NQsuDuKJieWCJS/ELGIRCmyIaJV/f88uiSxO0l/KEtdpJymZlggSX1ktNCg==
X-Received: by 2002:a05:600c:3b97:b0:456:942:b162 with SMTP id 5b1f17b1804b1-45dde200426mr27655935e9.11.1757183736423;
        Sat, 06 Sep 2025 11:35:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd3aadbcesm103081405e9.17.2025.09.06.11.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:35:35 -0700 (PDT)
Message-ID: <e2d8757b-9554-49b0-a067-f5aa657f3003@tuxon.dev>
Date: Sat, 6 Sep 2025 21:35:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 06/32] clk: at91: clk-main: switch to clk parent data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <33cec8a2f82e1bc747aa4315e47d535b7cec5a63.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <33cec8a2f82e1bc747aa4315e47d535b7cec5a63.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113538_252763_70B4F937 
X-CRM114-Status: GOOD (  18.72  )
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
> Use struct clk_parent_data instead of parent_hw for the main clock.

Same here as in patch 05/32. Please check the other patches as well.


> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to use parent_data.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-main.c | 16 ++++++++--------
>   drivers/clk/at91/pmc.h      |  4 ++--
>   drivers/clk/at91/sam9x7.c   | 21 ++++++++++-----------
>   drivers/clk/at91/sama7d65.c | 21 ++++++++++-----------
>   drivers/clk/at91/sama7g5.c  | 21 ++++++++++-----------
>   5 files changed, 40 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
> index 9b462becc693..514c5690253f 100644
> --- a/drivers/clk/at91/clk-main.c
> +++ b/drivers/clk/at91/clk-main.c
> @@ -402,7 +402,7 @@ struct clk_hw * __init
>   at91_clk_register_rm9200_main(struct regmap *regmap,
>   			      const char *name,
>   			      const char *parent_name,
> -			      struct clk_hw *parent_hw)
> +			      struct clk_parent_data *parent_data)
>   {
>   	struct clk_rm9200_main *clkmain;
>   	struct clk_init_data init = {};
> @@ -412,7 +412,7 @@ at91_clk_register_rm9200_main(struct regmap *regmap,
>   	if (!name)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (!(parent_name || parent_hw))
> +	if (!(parent_name || parent_data))
>   		return ERR_PTR(-EINVAL);
>   
>   	clkmain = kzalloc(sizeof(*clkmain), GFP_KERNEL);
> @@ -421,8 +421,8 @@ at91_clk_register_rm9200_main(struct regmap *regmap,
>   
>   	init.name = name;
>   	init.ops = &rm9200_main_ops;
> -	if (parent_hw)
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = &parent_name;
>   	init.num_parents = 1;
> @@ -552,7 +552,7 @@ struct clk_hw * __init
>   at91_clk_register_sam9x5_main(struct regmap *regmap,
>   			      const char *name,
>   			      const char **parent_names,
> -			      struct clk_hw **parent_hws,
> +			      struct clk_parent_data *parent_data,
>   			      int num_parents)
>   {
>   	struct clk_sam9x5_main *clkmain;
> @@ -564,7 +564,7 @@ at91_clk_register_sam9x5_main(struct regmap *regmap,
>   	if (!name)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (!(parent_hws || parent_names) || !num_parents)
> +	if (!(parent_data || parent_names) || !num_parents)
>   		return ERR_PTR(-EINVAL);
>   
>   	clkmain = kzalloc(sizeof(*clkmain), GFP_KERNEL);
> @@ -573,8 +573,8 @@ at91_clk_register_sam9x5_main(struct regmap *regmap,
>   
>   	init.name = name;
>   	init.ops = &sam9x5_main_ops;
> -	if (parent_hws)
> -		init.parent_hws = (const struct clk_hw **)parent_hws;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index b6f2aca1e1fd..e32a5e85d08f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -195,11 +195,11 @@ struct clk_hw * __init
>   at91_clk_register_rm9200_main(struct regmap *regmap,
>   			      const char *name,
>   			      const char *parent_name,
> -			      struct clk_hw *parent_hw);
> +			      struct clk_parent_data *parent_data);
>   struct clk_hw * __init
>   at91_clk_register_sam9x5_main(struct regmap *regmap, const char *name,
>   			      const char **parent_names,
> -			      struct clk_hw **parent_hws, int num_parents);
> +			      struct clk_parent_data *parent_data, int num_parents);
>   
>   struct clk_hw * __init
>   at91_clk_register_master_pres(struct regmap *regmap, const char *name,
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index d7dc5f381ebe..eaae05ba21ad 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -747,7 +747,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>   	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> -	static struct clk_parent_data parent_data;
> +	struct clk_parent_data parent_data[2];
>   	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
> @@ -780,15 +780,14 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	if (IS_ERR(main_rc_hw))
>   		goto err_free;
>   
> -	parent_data.name = main_xtal_name;
> -	parent_data.fw_name = main_xtal_name;
> -	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL, &parent_data, 0);
> +	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> +						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index), 0);

here &AT91_CLK_PD_NAME(main_xtal_name)

where main_xtal_name is retrieved with of_clk_get_parent_name(). Same for
the other SoCs touched in this patch. Same approach would have to be taken
into account for patches in this series using main_xtal, md_slck, td_slck
as parents through AT91_CLK_PD_NAME().

>   	if (IS_ERR(main_osc_hw))
>   		goto err_free;
>   
> -	parent_hws[0] = main_rc_hw;
> -	parent_hws[1] = main_osc_hw;
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
> @@ -805,12 +804,12 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sam9x7_plls[i][j].p) {
>   				case SAM9X7_PLL_PARENT_MAINCK:
> -					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
>   					hw = sam9x7_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAM9X7_PLL_PARENT_MAIN_XTAL:
> -					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> -								       main_xtal_index);
> +					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name,
> +									  main_xtal_index);
>   					hw = main_xtal_hw;
>   					break;
>   				default:
> @@ -825,7 +824,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   								   &pmc_pll_lock,
>   								   sam9x7_plls[i][j].n,
> -								   &parent_data, parent_rate, i,
> +								   parent_data, parent_rate, i,
>   								   sam9x7_plls[i][j].c,
>   								   sam9x7_plls[i][j].l,
>   								   sam9x7_plls[i][j].f);
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 372e530f4107..1d461db0438f 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1098,7 +1098,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>   	struct clk_hw *td_slck_hw, *md_slck_hw;
> -	static struct clk_parent_data parent_data;
> +	struct clk_parent_data parent_data[2];
>   	struct clk_hw *parent_hws[10];
>   	bool bypass;
>   	int i, j;
> @@ -1134,16 +1134,15 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   
> -	parent_data.name = main_xtal_name;
> -	parent_data.fw_name = main_xtal_name;
>   	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> -						 &parent_data, bypass);
> +						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
> +						 bypass);
>   	if (IS_ERR(main_osc_hw))
>   		goto err_free;
>   
> -	parent_hws[0] = main_rc_hw;
> -	parent_hws[1] = main_osc_hw;
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
> @@ -1160,12 +1159,12 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7d65_plls[i][j].p) {
>   				case SAMA7D65_PLL_PARENT_MAINCK:
> -					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
>   					hw = sama7d65_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
> -					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> -								       main_xtal_index);
> +					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name,
> +									  main_xtal_index);
>   					hw = main_xtal_hw;
>   					break;
>   				default:
> @@ -1178,7 +1177,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   					&pmc_pll_lock, sama7d65_plls[i][j].n,
> -					&parent_data, parent_rate, i,
> +					parent_data, parent_rate, i,
>   					sama7d65_plls[i][j].c,
>   					sama7d65_plls[i][j].l,
>   					sama7d65_plls[i][j].f);
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index f28fe419ae5e..f816a5551277 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -977,7 +977,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>   	struct clk_hw *td_slck_hw, *md_slck_hw;
> -	static struct clk_parent_data parent_data;
> +	struct clk_parent_data parent_data[2];
>   	struct clk_hw *parent_hws[10];
>   	bool bypass;
>   	int i, j;
> @@ -1013,16 +1013,15 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   
> -	parent_data.name = main_xtal_name;
> -	parent_data.fw_name = main_xtal_name;
>   	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> -						 &parent_data, bypass);
> +						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
> +						 bypass);
>   	if (IS_ERR(main_osc_hw))
>   		goto err_free;
>   
> -	parent_hws[0] = main_rc_hw;
> -	parent_hws[1] = main_osc_hw;
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
> @@ -1039,12 +1038,12 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7g5_plls[i][j].p) {
>   				case SAMA7G5_PLL_PARENT_MAINCK:
> -					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
>   					hw = sama7g5_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
> -					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> -								       main_xtal_index);
> +					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name,
> +									  main_xtal_index);
>   					hw = main_xtal_hw;
>   					break;
>   				default:
> @@ -1058,7 +1057,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   					&pmc_pll_lock, sama7g5_plls[i][j].n,
> -					&parent_data, parent_rate, i,
> +					parent_data, parent_rate, i,
>   					sama7g5_plls[i][j].c,
>   					sama7g5_plls[i][j].l,
>   					sama7g5_plls[i][j].f);


