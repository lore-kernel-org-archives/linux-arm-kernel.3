Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4333ECA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asMwycMgdJ6wmjQEJEXq9PlkPbXrAScvnIzSzlc8XJ0=; b=EfHSEAP6nylJ2lTBdKMYe584DY
	HW+yiPyChmMzOHGZ+39ojxFjbPMvmo0gVUnCfsxeoZuOq9bzPbQgQvxxRq4ZbN05fiBSrUMfklA5m
	NZeRmax3s/5mRdX+fhevzvrAaSRjGtyshbwG3EWlJst06qsDpoL6EthuvzOolwX8Orbf6zoVbsymj
	fG0XqCxaqBYZM83N4YWK9gqSKlULJSOFl/XNVeKZvWGckmdjpARmKTx9Vk/6oGPP11yrZYqtvWnYY
	/q84X4gxcyJ/1eH/tO/JLjz/g2vDvBo2Qa54Q9iDM7xOnY9lTkRbziHHOnN2KgJnliCED+DPoVOSo
	xU0YXjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuy8b-00000008K64-1g1w;
	Sat, 06 Sep 2025 18:59:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxmv-00000008Gh6-2J5k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:37:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3e3aafe06a7so1179579f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183844; x=1757788644; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=asMwycMgdJ6wmjQEJEXq9PlkPbXrAScvnIzSzlc8XJ0=;
        b=hidnGQbf0EPXxSx6I5FMEfgkpOAOgtNCcSNvaz7wOM8zUnB2KIjJt5vbkIBkNQOKC1
         qLxHCJCOgxSPOAfKouHmSdywZmN3USzR0Kk8dVL/LbXxUACVMfKnDb2Tqf1ynMs9qc4F
         ASODOxJaCH9eL6AKIQryy5Wxrja0fOw+pPDxi0GC2jHdvUHsPxPKpF03NhL1oKEeMXgD
         YVgMYzVOlJI/8JDRo1aVPzYbHj7DcnGm2mhUJFgrHbUtW1N2SD7vH+WbpdYdWiPv/wa8
         wCbQF69wjYhk5X4asPNniHEFyIYIA5n9/2k9bLqxjxX9DMzjYdFQuT0ARqmwGcMs1IMJ
         ZncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183844; x=1757788644;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asMwycMgdJ6wmjQEJEXq9PlkPbXrAScvnIzSzlc8XJ0=;
        b=behTVCaA1o4b1tPx1c0GfY/5j7Fx1Z+Z2V42AJW4zB9Cij9w9ko1w9Rt2wwoo+QYEU
         lRm6DGZJtKNAxiI1+Oxpop1psLG9bHAZe2GAZxRfSk1qaBlbPvzt5cMYpPTsbtCA+Qbg
         hKAxAZZedXgjEViOyvw91cPwwnqLE2yqW9mrD41hps1DyTvC3FbesekLRapqQWdum1Jd
         iJg/vhOiyZMrrvtiL51LO1mbRcDKmSlmiz3Whj/JtQyB57Q4yOPoHn9r9P5htjrwmOd4
         m+fyIezuVfcgkfwnjVFcZBWfhYkQgOr+ctL7M75olcGomWSlmjkzslgZPPuoyISOgFj4
         /kJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAVg8TNt0MW1IvJXEywQsXDxDXVxIi7au939NbWtflDlXO+cqgt3qQjUjq+M4tsQf0XqgaG6uEbrWWRv6kvjhR@lists.infradead.org
X-Gm-Message-State: AOJu0YwbKTMj74WH9OZNccSajP6N31gWzsdLI533M8LZmbb9j4HacDft
	mQa6FKoGMtKoCkYQAxfau/YM1Pzw1Nek2repYSLRRfT9YWqtD1kPfEix67vMNRgQh+c=
X-Gm-Gg: ASbGncuHIiMJg3bvpUb7Q8+iSIkLcCBoFyE/+wwAzo4biFIMZf8Bsht/hjUJ4O2ST3Q
	CzF3HmUpaHDgS4SdqZ6/M/Z+vXs68l+sURw7WvDMNznmcruYEaH0sLmnVEN3Na1TXab0h/Q1C7O
	O98EQQd+qBm6TKyv28nmAWns/oeMIVLJa42rLX37lqwnPjKyBvcAIT0LZCepHHlIKSj576Y7QtW
	Wh2UZxwlyBnsgp3NBk4sdfKLCq9tDsCY6CUDuF3UWC8Br5E7PjO4+dYQpF7p7eYAwhLmyBf/Ny+
	cL+UrAYiPqFSuUc0PsZY6i2HyY+x2N3oggi0/s/qQbPNVsjycR7jN5blkIyE6C9E4u85B3hrXPv
	tG3pCWAGFWDM6yPStNMsVjm5Vp6rKK9/o0kGpvVGQ7w==
X-Google-Smtp-Source: AGHT+IFVpAPkEBgsqd2phzJ5PQ/8I7hk0nfqyimYq1sXGXWWNpSyZbGpfJlRrjeLGnPeIjRM34lALQ==
X-Received: by 2002:a05:6000:420f:b0:3ce:a06e:f248 with SMTP id ffacd0b85a97d-3e642026e45mr2100552f8f.17.1757183844016;
        Sat, 06 Sep 2025 11:37:24 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276d5816sm35344599f8f.25.2025.09.06.11.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:37:23 -0700 (PDT)
Message-ID: <5f2d9137-5dd5-477a-9b65-9a55b4223380@tuxon.dev>
Date: Sat, 6 Sep 2025 21:37:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 10/32] clk: at91: clk-generated: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <c22f1546e25cfe0d4ae3f6f2507b522311190812.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <c22f1546e25cfe0d4ae3f6f2507b522311190812.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113725_605322_10C5D4AF 
X-CRM114-Status: GOOD (  21.42  )
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

On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Added SAMA7D65 and SAM9X75 SoCs to the
> clk-generated changes. Adjust clk name variable order.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-generated.c |  8 ++++----
>   drivers/clk/at91/pmc.h           |  2 +-
>   drivers/clk/at91/sam9x7.c        | 26 ++++++++++----------------
>   drivers/clk/at91/sama7d65.c      | 31 +++++++++++++------------------
>   drivers/clk/at91/sama7g5.c       | 30 +++++++++++-------------------
>   5 files changed, 39 insertions(+), 58 deletions(-)
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
> index 34036f2d0578..0646775dfb1d 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -171,7 +171,7 @@ struct clk_hw * __init
>   at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>   			    const struct clk_pcr_layout *layout,
>   			    const char *name, const char **parent_names,
> -			    struct clk_hw **parent_hws, u32 *mux_table,
> +			    struct clk_parent_data *parent_data, u32 *mux_table,
>   			    u8 num_parents, u8 id,
>   			    const struct clk_range *range, int chg_pid);
>   
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 86d624cd92b2..c4578944611e 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -739,8 +739,8 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
>   	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *main_xtal_name = "main_xtal";
> -	const char * const td_slck_name = "td_slck";
> +	const char *const main_xtal_name = "main_xtal";
> +	const char *const td_slck_name = "td_slck";

Please use the pattern specified in the previous patches to retrieve the
parent names. Same for the other patches in this series.

>   	const char *const md_slck_name = "md_slck";
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
> @@ -748,16 +748,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	int clk_mux_buffer_size = 0;
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> -	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> +	struct clk_hw *usbck_hw;
>   	struct clk_parent_data parent_data[9];
> -	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, td_slck_name));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, md_slck_name));
>   	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>   
> -	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
> +	if (!main_xtal_hw)
>   		return;
>   
>   	regmap = device_node_to_regmap(np);
> @@ -933,13 +930,12 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		sam9x7_pmc->phws[sam9x7_periphck[i].id] = hw;
>   	}
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
> -	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
> +	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
> +	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
>   	for (i = 0; i < ARRAY_SIZE(sam9x7_gck); i++) {
>   		u8 num_parents = 4 + sam9x7_gck[i].pp_count;
> -		struct clk_hw *tmp_parent_hws[6];
>   		u32 *mux_table;
>   
>   		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -954,15 +950,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   			u8 pll_id = sam9x7_gck[i].pp[j].pll_id;
>   			u8 pll_compid = sam9x7_gck[i].pp[j].pll_compid;
>   
> -			tmp_parent_hws[j] = sam9x7_plls[pll_id][pll_compid].hw;
> +			parent_data[4 + j] = AT91_CLK_PD_HW(sam9x7_plls[pll_id][pll_compid].hw);
>   		}
> -		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
> -			       sam9x7_gck[i].pp_count);
>   
>   		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>   						 &sam9x7_pcr_layout,
>   						 sam9x7_gck[i].n,
> -						 NULL, parent_hws, mux_table,
> +						 NULL, parent_data, mux_table,
>   						 num_parents,
>   						 sam9x7_gck[i].id,
>   						 &sam9x7_gck[i].r,
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 7463719260e0..4d47d20e65fb 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1092,22 +1092,20 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>   	const char * const main_xtal_name = "main_xtal";
> +	const char * const td_slck_name = "td_slck";
> +	const char * const md_slck_name = "md_slck";
>   	struct clk_parent_data parent_data[10];
>   	struct pmc_data *sama7d65_pmc;
>   	const char *parent_names[11];
>   	void **alloc_mem = NULL;
>   	int alloc_mem_size = 0;
>   	struct regmap *regmap;
> -	struct clk_hw *td_slck_hw, *md_slck_hw;
> -	struct clk_hw *parent_hws[10];
>   	bool bypass;
>   	int i, j;
>   
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
>   	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>   
> -	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
> +	if (!main_xtal_hw)
>   		return;
>   
>   	regmap = device_node_to_regmap(np);
> @@ -1216,8 +1214,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	sama7d65_pmc->chws[PMC_MCK] = hw;
>   	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
>   
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck", md_slck_index);
> -	parent_data[1] = AT91_CLK_PD_NAME("td_slck", td_slck_index);
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
>   	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
>   	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
>   		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
> @@ -1262,8 +1260,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck", md_slck_index);
> -	parent_data[1] = AT91_CLK_PD_NAME("td_slck", td_slck_index);
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
>   	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
>   	parent_data[3] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
>   	parent_data[4] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
> @@ -1313,13 +1311,12 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   		sama7d65_pmc->phws[sama7d65_periphck[i].id] = hw;
>   	}
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
> -	parent_hws[3] = sama7d65_pmc->chws[PMC_MCK1];
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
> +	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
> +	parent_data[3] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MCK1]);
>   	for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
>   		u8 num_parents = 4 + sama7d65_gck[i].pp_count;
> -		struct clk_hw *tmp_parent_hws[8];
>   		u32 *mux_table;
>   
>   		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -1336,15 +1333,13 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   			u8 pll_id = sama7d65_gck[i].pp[j].pll_id;
>   			u8 pll_compid = sama7d65_gck[i].pp[j].pll_compid;
>   
> -			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
> +			parent_data[4 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
>   		}
> -		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
> -			       sama7d65_gck[i].pp_count);
>   
>   		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>   						 &sama7d65_pcr_layout,
>   						 sama7d65_gck[i].n, NULL,
> -						 parent_hws, mux_table,
> +						 parent_data, mux_table,
>   						 num_parents,
>   						 sama7d65_gck[i].id,
>   						 &sama7d65_gck[i].r,
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index a6824d0accb9..505db97e989b 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -971,10 +971,10 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   {
>   	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
>   	const char * const main_xtal_name = "main_xtal";
> +	const char * const td_slck_name = "td_slck";
> +	const char * const md_slck_name = "md_slck";
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
>   	struct clk_parent_data parent_data[10];
> -	struct clk_hw *td_slck_hw, *md_slck_hw;
> -	struct clk_hw *parent_hws[10];
>   	struct pmc_data *sama7g5_pmc;
>   	void **alloc_mem = NULL;
>   	int alloc_mem_size = 0;
> @@ -983,11 +983,6 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   	bool bypass;
>   	int i, j;
>   
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> -	if (!td_slck_hw || !md_slck_hw)
> -		return;
> -
>   	main_xtal = of_clk_get(np, main_xtal_index);
>   	if (IS_ERR(main_xtal))
>   		return;
> @@ -1097,8 +1092,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[PMC_MCK] = hw;
>   
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck", md_slck_index);
> -	parent_data[1] = AT91_CLK_PD_NAME("td_slck", td_slck_index);
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
>   	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
>   	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7g5_mckx); i++) {
>   		u8 num_parents = 3 + sama7g5_mckx[i].ep_count;
> @@ -1141,8 +1136,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	sama7g5_pmc->chws[PMC_UTMI] = hw;
>   
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck", md_slck_index);
> -	parent_data[1] = AT91_CLK_PD_NAME("td_slck", td_slck_index);
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
>   	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
>   	parent_data[3] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
>   	parent_data[4] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
> @@ -1191,12 +1186,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   		sama7g5_pmc->phws[sama7g5_periphck[i].id] = hw;
>   	}
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
> +	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
>   	for (i = 0; i < ARRAY_SIZE(sama7g5_gck); i++) {
>   		u8 num_parents = 3 + sama7g5_gck[i].pp_count;
> -		struct clk_hw *tmp_parent_hws[8];
>   		u32 *mux_table;
>   
>   		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -1211,15 +1205,13 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   			u8 pll_id = sama7g5_gck[i].pp[j].pll_id;
>   			u8 pll_compid = sama7g5_gck[i].pp[j].pll_compid;
>   
> -			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
> +			parent_data[3 + j] = AT91_CLK_PD_HW(sama7g5_plls[pll_id][pll_compid].hw);
>   		}
> -		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
> -			       sama7g5_gck[i].pp_count);
>   
>   		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>   						 &sama7g5_pcr_layout,
>   						 sama7g5_gck[i].n, NULL,
> -						 parent_hws, mux_table,
> +						 parent_data, mux_table,
>   						 num_parents,
>   						 sama7g5_gck[i].id,
>   						 &sama7g5_gck[i].r,


