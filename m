Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD81CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkLNLWcUc4VcQy1RdKOzXNlhz8HxfGsE6Q1JJE3irRY=; b=sZm+0mOuzgk5TPWAhQ1J5VPXql
	xXzdOdbLd9a1LqRygxuTrjXV/AZdaobtzyPZsgN6oGYiqpyViHRk/SAyGmkGecpNbrCIFHvYvxM2v
	86+lf4l0xcFdHup+C29m/TZ821QB8EsAvqAAEIoyaOZwEzRO0ICxhugEjqxareiECINl0bX5xIj/K
	V7y5q0GNlSq7zyg6KwV28PKXVTraDEq/OCKL8yJX7WZ4Z+iOUxx73lOwrePJKGfRB3HIBRpq9VjYP
	pESwzOB4TWJ6XAErZYWbutsPAsXQdQ6tDq59FkXlS+EYrQbbCPTi6d+ZEMCFEExVOztYlrN+FWSPP
	P7gEKy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvIv-0000000Ejlx-1Wa8;
	Mon, 20 Oct 2025 19:12:25 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvIt-0000000Ejkw-1FfW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:12:24 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-63c11011e01so7557598a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987541; x=1761592341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KkLNLWcUc4VcQy1RdKOzXNlhz8HxfGsE6Q1JJE3irRY=;
        b=PeOc5rhb42VesOi+wezCDbwEStkunjr620zdIqyej4T5AQBOcS5YEFmNfp6I93D7He
         C2eqQZmTeV89XMWJfrkXq4Ys1XzASIgRpQ2TnOWKaSkJXs8vqkgYFxsMBH/DOmyYWRKJ
         meS+eIxyVDk7hmHFwAanpBAEXg5YlgGjuyPIv8UTwyY6oM0yVXD0mhPp3SPNn+97QPD7
         34JW+n8mggnQGcxWBTAksm7WbDmwcEMUwO7aQz3fOzOX/Nms4yfiJI94Murw4nErCG3u
         pJrX+Gd1j78JQ1/43IXMaaUptZdL0QOfF/Y1Ddan1Xfw9Do+xMkZ3R9GnAPqx7midDWs
         ZxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987541; x=1761592341;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkLNLWcUc4VcQy1RdKOzXNlhz8HxfGsE6Q1JJE3irRY=;
        b=I4qiKxiaHhvdZGVrI7G1Ac6wyDMMu0DpbCqxPm4POeD5EQ0hXRD6GbJRYvNJMOIm9m
         L7/P5wWqEwYMm46vBiwn/xtIqEe9krDuumet3u6TSr/7SDHpNuNEKANeOxgOyAHMrIeT
         Ohp5CNDIpMJSR7AN/y60BK8MFSRnJDUy3GvqKY4AxuRG50XMZPbpRxMRZJkKS1zd1E9p
         uC6xXMLT7al06+txijT86tHn4lji8AnGG05ymtcMYBPemC4ZErcFB6VxlwMsSvarAqeS
         w7GJmo015QGj0u1sidBXXLYe4RJZePtogw7IFH/8JhqOaFG8DsnZ8NWEXbvurowcwYP6
         L8gA==
X-Forwarded-Encrypted: i=1; AJvYcCXyOQszA8ObI74Xvn6ED5t8II1kAsASk4DrIOyOwtU4vOWzZ0Fmru6JVkaHhKFHASuexA//YFzHdpy/vFEpLyjd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5IarzzXVNWwB1QgdSBHVjrIb+CVw94uMeYF+7D+TWTEmkjzYb
	EoxgstdxJ0my7Oiflb3L9Ol7pGqlhXS8e7L5Iplszw+A4CkM3SJ5OJn0Vfks2ke+IrY=
X-Gm-Gg: ASbGncuWLvelAj8moViwOFZEIL4P+EUvZ8oTS07Ayrlz4GzkEFH4zYgTSCzU0S5A4lL
	HNfXxPan9X163KEKQKxo11W7rgAtAHUwdkpzvvjXBlV/DBAEDzb9evtKeMOK2kurWpj14JpNvGw
	zFfHARefhwEphKqjlGcHX4xBaBxtL2tm4IuvhYHSz3JsLR2U9QnN29tECfC5x9FYGeCiCRg75V8
	xj/NgDJWIT/uqIQI7Kg79erv0T0HcOmrC+CdVeJGdg71UJ1AIgX/TccoBqWRjhVdaQmKKl+AoYU
	Wg9p7kAW4CEigzs5mIFcJaFVqImMAfGzfjxOI3yzDfDA68oKsBU+eBcGh+BH9KLrsRVTScPe4t6
	OWbX+4WCJtXbQ9NMPrrvCZTPs0AFomtMxdND7bOueSPdJMTxGQUIHqhAvgtYD7hW2tB2++8KGJz
	62z2ZI2DLZFasnprWKWWY=
X-Google-Smtp-Source: AGHT+IG81276e7uaBZBiP1Z3ZjOuhvsbjXNfOAQY81Ajp6ESbGOgBPYu59ysj+jcPMn9WrMI2xyoow==
X-Received: by 2002:a05:6402:40c5:b0:637:e4d1:af00 with SMTP id 4fb4d7f45d1cf-63c1f677665mr13504584a12.10.1760987540877;
        Mon, 20 Oct 2025 12:12:20 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48acf60dsm7304270a12.18.2025.10.20.12.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:12:20 -0700 (PDT)
Message-ID: <81e23b35-5a31-4f4c-a65a-ccf069c000a5@tuxon.dev>
Date: Mon, 20 Oct 2025 22:12:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/31] clk: at91: clk-h32mx: add support for parent_hw
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <9d37104c581548a995e20a86f3501bee10b6acce.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <9d37104c581548a995e20a86f3501bee10b6acce.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121223_455368_6D016BB8 
X-CRM114-Status: GOOD (  20.64  )
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
> Add support for parent_hw in h32mx clock driver.

s/parent_hw/parent_data. Same for the patch title. And the above paragraph
should be updated accordingly.

The rest LGTM.

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-h32mx were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-h32mx.c | 11 +++++++----
>  drivers/clk/at91/dt-compat.c |  2 +-
>  drivers/clk/at91/pmc.h       |  2 +-
>  drivers/clk/at91/sama5d2.c   |  2 +-
>  drivers/clk/at91/sama5d4.c   |  2 +-
>  5 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
> index 1e6c12eeda10..4b709f9bd831 100644
> --- a/drivers/clk/at91/clk-h32mx.c
> +++ b/drivers/clk/at91/clk-h32mx.c
> @@ -83,10 +83,10 @@ static const struct clk_ops h32mx_ops = {
>  
>  struct clk_hw * __init
>  at91_clk_register_h32mx(struct regmap *regmap, const char *name,
> -			const char *parent_name)
> +			const char *parent_name, struct clk_parent_data *parent_data)
>  {
>  	struct clk_sama5d4_h32mx *h32mxclk;
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	int ret;
>  
>  	h32mxclk = kzalloc(sizeof(*h32mxclk), GFP_KERNEL);
> @@ -95,8 +95,11 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
>  
>  	init.name = name;
>  	init.ops = &h32mx_ops;
> -	init.parent_names = parent_name ? &parent_name : NULL;
> -	init.num_parents = parent_name ? 1 : 0;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
> +	else
> +		init.parent_names = &parent_name;
> +	init.num_parents = 1;
>  	init.flags = CLK_SET_RATE_GATE;
>  
>  	h32mxclk->hw.init = &init;
> diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
> index 3285e3110b58..ccdeba3a1130 100644
> --- a/drivers/clk/at91/dt-compat.c
> +++ b/drivers/clk/at91/dt-compat.c
> @@ -201,7 +201,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> -	hw = at91_clk_register_h32mx(regmap, name, parent_name);
> +	hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
>  	if (IS_ERR(hw))
>  		return;
>  
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index db067177e6ef..64faaa8123c9 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -180,7 +180,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>  
>  struct clk_hw * __init
>  at91_clk_register_h32mx(struct regmap *regmap, const char *name,
> -			const char *parent_name);
> +			const char *parent_name, struct clk_parent_data *parent_data);
>  
>  struct clk_hw * __init
>  at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
> diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
> index 7904f2122ed7..8c7ff0108b41 100644
> --- a/drivers/clk/at91/sama5d2.c
> +++ b/drivers/clk/at91/sama5d2.c
> @@ -276,7 +276,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  
>  	sama5d2_pmc->chws[PMC_MCK] = hw;
>  
> -	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
> +	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div", NULL);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
> index 7cda8032653e..04c848cd7001 100644
> --- a/drivers/clk/at91/sama5d4.c
> +++ b/drivers/clk/at91/sama5d4.c
> @@ -214,7 +214,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
>  
>  	sama5d4_pmc->chws[PMC_MCK] = hw;
>  
> -	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
> +	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div", NULL);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  


