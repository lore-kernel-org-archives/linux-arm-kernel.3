Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC51E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eh1CIoBeFUziJxoNrnv+29bhukgqRk2MFaYe/1KQX/o=; b=ShEIOQvhCJswHiNcFwak2rRt3x
	9IfaUXKSCEB6K1vduOsz/NI0LosE9vfB3TRlbO9hcy152T2UiSyzNlGg2OYUfftm+OuiQvXVl2XZu
	bxCiapmPAKZE0PG709kwefWzPf+kZl1W03D0cAgszOH+5iI6EjFn4/p19aZiYOov16J0OAgeBPH+u
	t0GNpiae36Os/viUbB07gFHLO5V5m0zsRPUuC+DBqW2A5hmWMz6mX4TVuCzd9Gombaw6B5s/RI+A5
	ZoDKuCEOkLtUgfip0OHuThVaBHLyYU01GfDftYzl9JutWhtDDb+cW9e5rqgutA58cpd9yeB/Sjjsb
	y6RpEkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKK6F-00000005Xru-0Xx7;
	Sun, 08 Dec 2024 16:25:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKK5D-00000005Xhi-0vTa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:24:36 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so1263376a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675073; x=1734279873; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eh1CIoBeFUziJxoNrnv+29bhukgqRk2MFaYe/1KQX/o=;
        b=IxHs9vCaKipNzltapMi/FImJpA4sd02U/aOcMXv0s3heAJ/QHlCDMMxZuASkrqbOXD
         Oh+JBxBoGULZy3Cy7nEXmTyi1sK0iiCHgRmluZIlsRGVOc0tC2aLpFGGTrz9pq6cLZ90
         BKyHaOznZ445DtLgfWWJBbktysqf6TRdvNVibjSWpviy5S1OntAyvLb04IGD9tHL/xTS
         ubcVicMIm05jf3ybSo8L6srBL8+tqweV2CouEXhS25+/RedFcE1IyXYalaeBtOzubT62
         dBMNqsXz2KhwURzlMQmIm8HcMxsg72FAl4C2ERypTeUnB4aHlDdRJcllhRWqyDzbHuPZ
         YNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675073; x=1734279873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eh1CIoBeFUziJxoNrnv+29bhukgqRk2MFaYe/1KQX/o=;
        b=FThrWqFwz2oMaYecUn3LWHQoXRqWs6anSrA7/fQ0TZqb1E3Mli7vND1DTB5usWnm0h
         O+5dclRLI57AEMu9AQOPHUtg7n72rXiisn9j+Y9sqrjpfzy0Pg4+jyCAsUwnOYedXQvn
         l1EN+K6yqutzAslMPfpHGly/NsXXGKJRxqvgUMDkpCHyBQblDFuKQ0EwPTT4TqKH6pSO
         vFPOARalV2ljmMbnXFuz5Y0x5QLYCOKpB4jFqvWor/xWdUW2LWBxHzdsI3oPhgahvFkT
         Da25zwY+jW0i78mSut6Qcj/ND8v7qN3S7wI5lwq9J3QP8EaQHgMLcgKFNEKCFkkuQO6T
         obuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyqzVHBMEtb5h6diSevZ9WqJrbCJtY9mcZXiaauU6/TfBm2VCZ74lsKsHJD9u2tkrwm1pUcvGtzObC2cpDKrnl@lists.infradead.org
X-Gm-Message-State: AOJu0YwRqW2w2RHPQ+RNCWlh6QHuxMgTOs+ffQulcVsmOUAA6Nk983gK
	E/ki1WXPBPVkeGd/n/yIKyN+BrNZIaMKESZobGgFjGyZaDHO7deDB75jV9b1EBk=
X-Gm-Gg: ASbGncs3Aq00+XcZY70c76YBIYDyKUrEpwRajfJbTc1y2zmQyntdRjxVpnz996fsTxs
	VW7Em4DUB2UHLI0hdID2DI4BC0LVzvjl6sRe2GBTfZ1cAORc74JmkFaF6Us/2wO/BxMn9xeE7pI
	Ui+1gBX8JVE84OpbHgjxMnuAQryK13Ltz8k8zWmkyx9Rz11MAJXJX2vVBeC34OaUY0Y+KEIlO7q
	vqkW9PuU64a8kBthl035Atp6y/TLJQBfEhFXL9ITJoCvcrm0JhPJx9PzjI=
X-Google-Smtp-Source: AGHT+IHRoC+uz24+SDiz4k1n+xkzf1xmfd4qsGqHEUgJq24njDiwFPRzIM3Y17oVpekHri48dC1Rtg==
X-Received: by 2002:a05:6402:35cb:b0:5d4:5e4:1561 with SMTP id 4fb4d7f45d1cf-5d405e4170fmr164597a12.20.1733675073180;
        Sun, 08 Dec 2024 08:24:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm4883698a12.30.2024.12.08.08.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:24:32 -0800 (PST)
Message-ID: <e592e292-71df-4bf0-aa8e-88a53dfc2777@tuxon.dev>
Date: Sun, 8 Dec 2024 18:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] dt-bindings: atmel-sysreg: add sama7d65 RAM and
 PIT
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <96e64f01eee264ad0ac4c720a7a1cab4f95c206b.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <96e64f01eee264ad0ac4c720a7a1cab4f95c206b.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_082435_268851_9A7818D8 
X-CRM114-Status: GOOD (  12.55  )
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



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add SAMA7D65 RAM controller, PIT64 DT bindings.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/arm/atmel-sysregs.txt      | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
> index 76e2b7978250..93c2a5a341f3 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
> +++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
> @@ -13,6 +13,7 @@ PIT Timer required properties:
>  PIT64B Timer required properties:
>  - compatible: Should be "microchip,sam9x60-pit64b" or
>  			"microchip,sam9x7-pit64b", "microchip,sam9x60-pit64b"
> +			"microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b"
>  - reg: Should contain registers location and length
>  - interrupts: Should contain interrupt for PIT64B timer
>  - clocks: Should contain the available clock sources for PIT64B timer.
> @@ -27,12 +28,13 @@ Its subnodes can be:
>  - watchdog: compatible should be "atmel,at91rm9200-wdt"
>  
>  RAMC SDRAM/DDR Controller required properties:
> -- compatible: Should be "atmel,at91rm9200-sdramc", "syscon"
> -			"atmel,at91sam9260-sdramc",
> -			"atmel,at91sam9g45-ddramc",
> -			"atmel,sama5d3-ddramc",
> -			"microchip,sam9x60-ddramc",
> -			"microchip,sama7g5-uddrc",
> +- compatible: Should be "atmel,at91rm9200-sdramc", "syscon" or
> +			"atmel,at91sam9260-sdramc" or
> +			"atmel,at91sam9g45-ddramc" or
> +			"atmel,sama5d3-ddramc" or
> +			"microchip,sam9x60-ddramc" or
> +			"microchip,sama7g5-uddrc" or
> +			"microchip,sama7d65-uddrc","microchip,sama7g5-uddrc" or

Missing space here --------------------------------^

I'll adjust it while applying.

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

>  			"microchip,sam9x7-ddramc", "atmel,sama5d3-ddramc".
>  - reg: Should contain registers location and length
>  

