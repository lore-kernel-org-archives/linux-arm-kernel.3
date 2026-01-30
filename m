Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0770DD61037
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 06:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUIw0RJaE1aXOBsFkdxWp8jD82cs6plN0HTFY2F6+4M=; b=bwrx+vWizSZu+dnH/VNerQuT7t
	BKHwVjHWIL4JYKFnUbQ7XnEgINZ7025k9Nxu1j39/q8FlZ8oE9pvPEwI7WTnY/1KvFvnpz0UB0XLe
	mMHaq5ZGUr4I2y3oCFFe65IB9WX2pUsJsibePleLQbFDoaGIktfIPQJeF+6Xeq6NNZPuHSgpszQFl
	jmxrSgOV3m4YVqeNZrsYK2u5XDKIClXeo8dDQqYjunTQNFBwxtuVzReKsRFOW5dJEOCxMtZAtd00A
	LkVzGs6FBZTcor7vrPSoOGnu72sxP2DyEazgWenyWLPGFF2NaY+whqJ0BfwOuCQUMZ/p7nZEk9Okp
	+2cb8TUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliQv-0000000174Y-03F2;
	Fri, 30 Jan 2026 06:56:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliQs-0000000174A-1m8B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 06:56:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso7079205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769756200; x=1770361000; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUIw0RJaE1aXOBsFkdxWp8jD82cs6plN0HTFY2F6+4M=;
        b=Hyo8KeQNOFwOBihEN5lJ68aOHq+7I/DJmlwP4RPP3qKXV0FpaGPHDVZf+NRuZyywld
         FPnUvjM1UuyDgguHBkM3n3jP8uFz7VNQVsJfTaNukCgT6a49mBKlOL6MGUQYDSYZtR3D
         FBZCJibTFwT4NEIUL73SzFOr/TcB62vfboYBgZYin81tAr4rRmdk6V5iGb0V8CJyleHb
         8nX0dHDIctyDHb95kI+sxxhPfPnPQMgIO064Y2W/H+ug5rQ2eICsTP+hCZeobcmfv8EI
         7eO0kBuk9rMkSgP0KeHRFq2TV1AKCVzjEA6pVTAQjj0wjt+mKESm0tlpgjttIW8kEbrz
         IKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756200; x=1770361000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUIw0RJaE1aXOBsFkdxWp8jD82cs6plN0HTFY2F6+4M=;
        b=UrZn14+79hrlfgdTo3DFwZbp/lF11/z7HWQLSOJRzKmAZrcRFuGn4Qo+0Drw/8NLRK
         z7+D68UQE0ZTh7OPpIReUBqB/G1F/9a1+w9RqRDrpN/7qEnSxmbpeqtbOALDdMElqtE8
         668uJQGrZIeVn7Tuy412gZtJ1lIIbrQmSkJ9ERLDxb0GvPBQyNE2WRi0pdWaLE0YLUtl
         tMVk22AruFQC6QQnkAjAUwtAhtfmJMDuYw4mExQU0fjcQqBeG5vGMByc5ZBuVrlgP83q
         MYfyrCNPvPpmtyJI4VY+xAFqbmYDA7+iWETYDKOjFF25LfsaqR82T3EBtSIK2a74FU5N
         V/aA==
X-Forwarded-Encrypted: i=1; AJvYcCXKVT2/DLCZsmU3ugOTQ/Az/J4eTxmwc+FGI4sVAVBbgXe35o1WOoGxNmRtUifcqHJ9L71N2mpwPoLG3ft+zbOL@lists.infradead.org
X-Gm-Message-State: AOJu0YyW/0+rK9mGmhulpTHACqQuDR8og9bAC8vVBTZj+2Qq/qzdYfg1
	fdjhHhys9v0d/n7jLk626AiKCTZP/v+Sl21xFTTo5Hm3zP2RFDjj0KYNgcU+vaWzvwE=
X-Gm-Gg: AZuq6aLglmakMO0/kVENrrd7ytpSQgZpMYLmWaAChbCoIzac5PgsUJrVh6HF+j4FuIg
	YXYdXd/QxzSYq63B0eyupIsXCxUvJBIJUiQmA/I9Pmr1neuCb6TVx6hG5+PfZUJZRhWnAfCwQER
	qGMoiYZjlu+Pi8X7ROqoBjTVW2OoIwWNZ3mE6gGrfWisfwmNw8NoNOm7274Q5/aZ8oiIi6pFvwO
	YRTC6vGLDHEQKKYC1iv+6h7h+36WAqxiExEkhiI3pAuYaZZoEyKTvFQTrGg88I2m78GOazx009S
	JrWGldbJQQFvRaB/DSw+xMm/0wwJnHSTvNj3eD1peWzFCLUuZZdQmUnHhvpV7uJjywj5P+jXW/Z
	pZ7TVqhlAslqasNL2HfMgeYu7b4K7Sgzf0ltlLtw7Fb2h++nVJQaNJzZfydVdaxUwgvzF19eqYr
	FRvi+vFcKFL2axF+oDZA==
X-Received: by 2002:a05:600c:4ecd:b0:480:3230:6c89 with SMTP id 5b1f17b1804b1-482db4616damr16802455e9.12.1769756199522;
        Thu, 29 Jan 2026 22:56:39 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dffd47c2sm7593775e9.0.2026.01.29.22.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 22:56:38 -0800 (PST)
Message-ID: <fbf00a15-9faf-4455-ad4b-c351ffae6598@tuxon.dev>
Date: Fri, 30 Jan 2026 08:56:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/31] clk: at91: clk-generated: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <564e91919099ad05f11d22ff20a6dc674f1d0ba4.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <564e91919099ad05f11d22ff20a6dc674f1d0ba4.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_225642_661917_20686C68 
X-CRM114-Status: GOOD (  22.49  )
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

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Remove the last of the usage of __clk_get_hw().
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Added SAMA7D65 and SAM9X75 SoCs to the
> clk-generated changes. Adjust clk name variable order.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-generated.c |  8 +++----
>   drivers/clk/at91/pmc.h           |  2 +-
>   drivers/clk/at91/sam9x7.c        | 37 ++++++++++++++++----------------
>   drivers/clk/at91/sama7d65.c      | 37 ++++++++++++++++----------------
>   drivers/clk/at91/sama7g5.c       | 35 +++++++++++++++---------------
>   5 files changed, 58 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
> index 4b4edeecc889..d9e00167dbc8 100644
> --- a/drivers/clk/at91/clk-generated.c
> +++ b/drivers/clk/at91/clk-generated.c
> @@ -319,7 +319,7 @@ struct clk_hw * __init
>   at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>   			    const struct clk_pcr_layout *layout,
>   			    const char *name, const char **parent_names,
> -			    struct clk_hw **parent_hws,
> +			    struct clk_parent_data *parent_data,
>   			    u32 *mux_table, u8 num_parents, u8 id,
>   			    const struct clk_range *range,
>   			    int chg_pid)
> @@ -329,7 +329,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>   	struct clk_hw *hw;
>   	int ret;
>   
> -	if (!(parent_names || parent_hws))
> +	if (!(parent_names || parent_data))
>   		return ERR_PTR(-ENOMEM);
>   
>   	gck = kzalloc(sizeof(*gck), GFP_KERNEL);
> @@ -338,8 +338,8 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>   
>   	init.name = name;
>   	init.ops = &generated_ops;
> -	if (parent_hws)
> -		init.parent_hws = (const struct clk_hw **)parent_hws;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 3d06b1c41f13..d8d491096c0d 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -174,7 +174,7 @@ struct clk_hw * __init
>   at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>   			    const struct clk_pcr_layout *layout,
>   			    const char *name, const char **parent_names,
> -			    struct clk_hw **parent_hws, u32 *mux_table,
> +			    struct clk_parent_data *parent_data, u32 *mux_table,
>   			    u8 num_parents, u8 id,
>   			    const struct clk_range *range, int chg_pid);
>   
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index f98aecdd6f88..d549bdd988e8 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -744,16 +744,15 @@ static const struct {
>   static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *main_xtal_name;
> +	const char *main_xtal_name, *td_slck_name, *md_slck_name;
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
>   	void **clk_mux_buffer = NULL;
>   	int clk_mux_buffer_size = 0;
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> -	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> +	struct clk_hw *usbck_hw;
>   	struct clk_parent_data parent_data[9];
> -	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
>   	i = of_property_match_string(np, "clock-names", "main_xtal");
> @@ -762,11 +761,15 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		return;
>   	main_xtal_name = of_clk_get_parent_name(np, i);
>   
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	i =  of_property_match_string(np, "clock-names", "td_slck");
> +	if (i < 0)
> +		return;
> +	td_slck_name = of_clk_get_parent_name(np, i);
>   
> -	if (!td_slck_hw || !md_slck_hw)
> +	i =  of_property_match_string(np, "clock-names", "md_slck");
> +	if (i < 0)
>   		return;
> +	md_slck_name = of_clk_get_parent_name(np, i);
>   
>   	regmap = device_node_to_regmap(np);
>   	if (IS_ERR(regmap))
> @@ -862,7 +865,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		}
>   	}
>   
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
>   	parent_data[1] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
>   	parent_data[2] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
>   	parent_data[3] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
> @@ -888,8 +891,8 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	if (IS_ERR(usbck_hw))
>   		goto err_free;
>   
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
> -	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
>   	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
>   	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
>   	parent_data[4] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
> @@ -940,13 +943,12 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		sam9x7_pmc->phws[sam9x7_periphck[i].id] = hw;
>   	}
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
> -	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
> +	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
> +	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
>   	for (i = 0; i < ARRAY_SIZE(sam9x7_gck); i++) {
>   		u8 num_parents = 4 + sam9x7_gck[i].pp_count;
> -		struct clk_hw *tmp_parent_hws[6];
>   		u32 *mux_table;
>   
>   		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -962,16 +964,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   			u8 pll_id = sam9x7_gck[i].pp[j].pll_id;
>   			u8 pll_compid = sam9x7_gck[i].pp[j].pll_compid;
>   
> -			tmp_parent_hws[j] = sam9x7_plls[pll_id][pll_compid].hw;
> +			parent_data[4 + j] = AT91_CLK_PD_HW(sam9x7_plls[pll_id][pll_compid].hw);
>   		}
>   
> -		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
> -			       sam9x7_gck[i].pp_count);
> -

Ideally, these kind of changes should have been done through a different patch.
Could you please create a different patch for all changes like in this series?

With that addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

