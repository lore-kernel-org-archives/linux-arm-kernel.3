Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F19F459F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ex/7VQ4LuDb6TdbBF1Wf96owQWL8u54/cayoZYl1VgI=; b=f4GM36dNU1THHMCdw9MIg5Vu6J
	fU46ZB+wculXZclOBGdK9fW51BU1kEBwpNIfIcnBnAg0j7dXQHEEsDhxr3SYFGQfLe1Y1Kjr8ST7X
	ZZ7IiB8Qe9Wtc9vv94Rph90mhQjktSgY04/chRZpqjy2ZdiRsKtLSxgtl/rYE7rdUtNcm6dkLewOW
	PCcdOW4oFj8J8aLzZcX43EeCZxJtPHc8BMAbGkOHLohMCnz3jKydXS09GlmCamExeslZ4ltJfBElW
	xwWKPXxCcsK/jWNj1HDOx9jNfRjX+VXFwQmVBgnEH8e2IFY6juSMDqWciwECN/s9jKrYp9JVBVD9H
	FVT7M5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBE6d-0000000CUA4-0hMh;
	Fri, 10 Apr 2026 15:49:15 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBE6a-0000000CU9g-21FG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 15:49:13 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-12c20010f10so5430158c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775836151; x=1776440951; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ex/7VQ4LuDb6TdbBF1Wf96owQWL8u54/cayoZYl1VgI=;
        b=lESNmHPxHvymDHSGd6kMQz80YuA4S3Z7jhVw3OiaqHAehll16STXWvXmrnPtlBxl26
         MUXt4MAzu5Vpb5onOr/q2lgNoE8KtD6okiYUxDLi7E8tYNbBwn53tQSvTDC9/jQER8pL
         wpvR0zUuDUVK1FGkozgmIpXgWPQ1f/9pTYuaO1v08GAcdzNMK//p4zKMybeHZI4KNRB0
         +faLgRlkKmIlhaUbWavSBoSoXajus88izgwN136jhJyNjDwriI4z77qT0K6edQuVXJfh
         iVQUVzSw7//8C6QlzLpToUUC1YYsjIEbI59b5pxA+etGexzjERmBlTu2lxyZbSbC5njC
         JS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836151; x=1776440951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ex/7VQ4LuDb6TdbBF1Wf96owQWL8u54/cayoZYl1VgI=;
        b=lHiWwLZu26JaqxSkwqzjx69l7Yura9JFnvTfisE2J7nsNO5rq9MM6LejvznTxAAOWj
         SFzxciG/ArdTWlhF++pKCjHh2JqVfxngjbaH/XHB1Y65tDi5kwZz0zkqVYC/ie2kU4Dk
         y4/59T4YRTyNyYTGnlqU/Wd7eFGiWq3qbGjCSkkIIVsTSGe/B/TeG0YMuAAJLBNb5hBb
         Zp8MIsXS7iMpEo12nWuDnZ7fkra05inOAeWewnsfUed+9lQYJ/J/89SwFzUBR293ACBB
         /KPKhb+dgpdw0wU5Nkf0mou6pcWy7gEaIpSWtn09chm6MTHmwVvs7Xh57JMjeD/7LF5q
         Xbzg==
X-Forwarded-Encrypted: i=1; AJvYcCVhsfwUi5JXCSQENkTyttXXGypYefMyi3SD9MqIkrVnPlb1VTuhmgGcuIGTGya7WwTNcjW/w0ENxz4PVDA0nhdz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8SQDv6fKlAcDwR36HhexY9Be4jrAgadkMcxnfyupPy29WLLyP
	7N/FW2/T9FOpEzYNPwTtGmcOfTFEmzG0cvc/6LhLCKznmTeNtvu2B20k
X-Gm-Gg: AeBDievyLXTu+mupN8Cwkmsm+g+xenAHY4SbeDV3WsQ8aNKgTjDUAt/cvZLY5ReVAhn
	A1nlBqIpCixc0YPCBiCfT9UV9kZTKimnZ0EQEEhH2rM8qV2iKj7lW3/JAwACj/VsP3wpysqfPCS
	fiuEmhW3nnKJAnjHQitdyXuSQ1+zkSd9NidYTotw+NGyr7UN09uWXK1R2dcayvRNcO00F6DJqE3
	TvSknujNch/CpXhKT6AgiFKoJWY4mFozI7CAVrrUgfX/UdXiq9t7Ve+AYw9yiZKyWBU4MPtXjpn
	O2XIwc6W+YjWEcGsrRcU3yrraEd04bFAsx+FRHxAK9AEq0B3f91UVeLPZUd5jZsCoAWQMH62X1Z
	xVpZu1CFROIPhYCoDs7CsHzMa5WN1XCZxe5EjiOWilfAOTy7yG2ZYHwEOguGftDKbOk/pLYf364
	dsFD6X7HjOhZiavUcTo8kTTyygxFZ//DoozMJxnInKLMQhhvUPzQJqD6W67igtcUrUXZugFihT
X-Received: by 2002:a05:7022:6290:b0:12a:6fb7:87e3 with SMTP id a92af1059eb24-12c34f05b51mr2604016c88.31.1775836151097;
        Fri, 10 Apr 2026 08:49:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459f7ffsm3777944c88.3.2026.04.10.08.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 08:49:10 -0700 (PDT)
Message-ID: <bcc88b28-fa45-4a75-8a09-98d25a9377c9@roeck-us.net>
Date: Fri, 10 Apr 2026 08:49:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] watchdog: aaeon: Add watchdog driver for SRG-IMX8P
 MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
 <20260408-dev-b4-aaeon-mcu-driver-v5-5-ad98bd481668@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260408-dev-b4-aaeon-mcu-driver-v5-5-ad98bd481668@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_084912_558754_26F5D130 
X-CRM114-Status: GOOD (  28.96  )
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

On 4/8/26 10:21, Thomas Perrot (Schneider Electric) wrote:
> Add watchdog driver for the Aaeon SRG-IMX8P embedded controller.
> This driver provides system monitoring and recovery capabilities
> through the MCU's watchdog timer.
> 
> The watchdog supports start, stop, and ping operations with a maximum
> hardware heartbeat of 25 seconds and a default timeout of 240 seconds.
> 
> Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>   MAINTAINERS                      |   1 +
>   drivers/watchdog/Kconfig         |  10 +++
>   drivers/watchdog/Makefile        |   1 +
>   drivers/watchdog/aaeon_mcu_wdt.c | 132 +++++++++++++++++++++++++++++++++++++++
>   4 files changed, 144 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2538f8c4bc14..7b92af42c9fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -193,6 +193,7 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
>   F:	drivers/gpio/gpio-aaeon-mcu.c
>   F:	drivers/mfd/aaeon-mcu.c
> +F:	drivers/watchdog/aaeon_mcu_wdt.c
>   F:	include/linux/mfd/aaeon-mcu.h
>   
>   AAEON UPBOARD FPGA MFD DRIVER
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index d3b9df7d466b..f67a0b453316 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -420,6 +420,16 @@ config SL28CPLD_WATCHDOG
>   
>   # ARM Architecture
>   
> +config AAEON_MCU_WATCHDOG
> +	tristate "Aaeon MCU Watchdog"
> +	depends on MFD_AAEON_MCU
> +	select WATCHDOG_CORE
> +	help
> +	  Select this option to enable watchdog timer support for the Aaeon
> +	  SRG-IMX8P onboard microcontroller (MCU). This driver provides
> +	  watchdog functionality through the MCU, allowing system monitoring
> +	  and automatic recovery from system hangs.
> +
>   config AIROHA_WATCHDOG
>   	tristate "Airoha EN7581 Watchdog"
>   	depends on ARCH_AIROHA || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index ba52099b1253..2deec425d3ea 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_USBPCWATCHDOG) += pcwd_usb.o
>   # ALPHA Architecture
>   
>   # ARM Architecture
> +obj-$(CONFIG_AAEON_MCU_WATCHDOG) += aaeon_mcu_wdt.o
>   obj-$(CONFIG_ARM_SP805_WATCHDOG) += sp805_wdt.o
>   obj-$(CONFIG_ARM_SBSA_WATCHDOG) += sbsa_gwdt.o
>   obj-$(CONFIG_ARMADA_37XX_WATCHDOG) += armada_37xx_wdt.o
> diff --git a/drivers/watchdog/aaeon_mcu_wdt.c b/drivers/watchdog/aaeon_mcu_wdt.c
> new file mode 100644
> index 000000000000..949b506d8194
> --- /dev/null
> +++ b/drivers/watchdog/aaeon_mcu_wdt.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU Watchdog driver
> + *
> + * Copyright (C) 2026 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/watchdog.h>
> +
> +#define AAEON_MCU_PING_WDT	0x73
> +
> +#define AAEON_MCU_WDT_TIMEOUT         240
> +#define AAEON_MCU_WDT_HEARTBEAT_MS    25000
> +
> +struct aaeon_mcu_wdt {
> +	struct watchdog_device wdt;
> +	struct regmap *regmap;
> +};
> +
> +static int aaeon_mcu_wdt_cmd(struct aaeon_mcu_wdt *data, u8 opcode, u8 arg)
> +{
> +	return regmap_write(data->regmap, AAEON_MCU_REG(opcode, arg), 0);
> +}
> +
> +static int aaeon_mcu_wdt_start(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_CONTROL_WDT_OPCODE, 0x01);
> +}
> +
> +static int aaeon_mcu_wdt_status(struct watchdog_device *wdt, bool *enabled)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +	unsigned int rsp;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap,
> +			  AAEON_MCU_REG(AAEON_MCU_CONTROL_WDT_OPCODE, 0x02),
> +			  &rsp);
> +	if (ret)
> +		return ret;
> +
> +	*enabled = rsp == 0x01;
> +	return 0;
> +}
> +
> +static int aaeon_mcu_wdt_stop(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_CONTROL_WDT_OPCODE, 0x00);
> +}
> +
> +static int aaeon_mcu_wdt_ping(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_PING_WDT, 0x00);
> +}
> +
> +static const struct watchdog_info aaeon_mcu_wdt_info = {
> +	.identity	= "Aaeon MCU Watchdog",
> +	.options	= WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE
> +};
> +
> +static const struct watchdog_ops aaeon_mcu_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= aaeon_mcu_wdt_start,
> +	.stop		= aaeon_mcu_wdt_stop,
> +	.ping		= aaeon_mcu_wdt_ping,
> +};
> +
> +static int aaeon_mcu_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct watchdog_device *wdt;
> +	struct aaeon_mcu_wdt *data;
> +	bool enabled;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!data->regmap)
> +		return -ENODEV;
> +
> +	wdt = &data->wdt;
> +	wdt->parent = dev;
> +	wdt->info = &aaeon_mcu_wdt_info;
> +	wdt->ops = &aaeon_mcu_wdt_ops;
> +	/*
> +	 * The MCU firmware has a fixed hardware timeout of 25 seconds that
> +	 * cannot be changed. The watchdog core will handle automatic pinging
> +	 * to support longer timeouts. The software timeout of 240 seconds is
> +	 * chosen arbitrarily as a reasonable value and is not user-configurable.
> +	 */

Odd, unusual, unnecessary, I would argue that most people would consider a fixed
timeout of 240s as anything but reasonable, and as the comment says arbitrary.
Since I am sure that I pointed this out before, you still insist, and I am
tired of arguing: Your funeral, so

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> +	wdt->timeout = AAEON_MCU_WDT_TIMEOUT;
> +	wdt->max_hw_heartbeat_ms = AAEON_MCU_WDT_HEARTBEAT_MS;
> +
> +	watchdog_set_drvdata(wdt, data);
> +
> +	ret = aaeon_mcu_wdt_status(wdt, &enabled);
> +	if (ret)
> +		return ret;
> +
> +	if (enabled)
> +		set_bit(WDOG_HW_RUNNING, &wdt->status);
> +
> +	return devm_watchdog_register_device(dev, wdt);
> +}
> +
> +static struct platform_driver aaeon_mcu_wdt_driver = {
> +	.driver		= {
> +		.name	= "aaeon-mcu-wdt",
> +	},
> +	.probe		= aaeon_mcu_wdt_probe,
> +};
> +
> +module_platform_driver(aaeon_mcu_wdt_driver);
> +
> +MODULE_DESCRIPTION("Aaeon MCU Watchdog Driver");
> +MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
> +MODULE_LICENSE("GPL");
> 


