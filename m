Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27D4CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 18:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZGRIEWukxN3mIFY84X98vKWbLkYVpFz2wxdmQq/pdw=; b=ABQNaTwRWT9G+uXumS5CpfH9DQ
	mxh4nq321cYpInGHiFjmZvpMzOJ3WBOygYLd1fmpL8b4gfuJJQuDyweMfHwPxdr6XDCjgYCq0M0oV
	cL0Io8zZJi+qAcGZu3wDLP+i49+bagn09l2faDXarSK3/4dSWbpSI1H2dwAmfYwdq3WMdVGo7pkMH
	q/m/DBuckP0wOzRUALPpVQiLl11ogRy12R8V37OEo3O/Xvo04a3W4H/8yM0GHHsn3Ikf3Z4Cs/GZg
	cW8A3C+Ng6BvQXVNnNus6lfmtAIxGuKAyHLAdwWFxebynCydxxOMIt+1kjC/mONtW1Mkte30Wg5E7
	AXOU08jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuy06-00000008IgQ-3b3X;
	Sat, 06 Sep 2025 18:51:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxlh-00000008GRX-0Hsu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:36:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3dae49b1293so1663096f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183767; x=1757788567; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kZGRIEWukxN3mIFY84X98vKWbLkYVpFz2wxdmQq/pdw=;
        b=Bvo6QJMoBvy1D10pQBo6mhM/Xemi0KO2Fg/w3zIWNCUcf3WdXroYbKf03aH0B+pxic
         azzkOMq3Ca3YrSSxPs/KUlWfeeGo7inEvxe4RSrTAuLWJpAcBpjYmGcKSkOafJ5y/MdV
         xJi/eP7nF45l9nDzKOG5KHOsaQpczPWsA+jTsLLNFEwcmDntNE4azeIw9OzQSiEiMpJY
         aCQ8AEZZlb8A9qCGUfwPNlS0dVr28IYNU/LQ9qQGZSqQRztW1myMbPub2tkISWpZdNYF
         Oz/gm32QNbdSg7GcMHUOjCkUrPXeZZybhVK4WQWf+mkPAQTg7fbYGRJBwhzVwdLPLyhx
         McCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183767; x=1757788567;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZGRIEWukxN3mIFY84X98vKWbLkYVpFz2wxdmQq/pdw=;
        b=NYqgg7K/Pc6Oj7Et3cC3QtXxLhDWEnbwHNMWfr87J45Pl/mCJA1SOGZUZ1o+h6x8dl
         JC2lVUbPDg9/uIySvtAJKOyuAfQwT35gxbsjQFiHj9n1sL4oWRcdBtjV+i2aMKzGqyXJ
         a9V2fMFnfNlUnh7CfQ64Cg4d2PJVLuLYEz+WW8aR+p+qnpLudUcLAanwlVSESvoNPf6l
         YKzLkPxJTz94kqXlBEJOgMzb5LT3t1u7YigcBTYKt6dbt51nQ0r4lj8AxdT651k2lozq
         ewEM6I4E6J85kvnpSuP12LRZCVS6Uy26QyxfAKMKSbBW4fUrsTFIvb2ldrbCmv8I7Cid
         fkGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOeXLyReR50cRky6+i25vI/H+hq1eVP4vwwYBW9l8qxjbrmcFl7dLxArXuNcdGd5NVVa65RPJ+DBX7UCBm6Twm@lists.infradead.org
X-Gm-Message-State: AOJu0YwnSj03gNW2hoC39KaqFPsvr7EREvsK26q+bngrqhMfEEC2qfXJ
	FRHwQQClf7jn3G0NJbvH5JCAOlYfqv0YSXgv6wHJ59JaZvPY9QEKGNtedMFZRjnOqhk=
X-Gm-Gg: ASbGncsSxUaZLY25gCA/gWCWeho6VT6gD8y9cxbIhXzDbMXkLnTwe9yQEXFw0k43oKV
	VZ39pNwBAV55pCL2tafySdUG9jtNoZN+4SIyszBy6r/pmJIC1UY9PgcKIfFyHIw2DiY+DkY831/
	6YDDe0tB+aSo5y2ekF48zJP3SOJKJB89jSAM1VzzCE7zbcZ0zph4Ev3fyaiawTUUtk0tXiI4cFT
	RblCgbLKcjwfwfD4OKzF/2itb5p539pAQwxUyKlvo8TKGPaP9wsng0J0po2EmGgWfWzON7FJxvB
	LLTrjxGsplTavt9Z7XyF6XG6GG4Xfj5hVLNE+sBH4WbJYxEeTRGT9j1xFdmUEwHBZS06CUptrTm
	mUaPKuPcKXLxhIOBauGE+ZNN2o2k5+ZY=
X-Google-Smtp-Source: AGHT+IFCQ7j3fzaxDu8HRsqJKFlZ2gT3gMukskC95rd6UuJbW5oD2AuxWfVxGPZTnpYTtbY01pa3Bw==
X-Received: by 2002:a05:6000:200f:b0:3e4:7f66:8ae1 with SMTP id ffacd0b85a97d-3e64317ef51mr1878382f8f.30.1757183767538;
        Sat, 06 Sep 2025 11:36:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e18537589dsm9919016f8f.54.2025.09.06.11.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:36:06 -0700 (PDT)
Message-ID: <d35401da-7db8-4bfe-90cd-042da909c940@tuxon.dev>
Date: Sat, 6 Sep 2025 21:36:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 07/32] clk: at91: clk-utmi: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <04739269232f6c7ffbe9308a2b993e6b6eb883c8.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <04739269232f6c7ffbe9308a2b993e6b6eb883c8.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113609_123692_74B884A7 
X-CRM114-Status: GOOD (  22.19  )
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
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-utmi.c | 16 ++++++++--------
>   drivers/clk/at91/pmc.h      |  4 ++--
>   drivers/clk/at91/sama7g5.c  | 25 +++++++++++++++----------
>   3 files changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
> index b991180beea1..38ffe4d712a5 100644
> --- a/drivers/clk/at91/clk-utmi.c
> +++ b/drivers/clk/at91/clk-utmi.c
> @@ -144,7 +144,7 @@ static struct clk_hw * __init
>   at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>   				struct regmap *regmap_sfr,
>   				const char *name, const char *parent_name,
> -				struct clk_hw *parent_hw,
> +				struct clk_parent_data *parent_data,
>   				const struct clk_ops *ops, unsigned long flags)
>   {
>   	struct clk_utmi *utmi;
> @@ -152,7 +152,7 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>   	struct clk_init_data init = {};
>   	int ret;
>   
> -	if (!(parent_name || parent_hw))
> +	if (!(parent_name || parent_data))
>   		return ERR_PTR(-EINVAL);
>   
>   	utmi = kzalloc(sizeof(*utmi), GFP_KERNEL);
> @@ -161,8 +161,8 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>   
>   	init.name = name;
>   	init.ops = ops;
> -	if (parent_hw)
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = &parent_name;
>   	init.num_parents = 1;
> @@ -185,10 +185,10 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>   struct clk_hw * __init
>   at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
>   		       const char *name, const char *parent_name,
> -		       struct clk_hw *parent_hw)
> +		       struct clk_parent_data *parent_data)
>   {
>   	return at91_clk_register_utmi_internal(regmap_pmc, regmap_sfr, name,
> -			parent_name, parent_hw, &utmi_ops, CLK_SET_RATE_GATE);
> +			parent_name, parent_data, &utmi_ops, CLK_SET_RATE_GATE);
>   }
>   
>   static int clk_utmi_sama7g5_prepare(struct clk_hw *hw)
> @@ -287,8 +287,8 @@ static const struct clk_ops sama7g5_utmi_ops = {
>   
>   struct clk_hw * __init
>   at91_clk_sama7g5_register_utmi(struct regmap *regmap_pmc, const char *name,
> -			       const char *parent_name, struct clk_hw *parent_hw)
> +			       const char *parent_name, struct clk_parent_data *parent_data)
>   {
>   	return at91_clk_register_utmi_internal(regmap_pmc, NULL, name,
> -			parent_name, parent_hw, &sama7g5_utmi_ops, 0);
> +			parent_name, parent_data, &sama7g5_utmi_ops, 0);
>   }
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index e32a5e85d08f..d9a04fddb0b1 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -299,10 +299,10 @@ at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
>   struct clk_hw * __init
>   at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
>   		       const char *name, const char *parent_name,
> -		       struct clk_hw *parent_hw);
> +		       struct clk_parent_data *parent_data);
>   
>   struct clk_hw * __init
>   at91_clk_sama7g5_register_utmi(struct regmap *regmap, const char *name,
> -			       const char *parent_name, struct clk_hw *parent_hw);
> +			       const char *parent_name, struct clk_parent_data *parent_data);
>   
>   #endif /* __PMC_H_ */
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index f816a5551277..c4723b875a1d 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -975,30 +975,33 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   	void **alloc_mem = NULL;
>   	int alloc_mem_size = 0;
>   	struct regmap *regmap;
> -	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> +	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
>   	struct clk_hw *td_slck_hw, *md_slck_hw;
>   	struct clk_parent_data parent_data[2];
>   	struct clk_hw *parent_hws[10];
> +	struct clk *main_xtal;
>   	bool bypass;
>   	int i, j;
>   
>   	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
>   	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> -	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
> +	if (!td_slck_hw || !md_slck_hw)
> +		return;
>   
> -	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
> +	main_xtal = of_clk_get(np, main_xtal_index);

Maybe:

i = of_property_match_string(np, "clock-names", "main_xtal");
main_xtal_name = of_clk_get_parent_name(np, i);

And move the:

main_xtal = of_clk_get()

above in the switch/case where the main_xtal clock is needed to get its rate.

> +	if (IS_ERR(main_xtal))
>   		return;
>   
>   	regmap = device_node_to_regmap(np);
>   	if (IS_ERR(regmap))
> -		return;
> +		goto put_main_xtal;
>   
>   	sama7g5_pmc = pmc_data_allocate(PMC_MCK1 + 1,
>   					nck(sama7g5_systemck),
>   					nck(sama7g5_periphck),
>   					nck(sama7g5_gck), 8);
>   	if (!sama7g5_pmc)
> -		return;
> +		goto put_main_xtal;
>   
>   	alloc_mem = kmalloc(sizeof(void *) *
>   			    (ARRAY_SIZE(sama7g5_mckx) + ARRAY_SIZE(sama7g5_gck)),
> @@ -1039,19 +1042,18 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   				switch (sama7g5_plls[i][j].p) {
>   				case SAMA7G5_PLL_PARENT_MAINCK:
>   					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
> -					hw = sama7g5_pmc->chws[PMC_MAIN];
> +					parent_rate = clk_hw_get_rate(sama7g5_pmc->chws[PMC_MAIN]);
>   					break;
>   				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
>   					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name,
>   									  main_xtal_index);
> -					hw = main_xtal_hw;

here:

                                        main_xtal = of_clk_get_by_index(np, i);

> +					parent_rate = clk_get_rate(main_xtal);

                                        clk_put(main_xtal);
>   					break;
>   				default:
>   					/* Should not happen. */
>   					break;
>   				}
>   
> -				parent_rate = clk_hw_get_rate(hw);
>   				if (!parent_rate)
>   					return;
>   
> @@ -1135,7 +1137,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   			sama7g5_pmc->chws[sama7g5_mckx[i].eid] = hw;
>   	}
>   
> -	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL, main_xtal_hw);
> +	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL,
> +					    &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index));
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
> @@ -1233,7 +1236,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama7g5_pmc);
>   
> -	return;
> +	goto put_main_xtal;
>   
>   err_free:
>   	if (alloc_mem) {
> @@ -1243,6 +1246,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   	}
>   
>   	kfree(sama7g5_pmc);
> +put_main_xtal:
> +	clk_put(main_xtal);
>   }
>   
>   /* Some clks are used for a clocksource */


