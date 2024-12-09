Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A3DE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZp+CFP7K7kOAlodAUCSCzM6XqjZQS3FtVdgKB9HjIU=; b=1l2VOzVmpNoYbJlPO+I2jY7Lai
	wD6c0yqnqkCg4jTaD+iWROgoBgWEoONRvfVfOTdp+jCMu+tYTPivcPLWeEEn23G9IYbZiFIsVj50F
	msAXSEefOoV294xaiPukF0cYWRXbhuF8tbPyXjfXXQ2Xoe4UIgICX0nY7G863898lCWegW61qDCcu
	jTShtAhym1iOi1Hmkrpi7dCDv6QNjwJ2VefdyIXog+zpXQhjFKLrsDvsxl8MXd8i0r4rzXHzik2IF
	aBl1fmJvTc22feAi4SSijP5FMg/Y2leHBvX7oRh+p6ejsQk5NfvUZQtkeZ+IC0iiwhLA1DeC33Jem
	BxoU9Cyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKawR-00000007H1x-10iC;
	Mon, 09 Dec 2024 10:24:39 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKagM-00000007DVm-0MMu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:08:03 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-725c0dd1fbcso2705137b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 02:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733738881; x=1734343681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZp+CFP7K7kOAlodAUCSCzM6XqjZQS3FtVdgKB9HjIU=;
        b=LS2eOD3MzwvI1iSG547UVCmIVDWEX/9zILM/88cgTC2Y7stKmc8m8XNhZ81D7NdGM3
         apZFF90qJs76Efg9l6m/+WiIang41NAOWcuWgT9VdW+u23KVbwUG7W1QJBfD/5fTM2BA
         7b2T/DVNIVOLnPbJ7ZZmCyywRTLB5x89egA943gvBnpLtJTPUCEm3CDCX1yWy+Yvnqw5
         44bbOq5SWO/Huo9wAqkQBnHolrIYD3az1JVawqP4fSGTikXA2xBSZCE/olZeI5RuBv9M
         wiAjij+0G/nrh6kUGBOGmdRLq0rBJNYXmWJ8mA9hq+rqVBqd8ijc31GUWRjRKGsJ2JZ6
         9TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738881; x=1734343681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZp+CFP7K7kOAlodAUCSCzM6XqjZQS3FtVdgKB9HjIU=;
        b=Mce75fXeS2bGPwqtoUEMTlS/DI7s6/HuUAzgNZQBJrMv8MU0PRtybB3wX3j8mbJzOQ
         QJSx9/rwnJjvwBYq78K1TWpngLwRnj27EbMpmzr1gWzhxMi97iWDi7gTVkfCMSvBAB0y
         63tudvZOqWKtwDwOPxgw7CokI9ApNLKJZGcBgf982Se5PxghiwfDFTKYXN8qNyKvoSSW
         LrsBZlSUunUM336lV5eyzMzC05Yvoq1Fe+Hc/mHB6TER4Db5FqrWzkB6CXTbL4OtzmzX
         TvsGPcxirWT4bJOoCTqdT3ozJIwZ5XSt77myPT0zXxbgpa2DDwboCKEgWnWBlO0NpW5X
         RF+w==
X-Forwarded-Encrypted: i=1; AJvYcCUudou8SNkWgGQ/Y0ppaAGJQf5kqLBLE+RerMDPjbq07q8gX2xFV+hL9PYc+VZB6/ALvumTzoZ6Ard5np2psDGS@lists.infradead.org
X-Gm-Message-State: AOJu0YxfzSiYvXaYr9HLRhih/y7tTywYHuw46+3C2FtIZuFja2dC2DCP
	4xqSRRFK8ThHM5AObVsRGCpYowHZE8HvBx7LNvgiZs4tW03hjZO/
X-Gm-Gg: ASbGncu8BWXqgeeq/Fa53x2LNfgtqRX1NECuWi5z5lXYiPDp1sq98bcEivEYTzJ3hc9
	4BslKv6nV2jmGO++NQVijyoUFSQ6Rve/FFCNndqlr1t2FZvHaOMSuimstUAeMcVXz9IrsF8Q/PU
	fhxz0n24cQj5p4Jey6F9vJA9h/KfCZcFFouBWXsVyxzaLsAxvBsCN67/mKSzmEGz4IJkh26qGTQ
	nMWJ5+h3DvV1UHembTN18FX30xOuIH4VHY6liOvFDTMPqNchPx9eBqLR/nkzwWAL9TG
X-Google-Smtp-Source: AGHT+IE2AAunC8wmSSoVHJwvOzFoZYPvX4c5A5ejLO9bR6TnjihE9dezvHIlPn7G9UQ6/5A3kkQW9g==
X-Received: by 2002:a05:6a00:a8c:b0:725:24c2:b794 with SMTP id d2e1a72fcca58-725b8188090mr18378334b3a.23.1733738881124;
        Mon, 09 Dec 2024 02:08:01 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d9b98eb2sm3567122b3a.148.2024.12.09.02.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:08:00 -0800 (PST)
Message-ID: <551941de-b9a4-4353-8bb2-0bfc3304ef87@gmail.com>
Date: Mon, 9 Dec 2024 18:07:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>, y@krzk-bin
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-3-towinchenmi@gmail.com>
 <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_020802_128181_87BEE9E6 
X-CRM114-Status: GOOD (  26.59  )
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



Krzysztof Kozlowski 於 2024/12/9 下午5:22 寫道:
> On Sat, Dec 07, 2024 at 09:03:15PM +0800, Nick Chan wrote:
>> Add driver for backlight controllers attached via Apple DWI 2-wire
>> interface, which is found on some Apple iPhones, iPads and iPod touches
>> with a LCD display.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/video/backlight/Kconfig  |  12 +++
>>  drivers/video/backlight/Makefile |   1 +
>>  drivers/video/backlight/dwi_bl.c | 124 +++++++++++++++++++++++++++++++
>>  3 files changed, 137 insertions(+)
>>  create mode 100644 drivers/video/backlight/dwi_bl.c
>>
>> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
>> index 3614a5d29c71..e64cc3d51ac5 100644
>> --- a/drivers/video/backlight/Kconfig
>> +++ b/drivers/video/backlight/Kconfig
>> @@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called ep93xx_bl.
>>  
>> +config BACKLIGHT_APPLE_DWI
>> +	tristate "Apple DWI 2-Wire Interface Backlight Driver"
>> +	depends on ARCH_APPLE || COMPILE_TEST
>> +	default y
>> +	help
>> +          Say Y to enable the backlight driver for backlight controllers
>> +          attached via the Apple DWI 2-wire interface which is found in some
>> +          Apple iPhones, iPads and iPod touches.
> 
> Mixed/messed indentation. Some spaces?
Ack. Will be fixed for v4.

> 
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called dwi_bl.
>> +
>>  config BACKLIGHT_IPAQ_MICRO
>>  	tristate "iPAQ microcontroller backlight driver"
>>  	depends on MFD_IPAQ_MICRO
>> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
>> index 8fc98f760a8a..0a569d7f0210 100644
>> --- a/drivers/video/backlight/Makefile
>> +++ b/drivers/video/backlight/Makefile
>> @@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
>>  obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
>>  obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
>>  obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
>> +obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
> 
> Please do not introduce other sorting way - it is sorted by config name.
> Which will also point you to apple_bl.o and need of explaining the
> differences, e.g. why this cannot be one driver.

apple_bl is a driver backlight controllers on a PCI bus on Intel Macs,
which is
completely different from the Samsung-derived DWI block this driver
deals with.
This will be explained in the commit message for v4.

> 
> 
>>  obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
>>  obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
>>  obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..d4bfd74b3129
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,124 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
>> + *
>> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/io.h>
>> +#include <linux/backlight.h>
>> +
>> +#define DWI_BL_CTL			0x0
>> +#define DWI_BL_CTL_SEND1		BIT(0)
>> +#define DWI_BL_CTL_SEND2		BIT(4)
>> +#define DWI_BL_CTL_SEND3		BIT(5)
>> +#define DWI_BL_CTL_LE_DATA		BIT(6)
>> +/* Only used on Apple A9 and later */
>> +#define DWI_BL_CTL_SEND4		BIT(12)
>> +
>> +#define DWI_BL_CMD			0x4
>> +#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
>> +#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
>> +#define DWI_BL_CMD_DATA			GENMASK(10, 0)
>> +
>> +#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
>> +					 DWI_BL_CTL_SEND2 | \
>> +					 DWI_BL_CTL_SEND3 | \
>> +					 DWI_BL_CTL_LE_DATA | \
>> +					 DWI_BL_CTL_SEND4)
>> +
>> +#define DWI_BL_MAX_BRIGHTNESS		2047
>> +
>> +struct apple_dwi_bl {
>> +	void __iomem *base;
>> +};
>> +
>> +static int dwi_bl_update_status(struct backlight_device *bl)
>> +{
>> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
>> +
>> +	int brightness = backlight_get_brightness(bl);
>> +
>> +	u32 cmd = 0;
>> +
>> +	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
>> +	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
>> +
>> +	writel(cmd, dwi_bl->base + DWI_BL_CMD);
>> +	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dwi_bl_get_brightness(struct backlight_device *bl)
>> +{
>> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
>> +
>> +	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
>> +
>> +	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
>> +}
>> +
>> +static const struct backlight_ops dwi_bl_ops = {
>> +	.options = BL_CORE_SUSPENDRESUME,
>> +	.get_brightness = dwi_bl_get_brightness,
>> +	.update_status	= dwi_bl_update_status
>> +};
>> +
>> +static int dwi_bl_probe(struct platform_device *dev)
>> +{
>> +	struct apple_dwi_bl *dwi_bl;
>> +	struct backlight_device *bl;
>> +	struct backlight_properties props;
>> +	struct resource *res;
>> +
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
> 
> sizeof(*)
> 
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return -ENXIO;
>> +
>> +	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);
> 
> Use helper for these two, devm_platform_get_and_ioremap_resource() or
> similar.
Ack. Will be fixed for v4.

> 
> Best regards,
> Krzysztof
> 

Nick Chan

