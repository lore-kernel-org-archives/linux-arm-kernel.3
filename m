Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F269FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4I9Nmi0x1XRh5MmNss3uO6kHDeCcgFZXdE1zsROAGYg=; b=UsVGyYH3TbrJaq6hL3612iZ3Fo
	2221nF1BJvMIgs16jLmbpYqwFMR3kSdKETmzB+7CJdrsZWlHGjOenF47KZX+xXUDuYhSg1zB3fF9T
	HZTK6PfsgZg86d7UYR7/GObcAJIVK3hGZHOWpTMfPVHnwP0I/SX7U2rU34h0pzl+tQsGDv2/jXS60
	NXm5FuzL9t1ifob9gD9QpTrRgOnJhBBXo1FSxD2fGP0zTyOzZBwrmc8psSsrbbg48xf8G35p8mJ5P
	CDDWvhZs44qo3IZ1XH/U6tobFjgYvEh45xmqqAdXIFIP7WwOgiHvipdz5Q0KQYi+oxGBTa7EyCREQ
	DpPn+W2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHP4d-000000004Hc-2EeW;
	Fri, 07 Nov 2025 16:12:27 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHP4a-000000004Gl-3jkc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:12:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-429c4c65485so712653f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762531943; x=1763136743; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4I9Nmi0x1XRh5MmNss3uO6kHDeCcgFZXdE1zsROAGYg=;
        b=AvLyii3tg7dlExlhfRnm9xR4e5JGRkEsCa+bO+Ka65Bf9fzALbzBsdICurvt37n9td
         +kgg5rR0pLm1p6bmf3urCd+XV3KT0/k72MAUHzjax/ErSrbqiQB/aI8adqjGdjbD0tcg
         ynBkTLtHX+91WoOpIW3PcINQok2owpzUIpcg4rz9QbhIFZL133iQJraDCh04aMQ4NQqW
         uEYjkNXejJhImfG3IhRIKkLcmE5oCpKRtfIGyu3qLExWeBzdmCIXm50zu9uqNGxXTCZq
         EEeE9DrBcPECdnp+gRvLasDsjK2KUJtfHRpGqcZGloJBuTAoFWNjl/cz1YnnNpmvm0zs
         efMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531943; x=1763136743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I9Nmi0x1XRh5MmNss3uO6kHDeCcgFZXdE1zsROAGYg=;
        b=JtA9SghHLuYmQVgHpQKxFf5DAJiKhVekTf77swQ8UgAba9skHE3AkOWfbZlEKUjuxs
         r5cU1t14S/kcGAyjl55nYiRVLTsLvPt4BUrSyNmKzHQAH83aizFUo2p56Cu5+lWM71Qp
         EjJ5hd1DZ96X+W4s0Kq9hDqibIC0mgxM0hpqf3krmraxLQukysc7rpSpNzZOTzVL/AXx
         H1ku3RFN+L6VLj2vX77WG27hJ5BpuZB2xEguG6ATRitRHYCY3PAoKPe+Jr8AJaoKFB9u
         cMoCsHO9nS9c/M+MjUzeCttYRW4U43M9924eqYNtoLRiQlAOp6cOo3gjFY/88FefIVnN
         r5sw==
X-Forwarded-Encrypted: i=1; AJvYcCVKz5geG4y7PScpHyuoKn0WEuLo0OsISfpOH9KETHBU6GIeFCHLKmL4f/IXBUjCSSufF5ozGvL0vhTR2AVLNWNK@lists.infradead.org
X-Gm-Message-State: AOJu0YxzMa0augGOPb+UJI1niTQhMOHRq2RlbJp7+7qYKobyWpXShvJB
	gHHl4WQf1EklWNOsIGwQBuZyOtNDJBv6z6ywtyfYbjOk7E47NvLPwym/8AkhUc4OeRo=
X-Gm-Gg: ASbGncva+IwglRYDXT8UPvQmuIL3YY4ff+8uuxH8AagpZlrN039FlWAtRivpnCys3YD
	cLctNX//vcv/M++xaxKy/eSzw/t4Rmt1VT1L+0dzYlkFRTjMyLxDtFTH38sI5c9aeLmrCvtgR4I
	DMMaATxYEy+LgE2n6gtKwUcaR79q5fEAN9lW01Cbqn3hZ+yML6KEw6TR/DDobV/A/8tHYOt2fVI
	m5PbbV9eaOS3JMAgjkvXdg9eG+A+ipwfbCKbQfUSKaEb104B22mbTryXaX7lGrLfou0YXc8Z4GJ
	Wn7rZ6/c0FNbQu138UW2kAXeyM/6X/mpIGdS4Sg8tMmIROHPePSwLDHbvURERMu21twbNx9Ye4Q
	JzFGsfov0lEzZ1gKlhKQkt5/zBrNpSSdkomQcP9jFxWRP+n3SZPvIx0fKrQ9mrz1gjyF3I62xWZ
	v5qPEZ2l54rflBP7/iqYY3nv+B3NEUm3yLxmpPNMACFEH4XUV2SZNI8F+7GqY=
X-Google-Smtp-Source: AGHT+IGHroTzRo1cJ44LOHTxL+NRy7sTi9c/ImeIIStaKdw3lsU0/qp1TjSL/vM3MWErBezrq59Q0A==
X-Received: by 2002:a05:6000:1884:b0:429:cbba:b247 with SMTP id ffacd0b85a97d-42ae58d03b4mr3192709f8f.23.1762531942614;
        Fri, 07 Nov 2025 08:12:22 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b23csm6015125f8f.10.2025.11.07.08.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:12:21 -0800 (PST)
Date: Fri, 7 Nov 2025 16:14:17 +0000
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
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlight
Message-ID: <aQ4a2SBDldYgQb56@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_081225_075685_234B465C 
X-CRM114-Status: GOOD (  37.28  )
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

On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
> new file mode 100644
> index 000000000000..36bae508697e
> --- /dev/null
> +++ b/drivers/video/backlight/max25014.c
> @@ -0,0 +1,409 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Backlight driver for Maxim MAX25014
> + *
> + * Copyright (C) 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define MAX25014_ISET_DEFAULT_100 11
> +#define MAX_BRIGHTNESS            100
> +#define MIN_BRIGHTNESS            0
> +#define TON_MAX                   130720 /* @153Hz */
> +#define TON_STEP                  1307 /* @153Hz */
> +#define TON_MIN                   0
> +
> +#define MAX25014_DEV_ID           0x00
> +#define MAX25014_REV_ID           0x01
> +#define MAX25014_ISET             0x02
> +#define MAX25014_IMODE            0x03
> +#define MAX25014_TON1H            0x04
> +#define MAX25014_TON1L            0x05
> +#define MAX25014_TON2H            0x06
> +#define MAX25014_TON2L            0x07
> +#define MAX25014_TON3H            0x08
> +#define MAX25014_TON3L            0x09
> +#define MAX25014_TON4H            0x0A
> +#define MAX25014_TON4L            0x0B
> +#define MAX25014_TON_1_4_LSB      0x0C
> +#define MAX25014_SETTING          0x12
> +#define MAX25014_DISABLE          0x13
> +#define MAX25014_BSTMON           0x14
> +#define MAX25014_IOUT1            0x15
> +#define MAX25014_IOUT2            0x16
> +#define MAX25014_IOUT3            0x17
> +#define MAX25014_IOUT4            0x18
> +#define MAX25014_OPEN             0x1B
> +#define MAX25014_SHORT_GND        0x1C
> +#define MAX25014_SHORT_LED        0x1D
> +#define MAX25014_MASK             0x1E
> +#define MAX25014_DIAG             0x1F
> +
> +#define MAX25014_IMODE_HDIM       BIT(2)
> +#define MAX25014_ISET_ENABLE      BIT(5)
> +#define MAX25014_ISET_PSEN        BIT(4)
> +#define MAX25014_DIAG_HW_RST      BIT(2)
> +#define MAX25014_SETTING_FPWM     GENMASK(6, 4)
> +
> +struct max25014 {
> +	struct i2c_client *client;
> +	struct backlight_device *bl;
> +	struct regmap *regmap;
> +	struct gpio_desc *enable;
> +	struct regulator *vin; /* regulator for boost converter Vin rail */
> +	uint32_t iset;
> +	uint8_t strings_mask;
> +};
> +
> +static const struct regmap_config max25014_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MAX25014_DIAG,
> +};
> +
> +/**
> + * @brief control the brightness with i2c registers
> + *
> + * @param regmap trivial
> + * @param brt brightness
> + * @return int
> + */
> +static int max25014_register_control(struct regmap *regmap, uint32_t brt)

This isn't a good name for a function. It doesn't really say what it
does. Please find a more descriptive name.


> +{
> +	uint32_t reg = TON_STEP * brt;
> +	int ret;
> +	/*
> +	 * 18 bit number lowest, 2 bits in first register,
> +	 * next lowest 8 in the L register, next 8 in the H register
> +	 * Seemingly setting the strength of only one string controls all of
> +	 * them, individual settings don't affect the outcome.
> +	 */
> +
> +	ret = regmap_write(regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
> +	if (ret != 0)
> +		return ret;
> +	ret = regmap_write(regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
> +	if (ret != 0)
> +		return ret;
> +	return regmap_write(regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
> +}
> +
> +static int max25014_check_errors(struct max25014 *maxim)
> +{
> +	uint8_t i;
> +	int ret;
> +	uint32_t val;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
> +	if (ret != 0)
> +		return ret;
> +	/*
> +	 * The HW_RST bit always starts at 1 after power up.
> +	 * It is reset on first read, does not indicate an error.
> +	 */
> +	if (val > 0 && val != MAX25014_DIAG_HW_RST) {
> +		if (val & 0b1)
> +			dev_err(&maxim->client->dev,
> +				"Overtemperature shutdown\n");
> +		if (val & 0b10)
> +			dev_err(&maxim->client->dev,
> +				 "Chip is getting too hot (>125C)\n");
> +		if (val & 0b1000)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter overvoltage\n");
> +		if (val & 0b10000)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter undervoltage\n");
> +		if (val & 0b100000)
> +			dev_err(&maxim->client->dev, "IREF out of range\n");
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * 1. disable unused strings
> + * 2. set dim mode
> + * 3. set initial brightness

How does this code set the initial brightness? It doens't set the
MAX25014_TON* registers.


> + * 4. set setting register
> + * 5. enable the backlight
> + */
> +static int max25014_configure(struct max25014 *maxim)
> +{
> +	int ret;
> +	uint32_t val;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_DISABLE,
> +			   maxim->strings_mask);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_SETTING,
> +			   val & ~MAX25014_SETTING_FPWM);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
> +			   maxim->iset | MAX25014_ISET_ENABLE |
> +			   MAX25014_ISET_PSEN);
> +	return ret;
> +}
> +
> +static int max25014_update_status(struct backlight_device *bl_dev)
> +{
> +	struct max25014 *maxim = bl_get_data(bl_dev);
> +
> +	if (backlight_is_blank(maxim->bl))
> +		bl_dev->props.brightness = 0;
> +
> +	return max25014_register_control(maxim->regmap,
> +					 bl_dev->props.brightness);
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
> +	if (!node) {
> +		dev_err(dev, "no platform data\n");
> +		return -EINVAL;
> +	}
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
> +	if (maxim->iset < 0 || maxim->iset > 15) {
> +		dev_err(dev,
> +			"Invalid iset, should be a value from 0-15, entered was %d\n",
> +			maxim->iset);
> +		return -EINVAL;
> +	}
> +
> +	if (*initial_brightness < 0 || *initial_brightness > 100) {
> +		dev_err(dev,
> +			"Invalid initial brightness, should be a value from 0-100, entered was %d\n",
> +			*initial_brightness);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max25014_probe(struct i2c_client *cl)
> +{
> +	struct backlight_device *bl;
> +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> +	struct max25014 *maxim;
> +	struct backlight_properties props;
> +	int ret;
> +	uint32_t initial_brightness = 50;
> +
> +	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
> +	if (!maxim)
> +		return -ENOMEM;
> +
> +	maxim->client = cl;
> +
> +	ret = max25014_parse_dt(maxim, &initial_brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	maxim->vin = devm_regulator_get_optional(&maxim->client->dev, "power");

I would have expected to see devm_regulator_get() here. Why do you care
whether you get a real regulator or a dummy if you just NULL check
maxim->vin everywhere?


> +	if (IS_ERR(maxim->vin)) {
> +		if (PTR_ERR(maxim->vin) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		maxim->vin = NULL;
> +	}
> +
> +	if (maxim->vin) {

If you had called devm_regulator_get() there would be no need for a NULL
check here.


> +		ret = regulator_enable(maxim->vin);
> +		if (ret < 0) {
> +			dev_err(&maxim->client->dev,
> +				"failed to enable Vin: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
> +						GPIOD_ASIS);
> +	if (IS_ERR(maxim->enable)) {
> +		ret = PTR_ERR(maxim->enable);
> +		dev_err(&maxim->client->dev, "failed to get enable gpio: %d\n",
> +			ret);
> +		goto disable_vin;
> +	}
> +
> +	if (maxim->enable)
> +		gpiod_set_value_cansleep(maxim->enable, 1);

No need for NULL pointer check here (see
https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpio/gpiolib.c#L358-L363 ).


> +
> +	/* Enable can be tied to vin rail wait if either is available */
> +	if (maxim->enable || maxim->vin) {
> +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> +		usleep_range(2000, 2500);
> +	}

If you really want to keep the devm_regulator_get_optional() I guess
maybe you could persuade me it's need to avoid this sleep... although
I'd be fairly happy to remove the NULL checks here too!


> +
> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
> +	if (IS_ERR(maxim->regmap)) {
> +		ret = PTR_ERR(maxim->regmap);
> +		dev_err(&maxim->client->dev,
> +			"failed to initialize the i2c regmap: %d\n", ret);
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
> +	ret = max25014_configure(maxim);
> +	if (ret) {
> +		dev_err(&maxim->client->dev, "device config err: %d", ret);
> +		goto disable_full;
> +	}
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +	props.brightness = initial_brightness;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +
> +	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
> +					    &maxim->client->dev, maxim,
> +					    &max25014_bl_ops, &props);
> +	if (IS_ERR(bl))
> +		return PTR_ERR(bl);
> +
> +	maxim->bl = bl;
> +
> +	return 0;
> +
> +disable_full:
> +	if (maxim->enable)
> +		gpiod_set_value_cansleep(maxim->enable, 0);

Again, NULL check isn't needed.

> +disable_vin:
> +	if (maxim->vin)
> +		regulator_disable(maxim->vin);
> +	return ret;
> +}
> +
> +static void max25014_remove(struct i2c_client *cl)
> +{
> +	struct max25014 *maxim = i2c_get_clientdata(cl);
> +
> +	maxim->bl->props.brightness = 0;
> +	max25014_update_status(maxim->bl);
> +	if (maxim->enable)
> +		gpiod_set_value_cansleep(maxim->enable, 0);

Lose the NULL check.

> +	if (maxim->vin)
> +		regulator_disable(maxim->vin);
> +}
> +
> +static const struct of_device_id max25014_dt_ids[] = {
> +	{ .compatible = "maxim,max25014", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max25014_dt_ids);
> +
> +static const struct i2c_device_id max25014_ids[] = {
> +	{ "max25014" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max25014_ids);
> +
> +static struct i2c_driver max25014_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = of_match_ptr(max25014_dt_ids),
> +	},
> +	.probe = max25014_probe,
> +	.remove = max25014_remove,
> +	.id_table = max25014_ids,
> +};
> +module_i2c_driver(max25014_driver);
> +
> +MODULE_DESCRIPTION("Maxim MAX25014 backlight driver");
> +MODULE_AUTHOR("Maud Spierings <maudspierings@gocontroll.com>");
> +MODULE_LICENSE("GPL");


Daniel.

