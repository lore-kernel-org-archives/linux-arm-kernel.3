Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30E9D7977F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdW//g6dNqevqx03cSVi7ZIuci+YN4ji+K9ErT7sw40=; b=KHG6/lH5cs0M4EN2AJVErMXme2
	2I0WTIe6vvDv0+f3MVU06lX8DkAaBzqosKaTuprxo+E5rYhQqcDGx3SzqVejjujh5Y5bGj5GUzye2
	v7n9vYN0Frzeh42ezLMZNjvGISzPhgUz7IVal/hSdsTtFOKx5LLQVZdAW/rS17K5vM9yqHX5FXvOf
	G/VlYvZlOwEIa9vMWORwSFlSz+Hwv6s5UNO1YKffsxQT4f18pJCp+lwzo406DpbFszL/CFggIXRTq
	GXOsJPrDVFqzhWkJ5K65Iqrtln9sq5HvJ1fx9Gfe2dJlqvwWVUaq+fbIhLCAq0Z0gHDi3ImA3fRJF
	uwXB3MPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmD99-00000002lGd-1lI5;
	Sat, 31 Jan 2026 15:44:27 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmD94-00000002lFI-2Skr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:44:25 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so2631574f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874261; x=1770479061; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdW//g6dNqevqx03cSVi7ZIuci+YN4ji+K9ErT7sw40=;
        b=Ym1U/IfTZqwXug6bqhRZQ3+QrkdNkVT7L5taSkpqqvKUtVzukt2FHttLuMZWOv3M/e
         88IOn1sBcyFo3Zn7JpBaKonJ5m4wnKX0OcNlxRqIz0+pPuoYcnDA3os+9bbTjw5eAr/I
         KOkTcREl2XD1OXhgw6B8tm86UEpFkTflb5x0qIWffHifsoL40Xin6+bMeSjI7C85pxLi
         M5E1LBIu3Zx9ZbU4ZpYDLFRpt32p1tEzhDbBpgHNTbGohZYyyZ4tjQctFeUBXib54gRt
         NJHDwLxGuDbqo9V2agJlqtf0983D5QyF+wDRjeQH7aoliFkTbBHCgbYCs2zvmP04UKJV
         JVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874261; x=1770479061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdW//g6dNqevqx03cSVi7ZIuci+YN4ji+K9ErT7sw40=;
        b=nu/WTPMfkeaoHA3x6QJslKzr0XAVLZFK01vGeWI1uLjy/w8Ft/7IMuV9R8LuystEJd
         ne/9oiFJFNweE7rpzXAM8tnbMWRrQ+VNl80SlGpGPNZt1Ze/AGQbjwJUKFMp5IxBciIW
         ClsS8Gqa1i8pQVHFH1s5TeeU9qqwLHbwUkn5DiEBI/G0bJy9SK1GcXvKHqdQV6eJRTn8
         XsQqp3BazWXjDWDofoIEwLr/lEgvB8QczE7fbYghs/FsjYTg5p2WEZ3ItP5UJdvRArAF
         LSrGBPCOA++TykHKzKyCe+3HvSen/y3sa/7Sjm2j5A8gZy7Hy3wIlr3Ty9HD8PdSpseh
         g0jw==
X-Forwarded-Encrypted: i=1; AJvYcCU/Hk1U2OdWPvh3yGUJiGmHYdWX2F7IccyO50274DR4LDQmhsCrDuOysqPppnhBtleEWycwldiCrZOWCw0L3S1I@lists.infradead.org
X-Gm-Message-State: AOJu0YwwAiPadDvK1xfBoi2/b6AIAbxJ3S1Xc8RBTYbu//NmNjDKvM0S
	w5upr/uO4R3neMFsL8dQkLiPO2hWnjFhRTqbaebYALmYrg6d9oAxfEcdzpMCwn74KP4=
X-Gm-Gg: AZuq6aI3qSPWwjLpF9XGiMbjZ8CgTonGcg6lp6UHQAJBi65J/AkrVVjWA0tXrrFKf7S
	9KdSxkcxt9fATBVfzC4Ii9MKQqlmfPB1fKrbcrf7glva2ivAfAgivOTndtvrp7jD/3VsX9Kg9Qf
	6LkUZKU2beuJZtp9+st1qpJ9KSWXsMGnocYrpiHe0bkIa3W2hKAozjQ4A8LdE1PYhvBVWiRQCg5
	yYiJ0P5mazEqbWbASr7yy/JKdHSLUVFgsaCQmsTlpNhnIbLulro1ev1Mj+g85oYQSTphaSNxWYc
	aH0gE4ApDXl38ycxU+KGBdO2Bc/Nktk4wTsP8guydvV1r3ytUpulQ3hzAcT22gfGgt/1tYec+aN
	ZmtZREK5boNofujzO+2dFZ8GQ3W28hYkkevRePraw/Qgj00iBLp1x8iS0QfN+9zhWnSv08emEK8
	Y0r18YBzABDey5fW7QUQ==
X-Received: by 2002:a05:6000:240c:b0:42f:b707:56dd with SMTP id ffacd0b85a97d-435f3aa79d9mr9246341f8f.33.1769874260757;
        Sat, 31 Jan 2026 07:44:20 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323770sm30730507f8f.32.2026.01.31.07.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:44:20 -0800 (PST)
Message-ID: <b932cdfb-9197-462b-abb8-e7b4c7ecab6f@tuxon.dev>
Date: Sat, 31 Jan 2026 17:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/19] dt-bindings: clock: at91: Allow referencing main
 rc oscillator in DT
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-4-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-4-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_074422_653930_62A767FA 
X-CRM114-Status: GOOD (  18.63  )
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

Hi, Alexander,

On 1/20/26 16:37, Alexander Dahl wrote:
> The main rc oscillator will be needed for the OTPC to work properly.
> 
> The new index introduced here was not used on the four affected SoC
> clock drivers before, but for sama5d2 only (PMC_I2S1_MUX).
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - adapt to different base changes, added lines are the same
>      
>      v2:
>      - new patch, not present in v1
> 
>   include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
>   include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
>   include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
>   include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> index 91f8f863ea076..1f6bb51780d09 100644
> --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> @@ -10,6 +10,7 @@
>   #define SAM9X60_PMC_MCK		1
>   #define SAM9X60_PMC_UTMI	2
>   #define SAM9X60_PMC_MAIN	3
> +#define SAM9X60_PMC_MAIN_RC	6

Why 6 and not another index? In theory, now, you should be able to define here 
all the core clocks IDs (as these are known from the manuals) and prepare the 
driver to allocate memory for all of them such that the driver will have to be 
able to work with old and new device trees w/o further changes.

>   #define SAM9X60_PMC_PLLACK	7
>   
>   #endif
> diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> index e1dd41fe75046..657f32ce10071 100644
> --- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> @@ -10,6 +10,7 @@
>   #define SAM9X7_PMC_MCK		1
>   #define SAM9X7_PMC_UTMI		2
>   #define SAM9X7_PMC_MAIN		3
> +#define SAM9X7_PMC_MAIN_RC	6
>   #define SAM9X7_PMC_PLLACK	7
>   #define SAM9X7_PMC_AUDIOPMCPLL	9
>   #define SAM9X7_PMC_AUDIOIOPLL	10
> diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> index 09d152da6db44..ddcb236718978 100644
> --- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> @@ -12,6 +12,7 @@
>   #define SAMA7D65_PMC_MAIN		3
>   #define SAMA7D65_PMC_CPUPLL		4
>   #define SAMA7D65_PMC_SYSPLL		5
> +#define SAMA7D65_PMC_MAIN_RC		6

E.g. 6 was previously reserved for DDR and IMG PLLs.

>   #define SAMA7D65_PMC_BAUDPLL		8
>   #define SAMA7D65_PMC_AUDIOPMCPLL	9
>   #define SAMA7D65_PMC_AUDIOIOPLL		10
> diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> index 0303cae56f849..e891715a35173 100644
> --- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> @@ -12,6 +12,7 @@
>   #define SAMA7G5_PMC_MAIN	3
>   #define SAMA7G5_PMC_CPUPLL	4
>   #define SAMA7G5_PMC_SYSPLL	5
> +#define SAMA7G5_PMC_MAIN_RC	6
>   #define SAMA7G5_PMC_AUDIOPMCPLL	9
>   #define SAMA7G5_PMC_AUDIOIOPLL	10
>   #define SAMA7G5_PMC_MCK1	13


