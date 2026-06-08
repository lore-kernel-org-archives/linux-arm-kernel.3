Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E706BCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6rLz19GV55l5tqoQrBtMaqb4H3JquZfolkQprG3C7E=; b=Fd0CLFvtMSqRkFqAGi01+BrJoi
	WS7S/vEmLBqaADPqfHCFEB/Kj8mpfkC+FX+PbGK0mEfEKdOL9XMUCqafbxOLTaiUCGbOqf/4Hf9GS
	PszVzYw4qj7vOZiwbPVMysB67vkDqPmKMzj3v11bf+uf0BUP+L0Zqz1I4eQ5RL0owYMSaNa8JblP5
	1pg+4aQlvcqeMrel+GVUvv+Ev9TeYYl9pDexlDsJ4Dwpj+Jptd25OSwB5P4zHTiQ+iWK2Q0ZdWJr3
	8AECA/gV5o6eRZhIxrJooiY2RFvUIPcEjIKjpnxkyxSzmPd2L64LWdFk2O6UD7Mouc454O62q9ICF
	+hF84LDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYXD-00000003T2V-2Pi2;
	Mon, 08 Jun 2026 11:52:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYXC-00000003T2B-0OU0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 11:52:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C525445C5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 11:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8E61F00A0E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780919569;
	bh=z6rLz19GV55l5tqoQrBtMaqb4H3JquZfolkQprG3C7E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ITNvr7rW9BCPitMhyGOOB6UEoEKMpaFgkQNB0bKW+S1zwzomS7c65S0OToVr3AAxP
	 QqiDFYxUqYBvfU5W4dCEB3V8J7AKpKU7ruXSS9blwizqO66SCb1qwsSLjgBdh13gmw
	 22/cxqjaMjv2SGtx5AzOyCTR6XhBAt1T3RjrXUrJHiisOlrcwrTk2VWY52i5JNljsM
	 s38QDcTPPYoTDltsaLASvhVBTitfDaKeHrpf/DOiX+RwX+e4MXPOb9ZnPskNv3qbsH
	 j4ji3RI5CTJr4zxRnQrMnQLnohNVvt7eBUkwKUeJqAcOWYyi2euPq4xR+KMCiGQDeI
	 geVbiG5u6I9KQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3967738c801so35961471fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 04:52:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ86tVNDRtFAEo3Aoz3G7UihOpPwLR8/1s7zxlqyf79Yu0zrB4rVO7pO9wIY6bIJwhLsN4tYQVh5R6KUQj+66gJi@lists.infradead.org
X-Gm-Message-State: AOJu0YwDBCpGN6yC/R+RYnDunsP6FAmzr92MLLwApdlQzwxUazQiS4pI
	sMS3czcQ8pJA9FPImwPU6LmZuufxYBcSWBESxJlb/HeAfm/0S6WfcyrS+f0mfQv4mD7pWFQ1iun
	aNGcJGxAiouSVgviWe6me8eXKTEd9tfkqfCQ7rigriQ==
X-Received: by 2002:a05:6512:65d7:b0:5aa:6eb4:fead with SMTP id
 2adb3069b0e04-5aa87c393b2mr2637859e87.34.1780919567433; Mon, 08 Jun 2026
 04:52:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:52:45 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:52:45 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260605010022.968612-13-elder@riscstar.com>
MIME-Version: 1.0
References: <20260605010022.968612-1-elder@riscstar.com> <20260605010022.968612-13-elder@riscstar.com>
Date: Mon, 8 Jun 2026 04:52:45 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf4MgnSoKbrtVxDJOzYntPZPenYYde1STN-GajCU_NLBg@mail.gmail.com>
X-Gm-Features: AVVi8Cfce9S2I3CO2iQ2lxXhAb9TU9oc8tjgmzM5jX_8w_OZsxuiuwaNEuhyNWM
Message-ID: <CAMRc=Mf4MgnSoKbrtVxDJOzYntPZPenYYde1STN-GajCU_NLBg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 12/14] gpio: tc956x: add TC956x/QPS615 support
To: Alex Elder <elder@riscstar.com>
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, 
	alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com, 
	chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com, 
	john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com, 
	mcoquelin.stm32@gmail.com, me@ziyao.cc, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com, 
	rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn, 
	weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 5 Jun 2026 03:00:19 +0200, Alex Elder <elder@riscstar.com> said:
> Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially
> a small and highly-specialized SoC.  TC956x includes a GPIO block that
> can be accessed, alongside several other peripherals, via two PCIe
> endpoint functions.  The PCIe function driver creates an auxiliary
> device for the GPIO block, and that device gets bound to this auxiliary
> device driver.
>
> This driver is implemented using the generic regmap-based GPIO driver.
>
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/gpio/Kconfig       |  12 ++++
>  drivers/gpio/Makefile      |   1 +
>  drivers/gpio/gpio-tc956x.c | 130 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 144 insertions(+)
>  create mode 100644 drivers/gpio/gpio-tc956x.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0924f7ec43cb0..0439607d1155f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27057,6 +27057,7 @@ M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> +F:	drivers/gpio/gpio-tc956x.c
>  F:	drivers/misc/tc956x_pci.c
>
>  TOSHIBA WMI HOTKEYS DRIVER
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 020e51e30317a..36631ca722fa3 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -743,6 +743,18 @@ config GPIO_TB10X
>  	select GPIO_GENERIC
>  	select GENERIC_IRQ_CHIP
>
> +config GPIO_TC956X
> +	tristate "Toshiba TC956X GPIO support"
> +	depends on TOSHIBA_TC956X_PCI
> +	select GPIO_REGMAP
> +	default m
> +	help
> +	  This enables support for the GPIO controller embedded in the Toshiba
> +	  TC956X (and Qualcomm QPS615).  This device connects to the host
> +	  via PCIe port, which is the upstream port on an internal PCIe
> +	  switch.  On some platforms, a few of the GPIO lines are used to
> +	  manage external resets.
> +
>  config GPIO_TEGRA
>  	tristate "NVIDIA Tegra GPIO support"
>  	default ARCH_TEGRA
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index b267598b517de..c3584e7cba9b4 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -178,6 +178,7 @@ obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
>  obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
>  obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
>  obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
> +obj-$(CONFIG_GPIO_TC956X)		+= gpio-tc956x.o
>  obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
>  obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
>  obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
> diff --git a/drivers/gpio/gpio-tc956x.c b/drivers/gpio/gpio-tc956x.c
> new file mode 100644
> index 0000000000000..0dc6b1028d970
> --- /dev/null
> +++ b/drivers/gpio/gpio-tc956x.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
> + */
> +
> +/*
> + * The Toshiba TC956X implements a PCIe Gen 3 switch that connects an
> + * upstream x4 port to two downstream PCIe x2 ports.  It incorporates
> + * an internal endpoint on a internal PCIe port that implements two
> + * Synopsys XGMAC Ethernet interfaces.
> + *
> + * 35 GPIOs are also implemented by an embedded GPIO controller.  Three
> + * registers control the first 32 GPIOs (other than 20 and 21, which are
> + * reserved).  Three other registers control GPIOs 32 through 36. GPIOs
> + * 22-24, 27-28, 31, and 34 are treated as "input only".
> + *
> + * There is a TC956X PCI power controller driver that accesses the
> + * direction and output value registers for GPIOs 2 and 3.  These
> + * GPIOs control the reset signal for the two downstream PCIe ports.
> + * Their values will never change during operation of this driver, and
> + * this driver reserves these two GPIOS.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/gpio/regmap.h>
> +
> +#define DRIVER_NAME		"tc956x-gpio"
> +
> +#define TC956X_GPIO_COUNT	37	/* Number of GPIOs (20-21 reserved) */
> +
> +/* The GPIO offsets are relative to 0x1200 in TC956X SFR space. */
> +#define GPIO_IN0_OFFSET		0x00		/* Input value (0-31) */
> +#define GPIO_EN0_OFFSET		0x08		/* 0: out; 1: in (0-31) */
> +#define GPIO_OUT0_OFFSET	0x10		/* Output value (0-31) */
> +
> +/*
> + * There are two sets of registers, each representing (up to) 32 GPIOs with a
> + * stride of 4 bytes (IN1 is 4 bytes past IN0, EN1 is 4 bytes past EN0, etc.).
> + */
> +#define GPIO_PER_REG		32
> +#define GPIO_REG_STRIDE		4
> +
> +static int tc956x_gpio_init_valid_mask(struct gpio_chip *gc,
> +				       unsigned long *valid_mask,
> +				       unsigned int ngpios)
> +{
> +	/*
> +	 * GPIOs 2 and 3 are used by the PCI power control driver, and
> +	 * we don't allow them to be used.  GPIOs 20 and 21 are reserved
> +	 * (and not usable).
> +	 */
> +	bitmap_fill(valid_mask, ngpios);
> +	bitmap_clear(valid_mask, 2, 2);
> +	bitmap_clear(valid_mask, 20, 2);
> +
> +	return 0;
> +}
> +
> +static int tc956x_gpio_probe(struct auxiliary_device *adev,
> +			     const struct auxiliary_device_id *id)
> +{
> +	DECLARE_BITMAP(zeroes, TC956X_GPIO_COUNT);
> +	DECLARE_BITMAP(fixed, TC956X_GPIO_COUNT);
> +	struct gpio_regmap_config config = { };
> +	struct gpio_regmap *gpio_regmap;
> +	struct device *dev = &adev->dev;
> +
> +	/* We need the regmap pointer, stored in our platform data */
> +	if (!dev->platform_data)
> +		return -EINVAL;

Please use the standardized accessor: dev_get_platdata().

> +
> +	/*
> +	 * Only some of our GPIOs are fixed direction:
> +	 *	22, 23, 24, 27, 28, 31, and 34	(all input-only)
> +	 * Set up the fixed bitmap to indicate which are fixed.
> +	 */
> +	bitmap_zero(fixed, TC956X_GPIO_COUNT);
> +	bitmap_set(fixed, 22, 3);
> +	bitmap_set(fixed, 27, 2);
> +	set_bit(31, fixed);
> +	set_bit(34, fixed);
> +
> +	/* All fixed GPIOs are input; the zeroes bitmap indicates that. */
> +	bitmap_zero(zeroes, TC956X_GPIO_COUNT);
> +
> +	config.parent = dev;
> +	config.regmap = dev->platform_data;
> +	config.label = DRIVER_NAME;
> +	config.ngpio = TC956X_GPIO_COUNT;
> +	config.reg_dat_base = GPIO_REGMAP_ADDR(GPIO_IN0_OFFSET);
> +	config.reg_set_base = GPIO_REGMAP_ADDR(GPIO_OUT0_OFFSET);
> +	config.reg_dir_in_base = GPIO_REGMAP_ADDR(GPIO_EN0_OFFSET);
> +	config.reg_stride = GPIO_REG_STRIDE;
> +	config.ngpio_per_reg = GPIO_PER_REG;
> +	config.init_valid_mask = tc956x_gpio_init_valid_mask;
> +	config.fixed_direction_mask = fixed;
> +	config.fixed_direction_output = zeroes;

May I suggest using a compound literal here like:

	config = (struct gpio_regmap_config){
		...
	};

?

> +
> +	gpio_regmap = devm_gpio_regmap_register(dev, &config);
> +	if (IS_ERR(gpio_regmap))
> +		return PTR_ERR(gpio_regmap);
> +
> +	return 0;

You can do:

	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &config));

and save a few lines.

> +}
> +
> +static const struct auxiliary_device_id tc956x_gpio_ids[] = {
> +	{ .name = "tc956x_pci.tc9564-gpio", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, tc956x_gpio_ids);
> +
> +static struct auxiliary_driver tc956x_gpio_driver = {
> +	.name		= DRIVER_NAME,
> +	.probe          = tc956x_gpio_probe,
> +	.id_table       = tc956x_gpio_ids,
> +	.driver = {
> +		.name		= DRIVER_NAME,
> +		.owner		= THIS_MODULE,
> +		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +};
> +module_auxiliary_driver(tc956x_gpio_driver);
> +
> +MODULE_DESCRIPTION("Toshiba TC956X PCIe GPIO Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("auxiliary:" DRIVER_NAME);
> --
> 2.51.0
>
>

Bart

