Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90563C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pMAM3jS9r6nAZ+U+w2D6O3OnxfyOXhlL/X2d3h4lI0=; b=loAGzr257PRkykEW4ezN6tfZu1
	SsTmhYUAqlPI08uZx5L9srhc9ircPNP4mviDfMIk8Y3V3mFzTYoIJg+erDHNLxHumG6x6Y0A10c2H
	Stezm0MFkL0GIWnOdv8HPjwXM/t23TP6ccI0ks+geLBSq9G/dpXfPxckys76oCtVtnMR+v2m3Ch67
	gTsXVSQvm6Y/t+FJsMZhQtn7VQ5Fmz5zFBa1LSNk3taQDJBmY11Xwnf1CaumHwU6e6hjh/v3bPw2L
	eC0Jp0ZP99gLeC0GprxQUkGocTbCb4kiwKTPeLZ618GXJWUNW+zMSFP/7zX1u7+i/b2yPNnHTpyuE
	yG1KgS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l9w-0000000FKBd-0mM6;
	Thu, 10 Sep 2026 20:14:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l9s-0000000FKB1-3nf5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 20:14:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 432C4237B;
	Thu, 10 Sep 2026 13:14:03 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C0863F7B4;
	Thu, 10 Sep 2026 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789071246; bh=gfXhe7PvSLgUM9JlQ2R7pV874oO92+8H9AqxCKCruk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MkugrDu3RzksLLH5p7+S9kX0xUdGuKYdCUm8XrKKuBDQtULluoXboTuCwe6RO/6T2
	 utkWNgoCeYz/cV7lI1ji+MfLq1bqC2MM9ZpF6Ey1f5/++vRqUqCqjLnWsUyHK9MndU
	 K6Rt9K48HNFHYc1pTCAR9G4ASSbJWHvrXjTR46AE=
Date: Thu, 10 Sep 2026 22:13:49 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Message-ID: <20260910221349.19d86f1a@ryzen.lan>
In-Reply-To: <CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com>
References: <20260721223956.13665-1-andre.przywara@arm.com>
	<CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_131409_110336_9A3873F8 
X-CRM114-Status: GOOD (  31.37  )
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

On Thu, 23 Jul 2026 01:26:38 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> On Wed, Jul 22, 2026 at 6:43=E2=80=AFAM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The Allwinner A523 uses the same GPIO voltage "withstand" programming
> > (setting the input level voltage thresholds) as the previous SoCs, but
> > for some odd reason inverts the encoding of 1.8V vs. 3.3V.
> >
> > Add a new bias voltage type to note this difference, and select it for
> > the A523. At the same time also use the newer "CTL" version, which in
> > addition allows to turn off the withstand programming for I/O voltages
> > other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used for
> > Ethernet PHYs). The A523 has that enable register, but didn't use it
> > so far.
> >
> > This fixes eMMC and reportedly Ethernet operation on some A523 boards.
> >
> > Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A52=
3")
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>=20
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A

so what happens to this fix? Is it good to be merged? And who is going
to take this? Linus? Or does it go through sunxi?

Cheers,
Andre

> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
> >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 6 ++++++
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 ++
> >  4 files changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pi=
nctrl/sunxi/pinctrl-sun55i-a523-r.c
> > index dfdcfa740ecc9..cffc1e53eef14 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > @@ -26,7 +26,7 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_M=
AX_BANKS] =3D
> >  static struct sunxi_pinctrl_desc a523_r_pinctrl_data =3D {
> >         .irq_banks =3D ARRAY_SIZE(a523_r_irq_bank_map),
> >         .irq_bank_map =3D a523_r_irq_bank_map,
> > -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> > +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> >         .pin_base =3D PL_BASE,
> >  };
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523.c
> > index 801f62abc93df..001bd42afa3ef 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > @@ -26,7 +26,7 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX=
_BANKS] =3D
> >  static struct sunxi_pinctrl_desc a523_pinctrl_data =3D {
> >         .irq_banks =3D ARRAY_SIZE(a523_irq_bank_map),
> >         .irq_bank_map =3D a523_irq_bank_map,
> > -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> > +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> >  };
> >
> >  static int a523_pinctrl_probe(struct platform_device *pdev)
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index cabcb8b6f38e5..634d9f1f23947 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -718,6 +718,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sun=
xi_pinctrl *pctl,
> >  {
> >         unsigned short bank;
> >         unsigned long flags;
> > +       bool inverted =3D false;
> >         u32 val, reg;
> >         int uV;
> >
> > @@ -757,6 +758,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sun=
xi_pinctrl *pctl,
> >                 writel(reg | val, pctl->membase +
> >                        sunxi_grp_config_reg(pctl, pin));
> >                 return 0;
> > +       case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
> > +               inverted =3D true;
> > +               fallthrough;
> >         case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
> >                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
> >
> > @@ -771,6 +775,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sun=
xi_pinctrl *pctl,
> >                 fallthrough;
> >         case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
> >                 val =3D uV <=3D 1800000 ? 1 : 0;
> > +               if (inverted)
> > +                       val =3D !val;
> >
> >                 raw_spin_lock_irqsave(&pctl->lock, flags);
> >                 reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index d0936a32123ba..2c8648c3301b6 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -128,8 +128,10 @@ enum sunxi_desc_bias_voltage {
> >          * Bias voltage is set through PIO_POW_MOD_SEL_REG
> >          * and PIO_POW_MOD_CTL_REG register, as seen on
> >          * A100 and D1 SoC, for example.
> > +        * Some SoCs invert the encoding for 1.8V vs. 3.3V.
> >          */
> >         BIAS_VOLTAGE_PIO_POW_MODE_CTL,
> > +       BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> >  };
> >
> >  struct sunxi_desc_function {
> > --
> > 2.46.4
> >
>=20


