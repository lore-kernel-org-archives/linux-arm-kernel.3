Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48872CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AfeWhadO1v9+SOwJHNDv9yxD8mKNaO32U/4W8IqQks=; b=3GYV/e8qov2R6HlcjXqSQYEgPy
	gVx3khl+I/wl7Bw46KYz+pmK3gzhtBGYz5ZPx71gjMr8lzj2SGP39Y2UuPNXvTveiza59k4IqiFwp
	ix6tbbo75i4dAeueqy3qpf/hf18vDonW6htFJfrNdt9lcHkf65bUpA8u5qARzEYAccRLlUTnFrRnC
	1BCA2iPdWHckSJ54E6i+IKQG4/GjiJdgVnXA2xKDmhg17MxEQHzUctMoJ27FMo2Vim1APNcjmEW3F
	goAxOuqMh7kMBrQZzu3EcU+31QLEJmbLgRPIq1SrmMWz7yaSt0BRbunsiHAe1CxmiSkllVmESCQH5
	O3FQDWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6vL-0000000EFdA-3kaS;
	Mon, 15 Jun 2026 13:00:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6vH-0000000EFcc-0LRU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:00:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA5E060132
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 13:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CFF1F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781528413;
	bh=9AfeWhadO1v9+SOwJHNDv9yxD8mKNaO32U/4W8IqQks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OtAYO8G1iTz93pqIG95Bt5ygW6csEa09rVqLyrXI6Fcw0vMP1/t3zvd5iLq3O51+H
	 P3gWBKO5f2DujiUFvJ4XZlLmd/dAKxzQdAzmBAgKt6bf95AzqcfaxVuJWwezRBpcnB
	 KazPgpaISQA0Rt3QKRhDJ4uIwkr9UflXUkHo/PF7SUmclwcswC+qiVBTpwAUPEx7zP
	 RXT8GdWSOoOjccxEzOf2WL5f+lK1uVAJr5/MW/bS/+SCBxLVmy6jhf3eYzgco1H1bl
	 sH49ShaxRAnJfzPof0Qb8n52UVjgBZMSysdEfSIIu5rWWZ3wiL/Ku9qTD6eB1FFx6U
	 yR+L5yZR+jFpQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa63628d26so3098899e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 06:00:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Tdgu3JDfC+sWoxE7g3FxOu6amezI+YLiNmJCgH9fj8aE2SofWpP2IeYnDRi8d3/l53Bo5dI/NHXsyB/6bDQ83@lists.infradead.org
X-Gm-Message-State: AOJu0YxKczRN9DEUg/6ff938YMDAvwBJQOll5b0YEFniXnr3b5x7oVz2
	Y5sEEaM3IrP/xwLG5r7X6b/85iGc438S+Sf531LfRxcR4/vH6C+CB5pt0zeRdFJIg29yw/emJyu
	qBhElj+09kKViW4ierYi13SNxElxMVtg=
X-Received: by 2002:ac2:4842:0:b0:5ad:a25:b8a3 with SMTP id
 2adb3069b0e04-5ad30dc3332mr1847615e87.29.1781528412405; Mon, 15 Jun 2026
 06:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com> <2bb2c0e8-29e1-444b-851b-a9932f547c6a@amlogic.com>
In-Reply-To: <2bb2c0e8-29e1-444b-851b-a9932f547c6a@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:59:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLm9+8RSbBCi-k=8S98XvVJ7taYrK=kuBp3_RqxE_bcxbg@mail.gmail.com>
X-Gm-Features: AVVi8CcBb6WQACvc7gkaicyjvy5mkWEAD_WR6myDRZYFSecbNnPJmhQJczsoxDs
Message-ID: <CAD++jLm9+8RSbBCi-k=8S98XvVJ7taYrK=kuBp3_RqxE_bcxbg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mon, Jun 15, 2026 at 5:17=E2=80=AFAM Xianwei Zhao <xianwei.zhao@amlogic.=
com> wrote:
> On 2026/6/11 20:51, Linus Walleij wrote:
> > Hi Xianwei,
> >
> > thanks for your patches!
> >
> > On Thu, Jun 11, 2026 at 9:54=E2=80=AFAM Xianwei Zhao via B4 Relay
> > <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> >
> >> Some users need to obtain an IRQ directly from a GPIO descriptor throu=
gh gpiod_to_irq().
> >> Add the required DT binding and implementation to support this use cas=
e.
> >> Since this introduces a new DT property, the property is kept optional=
 to
> >> maintain compatibility with existing SoCs and DTS files.
> > To me it looks like you have just re-implemented hierarchical
> > irqs.
> >
> > Look into the section "Infrastructure helpers for GPIO irqchips"
> > in Documentation/driver-api/gpio/driver.rst, especially towards
> > the end.
> >
> > Solve this by using GPIOLIB_IRQCHIP and a custom
> > child_to_parent_hwirq() callback to translate the GPIO into
> > an IRQ.
> >
> > To just implement gpiod_to_irq() without any irqchip abstraction
> > is also broken: you can't force all users to just use this way
> > to get an IRQ it's excessively restricting.
> >
> > Add
> >
> >    interrupt-controller: true
> >
> >    "#interrupt-cells":
> >      const: 2
> >
> > to the pinctrl node as well so that DT users can simply request
> > the IRQ from the irqchip inside of the pin controller. It will
> > be hierarchical and lightweight but an irqchip nevertheless.
> >
> > The GPIOLIB_IRQCHIP approach will help you to get this
> > right.
> >
>
> I read the document (Documentation/driver-api/gpio/driver.rst) you
> pointed me to and found that the corresponding implementation has
> already been added in this file:
>
> https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-meson-g=
pio.c

That is the parent interrupt controller to the pinctrl+gpio isn't it.

It will be even clearer once you use interrupts =3D <>; instead of
the hwirq =3D <>; hack.

> However, it is implemented as a standalone irqchip and is not integrated
> with the GPIO controller.

Right, so it is the parent. Of course it it stand alone.

> In this patch, I implemented the GPIO-to-IRQ conversion through
> gpiod_to_irq(). Users can still obtain the interrupt directly through
> the interrupt property, for example:
>
> interrupts-extended =3D <&gpio_intc 16 1>;
>
> The purpose of this change is to make GPIO-to-IRQ conversion easier for
> users who do not want to know the actual interrupt number. The interrupt
> mapping is not fixed and varies between different SoCs, so users should
> not need to handle the hardware interrupt allocation details.

This is not why gpiod_to_irq() exists. It is not a convenience function
that is voluntary to implement.

If you implement gpiod_to_irq() you implement an entire
irqchip otherwise it is a bug.

If the pin control + GPIO driver should serve IRQ numbers in any
shape or form, you need to go the whole way and provide a
hierarchical irqchip.

It doesn't matter if you don't need to set a single bit in the
pinctrl + GPIO hardware for these IRQs, the fact that they are
routed internally on the SoC out through the pin control and
GPIO block by definition makes it hierarchical.

Yours,
Linus Walleij

