Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFAAD609B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 09:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdewxsaeaRsMrnb/HjpEG4312scL4Gi/mSb3WBwjGnY=; b=0fXOQeg3gxC6ry4Pnqrzlik+j5
	jSZDW721bFcqTDUYYJQIa++R5xfF3UU7CX6cRlmOaFt8nK2TIzbOvswgfN+MzyFhXAvEHOmjlK9Cn
	kFv87sZmCP4BZaoB1gwbUzAZVg9HwPcAUDLLUMqLFpDp+zXQPSKHHRUh0EZHgS3TRR1Xip2OufAA7
	WnZzNnlnGAIWmAt1oATyNR5CK2myLFXKmmvRmLlEsGIkUfx8E+6zwcMCGj8KILjK8XW3v0VqqM5rI
	8EIbniMrH8lDPBj0FkKiDCHmm1+AA/q3eAX2kC/2iGUguNtKTMko6ciWZANb9bm8ZX6XWfQvSof5e
	ZjXf25CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDvK-0000000Ce49-1E0G;
	Wed, 27 Nov 2024 09:01:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDuL-0000000Cdtu-49CL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 09:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E754E5C56BE;
	Wed, 27 Nov 2024 08:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3606FC4CED3;
	Wed, 27 Nov 2024 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732698025;
	bh=skOG+mShRmZEUftI8NfzklM92Fji6/eTdCiEyIalZAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMB8cufs71rrLPIEQ4bVG2jDaYfa8StaN0GAOpQA1h/fdinByMiftHdvjWLQhO5lw
	 DaYLtwMXqd9YYEjCnRzjPYPKexatzVpXXOYRP+UhdLbpoIVn+4NrUHW9WcoOOObvaH
	 Hm5Ykm2Cs3XtT5AG4f8TEtQVHojz5rsBWMqX9EWlbiIPSWfDYTITc+DJSVBcFQdOWu
	 1SitDC+yOjFQAiJPONQqDTTlKPgxNQU4ag02HsFv7mg8gX8/GH4ZfSs40/iiH47l5h
	 TV3qw0cMe/ygKN9VeppUKg3RsWJ/fxXZ/L6T/3y1sx6GEeKj0nYbRP9dWJsFaIs27F
	 K2/Wj2uKNYwMA==
Date: Wed, 27 Nov 2024 10:00:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_010026_119580_3A56E120 
X-CRM114-Status: GOOD (  21.64  )
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

On Tue, Nov 26, 2024 at 09:48:00PM +0100, Sasha Finkelstein wrote:
> +static int apple_z2_boot(struct apple_z2 *z2)
> +{
> +	int timeout;
> +
> +	enable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 0);
> +	timeout = wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
> +	if (timeout == 0)
> +		return -ETIMEDOUT;
> +	return apple_z2_upload_firmware(z2);
> +}
> +
> +static int apple_z2_open(struct input_dev *dev)
> +{
> +	struct apple_z2 *z2 = input_get_drvdata(dev);
> +	int error;
> +
> +	/* Reset the device on boot */
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	usleep_range(5000, 10000);
> +	error = apple_z2_boot(z2);
> +	if (error) {
> +		gpiod_direction_output(z2->reset_gpio, 1);

This is less readable code. Each function should clean up its own stuff,
so if z2_boot() de-asserted the reset, then z2_boot() should clean up by
asserting again, not expecting the caller to do this.

> +		disable_irq(z2->spidev->irq);
> +	} else
> +		z2->open = 1;
> +	return error;
> +}
> +
> +static void apple_z2_close(struct input_dev *dev)
> +{
> +	struct apple_z2 *z2 = input_get_drvdata(dev);
> +
> +	disable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	z2->open = 0;
> +	z2->booted = 0;
> +}
> +
> +static int apple_z2_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct apple_z2 *z2;
> +	int error;
> +	const char *label;
> +	struct touchscreen_properties props;
> +
> +	z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
> +	if (!z2)
> +		return -ENOMEM;
> +
> +	z2->spidev = spi;
> +	init_completion(&z2->boot_irq);
> +	spi_set_drvdata(spi, z2);
> +
> +	z2->cs_gpio = devm_gpiod_get_index(dev, "cs", 0, 0);
> +	if (IS_ERR(z2->cs_gpio)) {
> +		if (PTR_ERR(z2->cs_gpio) != -ENOENT) {
> +			dev_err(dev, "unable to get cs");
> +			return PTR_ERR(z2->cs_gpio);
> +		}
> +		z2->cs_gpio = NULL;
> +	}
> +
> +	z2->reset_gpio = devm_gpiod_get_index(dev, "reset", 0, 0);
> +	if (IS_ERR(z2->reset_gpio)) {
> +		dev_err(dev, "unable to get reset");

Syntax is: return dev_err_probe, almost everywhere here.

> +		return PTR_ERR(z2->reset_gpio);
> +	}
> +
> +	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
> +					apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					"apple-z2-irq", spi);
> +	if (error < 0) {
> +		dev_err(dev, "unable to request irq");
> +		return z2->spidev->irq;
> +	}
> +
> +	error = device_property_read_string(dev, "label", &label);
> +	if (error) {
> +		dev_err(dev, "unable to get device name");
> +		return error;
> +	}
> +
> +	error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
> +	if (error) {
> +		dev_err(dev, "unable to get firmware name");
> +		return error;
> +	}
> +
> +	z2->cal_blob = of_get_property(dev->of_node, "apple,z2-cal-blob", &z2->cal_size);

There is no such property.

You cannot sneak undocumented properties.

> +	if (!z2->cal_blob) {
> +		dev_warn(dev, "unable to get calibration, precision may be degraded");
> +		z2->cal_size = 0;
> +	}
> +
> +	z2->input_dev = devm_input_allocate_device(dev);
> +	if (!z2->input_dev)
> +		return -ENOMEM;
> +	z2->input_dev->name = label;
> +	z2->input_dev->phys = "apple_z2";
> +	z2->input_dev->dev.parent = dev;
> +	z2->input_dev->id.bustype = BUS_SPI;
> +	z2->input_dev->open = apple_z2_open;
> +	z2->input_dev->close = apple_z2_close;
> +
> +	/* Allocate the axes before setting from DT */
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
> +	touchscreen_parse_properties(z2->input_dev, true, &props);
> +	z2->y_size = props.max_y;
> +	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
> +	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
> +	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MINOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_ORIENTATION, -32768, 32767, 0, 0);
> +
> +	input_set_drvdata(z2->input_dev, z2);
> +
> +	error = input_mt_init_slots(z2->input_dev, 256, INPUT_MT_DIRECT);
> +	if (error < 0) {
> +		dev_err(dev, "unable to initialize multitouch slots");
> +		return error;
> +	}
> +
> +	error = input_register_device(z2->input_dev);
> +	if (error < 0)
> +		dev_err(dev, "unable to register input device");
> +
> +	return error;
> +}
> +
> +static const struct of_device_id apple_z2_of_match[] = {
> +	{ .compatible = "apple,z2-multitouch" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, apple_z2_of_match);
> +
> +static struct spi_device_id apple_z2_of_id[] = {
> +	{ .name = "j293-touchbar" },
> +	{ .name = "j493-touchbar" },
> +	{ .name = "z2-touchbar" },

You should not need all these above.

> +	{ .name = "z2-multitouch" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, apple_z2_of_id);
> +
> +static struct spi_driver apple_z2_driver = {
> +	.driver = {
> +		.name	= "apple-z2",
> +		.owner = THIS_MODULE,

Drop, this is some very old code. All owners were removed ~10 or more
years ago. This suggests you took some old or poorly maintained driver
as a template, thus you duplicate all the issues we already fixed.

> +		.of_match_table = of_match_ptr(apple_z2_of_match),

Drop of_match_ptr(), you have a warning here.

> +	},
> +	.id_table       = apple_z2_of_id,
> +	.probe		= apple_z2_probe,

Best regards,
Krzysztof


