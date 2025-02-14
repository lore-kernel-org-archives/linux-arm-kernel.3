Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D18C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEH7kxAK9+ZmXauANtytyG1d26occlPJKsaRujrey7U=; b=jpVGXuicGvnthsJ+M7LPyyieHh
	TDBAgIjb/uOsiRUBu+Qtk8o1CzfwTBRHicOWygu1YooG7SFNedIAqZNYZ+5ToDwFacfkacEPH4AqZ
	HcQ4X7oS/wQkp+/MuOdnpyWLRnB6SfdCtXwMXNAowrh4Kq6vgr0boIIxDW7oJBIT2cFF6VE2w4XYD
	RgHSXrcMEjuriI4CuZ66k3ZR0vCs4XtaOZ0Aa8eltm7A/ivdC8SnL6Q0kgbLE7kchAfAbALXMs4N2
	XJO2N+v2X2oLHknHP3rM7j4Psjq+HIklRrxbBTffyDJysWRqahN0AEonuVLCSQwlo/7a18hjqCDhE
	4SQUPECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwNh-0000000F6W7-1AQC;
	Fri, 14 Feb 2025 14:09:25 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwKw-0000000F68C-0Ocd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:06:36 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-471c8bdabcfso12799641cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1739541992; x=1740146792; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AEH7kxAK9+ZmXauANtytyG1d26occlPJKsaRujrey7U=;
        b=LHgH4Yq9zfP6+BMI3VFZgiA8QC7jy3WdFV5FWOr1pwN/5EwP0ObQgGl4J5ct0pmm1e
         LcR/ppqMrpRvANRK5KB+CXlIVIVcv4R3YSCcbWQOmdYxAgsoI3gLSDF5zCokXCCedKjj
         Evq2iz9Tf7KqAm3ImSJfDudWHwqAamK9S88TbH2fNeeehlMKGVGGfcuf0fZR7lvl2Zo/
         vWraVYsG8rjuhesoLAOhFnyGVOCYYcCR1y+Ezwv1FBwOL3KXaWb5VXbTzHSOw3XJnzng
         8amYOvCTAzZYmlPhMI3d3QmpvVW0VGHy4DdkChew/FaMT3xsTbaUvPUMFqmsqnHXAVDc
         VY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739541992; x=1740146792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEH7kxAK9+ZmXauANtytyG1d26occlPJKsaRujrey7U=;
        b=RTYLdoi2QeZpjwgbUgorLEJhqC9bzw8YJt/qaftGI3p1gTtZJ8qF3qqzLjxyMiPnk0
         5hWH4WcRTMO4iHvsWruaHR6Ak+WbgAqsqINmmufb2TK6Gz+9Buph/4kHWcmvbMtPRqMX
         d5Iwx/tYWzn9lJhyy1RKPu8zndalZhhuuh+X3plDc82uIQ0jZUg6W8KQdtrX8/N+7yfR
         5ltEYt1CwnavkqBc8jGQn0QdoTu/tCiWNgkC6SRttNXkMY1RRbxsx1tw55nmc9IdMj1n
         BBLeq0oqpm/NUwdV1Gl9NfbVQmoUhYRPwcWEWBd6fH0FcaM6wF2DQ5l0vAd903Q7ys/H
         9m/w==
X-Forwarded-Encrypted: i=1; AJvYcCUqdmsK1IQHmw/Yj0j0g0kkNuRfss3W9uV+NhGkAxU7V3kHJB9s3I45FHT/vi7/1oI0mH3SS/OxeDF+h3X8pFaT@lists.infradead.org
X-Gm-Message-State: AOJu0YxrUN+hVyidpS3x5jk2JtcXXUULWxGO3b0YI0Lw//gfphU4qhsV
	wz7v4AvCYyJKdXQlgXRerYcd18HK2zNEHE1QW6FLVABPg/Aoebs42p0mpv/tyPzfNEjy6Wcxx8/
	AIkd1gC2Mk+9d4WUuCsEliFdfsIvBZwXcjKTuAm4p9qPbVZj8gyjo
X-Gm-Gg: ASbGncvK7yrQ4UFgRztGvdwEfGRQzxfzsNq89GMKas4hd/07nXXh6hQ8xhcsywazXxB
	mPaNk7nkBQLhkQWcmOvUjKiVH1GPOqhM7pDdF6bDknQbloUfOp4CaD8MxAZ4szOXWSh2qS6mF/9
	8xyXK0srDDUr5rImdblURgRwGAS98zwA0=
X-Google-Smtp-Source: AGHT+IGgudheFc12rmb5CszH99CjSQkPM4yxHyjO0/08n6JO02cAPASTLK890Oh5qe8WFCisuu3E2lS3hTJMFnEXjBU=
X-Received: by 2002:ac8:7c44:0:b0:471:aa56:729d with SMTP id
 d75a77b69052e-471beda6ddemr108215831cf.41.1739541991662; Fri, 14 Feb 2025
 06:06:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
In-Reply-To: <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
From: Crt Mori <cmo@melexis.com>
Date: Fri, 14 Feb 2025 15:05:55 +0100
X-Gm-Features: AWEUYZny0tIdXSvvlElq1tx63ScILXICUyn00MdIcgYDUGYhyft7PEs3hgkFIv4
Message-ID: <CAKv63ushEwsmFx-BP4iFV=6uof=kP3_LYhtO-RBmeBV5_TRtcw@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_060634_496361_C29ED6E6 
X-CRM114-Status: GOOD (  36.45  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Alex Elder <elder@ieee.org>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-arm-kernel@lists.infradead.org, David Laight <david.laight.linux@gmail.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, David Miller <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

It seems equivalent change, but I do not have chip nearby to do a
quick test for mlx90614 so for that part:

Acked-by: Crt Mori <cmo@melexis.com>

Thanks for your contribution.


On Fri, 14 Feb 2025 at 14:56, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant.
>
> To avoid this limitation, the AT91 clock driver and several other
> drivers already have their own non-const field_{prep,get}() macros.
> Make them available for general use by consolidating them in
> <linux/bitfield.h>, and improve them slightly:
>   1. Avoid evaluating macro parameters more than once,
>   2. Replace "ffs() - 1" by "__ffs()",
>   3. Support 64-bit use on 32-bit architectures.
>
> This is deliberately not merged into the existing FIELD_{GET,PREP}()
> macros, as people expressed the desire to keep stricter variants for
> increased safety, or for performance critical paths.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> v3:
>   - Add Acked-by,
>   - Drop underscores from macro parameters,
>   - Use __auto_type where possible,
>   - Correctly cast reg to the mask type,
>   - Introduces __val and __reg intermediates to simplify the actual
>     operation,
>   - Drop unneeded parentheses,
>   - Clarify having both FIELD_{GET,PREP}() and field_{get,prep}(),
>
> v2:
>   - Cast val resp. reg to the mask type,
>   - Fix 64-bit use on 32-bit architectures,
>   - Convert new upstream users:
>       - drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c
>       - drivers/gpio/gpio-aspeed.c
>       - drivers/iio/temperature/mlx90614.c
>       - drivers/pinctrl/nuvoton/pinctrl-ma35.c
>       - sound/usb/mixer_quirks.c
>   - Convert new user queued in renesas-devel for v6.15:
>       - drivers/soc/renesas/rz-sysc.c
> ---
>  drivers/clk/at91/clk-peripheral.c             |  1 +
>  drivers/clk/at91/pmc.h                        |  3 --
>  .../qat/qat_common/adf_gen4_pm_debugfs.c      |  8 +----
>  drivers/gpio/gpio-aspeed.c                    |  5 +--
>  drivers/iio/temperature/mlx90614.c            |  5 +--
>  drivers/pinctrl/nuvoton/pinctrl-ma35.c        |  4 ---
>  drivers/soc/renesas/rz-sysc.c                 |  3 +-
>  include/linux/bitfield.h                      | 36 +++++++++++++++++++
>  sound/usb/mixer_quirks.c                      |  4 ---
>  9 files changed, 41 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
> index c173a44c800aa8cc..60208bdc3fe4797e 100644
> --- a/drivers/clk/at91/clk-peripheral.c
> +++ b/drivers/clk/at91/clk-peripheral.c
> @@ -3,6 +3,7 @@
>   *  Copyright (C) 2013 Boris BREZILLON <b.brezillon@overkiz.com>
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 4fb29ca111f7d427..3838e4f7df2d4a70 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -116,9 +116,6 @@ struct at91_clk_pms {
>         unsigned int parent;
>  };
>
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  #define ndck(a, s) (a[s - 1].id + 1)
>  #define nck(a) (a[ARRAY_SIZE(a) - 1].id + 1)
>
> diff --git a/drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c b/drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c
> index 2e4095c4c12c94f9..ebaa59e934178309 100644
> --- a/drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c
> +++ b/drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright(c) 2023 Intel Corporation */
> +#include <linux/bitfield.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/kernel.h>
>  #include <linux/string_helpers.h>
> @@ -11,13 +12,6 @@
>  #include "adf_gen4_pm.h"
>  #include "icp_qat_fw_init_admin.h"
>
> -/*
> - * This is needed because a variable is used to index the mask at
> - * pm_scnprint_table(), making it not compile time constant, so the compile
> - * asserts from FIELD_GET() or u32_get_bits() won't be fulfilled.
> - */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -
>  #define PM_INFO_MEMBER_OFF(member)     \
>         (offsetof(struct icp_qat_fw_init_admin_pm_info, member) / sizeof(u32))
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 40c1bd80f8b0434d..b45e4dd8d8e4f00a 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -5,6 +5,7 @@
>   * Joel Stanley <joel@jms.id.au>
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/gpio/aspeed.h>
>  #include <linux/gpio/driver.h>
> @@ -30,10 +31,6 @@
>  #include <linux/gpio/consumer.h>
>  #include "gpiolib.h"
>
> -/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val)        (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  #define GPIO_G7_IRQ_STS_BASE 0x100
>  #define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)
>  #define GPIO_G7_CTRL_REG_BASE 0x180
> diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature/mlx90614.c
> index 740018d4b3dfb35e..c58dc59d4f570831 100644
> --- a/drivers/iio/temperature/mlx90614.c
> +++ b/drivers/iio/temperature/mlx90614.c
> @@ -22,6 +22,7 @@
>   * the "wakeup" GPIO is not given, power management will be disabled.
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/gpio/consumer.h>
> @@ -68,10 +69,6 @@
>  #define MLX90614_CONST_SCALE 20 /* Scale in milliKelvin (0.02 * 1000) */
>  #define MLX90614_CONST_FIR 0x7 /* Fixed value for FIR part of low pass filter */
>
> -/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val)        (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  struct mlx_chip_info {
>         /* EEPROM offsets with 16-bit data, MSB first */
>         /* emissivity correction coefficient */
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> index 59c4e7c6cddea127..3ba28faa8e1418a9 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> @@ -81,10 +81,6 @@
>  #define MVOLT_1800                     0
>  #define MVOLT_3300                     1
>
> -/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val)        (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  static const char * const gpio_group_name[] = {
>         "gpioa", "gpiob", "gpioc", "gpiod", "gpioe", "gpiof", "gpiog",
>         "gpioh", "gpioi", "gpioj", "gpiok", "gpiol", "gpiom", "gpion",
> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
> index 1c98da37b7d18745..917a029d849585cd 100644
> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2024 Renesas Electronics Corp.
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -12,8 +13,6 @@
>
>  #include "rz-sysc.h"
>
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -
>  /**
>   * struct rz_sysc - RZ SYSC private data structure
>   * @base: SYSC base address
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index e8269f23b824c4a9..4f43b00cc93d2f4f 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -203,4 +203,40 @@ __MAKE_OP(64)
>  #undef __MAKE_OP
>  #undef ____MAKE_OP
>
> +/**
> + * field_prep() - prepare a bitfield element
> + * @mask: shifted mask defining the field's length and position
> + * @val:  value to put in the field
> + *
> + * field_prep() masks and shifts up the value.  The result should be
> + * combined with other fields of the bitfield using logical OR.
> + * Unlike FIELD_PREP(), @mask is not limited to a compile-time constant.
> + */
> +#define field_prep(mask, val)                                          \
> +       ({                                                              \
> +               __auto_type __mask = (mask);                            \
> +               typeof(mask) __val = (val);                             \
> +               unsigned int __shift = sizeof(mask) <= 4 ?              \
> +                                      __ffs(__mask) : __ffs64(__mask); \
> +               (__val << __shift) & __mask;    \
> +       })
> +
> +/**
> + * field_get() - extract a bitfield element
> + * @mask: shifted mask defining the field's length and position
> + * @reg:  value of entire bitfield
> + *
> + * field_get() extracts the field specified by @mask from the
> + * bitfield passed in as @reg by masking and shifting it down.
> + * Unlike FIELD_GET(), @mask is not limited to a compile-time constant.
> + */
> +#define field_get(mask, reg)                                           \
> +       ({                                                              \
> +               __auto_type __mask = (mask);                            \
> +               typeof(mask) __reg =  (reg);                            \
> +               unsigned int __shift = sizeof(mask) <= 4 ?              \
> +                                      __ffs(__mask) : __ffs64(__mask); \
> +               (__reg & __mask) >> __shift;    \
> +       })
> +
>  #endif
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index ed6127b0389fff39..5899576c915b0a7e 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -3110,10 +3110,6 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
>  #define RME_DIGIFACE_REGISTER(reg, mask) (((reg) << 16) | (mask))
>  #define RME_DIGIFACE_INVERT BIT(31)
>
> -/* Nonconst helpers */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  static int snd_rme_digiface_write_reg(struct snd_kcontrol *kcontrol, int item, u16 mask, u16 val)
>  {
>         struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
> --
> 2.43.0
>

