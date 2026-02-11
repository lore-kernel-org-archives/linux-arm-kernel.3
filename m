Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46840EB5954
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8xSoevFdG9MZPLjrbg3PN3HEUB0oT+4ZKpr3/S+wi8=; b=zdtABU92z0NJhA
	81Pc6JMSDkR72/tWXgrLgv5OA4FaISnluC8fynfhp0YNH+7TzfZ6S813QsiZ/IlF8T0Dy9ozYrSo0
	WFaHcdNMBYgI9aMmyh/G7NnORu+ouXOgTbTCNCxFRfip903apjYMz4qPznrV9/FdTyDLvEZLwJA/E
	Y9oQEFfS0v9oRHeU2C/s3b657JNLQN9EPHJ/gz4TaAZsIYG9QqJ91/33Ll3eQ2QFSJWdgNd8Dr1jX
	om/3mgZu024KRmOWRLlfblKt8z140qwJbmB8KwNbnsjTPFdLHl59kk6WAjeU15jCItJiWdveltaxv
	TG78HKmY7yz89BMrLmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq6vS-00000000SdU-24gM;
	Wed, 11 Feb 2026 09:54:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq6vQ-00000000Sd5-28Eu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 09:54:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98C19443E7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 09:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723E0C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770803663;
	bh=/5pNhKzNp3gbK4Hmr3Rpar8H9OmvtwaUM/lc2peBhvE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=dHF5ecxW6MPWz6oIIdXjhEW/zYWCvnbowkPEaRjMlG2FC9zvKWlbAjKBkIlXtoOge
	 JHXxd1CVleTVEfLnW2f1dkcvMfNE0V7x/qA4UJvHFxCU5TErwBPiGQF7/LMwrrfz8Z
	 pAac32HubRGk6jL4vcIG3Q/tjrHxLXN1U90sDSu+R7Eu2arKY4bYjptO9+kIwza608
	 pv2i2QDOJT9vs9XYwKjDXwm3honwSlRIES7eepetHRf8rLsItM/nhvHda6gOIIKcFy
	 RwJyrivt+5VrDB0S2pa/MCZjlg6TWmb+HNrC8le/sHxXaXOmbxrzWMdPD+b2QXr5uO
	 2a7Y5sIACOzWg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-385b6e77ef9so41594581fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 01:54:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWU6Y2ZYnyvqytq3mGEcOyRt3d2zc8BY6gwpS8W758dBnfGbwkePYpIt4W8Je2mEnzE35T7IKxV1TUjb3BL3xKR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1fTYKMPTRRofSRsVO120Bw4UeolHJ0YsRicRDXTndoDNfUi7H
	frAZzJaOa+DK0347J1Ye//5d4Ice7QTOBY6BZdaAZrqqd6SifknVyCicLOiyI3vQ9Tk/S8hBsk7
	/ofOMWm2EcSNywXZqB+IPyQLh5Mfjr+o=
X-Received: by 2002:a05:651c:f0f:b0:386:ec21:c87f with SMTP id
 38308e7fff4ca-38703200666mr4966961fa.42.1770803661719; Wed, 11 Feb 2026
 01:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20260211033249.2770281-1-james.hilliard1@gmail.com> <c78bd0c3-6889-46f8-8b5a-e3490ce7b9c5@arm.com>
In-Reply-To: <c78bd0c3-6889-46f8-8b5a-e3490ce7b9c5@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Feb 2026 17:54:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v663k0DBqodAUbdgbwbpb2k9qAkFowA_P0HpCUv_mCXG_Q@mail.gmail.com>
X-Gm-Features: AZwV_Qi2y5CAMrmnItBBq7T6t5ZLzWkFIM0u2qt3VdP2YzsuTAzC8hcuXWxIqwA
Message-ID: <CAGb2v663k0DBqodAUbdgbwbpb2k9qAkFowA_P0HpCUv_mCXG_Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: Andre Przywara <andre.przywara@arm.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-sunxi@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_015424_589817_4A178948 
X-CRM114-Status: GOOD (  28.05  )
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

On Wed, Feb 11, 2026 at 5:08=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi James,
>
> On 2/11/26 04:32, James Hilliard wrote:
> > Implement sunxi_pinctrl_gpio_get_direction() and wire it into
> > the sunxi gpio_chip setup.
>
> thanks for taking care and sending a patch! I am still scratching my
> head what this warning is about exactly and why we only see this now? I
> never saw this, so what caused that? libgpiod accesses from userland?

For me it was `cat /sys/kernel/debug/gpio`.

> Regardless, can we hold back this patch, please? As part of the A733
> pinctrl support (and as LinusW asked kindly about that) I was reworking
> our driver to use the generic gpio interface, and I have a feeling this
> would solve this problem automatically?
> The actual pinctrl conversion is done, I just need to plug in the IRQ
> support. I ideally would have something in the next days to post, would
> that be worth waiting for?

We probably want something for the stable kernels though. The commit
that adds the warning was merged sometime last year, so it's part
of the latest LTS.


ChenYu

> Cheers,
> Andre
>
>
>
> >
> > The new callback reads the pin mux register and compares the mux
> > value against the pin descriptor gpio_in and gpio_out functions
> > to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
> > If the pin is muxed to irq, report it as input.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 ++++++++++++++++++++++++++=
+
> >   1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index 0fb057a07dcc..424f23be27b2 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(str=
uct gpio_chip *chip,
> >                                           chip->base + offset, false);
> >   }
> >
> > +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> > +                                         unsigned int offset)
> > +{
> > +     struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > +     struct sunxi_desc_function *in, *out, *irq;
> > +     u32 reg, shift, mask, val;
> > +     u16 pin =3D chip->base + offset;
> > +
> > +     in =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_i=
n");
> > +     out =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_=
out");
> > +     if (!in || !out)
> > +             return -EINVAL;
> > +
> > +     irq =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq")=
;
> > +
> > +     sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> > +     val =3D (readl(pctl->membase + reg) & mask) >> shift;
> > +
> > +     if (val =3D=3D in->muxval)
> > +             return GPIO_LINE_DIRECTION_IN;
> > +
> > +     if (val =3D=3D out->muxval)
> > +             return GPIO_LINE_DIRECTION_OUT;
> > +
> > +     /* IRQ function is effectively input. */
> > +     if (irq && val =3D=3D irq->muxval)
> > +             return GPIO_LINE_DIRECTION_IN;
> > +
> > +     return -EINVAL;
> > +}
> > +
> >   static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
> >                               const struct of_phandle_args *gpiospec,
> >                               u32 *flags)
> > @@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform=
_device *pdev,
> >       pctl->chip->set_config =3D gpiochip_generic_config;
> >       pctl->chip->direction_input =3D sunxi_pinctrl_gpio_direction_inpu=
t;
> >       pctl->chip->direction_output =3D sunxi_pinctrl_gpio_direction_out=
put;
> > +     pctl->chip->get_direction =3D sunxi_pinctrl_gpio_get_direction;
> >       pctl->chip->get =3D sunxi_pinctrl_gpio_get;
> >       pctl->chip->set =3D sunxi_pinctrl_gpio_set;
> >       pctl->chip->of_xlate =3D sunxi_pinctrl_gpio_of_xlate;
>

