Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A01D2D8DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxoRKP/9ik7+E/PSp+BrKqN9dYDwqzX7Dh/aZsclUrc=; b=C1pYncyyGQDaVog7eVkh4ZdqZV
	QVx1PlYxOZ8oLrKYTrB3AkxWg07jseaevoAWqKZUxuGy88ULfI2ZP6yXINeJJm09r+oQ6J1qLQhBU
	CDFVkwkUbv23rj/T0z2rKTw0hEdXUzdigd/gmV5X8RJTsLW9wQ61k11LghDf40mzLVYr/ttPWiJHh
	x4WLiAk2e+S0+XZuyviS/fcqm2XIB76sRXHgU6AO5MwL9j0/ZuSFw+X7s5z0FxYzDZYWiIqAOMJ3W
	+6bfNSqJNJGjSOPt6GFodcgRXzsBE0znzvK10uNT3prh/tTQw1z1IkLcrXD9hCh1wyqpOdV+QIWVV
	OASDX6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfm9-0000000E0Cq-1GCP;
	Tue, 27 Jan 2026 09:54:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfm7-0000000E0CJ-3ite
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:54:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35B6C60121
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE00C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507658;
	bh=q3on6zXQlBcRn83TcC1mwoIQdTfMogS1m+JCEdUOHdg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Y71pTci0EjTGFJ+17jWEY3ALZsrA0hDYdPNhwdylD5HwngCaNN6HwpaBESJ993iMH
	 2VFwIFKLpavpmgE63XyFPf9yStBsV6XqGnJ0vQydWsmQ58KHHvc5qAunKB/ZJFO6oR
	 WVos88dm04eyS8KdpsxCgGdF2lFLQCB1+7w0PVqCTrqDLkP3vKHuSUSiadnVRDJWdE
	 LEU9Hn+Rh4s3Bm4F8GJ0z69DyevwmY7QLh/CmPJcLRj3ExDQ9HX6v+mfgkhj0BT0w5
	 oLwFu0qjLZNBLRHQosGF3WO/SmXLDPyUTqGAmXs0U0EWmnWgKQkT7+cCuBvNlfpMXd
	 f2sKvbTV4FKhA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b6d5bd575so5579382e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:54:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIRHZQDLw+0jKRSwN1nmVtXrDKhcPz9qiAc2mCiE59J4eVGINX9BCn/nsz1wfFR5HHDEp0/9mTRPfgzFagfI5K@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ8nGA/S7DO7Mbmi8d2rKL9NkV/TMPSPI1/MQyt0D7Gp+ae4B6
	ngHDQM+TWOLTuswdHs7/9+AeSDgvgFB9qnLk1IEv0HnZm89+0zKtATS9pY4YZSJtI6KTd7e+TYr
	snPFQoGbyIE90YVuLUXilMp6xM/Vrm+prg24fQTNqyA==
X-Received: by 2002:ac2:4f07:0:b0:59d:e350:3c45 with SMTP id
 2adb3069b0e04-59e0412c85dmr497277e87.52.1769507657517; Tue, 27 Jan 2026
 01:54:17 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:54:15 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:54:15 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-4-9f4c00bfb5cb@bootlin.com>
MIME-Version: 1.0
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com> <20260123-dev-b4-aaeon-mcu-driver-v2-4-9f4c00bfb5cb@bootlin.com>
Date: Tue, 27 Jan 2026 01:54:15 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mf_=PY6QL8fA7v0GQPA-m6dEfyPYv9pm84_z_EF5Yewbw@mail.gmail.com>
X-Gm-Features: AZwV_Qj8CKcS1FFb3PqQsuTgXOVMPEaGS00ey8cIdqqL78URlgFTGWvnaXxD5qA
Message-ID: <CAMRc=Mf_=PY6QL8fA7v0GQPA-m6dEfyPYv9pm84_z_EF5Yewbw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 23 Jan 2026 10:54:33 +0100, "Thomas Perrot (Schneider
Electric)" <thomas.perrot@bootlin.com> said:
> Add GPIO driver for the Aaeon SRG-IMX8PL embedded controller. This
> driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
> that can be configured as inputs or outputs.
>
> The driver implements proper state management for GPO pins (which are
> output-only) and full direction control for GPIO pins. During probe,
> all pins are reset to a known state (GPOs low, GPIOs as inputs) to
> prevent undefined behavior across system reboots, as the MCU does not
> reset GPIO states on soft reboot.
>
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/gpio/Kconfig          |  10 ++
>  drivers/gpio/Makefile         |   1 +
>  drivers/gpio/gpio-aaeon-mcu.c | 238 ++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 250 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 175c1e1b28b8151580ed340207d4a6fd59aa8853..28dd964cdf69bdcaec3eb82d6=
df851a2bad47415 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -191,6 +191,7 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
>  R:	J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
> +F:	drivers/gpio/gpio-aaeon-mcu.c
>  F:	drivers/mfd/aaeon-mcu.c
>  F:	include/linux/mfd/aaeon-mcu.h
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c74da29253e810b51540684b1186e8f274066b69..6142d50b92b3d8c1fac8b0d81=
397dc22428fbb51 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -157,6 +157,16 @@ config GPIO_74XX_MMIO
>  	    8 bits:	74244 (Input), 74273 (Output)
>  	    16 bits:	741624 (Input), 7416374 (Output)
>
> +config GPIO_AAEON_MCU
> +	tristate "Aaeon MCU GPIO support"
> +	depends on MFD_AAEON_MCU

Can you add support for COMPILE_TEST here and in the MFD part?

> +	select GPIO_GENERIC
> +	help
> +	  Select this option to enable GPIO support for the Aaeon SRG-IMX8PL
> +	  onboard MCU. This driver provides access to GPIO pins and GPO
> +	  (General Purpose Output) pins controlled by the microcontroller.
> +	  The driver handles both input and output configuration.
> +
>  config GPIO_ALTERA
>  	tristate "Altera GPIO"
>  	select GPIOLIB_IRQCHIP
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 2421a8fd3733e0b06c2581262aaa9cd629f66c7d..1ba6318bc558743fbe5910966=
c2c8fc3f792efe9 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+=3D gpio-104-idi-48.o
>  obj-$(CONFIG_GPIO_104_IDIO_16)		+=3D gpio-104-idio-16.o
>  obj-$(CONFIG_GPIO_74X164)		+=3D gpio-74x164.o
>  obj-$(CONFIG_GPIO_74XX_MMIO)		+=3D gpio-74xx-mmio.o
> +obj-$(CONFIG_GPIO_AAEON_MCU)		+=3D gpio-aaeon-mcu.o
>  obj-$(CONFIG_GPIO_ADNP)			+=3D gpio-adnp.o
>  obj-$(CONFIG_GPIO_ADP5520)		+=3D gpio-adp5520.o
>  obj-$(CONFIG_GPIO_ADP5585)		+=3D gpio-adp5585.o
> diff --git a/drivers/gpio/gpio-aaeon-mcu.c b/drivers/gpio/gpio-aaeon-mcu.=
c
> new file mode 100644
> index 0000000000000000000000000000000000000000..533eaf3e7f82f3b9e3f50a1a6=
31c8e853adc1226
> --- /dev/null
> +++ b/drivers/gpio/gpio-aaeon-mcu.c
> @@ -0,0 +1,238 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU GPIO driver
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.co=
m>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define AAEON_MCU_CONFIG_GPIO_INPUT 0x69
> +#define AAEON_MCU_CONFIG_GPIO_OUTPUT 0x6F
> +#define AAEON_MCU_READ_GPIO 0x72
> +#define AAEON_MCU_WRITE_GPIO 0x77
> +
> +#define AAEON_MCU_CONTROL_GPO 0x6C
> +
> +#define MAX_GPIOS 12
> +#define MAX_GPOS 7
> +
> +struct aaeon_mcu_gpio {
> +	struct gpio_chip gc;
> +	struct device *dev;
> +	DECLARE_BITMAP(dir_in, MAX_GPOS + MAX_GPIOS);
> +	DECLARE_BITMAP(gpo_state, MAX_GPOS);
> +};
> +
> +static int aaeon_mcu_gpio_config_input_cmd(struct aaeon_mcu_gpio *data,
> +					    unsigned int offset)
> +{
> +	u8 cmd[3], rsp;
> +
> +	cmd[0] =3D AAEON_MCU_CONFIG_GPIO_INPUT;
> +	cmd[1] =3D offset - 7;
> +	cmd[2] =3D 0x00;
> +
> +	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_gpio_direction_input(struct gpio_chip *gc, unsigned=
 int offset)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	if (offset < MAX_GPOS) {
> +		dev_err(gc->parent, "GPIO offset (%d) must be an output GPO\n", offset=
);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret =3D aaeon_mcu_gpio_config_input_cmd(data, offset);
> +	if (ret < 0)
> +		return ret;
> +
> +	__set_bit(offset, data->dir_in);
> +
> +	return 0;
> +}
> +
> +static int aaeon_mcu_gpio_config_output_cmd(struct aaeon_mcu_gpio *data,
> +					     unsigned int offset,
> +					     int value)
> +{
> +	u8 cmd[3], rsp;
> +	int ret;
> +
> +	cmd[0] =3D AAEON_MCU_CONFIG_GPIO_OUTPUT;
> +	cmd[1] =3D offset - 7;
> +	cmd[2] =3D 0x00;
> +
> +	ret =3D aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	cmd[0] =3D AAEON_MCU_WRITE_GPIO;
> +	/* cmd[1] =3D offset - 7; */
> +	cmd[2] =3D !!value;
> +
> +	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_gpio_direction_output(struct gpio_chip *gc, unsigne=
d int offset, int value)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	if (offset < MAX_GPOS)
> +		return 0;
> +
> +	ret =3D aaeon_mcu_gpio_config_output_cmd(data, offset, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	__clear_bit(offset, data->dir_in);
> +
> +	return 0;
> +}
> +
> +static int aaeon_mcu_gpio_get_direction(struct gpio_chip *gc, unsigned i=
nt offset)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +
> +	return test_bit(offset, data->dir_in) ?
> +		GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int aaeon_mcu_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +	u8 cmd[3], rsp;
> +	int ret;
> +
> +	if (offset < MAX_GPOS)
> +		return test_bit(offset, data->gpo_state);
> +
> +	cmd[0] =3D AAEON_MCU_READ_GPIO;
> +	cmd[1] =3D offset - 7;
> +	cmd[2] =3D 0x00;
> +
> +	ret =3D aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	return rsp;
> +}
> +
> +static int aaeon_mcu_gpo_set_cmd(struct aaeon_mcu_gpio *data, unsigned i=
nt offset, int value)
> +{
> +	u8 cmd[3], rsp;
> +
> +	cmd[0] =3D AAEON_MCU_CONTROL_GPO;
> +	cmd[1] =3D offset + 1;
> +	cmd[2] =3D !!value;
> +
> +	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_gpio_set_cmd(struct aaeon_mcu_gpio *data, unsigned =
int offset, int value)
> +{
> +	u8 cmd[3], rsp;
> +
> +	cmd[0] =3D AAEON_MCU_WRITE_GPIO;
> +	cmd[1] =3D offset - 7;
> +	cmd[2] =3D !!value;
> +
> +	return aaeon_mcu_i2c_xfer(data->dev, cmd, 3, &rsp, 1);
> +}
> +
> +static int aaeon_mcu_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +			      int value)
> +{
> +	struct aaeon_mcu_gpio *data =3D gpiochip_get_data(gc);
> +
> +	if (offset >=3D MAX_GPOS)
> +		return aaeon_mcu_gpio_set_cmd(data, offset, value);
> +
> +	if (aaeon_mcu_gpo_set_cmd(data, offset, value) =3D=3D 0)
> +		__assign_bit(offset, data->gpo_state, value);
> +
> +	return 0;
> +}
> +
> +static const struct gpio_chip aaeon_mcu_chip =3D {
> +	.label			=3D "gpio-aaeon-mcu",
> +	.owner			=3D THIS_MODULE,
> +	.get_direction		=3D aaeon_mcu_gpio_get_direction,
> +	.direction_input	=3D aaeon_mcu_gpio_direction_input,
> +	.direction_output	=3D aaeon_mcu_gpio_direction_output,
> +	.get			=3D aaeon_mcu_gpio_get,
> +	.set			=3D aaeon_mcu_gpio_set,
> +	.base			=3D -1,
> +	.ngpio			=3D MAX_GPOS + MAX_GPIOS,
> +	.can_sleep		=3D true,
> +};
> +
> +static void aaeon_mcu_gpio_reset(struct aaeon_mcu_gpio *data, struct dev=
ice *dev)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	/* Reset all GPOs */
> +	for (i =3D 0; i < MAX_GPOS; i++) {
> +		ret =3D aaeon_mcu_gpo_set_cmd(data, i, 0);
> +		if (ret < 0)
> +			dev_warn(dev, "Failed to reset GPO %u state: %d\n", i, ret);
> +		__clear_bit(i, data->dir_in);
> +	}
> +
> +	/* Reset all GPIOs */
> +	for (i =3D MAX_GPOS; i < MAX_GPOS + MAX_GPIOS; i++) {
> +		ret =3D aaeon_mcu_gpio_config_input_cmd(data, i);
> +		if (ret < 0)
> +			dev_warn(dev, "Failed to reset GPIO %u state: %d\n", i, ret);
> +		__set_bit(i, data->dir_in);
> +	}
> +}
> +
> +static int aaeon_mcu_gpio_probe(struct platform_device *pdev)
> +{
> +	struct aaeon_mcu_gpio *data;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev =3D pdev->dev.parent;
> +	data->gc =3D aaeon_mcu_chip;
> +	data->gc.parent =3D data->dev;
> +
> +	/*
> +	 * Reset all GPIO states to a known configuration. The MCU does not
> +	 * reset GPIO state on soft reboot, only on power cycle (hard reboot).
> +	 * Without this reset, GPIOs would retain their previous state across
> +	 * reboots, which could lead to unexpected behavior.
> +	 */
> +	aaeon_mcu_gpio_reset(data, &pdev->dev);
> +
> +	return devm_gpiochip_add_data(&pdev->dev, &data->gc, data);
> +}
> +
> +static struct platform_driver aaeon_mcu_gpio_driver =3D {
> +	.driver =3D {
> +		.name =3D "aaeon-mcu-gpio",
> +	},
> +	.probe =3D aaeon_mcu_gpio_probe,
> +};
> +

Drop the newline.

> +module_platform_driver(aaeon_mcu_gpio_driver);
> +
> +MODULE_DESCRIPTION("GPIO interface for Aaeon MCU");
> +MODULE_AUTHOR("J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootli=
n.com>");
> +MODULE_LICENSE("GPL");
>
> --
> 2.52.0
>
>

Looks pretty good, just some nits.

Bartosz

