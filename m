Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B35ED7977C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjaIDtYDiYI4mwiOZdIpe1GZPlECoS2pA6IgFfjxvCU=; b=hhoAYXbvZYWWoUhw6GAvZUgeTf
	mOs56HhKNptSy/vBpX+OxVd/Kmt06+YTXN5oPuvAZaE+t5wAHzLXkmZwUCy+oSR715RwIOyl94/Js
	t6VxkWvbLiz5xpwSiKkkO0gy8cyytz/FMd4yVXLg8HyMulzJcNGwmCTAz+a5D50XPpyy+H1kEmvw/
	UjHfLVlHNjmTp4LhFXC/sygbrsdXaNZoOpuByuizwS94fbsf20NA7XGAuNIugRZcrx3Z/UiaFh97K
	PY7Mn99blYJwlkAlU/JoeT0MGE2aCFwDOBk4pYZ4CBh9Rc9sTcA5ihLxu+klWiIIvNGnBKACwLhY9
	Hka2bklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmD9s-00000002lQ5-0GYq;
	Sat, 31 Jan 2026 15:45:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmD9p-00000002lPD-3EFJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:45:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so32583405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874308; x=1770479108; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjaIDtYDiYI4mwiOZdIpe1GZPlECoS2pA6IgFfjxvCU=;
        b=ft5ZdiQNNwzopM8ueM/9kMhWPtTRxVy+Ni6yxzs24BU9NP2ejnFbB94IzF2AJZhXo2
         ncj3+nZS4M0g33cKBTp5Rfwu9w3c8KeweEcPLhtqP8x9R+lxaVGS+U79deokLq1IcE4b
         i4IfnFq1ItRnO/PzoG+ZddSw7LybPXKAsVvwO+3ZKSAEKpM54yGXL+dmjbXjvMQggcnA
         SRvO4USR2vv7dwCmbmTma4M+PDFcVfpLfpqAqZjcSRo8II3bEb/vFFaOAZYFG5pBv+ZE
         jv9pB84ySJn1iK3kHZrJrBBgYyLjY3xjdqPOakbdgVkqN+CU4q2nxH+fXjbxJSS9ps1d
         X5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874308; x=1770479108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjaIDtYDiYI4mwiOZdIpe1GZPlECoS2pA6IgFfjxvCU=;
        b=T8/qbaeYb69pr3/BH8Yv3ENuAdsex//svbFYQ8lmCG+j4hj5VGmOLzhE1GOxiok/yw
         zT/b/oxz9jgFhbMAMMYjyRZ/1rQlTfghbQ6MfIjY+sThOElj3fncx3B1Gbvunhpbktfu
         jMsCUXa4Em1mBQEA/yZENL/JEs/G05vHqvWdpBtPpvXGeXor/8DSgEt56y7NmifUQZJk
         uzSMvrlZV4BxsY22y2mc+WJq3XkZ9xxOHklGMSeHw7HhNZzwHnitSm8Ltr17Bgrg4ChN
         4Uj2fkOgFEP9A2D3EZ8u26M6XOhnKMZsaUts8IeK9hKHgZAlOHxXtTQR4f1jXOz/wBrS
         MmjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3XotGCi8NWHyaBDFD6lh3U/RCdO8hv5koRoccOwNcVxl3/H56J8aflwDCh1WE0pdSC59Hw/pF4wKtimgKBdc@lists.infradead.org
X-Gm-Message-State: AOJu0YzmVkqlXMqlsAPSOhIl45GN+zcfnHSXpXKshgm8ivskid6nkOQT
	vVClNb1rZhZQcugqhwCPFHyfUazZ+QjSQH/2UapT8qiHOgeR6y3O3uhznZdTkwn5tiI=
X-Gm-Gg: AZuq6aIxHtR64mFdA4UjTzcZoBB+XqwzFqC1dirrZEshPJuBEcfOJJyx+u2WpHMH9im
	+QTo73pql7ayXJkYun4SE4p6GO6hJ9djzmRlAF6/Z049HyBneHG+5vqLI0x7NNkjp6SpAdNWngd
	g87MmUAhwYuaGoDEf9yuF6RglzSCTJfPci0E3wHRo8CBmm3Msz+tI33VFVL3LvrrfetqSczRJuQ
	3KIdw/7kQP8ms6KOphL7G+p6GPO16NMY7raZIny0egWw3QDb+w43wZxJMTbJ06M59i3zN9Sttyn
	HOS9bQ4rn4GwTQav+oZsdUzqv5gVo6KkZdb2a+5c+5aaucehxD9chek7FHarFTyX067pszLZNTw
	ZcMmF+Hqi1YidOmN2Z+hEr0lO3jiczBcfwMMg6Q1hbtl2Z8U9XgLuM1Hv3rlM7YeUIGi58kDp11
	Eo/Mg5jyKgRFeFEJX9VgsD0AtR7/Xe
X-Received: by 2002:a05:600c:3d96:b0:480:3bba:1ca9 with SMTP id 5b1f17b1804b1-482db4568femr84868555e9.4.1769874307935;
        Sat, 31 Jan 2026 07:45:07 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm357329975e9.9.2026.01.31.07.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:45:07 -0800 (PST)
Message-ID: <fac4b0b0-3aa1-4a7a-b578-2406bee5b4a9@tuxon.dev>
Date: Sat, 31 Jan 2026 17:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/19] clk: at91: sama7d65: Use highest PMC definition
 as max index
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Cristian Birsan <cristian.birsan@microchip.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-6-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-6-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_074509_833323_F1E27DEA 
X-CRM114-Status: GOOD (  18.18  )
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



On 1/20/26 16:37, Alexander Dahl wrote:
> Consistent with all the other at91 clock drivers now, which also use the
> highest PMC definition as max value, and no extra number.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - new patch, not present in v2
> 
>   drivers/clk/at91/sama7d65.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index f6f86261ceefd..4ccffa8db43a5 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -19,8 +19,6 @@ static DEFINE_SPINLOCK(pmc_pll_lock);
>   static DEFINE_SPINLOCK(pmc_mck0_lock);
>   static DEFINE_SPINLOCK(pmc_mckX_lock);
>   
> -#define PMC_INDEX_MAX	25

That's not the right approach.

You should identify all the core clocks as described in the HW manual and 
allocate the ncore section of sama7d65_pmc[] to have all those fit in there. 
This driver would have to work with old and new device trees and thus, if you 
shrink it now you wouldn't satisfy this rule in the future.

> -
>   /*
>    * PLL clocks identifiers
>    * @PLL_ID_CPU:		CPU PLL identifier
> @@ -1120,7 +1118,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	if (IS_ERR(regmap))
>   		return;
>   
> -	sama7d65_pmc = pmc_data_allocate(PMC_INDEX_MAX,
> +	sama7d65_pmc = pmc_data_allocate(SAMA7D65_PMC_MCK5 + 1,
>   					 nck(sama7d65_systemck),
>   					 nck(sama7d65_periphck),
>   					 nck(sama7d65_gck), 8);


