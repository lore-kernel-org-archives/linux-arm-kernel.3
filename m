Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9474E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAP88DzTTa15uBA2TewRSQ1lUwNGCSJEF8LO0raYTt4=; b=kgKMdU/R8hZBLKiJumCONr4pQ4
	+ui/7iZPwqtfM39qegjVOg07cNCZ9xhzoGtOa8pS70gsDpgDAIvDRg7RUb+h7vI0Yb3kUKoyBcnaC
	9znaUjE5zN5dVgbROTf4lKGcd1kBfkUyevJugD05Df2B2d6j0DbR2f0TTc5mtDcK5W2rYe1nm/VIr
	uwsl5Jx9AhpOMnwoNoLYD/uoSCM82AgxPWyxtWD21l1FMtXeLux3/WSMy0I0iyn2lj9nGsQdOD6s/
	pJshWGpIthYCQ1EQ8FH6IAegHv1nNBQTa+wnAApjk6CmbZRI9ygvCRi+kLWPxOSP74Sgbf6UStJ0o
	r0+IH5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKK8F-00000005Y6U-1oBM;
	Sun, 08 Dec 2024 16:27:43 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKK6y-00000005Xwx-0HOT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:26:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so1471305a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675182; x=1734279982; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAP88DzTTa15uBA2TewRSQ1lUwNGCSJEF8LO0raYTt4=;
        b=L5WqjUkMYzbL7DRfsq4wbx6NAP0wPWSYlzadpSBMKUc3h555268oHd4FNz48NhXR3e
         P2/SpHcwlq74cSI+TFAFNTWSA3MIpp35G7ZkMI+4PdC4jxdUle7a5VfQUFoyWU0AKyTJ
         OAbPiUr78CJm3Wz9kw1kxdal/XEmZUbLbRE37UQGMoPE437Ym1NWUlnCZh2Bipvnzm0K
         7gfqzbBLy149oGrJj7jGFSdq8IdU4C4c1BUgD0n7GQHIIpL4JXVtDfunJbuNfpqXCTgF
         ux7qeOi/4T8SURdeaeLwSQ8ZqPUfuuOu1tSL/zvXzv2bA41+ctL6ydZmTtjCCsuR6F5y
         WJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675182; x=1734279982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAP88DzTTa15uBA2TewRSQ1lUwNGCSJEF8LO0raYTt4=;
        b=RxbtAOUcuc9FFT+KSAoM3gWIaX8bdxxM/Q6yxYOBLgYlaqWlQDibI2U8RdHuuzXE+1
         ItgjPfPAr6FgCM485+CI4SD/fo/tEVlQUDKohLCWSu9z7IiW4anPN/4FcSHfhiOQr7VG
         WY2jrHfURUxYBcKQ5GNWpO7geXB+J1geWbN54SK+jN2yiWjTtDs5DtthU7FnecBsD4aX
         jrXwcf+C8nRQ2FDASZLT2eSuH5U/K1hd9UfaBsSgMa/taERXQvS4/KyBc5S5mYYzRzaD
         TcWFgsoh+E3KVNzKzDOJkROgltc0TRLsPvDqsKIWsQTVk1kIY4ESOUpCQAlkzsB95xme
         ZE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHQmuk9pTbvKzv2a/OTEGOxUZ2lbc2OBgbfKUJ89oqfiG2AS5aRex3Y83rRSRk4D1i9wWd4LAxVUs43HLzGQ9D@lists.infradead.org
X-Gm-Message-State: AOJu0YzHtPQOMRsfz7qkdsciwuD1tVynFazUKT/ei190Ujz0WNoWiTvJ
	k9fUG4v+rpae/aXxgUvIZq5aCQ8tLNxhH4wrRYaX9M1qYqWblO0mbY8FaQAY7fI=
X-Gm-Gg: ASbGncu7zzq2ByURDnam2ycbCkdkVrEYHZaTHNBqVh3d73JQU+AaJspABPC8OSzwf6P
	BePXEbUjpsqk6mgBH/lPUtzs/gpvekeNqW1s59kVzs9cCWUH6EClcz9shd2MgwnkBGMdqb54nmz
	boc6dvum6WlN4IQPT7PnBJwgejus6n+B7ncQQz8Md9AST2LL/iCpL1fo32ACdjVW+J5sYHqegey
	Ku3MCtXWyqd6bvsYDjs+mOQIrY8/7IQgtNUttOtiQKCN++hxZEWfuhzNAehKOA=
X-Google-Smtp-Source: AGHT+IFxY12KAhRWbQXwONnJAJURFo6LciXJ7/zgNx3XbUIqPdq8RMUGE7iRkFtZbi7PYG8M9RNg+w==
X-Received: by 2002:a05:6402:913:b0:5cf:b079:68ef with SMTP id 4fb4d7f45d1cf-5d3be70113fmr8820202a12.26.1733675182323;
        Sun, 08 Dec 2024 08:26:22 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm4883698a12.30.2024.12.08.08.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:26:21 -0800 (PST)
Message-ID: <7177c349-a22e-4501-b42c-0c62d94c2f76@tuxon.dev>
Date: Sun, 8 Dec 2024 18:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] dt-bindings: clock: Add SAMA7D65 PMC compatible
 string
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
 <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_082624_115148_1708C031 
X-CRM114-Status: GOOD (  14.23  )
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
> Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
> since the SAMA7D65 PMC shares the same properties and clock requirements
> as the SAMA7G5.
> 
> Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
> the clocks property for sama7d65 SoC.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml       | 2 ++
>  include/dt-bindings/clock/at91.h                              | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> index c9eb60776b4d..885d47dd5724 100644
> --- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> +++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> @@ -43,6 +43,7 @@ properties:
>                - atmel,sama5d4-pmc
>                - microchip,sam9x60-pmc
>                - microchip,sam9x7-pmc
> +              - microchip,sama7d65-pmc
>                - microchip,sama7g5-pmc
>            - const: syscon
>  
> @@ -90,6 +91,7 @@ allOf:
>              enum:
>                - microchip,sam9x60-pmc
>                - microchip,sam9x7-pmc
> +              - microchip,sama7d65-pmc
>                - microchip,sama7g5-pmc
>      then:
>        properties:
> diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
> index 6ede88c3992d..e37f1b9cdabf 100644
> --- a/include/dt-bindings/clock/at91.h
> +++ b/include/dt-bindings/clock/at91.h
> @@ -42,6 +42,10 @@
>  #define PMC_PLLADIV2		(PMC_MAIN + 11)
>  #define PMC_LVDSPLL		(PMC_MAIN + 12)
>  
> +/* SAMA7D65 */
> +#define PMC_MCK3               (PMC_MAIN + 13)
> +#define PMC_MCK5               (PMC_MAIN + 14)

Spaces here --------^ instead of tabs . I'll adjust it while applying.

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> +
>  #ifndef AT91_PMC_MOSCS
>  #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
>  #define AT91_PMC_LOCKA		1		/* PLLA Lock */

