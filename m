Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CEFC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2/AhRT8DSfW/iFYbzjPys2wAflxjAkPB3hNCVPgcpU=; b=qP6muULySQB9nh+HUYNfviphir
	+vTRRCmEqCUBlvM2rwNtO0XOwku2JaChpucp04yTpvgvgDdN69Y+qMBwk28NffGw8l9QYHqQDzo4h
	mBshf1cxaebHAFOdmbLSAECU1nyPi2sh0Ghg9g9DIRxIrOkChRtWVapRYKUgO1BPM679JISYRtFYl
	aQLVdxVLMi/C378kOtuU8OTHbHODyaTxvin/IEVHinGispi2VUPfyptGWNoTOODIoK/KR8yKyBGkf
	YPRiS6VxIp0UiCrxEoxU3dDyYl/BhGprtt8jTgwmSHb5c7W2ntiWTjeGS9XtAVaK5Ux0LrohJ9IKT
	6986YNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRl6-0000000CQhV-3HWP;
	Mon, 24 Feb 2025 06:16:04 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRjZ-0000000CQT9-1lL9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 06:14:30 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5461cb12e39so3825346e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 22:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740377667; x=1740982467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D2/AhRT8DSfW/iFYbzjPys2wAflxjAkPB3hNCVPgcpU=;
        b=Htna9sExcypnlX0pxQWE2CBF2wShlqrzmmnXz03LBGYuI/nAwskRQoD9H2U5PZ1Wi6
         g9OkS8kTMsxvkSFOkrJg/6B5hScGz13xAYUYZqHbYAzE2kOX1SjLO1rnj2yl1ZP9f5gh
         5s7AZtxVcUE1cZ4fww95y/MPfflAdqAxBGUJDFCAA8SvRuJtKarA1DmJ97qNzZlFoQmB
         TSzwPaC5pN140Gne15HEJLNDKsX9CZIN7/tZs8lu6CmbtlxfPYq1TM6wX0y+BVaHwjAu
         1JQTQgWUv+F5S1VD7dvcYQkP4quROA/C85OVKNjLcJh03s8WWj2hVwJDtRCDE1mL0FCM
         MP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740377667; x=1740982467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2/AhRT8DSfW/iFYbzjPys2wAflxjAkPB3hNCVPgcpU=;
        b=f7Rilo0ukj0lJdgxO+uY5h1gN3JavUgNfpNS9ZROBb9oexBuatKrKb4pLrZvLNJTK2
         3mrhTWP29RYHWesBDnlSsSK6hjxEwLPEkLrWv3//Lt8tKN4eISHZ150vQyRs+RVS1eIU
         NKrhWYK+Ve7+Zu264W7oTVFhJbB9hNUU39u3bWW4H9mZsiIMvkQgnMsJmmwy9pAc5DCZ
         cVjh5ZrCexs3i1cT0pBw1SYN9Xg6iz2oXAf0jU9AWZeoUAOxDZO6775woX00G2z513uD
         d3csEtgKKXSB++fmJX3gfpEDPcA5TO8pKOdUZh99iaIobZtdHQOMYJ82fVav4PDwHzi5
         46qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYY/KW7hZnNdizqFcF95bta8dkNz9qgsWF04bUGajWDbEKlL/D1rc+KtZ5MgTTOE3zdkoAKMWkZAac2yMNLPSw@lists.infradead.org
X-Gm-Message-State: AOJu0YxMCAYI3W2KDi2QmwpWkSvyT+GMz4Mpj8PwpqyAsYpAQKSnhgMX
	cnljuq2f4s5en0BtYHb3z7r7tEES7FMiAO6FQPGRNpPprMo0SMN0
X-Gm-Gg: ASbGncvdul/EnW8pxTGqBwYaJW7/rAfAdm2Y5UTBq8WtpJnhiHvgIxSU62y4X9zdg8O
	4pTPkWjDdTcapzjoe0WK9KEODFhLM/Y0VtEp8E5oe44oxNd3rUCrTFhPhIL5ZCrEa66pik66Tbt
	1H978ngPCz3oVtOmQAm4yEOt7S2wiZXm249GJV4TcdD73cnEttGQYNA2C3s2C1Zk4CuPRjOWU/P
	DWT5gfhZ1iheaubXT74XI0Ed6T8xNqmgywiFbh6tLTrkfw+3C5ESKu+Nc/Gawvdkuew7I66IlEh
	1Fr1bCGYnrKk8jMKzEQQT6hnOgADWDT9o/lJ9s6mRc9zrCpQcJZl1Mp00lnCMAcaaQ1CIjyyViK
	8XqqCZr4=
X-Google-Smtp-Source: AGHT+IE1bH5ugP5EuU0A9TbSNJydsntvckZB+spkMOEnBoSmkrWPCYe7ceeqNv2veChVyIT0h6M1mw==
X-Received: by 2002:a05:6512:3b06:b0:545:2e85:c152 with SMTP id 2adb3069b0e04-54838f4c9d8mr5459799e87.34.1740377666817;
        Sun, 23 Feb 2025 22:14:26 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452e4b08dasm2904602e87.87.2025.02.23.22.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 22:14:26 -0800 (PST)
Message-ID: <125ab96e-1e92-4022-95fe-324cd47ce1d9@gmail.com>
Date: Mon, 24 Feb 2025 08:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] iio: adc: Support ROHM BD79124 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Linus Walleij <linus.walleij@linaro.org>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <67b7713724d7591f6321a8f5dfef8cd711f38d34.1739967040.git.mazziesaccount@gmail.com>
 <20250223162807.41960b6b@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250223162807.41960b6b@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_221429_577765_11307206 
X-CRM114-Status: GOOD (  44.78  )
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

On 23/02/2025 18:28, Jonathan Cameron wrote:
> On Wed, 19 Feb 2025 14:30:43 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The ROHM BD79124 is a 12-bit, 8-channel, SAR ADC. The ADC supports
>> an automatic measurement mode, with an alarm interrupt for out-of-window
>> measurements. The window is configurable for each channel.
>>
>> The I2C protocol for manual start of the measurement and data reading is
>> somewhat peculiar. It requires the master to do clock stretching after
>> sending the I2C slave-address until the slave has captured the data.
>> Needless to say this is not well suopported by the I2C controllers.
>>
>> Thus the driver does not support the BD79124's manual measurement mode
>> but implements the measurements using automatic measurement mode relying
>> on the BD79124's ability of storing latest measurements into register.
>>
>> The driver does also support configuring the threshold events for
>> detecting the out-of-window events.
>>
>> The BD79124 keeps asserting IRQ for as long as the measured voltage is
>> out of the configured window. Thus the driver masks the received event
>> for a fixed duration (1 second) when an event is handled. This prevents
>> the user-space from choking on the events
>>
>> The ADC input pins can be also configured as general purpose outputs.
>> Those pins which don't have corresponding ADC channel node in the
>> device-tree will be controllable as GPO.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
> Hi Matti,
> 
> Some fairly superficial review follows. I'm travelling for next few weeks
> so not sure when I'll get time to take a more thorough look.

Yeah, unfortunately people are allowed to have other life beyond the 
ROHM drivers :D
Enjoy your journey(s) ;)

...

>> +
>> +static int bd79124_event_ratelimit_hi(struct bd79124_data *data,
>> +				      unsigned int channel)
>> +{
>> +	int reg, limit;
>> +
>> +	guard(mutex)(&data->mutex);
>> +	data->alarm_suppressed[channel] |= BIT(IIO_EV_DIR_RISING);
>> +
>> +	reg = BD79124_GET_HIGH_LIMIT_REG(channel);
>> +	limit = BD79124_HIGH_LIMIT_MAX;
>> +
>> +	return __bd79124_event_ratelimit(data, reg, limit);
> 
> As below.
> 
>> +}
>> +
>> +static int bd79124_event_ratelimit_lo(struct bd79124_data *data,
>> +				      unsigned int channel)
>> +{
>> +	int reg, limit;
>> +
>> +	guard(mutex)(&data->mutex);
>> +	data->alarm_suppressed[channel] |= BIT(IIO_EV_DIR_FALLING);
>> +
>> +	reg = BD79124_GET_LOW_LIMIT_REG(channel);
>> +	limit = BD79124_LOW_LIMIT_MIN;
>> +
>> +	return __bd79124_event_ratelimit(data, reg, limit);
> 
> I'd put reg and limit inline.  Local variables don't add much as
> their meaning is obvious anyway from what you put in them.

I can do this. The main purpose of those variables was to keep the 
function calls easier to read (on my limited monitor).

>> +}
>> +

...

>> +
>> +static int bd79124_chan_init(struct bd79124_data *data, int channel)
>> +{
>> +	struct bd79124_reg_init inits[] = {
>> +		{ .reg = BD79124_GET_HIGH_LIMIT_REG(channel), .val = 4095 },
>> +		{ .reg = BD79124_GET_LOW_LIMIT_REG(channel), .val = 0 },
>> +	};
>> +	int i, ret;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(inits); i++) {
>> +		ret = regmap_write(data->map, inits[i].reg, inits[i].val);
>> +		if (ret)
>> +			return ret;
>> +	}
> 
> This is shorter as straight line code rather than a loop. I'd unwind
> it.  Fine to bring in a loop 'setter' like this once the benefit is
> significant.

I suppose you're right. I think loops like this born out of a habit :)

>> +
>> +	return 0;
>> +}
>> +
>> +static bool bd79124_is_in_array(int *arr, int num_items, int val)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < num_items; i++)
>> +		if (arr[i] == val)
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +static int bd79124_mux_init(struct bd79124_data *data)
>> +{
>> +	int adc_chans[BD79124_MAX_NUM_CHANNELS];
>> +	int num_adc, chan, regval = 0;
>> +
>> +	num_adc = iio_adc_device_channels_by_property(data->dev, &adc_chans[0],
>> +						      BD79124_MAX_NUM_CHANNELS,
>> +						      &expected_props);
>> +	if (num_adc < 0)
>> +		return num_adc;
>> +
>> +	/*
>> +	 * Set a mux register bit for each pin which is free to be used as
>> +	 * a GPO.
> For this I would search the simpler iio_chan_spec array rather than passing
> properties again.

I kind of agree. I did it like this because I thought that the 
'iio_adc_device_channels_by_property()' might be useful for other 
callers as well. And, if we had 'iio_adc_device_channels_by_property()' 
- then the code in this driver file becomes simple (as seen here). After 
I looked at the couple of other drivers I didn't easily spot any other 
driver needing the 'iio_adc_device_channels_by_property()' - so I 
suppose it is simpler to drop it and loop through the 'iio_chan_spec' as 
you suggest.

  Just look for gaps.  Or do it in the top level probe()
> function and build a bitmap of which channels are ADC ones from the iio_chan_spec
> array and pass that down here.
> 
>> +	 */
>> +	for (chan = 0; chan < BD79124_MAX_NUM_CHANNELS; chan++)
>> +		if (!bd79124_is_in_array(&adc_chans[0], num_adc, chan))
>> +			regval |= BIT(chan);
>> +
>> +	return regmap_write(data->map, BD79124_REG_PINCFG, regval);
>> +}
>> +
>> +static int bd79124_hw_init(struct bd79124_data *data)
>> +{
>> +	int ret, regval, i;
>> +
>> +	ret = bd79124_mux_init(data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < BD79124_MAX_NUM_CHANNELS; i++) {
>> +		ret = bd79124_chan_init(data, i);
>> +		if (ret)
>> +			return ret;
>> +		data->alarm_r_limit[i] = 4095;
>> +	}
>> +	/* Stop auto sequencer */
>> +	ret = regmap_clear_bits(data->map, BD79124_REG_SEQUENCE_CFG,
>> +				BD79124_MASK_SEQ_START);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Enable writing the measured values to the regsters */
>> +	ret = regmap_set_bits(data->map, BD79124_REG_GEN_CFG,
>> +			      BD79124_MASK_STATS_EN);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Set no channels to be auto-measured */
>> +	ret = regmap_write(data->map, BD79124_REG_AUTO_CHANNELS, 0x0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Set no channels to be manually measured */
>> +	ret = regmap_write(data->map, BD79124_REG_MANUAL_CHANNELS, 0x0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Set the measurement interval to 0.75 mS */
>> +	regval = FIELD_PREP(BD79124_MASK_AUTO_INTERVAL, BD79124_INTERVAL_075);
>> +	ret = regmap_update_bits(data->map, BD79124_REG_OPMODE_CFG,
>> +			BD79124_MASK_AUTO_INTERVAL, regval);
> 
> Where it doesn't make any other difference, align after (
> 
> If you are going shorter, single tab only.

Single tab only? You mean like:

ret = regmap_update_bits(data->map, BD79124_REG_OPMODE_CFG,
	BD79124_MASK_AUTO_INTERVAL, regval);

Do you prefer that even if the variable holding the return value was 
longer than 8 chars? To me it looks odd if arguments on the next line 
begin earlier than the function on previous line:

longvariable = regmap_update_bits(data->map, BD79124_REG_OPMODE_CFG,
	BD79124_MASK_AUTO_INTERVAL, regval);

(Just ensuring I understood your preference).

> 
> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Sequencer mode to auto */
>> +	ret = regmap_set_bits(data->map, BD79124_REG_SEQUENCE_CFG,
>> +			      BD79124_MASK_SEQ_SEQ);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Don't start the measurement */
>> +	regval = FIELD_PREP(BD79124_MASK_CONV_MODE, BD79124_CONV_MODE_MANSEQ);
> What is this for?

Thank's for pointing it out! It is supposed to be used in call below. 
The code works as it is just because the BD79124_CONV_MODE_MANSEQ 
happens to be '0', but it's still better to use FIELD_PREP() for the 
consistency. Below should change from:

>> +	return regmap_update_bits(data->map, BD79124_REG_OPMODE_CFG,
>> +			BD79124_MASK_CONV_MODE, BD79124_CONV_MODE_MANSEQ);
>> +
to:

	return regmap_update_bits(data->map, BD79124_REG_OPMODE_CFG,
				  BD79124_MASK_CONV_MODE, regval);

Good catch, thanks! :)

>> +}
>> +
>> +static int bd79124_probe(struct i2c_client *i2c)
>> +{
>> +	struct bd79124_data *data;
>> +	struct iio_dev *iio_dev;
>> +	const struct iio_chan_spec *template;
>> +	struct iio_chan_spec *cs;
>> +	struct device *dev = &i2c->dev;
>> +	int ret;
>> +
>> +	iio_dev = devm_iio_device_alloc(dev, sizeof(*data));
>> +	if (!iio_dev)
>> +		return -ENOMEM;
>> +
>> +	data = iio_priv(iio_dev);
>> +	data->dev = dev;
>> +	data->map = devm_regmap_init_i2c(i2c, &bd79124_regmap);
>> +	if (IS_ERR(data->map))
>> +		return dev_err_probe(dev, PTR_ERR(data->map),
>> +				     "Failed to initialize Regmap\n");
>> +
>> +	ret = devm_regulator_get_enable_read_voltage(dev, "vdd");
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to get the Vdd\n");
>> +
>> +	data->vmax = ret;
>> +
>> +	ret = devm_regulator_get_enable(dev, "iovdd");
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to enable I/O voltage\n");
>> +
>> +	ret = devm_delayed_work_autocancel(dev, &data->alm_enable_work,
>> +					   bd79124_alm_enable_worker);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (i2c->irq) {
>> +		template = &bd79124_chan_template;
>> +	} else {
>> +		template = &bd79124_chan_template_noirq;
>> +		dev_dbg(dev, "No IRQ found, events disabled\n");
>> +	}
>> +	ret = devm_iio_adc_device_alloc_chaninfo(dev, template, &cs,
>> +						 &expected_props);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	iio_dev->channels = cs;
>> +	iio_dev->num_channels = ret;
>> +	iio_dev->info = &bd79124_info;
>> +	iio_dev->name = "bd79124";
>> +	iio_dev->modes = INDIO_DIRECT_MODE;
>> +
>> +	data->gc = bd79124gpo_chip;
>> +	data->gc.parent = dev;
>> +
>> +	mutex_init(&data->mutex);
> 
> Whilst it doesn't bring huge advantage, now we have devm_mutex_init()
> it seems reasonable to use it and maybe catch a use after free for the lock.

Ah, indeed. It's a good to learn to 'habitually' use devm_mutex_init().

Yours,
	-- Matti

