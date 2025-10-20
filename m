Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F20CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAU73KA5bRRjDexmLv9S0p4A3jfHSvmFsVyQH8dOED0=; b=1ECGekWORpjEVzF917o7GnsaDy
	+zfHu3Qq6VNDDQyXK/IXVwDgiVZ68IoVEscNOk4ixrab0jqYYPOTPIiOA6xLRoqkNXeYlB/onoD9B
	cz5l8AOztub4++FDenD8gmDW3GUwqGO04xSwJqbYLd/3nkmcjHOL0PW14Gf0Py+VFDm8wzk75EixR
	SDQ/0WrstizvRZFdvTLUShkInixXMFsbs3y5eNiruZ9Z4T3NfKplqLDKNcyMWtq7qtweG29YGBJHo
	ynVxiv1V4zNobIk+hv7nwc2lwkQixlzTgL1FctILwvJXeoTZzaqfvsv+wUUm82bSnDW62y6ykMCIp
	tLAyVi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvM0-0000000Ekst-0tL7;
	Mon, 20 Oct 2025 19:15:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvLx-0000000Eks4-20lg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:15:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47114a40161so3848585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987732; x=1761592532; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAU73KA5bRRjDexmLv9S0p4A3jfHSvmFsVyQH8dOED0=;
        b=qKKh37a4eK5Iv73fDYKef5emn5qKy5R1A8BXQp3GjYAy4rq93UvSJs1i8XMj5WNdZe
         ahY3ny0YZi+MBrN4r1BRawsWO6mKAYBwAhlwFNUMYT6I41HZ0jNKjiDGq+/fhT9rhD+J
         zQxVER8mja7/3kQag5sSK7Wks/R034xQwRAD4f8VOjSBI9nf1uxhSYJ8c08qj4Wsu1Rl
         iJUyXMQh6F57+R/Ykv49nb3BSR5nGa/PYwV+cbkMdGzOdcXPYF+vIG2jP9UEE85dy7P6
         hxIiKWZbnGrNUgf1y8YjbMCNW4ya6tA47FUzexWOY9E7PAjI5KcZB37Bdm06wGlUxGYW
         zEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987732; x=1761592532;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAU73KA5bRRjDexmLv9S0p4A3jfHSvmFsVyQH8dOED0=;
        b=Pg1raSSV7DxkFOZpWlWV73FQDp9HUS6QIFOQkjYxcMijKK2yg+ZAs4j3Yh29rWFj7y
         Bw4tI81VRj/56EJwzZ8i4qi+quUN0022f/bPddzBhKEkwEKq9gz+WJi5Id9nfLQ9vhhA
         PvNV5+BALLqFwdFhsVpHh5p1IesS2T1TgDyX09fhvVR9EnKgQcFj2y+eZUUWaK5O+WvM
         wJ8PcZsOyRQdbLI67PBXgkn4/nVnBQk1bpyQL3AIei0cd8KspC/eMSj7DCrr51ZEPKbx
         DaT4MErrkQnxFD3hfftpwvljpa9Ci8lzLMlmbdr3U+pUjJSY3GnWmvpsRImHMJko1tc4
         ehRg==
X-Forwarded-Encrypted: i=1; AJvYcCUId3PDUQbjOnc5/LzeAgqPwtWfj76Iu+lz8shjZPUu6ReNFxoWfgcK6q71EUaXJHDZgJdRiIsayXsSS0I9boFH@lists.infradead.org
X-Gm-Message-State: AOJu0YxPWyoSbnMskbGbPUkk9KA7zR9ugtDJ/o+Akgrk9eS/H8HOhnrB
	WBzrACeEKJKeljI0SIAL9MvSklT3HA+DoMiVV+U8gIonZ/txQmP8+AWHlKPpMf/6nqQ=
X-Gm-Gg: ASbGnctEAbLmFJXFleu54WyRrAtxrKphQZTVHikCo/vTaIgGmZ/tQznbI/hEXgkKCOu
	3FXT9bif0jm7DpqZDrzCt6txic22dj96w1iYgS3pCUgkIElwg4iCilDPJ+50DsO2b26e8hklEol
	jX3+oZR+s05jk6ItDGLku4YUmQ0lP5etr1x5/zG8kOGVN9/JKNHoSxT5eq8h9qXK2Jyz68jlGxl
	ypun8clZOjIA7+2ferD8mT1osnDysrO2LOkF1r3v2iVRlYe04HX1hC1kgj5ujXNLOC+oEV8U69o
	aJOnOtPZto12zaGnp+0IFi4FvQd3/EPubUWH8XqDEMaLR3qzRhGSzA/Umsnagjb4+fDqp6YDdrc
	DlZ5vWiuXVnbq4xGyWRWgv+8jWsRHPtQWdFCQ8NPk4bw6cfYlva7lKuuKE27jPil/DHIss9ms4F
	ACxN1cEVe9fOoQpptOTbL6yLW2PAfPqg==
X-Google-Smtp-Source: AGHT+IHeXH+q1HCer8n1RPKQyzx1aKdI5mUetAs7LD84l09TghB+9mCwTSBlYrvcYqrjSZVmIiyAXA==
X-Received: by 2002:a05:600c:3b24:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47117912b6amr94831265e9.27.1760987731695;
        Mon, 20 Oct 2025 12:15:31 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a797sm16672032f8f.27.2025.10.20.12.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:15:31 -0700 (PDT)
Message-ID: <eed15c43-dde3-410b-b2a3-655f4acf8d97@tuxon.dev>
Date: Mon, 20 Oct 2025 22:15:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/31] clk: at91: dt-compat: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <628859234f4b2523f43b3ac05d5e29ceb05a7f61.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <628859234f4b2523f43b3ac05d5e29ceb05a7f61.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121533_561568_1E36B357 
X-CRM114-Status: GOOD (  16.27  )
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

On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch old dt-compat clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/dt-compat.c | 80 +++++++++++++++++++++++++-----------
>  1 file changed, 56 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
> index fa8658d3be7b..9ca871b817e0 100644
> --- a/drivers/clk/at91/dt-compat.c
> +++ b/drivers/clk/at91/dt-compat.c
> @@ -43,7 +43,8 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> -	hw = at91_clk_register_audio_pll_frac(regmap, name, parent_name, NULL);
> +	hw = at91_clk_register_audio_pll_frac(regmap, name, NULL,
> +					      &AT91_CLK_PD_NAME(parent_name));
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -69,7 +70,8 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> -	hw = at91_clk_register_audio_pll_pad(regmap, name, parent_name, NULL);
> +	hw = at91_clk_register_audio_pll_pad(regmap, name, NULL,
> +					     &AT91_CLK_PD_NAME(parent_name));
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -95,7 +97,7 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> -	hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_name, NULL);
> +	hw = at91_clk_register_audio_pll_pmc(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -129,6 +131,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>  	struct clk_hw *hw;
>  	unsigned int num_parents;
>  	const char *parent_names[GENERATED_SOURCE_MAX];
> +	struct clk_parent_data parent_data[GENERATED_SOURCE_MAX];
>  	struct device_node *gcknp, *parent_np;
>  	struct clk_range range = CLK_RANGE(0, 0);
>  	struct regmap *regmap;
> @@ -149,6 +152,8 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>  	if (IS_ERR(regmap))
>  		return;
>  
> +	for (unsigned int i = 0; i < num_parents; i++)
> +		parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
>  	for_each_child_of_node(np, gcknp) {
>  		int chg_pid = INT_MIN;
>  
> @@ -171,7 +176,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>  
>  		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>  						 &dt_pcr_layout, name,
> -						 parent_names, NULL, NULL,
> +						 NULL, parent_data, NULL,
>  						 num_parents, id, &range,
>  						 chg_pid);
>  		if (IS_ERR(hw))
> @@ -201,7 +206,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> -	hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
> +	hw = at91_clk_register_h32mx(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -228,6 +233,8 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
>  		return;
>  
>  	for_each_child_of_node(np, i2s_mux_np) {
> +		struct clk_parent_data parent_data[2];
> +
>  		if (of_property_read_u8(i2s_mux_np, "reg", &bus_id))
>  			continue;
>  
> @@ -238,8 +245,10 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
>  		if (ret != 2)
>  			continue;
>  
> +		parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
> +		parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
>  		hw = at91_clk_i2s_mux_register(regmap_sfr, i2s_mux_np->name,
> -					       parent_names, NULL, 2, bus_id);
> +					       NULL, parent_data, 2, bus_id);
>  		if (IS_ERR(hw))
>  			continue;
>  
> @@ -269,7 +278,8 @@ static void __init of_at91rm9200_clk_main_osc_setup(struct device_node *np)
>  	if (IS_ERR(regmap))
>  		return;
>  
> -	hw = at91_clk_register_main_osc(regmap, name, parent_name, NULL, bypass);
> +	hw = at91_clk_register_main_osc(regmap, name, NULL,
> +					&AT91_CLK_PD_NAME(parent_name), bypass);
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -323,7 +333,7 @@ static void __init of_at91rm9200_clk_main_setup(struct device_node *np)
>  	if (IS_ERR(regmap))
>  		return;
>  
> -	hw = at91_clk_register_rm9200_main(regmap, name, parent_name, NULL);
> +	hw = at91_clk_register_rm9200_main(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -336,6 +346,7 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>  {
>  	struct clk_hw *hw;
>  	const char *parent_names[2];
> +	struct clk_parent_data parent_data[2];
>  	unsigned int num_parents;
>  	const char *name = np->name;
>  	struct regmap *regmap;
> @@ -354,7 +365,9 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>  
>  	of_property_read_string(np, "clock-output-names", &name);
>  
> -	hw = at91_clk_register_sam9x5_main(regmap, name, parent_names, NULL,
> +	parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
> +	parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
> +	hw = at91_clk_register_sam9x5_main(regmap, name, NULL, parent_data,
>  					   num_parents);
>  	if (IS_ERR(hw))
>  		return;
> @@ -396,6 +409,7 @@ of_at91_clk_master_setup(struct device_node *np,
>  	struct clk_hw *hw;
>  	unsigned int num_parents;
>  	const char *parent_names[MASTER_SOURCE_MAX];
> +	struct clk_parent_data parent_data[MASTER_SOURCE_MAX];
>  	const char *name = np->name;
>  	struct clk_master_characteristics *characteristics;
>  	struct regmap *regmap;
> @@ -419,13 +433,15 @@ of_at91_clk_master_setup(struct device_node *np,
>  	if (IS_ERR(regmap))
>  		return;
>  
> +	for (unsigned int i = 0; i < MASTER_SOURCE_MAX; i++)
> +		parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
>  	hw = at91_clk_register_master_pres(regmap, "masterck_pres", num_parents,
> -					   parent_names, NULL, layout,
> +					   NULL, parent_data, layout,
>  					   characteristics, &mck_lock);
>  	if (IS_ERR(hw))
>  		goto out_free_characteristics;
>  
> -	hw = at91_clk_register_master_div(regmap, name, "masterck_pres", NULL,
> +	hw = at91_clk_register_master_div(regmap, name, NULL, &AT91_CLK_PD_HW(hw),
>  					  layout, characteristics,
>  					  &mck_lock, CLK_SET_RATE_GATE, 0);

Looks like at91_clk_register_master_div() could be kept to use parent_hws
instead of parent_data.

