Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3E0CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnjpYSKS/43/yifHhUiYoGDnMYrtA5KLOT4CjCRe/RM=; b=FAmqDvp5A57UNmVlvRKhl3OCKo
	ou9Giw3Va090OY85DKN0W1yzG/JcXEZv+HZVDPeJcCouapirgHFxY8DuvMi+KEzvP5QVlccoRhBVk
	9s5JPZyJMx+Bkp+lOyS5y8O4bW09fgIRge3ApMex8XWaXFLQ3E7pr/QY3jd27SSg4kWKrvB1UGKfE
	VuTvr+GWJXqD2z9RhGCI8QaU0ADbZDrDlTeWxoA5kfvR7/7O7rlkRBQwtU+tM64vXVYUtXV+a01RR
	vr1KOqbUPe7PV4ukOLkMUD6Ex+shck4wW8oFlDQiHnQNzL2hn6/7GS/h9al1Hc1hLBHHrINmyCi9S
	/UxNFDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvjW-0000000Eo2a-0a8v;
	Mon, 20 Oct 2025 19:39:54 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvjT-0000000Eo29-3CaJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:39:52 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b5e19810703so782978666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989190; x=1761593990; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LnjpYSKS/43/yifHhUiYoGDnMYrtA5KLOT4CjCRe/RM=;
        b=FzYySt3PKCO9ZKL8MLeGJrE+oHtt5U16Au/8faMORlQ1ymFYQVbKKjhkUB8PiiJcUb
         7x3grw6tH6jsnWBDW+ITW7aLWFlsPZemTv5s4KweLxD1Afnyb0s6l2zP2tZHjerp43zD
         O/8oY/NbVc391HkZmT/uBm9ITTDIIOi+t7L6kW0TA0/drYhW4tECIkwFbTtXO2urIUAW
         m2axWvcCPWCMlgZXO9oRjQRcZJHeLQLincrYMyl+/gNfGitiWinEV84zp5Jbp7A563Xg
         1xuTRpSf4LZ9tP5uH34s2Q8MjCqjPY3H5jlMy012eG20CbXoJoYxloeW6kCUZL6hoBNh
         aucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989190; x=1761593990;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LnjpYSKS/43/yifHhUiYoGDnMYrtA5KLOT4CjCRe/RM=;
        b=qyCYN8fmctaywB4+S4oK0EX97JJsx0o00NqTTJMM1P9LaVZwP+nA8bki72pQbs3+H3
         aslvyfTyXnYfBLkTMB/dYXr8dfG0Z+4mQ5E8Y7fERw0nancSvY4zZhU2Vh+irgqZ7NE3
         QuAL3odllYO3GyvQ3WfMwShgxiKWHIF/HyGO9ObOZAJfPgojJFdluKuDwzL6O31lWEv+
         wwaO4NXdHA9AEPbTWDhBNPiq49pSbFhlR802tSKBuJMJj7Dda7ldmaffD0qCJUM7+LQl
         zM4Kfqq4e7Av0YySfbCSs5Sx+/ekhe6Olhoox0isdwf1FN+/HomQbIFNvqe8rZULazCb
         FJMg==
X-Forwarded-Encrypted: i=1; AJvYcCUtxNJri982852A9mFhqPGMuo4RBHz9Ducwd1wNZTPqeA/tlNDOXpj4Qp8QWhlzqdfd2nSI3oMfynvG8mjLTQNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwoNeEpD46HX75/lJiLoBWG3KOIz3IjeE/Ly89YAzKmLDHf11BR
	Zx6qwEumrDdWIXeL+om/+hrUEGayTLgoy8tKlTEcXK55zjdQ8VMy7XEZsikK8h6xgCU=
X-Gm-Gg: ASbGncudP8sJ0XcNFFByhklLpr45jdUfekdJqcMfyhxU/wIt8X+dKgBCXuuLbxHFkMu
	NWibh0snQa5YBESDPiI12TpvP1yCT1RlehhYnOXtPJaeEalJXvxoHgmOrsqn6umy1U5ffsZDen8
	B5euwxM2/xYzhERVgWTBFbvJ7ym84+eh0hnEX94KrrNnzcXUd96T2esgQEH1+VDAycpqVetaDe3
	vmjzre7w8J4+eYkEnrjf8Rb//Ce8s9HLgOLljpk8NwJwiteLPwZVf58eiMANikvvbM5shb7aFFh
	HEc6LmllMrtVUa2aeMpD8xqqX8BNTwv7IUdvfQLSuDfA2DXGqXrII79jullU9N5+f/I+c1dmZfu
	jmYdNoEZTZHsDEeJ61mT5K9GVcFWfN2IRAwDCwz8JRptB+T/7xkabCE9FMMLsrg0La0a8cxq61M
	MEVV0M1Y/0ClIvnJpTDN/XStjlXj8iUw==
X-Google-Smtp-Source: AGHT+IH1hn38zTILbCMlTv2qi6kULe0P8fDltgqzfaMNLAfyLKQkqhNGIeocVuvV5wYRm7B5WR9gwg==
X-Received: by 2002:a17:907:1c85:b0:b3e:5f20:888d with SMTP id a640c23a62f3a-b647304516amr1918155666b.27.1760989189902;
        Mon, 20 Oct 2025 12:39:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83914d0sm861545166b.21.2025.10.20.12.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:39:49 -0700 (PDT)
Message-ID: <ff968ce4-9490-4e19-981b-7a5e9a842b68@tuxon.dev>
Date: Mon, 20 Oct 2025 22:39:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 10/31] clk: at91: clk-generated: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <645beaecf4b81c7e08f8adf3b9c74fa4b0176993.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <645beaecf4b81c7e08f8adf3b9c74fa4b0176993.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_123951_852022_F61F821B 
X-CRM114-Status: GOOD (  20.58  )
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
> modern clk_parent_data structures.
> 
> Remove the last of the usage of __clk_get_hw().
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Added SAMA7D65 and SAM9X75 SoCs to the
> clk-generated changes. Adjust clk name variable order.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-generated.c |  8 +++----
>  drivers/clk/at91/pmc.h           |  2 +-
>  drivers/clk/at91/sam9x7.c        | 38 ++++++++++++++---------------
>  drivers/clk/at91/sama7d65.c      | 41 +++++++++++++++++---------------
>  drivers/clk/at91/sama7g5.c       | 39 ++++++++++++++++--------------
>  5 files changed, 67 insertions(+), 61 deletions(-)
> 

[...]

>  static void __init sama7d65_pmc_setup(struct device_node *np)
>  {
> -	const char *main_xtal_name;
> +	const char *main_xtal_name, *md_slck_name, *td_slck_name;
>  	struct pmc_data *sama7d65_pmc;
>  	const char *parent_names[11];
>  	void **alloc_mem = NULL;
>  	int alloc_mem_size = 0;
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> -	struct clk_hw *td_slck_hw, *md_slck_hw;
>  	struct clk_parent_data parent_data[10];
> -	struct clk_hw *parent_hws[10];
>  	bool bypass;
>  	int i, j;
>  
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	i = of_property_match_string(np, "clock-names", "td_slck");
> +	if (i < 0)
> +		return;
> +	td_slck_name = of_clk_get_parent_name(np, i);
> +
> +	i = of_property_match_string(np, "clock-names", "md_slck");
> +	if (i < 0)
> +		return;
> +	md_slck_name = of_clk_get_parent_name(np, i);
> +
>  	i = of_property_match_string(np, "clock-names", "main_xtal");
>  

Please drop the resulting empty line here.


> -	if (!td_slck_hw || !md_slck_hw || !i)
> +	if (i < 0)
>  		return;
>  	main_xtal_name = of_clk_get_parent_name(np, i);
>  
> @@ -1218,8 +1224,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  	sama7d65_pmc->chws[PMC_MCK] = hw;
>  	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
>  
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
> -	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
>  	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
>  	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
>  		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
> @@ -1264,8 +1270,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
> -	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
>  	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
>  	parent_data[3] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
>  	parent_data[4] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
> @@ -1315,13 +1321,12 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  		sama7d65_pmc->phws[sama7d65_periphck[i].id] = hw;
>  	}
>  
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
> -	parent_hws[3] = sama7d65_pmc->chws[PMC_MCK1];
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
> +	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
> +	parent_data[3] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MCK1]);
>  	for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
>  		u8 num_parents = 4 + sama7d65_gck[i].pp_count;
> -		struct clk_hw *tmp_parent_hws[8];
>  		u32 *mux_table;
>  
>  		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -1338,15 +1343,13 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  			u8 pll_id = sama7d65_gck[i].pp[j].pll_id;
>  			u8 pll_compid = sama7d65_gck[i].pp[j].pll_compid;
>  
> -			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
> +			parent_data[4 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
>  		}
> -		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
> -			       sama7d65_gck[i].pp_count);
>  
>  		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>  						 &sama7d65_pcr_layout,
>  						 sama7d65_gck[i].n, NULL,
> -						 parent_hws, mux_table,
> +						 parent_data, mux_table,
>  						 num_parents,
>  						 sama7d65_gck[i].id,
>  						 &sama7d65_gck[i].r,
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index ddd5ad318990..ddbf69beb495 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -971,24 +971,30 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
>  
>  static void __init sama7g5_pmc_setup(struct device_node *np)
>  {
> -	const char *main_xtal_name;
> +	const char *main_xtal_name, *md_slck_name, *td_slck_name;
>  	struct pmc_data *sama7g5_pmc;
>  	void **alloc_mem = NULL;
>  	int alloc_mem_size = 0;
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
> -	struct clk_hw *td_slck_hw, *md_slck_hw;
>  	struct clk_parent_data parent_data[10];
> -	struct clk_hw *parent_hws[10];
>  	struct clk *main_xtal;
>  	bool bypass;
>  	int i, j;
>  
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	i = of_property_match_string(np, "clock-names", "td_slck");
> +	if (i < 0)
> +		return;
> +	td_slck_name = of_clk_get_parent_name(np, i);
> +
> +	i = of_property_match_string(np, "clock-names", "md_slck");
> +	if (i < 0)
> +		return;
> +	md_slck_name = of_clk_get_parent_name(np, i);
> +
>  	i = of_property_match_string(np, "clock-names", "main_xtal");
>  

Please drop the resulting empty line here.

