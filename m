Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCF9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 10:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5A6h6iCJneZy4mP9pZb+hu2qmd2HY0brexOCwmkBrQ=; b=yk54cM9InWqKSarVt9u2Tw15S4
	hq6ir+Oa1WEQeuhX1VxIL3sXnBYMYvWQp7Pxdab2XrUrkM8lmAkzHK92slGU7VOCSfbyd/PNOynBH
	qJ/3SozrANlHccqb+npG7l0WHLT+RbFsvqBU4lUPRhVo2EV7dc43TkDA2qFPE7LH7s9OQX6CzLFlw
	Pv5cTSaWPAAuHKNlv9RLEUBb2iNuj3kE/8ZezndSw+QvNaDzy+5+tVFxOtmMd2/8fHoQxVGxDy9AO
	7v7DCNiW2l+3qwVJciz979k98gwUaZnnZWWpzKlxjuJxMWB/xKBelSky+RYFWUmTHP9fia351t4O5
	NuL3L8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbRu-00000001bl1-28bM;
	Sun, 16 Feb 2025 10:00:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjb9R-00000001ZZl-3RZT;
	Sun, 16 Feb 2025 09:41:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f2f748128so827251f8f.1;
        Sun, 16 Feb 2025 01:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739698884; x=1740303684; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5A6h6iCJneZy4mP9pZb+hu2qmd2HY0brexOCwmkBrQ=;
        b=AkxdAkrGA3L6jiwUKGfzaoP7/JAacUeidMNHs/g3nv2PAthKTM1c+gXnYtRMhjD8OZ
         fIpyj8dejxIKhi58cead3SYBaCR6Zvp37vqe9Z6ZEz6AXVWQvSJdW+UZep9rReZpVH96
         itQDRMB5HpHQhwjEjEtob6iBAYiaiGZFsFEoFcQ7JXa2qwU5R3AyI1sOmItcHic1v1Db
         qHgjmrwnE/1jthiZZNghR/8khDFJ8/ReUPFBkzHmB1uGApjMDNZOWbxVEg3UhUtwKP4B
         2Qb4Gs/qnbY+YkRR/otMx/GmaoWS8IXSOVfaMvla/1KzJRgLUsUK+8z5Kh2KMEobfqN/
         4TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739698884; x=1740303684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5A6h6iCJneZy4mP9pZb+hu2qmd2HY0brexOCwmkBrQ=;
        b=Q7ywJl9kO1hxkqIKPLUhwk0bzfbvI3Qs4aigEHMzw4qQyf0CAC48qu77I6HbWb8r36
         TcXQQEIRZa3Jvdcc3dVYg7ZMlaD/uDI6rI3QywI+q8w9W6cIwZyJ5GloA+KLxRU0Ikzf
         lBYRL/t63tB24QRwZzWidGP37qEeaPBL09zej+sVsXigHCpgPcB2kNT4XtHnaL6wQXt6
         qJOvE0F02qyunmPLh4ABPn0Nq6l0XtYZqNaRVQ1YxYFU2GUPO+pb80e1M9j4rpiEIGWO
         MACTXUt3VZRxM4UHeVR7eNL8Kb1iXaoEXspY+jdW2ksGVA5+vLPWX+eYxxRv8Lrvii83
         KVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWI4fiwQWNhESDG4xMKpOyvUJUD5jO/SC2CVkHmzeY7v351cYjIT8LX1HQRZ1CcGzRtw9QgNPgGmc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHHUpSQmEjM09SocUigjaYx9l35HvaSGSYtioaUgplV4aalmMP
	a7Ye/e60sM7FbZMQD6Qv8gSve0OIPUGd4KpxtFtmdiOy4TIjn4N5
X-Gm-Gg: ASbGncsk+kCzRdwms+CVanNSuh8vxqdBPKAIXIkVsXgjMmRTBM3T97F6ObRLATPoYgg
	c4RMAZ6WOoSzl3x+0pTj1T3+9OVbrb7Lyx1PWJXZXXngDgt+m4Xy3cdtcr7XCmktk6w+6/6dEFc
	zRXQxOR9LeEkFpdKVxWY8ScV4ULnwIB5Pz3N0WR0UDRNVkNOmBNcndAZFMnXllHqWOL9m2j7Q0b
	wvOpZ7BI4m6FqEuaS5wnI7fvtL8voH6QTktpfbbllqXejSLDy/F7+wItCWz9kOtxM/S3f00/cBe
	LCGBduRtjb/h2Cui+K7V3tfnmVXr7Z9KxQMYrk7Mqul1pRTO62M70l68x+Xo1F/1XYme9g==
X-Google-Smtp-Source: AGHT+IEb2OQelhkZ2wVYFcVcHXQRhSgxb1xWaG3Vk4kg47/uyDzz72WWWsuUpEK0jcrP+/DgGN6R1Q==
X-Received: by 2002:a05:6000:18a9:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-38f33e87e68mr7582693f8f.0.1739698883317;
        Sun, 16 Feb 2025 01:41:23 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5ef9sm9212015f8f.76.2025.02.16.01.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 01:41:22 -0800 (PST)
Message-ID: <537698af-841f-48e7-bd7c-4077d0a240a1@gmail.com>
Date: Sun, 16 Feb 2025 11:41:21 +0200
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <a10f8a77-9440-477d-b6f6-9d651e3ab49a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_014125_876794_970D93F9 
X-CRM114-Status: GOOD (  25.04  )
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

On 2/16/25 11:26, Krzysztof Kozlowski wrote:
> On 15/02/2025 13:24, Ivaylo Ivanov wrote:
>> The Exynos2200 SoC uses Synopsis eUSB2 PHY for USB 2.0. Add a new
>> driver for it.
>>
>> eUSB2 on Exynos SoCs is usually paired alongside a USB PHY controller.
>> Currently the driver is modelled to take and enable/disable the usb phy
>> controller when needed.
>>
>> The driver is based on information from downstream drivers.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/phy/samsung/Kconfig                   |  13 +
>>  drivers/phy/samsung/Makefile                  |   1 +
>>  .../phy/samsung/phy-exynos2200-snps-eusb2.c   | 351 ++++++++++++++++++
>>  3 files changed, 365 insertions(+)
>>  create mode 100644 drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
>>
>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>> index e2330b089..f62285254 100644
>> --- a/drivers/phy/samsung/Kconfig
>> +++ b/drivers/phy/samsung/Kconfig
>> @@ -77,6 +77,19 @@ config PHY_S5PV210_USB2
>>  	  particular SoC is compiled in the driver. In case of S5PV210 two phys
>>  	  are available - device and host.
>>  
>> +config PHY_EXYNOS2200_SNPS_EUSB2
>> +	tristate "Exynos2200 eUSB 2.0 PHY driver"
>> +	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>> +	depends on HAS_IOMEM
>> +	depends on USB_DWC3_EXYNOS
>
> How does it depend? What are you using from DWC3?

Can drop, I guess.

>
>> +	select GENERIC_PHY
>> +	select MFD_SYSCON
> Where do you use it?

Remained from USBCON driver.

>
>> +	default y
>> +	help
>> +	  Enable USBCON PHY support for Exynos2200 SoC.
>> +	  This driver provides PHY interface for eUSB 2.0 controller
>> +	  present on Exynos5 SoC series.
>> +
>>  config PHY_EXYNOS5_USBDRD
>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
>> index fea1f96d0..90b84c7fc 100644
>> --- a/drivers/phy/samsung/Makefile
>> +++ b/drivers/phy/samsung/Makefile
>> @@ -14,5 +14,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
>>  phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
>> +obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
> Entire driver looks like repeating existing qcom-snps-eusb2.

It's the same IP, but implemented differently on a different platform. At
the very least, the register layout is different.

>  You need to
> integrate the changes, not create duplicated driver.

I can do that, but it would be come a bit cluttered, won't it? Depends on
if we want to follow the current oem-provided initialization sequence, or
try and fully reuse what we have in there.

Best regards,
Ivaylo

>
> ...
>
>> +
>> +	ret = devm_clk_bulk_get(dev, drv_data->n_clks,
>> +				phy->clks);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to get phy clock(s)\n");
>> +
>> +	for (int i = 0; i < phy->drv_data->n_clks; ++i) {
>> +		if (!strcmp(phy->clks[i].id, "ref")) {
>> +			phy->ref_clk = phy->clks[i].clk;
>> +			break;
>> +		}
>> +	}
>> +
>> +	phy->vregs = devm_kcalloc(dev, drv_data->n_regulators,
>> +				  sizeof(*phy->vregs), GFP_KERNEL);
>> +	if (!phy->vregs)
>> +		return -ENOMEM;
>> +	regulator_bulk_set_supply_names(phy->vregs,
>> +					drv_data->regulator_names,
>> +					drv_data->n_regulators);
>> +	ret = devm_regulator_bulk_get(dev, drv_data->n_regulators,
>> +				      phy->vregs);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
>> +
>> +	/* we treat the usblink controller phy as a separate phy */
>> +	phy->usbcon = devm_of_phy_get_by_index(dev, np, 0);
>> +	if (IS_ERR(phy->usbcon))
>> +		return dev_err_probe(dev, PTR_ERR(phy->usbcon),
>> +				     "failed to get usbcon\n");
>> +
>> +	generic_phy = devm_phy_create(dev, NULL, &exynos2200_snps_eusb2_phy_ops);
>> +	if (IS_ERR(generic_phy)) {
>> +		dev_err(dev, "failed to create phy %d\n", ret);
>
> Syntax is return dev_err_probe
>
>> +		return PTR_ERR(generic_phy);
>> +	}
>> +
>> +	dev_set_drvdata(dev, phy);
>> +	phy_set_drvdata(generic_phy, phy);
>> +
>> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +	if (IS_ERR(phy_provider)) {
>> +		dev_err(dev, "failed to register phy provider\n");
>
> Syntax is return dev_err_probe
>
>> +		return PTR_ERR(phy_provider);
>> +	};
>> +
>> +	return 0;
>> +}
> Best regards,
> Krzysztof


