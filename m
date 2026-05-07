Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CDECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxarNJnnwWScVs3GpjwAa81CaOXvDgZqME3DxiXIYSY=; b=ic7dmZhRw/v0PsheU3aqq4Owt4
	9oRdjYYjbEYcL55FGRLLBn/oYF0j1BnoFuST5QXiISzPnEjjzRHGV+9YHr4rY+/VRBJ1lYbUR14TI
	x0YimLVdBgDQteYAFvqIDVN6SzbZuw1O9BzdeGtqZqfKEXSyaz/iT+UV8XMcGWY6WSaJEMm+thQI1
	3Z0BmF4f9N4s4sTEZgD9alnwAkSZJVcAM7CumrAsfJXJJ+eko923qgcFpm+/ailCKG7bOhEb1X0Ce
	Xv0ZVOCykitPu04CEttdc1lG/0XlrSjhjxUnm0z7lDn8sa7yAoDbx5/VQRZz9uM9Unk/qZuVOdudi
	SZaN2Ikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxdS-00000003kzO-0zmO;
	Thu, 07 May 2026 12:15:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxdP-00000003kyt-3IRP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 145904170F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 12:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA873C2BCF6
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 12:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778156119;
	bh=v9MtChy7yFcwVd1STYPJTObu0yj8sS2efOx3W51ciBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JfmymCQlwg/a31PktZ1FeSL0W1RmCyaFabbJkXFuU+e6j74YlmHqlNDwhVTgy2tMB
	 Z4Lzaae9hDmY7CcR8c+bBvJlUQpruRQd/7iz7l1HAMx9vT/5FdWkvupZ+Q8rh5BTx7
	 y8hM8Lmu45t6kZrJ+iZEJg3l0t0PF6uO+zfHEAdBZ2ogeT10Ug1iML5KFlluSAkOXZ
	 8r41UH+k8x6QVCllXEsU83Gv6s7S9kDdIpy+EJTgifWI3ZZNg7dQJVZX0/xuku4Vwo
	 x3C+gSEzjqyp2QLJzjJAkPG2+TlZ7AkPeHe7t+DJJ9UgzTN1o6zRrjyYK1ec4z0UYo
	 AVxGzojKgiTCg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso1094636e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 05:15:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ICKq9UsKLvWOciEVGOCCIS4M23lj+Xe2f6v4ysSdCANiNq3xLEIBEt0i/rKFc6sHCjOE0ACGtEz8oEyOdGjNL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz9omum2pkT9THbHNdmFwQ90MBIRZt+JFgZlrMnAIovWnriqzf
	z9uJCdvK5geXY6uq4FkMgl7toJo/I3GSUjDvn1xeTV4C9E+0AWfrqfBUXhnIebh46k2ZOB3I7dF
	Rm1/7+bL18PuSBjenKWXuTgs+eHpsTWE=
X-Received: by 2002:ac2:48b8:0:b0:5a7:4a60:1454 with SMTP id
 2adb3069b0e04-5a887ce6447mr2054591e87.33.1778156117576; Thu, 07 May 2026
 05:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260501155421.3329862-1-elder@riscstar.com> <20260501155421.3329862-10-elder@riscstar.com>
In-Reply-To: <20260501155421.3329862-10-elder@riscstar.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 7 May 2026 14:15:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkm4qn9hxQ9HjjnTWjvAiS+A+x1ATy7wamnm_YSP_qPEg@mail.gmail.com>
X-Gm-Features: AVHnY4JVKfyZ1eZonYoPYtYcjqSl_ExL5rvF4dr4feVkyENggSODeF5VZKTXJe0
Message-ID: <CAD++jLkm4qn9hxQ9HjjnTWjvAiS+A+x1ATy7wamnm_YSP_qPEg@mail.gmail.com>
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, brgl@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, daniel@riscstar.com, wens@kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_051519_876021_B777DD86 
X-CRM114-Status: GOOD (  21.66  )
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

Hi Alex,

thanks for your patch!

On Fri, May 1, 2026 at 5:55=E2=80=AFPM Alex Elder <elder@riscstar.com> wrot=
e:

> Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially
> a small and highly-specialized SoC.  TC956x includes a GPIO block that
> can be accessed, alongside several other peripherals, via two PCIe
> endpoint functions.  The PCIe function driver creates an auxiliary
> device for the GPIO block, and that device gets bound to this auxiliary
> device driver.
>
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
(...)

> +config GPIO_TC956X
> +       tristate "Toshiba TC956X GPIO support"
> +       depends on TOSHIBA_TC956X_PCI
> +       default m if TOSHIBA_TC956X_PCI

I think this driver can

select GPIO_REGMAP

> +#include <linux/auxiliary_bus.h>
> +#include <linux/dev_printk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

#include <linux/gpio/regmap.h>

> +#define TC956X_GPIO_COUNT      37      /* Number of GPIOs (20-21 reserve=
d) */

I would just do 64 and flag > 37 as invalid.

> +/*
> + * struct tc956x_gpio - Information related to the embedded GPIO control=
ler
> + * @chip:              GPIO chip structure
> + * @regmap:            MMIO register map for SFR GPIO region access
> + * @input_only:                Bitmap indicating which GPIOs are input-o=
nly
> + */
> +struct tc956x_gpio {
> +       struct gpio_chip chip;
> +       struct regmap *regmap;
> +       DECLARE_BITMAP(input_only, TC956X_GPIO_COUNT);

> +static int tc956x_gpio_get_direction(struct gpio_chip *gc, unsigned int =
offset)
> +static int tc956x_gpio_direction_input(struct gpio_chip *gc,
> +                                      unsigned int offset)
> +static int tc956x_gpio_direction_output(struct gpio_chip *gc,
> +                                       unsigned int offset, int value)
> +static int tc956x_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +static int tc956x_gpio_set(struct gpio_chip *gc, unsigned int offset, in=
t value)

REGMAP_GPIO can handle all of this for you with the right
parameterization, study the drivers using this already such as
those that appear when you type
git grep 'gpio\/regmap\.h'


> +static int tc956x_gpio_init_valid_mask(struct gpio_chip *gc,
> +                                      unsigned long *valid_mask,
> +                                      unsigned int ngpios)
> +{
> +       /*
> +        * GPIOs 2 and 3 are used by the PCI power control driver, and
> +        * we don't allow them to be used.  GPIOs 20 and 21 are reserved
> +        * (and not usable).
> +        */
> +       bitmap_fill(valid_mask, ngpios);
> +       bitmap_clear(valid_mask, 2, 2);
> +       bitmap_clear(valid_mask, 20, 2);
> +
> +       return 0;
> +}

That's good use of this facility.

I would say the chip has 64 lines and just
bitmap_clear(valid_mask, 37, 64 - 37);
but that's your pick. This probably works too.

> +       /* Mark GPIOs 22, 23, 24, 27, 28, 31, and 34 as input only */
> +       bitmap_set(gpio->input_only, 22, 3);
> +       bitmap_set(gpio->input_only, 27, 2);
> +       set_bit(31, gpio->input_only);
> +       set_bit(34, gpio->input_only);

regmap-gpio can't currently handle selective input-only or
output-only lines, but we can
very easily make it.

So I sent a patch for that (now in your inbox).

Check if this fixed_direction_sparse bitmap will do the trick
for you and provide Tested-by if it does, thanks!

Yours,
Linus Walleij

