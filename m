Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD73C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Pv2ab+l4k/GmIjg6UFnNL/02FoWRRTFcUTIE2g9NS0=; b=FgpfosSCSK53loVuPn/EJu2bL/
	UxTlUDYwedrrnKOb6Or+fFvjAEULlCu28J0R5BAgoRyRBI7wPvNzuXEwrr0qcKEMsM+VA0nlOxZ0L
	6VqIEtPh6laut+5XMBT3xu2d6h0eQMgzuj0wv6r1jm1poKhFoFAcpEjRQwmWrhvGOjm8kPItL3M10
	WeRMdMj6w3a5RCUEdgJXX+QPTuya3cveHDhMEUNklaUJsz5KgxZV5048LByCAqCilNd9GnaGhMx9t
	NfrhSkKSWJbJ5ip9t77lJaCmrYbSyTUE2rJWBZtXszyntWPV1S664l5GKOFnSSq8+WW58GpN7Vi17
	kgb3aYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbaQ-00000001cgp-16xR;
	Sun, 16 Feb 2025 10:09:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbQU-00000001baA-3eXe;
	Sun, 16 Feb 2025 09:59:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so1749429f8f.1;
        Sun, 16 Feb 2025 01:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739699941; x=1740304741; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Pv2ab+l4k/GmIjg6UFnNL/02FoWRRTFcUTIE2g9NS0=;
        b=SqLESU5KBCLdrIeRt+99KZgLQ31by7lJh5uklgzyd+MYWtuz8XPtX0+0G853vzJYvq
         0ZCrgzw9Uto/lslTiYnBnkfOeGzzjTZvYoRbzzA6nTFyT1eW+ouBhWUPrtZC02ZRbHEG
         hevlpRSOPGUxAwCrn45Fvi6KaqtNieddKU19AMaatuaHaY/TRAQ3V04/fK2Ejsz315z4
         kzgfVZ9hMxImbS52v9P48WTGnsySWcSGDTcsxH0avOBxJsjmoA4YBzUS9xkiNydIuSMv
         YWoq5gKX8iJGQJXOcc4j/L8DU9d+5x+nidrfHeWsnUHPHPbBFvPUppxR4mXCgmiDSPgC
         Zl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739699941; x=1740304741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Pv2ab+l4k/GmIjg6UFnNL/02FoWRRTFcUTIE2g9NS0=;
        b=J5klFxHFETanbKx9TL09u2z19C2sqgUhqz+xcxcb6waGEpXjE2sPeOcqfvVsIj+4di
         9RGnRoYxD7MkYt5s7kRTzUyCJY1BFaPrjWhGL4rBoLcTqjHppLoDEZawfHt6byqLj452
         RVdbV3jRU7PD7P7tdXv+67y8QUbkoq1NIqK91s4/0R1Q4MyrPorVEqb3+2P7yt0Ddj2e
         s3eVtfCvTVDkwCBin30IIwZIVYibVgaV2lUpPe11VLYRvtCoVWvGpBP0dfqg16qnjIR3
         5IPP8FV5tK5c8f4xSwTKiWLUAf60L0Ba7y5i6EtweLRMOtLhFsNMuO+UEYBbrDjW0W5D
         LesA==
X-Forwarded-Encrypted: i=1; AJvYcCVcbK1r1D9eaZMW4O9y5+7ykzU6XM8MU/XVkQoJgXBHMusYQL3kmbMUlDYARIw+L1xbACRHV0Ozp90=@lists.infradead.org
X-Gm-Message-State: AOJu0YzW8xx4bfsxNLuXwyy7B5huZ/i9mIT4xJLnuVflrEt1KI4tZPj9
	uftyDzQGJc6HM8DznxJdq7tCYDgoo87k1nB6VzkaXq13y1Mh8vtk
X-Gm-Gg: ASbGnct7jF+mf6VZwpH5CpJhPH0oL//suj6VJUxKbyubhhhpRv7cUBLWC+JlI/a6QsG
	8ZHNPRQFtqZsi9riQRyxBarlDV0TLq7HCetAwZm+yQJiC1uaI2YrVwUFVWdxNra0IHGI48rag1O
	3swOVfP0TXRnZP1KpmWjUYRzn7Oc9yle1w5+CHsvCtHUo2X1R4ngYPeRGWosECs2mAo2/5rLKg9
	hIv9H61dn6ELkdFrtcAn0rr7gQAShbuUZQfIzFy1yFWRD9gZYfRd54pMeu8JCDPeXYrrWe5bdI3
	Ijxa9k3wfi8XWqxoNNbNZEktVLeMwdJ5xWcdh/klY15kFgO8zEs7fozen+6Y2OpKm3jzcA==
X-Google-Smtp-Source: AGHT+IHZgNqHyHCv5yT6p4apSYBg8SJTvge1/YRU31W+9aRlNzcxZQY9QQK2OBKvkkzXkaKW1nJebA==
X-Received: by 2002:a5d:59af:0:b0:385:ee40:2d88 with SMTP id ffacd0b85a97d-38f33f117d1mr4534496f8f.3.1739699941089;
        Sun, 16 Feb 2025 01:59:01 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5efdsm9144911f8f.43.2025.02.16.01.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 01:59:00 -0800 (PST)
Message-ID: <9451f339-c8ff-4be2-9cde-1aaf78fa8e7b@gmail.com>
Date: Sun, 16 Feb 2025 11:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] phy: samsung: add Exynos2200 usb phy controller
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
 <20250215122409.162810-5-ivo.ivanov.ivanov1@gmail.com>
 <32b67c56-9331-4391-90ad-031e0388434f@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <32b67c56-9331-4391-90ad-031e0388434f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_015902_974313_480D566A 
X-CRM114-Status: GOOD (  17.11  )
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

On 2/16/25 11:36, Krzysztof Kozlowski wrote:
> On 15/02/2025 13:24, Ivaylo Ivanov wrote:
>> The Exynos2200 SoC comes with 3 PHYs - snps eUSB2, snps USBDP combophy
>> and a cut-off phy that origins from exynos5-usbdrd. The latter is used
>> for link control, as well as pipe3 attachment and detachment.
>>
>> Add a new driver for it.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/phy/samsung/Kconfig                 |  13 ++
>>  drivers/phy/samsung/Makefile                |   1 +
>>  drivers/phy/samsung/phy-exynos2200-usbcon.c | 241 ++++++++++++++++++++
>>  include/linux/soc/samsung/exynos-regs-pmu.h |   3 +
>>  4 files changed, 258 insertions(+)
>>  create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c
>>
>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>> index f62285254..47e9b9926 100644
>> --- a/drivers/phy/samsung/Kconfig
>> +++ b/drivers/phy/samsung/Kconfig
>> @@ -90,6 +90,19 @@ config PHY_EXYNOS2200_SNPS_EUSB2
>>  	  This driver provides PHY interface for eUSB 2.0 controller
>>  	  present on Exynos5 SoC series.
>>  
>> +config PHY_EXYNOS2200_USBCON
>> +	tristate "Exynos2200 USBCON PHY driver"
>> +	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>> +	depends on HAS_IOMEM
>> +	depends on USB_DWC3_EXYNOS
> How? What are you using from DWC3?

Will drop.

>
>> +	select GENERIC_PHY
>> +	select MFD_SYSCON
>> +	default y
>> +	help
>> +	  Enable USBCON PHY support for Exynos2200 SoC.
>> +	  This driver provides PHY interface for USB controller present
>> +	  on Exynos2200 SoC.
>> +
>>  config PHY_EXYNOS5_USBDRD
>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
>> index 90b84c7fc..f70e12ddf 100644
>> --- a/drivers/phy/samsung/Makefile
>> +++ b/drivers/phy/samsung/Makefile
>> @@ -15,5 +15,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
>>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
>>  phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
>>  obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
>> +obj-$(CONFIG_PHY_EXYNOS2200_USBCON)	+= phy-exynos2200-usbcon.o
>>  obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
>>  obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
>> diff --git a/drivers/phy/samsung/phy-exynos2200-usbcon.c b/drivers/phy/samsung/phy-exynos2200-usbcon.c
>> new file mode 100644
>> index 000000000..7968c9792
>> --- /dev/null
>> +++ b/drivers/phy/samsung/phy-exynos2200-usbcon.c
>> @@ -0,0 +1,241 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> + */
>> +
>> +#include <linux/bitfield.h>
> Are you using this header?
>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/iopoll.h>
> And rhis?
>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/reset.h>
> And this?

Nope, it's a leftover I forgot to drop. Same with the above

...
> Same comments as on previous patch.

Alright. Thanks for the feedback!

Best regards,
Ivaylo

>
>
>
> Best regards,
> Krzysztof


