Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574C4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaYe4zy0Ou27FvsmHa5NmILaWl1zdTnktRLAnBaEUHo=; b=ti0cGazsuKSjolibeV7PxCeaOe
	mnzeHvSTAKW6rR4YBw0/xnqTw4hvfzYm+gF3wwQ85wmT425qO0bvK6GA+hddqBCxKqx8mh7ah5OFs
	mSKHK/pZYglHcjEuUmFXI0VgFb0NO22WJEe8GlodGXwB3iSyeYs6ZoNsTLvwe4jYfsqpeZvHmodWX
	STTYd2Hu+pYz4tuiwJPjY+xw7AFIZfWBtR4PL9nX0e+8inI/tJirAwU/QAhohuOkmNfm42LQPe2ov
	884+mVRF7CRkiZkSERS80yzsXCPIgMI30EniNqoQaLim5wtbyVWjoWBQ5OPva0VAYvGeaFON+CxU+
	bPJl0DwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hSd-0000000FgBp-0zxS;
	Fri, 18 Apr 2025 08:52:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hI2-0000000FePp-3gT7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 08:41:40 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39bf44be22fso1127926f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744965697; x=1745570497; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gaYe4zy0Ou27FvsmHa5NmILaWl1zdTnktRLAnBaEUHo=;
        b=VBSX0YTFJQJfiamNSaKYp7iuGRpotD4bfgjd3rItcBm7iGLHBgOblU1KWstCmOSTWa
         ZQHKY+snX7/Y0aPBvVpPMShW0C2XHoQjKX28z72X/gx21cxHD8fKS74qDKVOar0YD7gq
         bKzvY7ndnnMlemuuTV1Nvu2w/jz/90NyWISanLZYwM/D9F0lm/rAqR+3CRFwU3jpDFLI
         bgAAP//RV+4n5AhPSPjQm3XvBye3TTPgj5YiqLQkwsnEKRXAsRmbLeRQC8WQiGaFrRyO
         Q1VS3JTUi5hb6tlz1DAzza1uZ3jBpjO3mw+RBgRXZFNgYyyu6qbu0YcYrSNBKVaq0csa
         /IFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744965697; x=1745570497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gaYe4zy0Ou27FvsmHa5NmILaWl1zdTnktRLAnBaEUHo=;
        b=dEfw5hH+L64qDFkA7+Hy/816NvC3pDj4RwOw56Oqu++Ab65DYnjCVhynPFCgNBYtdw
         D7SEjXchb2zBKEn00SPd8/Pv9Xl3LzF5WsLLOHHCkDiGFbxEwUfaMtgwonWxt4ZS/gen
         xTPF7zf/FRWHrLIhhmUVtCGgjq8j7U8s1bjU1ldIwqAYyS63NbYDWMoZ5QYb2asNjHS1
         iisa14CGNIgPBUrx6l9gVw/7vPqx0tJU+6w3fmFZoyeJbESS7Ndbz7hs9wd2PeOxRF8n
         y3BKv+pAPQjrlLHiqXuII0axSoaXdatUmJnIYUcp5JGIUJrtdZkNJOmfJ0LQX2lkm4CV
         IUdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcPoR9VncTB90zgsn/DQ5SzWmkMoecGQ/orvYc6USnbhCzL+R3cLo8lB7eA2z0Blpi7q5cvqxXM0w48Fu5emCD@lists.infradead.org
X-Gm-Message-State: AOJu0YyGwlVI3KRg2TqXWSRK+mMDjquXVWqWFiHteCuwRudXdNssOG1/
	Z6WXtmM8E5S2CJ7dHXLVMGePmJjm6UKXwB2SBWgdUJlHl0Kuc3EAUxjGaEoZJ6E=
X-Gm-Gg: ASbGncvlUQDcpqPRPq8OYo0+nk87r/TYkrNIPF3JDbBzqdoAoB2Zhg6oByK973dOgPX
	1x9n9yPp4I9Z2vmtWR85U8Y/M41o5IKs1za/m8mUY87lpBhQfUbOqC+ARn7mhbKHQXGllMvdCdf
	Sl5P0Pz887/tL8ZDyq4+WRcBOmosvUJ3f8ZZ6XgzD9KEdywtu1qdbOr7tEwVKUkofyDtVeQNId1
	KhHFM9g74mBOLOS+ll5hYuxouw92vzRLi+hxJdpZ6hpE8N9cJahQ0xXuXLMkY7iQqd+b7fM5Z2g
	aXBVTA734g+PGL+x5I9Ut0BIWQFB62FDWcKMoPbO+vPapvpdMH/tE2y8NDJl9GkDMbj+cwV3TyT
	WXCM=
X-Google-Smtp-Source: AGHT+IE3GyLzZUyelI40gS2vTuDQpSNMhcJ1TL+LpOT3j005P7cUJ4VklepZjvjFsXXu1LyMWnIBEQ==
X-Received: by 2002:a05:6000:18a2:b0:39a:c9ac:cd58 with SMTP id ffacd0b85a97d-39efba5af80mr1425563f8f.29.1744965696999;
        Fri, 18 Apr 2025 01:41:36 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a5150sm2039295f8f.82.2025.04.18.01.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:41:36 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:41:34 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH 3/6] thermal/drivers/sun8i: Add support for A523 THS0/1
 controllers
Message-ID: <aAIQPtxCDuT2e7vE@mai.linaro.org>
References: <20250411003827.782544-1-iuncuim@gmail.com>
 <20250411003827.782544-4-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411003827.782544-4-iuncuim@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_014138_923978_2AACC7B5 
X-CRM114-Status: GOOD (  41.57  )
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

On Fri, Apr 11, 2025 at 08:38:23AM +0800, Mikhail Kalashnikov wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> The A523 processor has two temperature controllers, THS0 and THS1.
> THS0 has only one temperature sensor, which is located in the DRAM.
> 
> THS1 does have 3 sensors:
> ths1_0 - "big" cores
> ths1_1 - "little" cores
> ths1_2 - gpu
> 
> The datasheet mentions a fourth sensor in the NPU, but lacks any registers
> for operation other than calibration registers. The vendor code reads the
> value from ths1_2, but uses separate calibration data, so we get two
> different values from real one.
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 134 ++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index dc4055c9c..919b05a96 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -116,6 +116,15 @@ static int sun50i_h5_calc_temp(struct ths_device *tmdev,
>  		return -1590 * reg / 10 + 276000;
>  }
>  
> +static int sun55i_a523_calc_temp(struct ths_device *tmdev,
> +					int id, int reg)
> +{
> +	if (reg >= 0x7c8)
> +		return tmdev->chip->scale * (tmdev->chip->offset - reg);
> +	else
> +		return 65 * (2825 - reg);
> +}

Please use macro instead of litterals

> +
>  static int sun8i_ths_get_temp(struct thermal_zone_device *tz, int *temp)
>  {
>  	struct tsensor *s = thermal_zone_device_priv(tz);
> @@ -208,6 +217,100 @@ static irqreturn_t sun8i_irq_thread(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +
> +/*
> + * The A523 nvmem calibration values. The ths1_3 is not used as it
> + * doesn't have its own sensor and doesn't have any internal switch.
> + * Instead, the value from the ths1_2 sensor is used, which gives the
> + * illusion of an independent sensor for NPU and GPU when using
> + * different calibration values.
> + *
> + * efuse layout 0x38-0x3F (caldata[0..3]):
> + *     caldata[0]      caldata[1]      caldata[2]      caldata[3]
> + * 0               16      24      32  36          48          60 64
> + * +---------------+---------------+---------------+---------------+
> + * |               |       |   temp    |  ths1_0   |  ths1_1   |   +
> + * +---------------+---------------+---------------+---------------+
> + *
> + * efuse layout 0x40-0x43 (caldata[4..5]) - not in use
> + *
> + * efuse layout 0x44-0x4B (caldata[6..9]):
> + *     caldata[6]      caldata[7]      caldata[8]      caldata[9]
> + * 0           12  16      24      32  36          48             64
> + * +---------------+---------------+---------------+---------------+
> + * |  ths1_2   |  ths1_3   |  ths0_0   |           |               +
> + * +---------------+---------------+---------------+---------------+
> + */
> +static int sun55i_a523_ths_calibrate(struct ths_device *tmdev,
> +				   u16 *caldata, int callen)
> +{
> +	struct device *dev = tmdev->dev;
> +	int i, ft_temp;
> +
> +	if (!caldata[0])
> +		return -EINVAL;
> +
> +	ft_temp = (((caldata[2] << 8) | (caldata[1] >> 8)) & FT_TEMP_MASK) * 100;
> +
> +	for (i = 0; i < tmdev->chip->sensor_num; i++) {
> +		int sensor_reg, sensor_temp, cdata, offset;
> +		/*
> +		 * Chips ths0 and ths1 have common parameters for value
> +		 * calibration. To separate them we can use the number of
> +		 * temperature sensors on each chip.
> +		 * For ths0 this value is 1.
> +		 */
> +		if (tmdev->chip->sensor_num == 1) {
> +			sensor_reg = ((caldata[7] >> 8) | (caldata[8] << 8)) & TEMP_CALIB_MASK;
> +		} else {
> +			switch (i) {
> +			case 0:
> +				sensor_reg = (caldata[2] >> 4) & TEMP_CALIB_MASK;
> +				break;
> +			case 1:
> +				sensor_reg = caldata[3] & TEMP_CALIB_MASK;
> +				break;
> +			case 2:
> +				sensor_reg = caldata[6] & TEMP_CALIB_MASK;
> +				break;
> +			default:
> +				sensor_reg = 0;
> +				break;
> +			}
> +		}
> +
> +		sensor_temp = tmdev->chip->calc_temp(tmdev, i, sensor_reg);
> +
> +		/*
> +		 * Calibration data is CALIBRATE_DEFAULT - (calculated
> +		 * temperature from sensor reading at factory temperature
> +		 * minus actual factory temperature) * X (scale from
> +		 * temperature to register values)
> +		 */
> +		cdata = CALIBRATE_DEFAULT -
> +			((sensor_temp - ft_temp) / tmdev->chip->scale);
> +
> +		if (cdata & ~TEMP_CALIB_MASK) {
> +			/*
> +			 * Calibration value more than 12-bit, but calibration
> +			 * register is 12-bit. In this case, ths hardware can
> +			 * still work without calibration, although the data
> +			 * won't be so accurate.
> +			 */
> +			dev_warn(dev, "sensor%d is not calibrated.\n", i);
> +			continue;
> +		}
> +
> +		offset = (i % 2) * 16;
> +		regmap_update_bits(tmdev->regmap,
> +				   SUN50I_H6_THS_TEMP_CALIB + (i / 2 * 4),
> +				   TEMP_CALIB_MASK << offset,
> +				   cdata << offset);
> +	}
> +
> +	return 0;
> +}
> +
>  static int sun8i_h3_ths_calibrate(struct ths_device *tmdev,
>  				  u16 *caldata, int callen)
>  {
> @@ -721,6 +824,35 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
>  	.calc_temp = sun8i_ths_calc_temp,
>  };
>  
> +/* The A523 has a shared reset line for both chips */
> +static const struct ths_thermal_chip sun55i_a523_ths0 = {
> +	.sensor_num = 1,
> +	.has_bus_clk_reset = true,
> +	.has_gpadc_clk = true,
> +	.ft_deviation = 5000,
> +	.offset = 2736,
> +	.scale = 74,
> +	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
> +	.calibrate = sun55i_a523_ths_calibrate,
> +	.init = sun50i_h6_thermal_init,
> +	.irq_ack = sun50i_h6_irq_ack,
> +	.calc_temp = sun55i_a523_calc_temp,
> +};
> +
> +static const struct ths_thermal_chip sun55i_a523_ths1 = {
> +	.sensor_num = 3,
> +	.has_bus_clk_reset = true,
> +	.has_gpadc_clk = true,
> +	.ft_deviation = 5000,
> +	.offset = 2736,
> +	.scale = 74,
> +	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
> +	.calibrate = sun55i_a523_ths_calibrate,
> +	.init = sun50i_h6_thermal_init,
> +	.irq_ack = sun50i_h6_irq_ack,
> +	.calc_temp = sun55i_a523_calc_temp,
> +};
> +
>  static const struct of_device_id of_ths_match[] = {
>  	{ .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
>  	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
> @@ -731,6 +863,8 @@ static const struct of_device_id of_ths_match[] = {
>  	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
>  	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
>  	{ .compatible = "allwinner,sun50i-h616-ths", .data = &sun50i_h616_ths },
> +	{ .compatible = "allwinner,sun55i-a523-ths0", .data = &sun55i_a523_ths0 },
> +	{ .compatible = "allwinner,sun55i-a523-ths1", .data = &sun55i_a523_ths1 },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, of_ths_match);
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

