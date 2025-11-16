Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668E2CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWEmJvXLWKtYu/L5JeDbHlkZXkIRaSMD9Oz9+/ducRo=; b=DLwd3uSnqh6ab0
	PE6rDFGRyGAJ297zCDKTSe5bel2xwynDi2uN3Lly+otgRZhldUOmM+sS4ops91r3kEhWP7weuukK3
	FFM6UvtMS+Lf0nmWL7CFKaocFPtDgMES5qFwOVNezKWT4/0duoA+gCbF1hv+bixgpFuYZ1Ou5FEpa
	UWjNdlUz64cmiL3WGbiZIQ28p4pdpdzxb8j8lOAxSYrXx24xbTgICTF2+mnrN4WDXMeoXjt9DiKO5
	kP72TOOQ7Km2AY0L/1fC+guzjEGYN6F5Qs6eeMse7hmhRJ3wt+3BWb0AJUyIfDKuXXH2f1AywGICt
	lLy39TiGE5lh2XXxhCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdsl-0000000EkVa-1j6c;
	Sun, 16 Nov 2025 14:37:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdsi-0000000EkU8-3N0T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 14:37:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BC7C44628
	for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 14:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01220C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 14:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763303852;
	bh=2Bggx1JE8zrmrCOlLWA1b4H8PTZ9Hv6P2gnc61wAGjg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=posJn1XS4ftgErJjqUvH0GDpF9FsuzDwl1rhwa1b9rsVR+f9cCP7S0ZXyLpngQqol
	 NwV8eFpcuB/fUwrZtGrJutO9scwVj3WCVmnNJ3XjuD5yGutiH5yg0yMHBu9BicwzQw
	 8DNjXMv8YgR5jh+JVzTDF8yqQiYncen0EvxB1Zwph+fmXBmByLlExru97PAI66H4tU
	 ZsrmOmlrCT8z299pwj+5xptdXyMQORt8zKcY7N34MIVsOxQeyGlWRpRqp8T2xui/CN
	 +jYN8MaR4hL20JU2eS+Wzl8EGvUHtvbWBnoGh9+8NHRI4D0MD8tQiGT58YtEf+fZ7v
	 cpcmr+6tJ/pwA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37a5bc6b491so27567761fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 06:37:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfaQmzOuGd+6K5bqOAJAwCMeUDzPmotByCAJW35ZKMBY7fC80qx64kyWfBfs+a38uQ7wdeFHvt6qHo5GJAAPgt@lists.infradead.org
X-Gm-Message-State: AOJu0YxCWcm0yrqsbZfOEqmQ8kjxZJFxMjlz8RbtlYJ3wRD0Ru03o627
	9QTuA1sZQYRkZ/FroS1kuJ097CrfJJjKtQAfXkBM0RqOWDeohRYoObxmt9lvoa/7Yy4omJny3IM
	VSpJ5Ec5JkNYK/b3ucvHq4Gy9Dz2r08A=
X-Google-Smtp-Source: AGHT+IG7vqFgL8pcnoWY4X8bK83bCjs7yr5BwCnDCB4u5oYDjeQdmjUX3ZIX6NF6V8m3f8emPC7cEmlAcG+l7wyAhyk=
X-Received: by 2002:a2e:b952:0:b0:378:f267:3107 with SMTP id
 38308e7fff4ca-37babd46336mr21467291fa.37.1763303850006; Sun, 16 Nov 2025
 06:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116134609.447043-1-kuba@szczodrzynski.pl> <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
 <7ff30ae9-e4c0-47ae-80ad-726eaa557fd0@szczodrzynski.pl>
In-Reply-To: <7ff30ae9-e4c0-47ae-80ad-726eaa557fd0@szczodrzynski.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 16 Nov 2025 22:37:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v67iovqfErt20Oz0SrHC558zBDDFq1ZqRau83NOQ2w8AoQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnuktLAy6WzxMHGACOr-_rXESjXpP0XBu3tC1d0_mcaLovZAV-ch-mI9ko
Message-ID: <CAGb2v67iovqfErt20Oz0SrHC558zBDDFq1ZqRau83NOQ2w8AoQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_063732_874218_75955E9D 
X-CRM114-Status: GOOD (  31.31  )
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

On Sun, Nov 16, 2025 at 10:31=E2=80=AFPM Kuba Szczodrzy=C5=84ski
<kuba@szczodrzynski.pl> wrote:
>
> W dniu 2025-11-16 o 15:03:18, Chen-Yu Tsai pisze:
>
> > On Sun, Nov 16, 2025 at 9:46=E2=80=AFPM Kuba Szczodrzy=C5=84ski
> > <kuba@szczodrzynski.pl> wrote:
> >> [replying to v1 to keep the same series on Patchwork]
> > That is not the right way to do it.
> >
> > If you reply to an old series, the tooling does not pickup the new vers=
ion
> > as a separate series.
> >
> > ChenYu
>
> Hi,
>
> I noticed that it indeed didn't work. However, Patchwork didn't pick up t=
he v2 cover letter at all, so I thought replying to v2 would mess up the th=
read even more.
>
> That being said, the v3 cover letter is not visible there either.
>
> Should I resend this as v4 [which message to reply to?] or send a complet=
ely new series perhaps?

Each new version should be a completely new series.

If patchwork still didn't pick it up, then it's possible either your
patches didn't reach the mailing lists or the patchwork instances.
Please check lore to see if your patches are there.


ChenYu

> I apologize for the confusion, this is my first time doing that.
>
> Regards
> Kuba
>
> >> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> >> MIPI DSI D-PHY" which is required when using single-link LVDS0. The sa=
me
> >> PD0..PD9 pins are used for either DSI or LVDS.
> >>
> >> Other than having to use the combo D-PHY, LVDS output is configured in
> >> the same way as on older chips.
> >>
> >> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
> >> is then configured by the LCD TCON, which allows connecting a
> >> single-link LVDS display panel.
> >>
> >> Changes in v2/v3:
> >> - Applied code formatting changes from review comments
> >> - Changed "dphy" to "combo-phy"
> >> - Made the LVDS setup/teardown functions abort early in case of error
> >>    (adding a proper return value would require changes in several leve=
ls
> >>     of caller functions; perhaps could be done in a separate patch)
> >> - Added the PHY properties to DT bindings
> >> - Renamed lvds0_pins to lcd_lvds0_pins
> >> - Rebased on top of drm/misc/kernel/for-linux-next
> >> - Hopefully corrected the incomplete patch list of v2, which happened
> >>    due to an SMTP error
> >>
> >> Kuba Szczodrzy=C5=84ski (6):
> >>    phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
> >>    drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
> >>    drm/sun4i: Enable LVDS output on sun20i D1s/T113
> >>    dt-bindings: display: sun4i: Add D1s/T113 combo D-PHY bindings
> >>    riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
> >>    riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
> >>
> >>   .../display/allwinner,sun4i-a10-tcon.yaml     |  6 ++
> >>   .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 11 +++
> >>   drivers/gpu/drm/sun4i/sun4i_tcon.c            | 50 +++++++++++++
> >>   drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
> >>   drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 70 +++++++++++++++++=
+-
> >>   5 files changed, 141 insertions(+), 2 deletions(-)
> >>
> >> --
> >> 2.25.1
> >>
>

