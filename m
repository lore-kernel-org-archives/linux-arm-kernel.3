Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C50C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 11:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duDxhGSUaa+DKP3WsDW9rwdEeqUl14A6M/ImrV8wnQY=; b=Y3jKFmlappeO+iHkVCsZcmFIg5
	Y/tjyX8WTmHb229NkDo6p0569XXFtwZK/fVmOt0xJV+z1wkZv3ShS6eJzmzaIBxx1HoWndqjEqo2p
	WmjnEfEPsHkjjS9w//1wHxT1/rk9kxWvN3WvLaVjXsL9yJCeHHV3IMhbaSqvBHNef+f9cPkV4R+/L
	C5XwypRXCcLOyfFkxFJsztZ4zvj8Cdj1SVS140ZIB2NtiC8DE2Y5IoYted7xriEYtKY7UADYjoqiy
	ypyKigIjCjN3zrhUepSOewUPOXqBPtb/4NCRErq38xvs9v8MjwTWoC5Tbxl9k7S8JnxZp/8u8VzHR
	zl/mwLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcdv-0000000FBhK-1n2J;
	Wed, 07 May 2025 11:08:51 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcbx-0000000FBJY-13wB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 11:06:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac29fd22163so1132999066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746616007; x=1747220807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duDxhGSUaa+DKP3WsDW9rwdEeqUl14A6M/ImrV8wnQY=;
        b=Y+QsjmtUR0WWi9vCI9urQFeQMf8WUwoOYFqXGlnP2H/xNlKUvGGP0lYWlFEuxEyhNS
         rwIdr9gnhrim49hadf2L+uZbFtnj3gBsXPcQpFyuveASw92yeLHgz4dpOsycVuQYgKGm
         nORI4vd5RP/8adQwlt74Si7RH2F0CVToEfpjgZzQSTqUgLfdpQDz+XgGlTzacyGAARhc
         jfyHEKld6iIHfGNJzzGqVrRGSPYxuisaGd+n/NYIXR4y6X/rEO9j5a/B2Xf5Uan5wNmn
         nwPp6qVqRrhLMBJKOgaX2G6xAY76kxvA9U3pXwcSj1+Uq63Y6cSNO5JIhyxLNVSgmzZk
         zxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746616007; x=1747220807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duDxhGSUaa+DKP3WsDW9rwdEeqUl14A6M/ImrV8wnQY=;
        b=A9LwNrI9CANBPvKDoWsZHV45GUsuwNFYrcM4TsMPYnPyOnoclxJEtbDV2C7R+4i/CO
         Qbiu91QVCFj3oWPfWzsvHanNHzryIYBO6z0WJN6l9AtHPip73oBXlLh1ESyeuV9px0uj
         HUk93+htAbdbOlOXW4Q3J5t8YbstVucfWoy4WBym4dVNlfgYGuktfZelnmsba/cfzadf
         xhfoZoDwKba5CIUaY5QNyPBqHxDD1rnRoDFLfl8sRcZYrmpfvL+TpEA5yzEQ2BIR0x+V
         WiMtJ4RTPsMKpB/7yGGu2rvQGS8VsmL0IL4wMIaDSHNCtEYvr8pS0JFK6rcliWQVy8VS
         ZwZg==
X-Forwarded-Encrypted: i=1; AJvYcCWsDG0eoy0TiMRtwMv9zkJzxPYUrhiGw1DN/GIhBO8tUQf4j5UwnkZX/7FsXCaclNO0i5wrzQtUQFuepbZ0j8uj@lists.infradead.org
X-Gm-Message-State: AOJu0YyzROpHwPENZN/B5b5STPleHT/WDvMbRrHTQzya00RwZadZlCP8
	hEI8YGKlURyLmvh0O6ki+HzGsajA9XC+ZaYdfqPFWWvKBoOkHknA
X-Gm-Gg: ASbGnctfT0zbzwr2yQzCHIg8Gy9inTIl6446Ppj03ZxHkk8BtyikgjIi22iQbNyNxau
	v5Fn61p2F2x8kJyKWWFn5zUDtJ8m8lUILC8mH45Q26IPUbHJ9AtQf/18CGFiCor5yOgrHegIqc1
	03hAaabyVR4yjoWREjTXXSE9UklktNJJPRD9wPJ/0jFg8GP9sFb8EKifgNT78BcrMibWcpGBDea
	2DZk24VFUtBR9kF8DABmF9gvUkFs+H1YH3qMyo64jt/kONsUgvmbQQG9NSznYXY6iv1AO9tI5Kw
	mUDnVlA+B9QlSzfUWbH5IHBO6roC94ymVTkt73VEFGuxiLtLDQ==
X-Google-Smtp-Source: AGHT+IHUTGuZKxGzeUHzGfykWA8vb3hzItLyZnesCtBXdESu0mFRGfHYDE/15YKTQH60qIZWWmK6oA==
X-Received: by 2002:a17:907:c388:b0:ace:d3f0:e51d with SMTP id a640c23a62f3a-ad1e8d89b0cmr288549566b.54.1746616006898;
        Wed, 07 May 2025 04:06:46 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914d067sm888907766b.3.2025.05.07.04.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 04:06:46 -0700 (PDT)
Message-ID: <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
Date: Wed, 7 May 2025 13:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_040649_297418_EB237C3E 
X-CRM114-Status: GOOD (  10.59  )
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

Hi Andrew,

thank You very much for Your comments.

Andrew Lunn wrote:
>> +&ethernet0 {
>> +	status = "okay";
>> +	pinctrl-0 = <&ethernet0_ux_rgmii_pins_a>;
>> +	pinctrl-1 = <&ethernet0_ux_rgmii_pins_sleep_a>;
>> +	pinctrl-names = "default", "sleep";
>> +	phy-mode = "rgmii-id";
>> +	max-speed = <1000>;
> 
> max-speed is probably pointless, rgmii cannot do more than 1G.

Agreed. I'll drop the `max-speed` property in the next revision.


>> +	phy-handle = <&phy1>;
>> +
>> +	mdio {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		compatible = "snps,dwmac-mdio";
>> +		phy1: ethernet-phy@1 {
>> +			reg = <1>;
>> +			interrupt-parent = <&gpiod>;
>> +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> 
> PHY interrupts are 99% time level, not edge.

That is correct, but I am facing strange behavior, when I set 
IRQ_TYPE_LEVEL_LOW.
My board stops booting at:

[    2.343233] Waiting for root device /dev/mmcblk0p4...
[   12.638818] platform 5a006000.usbphyc: deferred probe pending
[   12.643192] platform 49000000.usb-otg: deferred probe pending
[   12.649029] platform 48003000.adc: deferred probe pending
[   12.654277] platform 5800d000.usb: deferred probe pending
[   12.659744] platform 5800c000.usb: deferred probe pending
[   12.665089] amba 58005000.mmc: deferred probe pending
[   12.670239] amba 58007000.mmc: deferred probe pending
[   12.675185] platform 50025000.vrefbuf: deferred probe pending

I must investigate this. If You have any idea, You are welcome to share it.

> 	Andrew


