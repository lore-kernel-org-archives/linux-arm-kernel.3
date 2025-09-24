Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DB8CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LDfSENKdKztM+NPfriiUAqmqTtikOiZ/9cWr0HAw+U=; b=xjkNcFCQ7BA4A9UYTPlcyNorVH
	F15aYYr48XIuI1i50IIXqnrY5aObJUZrjL3hMAJ0hFhCn5bNth3pog/IuqiHeNJHn+M1IRTTORtWN
	y0bt6FVyv7MWJisi2+WSu2Zse9w+C8shLdsybXyHZVBo5Sp+2OhzCTWUrrA6W9cpZBUQV5Wx7yfOw
	OKEsN5nDnOYqLRAi1SQJn5GnCenBORcGNl+dh+pAwWmHojCVU3KukYDnoaZt00BMMJZsv/SxKvz5y
	9HkoRK9RGzsribCWFzdMF9Iznv1m6Z9afoGFbPl7iNQiRaVHkvWLqai1iM/QvII92Ii14lhnSDQUs
	VswLmr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Rvl-00000001WGg-0JKP;
	Wed, 24 Sep 2025 16:01:21 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Rvi-00000001WFF-2X1T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:01:19 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso4988116a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 09:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729678; x=1759334478; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LDfSENKdKztM+NPfriiUAqmqTtikOiZ/9cWr0HAw+U=;
        b=JRlEeCIFX/yJ2kjEw6VEJMq16XffOVw4b+C2E4a1rJb+S1oQmGG8ITVw493a7UjDR+
         0Xmi56zIKjIURzqNBoc1XpITNt61AXR6jh67Kl5/0cZ+2mgB0gUFQRdvMtX+Wxbn0/1m
         5GpWRmc2Pn0iLT8ire0FKlnvcnew947+7oN0PN5kBndjikuBmdLIjNsdDHETmN1sPHyL
         ZI5Y4r2uJk5Oio8mLf8qVnrHTe0DoaOyXsrEBZaa5TM9/zc/eneua66lxjAnSufaRXGI
         mnF7Ar2VOEmZG/pDmcquPAV2L5Nfgm2ObBy+r53p8SEHmM3rIA/TBVSD6wbkMDyIWYaY
         asgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729678; x=1759334478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LDfSENKdKztM+NPfriiUAqmqTtikOiZ/9cWr0HAw+U=;
        b=uNnHQKgn9KcB00dngvDTwEjfXknwTZtvtHR1jjl3RIS7MDiFjRwA2+T3v+ebk23GQi
         SPSNrdh7zIYRL5L6z+KGwe/37mA/h+weecFMpDyktpErbaeYfhAgvCl3HC6+9DPdv0MY
         05VF4E6CYgk7gUrMKf8aRNJrhotBtlxHZpiQc9w4nwSxiJzlgkccK3AyWYdihMe723O0
         SjVaO3enRdK5dPoGfl92jimWfhyIt2EQ/T7Uqu/fKd3mPFLXonTxb5gPhB/pa2Tub596
         AQVKUqHLhBfSRXdOhOtvlyQlPiFAQMtOeP3q6o8SXgdwjLAnuaabHMWmXmgGn17fZbUA
         NWWA==
X-Forwarded-Encrypted: i=1; AJvYcCXplG+0ZLE+JhQDB91a9tZV9pm9BwulF05aSYNTCyCKHq9xtfc1N1uEYJRzQ7GobXwEbI684CM2CCXWzWUbO1qi@lists.infradead.org
X-Gm-Message-State: AOJu0YzKqy9iEozU31RCh8Z3zfmAn/loWXcx6hV1O+8JwzXgnklWVHTp
	S+3neK6cDKtXIbI3K7sv3d9e2dgYDGRMPlq9PepiqjHAPHptd35xi7Ho
X-Gm-Gg: ASbGnctPeroMtUZpqe7Jr7lJuL/rLpibyXZnLXc7rtx6YiTBMjteHfvZf2BiME6N4Ez
	xukI2gMulgRcMVPoapcEHWjEQnKwhQvFy2v3jCdXURGTMqrjAL6vXopjB5VngXKwTn+IUS6WXus
	IbBhnslOL/oCla+Km2dfOosaQYOQKJOJuTN6qYl4ZiTSSUQgbvvnhGHFD/6tYLD4rEQc6dL58S8
	DZdbAE8/9FnStysx4Pdg5xqYan6eQDsCcYOJ4a0C7Uo5S2XNBVj4a39rAe7pqmeLG+NMdWMa9t1
	vhokRqZzWzq+uMwyvpu4Io8dJuZjjjO5mXgjdapprE+Xa+3SBOXQxzRTABO/GANSiyddL1SIV6V
	7o9OyAKfCf0fbc2PyRnq+AjfF5RX0K18PipQidchlsVHYmQ==
X-Google-Smtp-Source: AGHT+IFtAaeNUhmSq0xhqL9R/6td548Mj/QtR3u0DHfxagwGl+GUEvYYfxMUJWaJJiOeIsz8vok9NQ==
X-Received: by 2002:a17:903:3550:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-27ed4a7e8e2mr2255345ad.29.1758729675569;
        Wed, 24 Sep 2025 09:01:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de5dbsm194880005ad.84.2025.09.24.09.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:01:15 -0700 (PDT)
Date: Wed, 24 Sep 2025 09:01:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v2 6/7] hwmon: add SMARC-sAM67 support
Message-ID: <bcd0c368-aa55-4c95-a4da-ebff162d674e@roeck-us.net>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <20250912120745.2295115-7-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120745.2295115-7-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_090118_659182_0123D3E4 
X-CRM114-Status: GOOD (  36.74  )
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

On Fri, Sep 12, 2025 at 02:07:44PM +0200, Michael Walle wrote:
> Add a new driver for the Kontron SMARC-sAM67 board management
> controller. It has two voltage sensors and one temperature sensor.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied.

Guenter

> ---
>  Documentation/hwmon/sa67.rst  |  41 +++++++++

Note: Added to index.rst file

>  MAINTAINERS                   |   1 +
>  drivers/hwmon/Kconfig         |  10 +++
>  drivers/hwmon/Makefile        |   1 +
>  drivers/hwmon/sa67mcu-hwmon.c | 161 ++++++++++++++++++++++++++++++++++
>  5 files changed, 214 insertions(+)
>  create mode 100644 Documentation/hwmon/sa67.rst
>  create mode 100644 drivers/hwmon/sa67mcu-hwmon.c
> 
> diff --git a/Documentation/hwmon/sa67.rst b/Documentation/hwmon/sa67.rst
> new file mode 100644
> index 000000000000..029c7c169b7f
> --- /dev/null
> +++ b/Documentation/hwmon/sa67.rst
> @@ -0,0 +1,41 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver sa67mcu
> +=====================
> +
> +Supported chips:
> +
> +   * Kontron sa67mcu
> +
> +     Prefix: 'sa67mcu'
> +
> +     Datasheet: not available
> +
> +Authors: Michael Walle <mwalle@kernel.org>
> +
> +Description
> +-----------
> +
> +The sa67mcu is a board management controller which also exposes a hardware
> +monitoring controller.
> +
> +The controller has two voltage and one temperature sensor. The values are
> +hold in two 8 bit registers to form one 16 bit value. Reading the lower byte
> +will also capture the high byte to make the access atomic. The unit of the
> +volatge sensors are 1mV and the unit of the temperature sensor is 0.1degC.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported.
> +
> +======================= ========================================================
> +in0_label		"VDDIN"
> +in0_input		Measured VDDIN voltage.
> +
> +in1_label		"VDD_RTC"
> +in1_input		Measured VDD_RTC voltage.
> +
> +temp1_input		MCU temperature. Roughly the board temperature.
> +======================= ========================================================
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa7f80bd7b2f..69fcd5c077ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23489,6 +23489,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.
>  F:	Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
>  F:	Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
>  F:	drivers/gpio/gpio-sl28cpld.c
> +F:	drivers/hwmon/sa67mcu-hwmon.c
>  F:	drivers/hwmon/sl28cpld-hwmon.c
>  F:	drivers/irqchip/irq-sl28cpld.c
>  F:	drivers/pwm/pwm-sl28cpld.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index d6769288a76e..c2f288ebdf44 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1905,6 +1905,16 @@ config SENSORS_RASPBERRYPI_HWMON
>  	  This driver can also be built as a module. If so, the module
>  	  will be called raspberrypi-hwmon.
>  
> +config SENSORS_SA67MCU
> +	tristate "Kontron sa67mcu hardware monitoring driver"
> +	depends on MFD_SL28CPLD || COMPILE_TEST
> +	help
> +	  If you say yes here you get support for the voltage and temperature
> +	  monitor of the sa67 board management controller.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called sa67mcu-hwmon.
> +
>  config SENSORS_SL28CPLD
>  	tristate "Kontron sl28cpld hardware monitoring driver"
>  	depends on MFD_SL28CPLD || COMPILE_TEST
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 051981eb8a50..2956898776bb 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -197,6 +197,7 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
>  obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
>  obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
>  obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
> +obj-$(CONFIG_SENSORS_SA67MCU)	+= sa67mcu-hwmon.o
>  obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
>  obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
> diff --git a/drivers/hwmon/sa67mcu-hwmon.c b/drivers/hwmon/sa67mcu-hwmon.c
> new file mode 100644
> index 000000000000..22f703b7b256
> --- /dev/null
> +++ b/drivers/hwmon/sa67mcu-hwmon.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * sl67mcu hardware monitoring driver
> + *
> + * Copyright 2025 Kontron Europe GmbH
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define SA67MCU_VOLTAGE(n)	(0x00 + ((n) * 2))
> +#define SA67MCU_TEMP(n)		(0x04 + ((n) * 2))
> +
> +struct sa67mcu_hwmon {
> +	struct regmap *regmap;
> +	u32 offset;
> +};
> +
> +static int sa67mcu_hwmon_read(struct device *dev,
> +			      enum hwmon_sensor_types type, u32 attr,
> +			      int channel, long *input)
> +{
> +	struct sa67mcu_hwmon *hwmon = dev_get_drvdata(dev);
> +	unsigned int offset;
> +	u8 reg[2];
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			offset = hwmon->offset + SA67MCU_VOLTAGE(channel);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			offset = hwmon->offset + SA67MCU_TEMP(channel);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* Reading the low byte will capture the value */
> +	ret = regmap_bulk_read(hwmon->regmap, offset, reg, ARRAY_SIZE(reg));
> +	if (ret)
> +		return ret;
> +
> +	*input = reg[1] << 8 | reg[0];
> +
> +	/* Temperatures are s16 and in 0.1degC steps. */
> +	if (type == hwmon_temp)
> +		*input = sign_extend32(*input, 15) * 100;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info * const sa67mcu_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static const char *const sa67mcu_hwmon_in_labels[] = {
> +	"VDDIN",
> +	"VDD_RTC",
> +};
> +
> +static int sa67mcu_hwmon_read_string(struct device *dev,
> +				     enum hwmon_sensor_types type, u32 attr,
> +				     int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_label:
> +			*str = sa67mcu_hwmon_in_labels[channel];
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops sa67mcu_hwmon_ops = {
> +	.visible = 0444,
> +	.read = sa67mcu_hwmon_read,
> +	.read_string = sa67mcu_hwmon_read_string,
> +};
> +
> +static const struct hwmon_chip_info sa67mcu_hwmon_chip_info = {
> +	.ops = &sa67mcu_hwmon_ops,
> +	.info = sa67mcu_hwmon_info,
> +};
> +
> +static int sa67mcu_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct sa67mcu_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	if (!pdev->dev.parent)
> +		return -ENODEV;
> +
> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return -ENOMEM;
> +
> +	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!hwmon->regmap)
> +		return -ENODEV;
> +
> +	ret = device_property_read_u32(&pdev->dev, "reg", &hwmon->offset);
> +	if (ret)
> +		return -EINVAL;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +							 "sa67mcu_hwmon", hwmon,
> +							 &sa67mcu_hwmon_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		dev_err(&pdev->dev, "failed to register as hwmon device");
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct of_device_id sa67mcu_hwmon_of_match[] = {
> +	{ .compatible = "kontron,sa67mcu-hwmon", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sa67mcu_hwmon_of_match);
> +
> +static struct platform_driver sa67mcu_hwmon_driver = {
> +	.probe = sa67mcu_hwmon_probe,
> +	.driver = {
> +		.name = "sa67mcu-hwmon",
> +		.of_match_table = sa67mcu_hwmon_of_match,
> +	},
> +};
> +module_platform_driver(sa67mcu_hwmon_driver);
> +
> +MODULE_DESCRIPTION("sa67mcu Hardware Monitoring Driver");
> +MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
> +MODULE_LICENSE("GPL");

