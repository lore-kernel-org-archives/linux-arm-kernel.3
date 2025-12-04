Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E028D216A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNxmDbbdKqIboODXWdbYm3bL1ySA2CUYBdNtl6MTmVk=; b=goSSONPPuKWh+tG+PNnDZIajlz
	T1TN1YV4bhj1RPEFDHSxGzJ/76W6Lskt4u3gawDLMwtwjXprmMkjv2pkzDY1uoJ72wldFc4QEoa7d
	9tEvhBOx1nJec2+LaQurKuJtHJ5GiKSjFAJbfwyKMbeJu1uXnRQONvjC9GC8MDcImW+dFk0bu1uuG
	uycbCeQcirqdyCfDc0vV4hxAgsZWGWZ0tC9LTk6qb4PInBNFuovjW2oieYHfPxgA3b4/8QdJADZ/h
	29WppNaLXq5XinHPPdXDNQNKiqzHQZZo4GthqpQoBQU4huGBQRZewvMqgClIbeLE3OOgGp1tDCak6
	2JotXn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRC1H-00000008H0v-2Ab2;
	Thu, 04 Dec 2025 16:17:27 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRC1F-00000008H0X-28zR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 16:17:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47796a837c7so9505865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1764865043; x=1765469843; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aNxmDbbdKqIboODXWdbYm3bL1ySA2CUYBdNtl6MTmVk=;
        b=eahE13XJBnATxt3CkItl5Oa3OmhEy4GVkBmij3Uhx9ludACxh0eb/AGYw/GlaxzW/M
         U1ITJTlnEJ1pLwN68VeN8cGtpBn2Cjb6u9bFeX/ZZS6tchqwoS1LShFQn+iabLr2uFXW
         g+SPNxH4p6QqDiN8F7pKVQzd6tun1sqiGMfe/BtU3nk8AkK1lkeMDscZvP14RPYEvGYB
         LRNmOcLb9AEITGnXktHRzbU2CrEIKhJUVFZUqmgjwHubIBzWM4hvPyTsD6YKo5f8PnMB
         S2ZxgdVYjem+HjyvYQk9hYs47reFGn09Yh0/9USto0PciBGfMVImT/o8fuk49kZ9sVYb
         LAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764865043; x=1765469843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNxmDbbdKqIboODXWdbYm3bL1ySA2CUYBdNtl6MTmVk=;
        b=YPaHa3O4OtNmcchtM2qmn9y/Xqw9IvelObqcnXcYeb8II58hR7BILA/6Ys/j/Lerlz
         TT4l4SA0yLaFgWBfGH18/Jo4SGSTjOz5aOCxPczxFf9DhX7dkmzB14JRIsDnhoVoFOh7
         F1jj/iLcuZforrzzypKJ4UHrB13fTX04s8pt88O2KDu6qIn5+XdtO07E8Dwmzy5cyFcC
         u1rzyquB7p48/kHRjH/H2Nr4Y/YrWqyQwaxdEfUOfBc0oFORXEiaKE2U86Raxx7IwuSW
         RptIrV3MvgEnUUokMn+YJcy6IEiCd1s3liXQfP7rWEzC+8kAyl8UtBbNJHmXkhw82j46
         5gAg==
X-Forwarded-Encrypted: i=1; AJvYcCXJUD4Emd3yON9BHTmzGF2gahNtGz7f9gnuqENvgCqylU45nOVZ6ayr8HpIGoaaODyDQswwnktJov+XYqgzFwUc@lists.infradead.org
X-Gm-Message-State: AOJu0YzzM9FJIHjuUQNJalZDefRAHQ3o/O2+byFrEQBI/wadqIkclww9
	Pdr1+E7CG1rLGlE8LzMKZJjeLDlRzPGFQMbb/5+qJzUIVP0AXUw8sBApygxuAACvV3o=
X-Gm-Gg: ASbGnctPifIr+g0hJtkZ7raMR9SBesSjO3qzoRP98jdW3QeRZb4SStqPYrZQGyJX6R8
	Jyr8XTpCx4whthNPLVCLaX6T5LT48bZWWqGba3xG5k3+PzWxr01dSEa9eWV1nqiJ0nIphtWEZ53
	D1A80zM0SJ06aZ0D7f8dOuI9XRLjWl4YuMDFk8gRSoePihqUJdoWr2HNEx+QWJuJ+L2jv2AmMgx
	7URexYL5ojGW7SLxk9u50P77ScE+bX5zzgbIlz2mNfho3qBRyEDc/NkKcQjDye+V5/0+zJ7wnuF
	Mr8ko3LxQzEkbywwtoWQWwJy/8OyBY0VsZ8v/yIDBj7vBydAMRq8usYZtsC+UaBIfr1BOo2po23
	1dMvfjr7HKx5ff4TnrMCN+vqJuElFiuUVGMU6u7VJHk/k91CN7i6h0YTKRXxhpNOk3tf4x7Mev7
	XxHxI/saVZ96v4WkXtohZWo6wG2MhBSJdJMqYcILvNLdsfx/YgaPZSKE3veacV2i3+7B7Jwg==
X-Google-Smtp-Source: AGHT+IH6HRzgtWVSRwk2pLy54f/ZcykaKll9/7ioHYJyiAfAQ0RExVb1Rrhx4JL/zXiO1Ib8Xi1u/g==
X-Received: by 2002:a05:600c:310c:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-4792af34a44mr65294315e9.21.1764865043101;
        Thu, 04 Dec 2025 08:17:23 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f8bsm4033746f8f.43.2025.12.04.08.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:17:22 -0800 (PST)
Date: Thu, 4 Dec 2025 16:17:20 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aTG0EK_zuSB-U_bb@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_081725_704934_AB9A56E1 
X-CRM114-Status: GOOD (  33.80  )
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

On Mon, Dec 01, 2025 at 12:53:21PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

> <snip>

> +static int max25014_check_errors(struct max25014 *maxim)
> +{
> +	uint32_t val;
> +	uint8_t i;
> +	int ret;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);

Shouldn't this be MAX25014_SHORT_LED?


> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * The HW_RST bit always starts at 1 after power up.
> +	 * It is reset on first read, does not indicate an error.
> +	 */
> +	if (val && val != MAX25014_DIAG_HW_RST) {
> +		if (val & MAX25014_DIAG_OT)
> +			dev_err(&maxim->client->dev,
> +				"Overtemperature shutdown\n");
> +		if (val & MAX25014_DIAG_OTW)
> +			dev_err(&maxim->client->dev,
> +				 "Chip is getting too hot (>125C)\n");
> +		if (val & MAX25014_DIAG_BSTOV)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter overvoltage\n");
> +		if (val & MAX25014_DIAG_BSTUV)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter undervoltage\n");
> +		if (val & MAX25014_DIAG_IREFOOR)
> +			dev_err(&maxim->client->dev, "IREF out of range\n");
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * 1. disable unused strings
> + * 2. set dim mode
> + * 3. set setting register
> + * 4. enable the backlight
> + */
> +static int max25014_configure(struct max25014 *maxim, int initial_state)
> +{
> +	uint32_t val;
> +	int ret;
> +
> +	/*
> +	 * Strings can only be disabled when MAX25014_ISET_ENA == 0, check if
> +	 * it needs to be changed at all to prevent the backlight flashing when
> +	 * it is configured correctly by the bootloader
> +	 */

Attach the comment to the if statement rather than the read.


> +	ret = regmap_read(maxim->regmap, MAX25014_DISABLE, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (!((val & MAX25014_DISABLE_DIS_MASK) == maxim->strings_mask)) {
> +		if (initial_state == BACKLIGHT_POWER_ON) {
> +			ret = regmap_write(maxim->regmap, MAX25014_ISET, 0);
> +			if (ret)
> +				return ret;
> +		}
> +		ret = regmap_write(maxim->regmap, MAX25014_DISABLE, maxim->strings_mask);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_SETTING,
> +			   val & ~MAX25014_SETTING_FPWM);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
> +			   maxim->iset | MAX25014_ISET_ENA |
> +			   MAX25014_ISET_PSEN);
> +	return ret;
> +}
> +
> +static int max25014_update_status(struct backlight_device *bl_dev)
> +{
> +	struct max25014 *maxim = bl_get_data(bl_dev);
> +	uint32_t reg;
> +	int ret;
> +
> +	if (backlight_is_blank(maxim->bl))
> +		bl_dev->props.brightness = 0;

This isn't right. Why would you change the backlight level just because
it is currently blanked (and sorry I missed this one last time).

> +
> +	reg  = TON_STEP * bl_dev->props.brightness;

The correct way to honour blanking is just go call
backlight_get_brightness() instead of reading the property directly.


> +
> +	/*
> +	 * 18 bit number lowest, 2 bits in first register,
> +	 * next lowest 8 in the L register, next 8 in the H register
> +	 * Seemingly setting the strength of only one string controls all of
> +	 * them, individual settings don't affect the outcome.
> +	 */
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
> +	if (ret != 0)
> +		return ret;
> +	ret = regmap_write(maxim->regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
> +	if (ret != 0)
> +		return ret;
> +	return regmap_write(maxim->regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
> +}
> +
> +static const struct backlight_ops max25014_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = max25014_update_status,
> +};
> +
> +static int max25014_parse_dt(struct max25014 *maxim,
> +			     uint32_t *initial_brightness)
> +{
> +	struct device *dev = &maxim->client->dev;
> +	struct device_node *node = dev->of_node;
> +	struct fwnode_handle *child;
> +	uint32_t strings[4];
> +	int res, i;
> +
> +	if (!node)
> +		return dev_err_probe(dev, -EINVAL, "no platform data\n");
> +
> +	child = device_get_next_child_node(dev, NULL);
> +	if (child) {
> +		res = fwnode_property_count_u32(child, "led-sources");
> +		if (res > 0) {
> +			fwnode_property_read_u32_array(child, "led-sources",
> +						       strings, res);
> +
> +			/* set all strings as disabled, then enable those in led-sources*/
> +			maxim->strings_mask = 0xf;
> +			for (i = 0; i < res; i++) {
> +				if (strings[i] <= 4)
> +					maxim->strings_mask &= ~BIT(strings[i]);
> +			}
> +		}
> +
> +		fwnode_property_read_u32(child, "default-brightness",
> +					 initial_brightness);
> +
> +		fwnode_handle_put(child);
> +	}
> +
> +	maxim->iset = MAX25014_ISET_DEFAULT_100;
> +	of_property_read_u32(node, "maxim,iset", &maxim->iset);
> +
> +	if (maxim->iset > 15)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid iset, should be a value from 0-15, entered was %d\n",
> +				     maxim->iset);
> +
> +	if (*initial_brightness > 100)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid initial brightness, should be a value from 0-100, entered was %d\n",
> +				     *initial_brightness);
> +
> +	return 0;
> +}
> +
> +static int max25014_probe(struct i2c_client *cl)
> +{
> +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> +	struct backlight_properties props;
> +	uint32_t initial_brightness = 50;
> +	struct backlight_device *bl;
> +	struct max25014 *maxim;
> +	int ret;
> +
> +	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
> +	if (!maxim)
> +		return -ENOMEM;
> +
> +	maxim->client = cl;
> +
> +	ret = max25014_parse_dt(maxim, &initial_brightness);
> +	if (ret)
> +		return ret;
> +
> +	maxim->vin = devm_regulator_get(&maxim->client->dev, "power");
> +	if (IS_ERR(maxim->vin)) {
> +		return dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->vin),
> +				     "failed to get power-supply");
> +	}
> +
> +	ret = regulator_enable(maxim->vin);
> +	if (ret)
> +		return dev_err_probe(&maxim->client->dev, ret,
> +			"failed to enable power-supply\n");

Can this use devm_regulator_get_enable()?


> +
> +	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
> +						GPIOD_OUT_HIGH);
> +	if (IS_ERR(maxim->enable)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->enable),
> +				    "failed to get enable gpio\n");
> +		goto disable_vin;
> +	}
> +
> +	/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> +	fsleep(2000);
> +
> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
> +	if (IS_ERR(maxim->regmap)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->regmap),
> +			"failed to initialize the i2c regmap\n");
> +		goto disable_full;
> +	}
> +
> +	i2c_set_clientdata(cl, maxim);
> +
> +	ret = max25014_check_errors(maxim);
> +	if (ret) { /* error is already reported in the above function */
> +		goto disable_full;
> +	}
> +
> +	ret = max25014_initial_power_state(maxim);
> +	if (ret < 0) {
> +		dev_err_probe(&maxim->client->dev, ret, "Could not get enabled state\n");
> +		goto disable_full;
> +	}
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +	props.brightness = initial_brightness;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +	props.power = ret;
> +
> +	ret = max25014_configure(maxim, ret);
> +	if (ret) {
> +		dev_err_probe(&maxim->client->dev, ret, "device config error");
> +		goto disable_full;
> +	}
> +
> +	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
> +					    &maxim->client->dev, maxim,
> +					    &max25014_bl_ops, &props);
> +	if (IS_ERR(bl)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(bl),
> +				    "failed to register backlight\n");
> +		goto disable_full;
> +	}
> +
> +	maxim->bl = bl;
> +
> +	backlight_update_status(maxim->bl);
> +
> +	return 0;
> +
> +disable_full:
> +	gpiod_set_value_cansleep(maxim->enable, 0);

Why is this needed? It was only ever set by devm_gpiod_get_optional().

> +disable_vin:
> +	regulator_disable(maxim->vin);

This is also not needed if you use devm_regulator_get_enable().


> +	return ret;
> +}


Daniel.

