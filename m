Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD46E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wooyMz6V69rOWgXVqv8x+ga9QCy693idFla4iIf30yA=; b=ih1/P3Y85C4MOyGmIoT/uWZyEq
	x/23xURNtL9Oae2E8GVaYpKnJuAbuK/dyI4lYpHW45v81tqEhdnz0LBv4vEjcHd3x+bHr0L5uwVkR
	MjJfM9S6EwxePx0JFM43ZoyowBle7YfW2OK8MjZ4eTVP/yHFIXJ0g1eeKkhDk+Lyrz4UnlpOPiHzJ
	gVekBUXzGAyt7t92hRE3Z2S+u2O1aSzn+WG3GY0sKxgvap5jZVV8EDlh3iXDaJXXjIcJW6TZTTfUx
	WOvVlVP45uJ/ongJ73+fYSg1qE3iGn7AqY/gRz4voryQ68MFPnf3y344iw3xZtrXUo92D09m85SAd
	z965dyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMMeG-00000005ulQ-2DNY;
	Sat, 14 Dec 2024 07:33:12 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMMdC-00000005uf7-07jr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 07:32:07 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5f2e13cb356so1231700eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734161524; x=1734766324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wooyMz6V69rOWgXVqv8x+ga9QCy693idFla4iIf30yA=;
        b=V5a2A14JPrjIRija+avRWyam2LScwvRVGG1ZTcAC+KEboglck+TbbjxxehidCZjJvS
         DuYo7aI0ltYlEOpQ+5E3tLXkWB7JbQ13N+itSHzd37wp+NvVXJt20cj71fYuCcUlbr0V
         MImL1/N4CPs3GXXnebteIJsnVHtqNEEoor0Kq+3c9ShFYgYTdlufmGQGULIxJ9HIIN6a
         MqqUxmCUUyv9o/H12G4ufU9f3fIKTAQk1mGl8T5atLA7vUGmujn/zaBaqeLd1MZYJN0V
         Dz7yIT66WYz5v/HeS5FU8jUlIg0qlPrIdIT5XcBRZKcy/sVYTP0E0CYg6IHA9wk4kQ6f
         iJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734161524; x=1734766324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wooyMz6V69rOWgXVqv8x+ga9QCy693idFla4iIf30yA=;
        b=ufPVxAVQpSvzPZEfcRZzB/c9f2D6Eqt8JBhtDS+S5hKiHYiHYwuVj6qqaUppe5sbIy
         LtXUdvRLcn//539BD83AWYrTFNA+VEm6qOFrTb21GxUROrYOVuU2CVI4tbve/wSL3Acz
         HbaWYXjF619xQc/xuwQiMVpxoaqusq9bi5Somef4MRHExXLYdXxfZUvC6fITbABNZtBk
         Nph06bxaXlc45mEO9sVACZlDxZPLO22qwEtoGah1FSk1INX8bk7hw6J1cOq/1A/UYfvm
         5B/P057RD1S0nYOFxXzVhHeuDecdGQzvWcNRP82aIRRHZPcgvz0LpH5M6UNaBpRyPGri
         G1IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYTfAGcb8zjSTUvVfeLDVvxLOfnogEw2RHWTjT7aoj7BgyDCNxk7N63hStHl+66QjhaFonrP9IvOj6sxblHRw8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8dbSt42SvkVH4LZhW5ICPcBAM0tK5GtVgL9hqac+lP8MjDq9Q
	7O7biOUvNFxB9ERtn8BTv7ZTW9RuDvBSYs8ZF+ApAxk/Pnpq7k0mVVnZDbK4l0VMpk27WsSCS0M
	jJp36zJJ0jIhJCj9/mR0hhSM1cI8=
X-Gm-Gg: ASbGncu+YRwhFbnj2WVw6XinsQYtIeKOlOWWSOoEInZRsqvIYIGnyxIpxhiD/pJiaYX
	FUufw5Rq6xynrhVBwxNshFyIPsOoacQVyEgJdW7FGNuJasV1IurRrz8tNjJE5FIa6nhdRZ0EH
X-Google-Smtp-Source: AGHT+IGmFywcjc7izrlDXgnkzLIqMiL0MnGMAOEArWH0D15iqh0keA0TjPRq8hM4SyuuwLNun7DH3X+llzzdV2xoAhI=
X-Received: by 2002:a05:6870:7011:b0:29e:3d0b:834 with SMTP id
 586e51a60fabf-2a3ac614135mr3251697fac.5.1734161524360; Fri, 13 Dec 2024
 23:32:04 -0800 (PST)
MIME-Version: 1.0
References: <20230505052110.67514-1-me@crly.cz> <20230505052110.67514-2-me@crly.cz>
 <CA+E=qVcSV7H4=-fT2FUdNd5sneCO0GsA-qKrvQxy8PF89knckw@mail.gmail.com>
In-Reply-To: <CA+E=qVcSV7H4=-fT2FUdNd5sneCO0GsA-qKrvQxy8PF89knckw@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 13 Dec 2024 23:31:38 -0800
Message-ID: <CA+E=qVeroOt_L-r--K7uYrS+039x-BtgciVqoez5CmOtmYyqVg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux
To: Roman Beranek <me@crly.cz>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Icenowy Zheng <icenowy@aosc.io>, Ondrej Jirman <megi@xff.cz>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_233206_068885_B5167946 
X-CRM114-Status: GOOD (  30.62  )
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

On Fri, Dec 13, 2024 at 10:29=E2=80=AFPM Vasily Khoruzhick <anarsoul@gmail.=
com> wrote:
>
> On Thu, May 4, 2023 at 10:34=E2=80=AFPM Roman Beranek <me@crly.cz> wrote:
> >
> > TCON0's source clock can be fed from either PLL_MIPI, or PLL_VIDEO0(2X)=
,
> > however MIPI DSI output only seems to work when PLL_MIPI is selected an=
d
> > thus the choice must be hardcoded in.
> >
> > Currently, this driver can't propagate rate change from N-K-M clocks
> > (such as PLL_MIPI) upwards. This prevents PLL_VIDEO0 from participating
> > in setting of the TCON0 data clock rate, limiting the precision with
> > which a target pixel clock can be matched.
> >
> > For outputs with fixed TCON0 divider, that is DSI and LVDS, the dotcloc=
k
> > can deviate up to 8% off target.
>
> Hi Roman,
>
> I'm a bit late, but this patch breaks the LCD on Pine64 Pinebook. When
> TCON0 parent is pll-mipi, the panel is blank and I get vblank timeouts.
>
> With this patch reverted it works if I force pll-video-2x as a parent for=
 TCON0.

And changing TCON0 parent in runtime by poking CCU registers also
fixes the issue (even though pll-video-2x is *much* slower than
pll-mipi), i.e. if I do "devmem2 0x01c20118 w 0x82000000" the picture
appears on the screen.

> So for me RGB output doesn't seem to work with PLL_MIPI, but works
> only with PLL_VIDEO0_2X. Any ideas on how to fix it?
>
> Regards,
> Vasily
>
>
>
> > Signed-off-by: Roman Beranek <me@crly.cz>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-=
ng/ccu-sun50i-a64.c
> > index 41519185600a..eb36f8f77d55 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > @@ -528,11 +528,18 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de=
_parents,
> >                                  0x104, 0, 4, 24, 3, BIT(31),
> >                                  CLK_SET_RATE_PARENT);
> >
> > +/*
> > + * DSI output seems to work only when PLL_MIPI selected. Set it and pr=
event
> > + * the mux from reparenting.
> > + */
> > +#define SUN50I_A64_TCON0_CLK_REG       0x118
> > +
> >  static const char * const tcon0_parents[] =3D { "pll-mipi", "pll-video=
0-2x" };
> >  static const u8 tcon0_table[] =3D { 0, 2, };
> >  static SUNXI_CCU_MUX_TABLE_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents=
,
> >                                      tcon0_table, 0x118, 24, 3, BIT(31)=
,
> > -                                    CLK_SET_RATE_PARENT);
> > +                                    CLK_SET_RATE_PARENT |
> > +                                    CLK_SET_RATE_NO_REPARENT);
> >
> >  static const char * const tcon1_parents[] =3D { "pll-video0", "pll-vid=
eo1" };
> >  static const u8 tcon1_table[] =3D { 0, 2, };
> > @@ -953,6 +960,11 @@ static int sun50i_a64_ccu_probe(struct platform_de=
vice *pdev)
> >
> >         writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> >
> > +       /* Set PLL MIPI as parent for TCON0 */
> > +       val =3D readl(reg + SUN50I_A64_TCON0_CLK_REG);
> > +       val &=3D ~GENMASK(26, 24);
> > +       writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
> > +
> >         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_d=
esc);
> >         if (ret)
> >                 return ret;
> > --
> > 2.32.0 (Apple Git-132)
> >
> >

