Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C668D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1C2xT/nfLr8AU/PZsiRWgOb7G9id+Mn04mVbxAYJeUE=; b=zYOQDE7+ko7Q0RnpqbnaS1aZ1R
	6sOAAqvQAz8rNXmNFpsGVomgcE1ss+M1K6Kn3mLgNcXFI3p/q368Ao0SXOU4ytanVYX8Sw7vWSzB2
	4wUeKm3lKcnrMvCvvuqWRtdClQIUTejoEwebXDEYYW4J0AITuLPt+v8fk/JKPZe4iZ8shLiZuF7u5
	xQnQDiJVIj5GebuIQ8L1bahva4A/UzFZvkKHfTqb5+vQHapWVShtFCGoeYsU/JbMznF3YZaZzmMZT
	F6RQJ1KBXMIavgTZBBooAuDYAMTcekzKRH8xBEq/LEhcafq0/9mVCm23YDHrCxPJRE3j1iTBOzssW
	pmb+vp6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MDg-00000004F73-067t;
	Fri, 25 Oct 2024 15:27:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Lsm-000000048yl-3Swt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 15:05:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD6F4339;
	Fri, 25 Oct 2024 08:06:13 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A6F73F73B;
	Fri, 25 Oct 2024 08:05:42 -0700 (PDT)
Date: Fri, 25 Oct 2024 16:05:39 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Philippe
 Simons <simons.philippe@gmail.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
Message-ID: <20241025160539.5503fa92@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v676pzN6TX8xDHuESkGDLinCB9_3FLgKSmEBtxK2GSWxHQ@mail.gmail.com>
References: <20241025105620.1891596-1-andre.przywara@arm.com>
	<CAGb2v676pzN6TX8xDHuESkGDLinCB9_3FLgKSmEBtxK2GSWxHQ@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_080544_979355_3C64F24F 
X-CRM114-Status: GOOD (  36.92  )
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

On Fri, 25 Oct 2024 22:49:27 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi,

> On Fri, Oct 25, 2024 at 6:56=E2=80=AFPM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The H616 user manual recommends to re-parent the CPU clock during
> > frequency changes of the PLL, and recommends PLL_PERI0(1X), which runs
> > at 600 MHz. Also it asks to disable and then re-enable the PLL lock bit,
> > after the factor changes have been applied.
> >
> > Add clock notifiers for the PLL and the CPU mux clock, using the existi=
ng
> > notifier callbacks, and tell them to use mux 4 (the PLL_PERI0(1X) sourc=
e),
> > and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> > correct algorithms.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Hi,
> >
> > the manual states that those changes would be needed to safely change
> > the CPU_PLL frequency during DVFS operation. On my H618 boards it works
> > fine without them, but Philippe reported problems on his H700 board.
> > Posting this for reference at this point, to see if it helps people.
> > I am not sure we should change this without it fixing any real issues. =
=20
>=20
> IIRC we do this for all the other SoCs. But if you want to be cautious,
> we can wait for Philippe to give a Tested-by?

Yes, I copied this code from the A64 CCU, but IIRC this was desperately
needed there. But so far I didn't hear many complaints on the H616, and I
ran through like 100,000 transistions in a matter on minutes without any
issues yesterday.
And apparently this patch doesn't fix Philippe's immediate problem, so I
would like to hold it back for now, until we have either more testing,
with or without this patch.

Thanks,
Andre

> ChenYu
>=20
> > The same algorithm would apply to the A100/A133 (and the upcoming A523)
> > as well.
> >
> > Cheers,
> > Andre
> >
> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 28 ++++++++++++++++++++++++--
> >  1 file changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-h616.c
> > index 84e406ddf9d12..85eea196f25e3 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > @@ -1095,11 +1095,24 @@ static const u32 usb2_clk_regs[] =3D {
> >         SUN50I_H616_USB3_CLK_REG,
> >  };
> >
> > +static struct ccu_mux_nb sun50i_h616_cpu_nb =3D {
> > +       .common         =3D &cpux_clk.common,
> > +       .cm             =3D &cpux_clk.mux,
> > +       .delay_us       =3D 1, /* manual doesn't really say */
> > +       .bypass_index   =3D 4, /* PLL_PERI0@600MHz, as recommended by m=
anual */
> > +};
> > +
> > +static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =3D {
> > +       .common         =3D &pll_cpux_clk.common,
> > +       .enable         =3D BIT(29),      /* LOCK_ENABLE */
> > +       .lock           =3D BIT(28),
> > +};
> > +
> >  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
> >  {
> >         void __iomem *reg;
> >         u32 val;
> > -       int i;
> > +       int ret, i;
> >
> >         reg =3D devm_platform_ioremap_resource(pdev, 0);
> >         if (IS_ERR(reg))
> > @@ -1152,7 +1165,18 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >         val |=3D BIT(24);
> >         writel(val, reg + SUN50I_H616_HDMI_CEC_CLK_REG);
> >
> > -       return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_d=
esc);
> > +       ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_=
desc);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Reparent CPU during CPU PLL rate changes */
> > +       ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> > +                                 &sun50i_h616_cpu_nb);
> > +
> > +       /* Re-lock the CPU PLL after any rate changes */
> > +       ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> > +
> > +       return 0;
> >  }
> >
> >  static const struct of_device_id sun50i_h616_ccu_ids[] =3D {
> > --
> > 2.25.1
> > =20


