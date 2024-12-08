Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68EDE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iT4NSRVpd0erHt+8HYNhpTfhW4lFJNhq1fa73nwHoQ=; b=4gdxfwVH+S2CmsrBUyChwtlhZO
	x4ZzS1UmedC2EoNioVup1ftU1wdR0oHaLyyHrymQCo9q4Tp52KaCZZ3z3Hn9Y5NUSAOrDpckFmDKw
	T1baFHo+lUfoYtlvhZHPeM+ueTxa+UZ9Pv4tngjx2zNarJaB/JmYICinhFD8vfKrUOToLOGQPy1vS
	LSPjYY7J8ywwy0Ea37I3Td7pua95ZBAaeyUzLkS4du1fXmBz3nn0D1xjfTlt0qt303QxkVvTUE+OS
	Vm8pH16vZZi59X3A1Nj4R4I357JQbf9Y4IWSeFSlD41EcEOhlHqEUs1YdJeo59t0QlvrWIjATXB77
	Q0JAm6xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKGI-00000005ZDP-0nyu;
	Sun, 08 Dec 2024 16:36:02 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKEh-00000005Yxq-3IG2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:34:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so1560065a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675662; x=1734280462; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iT4NSRVpd0erHt+8HYNhpTfhW4lFJNhq1fa73nwHoQ=;
        b=ZGffbM1xPJx2/Y3RGkj1RKA2OQX1v9Kxy9QL3tyD3KY8KXc73tGkSgg4GZJFJYT7xs
         vCZBv8m/6fipjEQven3KzS+lgEqCcyhanuxYxQwxJRchVHVzN1D8dwLkRRW5YnfcvYsG
         sIvMvbXMEKAQIuItXUgstgY/Fd2YnSHqK+670c6AAaqKvw8mp+wr/zHDUxWq5fQxOwhR
         4FlQ+TxJS8j1mI5alFe0+LT9IxVc2s6wQ/vEe2Lrjzk7qWXL7fIL92UKEdEPMS8UYNs7
         YmOGPK2LDu9zbIJL3Hypt+nwrrxO4ltn2iZ9FP0uEKbtMLndDLMYhZA6wkrnpLHjdjaq
         YH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675662; x=1734280462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1iT4NSRVpd0erHt+8HYNhpTfhW4lFJNhq1fa73nwHoQ=;
        b=rBBm/6VKd9mBBFFOt9hARj4fAz8dvlwM74qHtRODbwkbzerc9+cVINe0aw0g55oeEC
         P97MCqvikcd2kiztWWUpsdaVjApJ3rRRjn7zv/O0WyNY4SeQ38RfOGUffuARXMMpunt7
         CjYzhZhuc4YP/JAgIitXR2rZhgDbUjbF1zrjfAYJsSHN8g8n2B0GkNQ4HrtO1G5MfAwn
         N5FVDkXK7GGJ8CWqdvJ/mfWwHF/DWTXZOPOjo7A77Xv0p7wRc0TQ6AxyUqCBsZIO56iw
         HgCi2xPzHfUuzwLnOnUBSwzbJLRearIUNhJlNX0ScNRO8wpAns1NBImSB/7z7NOO/bY4
         XDAg==
X-Forwarded-Encrypted: i=1; AJvYcCUyiyeRqYoJeXJY0ODMT5cCPSnn2Y4vGs2yOAxd7a1z5+iIbyX5J0pWtdOPnpkBKuxXqIKz4Bfqi2e9jpklMWVP@lists.infradead.org
X-Gm-Message-State: AOJu0YxiO7mDDZkb/gbeHpu0fT7D/SUwP0bV+6pUUR/Jy89lcdQUi1kW
	mXDOBQIu9Ab204lZrPM6W3KXlE10I7s6HucVed/TjmLRgdCd1qGdBxBGq3JdSQc=
X-Gm-Gg: ASbGncszb6V6OfaS8u+K9oItuJBbJ3+Hb5qul7G/MYgS2XAQQGaTzzvepH6ccJQXqA2
	AsZqzNfHfuOaA93lKNoSL53xxbZIcY9UrzwlPx3piHhfpXhtSQK/GInvItiC4NeBb9dIPgzh6EG
	lgats1g0L+1wLzD5eltwzZmAcCOAhd8G/815T7yEMO3LdWkSt1Oqsk9o/8GnkDyWivR4qlySIml
	1H/PYklCZlkyk3FozKSFFEykx7g1kHz6GmXgxBZIOTTDz1PcPPDGczU0cU=
X-Google-Smtp-Source: AGHT+IHiWExZ8bPK4wGroZLlYPeAABfeeYHqCY2Pc7mcSXStanDyIam/ppcbW7eqPB4JrD4ws75z6g==
X-Received: by 2002:a17:906:314e:b0:aa6:57aa:1fe9 with SMTP id a640c23a62f3a-aa657aa2b65mr521603366b.51.1733675662072;
        Sun, 08 Dec 2024 08:34:22 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67a4f8dc2sm113804466b.179.2024.12.08.08.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:34:21 -0800 (PST)
Message-ID: <30d2d8af-836c-440a-8b39-4131e8c85540@tuxon.dev>
Date: Sun, 8 Dec 2024 18:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] ARM: at91: add new SoC sama7d65
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
 <465960c9240553753e96a7f4ff3f48879ade7558.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <465960c9240553753e96a7f4ff3f48879ade7558.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_083423_826592_69842760 
X-CRM114-Status: GOOD (  12.19  )
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
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add new SoC from at91 family: sama7d65
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/mach-at91/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index 344f5305f69a..2c7179b1baa0 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -58,6 +58,15 @@ config SOC_SAMA5D4
>  	help
>  	  Select this if you are using one of Microchip's SAMA5D4 family SoC.
>  
> +config SOC_SAMA7D65
> +        bool "SAMA7D65 family"
> +        depends on ARCH_MULTI_V7
> +        select HAVE_AT91_GENERATED_CLK
> +        select HAVE_AT91_SAM9X60_PLL
> +        select SOC_SAMA7
> +        help
> +         Select this if you are using one of Microchip's SAMA7D65 family SoC.
> +

Spaces ^

Other than this:
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


>  config SOC_SAMA7G5
>  	bool "SAMA7G5 family"
>  	depends on ARCH_MULTI_V7

