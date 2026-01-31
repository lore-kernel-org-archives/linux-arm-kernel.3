Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6962DD79745
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6+NmxluvooS176kHE909Dr5qqh8j7I0Oq4Sd/VqYgI=; b=3cdxRQfecnc5wGzNdf2rA91rKA
	R40YNkCuLk8gxVuP52H7dW+dBCNs33IkuYOPmVpib+pnc67b7xKqLvdbZzyAZ3ldosC5cdihpnYP+
	nTQe6+GU9WDE1yADyAYaymamyJlfHa5ubJ8axkVKk8dVME7JZrLEPw+IurWVjo8yk2RE8MMHedVaG
	q495ajGjBMYRdUR8LDilXkFP748ClHiQhxclhQTmtCuZya8SgSWZ5PTv2fKiuMimLIs+o3EZE+az5
	gptmtxlYp+h9CrxGgtD/nSaMEoDpLqY2mgrTEEyoQvA5GixY/ceNcRapvm0O1Z3TeI2JPp6OLcxB4
	495r4wVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmByQ-00000002hdx-0p84;
	Sat, 31 Jan 2026 14:29:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmByO-00000002hdD-1ahW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:29:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso31972835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869754; x=1770474554; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6+NmxluvooS176kHE909Dr5qqh8j7I0Oq4Sd/VqYgI=;
        b=B8sgEbHrDCfad2bfNi31d4KL+zWW2AaRetpHuqAkltSuZRDLjJQ+NlvBwijou4rrtw
         xxlgSShgMEANa2ppXjTp685U3dyIw6uA6gGxBiN7qC+oFSduBjSVgOrU0WX36Y8THj4M
         /uLeAFdgEQ2YIfvHoMjgRF3IjQXy6VRKqlg+NkX1e9mn7n2xRqaFCGpje1WwlocP62sc
         XoO3l7GDIkKiB4KkO/auUI6C+5J26XlK/TNrv6qy/3SSOQjvz/FD/eyiN//V7CrKApf4
         AmkZkKMHYUtu9nEFcfutMkH0EAUrdmnbV59R6QabKRXGwaPvAtNNgypLnQ8j8mQlp0ca
         7ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869754; x=1770474554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6+NmxluvooS176kHE909Dr5qqh8j7I0Oq4Sd/VqYgI=;
        b=urPQaAz24zZKVpwyOKEmfb8UEq2V6pFzplF3smu9HoPGXilMS2259S9wyPoFxdFsnK
         xV18v5p9I8Q1vFIx9mHgfC2B+L1v02J8zDoI4jMp2dYnwG+osAlsZXSiubmUUgTP88xC
         pKjJbnU4c6oCol4DiIbamExoABwgUkcQldgPqKlb262jvqIzHJx1mhTacqEtP3Ijb8WD
         SWacgcnEvLPy4KMagjz6KifGh8PfTa2v4XiVSeVvOps++C+FnInh0uSoKmkiPjgYPRSl
         PJGz8Kdjt8M/DIGIJuZCDl+Cpy5H28Aax+5vvFawE3uiiIPsQIGJdW5f1oOKKboNkmK+
         7RCg==
X-Forwarded-Encrypted: i=1; AJvYcCU7eARQXa+j4/hkaCnQ3wftsoeOALBfhIcVObsEVhwPx0rIOjq4IJ7KzZHN6fXAraeebRyA4Vjz7AH9Hj2ePBxr@lists.infradead.org
X-Gm-Message-State: AOJu0YycsU+1g7/LAzqdvgAYUhd1vpwkD4OqW5+DCIxO+YVHG/gIOsOq
	9f6dijHnMuTzrE/MFyGcbvjhIFN6dMPQuFwxuf2y1RORuOMgxlRGvi9/ym3WBnHJMKA=
X-Gm-Gg: AZuq6aLDe8NPpCHBMTW4pTXxQ7HC75vIeE3ccm0atrNKFx788m69ooeWvy6mtTC7JOq
	oyIg0lFEKPyu+bU6fnydMTVCtGBZ2sARWd+ZCSNjty5cHnPQJ7NrFwFXlaaHUsfwsD7JB0AujJj
	4iQDQ8oIAElwiv9PtoI0BCMnbPSArYyZHNUpgCybYN18KIiW0TfGtIS+3KMVpmFSmeplSNgkPFt
	g3nAuz/RHIirqQcaUmSyyrLI+vVKflnJn/y52JSh+zWTI8DzlH0SBoNfQIHzrp9PfhUJ5K0CeZ4
	RQHCqkDybSLZ3vcVLg2A9JlWkGEb7/2XltaC6lyhUbzc3YnsE0EB9bAhKlhvA4taqSWe0ulTQUh
	6C/XHFjntrt6FQFkKw/bvK5gEwNQW8MnTlryC1VtB8UPnfR1uO9AeD8x/ApXlVzX5NtmUDfXhas
	6DYX5RU0fjn9VJw9Tdtw==
X-Received: by 2002:a05:600c:a087:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-482db491e3fmr76323225e9.23.1769869754514;
        Sat, 31 Jan 2026 06:29:14 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm377434895e9.1.2026.01.31.06.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:29:13 -0800 (PST)
Message-ID: <6067cefb-e016-42b4-8a6d-54e03319b2e4@tuxon.dev>
Date: Sat, 31 Jan 2026 16:29:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/31] clk: at91: clk-master: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <548c567b5144e3556aee5e39a9c11ed13167a14a.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <548c567b5144e3556aee5e39a9c11ed13167a14a.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_062916_461144_476435DA 
X-CRM114-Status: GOOD (  13.36  )
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



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> __clk_get_hw will be removed in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add clk-master changes to SAM9X75 and
> SAMA7D65 SoCs. As well as add md_slck commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---

[ ... ]

> @@ -1212,7 +1212,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	}
>   
>   	hw = at91_clk_register_master_div(regmap, "mck0", NULL,
> -					  sama7d65_plls[PLL_ID_CPU][1].hw,
> +					  &AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_CPU][1].hw),
>   					  &mck0_layout, &mck0_characteristics,
>   					  &pmc_mck0_lock, CLK_GET_RATE_NOCACHE, 5);
>   	if (IS_ERR(hw))
> @@ -1221,12 +1221,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	sama7d65_pmc->chws[PMC_MCK] = hw;
>   	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
> +	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
> +	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
> +	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
>   	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
>   		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
> -		struct clk_hw *tmp_parent_hws[8];
>   		u32 *mux_table;
>   
>   		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -1243,13 +1242,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   			u8 pll_id = sama7d65_mckx[i].ep[j].pll_id;
>   			u8 pll_compid = sama7d65_mckx[i].ep[j].pll_compid;
>   
> -			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
> +			parent_data[3 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
>   		}
> -		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
> -			       sama7d65_mckx[i].ep_count);

Could you please move this to a different patch? Same for sama7g5.c file.

The rest LGTM.

