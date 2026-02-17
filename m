Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4A2E909D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhpHpdiFFO5ZL1q/tmFrQhOlbvRZt8hZGUIWiR6fiQ0=; b=ZMZ5ERCZYQCYNV
	zN2A0dGHPoEs4KCwje/vY6n7ghUkJt4/XAvetYjXAiaaaTZojsyzGveWZXTNv3q1SEFz2SoQHMVWP
	NQ15d3GWs0GXiuLMMOJrDsewZ4hdfPca51jOqysu8iiNukaBppOHtRSlqu4bgN9YF57a22TpY7hgt
	4az3u3GZQo41VihPtxs3wHWtatiAp2UfZGnp2M+YlFplVW1ko8g87w0l7p/CO5I0JML/HCwJ2Luel
	JcOQZO/KF2nBZY+n3c0bD5eNUSVUJx/YdecCKjKDHDSXksknYg0N8eDwFZJIlI9I1cfWv9lR99MzG
	RVS+jQhjuYr6vQzIHwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNkJ-00000008YMa-3Vp5;
	Tue, 17 Feb 2026 16:16:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNkI-00000008YLz-1c5Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 16:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 741C461850
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 16:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271FAC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771344977;
	bh=/s1RSE8T94ukLF8gyrvHmN7vQg+U8Jmkrx6H9/OZWAs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=nN+VI4WuCOwe4QC38vIXqvsap416Euw1liNmCKOikP7ZhCBV00LmzuDodGJ12Ppfy
	 6RZoPYAIKoT8hCorpQlDODkmFQa6vY3P97n4WM9cf0FazkUpVuTsQVEaq9sRVMDCnS
	 JiZvk5ey6/F7UU0BWXXJo9oZJxVAxHiknvlrflbtBaHCMJuAlauBt/1u0P1X7G5jBF
	 OgOF5DNRPSGiTyE/alg8vG5ILSM8BJehojRd0cxPYHlnil8+ppOG9xVYGUqyiBd7pe
	 r87ZeFIghE4NSSpSuBaaSsH1PzNVCM2qddK1OoUKDPh6dSCBBC9Voif6oAiVO7ZrDd
	 xtIRbYsF6wYyw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-385c2f88618so34311721fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 08:16:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0vOgSYpd3+5ANrGB5Cq9WTAsqZKSgEV19CkGTLE1Lqy/SBMkOwY/fRRNLHplbRBy/gZgztxTd8tlH1l3exnhz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyb0hpFJh8uGa4zyJsse+jdgBIuuQagD3Jid1WFKOjQ8O6WCJo
	KvdvcPCNoumXNkgVeMWYBfva5nfb+LbNeSr4oMoZxfC2ilMaspGHYJgNFTYJoPB5ZIEsV0pGbJx
	+gpPLdtQNpbVfeFimhiCDOP9eNcbcf1E=
X-Received: by 2002:a05:651c:4201:b0:386:1ce2:11a9 with SMTP id
 38308e7fff4ca-38810570e54mr43358761fa.23.1771344975457; Tue, 17 Feb 2026
 08:16:15 -0800 (PST)
MIME-Version: 1.0
References: <20260217093004.3239051-1-wens@kernel.org> <20260217155717.0b99c310@orionap.fritz.box>
In-Reply-To: <20260217155717.0b99c310@orionap.fritz.box>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Feb 2026 00:16:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v65tO56=7pJtaB8WaW8O9A9m0EGa_XLW_Jj-HN8pEHtvEg@mail.gmail.com>
X-Gm-Features: AaiRm53DUWoECi_d8aGElFwN4vbWdscHSmspOWe2xrny_hmVpKJsk2TliQhvzuw
Message-ID: <CAGb2v65tO56=7pJtaB8WaW8O9A9m0EGa_XLW_Jj-HN8pEHtvEg@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Feb 17, 2026 at 11:57=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> On Tue, 17 Feb 2026 17:30:03 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> Hi,
>
> > When the PRCM clk driver was added, somehow the r-spi module clock
> > was skipped over.
> >
> > Add it so that r-spi can actually work.
>
> The patch itself looks fine, compared against the manual, so for that:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> But I noticed one thing below....
>
> > Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM=
 CCU")
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523-r.c
> > index 0339c4af0fe5..db0e36d8838e 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> > @@ -83,9 +83,22 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_pwmctrl_clk, "=
r-pwmctrl",
> >  static SUNXI_CCU_GATE_HW(bus_r_pwmctrl_clk, "bus-r-pwmctrl",
> >                        &r_apb0_clk.common.hw, 0x13c, BIT(0), 0);
> >
> > -/* SPI clock is /M/N (same as new MMC?) */
>
> Ooops, looks like I saw that clock, but someone managed to dodge it :-(
> Sorry about that.
>
> > +static const struct clk_parent_data r_spi_parents[] =3D {
> > +     { .fw_name =3D "hosc" },
> > +     { .fw_name =3D "pll-periph" },
> > +     { .name =3D "pll-periph0-300M" },
> > +     { .name =3D "pll-periph1-300M" },
> > +     { .name =3D "pll-audio" },
>
> Looking a bit closer, all the PRCM PLL-AUDIO clocks in the manual refer t=
o
> AUDIO1PLL4X, which is provided by the MCU CCU, not AUDIO0PLL4X provided b=
y

That's weird though, given that pll-audio1 only has /2 and /5 outputs.

The BSP code from https://github.com/radxa/allwinner-bsp.git also shows
pll-audio0-4x as the parent for the r_spi module clock. It does show
pll-audio1-4x as the parent for the ahbs clock, but "pll-audio1-4x" is
nowhere to be found.

So I think it's an error. Moreover, I think we might have discussed this
on IRC at the time?

> the main CCU. So we would need to change the DT? I wonder if that breaks
> boots with kernels which didn't know the MCU CCU yet (v6.15-v6.17)?

Did you mean new DT with old kernel? I think we don't really support that?

But even if you did do that, AFAIK the clk parent resolution is done
opportunistically, so if this one is missing, it would be fine as long
as no user is directly trying to select it with clk_set_parent(); and
even if they did, it would probably fail?

I could be wrong though.


Anyway, thanks for being thorough.


ChenYu

> Cheers,
> Andre.
>
> > +};
> > +static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0=
x150,
> > +                               0, 5,         /* M */
> > +                               8, 5,         /* P */
> > +                               24, 3,        /* mux */
> > +                               BIT(31),      /* gate */
> > +                               0);
> >  static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi",
> >                        &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
> > +
> >  static SUNXI_CCU_GATE_HW(bus_r_spinlock_clk, "bus-r-spinlock",
> >                        &r_ahb_clk.common.hw, 0x16c, BIT(0), 0);
> >  static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
> > @@ -138,6 +151,7 @@ static struct ccu_common *sun55i_a523_r_ccu_clks[] =
=3D {
> >       &bus_r_twd_clk.common,
> >       &r_pwmctrl_clk.common,
> >       &bus_r_pwmctrl_clk.common,
> > +     &r_spi_clk.common,
> >       &bus_r_spi_clk.common,
> >       &bus_r_spinlock_clk.common,
> >       &bus_r_msgbox_clk.common,
> > @@ -169,6 +183,7 @@ static struct clk_hw_onecell_data sun55i_a523_r_hw_=
clks =3D {
> >               [CLK_BUS_R_TWD]         =3D &bus_r_twd_clk.common.hw,
> >               [CLK_R_PWMCTRL]         =3D &r_pwmctrl_clk.common.hw,
> >               [CLK_BUS_R_PWMCTRL]     =3D &bus_r_pwmctrl_clk.common.hw,
> > +             [CLK_R_SPI]             =3D &r_spi_clk.common.hw,
> >               [CLK_BUS_R_SPI]         =3D &bus_r_spi_clk.common.hw,
> >               [CLK_BUS_R_SPINLOCK]    =3D &bus_r_spinlock_clk.common.hw=
,
> >               [CLK_BUS_R_MSGBOX]      =3D &bus_r_msgbox_clk.common.hw,
>
>

