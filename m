Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAEBC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m14oScEaTjZatQKNom70YWJQE9ioUexgQ6aHqmSRsUg=; b=o3dvd+anych2sOAYWrEOgbtZUi
	D63KVBkqGfALGWATEShGhTX/Y4NHde8p79MzJjJHlYVhqMbIZb10FlY9a6d5cMC1scfNgAsnyblTI
	/A0R9PDwyGl9TXPjGJtjdWVlfYdUkaaVCs7Mfyun0RzKvoWoN8WZkdNjwrp+Ndslao1uyVElC5Cmv
	cBUY/dqovAai5NQg7UIMgQXwREaJoYyNW++vTx3Cnz7CoJ8ZL8Q2AczTjbDwuLGt12cb2Ica3E3+j
	ONL8WNU3Xk8tiFhegVCjarw6m8eFyytbVVJumdktjHCY946eHRr/2SxOmb2V2sJxNjjtsCd0gy3xH
	0zedj8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVBa-00000009t5C-2IYd;
	Mon, 12 May 2025 15:35:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUR7-00000009mme-0PxN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:47:22 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5fc5bc05f99so8766919a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747061239; x=1747666039; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m14oScEaTjZatQKNom70YWJQE9ioUexgQ6aHqmSRsUg=;
        b=UEEMydf9wach2U7kotCRHOql71DA25dH46rZrE/WCLbPjrFlX5icryNfxccvs0vOmW
         rxs/arj3rbfJbk/4TRAhc+Tw2yu1Rxxl5ay0XMAH5ZXM12SwtiszbJVVsfN3lu8h4ptQ
         Kwq92rI+tpGV4Ku6xbE+tbyCK10AiJsNNZjOUxbUqDhEjer0V4wsxKBmvfFiJm7hhB5O
         5RLMLlIR7QHZQ9XkFFRWYY0x6+kPfuKz7q4bMk2wgN+3E6sW1rkCkmVhXh1GUjS4sb2m
         sjrlNSBRxtVG+78L76pf5LoxcePoZ0wXfQps7FWyQn/SVpAhrhwYQmT0TGnPmVaAQ+cX
         ablA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061239; x=1747666039;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m14oScEaTjZatQKNom70YWJQE9ioUexgQ6aHqmSRsUg=;
        b=ELza3VDP/HVNTtBqX49BN4s8fHeR4QqR4pejFolpawjc71tN92UVPip7n6CgPprvIo
         IpMP7SfWBXce713NZUFIJGofy54e2N3c+QlmyhnpHyXnpi2q3G/vqgNWk/PmMtMfJJc6
         2dAJJ44Sw1v22VbWmJhAxE6tc24TTEeGy4VX4g+pkmzjWbyzVapovTD3LWhuULj5Yixv
         cg7wM4EV0n6tbZGFOhOVr9EPtgfULtr8FH73c/yUZuCJC1W+T3CJnbeLBBFTsT6p6Lky
         dSRZtC+UYUPEAUdM1+RxxDgtjhiUf33WYc9EUYf0+gvTpmowIrMUVEZkLH/CpWgJJ8x4
         ZVbg==
X-Forwarded-Encrypted: i=1; AJvYcCXxbpEjNfo9Of62li5uhXCbZ4v+hXyhmDZls+KJG1JC0YLbI0BM9+eGFm3bny+QpqESJQRi/Fkph4tmUmSqG3yh@lists.infradead.org
X-Gm-Message-State: AOJu0YxvYS/BU1aect6fW/A6wGimRDds+OkfgFV/WpkGcHNsPM5efZc3
	WAnNgBgekCmoyArrg6lE4JweNZYdh4R50UvhkvbT3hv7d6MOtXoxjO830OEEkAU=
X-Gm-Gg: ASbGncsVN5/hKW+Jt6Robs99HM8TYSYiFy3sicrKMbopFzAByryW9E2R52y/x6bJhRt
	aqzYFBUlm1CGAs3hvZd0bCVYtqSTERx4s+bUzk0j8Jv7b+Hi3H+9a2vm6ytU7uenzJmguVgI78L
	XCqiNnw69MZ2pv0T0KEiQ6YVj6Z9qEZWCs48Q26Ta7bHn9qsZpiYVN8HzstZN/PMFM+iGatnNlN
	oJC1Kq5zxXs2bS6r/sUCFKnLhf8rioHFYMcdA39nTocjl2zl5bQ5q/wo4HiSQM5KHfo5s8gLJ7M
	TXplTVm0DAKIEfeFKSJL1b+AhEIa8LOa3J5EYxgQOV4ZUGSOtpDTOE06JG8=
X-Google-Smtp-Source: AGHT+IE/hLZQy5Y7DCvbr4+of/4o1aU9oPBRNPSjrbd3z0hNDt9f/aX/QapKka7eYc2tafxRyG/spA==
X-Received: by 2002:a05:6402:42c9:b0:5fc:954e:efb6 with SMTP id 4fb4d7f45d1cf-5fca073136fmr10674228a12.6.1747061238595;
        Mon, 12 May 2025 07:47:18 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc26483sm5844513a12.22.2025.05.12.07.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:47:18 -0700 (PDT)
Message-ID: <bcf3089b-04d3-40ad-8673-db0e727fa72e@tuxon.dev>
Date: Mon, 12 May 2025 17:47:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: at91: sama7d65: Add missing clk_hw to
 parent_data
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1746561722.git.Ryan.Wanner@microchip.com>
 <41611e4b1eb2abd867523f707791292c6cdbc8b5.1746561722.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <41611e4b1eb2abd867523f707791292c6cdbc8b5.1746561722.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_074721_328031_5A4F7B90 
X-CRM114-Status: GOOD (  17.14  )
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

On 06.05.2025 23:04, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> The main_xtal clk_hw struct is not passed into parent_data.hw causing
> the main_osc to not have a parent causing a corrupted clock tree.
> Passing the main_xtal struct into the parent_data struct will
> ensure the correct parent structure for main_osc and a correct clock
> tree.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sama7d65.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index a5d40df8b2f2..1e9d3c393883 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1100,7 +1100,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>  	struct clk_hw *td_slck_hw, *md_slck_hw;
> -	static struct clk_parent_data parent_data;
> +	static struct clk_parent_data parent_data = {0};
>  	struct clk_hw *parent_hws[10];
>  	bool bypass;
>  	int i, j;
> @@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  
>  	parent_data.name = main_xtal_name;
>  	parent_data.fw_name = main_xtal_name;
> +	parent_data.hw = main_xtal_hw;

Is this line still needed with the initialization of parent data above:

	static struct clk_parent_data parent_data = {0};

>  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
>  						 &parent_data, bypass);
>  	if (IS_ERR(main_osc_hw))


