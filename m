Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B88C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 20:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4sLNT213axJxn+dDv5vnFAweh0CD8D88x6yQTKzvk0=; b=2TK66BF3MZ5cqDRXZUYLIWpHV8
	NnZuiIQpUtDjV9XNwLzugiLWYQDQa53gAH6TVlDfNI0CY9Pdzp8CrSQWpnaZ2OF6Pu72YkIxR0ml9
	8h1iYGbk7la/9/84U/CbcafHQazANyuZamHxx0T3olptCRf8HbApLgHfvvctr8pKyOfZmzOfOi9TR
	/5f5wqxllXWiHJXLyL1wfwzXudzM8AflAyEaFxKnw683ykbIbiCaERv8Ya/bGyUe3txQf3+atXu4h
	oQtdMfN454BQoWQJ36dWmo/WCPPqXL3L33a7MeOrNDmRM80YEl39RlWauRkHrDOhAwA93Qxgd9QC8
	bbNbhAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaJg-00000001ImZ-0dx4;
	Mon, 10 Feb 2025 20:23:40 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaI1-00000001IWe-0eOn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 20:21:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5de64873d18so3953941a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 12:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739218915; x=1739823715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4sLNT213axJxn+dDv5vnFAweh0CD8D88x6yQTKzvk0=;
        b=gZ+4CQ2GA0n4RkaaGWSq+IPAd5LW8pxS8Pvv0rayeuAcO8Bc2zPOU1tOhS5K5L4CNm
         TcbyIlL4xYtw4yzyIV1oACghg/69v5O65Aj21NbakjxaIUoGG181L4lmQzdecUXL4d5r
         yF7KcE0JaMC8pOirEGXaXe9czunXU0qz3d005zsx3gqJelB3qA4t/2OsbQQAb4doGduh
         SWY75VHhkXWm5COsY5aCc+1J5RCzu3wKs0XzuRlKevTmmgfiD0NqewQHNU8Unf4kzBg0
         LGfRoSDRN5Ax5MG4S/x+FWGxdQIQ48U6UkfgNpFq+jyD0C3o14agRatL8xi/rTcZ2+Wq
         aL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739218915; x=1739823715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4sLNT213axJxn+dDv5vnFAweh0CD8D88x6yQTKzvk0=;
        b=Vpl2h8EqJQQXRyzGM1uYcYs+S2A7v7ZmwwScy8/GoTGYRdwKJmtrQ4CZ3chnfewQIO
         g9yFjvfaBsYXImbYB+mDIwwCCo+Zb18qbdoq3fSeo93KbAxjOoJLqQo+98oPNGc9+awG
         fvAKPxLMnHI92/ccX4t8hpHpVAAtm4dbVCC+IpLET+dJDjOBR8kdZoBnJc+5MJvHYIsA
         qb81sn0QJ3aQPmGk1UBncNcwHxP35NXU5P/BKZfMItt+cybL7J6q0ykINAUj3ByOGDgq
         1VDFRNE+xS+nJUjGNfWan7LOsUIkNkSfJa6ztquix25jakOO7XReTJPf3jnJy/cgcy7r
         yWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMoKklJIa2sTdqJmDntsVFJ5gWrPJB2uUnmyej0fUrYOxmx4qNLxPi92NQGQEa4r/bsoasTMdKlToI5Jf+j6gd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0H9VQKa+yC+p2b3DK7JURXwpwo8pZrbdtp8iepCr4AgkvU/6N
	DTWuKoynTOdfbJaET1tiGhoyr9i9AGFjb6YmguODbiVXAWzJjuJGRaOlOlBMRKCfa864Mo+jP99
	xiSVPix1OmIAv98eOLquOGX+AGGA=
X-Gm-Gg: ASbGncv3GuCAzJbTvADmfHzXybZE980vMG0COP3AmTBEUwrrlx10SrJ2ztj2DvkqHIS
	/NKly2PMD6rMRANVPV+PBkQaPp5ps695dCyj7LfdQofdqx9yaiSGiC+CVut4d34LN8OFdEU/w
X-Google-Smtp-Source: AGHT+IEl6YEdiMsV1siZuJFhvx+GV4aMBPQlTUgyzGO6T4MZCuQCTLQqmVBt/VwazPwINTGGAJT/LjEuNEnQVRVAyjo=
X-Received: by 2002:a05:6402:1ccd:b0:5dc:cf9b:b034 with SMTP id
 4fb4d7f45d1cf-5de45027e45mr18280024a12.14.1739218914664; Mon, 10 Feb 2025
 12:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20250209183142.97671-1-simons.philippe@gmail.com> <20250210140536.08c33a56@donnerap.manchester.arm.com>
In-Reply-To: <20250210140536.08c33a56@donnerap.manchester.arm.com>
From: Philippe Simons <simons.philippe@gmail.com>
Date: Mon, 10 Feb 2025 21:21:43 +0100
X-Gm-Features: AWEUYZnldiVDFzt0NbkyDKPipNGBHw1BkJcirqj-jzPHbdnyqlosJKOqWcw-jHs
Message-ID: <CADomA4-BuTtGva+MhcfZzeidsHr9pe6sibFYz97b-5of+0ucRw@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_122157_196942_7D5807E6 
X-CRM114-Status: GOOD (  35.87  )
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

On Mon, Feb 10, 2025 at 3:05=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Sun,  9 Feb 2025 19:31:42 +0100
> Philippe Simons <simons.philippe@gmail.com> wrote:
>
> Hi Philippe,
>
> thanks for bringing this patch together!
>
> You should mention here *why* you want this patch, the motivation seems t=
o
> be missing, but would be crucial - and preventing a sure crash should mak=
e
> this a no-brainer.
>
> Maybe start with: The H616 manual does not state that the GPU PLL support=
s
> dynamic frequency configuration, so we must take extra care when changing
> the frequency. Currently any attempt to do device DVFS on the GPU lead ..=
.
>
> Then mention that the manual describes the algorithm for changing the PLL
> frequency, which the CPU PLL notifier code already support, so we reuse
> that.
>
> > Re-parent the GPU clock during frequency changes of the PLL.
> > Also it asks to disable and then re-enable the PLL lock bit,
> > after the factor changes have been applied.
> >
> > Add clock notifiers for the PLL and the GPU mux clock, using the existi=
ng
> > notifier callbacks, and tell them to use mux 1 (the GPU_CLK1 source),
> > and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> > correct algorithms.
> >
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 33 +++++++++++++++++++++++++-
> >  1 file changed, 32 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-h616.c
> > index 190816c35..e88eefa24 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > @@ -328,10 +328,12 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0"=
, gpu0_parents, 0x670,
> >                                      24, 1,   /* mux */
> >                                      BIT(31), /* gate */
> >                                      CLK_SET_RATE_PARENT);
> > +
> > +#define SUN50I_H616_GPU_CLK1_REG        0x674
> >  static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674=
,
> >                                       0, 2,   /* M */
> >                                       BIT(31),/* gate */
> > -                                     0);
> > +                                     CLK_IS_CRITICAL);
>
> The addition of CLK_IS_CRITICAL deserves a comment, something about that
> this clock is needed as a temporary fallback clock for the PLL frequency
> changes or so.
>
> >  static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
> >                     0x67c, BIT(0), 0);
> > @@ -1120,6 +1122,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =
=3D {
> >       .lock           =3D BIT(28),
> >  };
> >
> > +static struct ccu_mux_nb sun50i_h616_gpu_nb =3D {
> > +     .common         =3D &gpu0_clk.common,
> > +     .cm             =3D &gpu0_clk.mux,
> > +     .delay_us       =3D 1, /* manual doesn't really say */
> > +     .bypass_index   =3D 1, /* GPU_CLK1 */
> > +};
> > +
> > +static struct ccu_pll_nb sun50i_h616_pll_gpu_nb =3D {
> > +     .common         =3D &pll_gpu_clk.common,
> > +     .enable         =3D BIT(29),      /* LOCK_ENABLE */
> > +     .lock           =3D BIT(28),
> > +};
> > +
> >  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
> >  {
> >       void __iomem *reg;
> > @@ -1170,6 +1185,15 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >       val |=3D BIT(0);
> >       writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> >
> > +     /*
> > +      * Set the input-divider for the gpu1 clock to 3.
> > +      * Also enable gpu1 clock.
> > +      */
> > +     val =3D readl(reg + SUN50I_H616_GPU_CLK1_REG);
> > +     val |=3D BIT(31);
>
> Do we need this if the clock is marked as critical now?
I'll test that.
>
> > +     val |=3D BIT(1);
>
> You probably want to clear the lowest 2 bits first, then set bit 1,
> otherwise you end up with either 2 or 3, depending on what bit 0 was
> before.
Good catch, I'll address that in V2.
>
> Cheers,
> Andre
>
> > +     writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
> > +
> >       /*
> >        * First clock parent (osc32K) is unusable for CEC. But since the=
re
> >        * is no good way to force parent switch (both run with same freq=
uency),
> > @@ -1190,6 +1214,13 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >       /* Re-lock the CPU PLL after any rate changes */
> >       ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> >
> > +     /* Reparent GPU during GPU PLL rate changes */
> > +     ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
> > +                               &sun50i_h616_gpu_nb);
> > +
> > +     /* Re-lock the GPU PLL after any rate changes */
> > +     ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
> > +
> >       return 0;
> >  }
> >
>
Thanks for the review,
Philippe

