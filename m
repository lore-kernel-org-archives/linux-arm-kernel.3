Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F108CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWBbbDlf4EIwAAVhrNOPgxfdQorqL6I+zOwc8slJsqA=; b=PUcVRY9Zk3KtJEokxnjcH5gFIN
	1uq1osS8uBcxtu/ImcCBsT1IV6CcwMBJJwVRO115EeZcVup7q0w5h+Vd+5M4L8iHSjZ2dw1T7qQvY
	Smrlk6xh4rmgo1kHD25L7OMsNsxQrswwA4MldoFOfCaRLjJ4WjbjZWE/Ur9ZlZ2xFmxaGh8Qj2zgQ
	8Ukk1cFZ/hvESSFIMlr+PpwdQRODNwafz5F6CLYM59L4iFrSuXu7bwaqxJeGznfId0krLDKr+3fdg
	bQZbn6mmITBmGoTT8AvANbQcEPocq+5lnO0M5UjuVgV6/JRd5b4XB8xRKX1lOtb6yOL8L1V5Eb7Nb
	9RIzoTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKWA-000000006VA-2ZAi;
	Thu, 15 Oct 2026 12:25:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKW8-000000006UM-3h8w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:25:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1A3C43643
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F081F000C9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067102;
	bh=XWBbbDlf4EIwAAVhrNOPgxfdQorqL6I+zOwc8slJsqA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oY2H1XZyIbnqyuy9ZYrkW/bwtfEtmpmrrrPgH0gEKO4rjAbAF4Rr29YEmejrYxWkL
	 vR1qzJK9JwqSwFkWuV75Vj6fRh2/a3c5qJw3kqhSYbJ1OybRZNmmBXeu0QKcm+UwSJ
	 98U8hVMRPVTGDdXhpXuegBO/edEZfS+yzfys3I1AI/LC+PU+sCvYQvAAEfdb690GbB
	 VBJbRGyUY7ESh4zEY//CizYpMIEsoqucX4/9700sly8oG0kJMARc0x+PA3xMCkQG5e
	 vClriT9LqQzK4gxJwvP5C7xmmH6X8+3FyL3+jifzi7wEKb74FE3Z+NpFE/dJGluTJK
	 jBN7s0IqI5qRA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso4337919e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:25:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzqT/tflBwRmkOPyNjI19qEvzxtmi7Sp1CyMa2MegAA2u0U34/eVV0zrbBsZ+5+rDybjMlg9b/Is47+1tJ7bOtY@lists.infradead.org
X-Gm-Message-State: AFq9FYIFfFuDnTe4TRIs9vpSG32XWbQuPWvQQbK1cqon34NLfMKw1RiY
	9OoqA6HjFHS4pxAIgEA8l+FyGxipWOLFYGLpy3B587yR8oi77hzjxe1UUPBtWhSNTHlnZWA6z06
	hpuimASVkOzNUSGwfFW+CmWuim1LsrYlOw8aUk0/cZA==
X-Received: by 2002:a05:6512:3989:b0:5ba:37c8:a485 with SMTP id
 2adb3069b0e04-5bcde6bdfd9mr6220298e87.22.1792067101328; Thu, 15 Oct 2026
 05:25:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 12:25:00 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 12:25:00 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261014072109.1759502-9-ghahramani.navid@gmail.com>
MIME-Version: 1.0
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-9-ghahramani.navid@gmail.com>
Date: Thu, 15 Oct 2026 12:25:00 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfhnbwvM+c=e1=ga4wALCmj8Bi8LWkB_W4_0YHkK3Hikw@mail.gmail.com>
X-Gm-Features: AclHuK8GH8etn3uUshACOzvmzHuZTS1r4ysvL-52dRD2_mweQZCACUKo2mAjagE
Message-ID: <CAMRc=MfhnbwvM+c=e1=ga4wALCmj8Bi8LWkB_W4_0YHkK3Hikw@mail.gmail.com>
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, stefandoesinger@gmail.com, krzk@kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Wed, 14 Oct 2026 09:20:48 +0200, Navid Ghahremani
<ghahramani.navid@gmail.com> said:
> Expose the six banks using the generic GPIO implementation and enable
> the register clock before accessing the bank.
>
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  drivers/gpio/Kconfig          | 12 ++++++
>  drivers/gpio/Makefile         |  1 +
>  drivers/gpio/gpio-zx279128s.c | 79 +++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+)
>  create mode 100644 drivers/gpio/gpio-zx279128s.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a48586bb8e..3ae51a3c10 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -902,6 +902,18 @@ config GPIO_ZEVIO
>  	help
>  	  Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
>
> +config GPIO_ZX279128S
> +	tristate "ZTE zx279128s GPIO support"
> +	depends on ARCH_ZTE || COMPILE_TEST
> +	select GPIO_GENERIC
> +	help
> +	  Say yes here to support the GPIO controller of the ZTE zx279128s
> +	  SoC. It has several banks of 16 lines each, which boards such as
> +	  the ZTE ZXHN H3600 use for LEDs, buttons and reset lines.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called gpio-zx279128s.
> +
>  config GPIO_ZYNQ
>  	tristate "Xilinx Zynq GPIO support"
>  	depends on ARCH_ZYNQ || ARCH_ZYNQMP || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index dc9e6d643b..a57ed7ec71 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -223,5 +223,6 @@ obj-$(CONFIG_GPIO_XLP)			+= gpio-xlp.o
>  obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
>  obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
>  obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
> +obj-$(CONFIG_GPIO_ZX279128S)		+= gpio-zx279128s.o
>  obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
>  obj-$(CONFIG_GPIO_ZYNQMP_MODEPIN)	+= gpio-zynqmp-modepin.o
> diff --git a/drivers/gpio/gpio-zx279128s.c b/drivers/gpio/gpio-zx279128s.c
> new file mode 100644
> index 0000000000..71eb6b5d82
> --- /dev/null
> +++ b/drivers/gpio/gpio-zx279128s.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ZTE zx279128s GPIO controller
> + *
> + * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/generic.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +/*
> + * Each bank has 16 lines, one bit per line in each register. The registers
> + * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not supported
> + * yet.
> + */
> +#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
> +#define ZX279128S_GPIO_DATA	0x14	/* line level */
> +#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
> +#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */
> +
> +static int zx279128s_gpio_probe(struct platform_device *pdev)
> +{
> +	struct gpio_generic_chip_config config = { };

Don't initialize it here, instead...

> +	struct device *dev = &pdev->dev;
> +	struct gpio_generic_chip *chip;
> +	void __iomem *base;
> +	struct clk *clk;
> +	int ret;
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get the clock\n");
> +
> +	config.dev = dev;
> +	config.sz = 4;
> +	config.dat = base + ZX279128S_GPIO_DATA;
> +	config.set = base + ZX279128S_GPIO_SET;
> +	config.clr = base + ZX279128S_GPIO_CLEAR;
> +	config.dirout = base + ZX279128S_GPIO_DIR;
> +

... do:

	config = (struct gpio_generic_chip){
		.dev = dev,
		...
	};

> +	ret = gpio_generic_chip_init(chip, &config);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set up the GPIO chip\n");
> +
> +	chip->gc.ngpio = 16;
> +
> +	return devm_gpiochip_add_data(dev, &chip->gc, NULL);
> +}
> +
> +static const struct of_device_id zx279128s_gpio_of_match[] = {
> +	{ .compatible = "zte,zx279128s-gpio" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, zx279128s_gpio_of_match);
> +
> +static struct platform_driver zx279128s_gpio_driver = {
> +	.probe = zx279128s_gpio_probe,
> +	.driver = {
> +		.name = "zx279128s-gpio",
> +		.of_match_table = zx279128s_gpio_of_match,
> +	},
> +};
> +module_platform_driver(zx279128s_gpio_driver);
> +
> +MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
> +MODULE_DESCRIPTION("ZTE zx279128s GPIO controller driver");
> +MODULE_LICENSE("GPL");
> --
> 2.55.0
>
>

Looks pretty good, I love small drivers like this.

Bart

