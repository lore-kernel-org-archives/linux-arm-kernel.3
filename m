Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54679C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEkfejIw1pTO7xQTKbeC6S3IuRHAGhwYTjYXnJBC6zE=; b=f4Ii+T9F3wMFikmRsTYHlCfntP
	CI61QbXwsklGEj772vgrbydIG4Iwa0NZb3567cl4krmmxkm1gFBhPdI6LmKl3HbPGGxVq3D0UZTZh
	pGRnBKL1tdcpwC5bqJcjjj3NUpSG/1M0ObRX3cFqXml0P5ll/MWGq8JbK3aVRmIpHKTp5TcFI8WKD
	cWTNW6fgXYlbWrVjKYbGcshGACTBSLnK2u0HdeEdIvPL5mAScD0V8DZNDvfcqw0gkU1Q0Rn+9J81P
	626spNlY4M2cvHsG1+KzxbeZlk7HUO6jonFCs3ZqAuxInF3XbUlLZDLY+Lgk1EUwfqXFUyKnnIveJ
	i64vk8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vyH-00000004vLe-3D6g;
	Mon, 21 Apr 2025 18:34:21 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vtA-00000004umS-01h6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 18:29:05 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3485466b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745260143; x=1745864943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LEkfejIw1pTO7xQTKbeC6S3IuRHAGhwYTjYXnJBC6zE=;
        b=L3qROAuwNmZ24Hjo9OIy8pviKUQB8yHi2II/aSCC3yNrD5s6WKzv5fll/Nf7StJMJS
         K2jTnecXO96ESVut49aXFpTMFp2TKFIXFCef7XnnRKIulJsxoTgwWCSUQOsccmZzxyIA
         w05IEh0KO+xZwe4jfcOp5CrskRk3wypR9eNNHekQ5JeyLzs+daC2KkqWpiYoMo/y3Fn/
         MSZnnlFt5oflXP2Yom1wSvOlC55qzOt/stYeoUGeXjELmY+EcRd0R/xjdzb8qf+Adzsp
         HtleRx+nIoeaEFIorsO3qyKSJfAnpMiW/zqi7HxbJjOb/mU8u+ZRoSzdX7ctrsnnDw44
         8iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745260143; x=1745864943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEkfejIw1pTO7xQTKbeC6S3IuRHAGhwYTjYXnJBC6zE=;
        b=cTzwYvUS2JNDQfbR9bbIPVjqDP7yR24/XfBotRpSjYD+/NiYeJZuMq6Dj+Aqm4Kg2m
         l55S3oQf3bVcmgZ8ec6HBF33s/Gb7+Yjv3X2vtwn2m3jRiOWuo0ONBQ8x6C6ytZqbsMj
         H1YKWYf1lKfL4Dggz+gzqQGlMXYhtFGn10qLz7WO2GaL+8HdhgNZi8nve0o99rsXwjwj
         /3zMdVwSTtVEesVhElwfKckVTAY9U6AildgHF7uF+D97RN/9G7Xi7KsZTJVCmsui8gcJ
         1aav4BEFhNP0KcIGie8devLXFclFT03A/JJhQobDxM+6cZAWsBOxRtOzVilPOX3ELSzj
         HbRg==
X-Forwarded-Encrypted: i=1; AJvYcCWjMJ2KXNXSU2tAXZdmdAgUmLWqiZI2heg5RTS51eUNv46/kpJaq8FFykn25X11LgyVaWzJXBScP4MQhfgkBng7@lists.infradead.org
X-Gm-Message-State: AOJu0YxHT2SDYPCG79gmGXjq1r0v/RESXTFG4ZMH6UvgQ1ufzYKOZGD7
	b93K/+x28O7TDGkQg88aZCCwCt1irhiXtmk6L1qSIvr53gLkwam5
X-Gm-Gg: ASbGncuzahlLsYVjbPXxmUkKjT7EW1g6kesrwFbRjsrufiVh1ZYo7I8fCc5ppsUI+M/
	wJ+ONTZK87vbZoi9V7pMLWSZFvf2YgomCh5ehLVdPC5Ab9wvtMBf/iCI0AFt01xRHZQlrVtLX5n
	WZ8JsfPvRhUCHS5SkBOERtqmEIJNxnj9QoA4EDof1sw13f1Y1Li/JO8mJgg6dOGS85W63O9F8/K
	FAElN7N+BcA6FaczpSJ4kI2sLnayNnAjKFJpOE/2FnCa3xm0plWPprLSYuDwgMiXcUQLAymEbAf
	ZE9fzkOjlEm+CGhMBGAnJM8LkHUxW1jNE9Hpick0LfYtVG5w1BBofQiRVnGrpbedcZSUG+HL/ia
	/KS5P1eUD/gMngzdeJfNdizdS
X-Google-Smtp-Source: AGHT+IHZ7aaJiKwDHEgBaIUKXOY9XmDU1DAmhPjLIz0F50JBRbZvABqt/8IIpKMjegOYyi51WnyVuw==
X-Received: by 2002:aa7:9306:0:b0:736:d6da:8f9e with SMTP id d2e1a72fcca58-73dc119fb18mr17166388b3a.0.1745260143068;
        Mon, 21 Apr 2025 11:29:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm6940807b3a.76.2025.04.21.11.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 11:29:02 -0700 (PDT)
Message-ID: <a6b7948e-3143-4836-b9bd-81c652a08aab@roeck-us.net>
Date: Mon, 21 Apr 2025 11:29:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: s3c2410_wdt: Add exynos990-wdt compatible
 data
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250420-wdt-resends-april-v1-0-f58639673959@mentallysanemainliners.org>
 <20250420-wdt-resends-april-v1-2-f58639673959@mentallysanemainliners.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250420-wdt-resends-april-v1-2-f58639673959@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_112904_049495_6B192677 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

On 4/20/25 12:00, Igor Belwon wrote:
> The Exynos990 has two watchdog clusters - cl0 and cl2. Add new
> driver data for these two clusters, making it possible to use the
> watchdog timer on this SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


