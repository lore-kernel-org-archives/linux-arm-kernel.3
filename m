Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28488E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLjaNLw0xnbIzxsGtzqJhd8aEd4Ru1RCayYPC8m3MbY=; b=qzuVaBzU6fuJf0MXv4nhkHD6Xo
	rKedEwJXw95OLDP/Sa+DRxxLPaK3QY66Rp/Cept2FX2DEG1Ps9/QGG33qMMoOiYRx34qE7+PPpTxf
	fkPIP72ztppvV2l1m6le87RKvssPtCIZGn2VfGCpNOB/PpV8eAn1EzEYbGK88eiEoM+CTkpeKq7rM
	4d97OpDs80Uf2WRIOJMs4mSFvVQQr/DmQ+wiDfbyoc/Y3qBAW3MAqjxgT0tFr4jrIr/qDrg97JEjA
	nq9uSWS+KX2tMQM6KJ4EXVQodJ/k7pDS97D82/cviyaDYe4NR05i1NOpbzLcjgFL/vuv5Xks03rNI
	syDLgwwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVurZ-0000000CYtF-20Hf;
	Thu, 09 Jan 2025 15:54:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuqF-0000000CYUG-1bNe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:53:04 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2165cb60719so19433555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 07:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736437982; x=1737042782; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLjaNLw0xnbIzxsGtzqJhd8aEd4Ru1RCayYPC8m3MbY=;
        b=LAB1vR0T4zaUVU0DcfNnTEj/1Zzjev6rpM3SPGFdyl7dH2Sbja9YU3RtRfzkcVQibN
         enUmNRNYDk3IUaRpvEuSbgAUWrjek2EivFAnUS75zJCTx3GV71Pz/8jRzc6UrhHILGkj
         sjiQnN/ru9n5FrIFlvMlWyhlT1472LZW92YdTGdNHk+jVCe1qo2qCDyTzUn6uBlZD03y
         7d8PPBFl7AH1yy9mvsv0K7InNBbsstfgi/oYkKGABbxTrM/qgMBCI3W9ElNSAcWBIx3n
         gsY5zFOfey0EtPLd25BmyXcFM7ugoJYypiHlayUvNKI4pHR/vHLL9D5U+T+U0PbIwNn9
         Gn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437982; x=1737042782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLjaNLw0xnbIzxsGtzqJhd8aEd4Ru1RCayYPC8m3MbY=;
        b=TqSS5lKJ0yJSoV82ddd1hyoUeZaGygrwIAOgYkb1h2I5flT/DFylxr+x67aBpnuY23
         e7nt+SZB1mPC1bhRCdOXJQfS3LLiPO8KL/OqT5JalPeINnixboHkPEG9t386uOb0RB73
         EerCF4h4rff9qiYh2yZ6E+TF62CMR0YNJ26A0oo7JsRNjPvNh8OiXX9SUAToIGPO594b
         MykzN1WzUcHLLze0G+8yYqZvjGTRW36ay1yw5tOeqMIRUe+hg8fJFKoPtCkxHwMFr/sG
         tqmOUVo8RZYHPypdk/cDW78ow6g07zZxUElq9szd0/dOv5Oi3W8G5fjVeT5vIZmQfCEx
         O4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR608jIBOiDL5fsIic4gCEblubirfdVp5B0TJoYQeM69a5qDi65MM8iorOILromSd349P3d0sfld5VhVzg+L16@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa6czMNTU7qX/iheD6mMXRrgNJ1li3kgTljHcXnljPQuI5Zuzt
	IOxLP8SdA+BvDZbEU8VEPL5aPKmzMR3U6y80b/ICYpXWWMHcISyv
X-Gm-Gg: ASbGncuuTejlFefQtIvns0/VmB5zwZ+KFH7dDJBP8D5iU7i238R0UAWL16ed5/yOt5K
	IU0QG/DzI3jOd/tP5OSdIT8aYhLSMXbxCe1raxt4GZrxoHT/lWQsgbKsWeNd0SKtHAvXnBBrCWR
	QOv4avl4fxzr/wOHf2W77dREp5xcJt16DJPo7ViKGDpu80N9rSli0cSKDNW0mV6JwY5swQgJczZ
	6LoP8H4wsMMmzgI+272TnmUwuv0EwwnEbnBkdYFzDBYKMsI3it1emoa4bWBHoK0uD/oQVBM5C8=
X-Google-Smtp-Source: AGHT+IHDn1Y3xt05c3sartTSXwHA9erKjixGfU399kRuKIVN2pSlgvUAIoFBG/VDgJvH9iN34Uy6+g==
X-Received: by 2002:a17:903:1248:b0:216:2dc5:2330 with SMTP id d9443c01a7336-21a83fd2400mr106271905ad.36.1736437981642;
        Thu, 09 Jan 2025 07:53:01 -0800 (PST)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a91768ca2sm14337555ad.45.2025.01.09.07.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 07:53:01 -0800 (PST)
Message-ID: <ad3cbf5a-6322-4256-9284-f739d4c3aa45@gmail.com>
Date: Thu, 9 Jan 2025 23:52:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-3-towinchenmi@gmail.com> <Z35Y9rzS6tLVgsRo@aspen.lan>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <Z35Y9rzS6tLVgsRo@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_075303_419481_534854B5 
X-CRM114-Status: GOOD (  24.86  )
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


Daniel Thompson 於 2025/1/8 下晝6:52 寫道:
> On Wed, Dec 11, 2024 at 07:34:38PM +0800, Nick Chan wrote:
>> Add driver for backlight controllers attached via Apple DWI 2-wire
>> interface, which is found on some Apple iPhones, iPads and iPod touches
>> with a LCD display.
>>
>> Although there is an existing apple_bl driver, it is for backlight
>> controllers on Intel Macs attached via PCI, which is completely different
>> from the Samsung-derived DWI block.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/video/backlight/Kconfig  |  12 +++
>>  drivers/video/backlight/Makefile |   1 +
>>  drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++
> I'd rather this was called apple_dwi_bl.c to match that config options,
> etc.
Still trying to determine the type of the backlight control, I think it is linear however and I will send a new
version when I am more certain.


>
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..59e5cad0fbd8
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,122 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
>> + *
>> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
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
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
>> +
>> +	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
>> +	if (IS_ERR(dwi_bl->base))
>> +		return PTR_ERR(dwi_bl->base);
>> +
>> +	memset(&props, 0, sizeof(struct backlight_properties));
>> +	props.type = BACKLIGHT_RAW;
>> +	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
> There should be something to indicate whether the backlight controls are
> linear or logarithmic here.
>
>
>> +static struct platform_driver dwi_bl_driver = {
>> +	.driver		= {
>> +		.name	= "dwi-bl",
> Again, I'd rather see apple here too (although, to be clear, I'm
> perfectly happy with all the static functions and variables being
> prefixed only with dwi_bl).
Alright, I will rename the file and and the name of the driver to have apple, the functions
and variables will still not have apple though to not make the lines too long.


>
>
> Daniel.

