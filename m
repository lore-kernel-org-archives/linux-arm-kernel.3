Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E81F10706C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WiecE7wZoyH4OSnzCC+TJtyB1Uyw4Dp8htx+PhMwA6Q=; b=4yoCfW0E6KgmYd
	/jSDGKYGTGUCHEB4+NCy/bOvKpsxD3ZDuZBPVZ/Iif1G6UbSZCHpxwXAAxkt489AUMtb5V8uO58JH
	ZwmDsEGtLxvogAvMSt3SjEWvcX+YoKd4w2eBZ36qMC68UpVqtDRT2izbDYh5CZOE8LeGsxeQMKBvY
	smcu0XIClwj2bMCT8YTkSsw0KmexSTG2RaYw8PfFNij8UP1wkfTcmcsr0J+JuGfDp7mvlaqT0mFjf
	/FbuGfPAAEseaW1raQqE3yMuzwZm3FVP7LRYvwxYCdUjJkJOpy1XWPNWATo6zex1cTPtY43+Fof56
	OzceZZg8hkS4eseS9oXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LmK-00000001j5X-12uT;
	Sat, 14 Mar 2026 09:59:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LmH-00000001j5B-0kFR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:59:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68C88444B4
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 09:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445F1C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 09:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773482364;
	bh=iMIlnN5Y2E9wgVy4sec7DazCmCKkcojnCumc6cGB4ZA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=jazvDdYfZlEviSpsFHvyK2cXSBgMLuPMEFuoz2PNUFXXx6f6hxCQ/D/rv5qRe5tLG
	 oZ7CGDldgNvAeunfk8ituGZORS6jgQQWW6xmVMnkOtWA27CAGf3nx8/bsjQ3SOr9KT
	 adtdsYRDe7E/eCjSZ8zvBONmPAPD2hAVL+hBH12A4mHah7LvZfBYjhPnBEI79/D3Xw
	 atcWViohCk5CgNShhiJ1TUwNvdYhmT5e1HOXmL/dTc8uurjlwWQGHUz7f4lEyYLYiz
	 4HIVYSpbjp5rLoQ6iuo1UTJhZWLalhgvb6APEm428VEM9CasWL67uq3bCoqCvHX0AG
	 qMr1usi0L/qvg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so24995951fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 02:59:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3cWTbThgpVfIyng+wZwFqtT0QqYAQtqYKu5mBoF0S02WR5IIX6SoprWSbGQbN8a+7HqXtGl6ln0pCtYL2rw1G@lists.infradead.org
X-Gm-Message-State: AOJu0YwUWnhscCTEIySMJcskvvecUL856GyOfzSElsMp4nqczFHLLddd
	uTOEM0jmMnSVey9azuhm/UhAy0GyAfD9ltpYl7fcLU8TYIbHJjMBQknzvWSMszOH2eXDNvJEiwr
	5FHPoqP/VnebVznQjcGOuC/C/QebQK5Q=
X-Received: by 2002:a05:651c:f02:b0:389:ef35:fb9e with SMTP id
 38308e7fff4ca-38a897a7cc8mr19004031fa.24.1773482362356; Sat, 14 Mar 2026
 02:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
In-Reply-To: <20260313000652.11470-1-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 14 Mar 2026 17:59:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v66_S44PVae0D5a5Q8DSEAWuP-LxD6gtEpgrd=vVMvZedQ@mail.gmail.com>
X-Gm-Features: AaiRm52Yxi3vOPAxJIh87MXNDuXSyTb4R1ZwBA57kopPak_fktm_q_wR8_y_mIo
Message-ID: <CAGb2v66_S44PVae0D5a5Q8DSEAWuP-LxD6gtEpgrd=vVMvZedQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_025925_271322_ADB0B441 
X-CRM114-Status: GOOD (  37.22  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 13, 2026 at 8:08=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
> register frame. So far we were instantiating one GPIO chip per pinctrl
> device, which covers multiple banks of up to 32 GPIO pins per bank. The
> GPIO numbers were set to match the absolute pin numbers, even across the
> typically two instances of the pinctrl device.
>
> Convert the GPIO part of the sunxi pinctrl over to use the gpio_generic
> framework. This alone allows to remove some sunxi specific code, which
> is replaced with the existing generic code. This will become even more
> useful with the upcoming A733 support, which adds set and clear
> registers for the output.
> As a side effect this also changes the GPIO device and number
> allocation: Each bank is now represented by its own gpio_chip, with only
> as many pins as there are actually implemented. The numbering is left up
> to the kernel (.base =3D -1).
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pinctrl/sunxi/Kconfig         |   1 +
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 245 ++++++++++++--------------
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  11 +-
>  3 files changed, 124 insertions(+), 133 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfi=
g
> index dc62eba96348e..5905810dbf398 100644
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig
> @@ -4,6 +4,7 @@ if ARCH_SUNXI
>  config PINCTRL_SUNXI
>         bool
>         select PINMUX
> +       select GPIO_GENERIC
>         select GENERIC_PINCONF
>         select GPIOLIB
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 48434292a39b5..4235f9feff00d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c

[...]

>  static int sunxi_pinctrl_gpio_to_irq(struct gpio_chip *chip, unsigned of=
fset)
>  {
>         struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
>         struct sunxi_desc_function *desc;
> -       unsigned pinnum =3D pctl->desc->pin_base + offset;
> -       unsigned irqnum;
> +       unsigned int pinnum, irqnum, i;
>
>         if (offset >=3D chip->ngpio)
>                 return -ENXIO;
>
> +       for (i =3D 0; i < SUNXI_PINCTRL_MAX_BANKS; i++)
> +               if (pctl->banks[i].chip.gc.base =3D=3D chip->base)

Can't you simply compare the instance?

    if (&pctl->bankd[i].chip.gc =3D=3D chip)

> +                       break;
> +       if (i =3D=3D SUNXI_PINCTRL_MAX_BANKS)
> +               return -EINVAL;
> +       pinnum =3D pctl->desc->pin_base + i * PINS_PER_BANK + offset;
> +
>         desc =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pinnum, "i=
rq");
>         if (!desc)
>                 return -EINVAL;
> @@ -1039,18 +952,19 @@ static int sunxi_pinctrl_irq_request_resources(str=
uct irq_data *d)
>  {
>         struct sunxi_pinctrl *pctl =3D irq_data_get_irq_chip_data(d);
>         struct sunxi_desc_function *func;
> -       int ret;
> +       int pinnum =3D pctl->irq_array[d->hwirq], ret;
> +       int bank =3D (pinnum - pctl->desc->pin_base) / PINS_PER_BANK;
>
> -       func =3D sunxi_pinctrl_desc_find_function_by_pin(pctl,
> -                                       pctl->irq_array[d->hwirq], "irq")=
;
> +       func =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pinnum, "i=
rq");
>         if (!func)
>                 return -EINVAL;
>
> -       ret =3D gpiochip_lock_as_irq(pctl->chip,
> -                       pctl->irq_array[d->hwirq] - pctl->desc->pin_base)=
;
> +       ret =3D gpiochip_lock_as_irq(&pctl->banks[bank].chip.gc,
> +                                  d->hwirq % IRQ_PER_BANK);
>         if (ret) {
>                 dev_err(pctl->dev, "unable to lock HW IRQ %lu for IRQ\n",
>                         irqd_to_hwirq(d));
> +
>                 return ret;
>         }
>
> @@ -1063,9 +977,10 @@ static int sunxi_pinctrl_irq_request_resources(stru=
ct irq_data *d)
>  static void sunxi_pinctrl_irq_release_resources(struct irq_data *d)
>  {
>         struct sunxi_pinctrl *pctl =3D irq_data_get_irq_chip_data(d);
> +       int pinnum =3D pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
> +       struct gpio_chip *gc =3D &pctl->banks[pinnum / PINS_PER_BANK].chi=
p.gc;
>
> -       gpiochip_unlock_as_irq(pctl->chip,
> -                             pctl->irq_array[d->hwirq] - pctl->desc->pin=
_base);
> +       gpiochip_unlock_as_irq(gc, pinnum);
>  }
>
>  static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned int t=
ype)
> @@ -1493,6 +1408,84 @@ static int sunxi_pinctrl_setup_debounce(struct sun=
xi_pinctrl *pctl,
>         return 0;
>  }
>
> +static bool sunxi_of_node_instance_match(struct gpio_chip *chip, unsigne=
d int i)
> +{
> +       struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> +
> +       if (i >=3D SUNXI_PINCTRL_MAX_BANKS)
> +               return false;
> +
> +       return (chip->base =3D=3D pctl->banks[i].chip.gc.base);

Same here.

> +}
> +
> +static int sunxi_num_pins_of_bank(struct sunxi_pinctrl *pctl, int bank)

IMHO num_pins_in_bank would be better.

And I think having a comment above saying this returns the *actual* number
of valid pins would help.

Or just call it sunxi_num_valid_pins_in_bank?

> +{
> +       int max =3D -1, i;
> +
> +       for (i =3D 0; i < pctl->desc->npins; i++) {
> +               int pinnum =3D pctl->desc->pins[i].pin.number - pctl->des=
c->pin_base;
> +
> +               if (pinnum / PINS_PER_BANK < bank)
> +                       continue;
> +               if (pinnum / PINS_PER_BANK > bank)
> +                       break;
> +               if (pinnum % PINS_PER_BANK > max)
> +                       max =3D pinnum % PINS_PER_BANK;

This doesn't work for existing sun5i platforms, which have pins non-existen=
t
on some variants, so we end up with holes in each bank.

Instead we have to actually calculate the number of valid pins.

> +       }
> +
> +       return max + 1;
> +}
> +
> +static int sunxi_gpio_add_bank(struct sunxi_pinctrl *pctl, int index)
> +{
> +       char bank_name =3D 'A' + index + pctl->desc->pin_base / PINS_PER_=
BANK;
> +       struct sunxi_gpio_bank *bank =3D &pctl->banks[index];
> +       struct gpio_generic_chip_config config;
> +       struct gpio_chip *gc =3D &bank->chip.gc;
> +       int ngpio, ret;
> +
> +       ngpio =3D sunxi_num_pins_of_bank(pctl, index);
> +       bank->pctl =3D pctl;
> +       bank->base =3D pctl->membase + index * pctl->bank_mem_size;
> +       if (!ngpio) {
> +               gc->owner =3D THIS_MODULE;
> +               gc->ngpio =3D 0;
> +               gc->base =3D -1;
> +               gc->of_gpio_n_cells =3D 3;
> +
> +               return 0;
> +       }
> +
> +       config =3D (struct gpio_generic_chip_config) {
> +               .dev =3D pctl->dev,
> +               .sz =3D 4,
> +               .dat =3D bank->base + DATA_REGS_OFFSET,
> +               .set =3D bank->base + DATA_REGS_OFFSET,
> +               .clr =3D NULL,
> +               .flags =3D GPIO_GENERIC_READ_OUTPUT_REG_SET |
> +                        GPIO_GENERIC_PINCTRL_BACKEND,
> +       };
> +
> +       ret =3D gpio_generic_chip_init(&bank->chip, &config);
> +       if (ret)
> +               return dev_err_probe(pctl->dev, ret,
> +                                    "failed to init generic gpio chip\n"=
);

Generic GPIO assumes that the GPIO pin range starts from 0, and is contiguo=
us.
This breaks down with the sun5i and sun6i families. For example, on the A31=
s,
there is no PC16 ~ PC23, nor PH0 ~ PH8, just to show a few.

> +       gc->owner               =3D THIS_MODULE;
> +       gc->label               =3D devm_kasprintf(pctl->dev, GFP_KERNEL,
> +                                                "%s-P%c", gc->label,
> +                                                bank_name);
> +       gc->ngpio               =3D ngpio;

Also set gc->offset?

> +       gc->base                =3D -1;
> +       gc->of_gpio_n_cells     =3D 3;
> +       gc->of_node_instance_match =3D sunxi_of_node_instance_match;
> +       gc->set_config          =3D gpiochip_generic_config;
> +       gc->to_irq              =3D sunxi_pinctrl_gpio_to_irq;
> +       gc->can_sleep           =3D false;
> +
> +       return gpiochip_add_data(gc, pctl);

Can we switch to devm_gpiochip_add_data() instead? It simplifies the
teardown as well.

> +}
> +
>  int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>                                   const struct sunxi_pinctrl_desc *desc,
>                                   unsigned long flags)
> @@ -1503,6 +1496,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>         struct sunxi_pinctrl *pctl;
>         struct pinmux_ops *pmxops;
>         int i, ret, last_pin, pin_idx;
> +       int gpio_banks;
>         struct clk *clk;
>
>         pctl =3D devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
> @@ -1590,38 +1584,23 @@ int sunxi_pinctrl_init_with_flags(struct platform=
_device *pdev,
>                 return PTR_ERR(pctl->pctl_dev);
>         }
>
> -       pctl->chip =3D devm_kzalloc(&pdev->dev, sizeof(*pctl->chip), GFP_=
KERNEL);
> -       if (!pctl->chip)
> -               return -ENOMEM;
> -
> -       last_pin =3D pctl->desc->pins[pctl->desc->npins - 1].pin.number;
> -       pctl->chip->owner =3D THIS_MODULE;
> -       pctl->chip->request =3D gpiochip_generic_request;
> -       pctl->chip->free =3D gpiochip_generic_free;
> -       pctl->chip->set_config =3D gpiochip_generic_config;
> -       pctl->chip->direction_input =3D sunxi_pinctrl_gpio_direction_inpu=
t;
> -       pctl->chip->direction_output =3D sunxi_pinctrl_gpio_direction_out=
put;
> -       pctl->chip->get =3D sunxi_pinctrl_gpio_get;
> -       pctl->chip->set =3D sunxi_pinctrl_gpio_set;
> -       pctl->chip->of_xlate =3D sunxi_pinctrl_gpio_of_xlate;
> -       pctl->chip->to_irq =3D sunxi_pinctrl_gpio_to_irq;
> -       pctl->chip->of_gpio_n_cells =3D 3;
> -       pctl->chip->can_sleep =3D false;
> -       pctl->chip->ngpio =3D round_up(last_pin, PINS_PER_BANK) -
> -                           pctl->desc->pin_base;
> -       pctl->chip->label =3D dev_name(&pdev->dev);
> -       pctl->chip->parent =3D &pdev->dev;
> -       pctl->chip->base =3D pctl->desc->pin_base;
> -
> -       ret =3D gpiochip_add_data(pctl->chip, pctl);
> -       if (ret)
> -               return ret;
> +       last_pin =3D pctl->desc->pins[pctl->desc->npins - 1].pin.number -
> +                  pctl->desc->pin_base;
> +       for (gpio_banks =3D 0;

If you switch to devm_gpiochip_add_data() above, you won't need
gpiochip_remove() below, and you can declare |gpio_banks| inline here in
the for statement.

> +            gpio_banks <=3D last_pin / PINS_PER_BANK;
> +            gpio_banks++) {
> +               ret =3D sunxi_gpio_add_bank(pctl, gpio_banks);
> +               if (ret)
> +                       goto gpiochip_error;
> +       }
>
>         for (i =3D 0; i < pctl->desc->npins; i++) {
>                 const struct sunxi_desc_pin *pin =3D pctl->desc->pins + i=
;
> +               int bank =3D (pin->pin.number - pctl->desc->pin_base) / P=
INS_PER_BANK;
> +               struct gpio_chip *gc =3D &pctl->banks[bank].chip.gc;
>
> -               ret =3D gpiochip_add_pin_range(pctl->chip, dev_name(&pdev=
->dev),
> -                                            pin->pin.number - pctl->desc=
->pin_base,
> +               ret =3D gpiochip_add_pin_range(gc, dev_name(&pdev->dev),
> +                                            pin->pin.number % PINS_PER_B=
ANK,
>                                              pin->pin.number, 1);
>                 if (ret)
>                         goto gpiochip_error;
> @@ -1690,6 +1669,8 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>         return 0;
>
>  gpiochip_error:
> -       gpiochip_remove(pctl->chip);
> +       while (--gpio_banks >=3D 0)
> +               gpiochip_remove(&pctl->banks[gpio_banks].chip.gc);
> +
>         return ret;
>  }
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index ad26e4de16a85..085131caa02fe 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -14,6 +14,7 @@
>  #define __PINCTRL_SUNXI_H
>
>  #include <linux/kernel.h>
> +#include <linux/gpio/generic.h>

gpio comes before kernel?

And maybe we should try to stop including the massive kernel.h header.


Thanks
ChenYu

>  #include <linux/spinlock.h>
>
>  #define PA_BASE        0
> @@ -159,9 +160,17 @@ struct sunxi_pinctrl_regulator {
>         refcount_t              refcount;
>  };
>
> +struct sunxi_pinctrl;
> +
> +struct sunxi_gpio_bank {
> +       struct gpio_generic_chip chip;
> +       struct sunxi_pinctrl *pctl;
> +       void __iomem *base;
> +};
> +
>  struct sunxi_pinctrl {
>         void __iomem                    *membase;
> -       struct gpio_chip                *chip;
> +       struct sunxi_gpio_bank          banks[SUNXI_PINCTRL_MAX_BANKS];
>         const struct sunxi_pinctrl_desc *desc;
>         struct device                   *dev;
>         struct sunxi_pinctrl_regulator  regulators[11];
> --
> 2.46.4
>
>

