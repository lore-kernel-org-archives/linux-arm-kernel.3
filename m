Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C643CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wN5plf6DQoz8MXbMzn7OeAYAYu7hV2vZ8E2rhA+6WY=; b=rH2WXIt0Vt93opu2wWThbXMN7d
	G+0g1f8DcvnLAOTCYfysEk2qUffpHxM9VYWMXfukAzFRV/RYE2gMzxLixy/nA07I3ZO+eFY9Eed3R
	6n+KUQeEZDCrJspg1WZQIgO2WuE2c7Q41S8iFzAwpra56FydL1iQBvMA6vAakB0OwVVAeRS9+46cv
	TkxusMW0XrFm5gXp239b13/lgNNfLWPKenlGHQ9Y+mpXTVEW2UeSJR3spY11t9mxapP+esOZGldaP
	DP+9IeWkXWnBFBAxboScxmr/AKKM8ep6S63jvpyDNmWf2/S7++M/KMxTPmXnFfV2/AwbUYSu7wbni
	wf2gzYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti836-00000006bvG-2Dgf;
	Wed, 12 Feb 2025 08:24:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7z8-00000006b6j-3MLj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:20:43 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so7582374a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 00:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739348441; x=1739953241; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wN5plf6DQoz8MXbMzn7OeAYAYu7hV2vZ8E2rhA+6WY=;
        b=EsDaO1+tsDDxCzVg2ao7gKwNexI7ZYKx2pUZpl58s/hdEpW6pd4FTQ+5TEkZ9iB2UR
         g/GdpOojw3Vrtji21tIF+Vgx2K67Wn/VISxZM22ISmVuMMVFgcd560T8VL98/RGUq/Bm
         8o/iM+f5IXxyxVW49wXSOJfPX8XZIN5kD5VgXJYPpoLKl7p3wvBrgQ8RN3Gwmdto6Li/
         6qUzwcckPNyb83U1BzovslqmjqMfGLV6G8pDcTrpwX7sFGJPyRDEmfqwfNw/u/ELDYP3
         H80zEoQVXluyDoSwrBrBsUku96LNCYuJyRA1eAEEQXtQaUEw7roMypRq9Rjkk/Wdmxo/
         9SmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348441; x=1739953241;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wN5plf6DQoz8MXbMzn7OeAYAYu7hV2vZ8E2rhA+6WY=;
        b=a2ANzEWWkBxFrmKGafTMpVZtZqN6nBvnmLPHq4XflNiVuJoVrpmNe/gkI3G0EAOLO7
         rCEiO9rZQ3556L8Cpy9Q/HrrCKfMFi4XSbWXXAiAzRPB7Drkx1OOMxfBhzDsJOPMBm9H
         e11aQa4ECs9wc9wR3mqzNhPNyxFn6ST3+xMMT5JN1Tjdbd6IJQEU3pYC14dXNcQdkq0u
         9iKQ+8oXTEXdNblR8BGkFtt/9Z531kAt07JH1G7qBAaXBH9Xd1OlEAPbMzSUa+XaGr+O
         LkHxJ1Gdpt2dzw7CNQfzGHThlHbEebPNsHgcUC7A/EgOcTfpV+J4Xyyp9b6H/M2ejCin
         5KiA==
X-Forwarded-Encrypted: i=1; AJvYcCUQdu0vigxy2Vnn4dfhAgyRX/XxEVXN9WSWs365PKnz556f8lsYIvXlRpnoXvxmqhKZh1DdYziuhsdyIkS0BLOo@lists.infradead.org
X-Gm-Message-State: AOJu0YwxZuf6Somzk1afKU6KGM61dPpa1XL7Wodv5iOXa+kmjtHuk/dD
	V4RlaJH8MkevVfIKKuX77Z0nVSghL1/2qi/xcIPLlC++dLDsoVmF5am+8vcyIzg=
X-Gm-Gg: ASbGncv5YpCwlOugTgcQn6iwES4l8S0Arp/OHL9vDdEsw/bJa8WBz33AApxFx0vHnvi
	vpf13E9ExbT8ve1mQQrayKDPDmhiqXhHO/b/5X57BH3HpakSdlPtD8fFPZ2fw1RIUkEZVDUqm6H
	KlvkBSBySvAfHnkR5KtuRlKanx08G0zMIg/6sKIMmkfZvjd8o0nrrS0kFl7HS108mIo+I7uEGHK
	640wEChHBw1UMbl56Ax2NsVATxuFwYkLibz0nA9gXhV6WTzSACY9Id7Su8Q27QoWxcdrjWb5qa7
	nkml8BOb7Tj9pJph1wT9wEwV
X-Google-Smtp-Source: AGHT+IGH5sEhr0U+ODZ2ybXw27QQ2etp37E5mEcz8CPyECrALs3n5tNlB3o2g80JXIcC69CgqPxvTw==
X-Received: by 2002:a05:6402:40c7:b0:5de:6bc2:7bb with SMTP id 4fb4d7f45d1cf-5deb088ebb9mr1358535a12.17.1739348441007;
        Wed, 12 Feb 2025 00:20:41 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de61830117sm7548806a12.6.2025.02.12.00.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:20:40 -0800 (PST)
Message-ID: <202c1e0b-f17b-43ec-918c-2a4460a666c2@tuxon.dev>
Date: Wed, 12 Feb 2025 10:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] ARM: at91: pm: add DT compatible support for
 sama7d65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <a35bf7aece5f43f2517f2a4082160f47ef2acb32.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a35bf7aece5f43f2517f2a4082160f47ef2acb32.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_002042_842867_53227366 
X-CRM114-Status: GOOD (  18.16  )
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



On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for SAMA7D65 new compatible strings in pm.c file for wakeup source
> IDs and PMC.
> This is the first bits of PM for this new SoC. PM depends on other patches.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> [nicolas.ferre@microchip.com: split patch and address only the pm.c changes]
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>  arch/arm/mach-at91/pm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 6c3e6aa22606f..1eec68e92f8d8 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -222,13 +222,16 @@ static const struct of_device_id sam9x60_ws_ids[] = {
>  	{ /* sentinel */ }
>  };
>  
> -static const struct of_device_id sama7g5_ws_ids[] = {
> -	{ .compatible = "microchip,sama7g5-rtc",	.data = &ws_info[1] },
> +static const struct of_device_id sama7_ws_ids[] = {
> +	{ .compatible = "microchip,sama7d65-rtc",	.data = &ws_info[1] },
> +	{ .compatible = "microchip,sama7g5-rtc",        .data = &ws_info[1] },

There are spaces b/w , and .data

>  	{ .compatible = "microchip,sama7g5-ohci",	.data = &ws_info[2] },
>  	{ .compatible = "usb-ohci",			.data = &ws_info[2] },
>  	{ .compatible = "atmel,at91sam9g45-ehci",	.data = &ws_info[2] },
>  	{ .compatible = "usb-ehci",			.data = &ws_info[2] },
> +	{ .compatible = "microchip,sama7d65-sdhci",	.data = &ws_info[3] },
>  	{ .compatible = "microchip,sama7g5-sdhci",	.data = &ws_info[3] },
> +	{ .compatible = "microchip,sama7d65-rtt",       .data = &ws_info[4] },

There are spaces b/w , and .data

>  	{ .compatible = "microchip,sama7g5-rtt",	.data = &ws_info[4] },
>  	{ /* sentinel */ }
>  };
> @@ -1379,6 +1382,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
>  	{ .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
>  	{ .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
>  	{ .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
> +	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[4] },
>  	{ .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
>  	{ /* sentinel */ },
>  };
> @@ -1672,7 +1676,7 @@ void __init sama7_pm_init(void)
>  	at91_pm_modes_init(iomaps, ARRAY_SIZE(iomaps));
>  	at91_pm_init(NULL);
>  
> -	soc_pm.ws_ids = sama7g5_ws_ids;
> +	soc_pm.ws_ids = sama7_ws_ids;
>  	soc_pm.config_pmc_ws = at91_sam9x60_config_pmc_ws;
>  
>  	soc_pm.sfrbu_regs.pswbu.key = (0x4BD20C << 8);


