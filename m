Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB826CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQWSx8bT6V+HM/W9ets+QXcD0v/UrJQL7ZZAexBVPTE=; b=fZKO7m2zrDy5yuDeMNwlk/HgTr
	cA9hT3hqHpm5vsGwNA/eBvraE00BnWUvdaQhdjGehMuAHPHW2hhI3JhbnEsVR3IvuD6WIKIFK4r7Z
	Q43HCI8gh48VwY36gcre72TA+qCpbo35SI19FiaWx/VZl7D+TwBN5pUP6AEXfR4d6pnZZK7kgmDRb
	jApuhmXpenzXnMws2GDCpbl9SHxMmw0azMtBXZNr5vUrFzaaSwSN3WJq/I8aN07NbcznLzUgPQTsQ
	Hj6aIMMN0DV/Vv/qD18JK4JmqbWWt0uTD5zk1S2+KSfs3wlmT45WJqv6K+Ok2pry5vHtJdp3PRWpP
	aSwqHz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriHg-000000031uk-0QnV;
	Thu, 28 Aug 2025 19:27:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urg3R-00000002MSM-1RLQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 17:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756400692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQWSx8bT6V+HM/W9ets+QXcD0v/UrJQL7ZZAexBVPTE=;
	b=ASKZqSnfPkpYDBjnfdsx2n+9Oq7L7nHGGc6gDJwiB8aZaLCOPpmsHE9fC16WGikrKKjAob
	Zg6bC5vGptomCzV6Pa2yCUJCxFsMiDgERT1Ayy5BbMDpPewvng/CcwY+nDn9fsQmKXpHpm
	fYyKRcTq4RMh3av9A6fGXNkKM1dfwLU=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394--woaIxi_NE2vvbdPlwz5DQ-1; Thu, 28 Aug 2025 13:04:50 -0400
X-MC-Unique: -woaIxi_NE2vvbdPlwz5DQ-1
X-Mimecast-MFC-AGG-ID: -woaIxi_NE2vvbdPlwz5DQ_1756400690
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-524d0b0e994so245818137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 10:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756400690; x=1757005490;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQWSx8bT6V+HM/W9ets+QXcD0v/UrJQL7ZZAexBVPTE=;
        b=jb6iMXwQNuTa/QbYPIeV1kME//2ljVvL+hGy/+O+k81oj0rITWnDshEXqnVViKj7V1
         kVevEREGDdichrF1aAVxXzV49gD7pzSRmb9ekYAQ+TeVcMGqzX5IWrPw65M/XjU/9yKT
         U7SyzpY6cU4VdgU4BXOS4/2/amZ2j9iLtBZI5xC8tET6OTluU5Wc4oetj9z9uK79v6yA
         0UkR+9QsMe/xjxyk//6sraJnIs9od6IsJMOpmapqYjrHC0j4HV++OMUSA6/vGPdJ2dl2
         EBJsb4mCUwQChxl+qut6B8T/wowgKRZ8E7pXyDeabQNZI8vMd1mP7NUGD6uv9Omux1g4
         FU/g==
X-Forwarded-Encrypted: i=1; AJvYcCXWm5eb3tUPcqhOYjHXVGK1tVnfBGNmNHWPBvPHoPs9w9coW1EXzwKwGuWQKeRv36iMsivPUpUTSGOokYFgDhsg@lists.infradead.org
X-Gm-Message-State: AOJu0YxFC0YMPPPtlTXfdYwVzyleelh2tLzPQy+3UaYqrXhMMxCShZqS
	9efVGZlyfxlUEhZEQhNwJA5iljny3l8S9QjsNdB6u0jyAy84bLHj0CY4I13vbOwbPJdsT46YSjN
	BdRqvI6ZqdwY+3bSzFY4dH5SSOSHmhZOMSrkKTu8pomyWC58z40xm66sNfy5GJhy7OoN3LAZiAK
	zF
X-Gm-Gg: ASbGncscStbvrGA4x7DqU6A7wbclU407ICjqXjaqmORNpfLFob0XksHaTXhw97VvIFN
	iA+RupBK10YslAS70x7KJhLDiYqPCIe115ecI+G1c+k+aOhxF+LiR0eflvdzAxvCcrlflPp7C/a
	ZGAVffrFiFI4y6gQtOZlTcwZRNC5JV5Eqhcptj7wNM4D+mXnJpIeMp4GytvVl1tyGvpc21Nm2Ch
	mdVFaTIdmE9+3IIU1yhDKwHTi6HctGNsvWvp3jTL2yf7pjjaktTVQWjY/fs0NGDU4esleA6CDIs
	y7LMPDITj/dZ76YeBO7BXrhAGH6YvfytTTTQd5Ab92XQQzVytHbXd6HDUj/y00S7y/EbSuXYZGn
	WPagjeDp+guRBCxwQxoc=
X-Received: by 2002:a05:6102:945:b0:521:b9f2:a5ca with SMTP id ada2fe7eead31-521b9f2aa92mr5454488137.13.1756400689802;
        Thu, 28 Aug 2025 10:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK33mKzOVRkyg/syyoWlGXnfN23Xh+fbGd+pr1oPcAGqsYr4OfVhyh6dTOdU8MTFy+2f9q6Q==
X-Received: by 2002:a05:6102:945:b0:521:b9f2:a5ca with SMTP id ada2fe7eead31-521b9f2aa92mr5454448137.13.1756400689195;
        Thu, 28 Aug 2025 10:04:49 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc15c83bbasm12882885a.60.2025.08.28.10.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:04:48 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:04:46 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan.Wanner@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 04/32] clk: at91: clk-sam9x60-pll: use clk_parent_data
Message-ID: <aLCMLs6FLp5TZAA8@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <2e7902b73fa6bb5bc8698b3ca0fa7cef583b76f5.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
In-Reply-To: <2e7902b73fa6bb5bc8698b3ca0fa7cef583b76f5.1752176711.git.Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l2lTYQmNden8BBbp4EdzC0Dijt_8MbjRlCNNMNcxU_g_1756400690
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_100453_454987_457F8984 
X-CRM114-Status: GOOD (  26.78  )
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

On Thu, Jul 10, 2025 at 01:06:57PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures. As clk-sam9x60-pll need to know
> parent's rate at initialization we pass it now from SoC specific drivers.
> This will lead in the end at removing __clk_get_hw() in SoC specific
> drivers (that will be solved by subsequent commits).
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X75 SoCs to the change set.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
>  drivers/clk/at91/pmc.h             |  5 +++--
>  drivers/clk/at91/sam9x60.c         |  8 +++++---
>  drivers/clk/at91/sam9x7.c          | 17 ++++++++++++-----
>  drivers/clk/at91/sama7d65.c        | 16 +++++++++++-----
>  drivers/clk/at91/sama7g5.c         | 17 ++++++++++++-----
>  6 files changed, 48 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
> index cefd9948e103..03a7d00dcc6d 100644
> --- a/drivers/clk/at91/clk-sam9x60-pll.c
> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
> @@ -630,19 +630,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
>  
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name, const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>  			      const struct clk_pll_characteristics *characteristics,
>  			      const struct clk_pll_layout *layout, u32 flags)
>  {
>  	struct sam9x60_frac *frac;
>  	struct clk_hw *hw;
>  	struct clk_init_data init = {};
> -	unsigned long parent_rate, irqflags;
> +	unsigned long irqflags;
>  	unsigned int val;
>  	int ret;
>  
> -	if (id > PLL_MAX_ID || !lock || !parent_hw)
> +	if (id > PLL_MAX_ID || !lock || !parent_data)
>  		return ERR_PTR(-EINVAL);
>  
>  	frac = kzalloc(sizeof(*frac), GFP_KERNEL);
> @@ -650,10 +650,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  		return ERR_PTR(-ENOMEM);
>  
>  	init.name = name;
> -	if (parent_name)
> -		init.parent_names = &parent_name;
> -	else
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	init.parent_data = (const struct clk_parent_data *)parent_data;
>  	init.num_parents = 1;
>  	if (flags & CLK_SET_RATE_GATE)
>  		init.ops = &sam9x60_frac_pll_ops;
> @@ -684,7 +681,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  		 * its rate leading to enabling this PLL with unsupported
>  		 * rate. This will lead to PLL not being locked at all.
>  		 */
> -		parent_rate = clk_hw_get_rate(parent_hw);
>  		if (!parent_rate) {
>  			hw = ERR_PTR(-EINVAL);
>  			goto free;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 63d4c425bed5..b43f6652417f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -255,8 +255,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
>  
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name,
> +			      const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>  			      const struct clk_pll_characteristics *characteristics,
>  			      const struct clk_pll_layout *layout, u32 flags);
>  
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index db6db9e2073e..fd53e54abf88 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -240,7 +240,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>  	sam9x60_pmc->chws[PMC_MAIN] = hw;
>  
>  	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
> -					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
> +					   &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]),
> +					   clk_hw_get_rate(sam9x60_pmc->chws[PMC_MAIN]),
>  					   0, &plla_characteristics,
>  					   &pll_frac_layout,
>  					   /*
> @@ -266,8 +267,9 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>  	sam9x60_pmc->chws[PMC_PLLACK] = hw;
>  
>  	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
> -					   "main_osc", main_osc_hw, 1,
> -					   &upll_characteristics,
> +					   &AT91_CLK_PD_HW(main_osc_hw),
> +					   clk_hw_get_rate(main_osc_hw),
> +					   1, &upll_characteristics,
>  					   &pll_frac_layout, CLK_SET_RATE_GATE);
>  	if (IS_ERR(hw))
>  		goto err_free;
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 31184e11165a..edd5fd3a1fa5 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -739,6 +739,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  {
>  	struct clk_range range = CLK_RANGE(0, 0);
>  	const char *main_xtal_name = "main_xtal";
> +	u8 main_xtal_index = 2;

Is there a #define somewhere that can be used instead of 2? Or a comment
at least? This applies to the other file as well.

Brian


