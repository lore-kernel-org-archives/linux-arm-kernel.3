Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5D9C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojO6d7Cp/azkr+ydPr3NQ+RBBA1uMA9LUmgwlnFJQYQ=; b=bsRyBDitbW26UQnUtmRZYcRe6x
	q3q9oconkJxMhvpqNK0mjVlncK3jzBmtmpKNBnLVE8GM6rjq5zhudy/rmEBXuQTQ3w/MA8Tvst6ft
	kV655qMA+PeC5ZypgmuNeIxg7zZ9UFfnspwncT7pQhvDf1QbK7XI7Ru50VyptrVHEtDqo0z8E4RTQ
	+PQCBZB5tzbtsMAncRBNSi8KGEU1PKhkfJAkaH4S2IFFT7jAkwoYB/A3KX/QHfKpgJwH5yCcMywBU
	PKSBlLpLTJ3fkFtFe3be4vXziy+8tXR8d6mvzjTW3SIXVlBgxxiDN8nirh8BG4pgIRwL87Tg/DKd0
	kYlilw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9q3g-0000000C8V8-01AN;
	Thu, 24 Sep 2026 20:28:44 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9q3c-0000000C8Ud-1kXT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:28:42 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0aa9d356eso232205a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790281719; cv=none;
        d=google.com; s=arc-20260327;
        b=L4tWN4JQ7a5Zh5fT7i17AuyIXQjnNY0R616QRNgs2/JgB8McsST0oVHjpEnxyltNAt
         oHlIxHCl5dkjkZSVAT3CEPkcvjD5G7upiHjSjLZwQ5Ig1WlwC1ulGOKWkOZMEITO9JH9
         e2/3jxKh0TNiOsbejvop/Y5nMwQQ5k5iPjv8Pao/7DcPKICPFgbNs/6myDnJGBBckcK7
         YNZKeI+vAjsT0XHu54Vs73WEljDNioyEExb15UNSswfZoVfeYh1bxxYwvcllW/6yVj0e
         cMRT2LYDISsU8E9bGlLhz+bQ92A2Zhr0XOJGKHkdV3ZmA/DLBQTzQO8mHDMlqpVbC8Oy
         Ke4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ojO6d7Cp/azkr+ydPr3NQ+RBBA1uMA9LUmgwlnFJQYQ=;
        fh=pNLo4G0HOpDHEpMXvkNNm1C0fdJhHB5xkB5HMG6Bj10=;
        b=oeIqpfJBgDCVO0yYIJeO+PPcgbxLUquIaIzs2bqeNsNazFHS8UMK34qrwz57PTl7du
         CvIc/lQtPYBKnau8BCi+t34kHreGRlyOl8R4+rRaotcd+XmNjpSuZUfcrmF52RCyhNcl
         mYMHGk03TgNBimWSXelorepiVI9X5CongbND32H3XHlipq1IvSb0O5slsCQpRKMunHZA
         a7ADi5Nwmi/ocm24BsoNVH83FrzJPpuPBktddsn/DnrH4dEEGxi7bMZCbzLeROwZij/U
         CYgzhtWVV1OFdTKIZ6yBEf+4mKEw9TpMJuzo0/kKDcAOlgmkOpb5t53VS5+mHjSmo/Uu
         R/nQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281719; x=1790886519; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ojO6d7Cp/azkr+ydPr3NQ+RBBA1uMA9LUmgwlnFJQYQ=;
        b=jUa66a8WRIEZBO9TpT3zsk7OiCln2qHXYx93skRNcgKlQvgHjwLJXwcQ0PRFfib9uc
         FYXS3GhHG1NiYIe6pcRdHx3qWU/VEv3BBvA5MBqIA4RDIeiKjVwCpW58fLgpPZmz8ZY9
         H2jXcng23/q8ir2G2M8xUo/BAIxImjqQ5329UCt4QPvvxF5bbRud5uiIsCUykQZNpMRO
         HXKQxvJBTeIEWyibdGYVw/Vh9FUHi/BLTG/XUOUgLmSZBai+qfh9IcGb9f7jGqu1thxQ
         2+kY8SdmMd+cU0r9rNerD5WJ2rBhIXEV2Pjs3a5MBZmKBCZinGcAXrLUC4Bv9c/hhwfA
         /v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281719; x=1790886519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojO6d7Cp/azkr+ydPr3NQ+RBBA1uMA9LUmgwlnFJQYQ=;
        b=oq4WNj5M447ZqAkkVhg6JI/gDQyeVFiXGxqJQc/Xvv6uQdsOy2PAlI2PD/Ak+Kyz55
         qfizhcwv7Pqum/XNpfd2mvw4cARxPJRTeo/nir7FdqvTDlXySD5FyCKT6pmLRnNDzYxq
         /9PKUgwA6Arzqyx2FLrJ0KvIHiWRwQPzyrN/381g0qSMVA3g9JG9A+j6ygxCkxF+2guG
         glWYdvkHYfowNqHt63hv8Uj45RcK54GOTSZrxSVtBl5Dcux2hxVVtGL6WDLVN/P/JwXL
         NvwFIKdDL+G5u8wekqx3017Xy6njv2gzT54baAAdL5q0ylG47QLFpH5AsrHBbetrLCoM
         384w==
X-Forwarded-Encrypted: i=1; AKwUvBzFGzbzIWQ9f4ZmsDSRq/y213lhyTJYyTYKPPAgz6NWonGGeOD4JKKkiEAN+f7zrivIUFIrQsk342RqdDKZczBs@lists.infradead.org
X-Gm-Message-State: AFuF++nAjJMzMn8SzF118IejRFcOaX03LYp9Xg+Q6ARD84VYAk9AGAnP
	peOMDK2JyqZ6S2m1TbRGaQ4GQdRgW8kydkp0/AITUL9ZUIKJY3Qp4EY3Yd+pEnBSL3shcVipgqZ
	mmM3PGPz169qiF1zlpn8bUi47g+k6YXU=
X-Gm-Gg: AYBFou3aHeYxnoDmpftJfI41E/3RlNmk2xIGxrPrRNmjR+18PkKi+PdXrLRNp0OsJU+
	Tl+uPnpGAf6klIOcvJ0bdADQ/2H5RWQ4IfugwPcA3OAKlnc1rz/PWcpCTq3qwo4pbyZ2w4VeBmZ
	msm7Ldp64XGxD4ZuXtwam9atIALeVO5y8wt3tFBu0pM3JkpNVcbiUQ+XYuunhtTrvM7Q2du6ei4
	SQZepNI7ArVH3AeCVDoiImKJEfHZRpH6b5zBIObrfkPzw2xhlBZp/UUJdNovCPcnYnlKnsK8lTt
	0CYtZwbqy2i5w7JUPS3XbxgTpIjq9IAVmiWZoc1X1Z48InrlVc3gfgE9HJg4EMWjlC8DerU=
X-Received: by 2002:a17:90b:278c:b0:39e:6c69:9b99 with SMTP id
 98e67ed59e1d1-3a09929065emr2849572a91.62.1790281718782; Thu, 24 Sep 2026
 13:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260923201701.43391-1-pmazzini@gmail.com> <20260923201701.43391-4-pmazzini@gmail.com>
 <b0861183-54df-48f3-b78b-cc0c1c4dff4c@arm.com>
In-Reply-To: <b0861183-54df-48f3-b78b-cc0c1c4dff4c@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 24 Sep 2026 21:28:04 +0100
X-Gm-Features: AclHuK9G_SI3GgoHa0qCbnDKntKtoSmhBOxRgleKzxhUuFOnUyM7ko1rjVVmtJc
Message-ID: <CAAxh=jtj7m=0chzXG1osVy0ftHys9mwf9S62kz1Oimgm3rsCUg@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] pinctrl: sunxi: add Allwinner B288 pin
 controller driver
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_132840_522003_9FCD4CA2 
X-CRM114-Status: GOOD (  39.30  )
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

Hi Andre,

> look at pinctrl-sun55i-a523.c for an example

Thanks for the pointer - much nicer. Converted for v2.

> Can you put it into our wiki

The page already has the table and it matches the BSP exactly.

Thanks,
Pablo

On Thu, Sep 24, 2026 at 10:17=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi,
>
> many thanks for going through the task of creating this table - though I
> think you wouldn't need to do this anymore, since we now have another
> way of describing pins, which avoids this lenghty table in the driver:
> look at pinctrl-sun55i-a523.c for an example.
>
> This would allow the "driver" to be a mere high level description, and
> leave the mux values to the DT.
>
> That being said: it's good to have that info, for the lack of a manual.
> Can you by any chance try to make a table out of it and put it into our
> wiki (https://linux-sunxi.org/B288)? That would then be the replacement
> for the manual. Maybe write a small tool to convert this data struct
> into Wiki table format.
>
> Some general things inline ...
>
> On 9/23/26 22:16, Pablo Mazzini wrote:
> > 78 pins across ports B, C, D, F and G. PH0 is BSP FPGA-only and omitted=
.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   drivers/pinctrl/sunxi/Kconfig              |  10 +
> >   drivers/pinctrl/sunxi/Makefile             |   1 +
> >   drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 623 ++++++++++++++++++++=
+
> >   3 files changed, 634 insertions(+)
> >   create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> >
> > diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kcon=
fig
> > index dc62eba96348..a08186133090 100644
> > --- a/drivers/pinctrl/sunxi/Kconfig
> > +++ b/drivers/pinctrl/sunxi/Kconfig
> > @@ -56,6 +56,16 @@ config PINCTRL_SUN8I_A23_R
> >       default MACH_SUN8I
> >       select PINCTRL_SUNXI
> >
> > +config PINCTRL_SUN8I_B288
> > +     bool "Support for the Allwinner B288 PIO"
> > +     default MACH_SUN8I
> > +     select PINCTRL_SUNXI
> > +     help
> > +       Say Y here to enable pin controller and GPIO support for the
> > +       Allwinner B288 (sun8iw10p1) SoC, as used in e-book readers such
> > +       as the PocketBook Verse. This covers ports B, C, D, F and G,
> > +       including the four banks of external interrupt capable pins.
> > +
> >   config PINCTRL_SUN8I_H3
> >       bool "Support for the Allwinner H3 PIO"
> >       default MACH_SUN8I
> > diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Mak=
efile
> > index 951b3f1e4b4f..5129c0f19f3e 100644
> > --- a/drivers/pinctrl/sunxi/Makefile
> > +++ b/drivers/pinctrl/sunxi/Makefile
> > @@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_SUN50I_A100)   +=3D pinctrl-sun5=
0i-a100.o
> >   obj-$(CONFIG_PINCTRL_SUN50I_A100_R) +=3D pinctrl-sun50i-a100-r.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_A83T)    +=3D pinctrl-sun8i-a83t.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)  +=3D pinctrl-sun8i-a83t-r.o
> > +obj-$(CONFIG_PINCTRL_SUN8I_B288)     +=3D pinctrl-sun8i-b288.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_H3)              +=3D pinctrl-sun8i-h3.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_H3_R)    +=3D pinctrl-sun8i-h3-r.o
> >   obj-$(CONFIG_PINCTRL_SUN8I_V3S)             +=3D pinctrl-sun8i-v3s.o
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinct=
rl/sunxi/pinctrl-sun8i-b288.c
> > new file mode 100644
> > index 000000000000..ffd7eef68d19
> > --- /dev/null
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> > @@ -0,0 +1,623 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
> > + *
> > + * Derived from Allwinner's BSP driver pinctrl-sun8iw10p1.c, which is:
> > + * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
> > + *
> > + * Based on pinctrl-sun8i-a23.c, which is:
> > + * Copyright (C) 2014 Chen-Yu Tsai <wens@csie.org>
> > + * Copyright (C) 2014 Maxime Ripard <maxime.ripard@free-electrons.com>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/pinctrl/pinctrl.h>
> > +
> > +#include "pinctrl-sunxi.h"
> > +
> > +static const struct sunxi_desc_pin sun8i_b288_pins[] =3D {
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x5, "vdevice"),
>
> What's vdevice? I don't think we used to describe those weird functions.
>
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
>
> I know Allwinner does this, but we do not describe the HighZ mux, it's
> all 1's anyway, and the same for all pins.
>
> Those comments are probably irrelevant if you go with the new pinctrl
> driver style. Most of the settings there should be straightforward to
> figure out, just remember to add an IRQ map, to account for the missing
> interrupts on PortC.
>
> Cheers,
> Andre
>
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x4, "spdif0"),
> > +               SUNXI_FUNCTION(0x5, "vdevice"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart2"),
> > +               SUNXI_FUNCTION(0x3, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart0"),
> > +               SUNXI_FUNCTION(0x3, "pwm0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "uart0"),
> > +               SUNXI_FUNCTION(0x3, "pwm1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "spi1"),
> > +               SUNXI_FUNCTION(0x3, "uart4"),
> > +               SUNXI_FUNCTION(0x4, "pwm2"),
> > +               SUNXI_FUNCTION(0x5, "wifi_uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "spi1"),
> > +               SUNXI_FUNCTION(0x3, "uart4"),
> > +               SUNXI_FUNCTION(0x4, "pwm3"),
> > +               SUNXI_FUNCTION(0x5, "wifi_uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 12),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 13),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x4, "pwm4"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 14),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x4, "pwm5"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 15),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x3, "ac0"),
> > +               SUNXI_FUNCTION(0x4, "twi1"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 16),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s1"),
> > +               SUNXI_FUNCTION(0x3, "ac0"),
> > +               SUNXI_FUNCTION(0x4, "twi1"),
> > +               SUNXI_FUNCTION(0x5, "uart3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)),
> > +     /*Hole*/
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x4, "spi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x4, "uart1"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "nand0"),
> > +               SUNXI_FUNCTION(0x3, "sdc2"),
> > +               SUNXI_FUNCTION(0x5, "sdc3"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled")),
> > +     /* Hole */
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart5"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 7)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 8)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "uart1"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 9)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 10)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 11)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 12)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 13)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 14)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 15)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 16)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 17)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 18)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 19)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 20)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 21),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 21)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 22),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 22)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 23),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x4, "csi0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 23)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 24),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 24)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 25),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 25)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 26),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 26)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 27),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "lcd0"),
> > +               SUNXI_FUNCTION(0x3, "spi2"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 27)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 28),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "pwm0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 28)),
> > +
> > +     /* Hole */
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 3)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "uart0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "sdc0"),
> > +               SUNXI_FUNCTION(0x4, "jtag0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 6)),
> > +
> > +     /* Hole */
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "pwm6"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 0)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "pwm7"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi1"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 2)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi1"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi2"),
> > +               SUNXI_FUNCTION(0x3, "dmic0"),
> > +               SUNXI_FUNCTION(0x4, "spi1"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 4)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "twi2"),
> > +               SUNXI_FUNCTION(0x4, "ac0"),
> > +               SUNXI_FUNCTION(0x5, "sdc1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 5)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 6)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 7)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 8)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x4, "bist_result0"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 9)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "i2s0"),
> > +               SUNXI_FUNCTION(0x3, "dsd0"),
> > +               SUNXI_FUNCTION(0x4, "bist_result1"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 10)),
> > +     SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
> > +               SUNXI_FUNCTION(0x0, "gpio_in"),
> > +               SUNXI_FUNCTION(0x1, "gpio_out"),
> > +               SUNXI_FUNCTION(0x2, "spdif0"),
> > +               SUNXI_FUNCTION(0x4, "pll_lock_dbg"),
> > +               SUNXI_FUNCTION(0x7, "io_disabled"),
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 11)),
> > +
> > +};
> > +
> > +static const struct sunxi_pinctrl_desc sun8i_b288_pinctrl_data =3D {
> > +     .pins =3D sun8i_b288_pins,
> > +     .npins =3D ARRAY_SIZE(sun8i_b288_pins),
> > +     .irq_banks =3D 4,
> > +};
> > +
> > +static int sun8i_b288_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +     return sunxi_pinctrl_init(pdev,
> > +                               &sun8i_b288_pinctrl_data);
> > +}
> > +
> > +static const struct of_device_id sun8i_b288_pinctrl_match[] =3D {
> > +     { .compatible =3D "allwinner,sun8i-b288-pinctrl", },
> > +     {}
> > +};
> > +
> > +static struct platform_driver sun8i_b288_pinctrl_driver =3D {
> > +     .probe  =3D sun8i_b288_pinctrl_probe,
> > +     .driver =3D {
> > +             .name           =3D "sun8i-b288-pinctrl",
> > +             .of_match_table =3D sun8i_b288_pinctrl_match,
> > +     },
> > +};
> > +builtin_platform_driver(sun8i_b288_pinctrl_driver);
>

