Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D818AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 22:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bon1Nju5bHH5h+TKI6hTtwU3OXh0HgCxIWxUvi5q8O4=; b=T69BdliP8bDYJ+A+uREYMAGkL2
	tIZeOKVFvyLxwySOl66JTXY61nPesUdxB6jEBv5ykYhEuUWXb9kuaJItpE7QNASNAGiDg2MPnZ/YI
	p3JpwX1J8Z603pNtXQzCX7mL/UEhs4d7wRxwvebi7WsE5MP972uoytg0pQvXdcd4gXyNEU5zTcVwV
	DkTuPQQMqUZah5M/knW4MUdZg3okIoOY2nWmSZyfpQuSDW0Sz3SUShdfrjdBzSV2uIkFJnmsEy/4a
	vhxFf/uWXNc6CVuZU53SevoZhmCeiiTk9oM/+80IpsNv+M95quzur/FgRYjODhTTNY46pcz6NRAoV
	Uwu+N1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1Dj-0000000F8RP-1IMh;
	Thu, 23 Jul 2026 21:44:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1Dg-0000000F8R4-1oal
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 21:44:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso7724075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 14:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784843081; x=1785447881; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bon1Nju5bHH5h+TKI6hTtwU3OXh0HgCxIWxUvi5q8O4=;
        b=CloMq6pcjwZc2qysMyUqqb960plGK289OfCwHfOtgzGrQ4+e+00hmZv3pcEPxG70v4
         NJigTzsuW+WQ1I3rKg7FMSCyf21QWnwtimAGAzvqly6hxiTkJfTQE4AKzfUfC6k4VHDf
         m5HdSVQJUAFJlsZ6CdnsBHACmumhMSLC4CiQVkx3HAdMIBvO6spto7mCbjpO1zeaJ26r
         CgJ1d4yb8NcJAMKxvoZ1Lk1FEGM40mmSkM58+7r7zYU2ahKr8byXUmHOeyJ1DNOoeGaa
         NK5LolzSHmcqmsWM8JPtjZ/g9ty94KkRjxnpbeVE3xSb6Fh9JJM2DT2BoYuDqstlWugP
         ovdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784843081; x=1785447881;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bon1Nju5bHH5h+TKI6hTtwU3OXh0HgCxIWxUvi5q8O4=;
        b=BSAutRhEBnsd+OJtvze+NLllyQvMbQ55av87BABZZfgT3YcJmUAbRjTZH/ZURhgHiC
         RCIN9qLK2sVTT/EcDeNPXVIABKSUiPXNLvdba3ei0NlDv0jaMrovlrJWUphyxagO3ypP
         5fJKwWHSqAAv3oUNzsUAi4oZqvhTZ3csBgP1i9b3LhKOrdy2eYeJ9hYnxXEpLIFL6xHH
         hneJ+al7v08WO4+zuG5Ct25p6UgHYH5m60pe2r4JwSeDU3qFkFUzNdPDSMcZo2i02fYL
         CzLXw0q3jfPdAnUTvZh5nN2cTMVPKXt6NVaghB0BMmR3xEZYcLAVDEC/YXeNqtX74yee
         YQEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpa73z7yJml3jlyQilf84p2bqNsrYfVFpdpuI9xKAYX4WC9A8uyf2M5jPCCjjW+OMZebA9jVHxJmmKI5eQ4VVqQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzrMxUz9hvYn4uG94W8ik1KOMimwU2hxTI5vClTHZhr5ANKrJm0
	j+RBm3g07g3b82hO1Kyza8Zo01kUhIabSUYM6nosVzqNIHEa9oCn+vV9
X-Gm-Gg: AR+sD12DtHjpm+ILtWr9LEMYMI6AuNQtxez7m8N4x4YQ112iiTGyup2q1f5lRHzbyjB
	uDFGZHMICneR9c+ZWF1CkVzELiobu4jEyxDHMikNiA34WWdy9q5QAB4M/907BhqUKyHIs8ODtkg
	WfuZ3lG0+IYh6VM2ZEFqhuepLQSyEfAVWmybhJTG9gdUTQPeM6V1lmBQFaoZjpzyZqWbL1uoOEO
	09uh2e4Ct9f7ttRopC1uS8jV5ItoJ/xzO9g53MWZKbFSJIXqjShyWBZwIBtu65p5XBj5AbOnZwP
	BexjKV/e13hBYApF6PAQDZZnhKf8fBB/UFJiw51Ri6wxPwE2WnRQ/ba6GjFtnJhG1J84ZyRUnGv
	eFdJtcx7+UwMl86CCP5EhKEohwSLDJAx02nlV3mAIgjDjzoAYFmvfUmbFPrT6iE41vuUZ/kFFzp
	yliaeDWhqmSUmE1YOxIf84GNOyOmt53HI6bP/yW94lh67xIbbhK4hUtY4V1fe/iY5qD3FguQiG5
	w4Lm5i329P2F5WqDlhqQGBjRGMqDXbn7WL4JXIb1HUyj08U7mVXmjrN9+PI8DSTMfuzi2ptsXp0
	h10mOS+k6Gi/xwshWSxdykIjoWGH+ATQ3kxubgNocguy52WKRbnyPXTBIoxQ1aN2NPoQVm7Qj5k
	zX1xANfvRmo77geCuDcZjkA==
X-Received: by 2002:a05:600c:5942:b0:495:6397:14b1 with SMTP id 5b1f17b1804b1-49573cf0ec2mr37512475e9.34.1784843081421;
        Thu, 23 Jul 2026 14:44:41 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af6ad58sm24633755e9.4.2026.07.23.14.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:44:41 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:44:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
Message-ID: <20260723234439.06411731@systembl0wer>
In-Reply-To: <20260723-gp2ap070s-v1-2-b8ca3a4c10dd@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
	<20260723-gp2ap070s-v1-2-b8ca3a4c10dd@disroot.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_144444_533660_64A23A08 
X-CRM114-Status: GOOD (  31.86  )
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

On Thu, 23 Jul 2026 22:58:34 +0530
Kaustabh Chakraborty <kauschluss@disroot.org> wrote:

> The GP2AP070S is a proximity sensor designed and manufactured by Sharp
> Corporation. This sensor is used in mobile devices, including, but not
> limited to - the Samsung Galaxy J6.
> 
> The driver has been adopted from Samsung's downstream kernel
> implementation [1]. Due to the lack of public documentation about the
> schematics of this device. The downstream driver acts as the secondary
> source of information. Driver clarity has also been improved with the
> help of the GP2AP* drivers in iio/light.
> 
> Link: https://github.com/Exynos7870/android_kernel_samsung_universal7870/blob/lineage-16.0/drivers/sensors/gp2ap070s.c [1]
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---

Some comments inline. Additionally, please check out Sashiko's
findings: https://sashiko.dev/#/patchset/20260723-gp2ap070s-v1-0-b8ca3a4c10dd%40disroot.org.

>  drivers/iio/proximity/Kconfig     |  11 +
>  drivers/iio/proximity/Makefile    |   1 +
>  drivers/iio/proximity/gp2ap070s.c | 502 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 514 insertions(+)
> 
> diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
> index bb77fad2a1b3..3f30ebfc21bc 100644
> --- a/drivers/iio/proximity/Kconfig
> +++ b/drivers/iio/proximity/Kconfig
> @@ -41,6 +41,17 @@ config D3323AA
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called d3323aa.
>  
> +config GP2AP070S
> +	tristate "Sharp GP2AP070S proximity sensor"
> +	select REGMAP_I2C
> +	depends on I2C

A very small nit (and probably a personal opinion), but "depends on" should
go before "select"

> +	help
> +	  Say Y here to build a driver for the Sharp GP2AP070S proximity
> +	  sensor.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called gp2ap070s.
> +
>  config HX9023S
>  	tristate "TYHX HX9023S SAR sensor"
>  	select IIO_BUFFER
> diff --git a/drivers/iio/proximity/Makefile b/drivers/iio/proximity/Makefile
> index 4352833dd8a4..627ffb04acb2 100644
> --- a/drivers/iio/proximity/Makefile
> +++ b/drivers/iio/proximity/Makefile
> @@ -7,6 +7,7 @@
>  obj-$(CONFIG_AS3935)		+= as3935.o
>  obj-$(CONFIG_CROS_EC_MKBP_PROXIMITY) += cros_ec_mkbp_proximity.o
>  obj-$(CONFIG_D3323AA)		+= d3323aa.o
> +obj-$(CONFIG_GP2AP070S)		+= gp2ap070s.o
>  obj-$(CONFIG_HX9023S)		+= hx9023s.o
>  obj-$(CONFIG_IRSD200)		+= irsd200.o
>  obj-$(CONFIG_ISL29501)		+= isl29501.o
> diff --git a/drivers/iio/proximity/gp2ap070s.c b/drivers/iio/proximity/gp2ap070s.c
> new file mode 100644
> index 000000000000..9625f53d956e
> --- /dev/null
> +++ b/drivers/iio/proximity/gp2ap070s.c
> @@ -0,0 +1,502 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * IIO driver for Sharp GP2AP070S proximity sensor.
> + *
> + * Copyright (C) 2026 Kaustabh Chakraborty <kauschluss@disroot.org>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/iio/events.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/types.h>

Please add iio/* includes after the generic linux/* headers. Ensure
that there is a blank line between the two groups.

Additionally, you're also missing <asm/byteorder.h>, array_size.h, err.h,
types.h and delay.h.

> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>

Don't include this, this is included in i2c.h (see Uwe Kleine-Konig's
work).

> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +
> +#define GP2AP070S_REG_COM1		0x80
> +#define GP2AP070S_REG_COM2		0x81
> +#define GP2AP070S_REG_COM3		0x82
> +#define GP2AP070S_REG_COM4		0x83
> +#define GP2AP070S_REG_PS1		0x85
> +#define GP2AP070S_REG_PS2		0x86
> +#define GP2AP070S_REG_PS3		0x87
> +#define GP2AP070S_REG_PS_THD_LO_LE16	0x88
> +#define GP2AP070S_REG_PS_THD_HI_LE16	0x8a
> +#define GP2AP070S_REG_OS_D0_LE16	0x8c
> +#define GP2AP070S_REG_D0_LE16		0x90
> +
> +/* GP2AP070S_REG_COM1 */
> +#define GP2AP070S_VAL_COM1_WKUP		BIT(7)
> +#define GP2AP070S_VAL_COM1_EN		BIT(5)
> +
> +/* GP2AP070S_REG_COM3 */
> +#define GP2AP070S_VAL_COM3_INT_PULSE	BIT(1)
> +
> +/* GP2AP070S_REG_COM4 */
> +#define GP2AP070S_VAL_COM1_BLINK	GENMASK(2, 0)	/* LED Blink Interval */

You don't need a comment like this if you name your macro reasonably
(which you did IMO).
> +
> +#define GP2AP070S_VAL_COM1_BLINK_0ms	0
> +#define GP2AP070S_VAL_COM1_BLINK_2ms	1
> +#define GP2AP070S_VAL_COM1_BLINK_8ms	2
> +#define GP2AP070S_VAL_COM1_BLINK_33ms	3
> +#define GP2AP070S_VAL_COM1_BLINK_66ms	4
> +#define GP2AP070S_VAL_COM1_BLINK_131ms	5
> +#define GP2AP070S_VAL_COM1_BLINK_262ms	6
> +#define GP2AP070S_VAL_COM1_BLINK_524ms	7
> +
> +/* GP2AP070S_REG_PS1 */
> +#define GP2AP070S_VAL_PS1_RESOL		GENMASK(5, 4)	/* Resolution */
> +
> +#define GP2AP070S_VAL_PS1_RESOL_14ms	0
> +#define GP2AP070S_VAL_PS1_RESOL_12ms	1
> +#define GP2AP070S_VAL_PS1_RESOL_10ms	2
> +#define GP2AP070S_VAL_PS1_RESOL_8ms	3
> +
> +/* GP2AP070S_REG_PS2 */
> +#define GP2AP070S_VAL_PS2_IOUT		GENMASK(6, 4)	/* Current Output */
> +#define GP2AP070S_VAL_PS2_SUM32		BIT(2)
> +
> +#define GP2AP070S_VAL_PS2_IOUT_0mA	0
> +#define GP2AP070S_VAL_PS2_IOUT_24mA	1
> +#define GP2AP070S_VAL_PS2_IOUT_89mA	2
> +#define GP2AP070S_VAL_PS2_IOUT_130mA	3
> +#define GP2AP070S_VAL_PS2_IOUT_190mA	4
> +
> +/* GP2AP070S_REG_PS3 */
> +#define GP2AP070S_VAL_PS3_PRST		GENMASK(6, 4)	/* Repeating Measurements */
> +
> +struct gp2ap070s_drvdata {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct regulator_bulk_data *regulators;
> +	u32 near_level;

In the _write_event_value function, 
> +};
> +
> +static const struct regmap_config gp2ap070s_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static const char *const gp2ap070s_regulator_names[] = {
> +	"vdd",
> +	"vled",
> +};
> +
> +static ssize_t gp2ap070s_iio_read_near_level(struct iio_dev *indio_dev,
> +					     uintptr_t priv,
> +					     const struct iio_chan_spec *chan,
> +					     char *buf)
> +{
> +	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
> +
> +	return sprintf(buf, "%u\n", drvdata->near_level);

Use sysfs_emit() instead.
> +}
> +
> +static const struct iio_chan_spec_ext_info gp2ap070s_iio_chan_spec_ext_info[] = {
> +	{
> +		.name = "nearlevel",
> +		.shared = IIO_SEPARATE,
> +		.read = gp2ap070s_iio_read_near_level,
> +	},
> +	{ /* sentinel */ }

Remove the comment.

> +};
> +

...

> +static int gp2ap070s_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct iio_dev *indio_dev;
> +	struct gp2ap070s_drvdata *drvdata;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*drvdata));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	drvdata = iio_priv(indio_dev);
> +	i2c_set_clientdata(client, drvdata);
> +
> +	drvdata->dev = dev;
> +	drvdata->regmap = devm_regmap_init_i2c(client, &gp2ap070s_regmap_config);
> +	if (IS_ERR(drvdata->regmap))
> +		return dev_err_probe(dev, PTR_ERR(drvdata->regmap), "Failed to create regmap\n");
> +
> +	ret = devm_regulator_bulk_get_enable(dev,
> +					     ARRAY_SIZE(gp2ap070s_regulator_names),
> +					     gp2ap070s_regulator_names);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get and enable regulators");
> +
> +	usleep_range(10000, 11000);
> +
> +	indio_dev->name = "gp2ap070s";
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = gp2ap070s_iio_chan_spec;
> +	indio_dev->num_channels = ARRAY_SIZE(gp2ap070s_iio_chan_spec);
> +	indio_dev->info = &gp2ap070s_iio_info;
> +
> +	device_property_read_u32(&client->dev, "proximity-near-level",
> +				 &drvdata->near_level);
> +
> +	ret = gp2ap070s_probe_hw_register(drvdata);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					gp2ap070s_irq_handler, IRQF_ONESHOT,
> +					"gp2ap070s-irq", indio_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ");

Just return ret instead, dev_err_probe() is called automatically on failure.
> +
> +	return devm_iio_device_register(&client->dev, indio_dev);
> +}
> +
> +static const struct of_device_id gp2ap070s_of_device_id[] = {
> +	{ .compatible = "sharp,gp2ap070s" },
> +	{ /* sentinel */ }

Remove the comment.

> +};
> +MODULE_DEVICE_TABLE(of, gp2ap070s_of_device_id);
> +
> +static const struct i2c_device_id gp2ap070s_i2c_device_id[] = {
> +	{ .name = "gp2ap070s" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, gp2ap070s_i2c_device_id);
> +
> +static struct i2c_driver gp2ap070s_i2c_driver = {
> +	.driver = {
> +		.name = "gp2ap070s",
> +		.of_match_table = gp2ap070s_of_device_id,
> +	},
> +	.probe = gp2ap070s_probe,
> +	.id_table = gp2ap070s_i2c_device_id,
> +};
> +module_i2c_driver(gp2ap070s_i2c_driver);
> +
> +MODULE_AUTHOR("Kaustabh Chakraborty <kauschluss@disroot.org>");
> +MODULE_DESCRIPTION("Sharp GP2AP070S Proximity Sensor");
> +MODULE_LICENSE("GPL");
> 

-- 
Kind regards,
Joshua Crofts

