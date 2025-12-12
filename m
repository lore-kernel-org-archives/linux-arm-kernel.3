Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700CBD49203
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 11:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJ2QIzWrT7rWsYjm95h3xcBoAy5TUAPtYMMg0O2dbCU=; b=vvRBDDGP7V+pAFCc094YGm7InK
	Sp54vbOsANJVx6z15+DRNdnTZbdeny3M4hEagwq+MProo1VpY4IFBsLhLFcPLHiy4q/xxEtgwGMO6
	ItAsu7ZCCT4nOR6nrVdvvPw6uJy8F6eoxl6JgOW1S+u9XwlLe1tV1al3OxvBO9tWhUHSu7KHSIEaf
	uFd85Z3EK0zpsuhhhRet0h8O/1lOE+tb5xFPYIIr0U91MGptZREaMtUcRIgMHXckjdX1RjPGw+pvz
	+vwo828WMk55AKBGRgmPachoWKsd3vkBblbSES5Abn4+FPczmBLq5X04xEt3iROciqS+vF8uzZLaF
	cHwOvbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1Zh-00000000Twk-3494;
	Fri, 12 Dec 2025 11:44:41 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1Zf-00000000Tw0-1k8Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 11:44:40 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so1132157a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765539878; x=1766144678; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RJ2QIzWrT7rWsYjm95h3xcBoAy5TUAPtYMMg0O2dbCU=;
        b=juzAOGRlPKwv5k3ipQqw8VHgz6tdDpdkuXVy3hWdj/5xBO1m404JVLZc+6OdW/bpuC
         JTjKvJ6pww9uhSsMfsY2kSAMeXe5O6NTKexcBlAm+bXeCrf3l2xluOSuCxgKRsS0e5ER
         QMN0Bid+ma+PB0eN6As034H05TS9s1ci1/BZsjdrgENN1+7STn5Pym1pzgQvYY1vhqfK
         6kyoNjbysILn9twBZlUvtKbKHFHnz86KBSoVgXMdgfWpOsU/4s933GNwW3Texha8+m//
         KYkV8r3hNUulb3xqqSPGaCft5obRyscyLL+K6o0vjiRebBYlF0YyI1jppF3HAaLX8kMd
         aZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765539878; x=1766144678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJ2QIzWrT7rWsYjm95h3xcBoAy5TUAPtYMMg0O2dbCU=;
        b=PT0wtCkX3sjT3tf9ca2/Z19whorlFM5iuhX9ughKFhy/1jmkt3HCDHEx+pGWZvCv+8
         b2CL10bneqZAQCI0V1oTecEf07F0g77Y1HBFNB1g+GLyCowpA78N3X99Qpxuhvcxq0U1
         fEJzUUvJsHurILGx97nVuSMFLaMBr47ABf7ZiysqSILk4AVJXexoeQzzgJe4vba/V9NH
         5u45ZPMVsCWVh2Dkb/YFmcfj1wvqrmBM5XEgrjDF9l0Db/Gog4UxNYLlXapHC5aeKId8
         h0DALj5t4UYJy2bP+Yn+E5LSLgsTspuwpXnAiehlevp9eOuQ6s+Yxb6Ld8uB02doivYU
         Xq6g==
X-Forwarded-Encrypted: i=1; AJvYcCWmU5AXMPQv260+dJZOoOPezYnGRgNAQR81/pqjJdedpPaBDD4Z4kt9X4Fed2e+XqM17X5FZLx5x4vZ1UBMJ2lM@lists.infradead.org
X-Gm-Message-State: AOJu0YzgiFrbpND4VF8fJIqC3zAN0t/7FEaMLMc/HPucOs3hQUuOSuOl
	zGLbMTNW1A2Vqk2rsvLQ6Gi/mIH3myObkHeFUL/CFVjaK7EKGEYETy15
X-Gm-Gg: AY/fxX7klpgZcvVdNHOvUp8q75nGsqG5NM9K0vlUlelSfDFEMcrYmbZGptANBBnhGpf
	DMXYLzhPxHhkT63yYcb8UKHU/9eOQNUwqYdcvktkapR+rT6Qbu9h/jDkvJYiPO6tRebQUhBrlm2
	QNwyKY92gHXbzCa2wm+mB3r7Z3Vc7V2mwiJ/Eu2UXFKFIEmlWZ5/yHKrhhiVCo1DRn5hWQcRtpu
	PXN8hxRcsa5uxt0rWEMwaQlTjurReGjxjKWjsYbwsTT5kPhc0W9efzJ5wgTxH55L6VQI7XoRyjY
	lyXbG257asHynZgNU/Xnlez+YiL2zw8r7FUgc4vGbfxyWoGSk1VsfyNHRzikmsKWIOraRe/sK9F
	k5cvV3oferzuaUPEqZ67hC468fPEvcOeL1jc1XcPdEpjmQ4QSKxtJAlkcMkz4Z1sfXExfX4emPV
	N2adhlpXHVtCNffZ+e2qFGt53Gq4vXOgSo37vbwFtSu0uqB6uOVGhikB77SBg=
X-Google-Smtp-Source: AGHT+IE57u8YLMdN3rnVuS/YPbhpkSu7xR+UOzXyF12rFeKj224UA0w0QHmxPTykvuZ49Qsef/l4RQ==
X-Received: by 2002:a05:7301:f0f:b0:2a9:573a:4a74 with SMTP id 5a478bee46e88-2ac3018c397mr1305680eec.9.1765539878249;
        Fri, 12 Dec 2025 03:44:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac18f5c2dbsm16671926eec.0.2025.12.12.03.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 03:44:37 -0800 (PST)
Message-ID: <4483f8fe-2bad-46f1-b37f-157515098f54@roeck-us.net>
Date: Fri, 12 Dec 2025 03:44:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] watchdog: aaeon: Add watchdog driver for SRG-IMX8PL
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
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
 <20251212-dev-b4-aaeon-mcu-driver-v1-7-6bd65bc8ef12@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-7-6bd65bc8ef12@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_034439_470231_D8E19727 
X-CRM114-Status: GOOD (  31.64  )
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

On 12/11/25 23:41, Thomas Perrot (Schneider Electric) wrote:
> Add watchdog driver for the Aaeon SRG-IMX8PL embedded controller.
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
>   drivers/watchdog/Kconfig         |  10 +++
>   drivers/watchdog/Makefile        |   1 +
>   drivers/watchdog/aaeon_mcu_wdt.c | 140 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 151 insertions(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index d3b9df7d466b0b7215ee87b3040811d44ee53d2a..1bd4a7bee303e5e2508f540dc2c16e9e19ed18b0 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -168,6 +168,16 @@ config SOFT_WATCHDOG_PRETIMEOUT
>   	  watchdog. Be aware that governors might affect the watchdog because it
>   	  is purely software, e.g. the panic governor will stall it!
>   
> +config AAEON_MCU_WATCHDOG
> +	tristate "Aaeon MCU Watchdog"
> +	depends on MFD_AAEON_MCU
> +	select WATCHDOG_CORE
> +	help
> +	  Select this option to enable watchdog timer support for the Aaeon
> +	  SRG-IMX8PL onboard microcontroller (MCU). This driver provides
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
> index 0000000000000000000000000000000000000000..8413ea3bce99585d989cf13e4494e8daff2d9e4c
> --- /dev/null
> +++ b/drivers/watchdog/aaeon_mcu_wdt.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU Watchdog driver
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define AAEON_MCU_CONTROL_WDT 0x63
> +#define AAEON_MCU_PING_WDT 0x73

tab after the macro name, please.

> +
> +#define AAEON_MCU_WDT_TIMEOUT         240
> +#define AAEON_MCU_WDT_HEARTBEAT_MS    25000
> +
> +struct aaeon_mcu_wdt {
> +	struct watchdog_device wdt;
> +	struct aaeon_mcu_dev *mfd;

mfd is not used anywhere. Just store and use the i2c client.

> +};
> +
> +static int aaeon_mcu_wdt_start_cmd(struct aaeon_mcu_wdt *data)
> +{
> +	u8 cmd[3], rsp;
> +
> +	cmd[0] = AAEON_MCU_CONTROL_WDT;
> +	cmd[1] = 0x01;
> +	cmd[2] = 0x00;
> +
> +	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_wdt_start(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_start_cmd(data);
> +}
> +
> +static int aaeon_mcu_wdt_stop_cmd(struct aaeon_mcu_wdt *data)
> +{
> +	u8 cmd[3], rsp;
> +
> +	cmd[0] = AAEON_MCU_CONTROL_WDT;
> +	cmd[1] = 0x00;
> +	cmd[2] = 0x00;
> +
> +	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_wdt_stop(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_stop_cmd(data);
> +}
> +
> +static int aaeon_mcu_wdt_ping_cmd(struct aaeon_mcu_wdt *data)
> +{
> +	u8 cmd[3], rsp;
> +
> +	cmd[0] = AAEON_MCU_PING_WDT;
> +	cmd[1] = 0x00;
> +	cmd[2] = 0x00;
> +
> +	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);

This code is pretty much always the same. It would be much simpler to just pass
i2c_client and the opcodes (first two bytes of the 3-byte message) as parameters
to a single function.

> +}
> +
> +static int aaeon_mcu_wdt_ping(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_ping_cmd(data);
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
> +	struct aaeon_mcu_dev *mcu = dev_get_drvdata(dev->parent);
> +	struct watchdog_device *wdt;
> +	struct aaeon_mcu_wdt *data;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->mfd = mcu;
> +
> +	wdt = &data->wdt;
> +	wdt->parent = dev;
> +
> +	wdt->info = &aaeon_mcu_wdt_info;
> +	wdt->ops = &aaeon_mcu_wdt_ops;
> +	wdt->max_hw_heartbeat_ms = AAEON_MCU_WDT_HEARTBEAT_MS;
> +	watchdog_init_timeout(wdt, AAEON_MCU_WDT_TIMEOUT, dev);

Calling watchdog_init_timeout() only makes sense if an (optional)
module parameter is passed to it. Passing a constant is pointless.
Just set wdt->timeout.

> +
> +	watchdog_set_drvdata(wdt, data);
> +	platform_set_drvdata(pdev, data);
> +	set_bit(WDOG_HW_RUNNING, &wdt->status);

The driver does not know if that is the case. Guessing is insufficient.
Either stop the watchdog or start it explicitly if the status can not
be retrieved from the MCU.

> +
> +	return devm_watchdog_register_device(dev, wdt);
> +}
> +
> +static const struct of_device_id aaeon_mcu_wdt_of_match[] = {
> +	{ .compatible = "aaeon,srg-imx8pl-wdt" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, aaeon_mcu_wdt_of_match);
> +
> +static struct platform_driver aaeon_mcu_wdt_driver = {
> +	.driver		= {
> +		.name	= "aaeon-mcu-wdt",
> +		.of_match_table = aaeon_mcu_wdt_of_match,
> +	},
> +	.probe		= aaeon_mcu_wdt_probe,
> +};
> +
> +module_platform_driver(aaeon_mcu_wdt_driver);
> +
> +MODULE_DESCRIPTION("Aaeon MCU Watchdog Driver");
> +MODULE_AUTHOR("Jérémie Dautheribes");
> +MODULE_LICENSE("GPL");
> 


