Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A93DCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qnerf/c2JmfLDaWdwE5/5ZjM5iHDZF/Oj+pWXPinn3Y=; b=dCIk48VEKaaRPX4otNf+il5Re6
	58UaAcMy5n6AXojUsM0lkr8ElicNJl7zylQZDfC92nejuHV3aX81ytQKICqBZMtE9+HAGl3xVQ0n6
	H2YsO6mF5g/Wujm/G8KM/3H7ISTGFK3Rp6ORTdk5Jth91CwrG/ZqXiUJ67zbcSKqHe0Xcb3OZBT5C
	nkVxlIOOHQZsBSG1FA7zpdVMQAgqi/nCVpv57iT/viQttb+7kHzGhcJumK5WA5YJAjnnu5oUurJ3d
	uHaunpaSk0CW38Z1PGusK4//g6rELPvZU8/2QqM2TbFG0PBOLiWsPLPEJg1PFUuJOe7n970L4DkEk
	+2nBKNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxuW-00000008HSj-0yl7;
	Sat, 06 Sep 2025 18:45:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxkM-00000008GI3-0TIr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:34:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3dcce361897so2049040f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183684; x=1757788484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qnerf/c2JmfLDaWdwE5/5ZjM5iHDZF/Oj+pWXPinn3Y=;
        b=XJI5Dn7BY7k+q8E/3MRdwb3+0ZBInuHWqQ9rNBQKYhT+uLYKn8qYzNIEMt91ycuTOP
         H3vVw6Q7HSUHz6Jre5wWbIYsFLDl89zqU74DCM3Jv9Dlmbmazacy1dpcQTzZcbWqn8XC
         Hswt2CZZ3QcZ8haTpaq+jZPpkHLf6XBQ+s06YB0q1iOB2ilSe9ijghU+cZ06SWQMaXF/
         HcpCy3n4uGYthTti8WhK+SeazqaKgrco4J8NMJuS8Sf1POjqrzinf5EoJmRfAZzRGdfi
         RXTTDrRjgpczWpCQ6+2LbRBrkEhRp+Vi7+obKZWqBdJ3MrMTSidwPYEcexHLgdNQ0az/
         uVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183684; x=1757788484;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qnerf/c2JmfLDaWdwE5/5ZjM5iHDZF/Oj+pWXPinn3Y=;
        b=V+a5RWcdMFSqerloeSojUVNuKH1aPfj1GT+DjOCZ1Qy/FS4LJyYXN7pyb5vlWCrH/w
         AH0UvxjOX5uSbXazt2N4uxzKh7mHu8wTWBaWddJVUaHnKMiZaSIEA1cD7EPoBCLmJIMQ
         RbOYn5T9ZBaR0Jzdnjf5MJFgIn0CqaK431G88GI6JWYGjXvOu2jMfBAfwfwI3hu7wyP4
         tovpnSQ+rOqs6GnqU90eePQISClx398uO5GVEvDlWLBNL660QZw4PbJH/MnRp/k8Kg5O
         8WXY+w2sG5fYBDnYPCwxzPHDMqzCiNBACIZyyer9yiPkWCw4JrtPmvZU23hEo1i/I84D
         5ppQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdT4ahzsxd9mS9TYuewN45lZ3RJ7eFAvQmP3c7NzMSyfz4qqCQWnXpDwED9Nxq7pm5q9NPrp5efflp+gsREbio@lists.infradead.org
X-Gm-Message-State: AOJu0YzkPhjzx5TbBtxZrQrCsRWBx7nbUmGZXF7POPIzb1N2209lS33Q
	eLMvYUgLkcDsOifrdydF82U9ajOW2qfN25R/jTBQxhNoPDUDoR1C3eHVzlAhrWA/Up0pActzvwX
	Tu1Qb
X-Gm-Gg: ASbGnctJa/f7/+FApaBkq7C6P7sTTqaUXL/ED21gzm/FH2IE5PWnx9tU7CaeYhkDE1W
	EK7GWhmM1CZq+nQXnwCZ+1QjmEqqKA8OXsEUN9fyo/xKPPnmwChZOfisN4bh1Wo87R0pUDkvFlk
	a8AOU0giLJOgxaOhxALDJUaFJcQmPFK7cB2P7vqTQMrI5hDW+FLlpmGBn78a6mTk6Yujtz+3VWO
	tN9SCo1/XHVWuVWQzgTI+xVSpH3i1tIYuKdMLImpOAjPxnFe2yeNgil5sms26VQ/jRwc0ajNTUY
	Z/E8K0laT0Cb9LajdN+zwcsS9loUtGX52zKtXy5AiudBj/bM4hnGcU0DT9VU1lVyWnYkA/e8cMe
	1Z+fjCHGIFVILEHU8mH7WtKO71eulE2w=
X-Google-Smtp-Source: AGHT+IGm0fa7QgRHF7b6Hmgbln8RYhjeirstMPYGWUhdpZoD+rT+0Ec/cadTeuSZa533WVVHZ2EoIA==
X-Received: by 2002:a5d:5f88:0:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3e6440eef4emr1810219f8f.39.1757183684539;
        Sat, 06 Sep 2025 11:34:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3df4fd372c1sm13719925f8f.29.2025.09.06.11.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:34:44 -0700 (PDT)
Message-ID: <ad360a5f-6fff-4438-ace1-07632ea48156@tuxon.dev>
Date: Sat, 6 Sep 2025 21:34:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 05/32] clk: at91: clk-peripheral: switch to
 clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <657143d460ed5f2f726413385895c0c80ddddef9.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <657143d460ed5f2f726413385895c0c80ddddef9.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113446_161108_9D0E7A09 
X-CRM114-Status: GOOD (  17.73  )
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
> Use struct clk_parent_data instead of parent_hw for peripheral clocks.

I would prefer a description as provided for other conversions:

Use struct clk_parent_data instead of struct parent_hw as this leads
to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
conversion of existing SoC specific clock drivers from parent_names to
modern clk_parent_data structures.


> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X7 SoCs to the use the
> structs.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-peripheral.c | 16 ++++++++--------
>   drivers/clk/at91/pmc.h            |  4 ++--
>   drivers/clk/at91/sam9x7.c         |  2 +-
>   drivers/clk/at91/sama7d65.c       |  2 +-
>   drivers/clk/at91/sama7g5.c        |  2 +-
>   5 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
> index c173a44c800a..ed97b3c0a66b 100644
> --- a/drivers/clk/at91/clk-peripheral.c
> +++ b/drivers/clk/at91/clk-peripheral.c
> @@ -97,7 +97,7 @@ static const struct clk_ops peripheral_ops = {
>   
>   struct clk_hw * __init
>   at91_clk_register_peripheral(struct regmap *regmap, const char *name,
> -			     const char *parent_name, struct clk_hw *parent_hw,
> +			     const char *parent_name, struct clk_parent_data *parent_data,
>   			     u32 id)
>   {
>   	struct clk_peripheral *periph;
> @@ -105,7 +105,7 @@ at91_clk_register_peripheral(struct regmap *regmap, const char *name,
>   	struct clk_hw *hw;
>   	int ret;
>   
> -	if (!name || !(parent_name || parent_hw) || id > PERIPHERAL_ID_MAX)
> +	if (!name || !(parent_name || parent_data) || id > PERIPHERAL_ID_MAX)
>   		return ERR_PTR(-EINVAL);
>   
>   	periph = kzalloc(sizeof(*periph), GFP_KERNEL);
> @@ -114,8 +114,8 @@ at91_clk_register_peripheral(struct regmap *regmap, const char *name,
>   
>   	init.name = name;
>   	init.ops = &peripheral_ops;
> -	if (parent_hw)
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = &parent_name;
>   	init.num_parents = 1;
> @@ -448,7 +448,7 @@ struct clk_hw * __init
>   at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
>   				    const struct clk_pcr_layout *layout,
>   				    const char *name, const char *parent_name,
> -				    struct clk_hw *parent_hw,
> +				    struct clk_parent_data *parent_data,
>   				    u32 id, const struct clk_range *range,
>   				    int chg_pid, unsigned long flags)
>   {
> @@ -457,7 +457,7 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
>   	struct clk_hw *hw;
>   	int ret;
>   
> -	if (!name || !(parent_name || parent_hw))
> +	if (!name || !(parent_name || parent_data))
>   		return ERR_PTR(-EINVAL);
>   
>   	periph = kzalloc(sizeof(*periph), GFP_KERNEL);
> @@ -465,8 +465,8 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
>   		return ERR_PTR(-ENOMEM);
>   
>   	init.name = name;
> -	if (parent_hw)
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = &parent_name;
>   	init.num_parents = 1;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index b43f6652417f..b6f2aca1e1fd 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -226,13 +226,13 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
>   
>   struct clk_hw * __init
>   at91_clk_register_peripheral(struct regmap *regmap, const char *name,
> -			     const char *parent_name, struct clk_hw *parent_hw,
> +			     const char *parent_name, struct clk_parent_data *parent_data,
>   			     u32 id);
>   struct clk_hw * __init
>   at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
>   				    const struct clk_pcr_layout *layout,
>   				    const char *name, const char *parent_name,
> -				    struct clk_hw *parent_hw,
> +				    struct clk_parent_data *parent_data,
>   				    u32 id, const struct clk_range *range,
>   				    int chg_pid, unsigned long flags);
>   
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index edd5fd3a1fa5..d7dc5f381ebe 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -922,7 +922,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
>   							 &sam9x7_pcr_layout,
>   							 sam9x7_periphck[i].n,
> -							 NULL, sam9x7_pmc->chws[PMC_MCK],
> +							 NULL, &AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]),
>   							 sam9x7_periphck[i].id,
>   							 &range, INT_MIN,
>   							 sam9x7_periphck[i].f);
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 17725c175d3b..372e530f4107 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1306,7 +1306,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   							 &sama7d65_pcr_layout,
>   							 sama7d65_periphck[i].n,
>   							 NULL,
> -							 sama7d65_mckx[sama7d65_periphck[i].p].hw,
> +							 &AT91_CLK_PD_HW(sama7d65_mckx[sama7d65_periphck[i].p].hw),
>   							 sama7d65_periphck[i].id,
>   							 &sama7d65_periphck[i].r,
>   							 sama7d65_periphck[i].chgp ? 0 :
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index 733e4fc6a515..f28fe419ae5e 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -1181,7 +1181,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   						&sama7g5_pcr_layout,
>   						sama7g5_periphck[i].n,
>   						NULL,
> -						sama7g5_mckx[sama7g5_periphck[i].p].hw,
> +						&AT91_CLK_PD_HW(sama7g5_mckx[sama7g5_periphck[i].p].hw),
>   						sama7g5_periphck[i].id,
>   						&sama7g5_periphck[i].r,
>   						sama7g5_periphck[i].chgp ? 0 :


