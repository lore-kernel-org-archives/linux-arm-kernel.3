Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAADBE8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fc8GgBeKUnzZSNQagN8MObCUTYRnN8hwXFvTTnWwbok=; b=l2FHuC2P/Vv9S382wsz5yhF6pe
	B4A6spPf8FK20f4evOqQ9rc/Zpo8PR9KbOMZVQ1jV++mvotoYyJM0mP0YC5GHXCptRAeLdUKQ4jGh
	Kmz4/Prh0IXGJG7hyFkoMOpwRwBjA6kzpSbklzUNfHxGRSsjUXtO39CgKxQJG5MgY9fpR+MzyfwRZ
	iRBDK+Nvv39udoMpD/U+C/7IZFBpxxNV8OiuAw/fG8pvt5lPjjNeboAyTC2POFY7V1MF6baBnKxrW
	qTZltuR+vzdHwsJDz07rfN/OifyTDwMMrdFRet9/FcfO1qr+lLVKU9/3MTikAZVQCOWNPdVV7XXHP
	30b7l08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKRG-000000074Tu-3s54;
	Tue, 03 Feb 2026 17:43:46 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKRF-000000074TB-0wa2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 17:43:46 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso4708099b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770140624; x=1770745424; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fc8GgBeKUnzZSNQagN8MObCUTYRnN8hwXFvTTnWwbok=;
        b=kY/Cbz04Od7x2UzNH8y4DHvruRjSJtjzbWU7FNaGb19lGW+SLce/IqciAgA2b1Nxp0
         w5jvS86NYHRZ84++LjcLbLyneSOZqlGLEZZ5uKA0dhRrLnHlP+ScXCtFeBVQyxBSss/Z
         e3VKHxkGn0FFa42LV0YvEZUF0UNiVb9cExqS/0C2cGx6jabJdRpjGmkQa2pgSjIEoqY1
         unqwhjQTtl9/TulrDBMa+ooxXzUkA3zjzBeZLXRrQSjTtQMg1eEdFY+vekbQZ/eB06ic
         xC/otQ8LsAqrel2p6sc6tOSrDxvt289OvkI2kZUNndYDUVtmKx3LU7g3cOXAGhOqn0kh
         CxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770140624; x=1770745424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fc8GgBeKUnzZSNQagN8MObCUTYRnN8hwXFvTTnWwbok=;
        b=v26zAfdlOFKJ7cGeNCbrhigORWC/NhIxlhB4lVR1yqh6W/S+mkoJC1NDu8DaH0nnEJ
         CttDc8InITQCD75ZFmR8Ky3rJa+6DAMtn1GMo/hWqaJLY3jkhsG0cChk0UuQHW84vghy
         zSz+8jqSwoZWWzKOOAYDz+UVXLbTf4nMXQ5sc5dO24JYQzJ9lbwF8zXZZd0yLSFFjaej
         u+q6mK785QjyTC3rgvD0Sl2yxAy8S5lLU4MhCTm3bPtupF9vxD6HDuabfUZv9XfGN4eY
         KHMQ2mi9X5yRa9YdPE0EJkguv05oojKd0dvSEyZ4dyt0H0pYKaf+qAHLNqTaMllgWDLR
         vbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7H4e+Hx2N9vFpsaJYNZYJOAAHqF/jLxX4PjGsilnzIYQeTSMQ1jkqwcCMrUqhb3t1MWY2rMAkxL053okTXSYI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuni/cOYspeCfVQX/lYleSV87oGrpnf5oXBvyg1H/xEmfNXXGp
	I8Gd/LVGo83S6cp9HYJ3eGct93q7B/nCPn7UJv9swtxlEV2D7aOCH0Tr
X-Gm-Gg: AZuq6aLCSTtn0Nc+5zZiP/AlhoJ2F4F58Fj0Nd8es6Pn1/g11dc1nVJxCfS9Axhy0CK
	iGvUlTwUTLxRWzjpjK0EonK8RHIbkQC+KQeLuBrshjsE02/tE5g93cF/6AIml6IPBMtSb+okUzl
	Vky0ANa9kxKOfMejoj4cp0YOUKTcd5ZLSY+X2MZMlsh6P7y4yBJGJWvRu9GF4OmY+sSDQXsFGhq
	pO0Aat/aXi0jcnXmDwa7EB3/Q3gkpir0VC3QmzSMLpDcKoTNRvgQETiZZAPt3DKfRyjy1zfKGaR
	TeuVggbR6rTXp68ep+c2XjMaBK4OegC9XzjBjHGvV4EZuibH8w88tI0L9xIiX9EpkTzljZ6nD+M
	BhmmOnULR9haVWIbe1KGaN3TbR8lGk7USVRja6GS1zRmshqQzlo79R86z7dm0fFQ/wAc1HMFS/R
	Fw9X0oePgwHzwVi1WvLRxyZFsGBaMDdsFFlxlHIRhue44CIPSdWX9154oYuk2s
X-Received: by 2002:a05:6a00:8f08:b0:81e:e09d:2687 with SMTP id d2e1a72fcca58-8241c16c890mr208650b3a.1.1770140623769;
        Tue, 03 Feb 2026 09:43:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d434ed5sm3892b3a.39.2026.02.03.09.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 09:43:43 -0800 (PST)
Message-ID: <8ca53787-5968-41f9-a605-03e58a8c4565@roeck-us.net>
Date: Tue, 3 Feb 2026 09:43:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] watchdog: aaeon: Add watchdog driver for SRG-IMX8P
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
 <20260203-dev-b4-aaeon-mcu-driver-v3-5-0a19432076ac@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-5-0a19432076ac@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_094345_281945_9E17198F 
X-CRM114-Status: GOOD (  34.56  )
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

On 2/3/26 08:21, Thomas Perrot (Schneider Electric) wrote:
> Add watchdog driver for the Aaeon SRG-IMX8P embedded controller.
> This driver provides system monitoring and recovery capabilities
> through the MCU's watchdog timer.
> 
> The watchdog supports start, stop, and ping operations with a maximum
> hardware heartbeat of 25 seconds and a default timeout of 240 seconds.
> The driver assumes the watchdog is already running at probe time, as
> the MCU typically enables it by default.
> 
> Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>   MAINTAINERS                      |   1 +
>   drivers/watchdog/Kconfig         |  10 +++
>   drivers/watchdog/Makefile        |   1 +
>   drivers/watchdog/aaeon_mcu_wdt.c | 136 +++++++++++++++++++++++++++++++++++++++
>   4 files changed, 148 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2538f8c4bc1482b139e18243a68f0a21b9be3704..7b92af42c9fdc17a69a4e7a2fe50f9e199c8b144 100644
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
> index d3b9df7d466b0b7215ee87b3040811d44ee53d2a..0835df4c902f059c0d61a6e8d884742dd7d2f741 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -168,6 +168,16 @@ config SOFT_WATCHDOG_PRETIMEOUT
>   	  watchdog. Be aware that governors might affect the watchdog because it
>   	  is purely software, e.g. the panic governor will stall it!
>   
> +config AAEON_MCU_WATCHDOG
> +	tristate "Aaeon MCU Watchdog"
> +	depends on MFD_AAEON_MCU || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  Select this option to enable watchdog timer support for the Aaeon
> +	  SRG-IMX8P onboard microcontroller (MCU). This driver provides
> +	  watchdog functionality through the MCU, allowing system monitoring
> +	  and automatic recovery from system hangs.
> +
>   config BD957XMUF_WATCHDOG
>   	tristate "ROHM BD9576MUF and BD9573MUF PMIC Watchdog"
>   	depends on MFD_ROHM_BD957XMUF
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index ba52099b125398a32f80dad23317e223cc4af028..2deec425d3eafb6b208e061fda9f216f4baa8ecc 100644
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
> index 0000000000000000000000000000000000000000..416f3035c3226c3889682102d1d2453a9365b5ba
> --- /dev/null
> +++ b/drivers/watchdog/aaeon_mcu_wdt.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU Watchdog driver
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define AAEON_MCU_CONTROL_WDT	0x63
> +#define AAEON_MCU_PING_WDT	0x73
> +
> +#define AAEON_MCU_WDT_TIMEOUT         240
> +#define AAEON_MCU_WDT_HEARTBEAT_MS    25000
> +
> +struct aaeon_mcu_wdt {
> +	struct watchdog_device wdt;
> +	struct device *dev;
> +};
> +
> +static int aaeon_mcu_wdt_cmd(struct device *dev, u8 opcode, u8 arg)
> +{
> +	u8 cmd[3] = { opcode, arg, 0x00 };
> +	u8 rsp;
> +
> +	return aaeon_mcu_i2c_xfer(dev, cmd, sizeof(cmd), &rsp, sizeof(rsp));

This warrants a comment explaining why "rsp" is irrelevant.

> +}
> +
> +static int aaeon_mcu_wdt_start(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data->dev, AAEON_MCU_CONTROL_WDT, 0x01);
> +}
> +
> +static int aaeon_mcu_wdt_status(struct watchdog_device *wdt, bool *enabled)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +	u8 cmd[3], rsp;

Not that it matters much, but for consistency it would be nice to use the
same pattern as above and initialize cmd here.

> +	int ret;
> +
> +	cmd[0] = AAEON_MCU_CONTROL_WDT;
> +	cmd[1] = 0x02;
> +	cmd[2] = 0x00;
> +
> +	ret = aaeon_mcu_i2c_xfer(data->dev, cmd, sizeof(cmd), &rsp, sizeof(rsp));
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
> +	return aaeon_mcu_wdt_cmd(data->dev, AAEON_MCU_CONTROL_WDT, 0x00);
> +}
> +
> +static int aaeon_mcu_wdt_ping(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data->dev, AAEON_MCU_PING_WDT, 0x00);
> +}
> +
> +static const struct watchdog_info aaeon_mcu_wdt_info = {
> +	.identity	= "Aaeon MCU Watchdog",
> +	.options	= WDIOF_KEEPALIVEPING
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
> +	data->dev = dev->parent;
> +
> +	wdt = &data->wdt;
> +	wdt->parent = dev;
> +	wdt->info = &aaeon_mcu_wdt_info;
> +	wdt->ops = &aaeon_mcu_wdt_ops;
> +	/*
> +	 * The MCU firmware has a fixed hardware timeout of 25 seconds that
> +	 * cannot be changed. The watchdog core will handle automatic pinging
> +	 * to support longer timeouts. The default timeout of 240 seconds is
> +	 * chosen arbitrarily as a reasonable value; users can adjust it via
> +	 * the standard watchdog interface if needed.

No, they can't, because WDIOF_SETTIMEOUT is not set in .options. Also,
the above implies that the minimum timeout is 25 seconds, which is not set.
Not that it matters, because the timeout can not be changed in the first
place, but still ...

Guenter

> +	 */
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


