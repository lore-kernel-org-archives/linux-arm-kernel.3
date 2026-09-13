Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617A4C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4qdfBJ6UveLbwa6/KJRUVQLf97e1x27O9rDy1pzdRY=; b=o7CSYXs8axCxlc
	QbZ+zza3dcQZwj9pTrwXNR0tSQgNJ1IZ77unvige6ZVJMnCCtT9nrD2MfhfoLQorWIXDhpQw8Zvd4
	srH2QS4a0aLxpU3a7E+YPeKmy2Pp5JF5qPq+CSLlsDduDSb7pZ7MFVvJsiWf3fYLSo4Vzu98zcbWQ
	uxSLFWHEn8E9kU1S4DjbyG3ebZSz4xuH2TOuOV8ecSpOypFnzVbQTUIQAao64Ot6t0nkQXiDNjpeo
	saaQ3QOTR3AuQrUX6gWdJip+0O18oBgmEnptQJaXxmsXtlRf4Efkz9kYwMgwOMB1m+knaGw9hOeqs
	BidZNh75/LltX4GdMD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mEJ-00000001meI-2oWo;
	Sun, 13 Sep 2026 15:34:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mEI-00000001mdl-1DV8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:34:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F7B660E6D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9A91F0089B
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789313693;
	bh=c4qdfBJ6UveLbwa6/KJRUVQLf97e1x27O9rDy1pzdRY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Mlrkr8zo5dIwRxXI6nOXilS845cdd5Zo3KLn0XtWUYn4p/47RUOzgXWibisguofeC
	 FUuBtOcFzPwk44MwrXwNQM05B9qBqsKbsCKIdeMTRaVfj2DVAmhyTLpBW0IKnQbVnw
	 087KnYbDuBqPOnhQvYdI2zoJ33FW3chquPc7Gt/sxZDuJauWYisqWEJXx04xpCHHsK
	 JcDlgpriVwXL/Y17KcBUjRJIFQQuHceMGaYqAqWOuDnCO9Gm5AvSn6EvVbsRhboX2I
	 vxbLMPdbq8ZJH9nuU4UVfG171vUq4DHfO7Ge9nOnaw7Ag9W9Rck8cGb+gtw+IpWyrZ
	 l5oZ31wtTrgzA==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff174422so10197711fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzd/OEANnqro9C4TN7PUc/bllLjWzlsbzZxTqLpOE6zmHNHaRFoJEchQkRvwLdOuoyyk8Ea9vo3d6eWviGH01zU@lists.infradead.org
X-Gm-Message-State: AFuF++l9N9mZu1IQXVGqiFpr9OuC988JXwDUbHl+t5Uxg3G6vdkZ2i+a
	45Vr3x623rLo3sp0agUzhva1lxMzHpjxharuVAvyZsQV8ewe6qxvhFJKyniQSEa8bC89OZn0NTO
	jksc/oF71KPrDbGq/P0ye7DHSlOCVVfo=
X-Received: by 2002:a05:651c:a147:b0:3a3:35fb:11e with SMTP id
 38308e7fff4ca-3a5a5064976mr35081661fa.7.1789313691317; Sun, 13 Sep 2026
 08:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com> <20260910221349.19d86f1a@ryzen.lan>
In-Reply-To: <20260910221349.19d86f1a@ryzen.lan>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 13 Sep 2026 23:34:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v67TW_E7S9Mt1RyGJdw8NbV0D0PzM8Sw0Vhx9PzMe6CVwg@mail.gmail.com>
X-Gm-Features: AcwNN1VyMDzj0AftLULQr9ZHuu7pyYoxqSXKJ_6he6tuE7Sh0wYQwNYahEuc8jc
Message-ID: <CAGb2v67TW_E7S9Mt1RyGJdw8NbV0D0PzM8Sw0Vhx9PzMe6CVwg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2026 at 4:14=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Thu, 23 Jul 2026 01:26:38 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> Hi,
>
> > On Wed, Jul 22, 2026 at 6:43=E2=80=AFAM Andre Przywara <andre.przywara@=
arm.com> wrote:
> > >
> > > The Allwinner A523 uses the same GPIO voltage "withstand" programming
> > > (setting the input level voltage thresholds) as the previous SoCs, bu=
t
> > > for some odd reason inverts the encoding of 1.8V vs. 3.3V.
> > >
> > > Add a new bias voltage type to note this difference, and select it fo=
r
> > > the A523. At the same time also use the newer "CTL" version, which in
> > > addition allows to turn off the withstand programming for I/O voltage=
s
> > > other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used f=
or
> > > Ethernet PHYs). The A523 has that enable register, but didn't use it
> > > so far.
> > >
> > > This fixes eMMC and reportedly Ethernet operation on some A523 boards=
.
> > >
> > > Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A=
523")
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >
> >
> > Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> > Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A
>
> so what happens to this fix? Is it good to be merged? And who is going
> to take this? Linus? Or does it go through sunxi?

Linus needs to take this. It seems you didn't send it to him, nor the
linux-gpio mailing list?

Can you resend?

> Cheers,
> Andre
>
> > > ---
> > >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
> > >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
> > >  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 6 ++++++
> > >  drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 ++
> > >  4 files changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/=
pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > > index dfdcfa740ecc9..cffc1e53eef14 100644
> > > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > > @@ -26,7 +26,7 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL=
_MAX_BANKS] =3D
> > >  static struct sunxi_pinctrl_desc a523_r_pinctrl_data =3D {
> > >         .irq_banks =3D ARRAY_SIZE(a523_r_irq_bank_map),
> > >         .irq_bank_map =3D a523_r_irq_bank_map,
> > > -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> > > +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> > >         .pin_base =3D PL_BASE,
> > >  };
> > >
> > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pi=
nctrl/sunxi/pinctrl-sun55i-a523.c
> > > index 801f62abc93df..001bd42afa3ef 100644
> > > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > > @@ -26,7 +26,7 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_M=
AX_BANKS] =3D
> > >  static struct sunxi_pinctrl_desc a523_pinctrl_data =3D {
> > >         .irq_banks =3D ARRAY_SIZE(a523_irq_bank_map),
> > >         .irq_bank_map =3D a523_irq_bank_map,
> > > -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> > > +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> > >  };
> > >
> > >  static int a523_pinctrl_probe(struct platform_device *pdev)
> > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/=
sunxi/pinctrl-sunxi.c
> > > index cabcb8b6f38e5..634d9f1f23947 100644
> > > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > > @@ -718,6 +718,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct s=
unxi_pinctrl *pctl,
> > >  {
> > >         unsigned short bank;
> > >         unsigned long flags;
> > > +       bool inverted =3D false;
> > >         u32 val, reg;
> > >         int uV;
> > >
> > > @@ -757,6 +758,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct s=
unxi_pinctrl *pctl,
> > >                 writel(reg | val, pctl->membase +
> > >                        sunxi_grp_config_reg(pctl, pin));
> > >                 return 0;
> > > +       case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
> > > +               inverted =3D true;
> > > +               fallthrough;
> > >         case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
> > >                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) :=
 0;
> > >
> > > @@ -771,6 +775,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct s=
unxi_pinctrl *pctl,
> > >                 fallthrough;
> > >         case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
> > >                 val =3D uV <=3D 1800000 ? 1 : 0;
> > > +               if (inverted)
> > > +                       val =3D !val;
> > >
> > >                 raw_spin_lock_irqsave(&pctl->lock, flags);
> > >                 reg =3D readl(pctl->membase + pctl->pow_mod_sel_offse=
t);
> > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/=
sunxi/pinctrl-sunxi.h
> > > index d0936a32123ba..2c8648c3301b6 100644
> > > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > > @@ -128,8 +128,10 @@ enum sunxi_desc_bias_voltage {
> > >          * Bias voltage is set through PIO_POW_MOD_SEL_REG
> > >          * and PIO_POW_MOD_CTL_REG register, as seen on
> > >          * A100 and D1 SoC, for example.
> > > +        * Some SoCs invert the encoding for 1.8V vs. 3.3V.
> > >          */
> > >         BIAS_VOLTAGE_PIO_POW_MODE_CTL,
> > > +       BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> > >  };
> > >
> > >  struct sunxi_desc_function {
> > > --
> > > 2.46.4
> > >
> >
>

