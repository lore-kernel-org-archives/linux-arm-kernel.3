Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06E0CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Uq5LFMJuGM/xM9Jid2EcKy6jYFa1OSnWMslrM9L2Xw=; b=4BETWzri3oGPSWK1RlHNJ9Aqh0
	k4TLORi2aonWxADj8Mx0wCijHR8UEoJfaHmBNDXAQPMb5GVOVW1U12+7iywJQkxOnTFPAtU7PiIms
	f7PMW29mlAiqhnBplQCtK80wTGesc3vaY3X/AmfokuuPRbdUtqUqRENjZDJcZHW9WCmNtpjehOCp4
	ONgeP2X3Vc0THlZhSLeS6BKNBuHI0ztF+4ztA+4XN+vAO4TZH1Tn4tMYF1MP6uejMdd8a7kBSRSdO
	WyGzEnq8g71Szwdb0ibnvAXBZfGa8R55cf4G9TqPJLfRPwO/apxFnVosXVsB3xZH9553IAcO2gFE7
	h6KbeoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvmM-0000000EobF-0GY0;
	Mon, 20 Oct 2025 19:42:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvmL-0000000Eob2-2Qkr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 19:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7Uq5LFMJuGM/xM9Jid2EcKy6jYFa1OSnWMslrM9L2Xw=; b=nawmNSsFPD/lDLCkkFzotbAe7m
	CgNEmawR0s4rLMFtk6JS/IXqIsAE2O/DA7QNzwNJ4RZQrsP3GP98SlRJpUojMK61lV6S7Ii8KpBYY
	L6I/dmj+BM3E/OSeOv1o/gLS6UcmXhYB6hh2kU+IlAXWTuCaI2MClXQ+oXk3ANm8NJNcWECiChZGB
	wwucqqLH1Givy7952y0oyGqTfN+TB02rvCGzyTdBMiGNm3yZdCjDhJozYvpJmzLGeIPYy/KluN4kZ
	kOrt8U7aF2c+zofgLp/UbiZNbKjKTgiiruwalKmOChowe/9PH0bpKhFwdtAt5ddVxK3PL1MoqDBAR
	VpXowdUw==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuuc-00000000Aca-1XgG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 18:47:20 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b3d80891c6cso1115432066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989365; x=1761594165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Uq5LFMJuGM/xM9Jid2EcKy6jYFa1OSnWMslrM9L2Xw=;
        b=LA+31gQaZ2SSEeQPhzktAc21YTYthY7sSyTbHvUBASFIfLIfVkrA4YdRJJLgPtPxQJ
         UcHIlfk/jqHW+b6XvlotRekrGlarT2HZL+LTtjYEebJy7H3BUg0w8xRMA8u1kCs4v0AL
         W4XXBQFo2Ln8UiPddg5D8IpoNd/73snCzeIPP1G4Nh/ghBFpmIfzLQQxqH5+C9jqIZiV
         YYam3MgjYCqxZZKc18k31bWcz6wpHrgHxhgDSNPfDhgGpLT/y8gJp9M9ZtjHORFqYJRz
         vgA6RNEvOXSYCLimogzMgbgKaM/GVbRSYJRPKg+OOR/1mOd3y1Xb4ui0XWRCd32FTNud
         RWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989365; x=1761594165;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Uq5LFMJuGM/xM9Jid2EcKy6jYFa1OSnWMslrM9L2Xw=;
        b=vNaGxmBZ9ShxZIQUhf8gmj02db2bViW04V7AeJvxK0Fbb/ecG3ftnyEkMuBOnZoqaW
         rf4bWDAWWeqq5U2RwhmH5FB36fR8FAjEn4zfa3XR76FLzwx8+Gn8Apntt1QwHzXprvS6
         sTkV42MUfh4zKtAtbFk8MbNy2ByfWI/2q0egmWkljQ1rEnAEqsXZOWPE1wtFNUj1gQmA
         ye1ri8LtWYEmmVZjjzZeTd4urAYrucuvdznFBK4TJtlJ1ERyBnxuu6bEmI3Vj9Brr/ab
         RtaZKOrdT/BE/KAgNrkjoMH3HNiOH0cUe3ovculAm2GW7QK7Pef+2YB5CaKPL30At1se
         0iKg==
X-Forwarded-Encrypted: i=1; AJvYcCVPDKNanLpl0iWwU35qzfGFUR36RaV34U9KHU9KHFRO91j4a0+d2xFUmdDgUvMnkuBz1tIQDpA7vd/cSTQysOyo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj+B7vgQkFUo/LPviz0jzmj8L7yHSfmm6YzZMFjvcXZk3Nvd8x
	j2Uvw70yGYPQ068xjvjXMft9Qhw8aJmpJuqxEAuf7e2k9JqqMQUBXiR1aE6sMmRX7J4=
X-Gm-Gg: ASbGncvvAEYsiOVRE8k08nMpQ6BsinwtuErCaXzUuJvjePVBK8nR4zqwWbgQjgvzfYE
	OLs0mu7mKbXECn2Nkdbfrir+uZs5mTaTenkIDaQu4ON2B0gVew1GV3C8F8TSwuoiXFdcSaRKy9j
	xGJbqwWFBiQ31tHNOLaHbOXDjDs6UfPvb/dcsaJf+jdwHI5CaHJtkkLicM1b//CwzcVT2I9Yqp+
	tW3fmp8tI2Cp5RG+M7P4rtisy0xKfae2yhUU8s3flDUnjAVrfdqvYrdeyog3pvBt7uIfDL6RhP9
	drpM+tLl0thU4CnsVgJFMHFjrR9j/U8c4PpRquLWLn8YzHnufOeNoX4rb5taYb2Bqm8odrtHbpp
	CeLIEYzaqf7dQPineHMMxhV/C2u/+d0HBNDlSq15PJx4vjv+Wr0aaOMfiF4i1ZtX2sLD1vWcJ+e
	m5+DNJhWFKvKLrSuZRjfI=
X-Google-Smtp-Source: AGHT+IGHu2znjunMS42qnTeHNhloC2OADaigESnIDF75k5aPWsi00OCyrhzBuu/+FUhbaAk7uDtcAQ==
X-Received: by 2002:a17:907:890b:b0:b07:e348:8278 with SMTP id a640c23a62f3a-b6054cdd6d3mr1791255066b.25.1760989364997;
        Mon, 20 Oct 2025 12:42:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4945f003sm7581371a12.27.2025.10.20.12.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:42:44 -0700 (PDT)
Message-ID: <e5f4a505-86ff-4d89-86d6-5433cf7c5665@tuxon.dev>
Date: Mon, 20 Oct 2025 22:42:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 06/31] clk: at91: clk-main: switch to clk parent data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <0f8054488ac3cd658d7a6fc0d5cd4f684ce8355a.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <0f8054488ac3cd658d7a6fc0d5cd4f684ce8355a.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_194718_552572_4FFE0B27 
X-CRM114-Status: GOOD (  12.66  )
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
> Use struct clk_parent_data instead of parent_hw for the main clock
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler

Probably missing "This" in front of "to less" or something similar?

> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures. This will lead in the end at removing
> __clk_get_hw() in SoC specific drivers
> (that will be solved by subsequent commits).
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to use parent_data.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---


[...]

> @@ -1020,9 +1020,9 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>  	if (IS_ERR(main_osc_hw))
>  		goto err_free;
>  
> -	parent_hws[0] = main_rc_hw;
> -	parent_hws[1] = main_osc_hw;
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);

You missed to convert parent data to an array and adjust use it accordingly
in this file.

> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> @@ -1057,7 +1057,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>  
>  				hw = sam9x60_clk_register_frac_pll(regmap,
>  					&pmc_pll_lock, sama7g5_plls[i][j].n,
> -					&parent_data, parent_rate, i,
> +					parent_data, parent_rate, i,
>  					sama7g5_plls[i][j].c,
>  					sama7g5_plls[i][j].l,
>  					sama7g5_plls[i][j].f);


