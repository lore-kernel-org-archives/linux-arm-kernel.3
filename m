Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4CCC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvYQf7JJrtOhol9ZYgmnQUIWUs56jpdOGUSqYs3GLGU=; b=Al+KRbtk9Pb3QacFIduulnsp71
	OPRLVgFNSK23oO5FkWvA8PxK4MWha88VUxP/E0884WsvLaboQcKCtebQ7J7d5zUqfAOPiVFfxCtok
	0Kp+FD8Mc2Tj36k9mUMRh1zdkbB+Xs2oEc82uxfClfGr9TJul2xYcaqORrL8LD4SVbjH/+xchKFPf
	X9uKOXMi/azdmlWrh3X36z8OO+qTdKfn/EalSYDSDYmfM+wUoeuYRwU00fHFZ6fQJoE0n1q9Gk0vC
	C/siWeeIyrix4A4KxJmbUPX/PBAwkE7anlgoQOYPtOPqO4oS1KPsktAE1J4U+YJvGsDfEh092h6Iy
	IbwaV0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkILY-0000000C8MF-0gdu;
	Mon, 26 Jan 2026 08:53:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkILV-0000000C8LP-2NzZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:53:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso48862625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 00:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417595; x=1770022395; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EvYQf7JJrtOhol9ZYgmnQUIWUs56jpdOGUSqYs3GLGU=;
        b=D7B6ebt0yZLMUlCy8Gf4xb5b13sjOM39+olIMp4iuPyciwXvuti3InzOipIS1b9/U0
         M+0TPAnLjVBr9Ls5ynxk20KuETyBgt5yht3uJmUysVGVSdSazPRSu5LP+dfbqv6dazGy
         0+Fr6fHZ7AoFkTtGOYFePSlQkKS43wK8TT57iM3blsx9cDPAaNN3DmeAOC71z9UKsys0
         FN11sXqVrjV/5FX4aKSRcdpTL8P7gzVyqPjDlyoy9FvkgKhcuhIecZsilY3KogMuAbo0
         wt6KO/7AtZEHzfAHyGKr+vZxk0h3JfZC5qTCMV7sSiiePfyqlCEcdyp5qsUGxmjNfn3i
         EToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417595; x=1770022395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvYQf7JJrtOhol9ZYgmnQUIWUs56jpdOGUSqYs3GLGU=;
        b=AxMRFwrzKeiKIb1DI/OirCeZmJOPbEQmuWgRQS+a5PpaED08HnZWd/92Mgv6YEGYXc
         H2q6q/qj4vMv91rjQLxIp+E178x2Tc7XbqC9CmbD+RpLf6KeYApVkmfQ8TLS03hq17E/
         qxaa2nqPeHk1qtvs9L2kbs5IxrKwyc0rL6s04U8IDeMmZI9HVhyyHsBFT5yWSNzJB3Tq
         6y/T6/PC1aO+FkH3zHwnBA79Yv/fi7L1s+QtNkSZBrLVeqcOkFjxKT7WycvLw89r8VRX
         bAKWLAqo7NzUi5suKOKBC1C+Y2ZeTzPhGMjP8rKMGPe2TSWIYxHXlSISX3fYRiQ4SBXX
         Ll9w==
X-Forwarded-Encrypted: i=1; AJvYcCVXJrWqgyeORd0acLMMwb8RkO9AIP2PULDFGEF7YW3WU5P7kIU/l/fc4tRE/Drdsudu08nQlhgEilJUK9dfkt+R@lists.infradead.org
X-Gm-Message-State: AOJu0YwVg1RuUeRk7w4wuJtgwdmrz74lNc39pcDsyjVgU4+vwoF1/Hdx
	eXJtCq0/bO0HKQG2HCnFBtajafZmz6iK5tmnFSqNhYdmFkrm4pNN0evN0OdEFCgR4jw=
X-Gm-Gg: AZuq6aLw90fZHlRupHkcjOymzQPqZHCf4ZE3ne46jxmwhRU7k1IXkVV4GB+1zSkSd8s
	9sqfGRRLTbhp7SY0k6oGii4bXHNqvkaq1ezIjowM5DVO7PcVv9Xd+yn8Lnp2DRKsWUFZqufVG1W
	yVSpjb44Z2ww0g03QvuDxFwtM5ws2DJ8J04+ViON5ZDbnJPm3vlxKHRk/5AEFKM08XbvUf9V80s
	XX3qx40wN2EI2XWvw7UriTDUdUSVmx6dnxaF5Qm4eBgMoj+EqKn3TTNMojL5Q/IOkw5zsL1+Umh
	bL433RcwReSlhE2RBTEjkhmPoZc/MHkdQ+ixNjz/8uLKA/pVajD/ooUefEV8qVY+tLmXmejSGRb
	tivRqaMa94rk1X+1/fVlMRgQ7k6c7ijhCVGrdpqHYu/4L3XEKvWN8tV0MnIlwYMpDoBrtsdzJXV
	QAA8fbVVSQa5gmaYH0xQ==
X-Received: by 2002:a05:600c:4ed2:b0:480:462e:d640 with SMTP id 5b1f17b1804b1-4805d06c8ddmr60345005e9.36.1769417595430;
        Mon, 26 Jan 2026 00:53:15 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7c269sm28608403f8f.43.2026.01.26.00.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:53:15 -0800 (PST)
Message-ID: <4cd2b42d-f49d-4f21-8677-928cb3d75fd7@tuxon.dev>
Date: Mon, 26 Jan 2026 10:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/31] clk: at91: clk-sam9x60-pll: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <ca2a4b7196e1c8a479577ca4673f2125ff41292e.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ca2a4b7196e1c8a479577ca4673f2125ff41292e.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005317_657664_E2D910FB 
X-CRM114-Status: GOOD (  23.41  )
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



On 1/16/26 22:06, ryan.wanner@microchip.com wrote:
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
> Get the main_xtal name via of_clk_get_parent_name() to consistently get
> the correct name for the main_xtal.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X75 SoCs to the change set.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---

[ ... ]

> @@ -1137,10 +1141,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   
> -	parent_data.name = main_xtal_name;
> -	parent_data.fw_name = main_xtal_name;
>   	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> -						 &parent_data, bypass);
> +						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
>   	if (IS_ERR(main_osc_hw))
>   		goto err_free;
>   
> @@ -1154,7 +1156,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
>   		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate;
>   
>   			if (!sama7d65_plls[i][j].n)
>   				continue;
> @@ -1163,20 +1165,24 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7d65_plls[i][j].p) {
>   				case SAMA7D65_PLL_PARENT_MAINCK:
> -					parent_hw = sama7d65_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck");
> +					hw = sama7d65_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
> +					hw = main_xtal_hw;

main_xtal_hw is not initialized. You should be able to do something similar to 
what was done in patch 7/31 for sama7g5.

>   					break;
>   				default:
>   					/* Should not happen. */
> -					parent_hw = NULL;
>   					break;
>   				}
> +				parent_rate = clk_hw_get_rate(hw);
> +				if (!parent_rate)
> +					return;
>   
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   					&pmc_pll_lock, sama7d65_plls[i][j].n,
> -					NULL, parent_hw, i,
> +					&parent_data, parent_rate, i,
>   					sama7d65_plls[i][j].c,
>   					sama7d65_plls[i][j].l,
>   					sama7d65_plls[i][j].f);
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index 713f5dfe7be2..c6550044cba1 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -971,7 +971,7 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
>   
>   static void __init sama7g5_pmc_setup(struct device_node *np)
>   {
> -	const char *main_xtal_name = "main_xtal";
> +	const char *main_xtal_name;
>   	struct pmc_data *sama7g5_pmc;
>   	void **alloc_mem = NULL;
>   	int alloc_mem_size = 0;
> @@ -983,11 +983,15 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   	bool bypass;
>   	int i, j;
>   
> +	i = of_property_match_string(np, "clock-names", "main_xtal");
> +	if (i < 0)
> +		return;
> +	main_xtal_name = of_clk_get_parent_name(np, i);
> +
>   	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
>   	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> -	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>   
> -	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
> +	if (!td_slck_hw || !md_slck_hw)
>   		return;
>   
>   	regmap = device_node_to_regmap(np);
> @@ -1014,10 +1018,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   
> -	parent_data.name = main_xtal_name;
> -	parent_data.fw_name = main_xtal_name;
>   	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> -						 &parent_data, bypass);
> +						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
>   	if (IS_ERR(main_osc_hw))
>   		goto err_free;
>   
> @@ -1031,7 +1033,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
>   		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate;
>   
>   			if (!sama7g5_plls[i][j].n)
>   				continue;
> @@ -1040,20 +1042,25 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7g5_plls[i][j].p) {
>   				case SAMA7G5_PLL_PARENT_MAINCK:
> -					parent_hw = sama7g5_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck");
> +					hw = sama7g5_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
> +					hw = main_xtal_hw;

main_xtal_hw is not initialized. You should be able to do something similar to 
what was done in patch 7/31 for sama7g5.

The rest LGTM.

Thank you,
Claudiu

