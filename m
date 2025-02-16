Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA5FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKkwKTyg9w786XwSKoYuBYLKS23VVWg1TYbTDYTWNCg=; b=taCIVCWeKaFZCz/j5hVbavN8C7
	m61wT5lNpj6vRoNFQhlSIEn6K38XrUVt1ahKT7wOnKOiT54790CdRZa9LhD51uT0Nj4wkVTjXK7PT
	oGHxtOSEmJXLlkCBh+TCbnMQIJhKOy3+CQHQnNdjlMPGTJj43G5N0FMMkD0ocM5M1FXKk0v6FN5l2
	MbSR5vIRmXpZedS+V46GHOhSh+VP0cvAWG8GfGKcyJ7IWSmxPelHwQSBjLy431q7rClDgRjdj97u4
	zNic2lCKSEGV02N2QWkleT2tRd1RVOVu/TtkzhPzPZBY6UUKuah5JZ8b5r0CyaPrwBzqhDBHIg6oY
	j1PyQi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbWB-00000001cDo-0b8m;
	Sun, 16 Feb 2025 10:04:55 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbIt-00000001aju-3U7L;
	Sun, 16 Feb 2025 09:51:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f3913569fso353981f8f.1;
        Sun, 16 Feb 2025 01:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739699470; x=1740304270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKkwKTyg9w786XwSKoYuBYLKS23VVWg1TYbTDYTWNCg=;
        b=ikvpO9ifLysSeKG/phvf7whljgvCG1yPB23+3ngPoX233259TKOgXbDHUy/6p5TDKF
         iWp0M6R4cc797A82bdRrNZJqMnbXuEOH0J2Q7Dc1x9L1DAX/EFhVWD23QqTb7KCzLnT3
         7iAFehNo3IOzvKAv3VuIBrjAssYy8UnWUc4QCqIhNrVGFPiQopepkmDk/tN/jwIsnqAc
         jgO+2eh8o+B+lV7tXX6fGEJcIeGsL1zT3oAPwgdMPnKq0lyVE7H/NhdiuqaCWQ+D6YEB
         lJpb1FfQiGfeAsRdnrhKkBqAtpVXajtGsfTt8BYj3fO/kobC4+sJd+QCqcK8icb6jzbD
         KDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739699470; x=1740304270;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKkwKTyg9w786XwSKoYuBYLKS23VVWg1TYbTDYTWNCg=;
        b=eauBl9bXyXPG6vub3cVDNgdLBT9JaHAaTeFCGHDA20HaBpYt+wAzsB89J8Pq2O16KQ
         O4/EhfofjswvhYyyxj+Cck8ZJEds+LT51uPRSIE9/CJSl2ZTwptiD3Y5Jp3hR5CFuSgI
         7hDqjQZsqVyzLA6yJtT/B6dALD5/ARH3vLGFSH6ziy+TY2NMkJlDfTEmoSX7esd49NzY
         C4gOcrH7I2KOczd6RzzJrU7gr2YpojeA4bZ3Gb4VSFyCb72mqZwu0nN5DZVuLLiCAuh7
         3nmHZrElFto97ZlfcTlKJ69Y5Xeow+Clg7CNcCZITLIr1jTumCL1EHSPycSgV3N3SL4Q
         U9aQ==
X-Forwarded-Encrypted: i=1; AJvYcCV09JmgbzVkKzmVBgnArCZTOyDUOhxIHRVi5HrgGqf+rthQEbmt3lELc54aYEJUrMfzeLxCjhWhBD8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlAVHCH06cl4u7I9AbmW1D5UPVOsLTSzbRkHamBZPXe1RhOAl5
	8ZYx2XTPm847R1P88ru3xUYvTsnwo27/7YPFVeJoZOd3aKYLRowr
X-Gm-Gg: ASbGncs2orOwriRDmvk818h/pY++KkS5AiuSmR3JvwrDYz+wX1qCaGRZK9Oa/v/EeXi
	UyioS+0XmQrIDmLiZf9bTi9cnoiRGEtCnzCE30klRwd41c2rgL6HyMvKVkJySJx/OY2ohiH7xvV
	e60a+ASc0bV2SRrwsP7Z1qoOK/6xClQb8xQe0ru0aIIPx4g4D28FKbDParcX2SuBG8Da8bttDIF
	l6lcWWgJ+j/xy2crpxSwJla1L1Ff8uY0NTRIq6g0nPvgxvMtuyWqgUJUGKAi6eco7S/OqBmaru5
	DG1D0vr2iNHBwcl5jkT0MMXJ1GVknD7uzP8TkNl/AL/MFZMYIWGyspgcrE+RzkA+Rq7QUg==
X-Google-Smtp-Source: AGHT+IFPiVqkcK4Kd/T3e2U3LKZcUOmyLMjVkbQdDG1jJW67h/Annjc9EhvSTWnD04mKUQYqryGMpA==
X-Received: by 2002:a05:6000:381:b0:38c:2745:2ddb with SMTP id ffacd0b85a97d-38f339d8912mr4723327f8f.2.1739699470216;
        Sun, 16 Feb 2025 01:51:10 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258eb141sm9080681f8f.41.2025.02.16.01.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 01:51:09 -0800 (PST)
Message-ID: <f3d38b63-dc97-482e-aeac-b59e65f91424@gmail.com>
Date: Sun, 16 Feb 2025 11:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-4-ivo.ivanov.ivanov1@gmail.com>
 <a10f8a77-9440-477d-b6f6-9d651e3ab49a@kernel.org>
 <537698af-841f-48e7-bd7c-4077d0a240a1@gmail.com>
 <9b58a985-3d63-42bb-9a76-e5b04a4b6012@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <9b58a985-3d63-42bb-9a76-e5b04a4b6012@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_015111_910887_7D52A2F3 
X-CRM114-Status: GOOD (  19.47  )
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

On 2/16/25 11:44, Krzysztof Kozlowski wrote:
> On 16/02/2025 10:41, Ivaylo Ivanov wrote:
>> On 2/16/25 11:26, Krzysztof Kozlowski wrote:
>>> On 15/02/2025 13:24, Ivaylo Ivanov wrote:
>>>> The Exynos2200 SoC uses Synopsis eUSB2 PHY for USB 2.0. Add a new
>>>> driver for it.
>>>>
>>>> eUSB2 on Exynos SoCs is usually paired alongside a USB PHY controller.
>>>> Currently the driver is modelled to take and enable/disable the usb phy
>>>> controller when needed.
>>>>
>>>> The driver is based on information from downstream drivers.
>>>>
>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> ---
>>>>  drivers/phy/samsung/Kconfig                   |  13 +
>>>>  drivers/phy/samsung/Makefile                  |   1 +
>>>>  .../phy/samsung/phy-exynos2200-snps-eusb2.c   | 351 ++++++++++++++++++
>>>>  3 files changed, 365 insertions(+)
>>>>  create mode 100644 drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
>>>>
>>>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>>>> index e2330b089..f62285254 100644
>>>> --- a/drivers/phy/samsung/Kconfig
>>>> +++ b/drivers/phy/samsung/Kconfig
>>>> @@ -77,6 +77,19 @@ config PHY_S5PV210_USB2
>>>>  	  particular SoC is compiled in the driver. In case of S5PV210 two phys
>>>>  	  are available - device and host.
>>>>  
>>>> +config PHY_EXYNOS2200_SNPS_EUSB2
>>>> +	tristate "Exynos2200 eUSB 2.0 PHY driver"
>>>> +	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>>> +	depends on HAS_IOMEM
>>>> +	depends on USB_DWC3_EXYNOS
>>> How does it depend? What are you using from DWC3?
>> Can drop, I guess.
>>
>>>> +	select GENERIC_PHY
>>>> +	select MFD_SYSCON
>>> Where do you use it?
>> Remained from USBCON driver.
>>
>>>> +	default y
>>>> +	help
>>>> +	  Enable USBCON PHY support for Exynos2200 SoC.
>>>> +	  This driver provides PHY interface for eUSB 2.0 controller
>>>> +	  present on Exynos5 SoC series.
>>>> +
>>>>  config PHY_EXYNOS5_USBDRD
>>>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>>> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
>>>> index fea1f96d0..90b84c7fc 100644
>>>> --- a/drivers/phy/samsung/Makefile
>>>> +++ b/drivers/phy/samsung/Makefile
>>>> @@ -14,5 +14,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
>>>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
>>>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
>>>>  phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
>>>> +obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
>>> Entire driver looks like repeating existing qcom-snps-eusb2.
>> It's the same IP, but implemented differently on a different platform. At
>> the very least, the register layout is different.
>
> I checked few registers, looked very the same. Same blocks from synopsys
> have the common register layouts.

I see.

>
>>>  You need to
>>> integrate the changes, not create duplicated driver.
>> I can do that, but it would be come a bit cluttered, won't it? Depends on
>> if we want to follow the current oem-provided initialization sequence, or
>> try and fully reuse what we have in there.
>
> I think it duplicates a lot, so it won't be clutter. We have many
> drivers having common code and per-variant ops.

So the approach to take here is to make a common driver?

What about the current modelling scheme, as-in taking the phandle to
the usbcon phy and handling it?

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof


