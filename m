Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72502C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHzoEXcX3rRgSypgjLl/rpTLfRP49fuHATm+VBKv9lY=; b=IVDbKsFLeWZ0tnKFi1XwATeY5Q
	MgB7yKnXNrgp46QI2aBOYS1O8keu9LK3VcKbwFOZpPihAVb+sKpAqQDb04HPJ+xSKVcK5zLjvQcdW
	gbo/udLGSfophRjp9nzcTC0+oR5AZGyGmnoE2H4hkMUBzbsNyX3YHlF7+g3oH97vv66qsiy4TqEcV
	Jsyxf2NVUUfY2zUY0I6YbWeew6kcUQ8z3Sr1UeFBf/EWGABgx/Q6LIvooZdoNvx1JVaMY2QeB56Zd
	sYo9evACKP2WlG3g0sU7DIVDJUblVGATzLIWErS1d4tRYC636FyeP9vSP3IAjEl9fT2NYrGlJjIOK
	oB75ZtUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1KT-0000000HYny-1vIn;
	Mon, 03 Mar 2025 08:39:13 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1It-0000000HYE2-0ImS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:37:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abf4d756135so292144466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740991053; x=1741595853; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rHzoEXcX3rRgSypgjLl/rpTLfRP49fuHATm+VBKv9lY=;
        b=CVcM7KtbPgDBNK1+hKXdfwHQqsCMsKJH0Bgt1+Ip5c2EIBYEtNECT4wHFe7+g90xnN
         QScItuWDVxkMVQbln68yrjteS6k6fBQNfMkF4vcLGFfg7lEXsxr0MqWSiAPVXZP1SuI/
         wn5fHxdiy9C3S4lH0smvnvRPAIMrE74qMJbWwsVjv2XgmI4LYnZ32PiE8gjoJJloYLCN
         ahysZo0HR+b3Kn2lmiyVh/Q+KuETffTM+jjrzUN0uFs9U5S5dK4tFWT/Qw3mQlnL2sLc
         1Rd7w8n8dvf2dh3AFZStFL7aNNc2vonY8YUAA3FtwM74jO9gFBUFh1FYrUqBZRD1vxyE
         hFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991053; x=1741595853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHzoEXcX3rRgSypgjLl/rpTLfRP49fuHATm+VBKv9lY=;
        b=a/bRFTcXA4Kw7r+qI38QymvOX/4Op7soSUukRh7IxVv9LGKqznv5uSrfuab4MmyB8u
         ljOZQ6BrdwIaTmF5R3FuEwWkevFCa0q5DG/gsT/4D17pcXfHtRJn1v8u61bCDMTC7jM8
         SeS096hYlj52OYtSsgM3NKcpy/6YCzhxT3+1ZGDOcPzC0hgcl1YhkzDg+ol++e9YY2X1
         LEpNpdMbJagzWlz9dawTZ8SNvJVrp6fJwm43d+8mcpY3Z4AGNryqs1EcRu8lo6CeIdEQ
         BiAk7jjSQqjpPakzuWc3T8vVn+NUty6u0xN2aDLnpRa4RD741KSGOWITD7UwjIm9OxMc
         j6Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW0cCjgeMczhWYvI8BJhEAAAm5XNddbN0cNIeUrQsYNbZ0rIFoVE4WFmZ4ma8mxneodQnUXMQfNOL8rJaSe2AkH@lists.infradead.org
X-Gm-Message-State: AOJu0YwSBNthrXD5XI/xIqW4GWuvxH/hNcm2hbPZj3vKzsp5qi9cWlQ0
	Wdkgck5g5TqKXkdE70uZejd/XJVk4z/xFUu9l8S047cWzGCCwBnkMTMDZwyETWg=
X-Gm-Gg: ASbGncvBAkGWmzufR+thj7oGxCFlO85u29qHtZPivsAfs3MpGZSo8TYI1ZFfPdBObR9
	szMulEFDLlF4M7NafRBvkJIYRBBjEh60uEBYxaS/BuDOUwIEdwBbMtxM4N7/vkes5pH5UlP+dzy
	tBgAHTHmvDwWKCNnTXGeVOE8O4JjV8IshM8m/l1FKqJlLjtc6ApN+5lbyE3L3Hh21VXqJDu2NTN
	hax6AAodc0ZdrlodrmG5o4hi26Wnf/e1FtuWu7EpdvubyjsagItCVUIZL0xcwp6H/C41uC7gM6Z
	zPxy2Q5mrfRs1V7aCd+2is5aSlb76MK4vSr+xv2TxMD0cWW9gLm129BE
X-Google-Smtp-Source: AGHT+IEu4SCH3E4lm5pHLGphX1D/WhBV+YCMGBhWUNyZogIyLMScbPiRPIx0Mz9hoI+7dm2HVL+OtA==
X-Received: by 2002:a17:907:97cf:b0:abf:38a:6498 with SMTP id a640c23a62f3a-abf26708c88mr1540344766b.55.1740991053091;
        Mon, 03 Mar 2025 00:37:33 -0800 (PST)
Received: from [192.168.50.159] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0dc601sm780828466b.68.2025.03.03.00.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:37:32 -0800 (PST)
Message-ID: <81354810-14e6-4840-9e50-52bdd0e63b95@tuxon.dev>
Date: Mon, 3 Mar 2025 10:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/21] ARM: at91: pm: add DT compatible support for
 sama7d65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <06b64869f2de4b499835d153411ba30512409168.1740671156.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
From: "claudiu beznea (tuxon)" <claudiu.beznea@tuxon.dev>
In-Reply-To: <06b64869f2de4b499835d153411ba30512409168.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_003735_115396_515736C7 
X-CRM114-Status: GOOD (  20.10  )
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



On 2/27/25 17:51, Ryan.Wanner@microchip.com wrote:
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
>   arch/arm/mach-at91/pm.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 6c3e6aa22606..39644703244d 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -222,13 +222,16 @@ static const struct of_device_id sam9x60_ws_ids[] = {
>   	{ /* sentinel */ }
>   };
>   
> -static const struct of_device_id sama7g5_ws_ids[] = {
> +static const struct of_device_id sama7_ws_ids[] = {
> +	{ .compatible = "microchip,sama7d65-rtc",	.data = &ws_info[1] },
>   	{ .compatible = "microchip,sama7g5-rtc",	.data = &ws_info[1] },
>   	{ .compatible = "microchip,sama7g5-ohci",	.data = &ws_info[2] },
>   	{ .compatible = "usb-ohci",			.data = &ws_info[2] },
>   	{ .compatible = "atmel,at91sam9g45-ehci",	.data = &ws_info[2] },
>   	{ .compatible = "usb-ehci",			.data = &ws_info[2] },
> +	{ .compatible = "microchip,sama7d65-sdhci",	.data = &ws_info[3] },
>   	{ .compatible = "microchip,sama7g5-sdhci",	.data = &ws_info[3] },
> +	{ .compatible = "microchip,sama7d65-rtt",	.data = &ws_info[4] },
>   	{ .compatible = "microchip,sama7g5-rtt",	.data = &ws_info[4] },
>   	{ /* sentinel */ }
>   };
> @@ -1379,6 +1382,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
>   	{ .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
>   	{ .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
>   	{ .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
> +	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[4] },

According to the chapter 42.18.3. PMC System Clock Status Register at [1] there 
is no AT91SAM926x_PMC_UDP for SAMA7D65 (which you are dropping in the next 
patch). This patch would have to reflect what the documentation say instead of 
fixing it in patch 12/21.

Thank you,
Claudiu

[1] 
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7D6-Series-Data-Sheet-DS60001851.pdf

>   	{ .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
>   	{ /* sentinel */ },
>   };
> @@ -1672,7 +1676,7 @@ void __init sama7_pm_init(void)
>   	at91_pm_modes_init(iomaps, ARRAY_SIZE(iomaps));
>   	at91_pm_init(NULL);
>   
> -	soc_pm.ws_ids = sama7g5_ws_ids;
> +	soc_pm.ws_ids = sama7_ws_ids;
>   	soc_pm.config_pmc_ws = at91_sam9x60_config_pmc_ws;
>   
>   	soc_pm.sfrbu_regs.pswbu.key = (0x4BD20C << 8);


