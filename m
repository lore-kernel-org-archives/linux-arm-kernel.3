Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C4BEB362F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrB0PoGv53HSDiJNHmmqkSqXpBZqFv9SHC4pxN35SCU=; b=P8RRpArpY23VOOkwqVQWR+zr0T
	o53I4gGxfpD76ChFin46UXwOtbiJHqGNjvRIgXIMb1yFZdmbChnVn8WW5P7NTsLaE0oEaslCJzKIZ
	+ZxmDHy0uS1I4dmiEdXr3a9vrWnsZHTQ5POsi/QFCcw5hayLGxPGeidAmQpBe83+mJrCIyu2fzzJR
	VhUW/u173kFxh81nLWOzYfgC2gT4UUWmg1YM4V9LX38VMhRmZ2IiqEzvO50ZerHRQ9CdfDd/D/wkP
	702X+N/JNOCpggChu3KSU7sFige83CI0TIrkq89V0CyxMZTNKKWgq2H79DBPwdkg/NyoGppdI5ZVd
	h9ZnZ1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx95c-0000000Dkey-30Af;
	Mon, 02 Mar 2026 19:38:00 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx95Z-0000000DkeJ-3HjO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 19:37:59 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1277d379936so5871712c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 11:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772480277; x=1773085077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MrB0PoGv53HSDiJNHmmqkSqXpBZqFv9SHC4pxN35SCU=;
        b=iAY32eIXvfC8sji/FYAxUBO+s4eJom9J7j3s07fy2KnAdzeI3AKBGeq+CJrt+67ElK
         TRQL8rKkwPj7YRFiGsIlCc8yxFzw9m6IX+K13hm2WpciscYvRByaFpRcPv8kcZSKSxp6
         SHNJjxZKSubFyuhUhYL6jKA1MK3so40/0PXHDhDximalai36wBVHho61nlMdTpxQg3zh
         +EBborUnQAMHBX0PBYxTmkJCTAQj1AvRRkTrcW3EXasdjyOLAmB22K2Lh9xVyj6gDaYT
         FJz7k33gQQuN4DI2rrYbYTITHRbH6ceNNDeJhZDOa5U5DvlVA1S2k/5iqgqB7580cBWB
         kmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772480277; x=1773085077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrB0PoGv53HSDiJNHmmqkSqXpBZqFv9SHC4pxN35SCU=;
        b=DZNNVGtZ3v/chSLII0kbcZFcRcxJ8KCTgDJfGGvCFOWmxwmUqu5xdvYIzHkqAmL9G7
         JKFl1ibsTReuliblz2XjrJhvWGNubbr72wcVWlJmy2nDQVlOAoVTvDE03e5nI3SAQG+G
         9NpLB4V97djJQo1fcjZRQhjP4qfTHFeeqXRRK8/OS6jFZN0nIoxUJliKakkcJMbK3Vww
         2062x4sdM1tzinfOzhbJqm4E9bRQR5RLfHhOZIWBz4UmFgp0FSjtXqOEU3p2yMwIsLOL
         W//INnXBZZ1Of8Yq27MKHFys6P8yh6tS6OqscH54V3GHGW8QF6khGnR8dskiBc2HjXXq
         sXnw==
X-Forwarded-Encrypted: i=1; AJvYcCV01IF767nYl8VWjHS5+P+T8EdAyYcTc05u3nOJuDdYa5dP67ha/xTp4fsggb1AyPH0Rj57K8MzuhXcRx6S3Y32@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1tOXMXIewSi9NbD7Fpr4hupULaoUymHAxv/1D+mF2xrYNGSWc
	cF+a6oFU/i/Xlk2KAgAcZAAQ0VBZw0GXsVvglb/lM70RStyIhFw2xuJs
X-Gm-Gg: ATEYQzxqOodyScczOG3sOHyDUk3BNXTr0pXN87TEkPfkPQOXGmUytAYE0H767degerh
	THV6AXdUig38z4xwDWEbBP7g7PNP1YjDuc6taRF0NEVga0it+0jr9h6JFkDAI3J7h9CMOg+XHn8
	afGpsNZJKsr+eCzeT3kAul8JlgqcDusvxtJcmQNj1LmLQG76phPwm/jnFp/uarVZIrnVfafV1Mp
	yznxN3ZNJ8f8zrjDC2zTyCpsfBrabuZClVD7oecd2haI5hefOktN10Di+tn29Lm00gEK+hea+Fy
	dAXJ11Zgadf67FmAek6FeDweWWPKqfI074e0EVd+i5XzhnfKWGE59eo9ZsVicAjX5Afifrnv4SH
	qX7mGLS/+RSunkbcqX4pKoqz+pCsiu5lV7vds/X2JjKm1l/4fwr761wssats4Ogm1wu2MjuA6p4
	EwlYhtUecI3ATmAyuAacE65WdiqtVp1JICS4ArC8Z36YoGLiVjbYhY33TmSmlyVYrTFlh42mVj
X-Received: by 2002:a05:7022:b8d:b0:11d:c04a:dc5b with SMTP id a92af1059eb24-1278fc38dd4mr3574345c88.30.1772480276734;
        Mon, 02 Mar 2026 11:37:56 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899df36asm14915952c88.4.2026.03.02.11.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 11:37:56 -0800 (PST)
Message-ID: <8b64ed01-a635-4476-8ded-20496663b205@roeck-us.net>
Date: Mon, 2 Mar 2026 11:37:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: bcm2835_wdt: Switch to new sys-off handler API
To: Andrew Davis <afd@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-watchdog@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260302180853.224112-1-afd@ti.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260302180853.224112-1-afd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_113757_826780_A3F2F140 
X-CRM114-Status: UNSURE (   8.45  )
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

On 3/2/26 10:08, Andrew Davis wrote:
> Kernel now supports chained power-off handlers. Use
> devm_register_sys_off_handler() that registers a power-off handler. Legacy
> pm_power_off() will be removed once all drivers and archs are converted to
> the new sys-off API.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


