Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5162CC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xs82vUP5osntenqpqOoVmwrbJUmMQdIcW7feR5dYo94=; b=Qo9iNysl3drVVfJoKoNP72pstG
	Cn1TQbwCKk5Ln4TGigQygL4n9EgkcZfRd9EtjcMtws+bJisJn9sxhg7vwYBhMWKAZrRSn/Fv49Zo2
	sEPAwnWLHdBfx3xNgD7FpBl84VnmBQyv2DdAUCXmh6fkEBSgn0iwNcWuxqgCe9MxQbI2nja26ZJWJ
	FA6XDzr3ACSM2RjJ/F2bVlH0/3P7nP9UJsyqRHCvxeQztxZLZXXF8tqFAVByK86o0j6oDcxtiXsqA
	ziBi7Fg5KhBLapmsBUiEeVD66E8mERe8pFSPRlVeJfm/5oTIbXWc9J7qv0hSV8Hr1WeEoCavns8WA
	sinOlzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIKH-0000000C7uy-2JaX;
	Mon, 26 Jan 2026 08:52:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIKE-0000000C7uG-1raY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:51:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47ee974e230so38111615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 00:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417516; x=1770022316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xs82vUP5osntenqpqOoVmwrbJUmMQdIcW7feR5dYo94=;
        b=Q8HBcHdAjvywzMylDNafpga1bdShRDUFVzofd3++9nlp0MwC73dB2hGPZqxCQifRFr
         3uJHaJVMG9q9fLEwrNrvyQSfVuWswZfJUxbeQ+r7NnLqL/AXQj8Xf0ccG7GELFyqVvjQ
         z9Sd/9JyTbWjpwSWXceiMYgs/Gox1K1+dIf/csr6hx9yI+/CxwKJlBholt2A3ALwsWzZ
         IP1s1bh7GjnX83ORpTEc7z3hVc1L1lzFkCBx4lyMUhYofM6kiDP9t82mpeNsuNa9334J
         XvO2vqEcESxSJ284l/tw4mRYtWp7WOkuELk5OSEHJSB3W39NuKkQo1WBaoP7vswSY1M+
         POPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417516; x=1770022316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xs82vUP5osntenqpqOoVmwrbJUmMQdIcW7feR5dYo94=;
        b=jK0PL6geVZGxebWoxX3T+JW65vzY7CDAsc2MNHoG3pkgM6TznxWGC60xHeq2fqRuMe
         D9MecKZnEsqimrK/L7qw2WxWStSe5/LFAVG36S9rZtmuT2pxPSF0/dHGbN+s135pygz1
         uc4OqSyanW5Sz6tXjsX9Lu5S80Cx+aPTbDVigQFarkmfqcK2F/guj42Pkko8KXKLLVIt
         XjbRYj3zZNLcB1lsnAic4xXweiyTOWErwITR4PKINTTqKRYRGwoIug/rPyW+TyIjbW4v
         rdNbv2viM+OVzOHkCajYTPDXLSCsekP46J566ycS4tNP4gjssSOhvrsdUE42drgObDaU
         AjBw==
X-Forwarded-Encrypted: i=1; AJvYcCVKsJhW2eakaYCQhYw0Szj3f1caJ7cwaOJZ7v7HOQb9XUs3PrDYB3bix8517G1h0RZvtl/Y1RRjzV9300MJbR5I@lists.infradead.org
X-Gm-Message-State: AOJu0YxGOmKMNgR7TD4jdvei3E0+Uvk64EcGtFgfuS+PgC1JgZ1l5YWH
	xc12cWjtdGgcdwT+1TXctetvMF3cTZ7Gs2o+JLNOAPmHw9pjwSE87jLeM844L7tM4dA=
X-Gm-Gg: AZuq6aKAr66gmQwmqk9OS9+aLNLSafqrUeXrDOl44y5um66L7QCDbDTcFnJM5gR8U9F
	Uk5koFTfpUrPRlhnm8WrZ48c6mfI7/RFg9SdYSYuiGAcJwZCiIGQJaeIH5lxLoacDBnxUgMA8z9
	lAfL1g8AkvFbFuwGrypAyYFZJ0F9ZVS7FdPgRqz8bq/8BVBkb0QLxdj8rMQqgPf10QqUyXFEYMR
	aRoNMaV59y7OS8rVv0RZpKFq8PORleEFm6jDm1lH6GKPG0NgvODBZa4XNlrGYMppNTmTUFFO4sB
	kGOn7cUtINdtYQy8n+3pDoIw9GYc78FSBoT15VlhyQ2ruAHCFAE+WSpVckg9umQZJs7rVxWWQkC
	IZS4WowlDLXwOLATsCsr75sDEdeeZAe1Ris9YENBwqQ3Z99ojItkEVSeS4NJPFWscR1QjV68eA0
	3VIgn0FFDrWghdBCS4Ag==
X-Received: by 2002:a05:600c:1992:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4805ce3ff38mr72084645e9.1.1769417515426;
        Mon, 26 Jan 2026 00:51:55 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm462919105e9.2.2026.01.26.00.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:51:55 -0800 (PST)
Message-ID: <8fea4eb8-6160-448c-b0b2-5c093a1ed769@tuxon.dev>
Date: Mon, 26 Jan 2026 10:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/31] clk: at91: sam9x75: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <30ba2ce066b788f5b5bcbf3db927b30293d881b6.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <30ba2ce066b788f5b5bcbf3db927b30293d881b6.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005158_750369_31A91E42 
X-CRM114-Status: GOOD (  26.53  )
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

On 1/16/26 22:06, ryan.wanner@microchip.com wrote:
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
>   drivers/clk/at91/sam9x7.c | 305 ++++++++++++++++++++++----------------
>   1 file changed, 174 insertions(+), 131 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 89868a0aeaba..c48c91da914e 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c


[ ...]

>   
>   /*
> @@ -426,7 +450,8 @@ static const struct {
>   /*
>    * Generic clock description
>    * @n:			clock name
> - * @pp:			PLL parents
> + * @pp:			PLL parents (entry formed by PLL components identifiers
> + *			(see enum pll_component_id))
>    * @pp_mux_table:	PLL parents mux table
>    * @r:			clock output range
>    * @pp_chg_id:		id in parent array of changeable PLL parent
> @@ -435,7 +460,10 @@ static const struct {
>    */
>   static const struct {
>   	const char *n;
> -	const char *pp[8];
> +	struct {
> +			int pll_id;
> +			int pll_compid;

Still having more than 2 tabs here.

[ ... ]

>   static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *td_slck_name, *md_slck_name, *mainxtal_name;
> +	const char *main_xtal_name;
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
>   	void **clk_mux_buffer = NULL;
>   	int clk_mux_buffer_size = 0;
> -	struct clk_hw *main_osc_hw;
>   	struct regmap *regmap;
> -	struct clk_hw *hw;
> +	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> +	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> +	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
> -	i = of_property_match_string(np, "clock-names", "td_slck");
> -	if (i < 0)
> -		return;
> -
> -	td_slck_name = of_clk_get_parent_name(np, i);
> +	i = of_property_match_string(np, "clock-names", "main_xtal");
>   
> -	i = of_property_match_string(np, "clock-names", "md_slck");
>   	if (i < 0)
>   		return;
> +	main_xtal_name = of_clk_get_parent_name(np, i);
>   
> -	md_slck_name = of_clk_get_parent_name(np, i);
> +	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> +	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
>   
> -	i = of_property_match_string(np, "clock-names", "main_xtal");
> -	if (i < 0)
> +	if (!td_slck_hw || !md_slck_hw)
>   		return;
> -	mainxtal_name = of_clk_get_parent_name(np, i);

I would have been prefered that the code here to look more organized, something 
like:

	i = of_property_match_string(np, "clock-names", "main_xtal");
	if (i < 0)
		return;
	main_xtal_name = of_clk_get_parent_name(np, i);

	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
	if (!td_slck_hw || !md_slck_hw)
		return;

but it is OK for now as the final form looks alike.

>   
>   	regmap = device_node_to_regmap(np);
>   	if (IS_ERR(regmap))
> @@ -760,26 +784,26 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	if (!clk_mux_buffer)
>   		goto err_free;
>   
> -	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> -					   50000000);
> -	if (IS_ERR(hw))
> +	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> +						   50000000);
> +	if (IS_ERR(main_rc_hw))
>   		goto err_free;
>   
> -	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
> -	if (IS_ERR(hw))
> +	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> +						 &AT91_CLK_PD_NAME(main_xtal_name), 0);
> +	if (IS_ERR(main_osc_hw))
>   		goto err_free;
> -	main_osc_hw = hw;
>   
> -	parent_names[0] = "main_rc_osc";
> -	parent_names[1] = "main_osc";
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
> +	parent_hws[0] = main_rc_hw;
> +	parent_hws[1] = main_osc_hw;
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
>   	sam9x7_pmc->chws[PMC_MAIN] = hw;
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
> -		for (j = 0; j < 3; j++) {
> +		for (j = 0; j < PLL_COMPID_MAX; j++) {
>   			struct clk_hw *parent_hw;
>   
>   			if (!sam9x7_plls[i][j].n)
> @@ -787,19 +811,23 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   
>   			switch (sam9x7_plls[i][j].t) {
>   			case PLL_TYPE_FRAC:
> -				if (!strcmp(sam9x7_plls[i][j].p, "mainck"))
> +				switch (sam9x7_plls[i][j].p) {
> +				case SAM9X7_PLL_PARENT_MAINCK:
>   					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
> -				else if (!strcmp(sam9x7_plls[i][j].p, "main_osc"))
> -					parent_hw = main_osc_hw;
> -				else
> -					parent_hw = __clk_get_hw(of_clk_get_by_name
> -								 (np, sam9x7_plls[i][j].p));
> +					break;
> +				case SAM9X7_PLL_PARENT_MAIN_XTAL:
> +					parent_hw = main_xtal_hw;

main_xtal_hw is not initialized. You should be able to do here as you did on 
patch 7/31.

> +					break;
> +				default:
> +					/* Should not happen. */
> +					parent_hw = NULL;
> +					break;
> +				}
>   
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   								   &pmc_pll_lock,
>   								   sam9x7_plls[i][j].n,
> -								   sam9x7_plls[i][j].p,
> -								   parent_hw, i,
> +								   NULL, parent_hw, i,
>   								   sam9x7_plls[i][j].c,
>   								   sam9x7_plls[i][j].l,
>   								   sam9x7_plls[i][j].f);
> @@ -809,7 +837,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   				hw = sam9x60_clk_register_div_pll(regmap,
>   								  &pmc_pll_lock,
>   								  sam9x7_plls[i][j].n,
> -								  sam9x7_plls[i][j].p, NULL, i,
> +								  NULL, sam9x7_plls[i][0].hw, i,
>   								  sam9x7_plls[i][j].c,
>   								  sam9x7_plls[i][j].l,
>   								  sam9x7_plls[i][j].f, 0);
> @@ -822,23 +850,24 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   			if (IS_ERR(hw))
>   				goto err_free;
>   
> +			sam9x7_plls[i][j].hw = hw;
>   			if (sam9x7_plls[i][j].eid)
>   				sam9x7_pmc->chws[sam9x7_plls[i][j].eid] = hw;
>   		}
>   	}
>   
> -	parent_names[0] = md_slck_name;
> -	parent_names[1] = "mainck";
> -	parent_names[2] = "plla_divpmcck";
> -	parent_names[3] = "upll_divpmcck";
> +	parent_hws[0] = md_slck_hw;
> +	parent_hws[1] = sam9x7_pmc->chws[PMC_MAIN];
> +	parent_hws[2] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
> +	parent_hws[3] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
>   	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
> -					   parent_names, NULL, &sam9x7_master_layout,
> +					   NULL, parent_hws, &sam9x7_master_layout,
>   					   &mck_characteristics, &mck_lock);
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
>   	hw = at91_clk_register_master_div(regmap, "masterck_div",
> -					  "masterck_pres", NULL, &sam9x7_master_layout,
> +					  NULL, hw, &sam9x7_master_layout,
>   					  &mck_characteristics, &mck_lock,
>   					  CLK_SET_RATE_GATE, 0);
>   	if (IS_ERR(hw))
> @@ -849,24 +878,24 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	parent_names[0] = "plla_divpmcck";
>   	parent_names[1] = "upll_divpmcck";
>   	parent_names[2] = "main_osc";
> -	hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
> -	if (IS_ERR(hw))
> +	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
> +	if (IS_ERR(usbck_hw))
>   		goto err_free;
>   
> -	parent_names[0] = md_slck_name;
> -	parent_names[1] = td_slck_name;
> -	parent_names[2] = "mainck";
> -	parent_names[3] = "masterck_div";
> -	parent_names[4] = "plla_divpmcck";
> -	parent_names[5] = "upll_divpmcck";
> -	parent_names[6] = "audiopll_divpmcck";
> +	parent_hws[0] = md_slck_hw;
> +	parent_hws[1] = td_slck_hw;
> +	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
> +	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
> +	parent_hws[4] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
> +	parent_hws[5] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
> +	parent_hws[6] = sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
>   	for (i = 0; i < 2; i++) {
>   		char name[6];
>   
>   		snprintf(name, sizeof(name), "prog%d", i);
>   
>   		hw = at91_clk_register_programmable(regmap, name,
> -						    parent_names, NULL, 7, i,
> +						    NULL, parent_hws, 7, i,
>   						    &sam9x7_programmable_layout,
>   						    NULL);
>   		if (IS_ERR(hw))
> @@ -875,9 +904,14 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		sam9x7_pmc->pchws[i] = hw;
>   	}
>   
> +	/* Set systemck parent hws. */
> +	sam9x7_systemck[0].parent_hw = sam9x7_pmc->chws[PMC_MCK];
> +	sam9x7_systemck[1].parent_hw = usbck_hw;
> +	sam9x7_systemck[2].parent_hw = sam9x7_pmc->pchws[0];
> +	sam9x7_systemck[3].parent_hw = sam9x7_pmc->pchws[1];
>   	for (i = 0; i < ARRAY_SIZE(sam9x7_systemck); i++) {
>   		hw = at91_clk_register_system(regmap, sam9x7_systemck[i].n,
> -					      sam9x7_systemck[i].p, NULL,
> +					      NULL, sam9x7_systemck[i].parent_hw,
>   					      sam9x7_systemck[i].id,
>   					      sam9x7_systemck[i].flags);
>   		if (IS_ERR(hw))
> @@ -890,7 +924,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
>   							 &sam9x7_pcr_layout,
>   							 sam9x7_periphck[i].n,
> -							 "masterck_div", NULL,
> +							 NULL, sam9x7_pmc->chws[PMC_MCK],
>   							 sam9x7_periphck[i].id,
>   							 &range, INT_MIN,
>   							 sam9x7_periphck[i].f);
> @@ -900,12 +934,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		sam9x7_pmc->phws[sam9x7_periphck[i].id] = hw;
>   	}
>   
> -	parent_names[0] = md_slck_name;
> -	parent_names[1] = td_slck_name;
> -	parent_names[2] = "mainck";
> -	parent_names[3] = "masterck_div";
> +	parent_hws[0] = md_slck_hw;
> +	parent_hws[1] = td_slck_hw;
> +	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
> +	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
>   	for (i = 0; i < ARRAY_SIZE(sam9x7_gck); i++) {
>   		u8 num_parents = 4 + sam9x7_gck[i].pp_count;
> +		struct clk_hw *tmp_parent_hws[6];

I see maximum pp_count is 2, thus the size of this array could be reduced.

>   		u32 *mux_table;
>   
>   		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -916,13 +951,21 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		PMC_INIT_TABLE(mux_table, 4);
>   		PMC_FILL_TABLE(&mux_table[4], sam9x7_gck[i].pp_mux_table,
>   			       sam9x7_gck[i].pp_count);
> -		PMC_FILL_TABLE(&parent_names[4], sam9x7_gck[i].pp,
> +
> +		for (j = 0; j < sam9x7_gck[i].pp_count; j++) {
> +			u8 pll_id = sam9x7_gck[i].pp[j].pll_id;
> +			u8 pll_compid = sam9x7_gck[i].pp[j].pll_compid;
> +
> +			tmp_parent_hws[j] = sam9x7_plls[pll_id][pll_compid].hw;

You can get rid of tmp_parent_hws[] and the above PMC_FILL_TABLE() and just use 
here something like:

			parent_hws[4 + j] = sam9x7_plls[pll_id][pll_compid].hw;

> +		}
> +
> +		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
>   			       sam9x7_gck[i].pp_count);
>   
>   		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>   						 &sam9x7_pcr_layout,
>   						 sam9x7_gck[i].n,
> -						 parent_names, NULL, mux_table,
> +						 NULL, parent_hws, mux_table,
>   						 num_parents,
>   						 sam9x7_gck[i].id,
>   						 &sam9x7_gck[i].r,


