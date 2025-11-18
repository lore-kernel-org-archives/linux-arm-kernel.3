Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF65CEDD97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eRIY/NbZeEoJzxpOIjcuTXUY4zJKOGkqyWddqMp990=; b=ds154BbmJXRL5mt827IUkNL6h7
	hwcZWp1z104Zor5HO6lMrsio/K4sOR86H9DW63Be0VoOUMvZso/1kAolBtUssTvlxzVgFTo1oQJwD
	z68Zh5XcqQ6KljjLGnDkTmvnA/hZ3cy8EWOVDZSfmZKAqqtI3y/2Lia1a/Em6B6iFIxaGfEd1YAh1
	3U/yoaCDMwpIb/xGd2j6QxMm+Wo1LH/tJ/QmKs6mExzdQVAe0AssyeD6ZgrP9idsHLbvDes58wAwB
	qghdYViX0x94mGuCe2Weafy1xUzveRA4LHymXCqJOd7t1Hh/aW3LRtgQnnl1gbEEqXo7M5cEjUv4u
	OYMBTjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMiu-00000000Ysc-0DSX;
	Tue, 18 Nov 2025 14:30:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMip-00000000YsC-45pL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763476215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3eRIY/NbZeEoJzxpOIjcuTXUY4zJKOGkqyWddqMp990=;
	b=V7rvHirgW/l8Z/Kx8+iHWf5tC+woZIiV+MfHaQNpExUtKdLHbI1TXIl5MIIIrFAdpHtB1e
	E4P8ySy33r9NSt/t3VW5YHI2VxWBAqccCqOdkXLmIxaljaLwBxQEpTLTyiiepZt2Ig9Bm/
	Ubrpev3jwD01pI3jPdmLcY1f9uMa93E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-ry13HO7qNyO0JunmSoxBJQ-1; Tue, 18 Nov 2025 09:30:13 -0500
X-MC-Unique: ry13HO7qNyO0JunmSoxBJQ-1
X-Mimecast-MFC-AGG-ID: ry13HO7qNyO0JunmSoxBJQ_1763476213
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42b2e448bd9so3549987f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 06:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476213; x=1764081013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eRIY/NbZeEoJzxpOIjcuTXUY4zJKOGkqyWddqMp990=;
        b=r++P3UKQ4ciIUeN6SvSienrFc989YU5O0bvgo+6+wFHOySRpdetbS4PYPCz1ImjcV9
         4Le63jyaPeUCFXT9B1PGEbBHHZL8IkHLY17+B2bhgLoz+YpsJv/l0p8x3rqbLCVDl2LA
         CMiR82uzpWscbNeMJor3nRLzQ6lu9rTL/hbmldJsSook0hJrNqgx2ecPYGq4KWN9jAg4
         vyHbS+P8aKnHxfv2OvU752j5P+Fx0lviBBlfZbLk/uZD2Fu3Xrb/scbjDyHUw3WJ1L32
         mAHEHKb6Skv7szeqpFK7cXU8am4Z5rejzvufIbMx8zU8XmJy/3QlhaBfn+IvhYUq/Iyh
         SduQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Vy+uH/oHjlEFJnrLMO1UowLbFlZ6pkdy0O4ABp3jwzye62me2A6TfFZ4H6J/ioXFandhdD0vbQxfuPqTI0Kc@lists.infradead.org
X-Gm-Message-State: AOJu0YzkX3QN7hfvpHvAWB4GsogL6CI9KPHlfaOWvqUWGaXfxIXHI4dW
	s/tjMDdyClLLq0UnJmrMYRoliPpZQv9I39KhBc+uD+GmcC6amAjl9E3tydVJrN7iPxrLN73lBJt
	BRa3EyCd5E2kyyvdwI+O+iLEJT8Gs1nreLTje6RIwgEbM6aKxAi2clpsBNBks4g57Ho2sJxBN2t
	o6
X-Gm-Gg: ASbGncvEU5iqzs7407HKCrQlaukHJoVNLMWWF78zr0ZQVexOURbst7GYF+FbAJGbpyu
	pt1Ic7kjtJK/stmZ9WSG4EthkGdwbT4cqxUrVgFCOdxeclnqtqQiHfEFl/fy1a8I8uKTPkrZ0x7
	PvOxAenEGmDa2rPEXJS2Lez1h+fm28L4MQ0iVljMVmMnq5dDV3gFl5yipHimoFlt51KuEqeE+nq
	Lc6UCUxUUxL8oktCZRW78UW2V6X7hb2pWwsg8rsNv0ZxnLrSrRtCk8HlOpKefVlWB1ldpyQeRhS
	P6hiWCaFWlMzITLGMhnn1UxE3eS/E5l+i7izmVsdeqnaJVJOV9A4W2mF1bxWAg2Z3dj2qEJc7KC
	IEW7yeWQwRX4M
X-Received: by 2002:a05:6000:4186:b0:429:92d8:3371 with SMTP id ffacd0b85a97d-42b59342b99mr14525635f8f.11.1763476212634;
        Tue, 18 Nov 2025 06:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwm2ThNaD3qGGBsOApPqujAYKRByi04FEJdieN5aJJjweY+ug15q24nDRRxPxeQEH6CYkCcw==
X-Received: by 2002:a05:6000:4186:b0:429:92d8:3371 with SMTP id ffacd0b85a97d-42b59342b99mr14525592f8f.11.1763476212191;
        Tue, 18 Nov 2025 06:30:12 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85e6fsm32541019f8f.18.2025.11.18.06.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:30:11 -0800 (PST)
Message-ID: <4a3a8ba2-2535-461d-a0a5-e29873f538a4@redhat.com>
Date: Tue, 18 Nov 2025 15:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: add clk_prepare_enable() error
 handling
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20251114142351.2189106-1-Pavel.Zhigulin@kaspersky.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251114142351.2189106-1-Pavel.Zhigulin@kaspersky.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9y6cTL6DUXJ-RQ7gGwBJoD3deeMkTHIyMM8jLpFWm2w_1763476213
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_063020_090931_55655C4A 
X-CRM114-Status: GOOD (  18.77  )
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

On 11/14/25 3:23 PM, Pavel Zhigulin wrote:
> The driver previously ignored the return value of 'clk_prepare_enable()'
> for both the CSR clock and the PCLK in 'stmmac_probe_config_dt()' function.
> 
> Add 'clk_prepare_enable()' return value checks.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: bfab27a146ed ("stmmac: add the experimental PCI support")
> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> ---
> v2: Fix 'ret' value initialization after build bot notification.
> v1: https://lore.kernel.org/all/20251113134009.79440-1-Pavel.Zhigulin@kaspersky.com/
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 27bcaae07a7f..8f9eb9683d2b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -632,7 +632,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
>  			plat->stmmac_clk = NULL;
>  		}
> -		clk_prepare_enable(plat->stmmac_clk);
> +		rc = clk_prepare_enable(plat->stmmac_clk);
> +		if (rc < 0)
> +			dev_warn(&pdev->dev, "Cannot enable CSR clock: %d\n", rc);
>  	}
> 
>  	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> @@ -640,7 +642,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  		ret = plat->pclk;
>  		goto error_pclk_get;
>  	}
> -	clk_prepare_enable(plat->pclk);
> +	rc = clk_prepare_enable(plat->pclk);
> +	if (rc < 0) {
> +		ret = ERR_PTR(rc);
> +		dev_err(&pdev->dev, "Cannot enable pclk: %d\n", rc);
> +		goto error_pclk_get;
> +	}

It looks like the driver is supposed to handle the
IS_ERR_OR_NULL(plat->pclk) condition. This check could cause regression
on existing setup currently failing to initialize the (optional) clock
and still being functional.

I *think* we are better off without the added checks.

/P


