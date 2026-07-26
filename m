Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFD6C53200
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 19:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3f9rW6ecKd7Ic3gfdbZlKXMvf2ZuM/6RpCc9u5zk40=; b=0c2Gdk6YNX5Wk4b7B4lD2VtdU/
	n2JVCn1iWdbh2rh7VzmmTWyWkCXCnmuRIpyFVwNWlzBJqpW4XH7l3OXwJ0P6KD3JKNJ6/MBPkGmt2
	+vixi9YLs43k7YcfCocjbINDCQJG1p+m+PfwleyD9OYcg/GJBjP4slBZmvLT4KQjrXnWDbXf8BtAC
	j2Kw8ifLuoCMmASZLAncJaAw1IFDNMXDIZMQ6GVfp86CP6rvvjuSK02P25qKWki317wgyIOf6vqYN
	A7P+5MlW5t3HL0OMOcCaZdmOahmfC/DjXPKK0NNHfR85NF6ZUP/XfeyK49TZJWU3VJk6WynRuvYBX
	0WCg9DHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo45K-00000001VuA-44Gp;
	Sun, 26 Jul 2026 19:00:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo45K-00000001Vtn-1JLM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 19:00:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A36F641472;
	Sun, 26 Jul 2026 19:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7281F000E9;
	Sun, 26 Jul 2026 19:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785092425;
	bh=X3f9rW6ecKd7Ic3gfdbZlKXMvf2ZuM/6RpCc9u5zk40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CSDrblsN/1QQQe61BhPiGQ1CPKQUnex8Z1+On7HMnCHcBOJVbfvhTsnEErxoFtr9O
	 2pu3vxDZkpItELmLvqPEbncPAHHWqFhkmUjMIyznJB6n6XsQACQQIY7QoQy/IHI65/
	 1edd6BVNbwcH2h2AYem70gt4DTezyrAinzuL+/pkF6EKts3wldQ4M+9lWllqsRwM/3
	 qBmmZgf8+ntr8xI832Zxe6/Ez3uw6iDm8dl7q95g94cB1u8lagdxjcgQ+gqOoktpTE
	 nq7O+hMyy+yvJZc9/PM37HwqTzD8oCRA8No4acppvg24+kUwNievrzcdKW9GS+oLsM
	 oqGjFEmZWcPEw==
Date: Sun, 26 Jul 2026 20:00:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
Message-ID: <20260726200019.2011049e@jic23-huawei>
In-Reply-To: <20260723-gp2ap070s-v1-2-b8ca3a4c10dd@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
	<20260723-gp2ap070s-v1-2-b8ca3a4c10dd@disroot.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Hi Kaustabh

I've tried to avoid too much duplication of the things Joshua
already called out (and I didn't even look at sashiko yet for
this one!)

Various comments inline.  The use of regmap is unusual so
I'd expect to see a bit more information on why that makes sense
(or use of regmap_bulk_read() + regcache)

Thanks,

Jonathan


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

You mention basing this on the vendor driver to some extent at least.
Perhaps a reference to that here would be good to keep clear attribution?
If it's not enough for an extra copyright notice, it probably is enough
as a useful source of info like the link you have above.

> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/iio/events.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/types.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
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
Why the VAL bit of these defines? They are field masks rather
than values of anything.  Normally we just use the absense of
REG to indicate what are fields.

Up to you but a clean way to associate registers and the fields in them
without needing lots of comments is to use a bit of extra white space.

e.g.
#define GP2AP070S_REG_COM1		0x80
#define   GP2AP070S_COM1_WKUP		BIT(7)
#define   GP2AP070S_COM1_EN		BIT(5)
#define GP2AP070S_REG_COM2		0x81
#define GP2AP070S_REG_COM3		0x82
#define   GP2AP070S_COM3_INT_PULSE	BIT(1)
#define GP2AP070S_REG_COM4		0x83
#define   GP2AP070S_COM4_BLINK		GENMASK(2, 0)	/* LED Blink Interval */
#define     GP2AP070S_COM4_BLINK_0ms	0
#define     GP2AP070S_COM4_BLINK_2ms	1
#define     GP2AP070S_COM4_BLINK_8ms	2

> +
> +/* GP2AP070S_REG_COM3 */
> +#define GP2AP070S_VAL_COM3_INT_PULSE	BIT(1)
> +
> +/* GP2AP070S_REG_COM4 */
> +#define GP2AP070S_VAL_COM1_BLINK	GENMASK(2, 0)	/* LED Blink Interval */
Why is something in COM4 called COM1?

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

As below, can use regmap_get_device() and not carry a duplicate copy of dev around.

> +	struct regmap *regmap;
> +	struct regulator_bulk_data *regulators;

Is this used?

> +	u32 near_level;
> +};
> +
> +static const struct regmap_config gp2ap070s_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,

Given there seems to be quite a bit of checking what I assume are non
volatile registers, enable regcache and provide all the callbacks
so it knows what is volatile and what isn't.  You should reduce the bus
traffic a fair bit.

> +};


> +
> +static int gp2ap070s_read_event_config(struct iio_dev *indio_dev,
> +				       const struct iio_chan_spec *chan,
> +				       enum iio_event_type type,
> +				       enum iio_event_direction dir)
> +{
> +	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
> +	unsigned int value;
> +	int ret;
> +
> +	if (type != IIO_EV_TYPE_THRESH)
> +		return -EINVAL;
> +
> +	switch (dir) {
> +	case IIO_EV_DIR_EITHER:
> +		ret = regmap_read(drvdata->regmap, GP2AP070S_REG_COM3, &value);
> +		if (ret)
> +			return ret;
> +
> +		return !!(value & GP2AP070S_VAL_COM3_INT_PULSE);

For these single bit gets I'd prefer a FIELD_GET() as that !! is a bit ugly to read.
If not use a ternary to set to 1 or 0.

That !! thing used to be common but Linus amongst others have expressed
it is not great to read.

> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int gp2ap070s_write_event_config(struct iio_dev *indio_dev,
> +					const struct iio_chan_spec *chan,
> +					enum iio_event_type type,
> +					enum iio_event_direction dir,
> +					bool state)
> +{
> +	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
> +	int ret;
> +
> +	if (type != IIO_EV_TYPE_THRESH)
> +		return -EINVAL;
> +
> +	switch (dir) {
> +	case IIO_EV_DIR_EITHER:
> +		if (state)
> +			ret = regmap_set_bits(drvdata->regmap,
> +					      GP2AP070S_REG_COM3,
> +					      GP2AP070S_VAL_COM3_INT_PULSE);
			reutrn regmap_set_bits()
> +		else
> +			ret = regmap_clear_bits(drvdata->regmap,
> +						GP2AP070S_REG_COM3,
> +						GP2AP070S_VAL_COM3_INT_PULSE);
			returnn regmap_clear_bits()

and you can drop the check below, the break and the final return 0;

> +		if (ret)
> +			return ret;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct iio_info gp2ap070s_iio_info = {
> +	.read_raw = gp2ap070s_iio_read_raw,
> +	.read_event_value = gp2ap070s_iio_read_event_value,
> +	.write_event_value = gp2ap070s_iio_write_event_value,
> +	.read_event_config = gp2ap070s_read_event_config,
> +	.write_event_config = gp2ap070s_write_event_config,
> +};
> +
> +static irqreturn_t gp2ap070s_irq_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev = private;
> +	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
> +	struct device *dev = drvdata->dev;
> +	u16 threshold_lo, threshold_hi, distance;
> +	__le16 value;
> +	int ret;
> +
> +	ret = regmap_raw_read(drvdata->regmap, GP2AP070S_REG_PS_THD_LO_LE16,

Why is raw_read needed rather than a normal bulk read?
For these I'd assume they aren't volatile and we want caching to cut down
on bus transfers?  If there is a reason to do it this way add a comment.

> +			      &value, sizeof(value));
> +	if (ret) {
> +		dev_err(dev, "Failed to read low threshold value (%d)\n", ret);
> +		return IRQ_HANDLED;
> +	}
> +
> +	threshold_lo = __le16_to_cpu(value);

le16_to_cpu()

> +
> +	ret = regmap_raw_read(drvdata->regmap, GP2AP070S_REG_PS_THD_HI_LE16,
> +			      &value, sizeof(value));
> +	if (ret) {
> +		dev_err(dev, "Failed to read high threshold value (%d)\n", ret);
> +		return IRQ_HANDLED;
> +	}
> +
> +	threshold_hi = __le16_to_cpu(value);
> +
> +	ret = regmap_raw_read(drvdata->regmap, GP2AP070S_REG_D0_LE16, &value,
> +			      sizeof(value));
> +	if (ret) {
> +		dev_err(dev, "Failed to read proximity distance (%d)\n", ret);
> +		return IRQ_HANDLED;
> +	}
> +
> +	distance = __le16_to_cpu(value);
> +
> +	if (distance >= threshold_hi) {

This very racy given I'd assume distance can change between interrupt and the
event.  A common solution to this is to make it a userspace problem and
poke out an IIO_EV_DIR_EITHER event.

> +		iio_push_event(indio_dev,
> +			       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
> +						    IIO_EV_TYPE_THRESH,
> +						    IIO_EV_DIR_RISING),
> +			       iio_get_time_ns(indio_dev));

Grab timestamp as early as you can, as nearer to the interrupt.  Typically
top of the interrupt handler.

> +	} else if (distance <= threshold_lo) {
> +		iio_push_event(indio_dev,
> +			       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
> +						    IIO_EV_TYPE_THRESH,
> +						    IIO_EV_DIR_FALLING),
> +			       iio_get_time_ns(indio_dev));
> +	} else {
> +		/*
> +		 * If none match, then it's stuck in the threshold band gap.
> +		 * The hardware generally does not issue interrupts here.

This needs an explanation of why there isn't a race. Is the value latched on
interrupt until we read it?

> +		 */
> +		WARN_ONCE(true, "spurious interrupt issued in proximity threshold gap\n");
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int gp2ap070s_probe_hw_register(struct gp2ap070s_drvdata *drvdata)
> +{
> +	struct device *dev = drvdata->dev;
> +	int ret;
> +
> +	ret = regmap_clear_bits(drvdata->regmap, GP2AP070S_REG_COM1, ~0);

write a 0 rather than clear bits when you are clearing them all.

> +	if (ret)
> +		return dev_err_probe(drvdata->dev, ret, "Failed to reset sensor\n");
> +
> +	ret = regmap_clear_bits(drvdata->regmap, GP2AP070S_REG_COM2, ~0);
> +	if (ret)
> +		return dev_err_probe(drvdata->dev, ret, "Failed to unmask interrupts\n");
> +
> +	ret = regmap_set_bits(drvdata->regmap, GP2AP070S_REG_COM3,
> +			      GP2AP070S_VAL_COM3_INT_PULSE);
> +	if (ret)
> +		return dev_err_probe(drvdata->dev, ret, "Failed to enable interrupt\n");
> +
> +	ret = regmap_write_bits(drvdata->regmap, GP2AP070S_REG_COM4,
> +				GP2AP070S_VAL_COM1_BLINK,
> +				FIELD_PREP_CONST(GP2AP070S_VAL_COM1_BLINK,
> +						 GP2AP070S_VAL_COM1_BLINK_33ms));
> +	if (ret)
> +		return dev_err_probe(drvdata->dev, ret, "Failed to set LED blink timing\n");
> +
> +	ret = regmap_write_bits(drvdata->regmap, GP2AP070S_REG_PS1,
> +				GP2AP070S_VAL_PS1_RESOL,
> +				FIELD_PREP_CONST(GP2AP070S_VAL_PS1_RESOL,
> +						 GP2AP070S_VAL_PS1_RESOL_10ms));
> +	if (ret)
> +		return dev_err_probe(drvdata->dev, ret, "Failed to set resolution\n");
> +
> +	ret = regmap_write_bits(drvdata->regmap, GP2AP070S_REG_PS2,
> +				GP2AP070S_VAL_PS2_IOUT | GP2AP070S_VAL_PS2_SUM32,
> +				FIELD_PREP_CONST(GP2AP070S_VAL_PS2_IOUT,
> +						 GP2AP070S_VAL_PS2_IOUT_89mA) |
> +				GP2AP070S_VAL_PS2_SUM32);
> +	if (ret)
> +		return dev_err_probe(drvdata->dev, ret, "Failed to set current output\n");
> +
> +	ret = regmap_write_bits(drvdata->regmap, GP2AP070S_REG_PS3,
> +				GP2AP070S_VAL_PS3_PRST,
> +				FIELD_PREP_CONST(GP2AP070S_VAL_PS3_PRST, 3));
> +	if (ret)
> +		return dev_err_probe(drvdata->dev, ret, "Failed to set measurement repetitions\n");
> +
> +	ret = regmap_set_bits(drvdata->regmap, GP2AP070S_REG_COM1,
> +			      GP2AP070S_VAL_COM1_WKUP | GP2AP070S_VAL_COM1_EN);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable sensor\n");
> +
> +	return 0;
> +}
> +
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

Is this used?  It rarely is when a driver doesn't yet have power management
(which is fine until someone needs it!)

> +
> +	drvdata->dev = dev;

It is easy to get dev from the regmap so you can just do that and not carry an
extra copy around.  regmap_get_device().



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

fsleep() applies standard level of slack rather than us having to think
about what is appropriate.

> +
> +	indio_dev->name = "gp2ap070s";
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = gp2ap070s_iio_chan_spec;
> +	indio_dev->num_channels = ARRAY_SIZE(gp2ap070s_iio_chan_spec);
> +	indio_dev->info = &gp2ap070s_iio_info;
> +
> +	device_property_read_u32(&client->dev, "proximity-near-level",

Use dev for all client->dev given you defined it.

> +				 &drvdata->near_level);
For optional properties like this we are generally hardening against
unexpected errors in a way that we didn't use to.

You can use a local for the string if you prefer or just do
	if (device_property_present(dev, "proximity-near-level")) {
		ret = device_property_read_u32(dev, "proximity-near-level",
					       &drvdata->near_level);
		if (ret)
			return dev_err_probe();
	}

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
> +
> +	return devm_iio_device_register(&client->dev, indio_dev);
> +}


