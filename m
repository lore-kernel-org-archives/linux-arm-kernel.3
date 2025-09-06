Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB25ECA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 18:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54ncVaPIl6vgU1gf8JptlaFEnSFvlH9WtRTSq/ZrGMM=; b=XqJo36Yjk14MU5EFDsByIaCe/L
	xsG77d6bxfHTX0oUn0zceP5BjPF7hN6M9qVoFFL24rUtl/bcZjysooGMFoaJU+z26+jMLOJjzTwVa
	KwyeuHZIDX1RRnlPA2wHkOmDQ9hWnHdgPf2xH2R1+NpQwK6BYM41/9Rzailmu2jwW3b20QaJcFsdG
	vPAmGbJ4xf2MFazoUh+SPbcyt/RfeSA+fz32YTmmA5BALqNWh6NNVSEt5bTp87p8D6AOQiLqIxKLt
	qFb9HicvXFsiGu5mXu3QHE3Hjh1NY9SY+lc1mvPacLtPMnWUAwqb0xbdnGs4fpYxAKDLlonqfPLxW
	Zu/A1ZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuy2z-00000008J00-0imt;
	Sat, 06 Sep 2025 18:54:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxlx-00000008GUS-3kjZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:36:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so20016005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183784; x=1757788584; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=54ncVaPIl6vgU1gf8JptlaFEnSFvlH9WtRTSq/ZrGMM=;
        b=CBAjX+jSEpoQmxyjqTxPnbCsnd5HGy4kdXK/itblz6U76Lc+Ihfz/VuDDCOveasbUr
         RmwokqIGFgG2Sbvr2EUVh+xdBUYw7/K/ezaCrrlneKinWg8W/2dGNiJisc5LY5rwjG+t
         24zA2WN8KwdfbllcCHHdQ4jzlvXcIwCLWVFO99VIWj0aCQIGRJgCKHz3ktFAzhjV0BFq
         MBM6hYDmFRtEZkuny6HgtsxLZ3c4XIGG6JFR+slv+syWPaLSBGqOg+qNiK1jalk4i/Jd
         uGlkbY/l6e7jDFU9aRk4gVWDDhJyv5nRFaFWkc1rw555tHO5hJmdl2K04+CwtX0FDJr4
         HOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183784; x=1757788584;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54ncVaPIl6vgU1gf8JptlaFEnSFvlH9WtRTSq/ZrGMM=;
        b=jp1swvfKCoYTIrYdKqgv0WHhY0+oukc4JhQjcK92ZzFkHqiy/GZCOlBG20G6fXmjcD
         AGpnD1Va8majAQ7ZDGvVcgMKxDH/5YMapTtR+h1YGNBC8Kyaen1N0w+0MKe3AgjhOY+y
         ioU1r/LegFt5B1BZUX4J2rEO/ZtbUKw7VkK0Wms+B5u1EacnrBUcXYA0Pb8sozrS7qhJ
         N0x8SwM5OJr0b/JXqpUU4fguGzFiBtIK8ANv9GjZv0rpEMDijKTnX0xIUbJdEuIOeWfY
         dlfSwaUELu2RiHlanRAJSQYGdMb2zsMF8R3noKj6z3sQAijhnC6OUn7kHMpo/fheCR3i
         29PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL98cFWV+7+iMfVhQspXvXJsQlxVqj/2kJRmGfBq7OCafi9alG3K0ghkqogw9Ua+w5ulIGMEvGUmgK1AU5Pko/@lists.infradead.org
X-Gm-Message-State: AOJu0YwR40YysnxsSvPXcg+asBQnxrOo3E7TqRNvetDAwOUV5c6i14dI
	fyXwLRCd7fa1NZsc5HfOheOKPSjBwAqUdhKZMXkjfJW1tBqW58MiB9MJvIzMbUKI0Aw=
X-Gm-Gg: ASbGnctoTvb8l2of4IoXCcZxFfFVeI9k14vMWDXs1ZNDWI+fwxFZl+tr1CWMKbzYLnY
	HX3x/o5T3gwmnlyAA/EFOGlzQsAdDl+P6D03YIgw36MWXebsgqVGrhvE+eCudrPRYuSuSTggjm1
	R0c8RxQ/zzSObWX+3Pp+RF0YgHLzuwKjXpzo71E6k0lURLuUIJn5mJIL4vTTFsMFaY101hJYD2O
	L0W5sBI3XebuNR8ZHyqxGIhn5TCAF/qC0mHOlpRCp6ado+aTlvmP45MPwRDTGGSHkGkxXa7KhNa
	tYZyhGzQSCbE08FNweqBRGOWXOAQ6pfr4iUzSqHVyh1kCkfKfHAaLjmSSFya7aedoKl3SkpTuBh
	iUDlQGf0zAuuV9C+ys/Bup1PimF4o2P5TmEh74oZHhg==
X-Google-Smtp-Source: AGHT+IHgGwWC3QcD58nUjxRKUaGgpa6imWI7sfXUg1oiAyn2VoRF7Hl9zOTaDpkuJIwGLGlYEOuU5g==
X-Received: by 2002:a05:600c:1993:b0:45b:7a93:f108 with SMTP id 5b1f17b1804b1-45dddeb74a0mr23287305e9.3.1757183784329;
        Sat, 06 Sep 2025 11:36:24 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddfe0b654sm29303605e9.3.2025.09.06.11.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:36:23 -0700 (PDT)
Message-ID: <95e19f49-d0df-4d3f-bd7d-8b58b60f1f7a@tuxon.dev>
Date: Sat, 6 Sep 2025 21:36:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 08/32] clk: at91: clk-master: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <4b404eaaab4062464a4142e95aaa76d5cba866f0.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <4b404eaaab4062464a4142e95aaa76d5cba866f0.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113625_941646_5D0F162F 
X-CRM114-Status: GOOD (  20.10  )
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
> The md_slck name and index are added for the SAM9X75 SoC so the
> clk-master can properly use parent_data.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add clk-master changes to SAM9X75 and
> SAMA7D65 SoCs. As well as add md_slck commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-master.c | 24 ++++++++++++------------
>   drivers/clk/at91/pmc.h        |  6 +++---
>   drivers/clk/at91/sam9x7.c     | 19 ++++++++++---------
>   drivers/clk/at91/sama7d65.c   | 23 ++++++++++-------------
>   drivers/clk/at91/sama7g5.c    | 29 +++++++++++++----------------
>   5 files changed, 48 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
> index 7a544e429d34..cc4f3beb51e5 100644
> --- a/drivers/clk/at91/clk-master.c
> +++ b/drivers/clk/at91/clk-master.c
> @@ -473,7 +473,7 @@ static struct clk_hw * __init
>   at91_clk_register_master_internal(struct regmap *regmap,
>   		const char *name, int num_parents,
>   		const char **parent_names,
> -		struct clk_hw **parent_hws,
> +		struct clk_parent_data *parent_data,
>   		const struct clk_master_layout *layout,
>   		const struct clk_master_characteristics *characteristics,
>   		const struct clk_ops *ops, spinlock_t *lock, u32 flags)
> @@ -485,7 +485,7 @@ at91_clk_register_master_internal(struct regmap *regmap,
>   	unsigned long irqflags;
>   	int ret;
>   
> -	if (!name || !num_parents || !(parent_names || parent_hws) || !lock)
> +	if (!name || !num_parents || !(parent_names || parent_data) || !lock)
>   		return ERR_PTR(-EINVAL);
>   
>   	master = kzalloc(sizeof(*master), GFP_KERNEL);
> @@ -494,8 +494,8 @@ at91_clk_register_master_internal(struct regmap *regmap,
>   
>   	init.name = name;
>   	init.ops = ops;
> -	if (parent_hws)
> -		init.parent_hws = (const struct clk_hw **)parent_hws;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> @@ -531,13 +531,13 @@ struct clk_hw * __init
>   at91_clk_register_master_pres(struct regmap *regmap,
>   		const char *name, int num_parents,
>   		const char **parent_names,
> -		struct clk_hw **parent_hws,
> +		struct clk_parent_data *parent_data,
>   		const struct clk_master_layout *layout,
>   		const struct clk_master_characteristics *characteristics,
>   		spinlock_t *lock)
>   {
>   	return at91_clk_register_master_internal(regmap, name, num_parents,
> -						 parent_names, parent_hws, layout,
> +						 parent_names, parent_data, layout,
>   						 characteristics,
>   						 &master_pres_ops,
>   						 lock, CLK_SET_RATE_GATE);
> @@ -546,7 +546,7 @@ at91_clk_register_master_pres(struct regmap *regmap,
>   struct clk_hw * __init
>   at91_clk_register_master_div(struct regmap *regmap,
>   		const char *name, const char *parent_name,
> -		struct clk_hw *parent_hw, const struct clk_master_layout *layout,
> +		struct clk_parent_data *parent_data, const struct clk_master_layout *layout,
>   		const struct clk_master_characteristics *characteristics,
>   		spinlock_t *lock, u32 flags, u32 safe_div)
>   {
> @@ -560,7 +560,7 @@ at91_clk_register_master_div(struct regmap *regmap,
>   
>   	hw = at91_clk_register_master_internal(regmap, name, 1,
>   					       parent_name ? &parent_name : NULL,
> -					       parent_hw ? &parent_hw : NULL, layout,
> +					       parent_data, layout,
>   					       characteristics, ops,
>   					       lock, flags);
>   
> @@ -812,7 +812,7 @@ struct clk_hw * __init
>   at91_clk_sama7g5_register_master(struct regmap *regmap,
>   				 const char *name, int num_parents,
>   				 const char **parent_names,
> -				 struct clk_hw **parent_hws,
> +				 struct clk_parent_data *parent_data,
>   				 u32 *mux_table,
>   				 spinlock_t *lock, u8 id,
>   				 bool critical, int chg_pid)
> @@ -824,7 +824,7 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
>   	unsigned int val;
>   	int ret;
>   
> -	if (!name || !num_parents || !(parent_names || parent_hws) || !mux_table ||
> +	if (!name || !num_parents || !(parent_names || parent_data) || !mux_table ||
>   	    !lock || id > MASTER_MAX_ID)
>   		return ERR_PTR(-EINVAL);
>   
> @@ -834,8 +834,8 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
>   
>   	init.name = name;
>   	init.ops = &sama7g5_master_ops;
> -	if (parent_hws)
> -		init.parent_hws = (const struct clk_hw **)parent_hws;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index d9a04fddb0b1..54d472276fc9 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -204,14 +204,14 @@ at91_clk_register_sam9x5_main(struct regmap *regmap, const char *name,
>   struct clk_hw * __init
>   at91_clk_register_master_pres(struct regmap *regmap, const char *name,
>   			      int num_parents, const char **parent_names,
> -			      struct clk_hw **parent_hws,
> +			      struct clk_parent_data *parent_data,
>   			      const struct clk_master_layout *layout,
>   			      const struct clk_master_characteristics *characteristics,
>   			      spinlock_t *lock);
>   
>   struct clk_hw * __init
>   at91_clk_register_master_div(struct regmap *regmap, const char *name,
> -			     const char *parent_names, struct clk_hw *parent_hw,
> +			     const char *parent_names, struct clk_parent_data *parent_data,
>   			     const struct clk_master_layout *layout,
>   			     const struct clk_master_characteristics *characteristics,
>   			     spinlock_t *lock, u32 flags, u32 safe_div);
> @@ -220,7 +220,7 @@ struct clk_hw * __init
>   at91_clk_sama7g5_register_master(struct regmap *regmap,
>   				 const char *name, int num_parents,
>   				 const char **parent_names,
> -				 struct clk_hw **parent_hws, u32 *mux_table,
> +				 struct clk_parent_data *parent_data, u32 *mux_table,
>   				 spinlock_t *lock, u8 id, bool critical,
>   				 int chg_pid);
>   
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index eaae05ba21ad..945983f72140 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -739,7 +739,8 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
>   	struct clk_range range = CLK_RANGE(0, 0);
>   	const char *main_xtal_name = "main_xtal";
> -	u8 main_xtal_index = 2;
> +	const char *const md_slck_name = "md_slck";
> +	u8 md_slck_index = 1, main_xtal_index = 2;
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
>   	void **clk_mux_buffer = NULL;
> @@ -747,12 +748,12 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>   	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> -	struct clk_parent_data parent_data[2];
> +	struct clk_parent_data parent_data[9];
>   	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
>   	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, md_slck_name));

Please use:

i = of_property_match_string(np, "clock-names", "md_slck");
if (i < 0)
    return;

md_slck_name = of_clk_get_parent_name(np, i);

Same sama7d65, sama7g5.

>   	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>   
>   	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
> @@ -853,18 +854,18 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		}
>   	}
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = sam9x7_pmc->chws[PMC_MAIN];
> -	parent_hws[2] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
> -	parent_hws[3] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);

AT91_CLK_PD_NAME(md_slck_name);

Same sama7d65, sama7g5.


