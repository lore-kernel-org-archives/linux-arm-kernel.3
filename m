Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8B1CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 12:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEx08WhtJbuH9Jvv5ffuVG6XRuDs6AIyFWz3HRiJmYw=; b=Nph12L23NHX29rM5d5nfUcqSd0
	KTGhTkStxv4umSp7lgYgsxowS/aKNlZDaDGHy1oIKEGsqBTTlFrp4V1YKWslUoTAO5H2ca+GzORzW
	h5s5AMmCdifzsHwxWzLUMJnKY1ppEadG+1+7XhmC7IgdhFls62O7WE2A3LhzH58l4X0uoycE8bRsN
	6tikMKjY8LckuzbpI4FFXS/90Ka0XM+pC6Rv0QPZRfI/7iMUgX/dUThAMn6Xk+1hncrUjAA7/sZQ0
	EFmxrX6r80eCD0Xdf/1HHmxaeCzuV1pIimiETADMnXIW/sPGt3iU0qt4vJIOLgIVDX2uRpcx9s3Qh
	hTSqKBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPFs-0000000Arn7-2bip;
	Fri, 22 May 2026 12:45:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPFq-0000000Armd-0xqP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 12:45:31 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5aa1b2327c8so8975584e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 05:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779453928; x=1780058728; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEx08WhtJbuH9Jvv5ffuVG6XRuDs6AIyFWz3HRiJmYw=;
        b=JyjqtC1ZOh9zIvMNQjsCUhdxh/duIvIPUHO83HIvKv01U3u50QzFxjQadcY53rA6Jz
         6Gm7aI//jWhrdwN9RDIAtFB/+BKv6cBr7qJjai7gPSEV/Yl3rhtCUIBKe2felhMShUin
         5vzy/dOgEAVeiqEUIP3rCmO12UchyjN0GHvMrxwM4gCIw4iwMFelv3fQ6CH8Vi5a2PvJ
         qfvT7xJi3i/rlRRGNHHwSjiWahpkSh6F1GLvNZPQ3r+N0dLfjohSQzRF0MATwCZx4BZt
         UP2gYuqsbOlM0G9WuQIO8XxSYLrFTX8ohXCjRcDGWdudTNddNI5MBcVPICTJG1gelK3m
         X5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453928; x=1780058728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEx08WhtJbuH9Jvv5ffuVG6XRuDs6AIyFWz3HRiJmYw=;
        b=ebNMj79lTzTQacRR6rdiJWs3sEG106Z0tniuFMvLLkQnNwx5LL9x1k6axRpWNFmd31
         rLEXpYLF045mPYHdt1mgniFa+xuNZe0+AHU1rNZRarZUiIUUmqVIvpUYC7fSL8KK8FCn
         yoqxF5Xt1JqfIzFmHJe78nxTBlAGPFnprmPtj7i14qMVr1EWf27CfhNj7YrppgFOy4cH
         t5HjnptoZ7Xg6gNVTI/i1utERsjASpcC4csAhw9+8jisu7pikLSFlhwwrOAugoOTGQ7v
         QdKj+aZCi/Qw6LRDPv/+SznHPZHq0A36XLrwkGsqwRow5GMWcqIjrSHf9M5VfgqDcOZ2
         QJfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oj7qcpRoAi55MSlcLOdzW3ydgEL77BPyuzFOm8e0Jze67EySabs6sSDkNxr+WngRYWVCvDxoc7Vy5ckvr5W24@lists.infradead.org
X-Gm-Message-State: AOJu0YxFBPsj4J/SQRkxgOz3afqLIKbRFc9/h/Zb+9llz4nq3FQiyRqj
	JG2As7AkfRexx8AQwUKbo3YcOFpsMwL1MHDBNWxThUAK/Zy413V+B6LL
X-Gm-Gg: Acq92OGWzNKz2CO29oEqn6QQI8a7jjJPjcWQISPWUvRA0qVHeelgnsb3F1fo5k79+Sx
	al04wPFXEwY1hQdRreauXuev1WuzegsR7cC+iFcgSJod63citkCwWnFKM1D7+PSpm+h/VA6zVW5
	fXeh7vjUuxcks2jGb1/OgNw6FKUDtAHDBpozs6fP37PXla3q74+jq3TiGccrIp4iQ5PYX9eZjb7
	E3OKxsNwI495U8t1yS3c9BM29s1OFELwpYAKJcnGjYoQuaQwd8dKtnDGZ3tDORArTLtedxOZrlO
	b8AYqYEzDnhQSd3cWikxDK4iKGQG/aHESxxd5NGiVhhngfcuGDk0XOfjccjF9Y/FcRw8AlKegio
	M8eyT0odfG2hFxzCyLajtBfxBmxm4fZJFOzXkOE7x/fjxMHbmIeoUzhA0li4FkKn+BRcQnYJsHW
	a5mssmqejcOsuf/ndBxus2uoOpOQJ13qqwwVg6ILiTq4heSrVu55pTmg1ej4QM5WRxQn7bXsso/
	dTNCVOG
X-Received: by 2002:a05:6512:33c9:b0:5a8:64c4:38c4 with SMTP id 2adb3069b0e04-5aa32314258mr1031399e87.8.1779453927777;
        Fri, 22 May 2026 05:45:27 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb37bfsm401018e87.11.2026.05.22.05.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:45:27 -0700 (PDT)
Message-ID: <55c36da0-6cc4-4c95-88ef-3dd5b2181b0d@gmail.com>
Date: Fri, 22 May 2026 15:45:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Christian Lamparter <chunkeey@googlemail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-wireless@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, Netdev <netdev@vger.kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
 <20260520183815.2510387-3-arnd@kernel.org>
 <b79d8ad9-f36e-4769-9dc2-58baefe23000@gmail.com>
 <681f328c-bc8a-4410-b876-f8c5f116325d@app.fastmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <681f328c-bc8a-4410-b876-f8c5f116325d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_054530_299610_4A85756C 
X-CRM114-Status: GOOD (  15.70  )
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

On 22/05/2026 11:28, Arnd Bergmann wrote:
> On Fri, May 22, 2026, at 06:55, Matti Vaittinen wrote:
>> On 20/05/2026 21:38, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
>>> passing an IRQ number instead. In order to keep this working both with
>>> and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
>>> the gpio number if an IRQ is passed.
>>>
>>
>> I am (still) all fine with this, even though I like Dmitry's set. I
>> suppose you already have a plan for merging this, but I still have to
>> ask - why the MFD changes aren't in own patch? I feel it would have
>> simplified merging, backporting, reviewing and reverting if needed.
> 
> Splitting it out would break bisection: The gpio-leds change without
> the mfd change causes a build failure when assigning the .gpio
> field, and the reverse causes a runtime failure when .gpio=0 is
> a valid line.

Ah, yes. Thanks for explanation. (I feel a bit [a lot] stupid, as I 
somehow missed the problem of .gpio = 0 being valid. That even though I 
had it explicitly set to -1 myself :rolleyes: ).

No further questions ;)

Yours,
	-- Matti

-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

