Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F203CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZVyTjQ1s1YKbSECOiTy2rLTyEmtWvVLTZ+8yGWPUNs=; b=bM5qaWqvXrolANNGg9h7orwq3w
	NiUF6vtLZVXOpGWohanflhqx9JEFObuFI6tlzotZScCsMfzhplVEusAUxYvt21rBXzG1m0N0tqwy0
	MNy7Mtrkhvajw+Osjy4K4hxSt0b7eztnTqKY00OlGdenWdmkc6AaoewXubUDueNlJXyHYtuZl1g6w
	u1O8y6qlZHmT6jMUBzZe36Ha0fzLhcwJ7EiPdSKwXFPJEyUidvVMN7cSIIyRb8HhcCsQHFdi1ESzV
	kbcWSymFzXdimxbLsrhvPH5NE1ZgUI63NqnbiOaTDVBO1gv8cpGMMQmioNFrTPg2pVivPbQcYwAcc
	8LGBwYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVIn-00000008OAr-2uuc;
	Mon, 11 Aug 2025 16:23:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTJD-00000007zFh-1IlF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:15:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so37836655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754921728; x=1755526528; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZVyTjQ1s1YKbSECOiTy2rLTyEmtWvVLTZ+8yGWPUNs=;
        b=Paetj6BCOr0e6LRdVVQMbIqTpbNt6GxOsqYyulJKqCQdblrbG/W1z8tYVLXi/UOhOC
         7UH0yfOLHvlvMXWg3Gce0WQG3TPpxwhvtLTIaoThsyaXozCoC3hZ+GKGwCHVqz2BSfZq
         XuPV0QpomIQ3zt2ayHlV3ch74D2H8wUBxyl4iWkVLapQpO12fx7gmEEUwYZ9H8udZbMz
         a9TUkQcFzvOzpN29caJHDTqNbpeNrC7mV4PFmNZ3bWznq3nt5fPWAFoWxhZpY67iolVg
         hJmHE3zUD9fYqh1yATqqZ2amkRbhEx6TId9v16ZWChxv4TaYaheRVXWxC6Ih0qGLeOWL
         BUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921728; x=1755526528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZVyTjQ1s1YKbSECOiTy2rLTyEmtWvVLTZ+8yGWPUNs=;
        b=t3bNtf8cHTcoTcPhMKzpBZbFPRyeX4uGyg5zBU4uK5N9FZ6GXhY3cS2tpRyHITSei1
         /Lob+QkPCr6363P/n/xiLpKKctTBk+VLljKQX5tKdPpzEWeP3IgO/X2bgisIyldM2RSE
         AD+xB7eEoQvqeH6skDaYbFrTdfhtwJ+c4j3oD+4/Q6ICKBfF7v/CftXUbNLJZSbC3+Ya
         iNHZn+QL8mQHgZbP8Na+j+UZ2NsIxPwluZn+tv/tpUKy7n76eSrmECVSyS0jpSyAZD0+
         U8FN1y4dTPzpDaUVE9nCYGzKyRgWfTCDmmuZI7zUMY1xuEnR8HrROVzbauoNgFfJxYCY
         TRIw==
X-Forwarded-Encrypted: i=1; AJvYcCV1F/QU6FRZGrzTiTOCpQGyobGX0FJopOX9RhgpBORPeU6wP2CK2iY0qpWmg4Suff0aEQAd5KBJNhywTX9YscWe@lists.infradead.org
X-Gm-Message-State: AOJu0YyzLDU5LK4ts//NcbOfW3k1aSz1Iw5npicZ6hTlvV2l+9MDn2op
	sEH/LBaUHcR/W9oknWP1hRGXesLpe3E9rAOt9JOFMz+EZVvwhjIL7xW9eU+W65WUrCQ=
X-Gm-Gg: ASbGnctwHBEgK/tHr75AWtaanslBa/rz9rdhX2G4l78PLLbG8ktarYhR2Ss8LW+Q94O
	ALc8IxoQ2+3UIWrLS8Fl4v9fnO9nV94QNs/eYIcTvNdsLWmt1zfF3Cu1ACnHZeadB+psBpiLohD
	0DrpCRWria3fr9xtB4vcPcD5srUwB2mjOftKNOhqlxJMB5QA7ZLSyoi6tHZGPcZH+ORCJoXvotZ
	YRiScrNhiqRtAoJ8PABPvbYanPKiDulqgOr46Tw7YpeZKU4nkpB5zfdJ+za/yCCPrnYRsJlftHb
	YHHRrAqhQWsShU8lPD+LxvS5G0a0segDKeGlj1XHGzStr7unD8np4MoiJMVEV2ucfgETuCltD7B
	63TK+SVBn7ip1s5aPTHIDrhh7zMekkcNFKyzzr/dR7is7SG9ATuL+h66St+18nIdMMICoN0unaV
	zem5bkvg==
X-Google-Smtp-Source: AGHT+IH5e2VguXl/NE7RsmXIN0XcgUI7a0EiWf4IGX+6mTIqnY80BhVdae2lcK8a/X1KcW2Wv39mgg==
X-Received: by 2002:a05:600c:1d09:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-459f4f04237mr121012195e9.16.1754921727691;
        Mon, 11 Aug 2025 07:15:27 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e586ad64sm254198625e9.20.2025.08.11.07.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:15:27 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:15:25 +0100
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
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	MaudSpieringsmaudspierings@gocontroll.com
Subject: Re: [PATCH 2/4] backlight: add max25014atg backlight
Message-ID: <aJn6_c79tvy_1dhU@aspen.lan>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_071531_520144_6175AC26 
X-CRM114-Status: GOOD (  37.78  )
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

On Fri, Jul 25, 2025 at 01:09:24PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
>
> Signed-off-by: Maud Spierings maudspierings@gocontroll.com
> ---
>  MAINTAINERS                            |   2 +
>  drivers/video/backlight/Kconfig        |   7 +
>  drivers/video/backlight/Makefile       |   1 +
>  drivers/video/backlight/max25014.c     | 449 +++++++++++++++++++++++++++++++++
>  include/linux/platform_data/max25014.h |  24 ++

Who else included this header file? Can the code here simply be included
in the C file?


> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..371b6017953ae5955f4dfef921980dfdedd65d85
> --- /dev/null
> +++ b/drivers/video/backlight/max25014.c
> @@ -0,0 +1,449 @@
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
> +#include <linux/platform_data/max25014.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define MAX25014_ISET_DEFAULT_100 11U
> +#define MAX_BRIGHTNESS (100U)
> +#define MIN_BRIGHTNESS (0U)
> +#define TON_MAX (130720U) /* @153Hz */
> +#define TON_STEP (1307U) /* @153Hz */
> +#define TON_MIN (0U)
> +
> +#define MAX25014_DEV_ID         (0x00U)
> +#define MAX25014_REV_ID         (0x01U)
> +#define MAX25014_ISET           (0x02U)
> +#define MAX25014_IMODE          (0x03U)
> +#define MAX25014_TON1H          (0x04U)
> +#define MAX25014_TON1L          (0x05U)
> +#define MAX25014_TON2H          (0x06U)
> +#define MAX25014_TON2L          (0x07U)
> +#define MAX25014_TON3H          (0x08U)
> +#define MAX25014_TON3L          (0x09U)
> +#define MAX25014_TON4H          (0x0AU)
> +#define MAX25014_TON4L          (0x0BU)
> +#define MAX25014_TON_1_4_LSB    (0x0CU)
> +#define MAX25014_SETTING        (0x12U)
> +#define MAX25014_DISABLE        (0x13U)
> +#define MAX25014_BSTMON         (0x14U)
> +#define MAX25014_IOUT1          (0x15U)
> +#define MAX25014_IOUT2          (0x16U)
> +#define MAX25014_IOUT3          (0x17U)
> +#define MAX25014_IOUT4          (0x18U)
> +#define MAX25014_OPEN           (0x1BU)
> +#define MAX25014_SHORT_GND      (0x1CU)
> +#define MAX25014_SHORT_LED      (0x1DU)
> +#define MAX25014_MASK           (0x1EU)
> +#define MAX25014_DIAG           (0x1FU)

Forcing all these constants to be unsigned is unusual. Is it really
needed?


> +#define MAX25014_IMODE_HDIM     BIT(2)
> +#define MAX25014_ISET_ENABLE    BIT(5)
> +#define MAX25014_ISET_PSEN      BIT(4)
> +#define MAX25014_DIAG_HW_RST    BIT(2)
> +#define MAX25014_SETTING_FPWM   GENMASK(6, 4)
> +
> +struct max25014;

This is redundant. Remove.
> +
> +struct max25014 {
> +	const char *chipname;

Why keep this value around? It is only used during the probe.

> +	struct i2c_client *client;
> +	struct backlight_device *bl;
> +	struct device *dev;

It is necessary to cache this, is it just a copy of client->dev)?


> +	struct regmap *regmap;
> +	struct max25014_platform_data *pdata;
> +	struct gpio_desc *enable;
> +	struct regulator *vin; /* regulator for boost converter Vin rail */
> +};
> +
> +static const struct regmap_config max25014_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MAX25014_DIAG,
> +};
> +
> +/**
> + * @brief get the bit mask for the DISABLE register.
> + *
> + * @param strings the led string configuration array.
> + * @return uint8_t bits to set in the register.
> + */
> +static uint8_t strings_mask(struct max25014 *maxim)
> +{
> +	uint8_t res, i;
> +
> +	for (i = 0; i < 4; i++) {
> +		if (maxim->pdata->strings[i] == 0)
> +			res |= 1 << i;
> +	}
> +	return res;

Could this converison have happened during DT parsing?
> +}
> +
> +/**
> + * @brief control the brightness with i2c registers
> + *
> + * @param regmap trivial
> + * @param brt brightness
> + * @return int
> + */
> +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
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
> +		dev_err(maxim->dev, "Open led strings detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(maxim->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(maxim->dev, "Short to ground detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(maxim->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(maxim->dev, "Shorted led detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(maxim->dev, "string %d\n", i + 1);
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
> +			dev_err(maxim->dev, "Overtemperature shutdown\n");
> +		if (val & 0b10)
> +			dev_warn(maxim->dev,
> +				 "Chip is getting too hot (>125C)\n");
> +		if (val & 0b1000)
> +			dev_err(maxim->dev, "Boost converter overvoltage\n");
> +		if (val & 0b10000)
> +			dev_err(maxim->dev, "Boost converter undervoltage\n");
> +		if (val & 0b100000)
> +			dev_err(maxim->dev, "IREF out of range\n");
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * 1. disable unused strings
> + * 2. set dim mode
> + * 3. set initial brightness
> + * 4. set setting register
> + * 5. enable the backlight
> + */
> +static int max25014_configure(struct max25014 *maxim)
> +{
> +	int ret;
> +	uint32_t val;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_DISABLE,
> +			   strings_mask(maxim));
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
> +	if (ret != 0)
> +		return ret;
> +
> +	max25014_register_control(maxim->regmap,
> +				  maxim->pdata->initial_brightness);
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(
> +		maxim->regmap, MAX25014_SETTING,
> +		val & ~MAX25014_SETTING_FPWM);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
> +			   maxim->pdata->iset | MAX25014_ISET_ENABLE | MAX25014_ISET_PSEN);
> +	return ret;
> +}
> +
> +static int max25014_update_status(struct backlight_device *bl_dev)
> +{
> +	struct max25014 *maxim = bl_get_data(bl_dev);
> +
> +	if (bl_dev->props.state & BL_CORE_SUSPENDED)
> +		bl_dev->props.brightness = 0;
> +
> +	return max25014_register_control(maxim->regmap, bl_dev->props.brightness);
> +}
> +
> +static const struct backlight_ops max25014_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = max25014_update_status,
> +};
> +
> +static int max25014_backlight_register(struct max25014 *maxim)
> +{
> +	struct backlight_device *bl;
> +	struct backlight_properties props;
> +	struct max25014_platform_data *pdata = maxim->pdata;
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +
> +	if (pdata->initial_brightness > props.max_brightness)
> +		pdata->initial_brightness = props.max_brightness;

Handle this during DT parsing.

> +
> +	props.brightness = pdata->initial_brightness;
> +
> +	bl = devm_backlight_device_register(maxim->dev, maxim->chipname, maxim->dev,
> +					    maxim, &max25014_bl_ops, &props);
> +	if (IS_ERR(bl))
> +		return PTR_ERR(bl);
> +
> +	maxim->bl = bl;
> +
> +	return 0;
> +}

Can max25014_backlight_register() be moved into the probe function?
There is no special control flow here so this function doesn't make the
probe function any simpler.

> +
> +#ifdef CONFIG_OF
> +static int max25014_parse_dt(struct max25014 *maxim)
> +{
> +	struct device *dev = maxim->dev;
> +	struct device_node *node = dev->of_node;
> +	struct max25014_platform_data *pdata;
> +
> +	int res;
> +
> +	if (!node) {
> +		dev_err(dev, "no platform data\n");
> +		return -EINVAL;
> +	}
> +
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +
> +	res = of_property_count_u32_elems(node, "maxim,strings");
> +	if (res == 4) {
> +		of_property_read_u32_array(node, "maxim,strings", pdata->strings, 4);
> +	} else {
> +		dev_err(dev, "strings property not correctly defined\n");
> +		return -EINVAL;
> +	}
> +
> +	pdata->initial_brightness = 50U;
> +	of_property_read_u32(node, "default-brightness", &pdata->initial_brightness);
> +	pdata->iset = MAX25014_ISET_DEFAULT_100;
> +	of_property_read_u32(node, "maxim,iset", &pdata->iset);
> +
> +	if (pdata->iset < 0 || pdata->iset > 15) {
> +		dev_err(dev,
> +			"Invalid iset, should be a value from 0-15, entered was %d\n",
> +			pdata->iset);
> +		return -EINVAL;
> +	}
> +
> +	if (pdata->initial_brightness < 0 || pdata->initial_brightness > 100) {
> +		dev_err(dev,
> +			"Invalid initial brightness, should be a value from 0-100, entered was %d\n",
> +			pdata->initial_brightness);
> +		return -EINVAL;
> +	}
> +
> +	maxim->pdata = pdata;
> +
> +	return 0;
> +}
> +#else
> +static int max25014_parse_dt(struct max25014 *maxim)
> +{
> +	dev_err(maxim->dev,
> +		"CONFIG_OF not configured, unable to parse devicetree");
> +	return -EINVAL;
> +}

What is the point of this method? New drivers shouldn't support platform
data so CONFIG_OF is required for this driver to work at all.


> +#endif
> +
> +static int max25014_probe(struct i2c_client *cl)
> ...


Daniel.

