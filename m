Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16912C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 16:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STBnOZAR0wBLP6tOZnSZZoA9MhyYeSdzCAZH8Pk4Sdc=; b=QxgQWG65LZwaNLujLH/PcqdhC7
	lIyEHiu2bmjRGDInmTbi1dqoXoT9EW35S8/NmoGQPBryc8ZgCllEfncK4KlJe5soZ84P6Rks68bni
	V3wbfCFB4lTM9wA8lyPrs5Hgxxcy22mS5EcDrHFR9/ptaI4Iyk2+n32yF3lxOD1z3rXOuII54WoIB
	8otZzdeShC/zRXx0YHSEli26HmFRK2UP2RQFy+ifpOrzce0xnwq83Z/hzpRheTnd4cMWU7U5DzKea
	zSvelE+DRzCgIIbDUoOcPFvY2AeE8gDI0mY2t0tXol9gy9lYrReDgvgD/6FBE0021YxZ/oquWWcYG
	qRFvGI5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmErf-0000000BOfO-0ZUT;
	Sun, 23 Feb 2025 16:29:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmEq9-0000000BOT0-2yL5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 16:28:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2B7C6114A;
	Sun, 23 Feb 2025 16:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6302C4CEDD;
	Sun, 23 Feb 2025 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740328103;
	bh=XYxVScXcvZNqU4CkRaD4n7Asm7PHqZX1ixQAz9BuVtk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IxwrXdvty+zj5VnmPjlmOEzRlESkVUI32nFAxLY+JkLdEfOhmhsOE0PVn5QlGCimv
	 8y2P3OsiTTthdsqiWcuNyYxJXkK0RnDJiugxmsumbG+sBcB3WPR9MYl8bG/e8M0rem
	 ZPBqkop6A3kM0WprHAg09A0UtwZIp5uOKYMWMy6WqPS9dlVNc0KaEhKP0IqcaAnDhy
	 9/8H85cyT69nHGLtG9aHzXV8o8+Y0wPp7Vk+D4f8zR4Z77itRAhQwu29d1G7HbJCSS
	 QGHLqz5ldzWRHvuy7CiVt2P5pxVWAXQUsx3pFxwyhUUWGvpdciLD6ABY4T1J85S8Ob
	 dNRBqOHv5SNKA==
Date: Sun, 23 Feb 2025 16:28:07 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa
 <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/9] iio: adc: Support ROHM BD79124 ADC
Message-ID: <20250223162807.41960b6b@jic23-huawei>
In-Reply-To: <67b7713724d7591f6321a8f5dfef8cd711f38d34.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
	<67b7713724d7591f6321a8f5dfef8cd711f38d34.1739967040.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
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

On Wed, 19 Feb 2025 14:30:43 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> The ROHM BD79124 is a 12-bit, 8-channel, SAR ADC. The ADC supports
> an automatic measurement mode, with an alarm interrupt for out-of-window
> measurements. The window is configurable for each channel.
> 
> The I2C protocol for manual start of the measurement and data reading is
> somewhat peculiar. It requires the master to do clock stretching after
> sending the I2C slave-address until the slave has captured the data.
> Needless to say this is not well suopported by the I2C controllers.
> 
> Thus the driver does not support the BD79124's manual measurement mode
> but implements the measurements using automatic measurement mode relying
> on the BD79124's ability of storing latest measurements into register.
> 
> The driver does also support configuring the threshold events for
> detecting the out-of-window events.
> 
> The BD79124 keeps asserting IRQ for as long as the measured voltage is
> out of the configured window. Thus the driver masks the received event
> for a fixed duration (1 second) when an event is handled. This prevents
> the user-space from choking on the events
> 
> The ADC input pins can be also configured as general purpose outputs.
> Those pins which don't have corresponding ADC channel node in the
> device-tree will be controllable as GPO.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
Hi Matti,

Some fairly superficial review follows. I'm travelling for next few weeks
so not sure when I'll get time to take a more thorough look.

> diff --git a/drivers/iio/adc/rohm-bd79124.c b/drivers/iio/adc/rohm-bd79124.c
> new file mode 100644
> index 000000000000..5e23bc8d9ce2
> --- /dev/null
> +++ b/drivers/iio/adc/rohm-bd79124.c



> +
> +static int __bd79124_event_ratelimit(struct bd79124_data *data, int reg,
> +				     unsigned int limit)
> +{
> +	int ret;
> +
> +	if (limit > BD79124_HIGH_LIMIT_MAX)
> +		return -EINVAL;
> +
> +	ret = bd79124_write_int_to_reg(data, reg, limit);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * We use 1 sec 'grace period'. At the moment I see no reason to make
> +	 * this user configurable. We need an ABI for this if configuration is
> +	 * needed.
> +	 */
> +	schedule_delayed_work(&data->alm_enable_work,
> +			      msecs_to_jiffies(1000));
> +
> +	return 0;
> +}
> +
> +static int bd79124_event_ratelimit_hi(struct bd79124_data *data,
> +				      unsigned int channel)
> +{
> +	int reg, limit;
> +
> +	guard(mutex)(&data->mutex);
> +	data->alarm_suppressed[channel] |= BIT(IIO_EV_DIR_RISING);
> +
> +	reg = BD79124_GET_HIGH_LIMIT_REG(channel);
> +	limit = BD79124_HIGH_LIMIT_MAX;
> +
> +	return __bd79124_event_ratelimit(data, reg, limit);

As below.

> +}
> +
> +static int bd79124_event_ratelimit_lo(struct bd79124_data *data,
> +				      unsigned int channel)
> +{
> +	int reg, limit;
> +
> +	guard(mutex)(&data->mutex);
> +	data->alarm_suppressed[channel] |= BIT(IIO_EV_DIR_FALLING);
> +
> +	reg = BD79124_GET_LOW_LIMIT_REG(channel);
> +	limit = BD79124_LOW_LIMIT_MIN;
> +
> +	return __bd79124_event_ratelimit(data, reg, limit);

I'd put reg and limit inline.  Local variables don't add much as
their meaning is obvious anyway from what you put in them.

> +}
> +
> +static irqreturn_t bd79124_event_handler(int irq, void *priv)
> +{
> +	int ret, i_hi, i_lo, i;
> +	struct iio_dev *iio_dev = priv;
> +	struct bd79124_data *data = iio_priv(iio_dev);
> +
> +	/*
> +	 * Return IRQ_NONE if bailing-out without acking. This allows the IRQ
> +	 * subsystem to disable the offending IRQ line if we get a hardware
> +	 * problem. This behaviour has saved my poor bottom a few times in the
> +	 * past as, instead of getting unusably unresponsive, the system has
> +	 * spilled out the magic words "...nobody cared".
> +	 */
> +	ret = regmap_read(data->map, BD79124_REG_EVENT_FLAG_HI, &i_hi);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	ret = regmap_read(data->map, BD79124_REG_EVENT_FLAG_LO, &i_lo);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	if (!i_lo && !i_hi)
> +		return IRQ_NONE;
> +
> +	for (i = 0; i < BD79124_MAX_NUM_CHANNELS; i++) {
> +		u64 ecode;
> +
> +		if (BIT(i) & i_hi) {
> +			ecode = IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE, i,
> +					IIO_EV_TYPE_THRESH, IIO_EV_DIR_RISING);
> +
> +			iio_push_event(iio_dev, ecode, data->timestamp);
> +			/*
> +			 * The BD79124 keeps the IRQ asserted for as long as
> +			 * the voltage exceeds the threshold. It causes the IRQ
> +			 * to keep firing.
> +			 *
> +			 * Disable the event for the channel and schedule the
> +			 * re-enabling the event later to prevent storm of
> +			 * events.
> +			 */
> +			ret = bd79124_event_ratelimit_hi(data, i);
> +			if (ret)
> +				return IRQ_NONE;
> +		}
> +		if (BIT(i) & i_lo) {
> +			ecode = IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE, i,
> +					IIO_EV_TYPE_THRESH, IIO_EV_DIR_FALLING);
> +
> +			iio_push_event(iio_dev, ecode, data->timestamp);
> +			ret = bd79124_event_ratelimit_lo(data, i);
> +			if (ret)
> +				return IRQ_NONE;
> +		}
> +	}
> +
> +	ret = regmap_write(data->map, BD79124_REG_EVENT_FLAG_HI, i_hi);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	ret = regmap_write(data->map, BD79124_REG_EVENT_FLAG_LO, i_lo);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t bd79124_irq_handler(int irq, void *priv)
> +{
> +	struct iio_dev *iio_dev = priv;
> +	struct bd79124_data *data = iio_priv(iio_dev);
> +
> +	data->timestamp = iio_get_time_ns(iio_dev);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +struct bd79124_reg_init {
> +	int reg;
> +	int val;
> +};
> +
> +static int bd79124_chan_init(struct bd79124_data *data, int channel)
> +{
> +	struct bd79124_reg_init inits[] = {
> +		{ .reg = BD79124_GET_HIGH_LIMIT_REG(channel), .val = 4095 },
> +		{ .reg = BD79124_GET_LOW_LIMIT_REG(channel), .val = 0 },
> +	};
> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(inits); i++) {
> +		ret = regmap_write(data->map, inits[i].reg, inits[i].val);
> +		if (ret)
> +			return ret;
> +	}

This is shorter as straight line code rather than a loop. I'd unwind
it.  Fine to bring in a loop 'setter' like this once the benefit is
significant.

> +
> +	return 0;
> +}
> +
> +static bool bd79124_is_in_array(int *arr, int num_items, int val)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_items; i++)
> +		if (arr[i] == val)
> +			return true;
> +
> +	return false;
> +}
> +
> +static int bd79124_mux_init(struct bd79124_data *data)
> +{
> +	int adc_chans[BD79124_MAX_NUM_CHANNELS];
> +	int num_adc, chan, regval = 0;
> +
> +	num_adc = iio_adc_device_channels_by_property(data->dev, &adc_chans[0],
> +						      BD79124_MAX_NUM_CHANNELS,
> +						      &expected_props);
> +	if (num_adc < 0)
> +		return num_adc;
> +
> +	/*
> +	 * Set a mux register bit for each pin which is free to be used as
> +	 * a GPO.
For this I would search the simpler iio_chan_spec array rather than passing
properties again.  Just look for gaps.  Or do it in the top level probe()
function and build a bitmap of which channels are ADC ones from the iio_chan_spec
array and pass that down here.

> +	 */
> +	for (chan = 0; chan < BD79124_MAX_NUM_CHANNELS; chan++)
> +		if (!bd79124_is_in_array(&adc_chans[0], num_adc, chan))
> +			regval |= BIT(chan);
> +
> +	return regmap_write(data->map, BD79124_REG_PINCFG, regval);
> +}
> +
> +static int bd79124_hw_init(struct bd79124_data *data)
> +{
> +	int ret, regval, i;
> +
> +	ret = bd79124_mux_init(data);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < BD79124_MAX_NUM_CHANNELS; i++) {
> +		ret = bd79124_chan_init(data, i);
> +		if (ret)
> +			return ret;
> +		data->alarm_r_limit[i] = 4095;
> +	}
> +	/* Stop auto sequencer */
> +	ret = regmap_clear_bits(data->map, BD79124_REG_SEQUENCE_CFG,
> +				BD79124_MASK_SEQ_START);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable writing the measured values to the regsters */
> +	ret = regmap_set_bits(data->map, BD79124_REG_GEN_CFG,
> +			      BD79124_MASK_STATS_EN);
> +	if (ret)
> +		return ret;
> +
> +	/* Set no channels to be auto-measured */
> +	ret = regmap_write(data->map, BD79124_REG_AUTO_CHANNELS, 0x0);
> +	if (ret)
> +		return ret;
> +
> +	/* Set no channels to be manually measured */
> +	ret = regmap_write(data->map, BD79124_REG_MANUAL_CHANNELS, 0x0);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the measurement interval to 0.75 mS */
> +	regval = FIELD_PREP(BD79124_MASK_AUTO_INTERVAL, BD79124_INTERVAL_075);
> +	ret = regmap_update_bits(data->map, BD79124_REG_OPMODE_CFG,
> +			BD79124_MASK_AUTO_INTERVAL, regval);

Where it doesn't make any other difference, align after (

If you are going shorter, single tab only.


> +	if (ret)
> +		return ret;
> +
> +	/* Sequencer mode to auto */
> +	ret = regmap_set_bits(data->map, BD79124_REG_SEQUENCE_CFG,
> +			      BD79124_MASK_SEQ_SEQ);
> +	if (ret)
> +		return ret;
> +
> +	/* Don't start the measurement */
> +	regval = FIELD_PREP(BD79124_MASK_CONV_MODE, BD79124_CONV_MODE_MANSEQ);
What is this for?
> +
> +	return regmap_update_bits(data->map, BD79124_REG_OPMODE_CFG,
> +			BD79124_MASK_CONV_MODE, BD79124_CONV_MODE_MANSEQ);
> +
> +}
> +
> +static int bd79124_probe(struct i2c_client *i2c)
> +{
> +	struct bd79124_data *data;
> +	struct iio_dev *iio_dev;
> +	const struct iio_chan_spec *template;
> +	struct iio_chan_spec *cs;
> +	struct device *dev = &i2c->dev;
> +	int ret;
> +
> +	iio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> +	if (!iio_dev)
> +		return -ENOMEM;
> +
> +	data = iio_priv(iio_dev);
> +	data->dev = dev;
> +	data->map = devm_regmap_init_i2c(i2c, &bd79124_regmap);
> +	if (IS_ERR(data->map))
> +		return dev_err_probe(dev, PTR_ERR(data->map),
> +				     "Failed to initialize Regmap\n");
> +
> +	ret = devm_regulator_get_enable_read_voltage(dev, "vdd");
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get the Vdd\n");
> +
> +	data->vmax = ret;
> +
> +	ret = devm_regulator_get_enable(dev, "iovdd");
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to enable I/O voltage\n");
> +
> +	ret = devm_delayed_work_autocancel(dev, &data->alm_enable_work,
> +					   bd79124_alm_enable_worker);
> +	if (ret)
> +		return ret;
> +
> +	if (i2c->irq) {
> +		template = &bd79124_chan_template;
> +	} else {
> +		template = &bd79124_chan_template_noirq;
> +		dev_dbg(dev, "No IRQ found, events disabled\n");
> +	}
> +	ret = devm_iio_adc_device_alloc_chaninfo(dev, template, &cs,
> +						 &expected_props);
> +	if (ret < 0)
> +		return ret;
> +
> +	iio_dev->channels = cs;
> +	iio_dev->num_channels = ret;
> +	iio_dev->info = &bd79124_info;
> +	iio_dev->name = "bd79124";
> +	iio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	data->gc = bd79124gpo_chip;
> +	data->gc.parent = dev;
> +
> +	mutex_init(&data->mutex);

Whilst it doesn't bring huge advantage, now we have devm_mutex_init()
it seems reasonable to use it and maybe catch a use after free for the lock.

> +
> +	ret = bd79124_hw_init(data);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_gpiochip_add_data(data->dev, &data->gc, data);
> +	if (ret)
> +		return dev_err_probe(data->dev, ret, "gpio init Failed\n");
> +
> +	if (i2c->irq > 0) {
> +		ret = devm_request_threaded_irq(data->dev, i2c->irq,
> +					bd79124_irq_handler,
> +					&bd79124_event_handler, IRQF_ONESHOT,
> +					"adc-thresh-alert", iio_dev);
> +		if (ret)
> +			return dev_err_probe(data->dev, ret,
> +					     "Failed to register IRQ\n");
> +	}
> +
> +	return devm_iio_device_register(data->dev, iio_dev);
> +}


