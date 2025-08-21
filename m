Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015EFCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJiLgdHWROqB12Hg/2IJvH+nEqITMBBgtAb49NceKgg=; b=B8KncTWIX3izsXoUHFdCbm0WRl
	HoeUKbYDFVyMOcNbjFekb06kotKT6BeI+SqkeNEFJ0ZpY6ADGdBoRCitYI+NqeJOB95HhTe4kVNOE
	P4k2InWRYl4onSAVASU6fGogcyETWVOsEgyGtDPJ/aizjWjqKqBVv1ShiGHuVKv4+6o5ucqf2SkOq
	T5YlCpb+XfCJciaN71mOYX7muY7PRmKO0D8EwO2iactcYTzTEMFD1+IDvHEvsrxYOvAKa4OQq3Y+V
	LDa9ZQcBbBDYaDjw00zEFS18btbcjfrO2e4KWWntcWbCzmTGMLUw6Dc/LmVXpP8QfDSCAw5Xz8W3z
	NkV9qgeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3v5-0000000GpLZ-0bc6;
	Thu, 21 Aug 2025 11:57:27 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1Aq-0000000GKlO-1LC4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 09:01:33 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55ce5097493so651803e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755766890; x=1756371690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJiLgdHWROqB12Hg/2IJvH+nEqITMBBgtAb49NceKgg=;
        b=eGQj+p4G3SAysLuWzyEVovVPav5I7lCfcH8/W1yH4oPS28EI5H/qRMjOXzJAuCMbXE
         eEkgPSM9UDUYsBYp+U159wGW977cYycoSLU0y+Ty3I9nJu5fEiaX1pOjgMO6PNzngk1N
         V/ecGgh22upXv/qy+3NJ24UNOd+TQaCeEwqxPcatCoYFL6ECAV++pfhLInWnVCFfyGyR
         uyPxHi2h8YV2LEqDlGIWLW1C/wq5ZIhXrkKl8dUKntu7re5bToSdCBmFiGKrxZq7+zOE
         9yqQmLjLEXayIXj6BlEXm2KBtCT7LaGas85t4H6MkqlDDD0tNj7EY0uOuaPS/l5bqaQD
         +0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755766890; x=1756371690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJiLgdHWROqB12Hg/2IJvH+nEqITMBBgtAb49NceKgg=;
        b=fXgs/X4k3qUR0SRo6kcQoRf/7/p0T9Oc3XoBAtTvvI62D9lzru5zIe08O5DsmgKms9
         Lrn1er++AmKnQs/KlxfIbRuVJe5fH6T9VvdQIxlKJdG8S8upBEvcrZ0RcfiXmtDuxb8h
         sud1JrxjA4PK1qCtWeqWbHHRMrQVKUL+yL0xPYnZBOgNLfC2gzCfe7Bfp7e0mbckOEhd
         0J7qPHkNQlYDd7Icl9x8pBdtQ4UeDJnP/+bx6OTUuC2vbo2Tu1mHniG+EYWVV9Ezy/Pv
         s0/thkfQ3w80xsCZe4ZIbdFboQ9k3LOZDYX/5qiOStwrV30CbiNOlyCAPkPnZcNylnKK
         hfKA==
X-Forwarded-Encrypted: i=1; AJvYcCW8u53c/r0CaEuH/XPLxCiZ2VONBTxdvrVa6HBIhvuMBvHGau/u2cIALmHZ4z13FuJuKoNnqRzfCwYG8zehoSPJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxDE7XkbAJOoXAl8Cee2cDhluB5tOU/WvGLaYHLpgd9kt78wqz4
	h9hSFgX6kkP1pFksH4LqDCfvolJLEiV+HWtz/9r/ijCo9nYlQkUkWbvMU0NfKety6lPzYRDGl/J
	/OF6/C8gXE42HadNTtfT+gR6UHcldOdp6ST2OjRIw9u1zfqicIbvrh2k=
X-Gm-Gg: ASbGncsvXCWEs+RrbrdcicVf2BMc9vAZ4KowQqx7K4ZtEOz7HIqzKKCDThigqB/Kvz6
	pj/pJ/30YI9Wj0MC4BtODirO9fLbSOgMXahGpfBtZXmUKXzrVUoxYD3EhvN4F2Hl/f77dxzKnOL
	y6r3KFKistceZiHLn5qPn/sXqEHCeAsIQ4w155pLnPUpTttlQQyXstvzlFT/jOKYBh58OfOtKXE
	gUvThU=
X-Google-Smtp-Source: AGHT+IFbJnnVhn06jfVroEMIzVme3igeJ9POu+bHevjfLshjHAvocCiAi05+NyAeJQCwMuLXL3VFXUrBLqRgHDUA23A=
X-Received: by 2002:a05:651c:23c8:20b0:333:b9db:f998 with SMTP id
 38308e7fff4ca-33549e41ff2mr4529661fa.1.1755766889647; Thu, 21 Aug 2025
 02:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250818204420.794554-1-shenwei.wang@nxp.com> <20250818204420.794554-4-shenwei.wang@nxp.com>
In-Reply-To: <20250818204420.794554-4-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 11:01:17 +0200
X-Gm-Features: Ac12FXzKbO7sUD26Sno_8xmcOgjEihVR1BbLvXDJUasi5_vpoZ4AnY5gKSX69DE
Message-ID: <CACRpkdZq25n4gZSesV8z8zrBs6kqU1a8=vwVkPBwM+hFb9JKwg@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_020132_391236_26F12176 
X-CRM114-Status: GOOD (  32.15  )
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

Hi Shenwei,

thanks for your patch!

On Mon, Aug 18, 2025 at 10:45=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com=
> wrote:

> On i.MX SoCs, the system may include two processors:
>         - An MCU running an RTOS
>         - An MPU running Linux
>
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Since this is a first RPMSG GPIO driver, I'd like if Bj=C3=B6rn and/or
Mathieu have a look at it so I'm sure it is RPMSG-proper!

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a437fe652dbc..2ce4e9b5225e 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -402,6 +402,17 @@ config GPIO_ICH
>
>           If unsure, say N.
>
> +config GPIO_IMX_RPMSG
> +       tristate "NXP i.MX SoC RPMSG GPIO support"
> +       depends on IMX_REMOTEPROC && RPMSG && GPIOLIB
> +       default IMX_REMOTEPROC
> +       help
> +         Say yes here to support the RPMSG GPIO functions on i.MX SoC ba=
sed
> +         platform.  Currently supported devices: i.MX7ULP, i.MX8ULP, i.M=
X8x,
> +         and i.MX9x.
> +
> +         If unsure, say N.

This is sorted under memory-mapped GPIO, but it isn't.

Create a new submenu:

menu "RPMSG GPIO drivers"
        depends on RPMSG

And put it here as the first such driver.

No need to have a dependency on RPMSG in the GPIO_IMX_RPMSG
Kconfig entry after this.

> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/bitops.h>

bitops.h or just bits.h? Check which one you actually use.

> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/imx_rpmsg.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_qos.h>

Are you really using pm_qos?

> +#include <linux/rpmsg.h>
> +#include <linux/virtio.h>
> +#include <linux/workqueue.h>

(...)

> +struct imx_rpmsg_gpio_port {
> +       struct gpio_chip gc;
> +       struct irq_chip chip;

This irqchip doesn't look very immutable.

Look at other patches rewriting irqchips to be immutable
and break this out to a static const struct irq_chip with
IRQCHIP_IMMUTABLE set instead.

> +static int imx_rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct imx_rpmsg_gpio_port *port =3D gpiochip_get_data(gc);
> +       struct gpio_rpmsg_data *msg =3D NULL;
> +       int ret;
> +
> +       mutex_lock(&port->info.lock);

Please use guards for all the mutexes:

#include <linux/cleanup.h>

guard(mutex)(&port->info.lock);

and it will be released as you exit the function.

> +static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
> +                                         unsigned int gpio)
> +{
> +       struct imx_rpmsg_gpio_port *port =3D gpiochip_get_data(gc);
> +       struct gpio_rpmsg_data *msg =3D NULL;
> +       int ret;
> +
> +       mutex_lock(&port->info.lock);

Dito for all these instances.
(Saves you a bunch of lines!)

> +static void imx_rpmsg_irq_bus_lock(struct irq_data *d)
> +{
> +       struct imx_rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d=
);
> +
> +       mutex_lock(&port->info.lock);
> +}

Here you need to keep the classic mutex_lock() though,
because of the irqchip locking abstraction helper.

> +static struct irq_chip imx_rpmsg_irq_chip =3D {

const

> +       .irq_mask =3D imx_rpmsg_mask_irq,
> +       .irq_unmask =3D imx_rpmsg_unmask_irq,
> +       .irq_set_wake =3D imx_rpmsg_irq_set_wake,
> +       .irq_set_type =3D imx_rpmsg_irq_set_type,
> +       .irq_shutdown =3D imx_rpmsg_irq_shutdown,
> +       .irq_bus_lock =3D imx_rpmsg_irq_bus_lock,
> +       .irq_bus_sync_unlock =3D imx_rpmsg_irq_bus_sync_unlock,

        .flags =3D IRQCHIP_IMMUTABLE,

probably also:

         GPIOCHIP_IRQ_RESOURCE_HELPERS,

?

I think you want to properly mark GPIO lines as used for
IRQs!

> +static int imx_rpmsg_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio=
)
> +{
> +       struct imx_rpmsg_gpio_port *port =3D gpiochip_get_data(gc);
> +       int irq;
> +
> +       irq =3D irq_find_mapping(port->domain, gpio);
> +       if (irq > 0) {
> +               irq_set_chip_data(irq, port);
> +               irq_set_chip_and_handler(irq, &port->chip, handle_level_i=
rq);
> +       }
> +
> +       return irq;
> +}

Ugh we try to to use custom to_irq() if we can...

Do you have to?

Can't you use
select GPIOLIB_IRQCHIP
and be inspired by other chips using the irqchip
helper library?

We almost always use that these days.

> +       /* create an irq domain */
> +       port->chip =3D imx_rpmsg_irq_chip;
> +       port->chip.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gp=
io%d",
> +                                        pltdata->rproc_name, port->idx);
> +       port->dev =3D &pdev->dev;
> +
> +       irq_base =3D devm_irq_alloc_descs(&pdev->dev, -1, 0, IMX_RPMSG_GP=
IO_PER_PORT,
> +                                  numa_node_id());
> +       if (irq_base < 0) {
> +               dev_err(&pdev->dev, "Failed to alloc irq_descs\n");
> +               return irq_base;
> +       }
> +
> +       port->domain =3D irq_domain_create_legacy(of_node_to_fwnode(np),
> +                                               IMX_RPMSG_GPIO_PER_PORT,
> +                                               irq_base, 0,
> +                                               &irq_domain_simple_ops, p=
ort);
> +       if (!port->domain) {
> +               dev_err(&pdev->dev, "Failed to allocate IRQ domain\n");
> +               return -EINVAL;
> +       }

This also looks unnecessarily custom.

Try to use GPIOLIB_IRQCHIP.


> +static struct platform_driver imx_rpmsg_gpio_driver =3D {
> +       .driver =3D {
> +               .name =3D "gpio-imx-rpmsg",
> +               .of_match_table =3D imx_rpmsg_gpio_dt_ids,
> +       },
> +       .probe =3D imx_rpmsg_gpio_probe,
> +};
> +
> +static int __init gpio_imx_rpmsg_init(void)
> +{
> +       return platform_driver_register(&imx_rpmsg_gpio_driver);
> +}
> +
> +device_initcall(gpio_imx_rpmsg_init);

No please just do:

module_platform_driver(imx_rpmsg_gpio_driver);

Fix up  these things to begin with and then we can
look at details!

Yours,
Linus Walleij

