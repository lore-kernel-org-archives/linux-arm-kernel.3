Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADFECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 20:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAoo4cL1dIYweQDzrk/O9/maigv0J12ua5s1T9IZZIQ=; b=vb1fkfticBZNSt6YNzYBsBDvn8
	i0yjT3GuYm+vVxi6J2hZhJvXzB4NgXuSqBrL1POKRDUrMXR+E5YWfB+qHq6zrnjkOXM/GvtZkvnI7
	9XM8/UI65gOeAt9/syMCSTxwd0s+LOfbcB2PWx5/hvS4++p8cg9sVDr6NmNt3IX9MmiuzbFtkROmh
	4Hed50T+FliOA+5DQBLPgM3kOqf9Sdlh1GsxXFPQ8flUHkMdZj5W4+JNV2zldyUTyrvxwyKElqueU
	xAv2p8LSRfSk5oewX4ThFgyPveA6JflaiU0cHg7GqlwXha1zdGtoDw6VzhHd4t4hoaL7cgc1g8/yp
	Z5p70dRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyyQe-0000000ETp1-2Wyo;
	Wed, 17 Sep 2025 20:07:00 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyyQc-0000000ETod-051u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 20:06:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-25669596921so2307095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 13:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758139617; x=1758744417; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nAoo4cL1dIYweQDzrk/O9/maigv0J12ua5s1T9IZZIQ=;
        b=c9YmyLL0e78QPI0wwjyv9rjL25xOdEaP17mvkyA5YY+k121Wpoha+zoq5Z/V+K1hA4
         QuDMuGt8dE4ukCmwfhZyHmaxY6fv5ibUwwP2xzKED6O56wtcOjF33j62VYhKA4pD+H/s
         rFKt0pmMGmongBdKbjozAEXVQHgCdvNwUZNr7tXLjOfKMcYSKdwlwhYOEsMJz9hE9iSV
         mMP3wwCOGUMujcWm9SHh5VqzWkwIRN8/PHHe9TiOGkkZQ6CqQx87LDxWqfwjaVgquV4Y
         TdI6FZ2bqpMY7m8iYuWy9Rki0VDIxMFumN6W0tOgid82GSRbNJ0KPKIeA3G6RN0oYqDn
         tDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139617; x=1758744417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAoo4cL1dIYweQDzrk/O9/maigv0J12ua5s1T9IZZIQ=;
        b=mAa1LD0zwhHFVTfhsmOBj/T7go05vfJ/ib+QUefX3TkkeG2H9L/6BxzV95R697hwSa
         yyRca9WiKgJeyFFAOKOyj5LRn/5WRC1W+oOrrEhBprVG65FDUsITpXbQMZwSSLV6wv4j
         b1EFDcBEahb8xfUZqwcSWBsYFXiNcw/1A7khpNLZSGMq3SNQvnt7Ob/x8mdVVRHKrfMt
         0qrAyqsQbqAB1Cp0WZ3XlVkJ8FYv39RGT3QJ0mn2l6pAYQQBpNA2zOaEyk/0J+/KkXJ6
         Omv+e4woaORJNfOIy2NrBLdirU1QYCrNTGyKdM62ESdMakW3UOKKX+FxjmvpG1sa1Crf
         h7Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVMv1JkbCl40UmipYio+zc6QazDMqNeQT/mI9tF+8ewS1FI9UjYVIoHI6R+fYXji2yx0JivwlUpy6ValsO8XTSB@lists.infradead.org
X-Gm-Message-State: AOJu0YxvhoOTVvkIwfDJmQdjzJssNzDe1hw3CcA74SWtEheu4o144l4g
	FjJsVoDvm/TEWhv7Y4Wu73IuM5MgHfM3P8zcecGaLU2SH5uYMStrSxXaIHc+Lw==
X-Gm-Gg: ASbGncsPFCrBIfk2lTLiOexG5Rwh77q7k+Lpy6W+Xr/zVBSrA53XHzGrkZXdsasZB4j
	nUNDj3LNzijf35GGFRI9d1WdZO9X4l7PBhvLaZUEZcpeRffglhJ51LprTMo1VOPMIOs3cI3x2MQ
	fGNmUdPILhEKgWjHUDRCOuRn+VPdPbnczclS4KcE9b5G61uGcBgMewF49KixufNqS7CPpE9zyqN
	Xp40frgN8OhQfEtqnh2n2lwgObgPHL23URbnGjxqIzwZ9yJo37K5utmuT+Ky9WXTrcbzwaMA9kF
	SkuIpgZ4oiOe0fizQdG6r2RAyftfijmL4gZrsAixVM0eOyeuGNQIytLIfpY2E91DevScXJEDWZc
	EuBhgYujkIyAZv6gtP4o4xKeK6Xdc1Z6Ml5IK1JU4TA==
X-Google-Smtp-Source: AGHT+IH4ljt2vti7NSBWoLRl1Y3YBR7ak2BF6N3DsrRX2rCMF4AUdMIoGbFRGc1NosrFKmMz+WdEHw==
X-Received: by 2002:a17:903:2c7:b0:264:567b:dd92 with SMTP id d9443c01a7336-26813e02d08mr43177195ad.52.1758139616771;
        Wed, 17 Sep 2025 13:06:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c3d9:b11c:3856:2d3a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698035cd39sm3762225ad.146.2025.09.17.13.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:06:56 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:06:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] Input: s6sa552 - add a driver for the Samsung
 A552 touchscreen controller
Message-ID: <zh2cvvhvdklwnrnhmzsgajk5ryk7gwd5sayde656ddysi53d7b@frw2ph3opmoe>
References: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914134458.2624176-3-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914134458.2624176-3-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_130658_068758_9F5BCEC7 
X-CRM114-Status: GOOD (  27.12  )
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

Hi Ivaylo,

On Sun, Sep 14, 2025 at 04:44:57PM +0300, Ivaylo Ivanov wrote:
> The S6SA552 touchscreen is a capacitive multi-touch controller for
> mobile use. It connects via i2c at the address 0x48.
> 
> Introduce a basic driver, which can handle initialization, touch events
> and power states.
> 
> At least the firmware for this IC on Galaxy S7 differs from S6SY761
> in register layout and bits, as well as some missing registers/functions,
> for example for retrieving the max X/Y coordinates and the amount
> of TX/RX channels.

I am not sure why you are using runtime PM in the driver, given that you
enable it on probe and disable it in remove and otherwise do not touch.

If you want to use it then you should probably call runtime_pm_get() and
runtime_pm_put() from open()/close() methods instead of toggling power
directly.

[...]

> +
> +static void s6sa552_input_close(struct input_dev *dev)
> +{
> +	struct s6sa552_data *sdata = input_get_drvdata(dev);
> +	int ret;

	int error;

> +
> +	ret = i2c_smbus_write_byte(sdata->client, S6SA552_SENSE_OFF);
> +	if (ret)
> +		dev_err(&sdata->client->dev, "failed to turn off sensing\n");
> +}
> +
> +static ssize_t s6sa552_sysfs_devid(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct s6sa552_data *sdata = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%#x\n", sdata->devid);
> +}
> +
> +static DEVICE_ATTR(devid, 0444, s6sa552_sysfs_devid, NULL);
> +
> +static struct attribute *s6sa552_sysfs_attrs[] = {
> +	&dev_attr_devid.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(s6sa552_sysfs);
> +
> +static int s6sa552_power_on(struct s6sa552_data *sdata)
> +{
> +	u8 buffer[S6SA552_EVENT_SIZE];
> +	int ret;

	int error;

Use "error" for storing error values from APIs that return negative or
0. For APIs that also return real values "ret" is fine.

> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(sdata->regulators),
> +				    sdata->regulators);
> +	if (ret)
> +		return ret;
> +
> +	msleep(140);
> +
> +	/* double check whether the touch is functional */
> +	ret = i2c_smbus_read_i2c_block_data(sdata->client,
> +					    S6SA552_READ_ONE_EVENT,
> +					    S6SA552_EVENT_SIZE,
> +					    buffer);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (buffer[0] != S6SA552_EVENT_TYPE_ACK ||
> +	    buffer[1] != S6SA552_EVENT_ACK_BOOT) {
> +		return -ENODEV;
> +	}
> +
> +	ret = i2c_smbus_read_byte_data(sdata->client, S6SA552_BOOT_STATUS);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* for some reasons the device might be stuck in the bootloader */
> +	if (ret != S6SA552_BS_APPLICATION)
> +		return -ENODEV;
> +
> +	/* enable touch functionality */
> +	ret = i2c_smbus_write_byte_data(sdata->client,
> +					S6SA552_TOUCH_FUNCTION, 0x01);
> +	if (ret)
> +		return ret;
> +
> +	mdelay(20); /* make sure everything is up */
> +
> +	return 0;
> +}
> +
> +static int s6sa552_hw_init(struct s6sa552_data *sdata)
> +{
> +	u8 buffer[S6SA552_DEVID_SIZE];
> +	int ret;
> +
> +	ret = s6sa552_power_on(sdata);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(sdata->client,
> +					    S6SA552_DEVICE_ID,
> +					    S6SA552_DEVID_SIZE,
> +					    buffer);
> +	if (ret < 0)
> +		return ret;
> +
> +	sdata->devid = get_unaligned_be16(buffer + 1);
> +
> +	return 0;
> +}
> +
> +static void s6sa552_power_off(void *data)
> +{
> +	struct s6sa552_data *sdata = data;
> +
> +	disable_irq(sdata->client->irq);
> +	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
> +			       sdata->regulators);
> +}
> +
> +static int s6sa552_probe(struct i2c_client *client)
> +{
> +	struct s6sa552_data *sdata;
> +	int err;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
> +						I2C_FUNC_SMBUS_BYTE_DATA |
> +						I2C_FUNC_SMBUS_I2C_BLOCK))
> +		return -ENODEV;
> +
> +	sdata = devm_kzalloc(&client->dev, sizeof(*sdata), GFP_KERNEL);
> +	if (!sdata)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, sdata);
> +	sdata->client = client;
> +
> +	sdata->regulators[S6SA552_REGULATOR_VDD].supply = "vdd";
> +	sdata->regulators[S6SA552_REGULATOR_AVDD].supply = "avdd";
> +	err = devm_regulator_bulk_get(&client->dev,
> +				      ARRAY_SIZE(sdata->regulators),
> +				      sdata->regulators);
> +	if (err)
> +		return err;
> +
> +	err = devm_add_action_or_reset(&client->dev, s6sa552_power_off, sdata);
> +	if (err)
> +		return err;
> +
> +	err = s6sa552_hw_init(sdata);
> +	if (err)
> +		return err;
> +
> +	sdata->input = devm_input_allocate_device(&client->dev);
> +	if (!sdata->input)
> +		return -ENOMEM;
> +
> +	sdata->input->name = S6SA552_DEV_NAME;
> +	sdata->input->id.bustype = BUS_I2C;
> +	sdata->input->open = s6sa552_input_open;
> +	sdata->input->close = s6sa552_input_close;
> +
> +	input_set_abs_params(sdata->input, ABS_MT_POSITION_X, 0, S6SA552_MAX_X,
> +			     0, 0);
> +	input_set_abs_params(sdata->input, ABS_MT_POSITION_Y, 0, S6SA552_MAX_Y,
> +			     0, 0);
> +	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
> +	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
> +	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> +
> +	touchscreen_parse_properties(sdata->input, true, &sdata->prop);
> +
> +	if (!input_abs_get_max(sdata->input, ABS_X) ||
> +	    !input_abs_get_max(sdata->input, ABS_Y)) {
> +		dev_warn(&client->dev, "the axis have not been set\n");
> +	}
> +
> +	err = input_mt_init_slots(sdata->input, S6SA552_TX_CHANNELS,
> +				  INPUT_MT_DIRECT);
> +	if (err)
> +		return err;
> +
> +	input_set_drvdata(sdata->input, sdata);
> +
> +	err = input_register_device(sdata->input);
> +	if (err)
> +		return err;
> +
> +	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +					s6sa552_irq_handler,
> +					IRQF_TRIGGER_LOW | IRQF_ONESHOT,

Do not hardcode trigger type, just use IRQF_ONESHOT.

> +					"s6sa552_irq", sdata);
> +	if (err)
> +		return err;
> +
> +	pm_runtime_enable(&client->dev);
> +
> +	return 0;
> +}

Thanks.

-- 
Dmitry

