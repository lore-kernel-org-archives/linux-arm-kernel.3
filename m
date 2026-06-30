Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1A7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkvT66lJpDRdyEaoJbT/7KZo9MPl7om0PLqvxc7ob+g=; b=b59Ww+SVaWxUthIWXSNvMNZ359
	NHjuzS0lY8wWuQnVH+U8bMVZsQtya0xAScdJvnA337r2Jt3zxIwjb3jlS3wk4pUxYSEoRl6Cuem5D
	kJffEh6mLriD5zNJDQ/rjt1JqZ/VjZz8ecy6TuOvuyIVm0zbfDG6+XOpSwqzYH7i+5KMHHdVKItWi
	eMKklaTREF0calzroKqpVP25jnoUszRUv4j0Ssu1DI0qis+4tbtQUh1klyGkFjHIlIhqsJLbVXeRW
	2hokLsAnlH/C6XSMQynFvmmw8SLLL1FNq88swhtM7Rfe1wzmyFoalU4W++zSLh5ckgNLSjtPd+Hgi
	s4Exr0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYGj-0000000H8Bm-3doT;
	Tue, 30 Jun 2026 13:12:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYGh-0000000H8BZ-3r0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:12:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24418401C0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 13:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0883D1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825171;
	bh=wkvT66lJpDRdyEaoJbT/7KZo9MPl7om0PLqvxc7ob+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MlQs4G54c13BOoDjbRqfk9JXS0zYvoN2PTMHw2l9DzIt3rhp0u/NLUxXtRzfj0SMk
	 r248yRej4n8zNz5ghiy1dms0tnbjYQUG4bYLHhG6wCqW+RTP1eFw5TJZKWyQkxJBBe
	 lE+jSuWGKJS5Vu8R7jGIlwotqdpoGkzlI+f9KEDueRCjVLIwJ02WWEicb44pTVWJZP
	 PpTy6IhpTI91585rq/dKUbVYvxW4aLqfxO4kLfghjVmsDS0DRNWPgKtr4vgn+i4Wkt
	 qdkodsqKJpYB54dq5rTckejtiUpGJZm0bCpO7hL6nEESxBJESjAwkKjBWEds7ev3Cb
	 lNwK33IGbkvNA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb2df5cc1so2159306e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:12:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPyW0Ps3zDOEb78aLF/wJboyCaA3e/BCIO4JOJQxByE66GWv2A0+ooRxS4iuBsuxD8xPbD7j0SGNYyRsuIFq6i@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8U8/jypHMLaHlnzfPR4lWBs22mCLaiBCKwfIswx5Wucj52ZuR
	nwpio6e7JTwU+UsT2jTgw3JQqFjJBrelKMIrly9dvqNnNCP5mMFpPIw4XrLtDY0TI2Y//gupjtg
	MpIftbC7KlgG+Px6AEzUJY1HTeoXZ5U0=
X-Received: by 2002:ac2:4f04:0:b0:5ae:ba3e:a6f6 with SMTP id
 2adb3069b0e04-5aec10a566bmr209261e87.4.1782825169836; Tue, 30 Jun 2026
 06:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com> <20260622092335.1166876-4-eleanor.lin@realtek.com>
In-Reply-To: <20260622092335.1166876-4-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:12:36 +0100
X-Gmail-Original-Message-ID: <CAD++jL=xa-8E8Uon5mXgA=XHTUpc3h4DNi-jUevq5ibWyL3YGA@mail.gmail.com>
X-Gm-Features: AVVi8Cd0rzQDD94BIMNrdHy8q6vTCtb9F3B8vRr2O64rvi7iNBdl6YLUyoEX4Ss
Message-ID: <CAD++jL=xa-8E8Uon5mXgA=XHTUpc3h4DNi-jUevq5ibWyL3YGA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, mwalle@kernel.org, andriy.shevchenko@intel.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com
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

Hi Yu-Chun,

thanks for your patch!

On Mon, Jun 22, 2026 at 10:33=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.
>
> Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
> which manages pins via shared bank registers, the RTD1625 introduces
> a per-pin register architecture. Each GPIO line now has its own
> dedicated 32-bit control register to manage configuration independently,
> including direction, output value, input value, interrupt enable, and
> debounce. Therefore, this distinct hardware design requires a separate
> driver.
>
> Additionally, the RTD1625 GPIO controller has a specific hardware quirk:
> it fires both 'assert' and 'de-assert' interrupts simultaneously on any
> edge toggle. To handle this, we utilize the polarity register to route
> the requested edge (rising/falling) to the 'assert' IRQ line. The driver
> then filters out the unwanted 'de-assert' interrupt in the IRQ handler
> and pre-clears edge interrupts to prevent interrupt storms caused by
> unhandled dropped interrupts.
>
> Interrupt support is optional for this device, matching the dt-bindings.
> If the interrupts property is not provided, the driver simply skips IRQ
> initialization and operates purely as a basic GPIO controller.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
(...)
> +static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
> +{
> +       unsigned int (*get_reg_offset)(struct rtd1625_gpio *gpio, unsigne=
d int offset);
> +       struct rtd1625_gpio *data =3D irq_desc_get_handler_data(desc);
> +       struct irq_domain *domain =3D data->gpio_chip.irq.domain;
> +       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +       unsigned int irq =3D irq_desc_get_irq(desc);
> +       unsigned long status;
> +       unsigned int reg_offset, i, j;
> +       unsigned int girq;

So this

> +       irq_hw_number_t hwirq;
> +       u32 irq_type;
> +
> +       if (irq =3D=3D data->irqs[RTD1625_IRQ_ASSERT])
> +               get_reg_offset =3D &rtd1625_gpio_gpa_offset;
> +       else if (irq =3D=3D data->irqs[RTD1625_IRQ_DEASSERT])
> +               get_reg_offset =3D &rtd1625_gpio_gpda_offset;
> +       else if (irq =3D=3D data->irqs[2])
> +               get_reg_offset =3D &rtd1625_gpio_level_offset;
> +       else
> +               return;
> +
> +       chained_irq_enter(chip, desc);
> +
> +       for (i =3D 0; i < data->info->num_gpios; i +=3D 32) {
> +               reg_offset =3D get_reg_offset(data, i);
> +               status =3D readl_relaxed(data->irq_base + reg_offset);
> +
> +               /*
> +                * Hardware quirk: The controller fires both "assert" and=
 "de-assert"
> +                * interrupts simultaneously on any edge toggle.
> +                * We must pre-clear edge interrupts here. If we drop an =
unwanted
> +                * de-assert interrupt below, it will never reach the IRQ=
 core
> +                * (generic_handle_domain_irq), meaning ->irq_ack() won't=
 be called.
> +                * Failing to clear it here leads to an interrupt storm.
> +                */
> +               if (irq !=3D data->irqs[RTD1625_IRQ_LEVEL])
> +                       writel_relaxed(status, data->irq_base + reg_offse=
t);
> +
> +               for_each_set_bit(j, &status, 32) {
> +                       hwirq =3D i + j;
> +                       girq =3D irq_find_mapping(domain, hwirq);
> +                       irq_type =3D irq_get_trigger_type(girq);

Just
irq_type =3D irq_get_trigger_type(irq_find_mapping(domain, hwirq));

Drop the intermediate variable.

> +static void rtd1625_gpio_ack_irq(struct irq_data *d)
> +{
> +       struct rtd1625_gpio *data =3D irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +       u32 irq_type =3D irqd_get_trigger_type(d);
> +       u32 bit_mask =3D BIT(hwirq % 32);

This is a clear sign that your GPIOs and IRQs should be three-cell
(bank and offset) since they clearly have one each a separate
status bit in this register.

> +static void rtd1625_gpio_enable_edge_irq(struct rtd1625_gpio *data, irq_=
hw_number_t hwirq)
> +{
> +       int gpda_reg_offset =3D rtd1625_gpio_gpda_offset(data, hwirq);
> +       int gpa_reg_offset =3D rtd1625_gpio_gpa_offset(data, hwirq);
> +       u32 clr_mask =3D BIT(hwirq % 32);

Same here.

> +static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct r=
td1625_gpio *data)
> +{
> +       struct gpio_irq_chip *irq_chip;

This is a super-confusing name for this variable.

It is called irq_chip but it's not struct irq_chip at all.

Call this girq like all other drivers.

Yours,
Linus Walleij

