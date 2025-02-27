Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEAEC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWz8azjbSVzMO5hesdQqLVfPW8tdj2Mvtub7uQ9nCnc=; b=4vfrHUuavbpJiSUcCwxhG+1PDR
	1AUrPo+/iooD5sSCBvaH3HZcQUl0NMUk0k2tTdMatOx6bgQGP3Cf+GvEVcoz+VlNT9pIsyx0WJnoK
	8RNkIw0rZ/J0+atW1wl0aSz45LD7YsZaubZ8JkBoGfuBV8E7QxiaegwwvY7Tnu1tgAcEkkzAvsTmG
	cemrAP3R8B047mDkDFD0V39MQyCbiD6hsPUJDnE8gj0NmwzCm7dUtkm+6inJpp4tK8dlRSCSnVivg
	6dnF+xmmHK0imoyHWyduTVtTc0vqpCwmQme+J2jdHLhDRWc69I4LpHKoL0CkZpWPtNbbnqjpXNyrM
	uapNHPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndWZ-00000007SCP-42hK;
	Thu, 27 Feb 2025 13:01:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncqH-00000007Khn-0MRw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:18:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 971B62BCA;
	Thu, 27 Feb 2025 04:18:31 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FF5E3F673;
	Thu, 27 Feb 2025 04:18:14 -0800 (PST)
Date: Thu, 27 Feb 2025 12:18:11 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/8] pinctrl: sunxi: support moved power
 configuration registers
Message-ID: <20250227121811.23460bf0@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v67V7PAOC8MLVzE5SwwvpogN_WLNhQnRVD2pikGVDHtJjA@mail.gmail.com>
References: <20250214003734.14944-1-andre.przywara@arm.com>
	<20250214003734.14944-5-andre.przywara@arm.com>
	<CAGb2v67V7PAOC8MLVzE5SwwvpogN_WLNhQnRVD2pikGVDHtJjA@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_041817_212812_ED9D2CE8 
X-CRM114-Status: GOOD (  25.65  )
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

On Mon, 17 Feb 2025 23:48:13 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi,

> * # Be careful, this email looks suspicious; * Out of Character: The send=
er is exhibiting a significant deviation from their usual behavior, this ma=
y indicate that their account has been compromised. Be extra cautious befor=
e opening links or attachments. *
> On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The Allwinner pincontroller IP features some registers to control the
> > withstand voltage of each pin group. So far those registers were always
> > located at the same offset, but the A523 SoC has moved them (probably to
> > accommodate all eleven pin banks).
> >
> > Add a flag to note this feature, and use that to program the registers
> > either at offset 0x340 or 0x380. So far no pincontroller driver uses
> > this flag, but we need it for the upcoming A523 support.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 15 +++++++++++----
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++++--
> >  2 files changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index 83a031ceb29f2..a1057122272bd 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -736,9 +736,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sun=
xi_pinctrl *pctl,
> >                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
> >
> >                 raw_spin_lock_irqsave(&pctl->lock, flags);
> > -               reg =3D readl(pctl->membase + PIO_POW_MOD_CTL_REG);
> > +               reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
> >                 reg &=3D ~BIT(bank);
> > -               writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
> > +               writel(reg | val, pctl->membase + pctl->pow_mod_sel_off=
set);
> >                 raw_spin_unlock_irqrestore(&pctl->lock, flags);
> >
> >                 fallthrough;
> > @@ -746,9 +746,12 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct su=
nxi_pinctrl *pctl,
> >                 val =3D uV <=3D 1800000 ? 1 : 0;
> >
> >                 raw_spin_lock_irqsave(&pctl->lock, flags);
> > -               reg =3D readl(pctl->membase + PIO_POW_MOD_SEL_REG);
> > +               reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset +
> > +                           PIO_POW_MOD_SEL_OFS);
> >                 reg &=3D ~(1 << bank);
> > -               writel(reg | val << bank, pctl->membase + PIO_POW_MOD_S=
EL_REG);
> > +               writel(reg | val << bank,
> > +                      pctl->membase + pctl->pow_mod_sel_offset +
> > +                      PIO_POW_MOD_SEL_OFS);
> >                 raw_spin_unlock_irqrestore(&pctl->lock, flags);
> >                 return 0;
> >         default:
> > @@ -1520,6 +1523,10 @@ int sunxi_pinctrl_init_with_flags(struct platfor=
m_device *pdev,
> >                 pctl->pull_regs_offset =3D PULL_REGS_OFFSET;
> >                 pctl->dlevel_field_width =3D DLEVEL_FIELD_WIDTH;
> >         }
> > +       if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
> > +               pctl->pow_mod_sel_offset =3D PIO_11B_POW_MOD_SEL_REG;
> > +       else
> > +               pctl->pow_mod_sel_offset =3D PIO_POW_MOD_SEL_REG;
> >
> >         pctl->irq_array =3D devm_kcalloc(&pdev->dev,
> >                                        IRQ_PER_BANK * pctl->desc->irq_b=
anks,
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index 6cf721876d89d..a93385e456a57 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -87,9 +87,11 @@
> >  #define SUNXI_PINCTRL_VARIANT_MASK     GENMASK(7, 0)
> >  #define SUNXI_PINCTRL_NEW_REG_LAYOUT   BIT(8)
> >  #define SUNXI_PINCTRL_PORTF_SWITCH     BIT(9)
> > +#define SUNXI_PINCTRL_ELEVEN_BANKS     BIT(10)
> >
> > -#define PIO_POW_MOD_SEL_REG    0x340
> > -#define PIO_POW_MOD_CTL_REG    0x344
> > +#define PIO_POW_MOD_SEL_REG            0x340
> > +#define PIO_11B_POW_MOD_SEL_REG                0x380
> > +#define PIO_POW_MOD_SEL_OFS            0x004 =20
>=20
> Shouldn't this be PIO_POW_MOD_CTL_OFS instead?

Ah, I already got lost myself in those three-letter stubs, but you are
right: it's the offset of the control register within the POW_MOD(?)
register block.
So nice catch, will fix it.

Thanks,
Andre

> ChenYu
>=20
> >
> >  #define PIO_BANK_K_OFFSET              0x500
> >
> > @@ -173,6 +175,7 @@ struct sunxi_pinctrl {
> >         u32                             bank_mem_size;
> >         u32                             pull_regs_offset;
> >         u32                             dlevel_field_width;
> > +       u32                             pow_mod_sel_offset;
> >  };
> >
> >  #define SUNXI_PIN(_pin, ...)                                   \
> > --
> > 2.46.3
> > =20
>=20
>=20


