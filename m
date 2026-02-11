Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00CBEB595E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 03:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1s7vUV+sO14hY+Ed2beN0CcNuUTWYsjsxBCwjuQ3z8=; b=gTsPKhHiHKWmHj
	hZNW8EiSO7tO1i7iCRaRxq+VDLZ/F6Q9i3o2RArQtSnr+6YmIT3HXzaPaPDXTWo/Tl1+JqT0Vn0D5
	XJqsRLRvlrga3Pe1/A5t8p5WijZXYe0BXbkO6SWgqow6biSO7WgD82/FJVkefQfSzIUWFJgYsuIJ9
	doeohx0rSVCDOYhgMTGk8YU6Jvd0pHkqVy9M8aERdfbbAy7V033Gb1Yy0KvTqkC40xQkjkbSHvfYi
	r4q3RgA9qHfLabnK5NgiCVe+UEVEuebzYuTYW4E+KhCYVxW61KIsm8rij779QCCM5aawAQZ9sn+pP
	/Q/9mD0Xv/jVOVnIEK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq1Eg-00000000AxN-2M2h;
	Wed, 11 Feb 2026 03:49:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq1Ed-00000000Ax0-3vSb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 03:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C62DA44392
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 03:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EF5C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 03:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770781790;
	bh=Jy0ltPXhz9tRco4ib1CKhZ6LDLJXYw+nypbUadGqQTs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=HGYRrDWD6/LORoYvdtWxpamKunatE1qHTT8fQbZLwnwzZ+rob6DQ4VvfrF06BRfS2
	 23Pd+DftXcWs/kqdEHIXw5zmTJK53t3DKqFfI0uVLPoy5cbIGBmXVVYFpDQpLzQ/ch
	 INjAQ+FGVRYR4Y1vZegFG8r71QE7xIiNJHBddHXeb2uN9CGGf7ZmWM9LvPAEo98lWi
	 fVVIfh7S0jdTJclgGjmFk8B3l2PSE3z4mIleDh8Ixy3fP5lxSIa4P1uRrrG2fLfNog
	 8PNiqoaRBX3HQzMIo9vPTvmFzrvmVBRQGZHuVq7ReDEnGyopxM8zGaMSX/g6iXQEzJ
	 ASadz2OhBwvCg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59ddb31ddcaso1686651e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 19:49:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVj5i/fR2sPq/SwC71fgVzobQsox1oiOe0ua0kHx3GlSqkLVpjKpaoYTrRYMamwNs9Au3bl72ElhnQvy90kBFiK@lists.infradead.org
X-Gm-Message-State: AOJu0YzMVGjVmTBZk9ewH4IMkaxpG5NYSW4WVZCNuEoFJMsjO9QLTwcq
	idouLcAPGfi0GQ9oJEZQRgh2/J4+UKIBKQZRaN/tJzojCvcCFLV1vul/nY/U1HywEhq8GVD79yH
	yOWCYRz3bBI7qA1JFmW/pPA6kZoj9RLM=
X-Received: by 2002:a05:6512:3ba4:b0:59e:38c7:b372 with SMTP id
 2adb3069b0e04-59e450437afmr4669513e87.6.1770781789020; Tue, 10 Feb 2026
 19:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20260211033249.2770281-1-james.hilliard1@gmail.com>
In-Reply-To: <20260211033249.2770281-1-james.hilliard1@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Feb 2026 11:49:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v64TYWbvs7mmpa87X28WWQpTi7O+VZSz-x8GmGhyadBegQ@mail.gmail.com>
X-Gm-Features: AZwV_QhPOLTZNzx5G_KENa0ppJq8t642Pn8F0o2YJqb-P0Bn-8LQi4bIpuV6-jg
Message-ID: <CAGb2v64TYWbvs7mmpa87X28WWQpTi7O+VZSz-x8GmGhyadBegQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_194952_038902_75C5FAEB 
X-CRM114-Status: GOOD (  23.17  )
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

On Wed, Feb 11, 2026 at 11:33=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:

Ah, you beat me to it.

> Implement sunxi_pinctrl_gpio_get_direction() and wire it into
> the sunxi gpio_chip setup.

Can you also mention that without this, calls to gpiochip_get_direction()
cause a big warning?

> The new callback reads the pin mux register and compares the mux
> value against the pin descriptor gpio_in and gpio_out functions
> to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
> If the pin is muxed to irq, report it as input.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 0fb057a07dcc..424f23be27b2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(struc=
t gpio_chip *chip,
>                                             chip->base + offset, false);
>  }
>
> +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> +                                           unsigned int offset)
> +{
> +       struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> +       struct sunxi_desc_function *in, *out, *irq;
> +       u32 reg, shift, mask, val;
> +       u16 pin =3D chip->base + offset;
> +
> +       in =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_i=
n");
> +       out =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_=
out");
> +       if (!in || !out)
> +               return -EINVAL;
> +
> +       irq =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq")=
;

This is less efficient, as you end up (linearly) searching the whole pin
array three times.

What I did in my version was implement a search based on pin and muxval.
I can send that out if it's OK with you.


ChenYu

> +
> +       sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +       val =3D (readl(pctl->membase + reg) & mask) >> shift;
> +
> +       if (val =3D=3D in->muxval)
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       if (val =3D=3D out->muxval)
> +               return GPIO_LINE_DIRECTION_OUT;
> +
> +       /* IRQ function is effectively input. */
> +       if (irq && val =3D=3D irq->muxval)
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       return -EINVAL;
> +}
> +
>  static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
>                                 const struct of_phandle_args *gpiospec,
>                                 u32 *flags)
> @@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>         pctl->chip->set_config =3D gpiochip_generic_config;
>         pctl->chip->direction_input =3D sunxi_pinctrl_gpio_direction_inpu=
t;
>         pctl->chip->direction_output =3D sunxi_pinctrl_gpio_direction_out=
put;
> +       pctl->chip->get_direction =3D sunxi_pinctrl_gpio_get_direction;
>         pctl->chip->get =3D sunxi_pinctrl_gpio_get;
>         pctl->chip->set =3D sunxi_pinctrl_gpio_set;
>         pctl->chip->of_xlate =3D sunxi_pinctrl_gpio_of_xlate;
> --
> 2.43.0
>

