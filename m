Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1214C7113C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KU9XIo3pE6yrQp415HLbJ5RslRTOsLxW1sCDEyQ/CuQ=; b=ujAbNA7EiFcZ5BmbVPh9ssvJiM
	UAY/qH3w9HlCiTPFKzJtR++uvUyu28k7AsQiyPasRfzY8xYrQod11ewabGX0G8xZf7sLd0+9PWNwf
	TvBP5bImh5ues5bOSumlfoNS1mx1Tcj7mtpPRKY1tCo9wbxnz0Nba7hFUH72SjhmVxzFRplqD8xXq
	jEcbx4VeysDZ93FcpciOx27zjXZBgzgbmfHXvRe8iA22UNr6IMtCQ1kKmTDe2jVm4pNBJY/pVF2Bx
	X8+QdCmuvzoCo6fljkSGoOFS3BpuQeNPJC8fzB4Y+9GemctUAqgASj9fuZ0jzQuE5W9qRhU6L5Cc9
	Ij6w6Qlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMmb-0000000ACLx-0T4R;
	Wed, 11 Jun 2025 14:50:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIB6-00000009YQJ-3mn3;
	Wed, 11 Jun 2025 09:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KU9XIo3pE6yrQp415HLbJ5RslRTOsLxW1sCDEyQ/CuQ=; b=RXuwEmt4VAI8owLiETxWpyRwA2
	qh1jF6HixEp3VLIQApQpUIJURb0i1aDsgzHBJtR2Tl146WZubIreZ5ta6OtsN7et/1V0EjYUxZrW4
	qJZCf0DPTF3zMvoeCXrk1CEBLog9XMcHPMoDQyUxkC+u2rKL713DaUsRrkUxU3HId7pBinpKXkn2p
	grbuo683at9flyN8iJaA5JxeBC7eK7rpjWxqHSyvXfDS2KliOVR9i4SluBGIDCdrrzFAAMMCsAyyu
	2gbXkXPGHbb7ovkGMtqxXhwP555/eAqlF5X+78FZoZEijQh4EPHYnuKRCtrRSKoKMizi5HmCVt0fZ
	ytdylEBg==;
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIB4-00000002FTI-2xOV;
	Wed, 11 Jun 2025 09:55:28 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87ecd70679cso2374251241.0;
        Wed, 11 Jun 2025 02:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749635722; x=1750240522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KU9XIo3pE6yrQp415HLbJ5RslRTOsLxW1sCDEyQ/CuQ=;
        b=T4Gayw0m6NDUHYfk0w7A/d3OY/KfQE7pcUId9YfRvBpkX33EJIR9nF81V7y2O7OlbF
         YBAV2qYx8VOaSIlzHI/UahPxIRUcHIOS3/PT4wfhNtlihKxuEXIPFbnk8nn6bI2trEJT
         b+DEB7dXQLkl4E9niDhuX2fd+cnLkNOxLQ3JBnTtfA1pGXZkRky8vZQ3vdRmE5c+9XxC
         GWd+XTQU2vKguXhbW0MLagJ4Qr/aOK+8Kp7Ua2NpmEez+8JWLKXGI1CUxF6Yf/bXNFXd
         KiFrXAuUTCodsKuZwtuOnQbKiIMJdiqwPPLNWGsUSFlu2va2ngT/ayPO55jGz5r7maFi
         8X/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDBBu3rYt7TK5f7kqfSFy3i9BzZE/P8/CFbtgYM9RxT6Yq0K0mSZPgutqk7wg/a6diWFkwLtV2UiEB/J1A7or4@lists.infradead.org
X-Gm-Message-State: AOJu0YyCtsHQm73hdmQIW3mZ118O8+Tpwgr0OhxUn3ACxgdKFrclrOt5
	EouLCyANc1V4fIxBL8hhMpLpXTwBDVeci6ebs0RyycKXGa9EkztnU43jv9BVOe/R
X-Gm-Gg: ASbGncuPksKBOL2EB5flX3l3pQs/w6ku9Ex+AocHyZNTaPESvNMNX8Pzvaev/pGYUFr
	9MKAS1U0tzbyMuzXjYEQkx5aGh9NlfC4p6uSpNaNXc9li5KmuS5FQ0SToiG7FCNXS05mCnNsxb7
	rJiRBvOkm4H+2XMqQRIXdLJhv8ioJi6PTiuKc5aXQhEWYjDFkOYpchC+GxM7WNqP0YGMjANejWv
	fusOg8G3cNL9pSvTTBRdh/OR6bFu5R9qE28i/O8mS7j6JZbo4CDVI1g/qn3U1nxbmh4rNDFmU58
	n5gGDIPCATZnd5RCVjt/7ppoTPowC/V6DVjkvaxqC91Wu+Omx2KtMGv1si7pUyakmKmNJuuqtdp
	QG09y93gHOY9R/OD4AXBLQayU
X-Google-Smtp-Source: AGHT+IETqI9ZwVUuLk04r1crvCDNoauHspE6OZqIqZOUrpViUowY4YvkQUpSHfFdQYjS47PErfIjrw==
X-Received: by 2002:a05:6122:65aa:b0:531:2906:752d with SMTP id 71dfb90a1353d-53129069070mr200201e0c.11.1749635721664;
        Wed, 11 Jun 2025 02:55:21 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531227fad80sm834584e0c.11.2025.06.11.02.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 02:55:21 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87ed1fa8b19so1975737241.2;
        Wed, 11 Jun 2025 02:55:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHGOcEYnYalulWcSWJCMmNyKoLBtE1MXzFGIm1qCVyzBi5hl/Yc0Uxjg02FFR4P/hfUVFZcYcDlbIM7HbAuPg0@lists.infradead.org
X-Received: by 2002:a05:6102:c52:b0:4db:e01:f2db with SMTP id
 ada2fe7eead31-4e7bac51164mr2305941137.0.1749635720444; Wed, 11 Jun 2025
 02:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org> <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jun 2025 11:55:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwPHvuGdWYFEhOHeT9J67igd6kWNpRgUAbhAGVMKPMcw@mail.gmail.com>
X-Gm-Features: AX0GCFsGW1Nt-ZuPkSAbdZllHwaYUgTYpVvtkmvsxqCyNzTWo3jjsyTMzzglaiU
Message-ID: <CAMuHMdXwPHvuGdWYFEhOHeT9J67igd6kWNpRgUAbhAGVMKPMcw@mail.gmail.com>
Subject: Re: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7"
 Raspberry Pi 720x1280
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Linux PWM List <linux-pwm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_105526_823463_8C5B20E9 
X-CRM114-Status: GOOD (  30.57  )
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

CC pwm

On Wed, 11 Jun 2025 at 10:19, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Add regulator for the 7" Raspberry Pi 720x1280 DSI panel based on ili9881.
> This is the Raspberry Pi DSI Panel V2. The newer Raspberry Pi 5" and 7"
> panels have a slightly different register map to the original one. Add a
> new driver for this "regulator" chip, this time by exposing two GPIOs and
> one PWM controller, both of which can be consumed by panel driver and
> pwm-backlight respectively.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Loosely based on:
> https://github.com/raspberrypi/linux 3c07b87e877e ("regulator: Add a regulator for the new LCD panels")]
> https://github.com/raspberrypi/linux 68c59b9e6275 ("regulator: rpi_panel_v2: Add remove and shutdown hooks")]
> ---
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> ---
>  drivers/regulator/Kconfig                  |  10 ++
>  drivers/regulator/Makefile                 |   1 +
>  drivers/regulator/rpi-panel-v2-regulator.c | 114 +++++++++++++++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 drivers/regulator/rpi-panel-v2-regulator.c
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 6d8988387da4..21ad6d938e4d 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1153,6 +1153,16 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
>           touchscreen unit. The regulator is used to enable power to the
>           TC358762, display and to control backlight.
>
> +config REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
> +       tristate "Raspberry Pi 7-inch touchscreen panel V2 regulator"
> +       depends on I2C
> +       select GPIO_REGMAP
> +       select REGMAP_I2C
> +       help
> +         This driver supports regulator on the V2 Raspberry Pi touchscreen
> +         unit. The regulator is used to enable power to the display and to
> +         control backlight PWM.
> +
>  config REGULATOR_RC5T583
>         tristate "RICOH RC5T583 Power regulators"
>         depends on MFD_RC5T583
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index c0bc7a0f4e67..be98b29d6675 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -136,6 +136,7 @@ obj-$(CONFIG_REGULATOR_PBIAS) += pbias-regulator.o
>  obj-$(CONFIG_REGULATOR_PCAP) += pcap-regulator.o
>  obj-$(CONFIG_REGULATOR_RAA215300) += raa215300.o
>  obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY)  += rpi-panel-attiny-regulator.o
> +obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2)  += rpi-panel-v2-regulator.o
>  obj-$(CONFIG_REGULATOR_RC5T583)  += rc5t583-regulator.o
>  obj-$(CONFIG_REGULATOR_RK808)   += rk808-regulator.o
>  obj-$(CONFIG_REGULATOR_RN5T618) += rn5t618-regulator.o
> diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
> new file mode 100644
> index 000000000000..b77383584a3a
> --- /dev/null
> +++ b/drivers/regulator/rpi-panel-v2-regulator.c
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022 Raspberry Pi Ltd.
> + * Copyright (C) 2025 Marek Vasut
> + */
> +
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/regmap.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pwm.h>
> +#include <linux/regmap.h>
> +
> +/* I2C registers of the microcontroller. */
> +#define REG_ID         0x01
> +#define REG_POWERON    0x02
> +#define REG_PWM                0x03
> +
> +/* Bits for poweron register */
> +#define LCD_RESET_BIT  BIT(0)
> +#define CTP_RESET_BIT  BIT(1)
> +
> +/* Bits for the PWM register */
> +#define PWM_BL_ENABLE  BIT(7)
> +#define PWM_BL_MASK    GENMASK(4, 0)
> +
> +/* Treat LCD_RESET and CTP_RESET as GPIOs */
> +#define NUM_GPIO       2
> +
> +static const struct regmap_config rpi_panel_regmap_config = {
> +       .reg_bits = 8,
> +       .val_bits = 8,
> +       .max_register = REG_PWM,
> +       .can_sleep = true,
> +};
> +
> +static int rpi_panel_v2_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +                                 const struct pwm_state *state)
> +{
> +       struct regmap *regmap = pwmchip_get_drvdata(chip);
> +       unsigned int duty;
> +
> +       if (state->polarity != PWM_POLARITY_NORMAL)
> +               return -EINVAL;
> +
> +       if (!state->enabled)
> +               return regmap_write(regmap, REG_PWM, 0);
> +
> +       duty = pwm_get_relative_duty_cycle(state, PWM_BL_MASK);
> +       return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
> +}
> +
> +static const struct pwm_ops rpi_panel_v2_pwm_ops = {
> +       .apply = rpi_panel_v2_pwm_apply,
> +};
> +
> +/*
> + * I2C driver interface functions
> + */
> +static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
> +{
> +       struct gpio_regmap_config gconfig = {
> +               .ngpio          = NUM_GPIO,
> +               .ngpio_per_reg  = NUM_GPIO,
> +               .parent         = &i2c->dev,
> +               .reg_set_base   = REG_POWERON,
> +       };
> +       struct regmap *regmap;
> +       struct pwm_chip *pc;
> +       int ret;
> +
> +       pc = devm_pwmchip_alloc(&i2c->dev, 1, 0);
> +       if (IS_ERR(pc))
> +               return PTR_ERR(pc);
> +
> +       pc->ops = &rpi_panel_v2_pwm_ops;
> +
> +       regmap = devm_regmap_init_i2c(i2c, &rpi_panel_regmap_config);
> +       if (IS_ERR(regmap))
> +               return dev_err_probe(&i2c->dev, PTR_ERR(regmap), "Failed to allocate regmap\n");
> +
> +       pwmchip_set_drvdata(pc, regmap);
> +
> +       regmap_write(regmap, REG_POWERON, 0);
> +
> +       gconfig.regmap = regmap;
> +       ret = PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&i2c->dev, &gconfig));
> +       if (ret)
> +               return dev_err_probe(&i2c->dev, ret, "Failed to create gpiochip\n");
> +
> +       return devm_pwmchip_add(&i2c->dev, pc);
> +}
> +
> +static const struct of_device_id rpi_panel_v2_dt_ids[] = {
> +       { .compatible = "raspberrypi,touchscreen-panel-regulator-v2" },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, rpi_panel_v2_dt_ids);
> +
> +static struct i2c_driver rpi_panel_v2_regulator_driver = {
> +       .driver = {
> +               .name = "rpi_touchscreen_v2",
> +               .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +               .of_match_table = of_match_ptr(rpi_panel_v2_dt_ids),
> +       },
> +       .probe = rpi_panel_v2_i2c_probe,
> +};
> +
> +module_i2c_driver(rpi_panel_v2_regulator_driver);
> +
> +MODULE_AUTHOR("Dave Stevenson <dave.stevenson@raspberrypi.com>");
> +MODULE_DESCRIPTION("Regulator device driver for Raspberry Pi 7-inch V2 touchscreen");
> +MODULE_LICENSE("GPL");
> --
> 2.47.2

