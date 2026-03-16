Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22606F53D72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Q4YECgmSY7mu1Lwp5M0oFbz1wgF/DzoeAiw4Jpj4jM=; b=sD9TRHcKAHAFbw
	aNgotrEyDBYRWMXkyFARGWWrZ9uXKBjq6+TAu5tTqR3o9usfWU1S93YaYqxpZuVnnaObLXlw6Yt1L
	x78poT/KR5jNEFzsuqnKQIWe/Fxe+oSkm4eSPR7z37k0Khha+DT43sm9/Tjrs2TOP8tc5p6nkfbpr
	E4UQzgc7/Od7C3brPHfZAZ+2YwQOMNB9Uc/w8AuAlvYXwXnnBQfElDn3j3XXKVA1b9J1p266dLnDz
	BjgjX6xHztYxbPDVuhRf6Wy67J25GCXt2H0P5o3Lsknb3L+fOX0rCAGDwPGWeR4Knp+ZdLPnq1SI6
	mO0gvURtxYAr34sBSmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Axm-00000004TUQ-38nm;
	Mon, 16 Mar 2026 16:38:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Axl-00000004TU5-0wKw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:38:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B49E60142
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 16:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001E6C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 16:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773679120;
	bh=WjRKcPX2nSZFIAsL9u41UKk0xj40ZYukny2MNWHY1RY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=mKsGxBEp6h75iJZzNhCxdVIVnWbF8LCzPPxMjkLa6ZTcqnd87h4sDB6H7Zo1JmLbg
	 yzL9YRI3KfzZA+AerScuZ4vutXDs1p024BEI7DLuHMyqN4FdKCwJpUC6PGyL5ZqHf5
	 U9UdRxq64mOmR9l3Nz00XuU8CkpO/+qiCHE3XL0U3CHwCGmgFgvdRhEiF75IsA7XVH
	 NT2QTFh68EA3lidx0t/GNkZ6wgH0yCZ2Hfr1uj9XQRSUvcFhhpqm5jqM+ypRJV1gNO
	 JmnJqF+3dsuiQq5Nyz82yEvnRHjfDeV6STsRnaUvpaY3swisuDeoTXqcDE8XGVdoWH
	 N4GOfSZd6ib1w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a49fc06b4so36389811fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlsam/35zwYUrwWE+3ZvnD+kkG95A3yUPAESv489IdQ92QvuiMrEQuKsAHHr9Q/Hv9KU3CNnt2KJy9j5OqLg2P@lists.infradead.org
X-Gm-Message-State: AOJu0YyHwm6LVaUiO7jei8IWlEQ+fCAJCzQqHYLUOPHk/kXSiVVJ2YQZ
	8yX/Jb3zGtavdAi3+7VSVB9qw/BtkaNQs2FOIK3slpqTzFh0Nx5/Wx3C3lghB1yslkKwLxM76XE
	LO9OV1O9DWKN6wCJZk2/GN8gHv7jm9Pc=
X-Received: by 2002:a05:651c:2115:b0:387:c1a:70bd with SMTP id
 38308e7fff4ca-38a8966895amr46258671fa.2.1773679118307; Mon, 16 Mar 2026
 09:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl> <480b227c-c85b-4ff0-a825-3e82f64821f6@arm.com>
In-Reply-To: <480b227c-c85b-4ff0-a825-3e82f64821f6@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Mar 2026 00:38:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64rerhGS1HO_gk9YxgwRD2DkQaOp2d7+s-AgvbsV6UEhA@mail.gmail.com>
X-Gm-Features: AaiRm53keWjTxhNFEZxuYoh_gy-I4m09ah_LqOADR8F3LM-d3K2fa672mykDgzE
Message-ID: <CAGb2v64rerhGS1HO_gk9YxgwRD2DkQaOp2d7+s-AgvbsV6UEhA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Mon, Mar 16, 2026 at 10:37=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi,
>
> On 3/14/26 09:09, Michal Piekos wrote:
> > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a=
.
> >
> > The issue is caused by gpiochip_lock_as_irq() which is failing when gpi=
o
> > is in unitialized state.
> >
> > Solution is to set pinmux to GPIO INPUT in
> > sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> > earlier.
> >
> > Tested on Orange Pi Zero 3.
> >
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> > Changes in v3:
> > - Drop v2 solution which was returning input instead of error when pin
> >    is not initialized.
> > - Add checking pinmux configuration in
> >    sunxi_pinctrl_irq_request_resources() and set pin to input if
> >    uninitialized
> > - Link to v2: https://lore.kernel.org/r/20260308-rc2-boot-hang-v2-1-516=
fdb820953@mmpsystems.pl
> >
> > Changes in v2:
> > - Dropped the previous faulty solution which was forcing the axp313 to
> >    use r_pio as interrupt controller as pointed out by Jernej =C5=A0kra=
bec.
> > - Implemented suggestion from Andrey Skvortsov to return default
> >    direction as input
> > - Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d79=
2d1a78dfd@mmpsystems.pl
> > ---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 13 +++++++++++++
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
> >   2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index c990b6118172..7d46f7613672 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -1089,6 +1089,9 @@ static int sunxi_pinctrl_irq_request_resources(st=
ruct irq_data *d)
> >   {
> >       struct sunxi_pinctrl *pctl =3D irq_data_get_irq_chip_data(d);
> >       struct sunxi_desc_function *func;
> > +     unsigned int offset;
> > +     u32 reg, shift, mask;
> > +     u8 muxval;
> >       int ret;
> >
> >       func =3D sunxi_pinctrl_desc_find_function_by_pin(pctl,
> > @@ -1096,6 +1099,16 @@ static int sunxi_pinctrl_irq_request_resources(s=
truct irq_data *d)
> >       if (!func)
> >               return -EINVAL;
> >
> > +     offset =3D pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
> > +     sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> > +     muxval =3D (readl(pctl->membase + reg) & mask) >> shift;
> > +
> > +     /* Change muxing to GPIO INPUT mode if at reset value */
> > +     if (muxval =3D=3D SUN4I_FUNC_IO_DISABLE) {
>
> The "high impedance"/reset value depends on the SoC generation: older
> SoCs didn't have one, so they used 0 (GPIO_INPUT), which is the closest
> to "off" you can get there. Most SoCs afterwards indeed used 0x7, as you
> set below, but newer SoCs (D1/T113, A523, ...) use 0xf now.
>
> Would it work to do:
>         if (muxval !=3D SUN4I_FUNC_INPUT) {
> or shall we just force SUN4I_FUNC_INPUT always, without even checking?
> Or can there be other settings already (for instance the IRQ function)?

Yes, by some badly written DT. Pinctrl muxing happens first, then
request_irq(), so you could accidentally re-mux a pin that some
peripheral is using into an IRQ if we don't do the check properly.

> Not really familiar with the call chain here, but shouldn't the mux be
> set to the IRQ function (0x6/0xe) here anyway?

The muxing happens happens a few lines below, right after
gpiochip_lock_as_irq(). However we're trying to silence the warning
that gpiochip_lock_as_irq() indirectly causes.


ChenYu

> > +             sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
> > +                           SUN4I_FUNC_INPUT);
> > +     }
> > +
> >       ret =3D gpiochip_lock_as_irq(pctl->chip,
> >                       pctl->irq_array[d->hwirq] - pctl->desc->pin_base)=
;
> >       if (ret) {
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index ad26e4de16a8..22c527fc6ae2 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -86,6 +86,7 @@
> >
> >   #define SUN4I_FUNC_INPUT    0
> >   #define SUN4I_FUNC_IRQ              6
> > +#define SUN4I_FUNC_IO_DISABLE        7
>
> As mentioned above, this cannot be a simple fixed define for all SoCs.
>
> Cheers,
> Andre
>
> >
> >   #define SUNXI_PINCTRL_VARIANT_MASK  GENMASK(7, 0)
> >   #define SUNXI_PINCTRL_NEW_REG_LAYOUT        BIT(8)
> >
> > ---
> > base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> > change-id: 20260308-rc2-boot-hang-269e8546635b
> >
> > Best regards,
>

