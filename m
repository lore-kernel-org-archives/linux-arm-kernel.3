Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE870C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KWNF2EunwCPCeuVVboVX1uolneu+r5yyv1IBQ0gWo4=; b=CqOslkOOefNl6yScU/+cJJHlf2
	0LDnSB8U/OM87CMS399+IoCIcxhIh498uYKtdl907oiN/HVMD92M58qKB4YnOK9EGXZG9ZL9LD76d
	vA5vBhLF/RBGcrnZ6uf0GgGfbpyfzxs8KJeDbEYJXIoejjPSs5EzfAB/MpyvHx+/Lzom5H3OCMqHx
	2mE7NDnUXsGZ1U668k7YZWxXOUnjXsT5fDzOFJW8sSEobmHQ7SPFV5X0Fq0xfo/lu/c1ptOzkdM4n
	an3DUVu5YlN+Bv6iSCBL7ULmpi1S1bOpfU6N/pxMLPnnb2Hqy6r/wmmwCxDv9vtWwYe/uhqbekfKY
	ZuZY0V2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdu3N-0000000B0lk-3xn7;
	Fri, 31 Jan 2025 16:39:37 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdttV-0000000Ayss-1j6c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:29:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6498843308;
	Fri, 31 Jan 2025 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738340961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7KWNF2EunwCPCeuVVboVX1uolneu+r5yyv1IBQ0gWo4=;
	b=L4UYAY7LB9GmZmq1Xeo81KykAiAeyqXyzQgKdocaa7/U8iYXucJTCelJnOzQzepP5Gd0IA
	obrRnLX14vTL98FmrBqYsH//2u3QO+vMf8glIYeM+3eJnjRwbWvA8KL0KCqVUtNdKuiW7N
	NHDwJuhk5oPe6nEF7uOivEemvGONlRPVymcAJOn9ZnPho/mr0vbKiu2FcqprAJoOTUrVD2
	UVjljAbgQFQmXnJIgYUonBakq8maFlc0ZK2KBMlCnxWTf4lMu7itNsWvZxQKPaZL4FqFKT
	ufd0E3NbTLZsL8JcgfM9iYUSGtpgSiXLMP0w1mtRtDREQlvtv8XcqWlk+LY/AA==
Date: Fri, 31 Jan 2025 17:29:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
Message-ID: <202501311629171d7df0f5@mail.local>
References: <cover.1738329458.git.geert+renesas@glider.be>
 <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeegpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepshgsohihu
 geskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehgihhovhgrnhhnihdrtggrsghiugguuhesihhnthgvlhdrtghomhdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvth
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_082926_362929_0E1299AA 
X-CRM114-Status: GOOD (  31.49  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Michael Turquette <mturquette@baylibre.com>, Jacky Huang <ychuang3@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 31/01/2025 14:46:51+0100, Geert Uytterhoeven wrote:
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
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
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
>  include/linux/bitfield.h                      | 34 +++++++++++++++++++
>  sound/usb/mixer_quirks.c                      |  4 ---
>  9 files changed, 39 insertions(+), 28 deletions(-)
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
>  	unsigned int parent;
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
>  #define PM_INFO_MEMBER_OFF(member)	\
>  	(offsetof(struct icp_qat_fw_init_admin_pm_info, member) / sizeof(u32))
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
> -#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
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
> -#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  struct mlx_chip_info {
>  	/* EEPROM offsets with 16-bit data, MSB first */
>  	/* emissivity correction coefficient */
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> index 59c4e7c6cddea127..3ba28faa8e1418a9 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> @@ -81,10 +81,6 @@
>  #define MVOLT_1800			0
>  #define MVOLT_3300			1
>  
> -/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> -#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  static const char * const gpio_group_name[] = {
>  	"gpioa", "gpiob", "gpioc", "gpiod", "gpioe", "gpiof", "gpiog",
>  	"gpioh", "gpioi", "gpioj", "gpiok", "gpiol", "gpiom", "gpion",
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
> index 63928f1732230700..c62324a9fcc81241 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -203,4 +203,38 @@ __MAKE_OP(64)
>  #undef __MAKE_OP
>  #undef ____MAKE_OP
>  
> +/**
> + * field_prep() - prepare a bitfield element
> + * @_mask: shifted mask defining the field's length and position
> + * @_val:  value to put in the field
> + *
> + * field_prep() masks and shifts up the value.  The result should be
> + * combined with other fields of the bitfield using logical OR.
> + * Unlike FIELD_PREP(), @_mask is not limited to a compile-time constant.
> + */
> +#define field_prep(_mask, _val)						\
> +	({								\
> +		typeof(_mask) __mask = (_mask);				\
> +		unsigned int __shift = sizeof(_mask) <= 4 ?		\
> +				       __ffs(__mask) : __ffs64(__mask);	\
> +		(((typeof(_mask))(_val) << __shift) & (__mask));	\
> +	})
> +
> +/**
> + * field_get() - extract a bitfield element
> + * @_mask: shifted mask defining the field's length and position
> + * @_reg:  value of entire bitfield
> + *
> + * field_get() extracts the field specified by @_mask from the
> + * bitfield passed in as @_reg by masking and shifting it down.
> + * Unlike FIELD_GET(), @_mask is not limited to a compile-time constant.
> + */
> +#define field_get(_mask, _reg)						\
> +	({								\
> +		typeof(_mask) __mask = _mask;				\
> +		unsigned int __shift = sizeof(_mask) <= 4 ?		\
> +				       __ffs(__mask) : __ffs64(__mask);	\
> +		(typeof(_mask))(((_reg) & (__mask)) >> __shift);	\
> +	})
> +
>  #endif
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 23fcd680167d0298..00ab811e4b11a573 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -3109,10 +3109,6 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
>  #define RME_DIGIFACE_REGISTER(reg, mask) (((reg) << 16) | (mask))
>  #define RME_DIGIFACE_INVERT BIT(31)
>  
> -/* Nonconst helpers */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  static int snd_rme_digiface_write_reg(struct snd_kcontrol *kcontrol, int item, u16 mask, u16 val)
>  {
>  	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

