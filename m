Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4402CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5i6MhlYke8rnqKO/tS98g5fBrnPRxzSkJ1XspPZU0EE=; b=XoCARKXSwDI0CzhRFxJmZE7q0K
	T3y3lwfwY1YAYbZ7BB6h5f6VuaYfXELVJukJEcgReuifN+vu7uREJr5jAA3w6/ErqthywXTaBkf0v
	cJJwfmGIZoJ2TwdiPuFXT4cG6rdjjoKzWShqT7bzhneZ7U41uzDit9blUbND9Vu2GA7gNPb4rksR5
	ZeUFLrZWVeueNV7hWTeiJ78QOJWsfQf9Ktj1Tc/51pGJT4o/RRyZ+rLEFdHwpJgiCFcM3nXdheCJl
	eAtO7iJ3lOxolgz44GF1iQ2WhkJ+j2jvUXAzp/RvROTYe1KNd5rZxo1supFc2whATinB2ym+aXqzo
	1/Z75DRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe0V-00000002RuM-1UOf;
	Fri, 16 Oct 2026 09:13:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe0U-00000002RtU-2D2B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:13:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE1F3601F0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 09:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872E01F000CA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792142021;
	bh=5i6MhlYke8rnqKO/tS98g5fBrnPRxzSkJ1XspPZU0EE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ylc4MP6shCeSJV4WrGsrfrjjA/Fz8tO0A+VDlxgExXH9rrTOXeyGrHARmllzf3Zr8
	 T2H+Bkd5SvDMAreRqiewzPCByEFzDEo4EEdDfAWEmGey38Owg9KqeUXmUbpgbSad66
	 OzT2ZyWl/NuZVjnKm8EHBlUtD8/+ygkrIKh0soevDAva5qxApnwYfgG3kNkdX1VJzy
	 Vo4VU/Z7rKdETYzdpEAJio8clCXfAID1Vu92GR2vKVV6Cp3FeR+Bjvsh3nhwLxxTjr
	 hI9qRrtEZuxR6/QrneYK4bWvw+NFhXP3yWeWgwwjsQxvac2bJQDfF69YgEyoHZevIc
	 IU0nC4ulTDzVA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be42ae8eb1so936324e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 02:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByefuJthkkdrrib54y8HSk1aUlpB8/MXeThvOu8WJHUta7A64nvQndW/Nq/Tf8DGD8SAYNm13m3DileHxua8Dag@lists.infradead.org
X-Gm-Message-State: AFq9FYKAzW683UFO9Ovileg8TRrShnYm/2r6CMuBwzdMHHjPyr0MmnMu
	61T6+Vdixh2+Vgz3YvrkvebYZY09XtbChqNbCfCybrUnjonT5g3EtArdvwgsir9LB1k4tHc8VyK
	Ds23UBeJxeDK8Og6wPawkjbcQf3v2KIo=
X-Received: by 2002:a05:6512:2251:b0:5be:323a:358f with SMTP id
 2adb3069b0e04-5be323a362bmr3949389e87.24.1792142020304; Fri, 16 Oct 2026
 02:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com> <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
 <as8+sqlBEuhfdtZ8@shlinux89>
In-Reply-To: <as8+sqlBEuhfdtZ8@shlinux89>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 11:13:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tKnT0qr5chD-fhxgTM-f9kcdFRsKVBbbqionBp9iTyw@mail.gmail.com>
X-Gm-Features: AclHuK-rmknBFrbVZQXIDXh4F4e2O13GZgGSgm2vgJ2GpZVzPlYS8PS1UAie0Ck
Message-ID: <CAD++jL=tKnT0qr5chD-fhxgTM-f9kcdFRsKVBbbqionBp9iTyw@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2026 at 10:30=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wr=
ote:
> On Wed, Oct 14, 2026 at 01:10:48AM +0200, Linus Walleij wrote:

> >Hi Peng,
> >
> >On Sun, Oct 11, 2026 at 1:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> >
> >>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
> >>                 unsigned int offset, unsigned long conf)
> >>  {
> >> -       struct device_node *np =3D port->dev->of_node;
> >> +       int ret;
> >> +
> >> +       if (!mxc_gpio_has_pad_wakeup(port))
> >> +               return false;
> >
> >Why is the entire call to mxc_gpio_generic_config()
> >bailing out here if the port does not have pad wakeup?
> >
> >> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> >> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> >> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> >> -               return (gpiochip_generic_config(&port->gen_gc.gc,
> >> -                                               offset, conf) =3D=3D 0=
);
> >> +       ret =3D gpiochip_generic_config(&port->gen_gc.gc, offset, conf=
);
> >> +       if (ret)
> >> +               return false;
> >
> >Then no generic config can happen.
> >
> >This looks weird, isn't it just some of the configs that
> >don't work?
>
> The early return is correct and matches the original behavior - only
> i.MX8 SoCs with SCU have pad wakeup hardware.
>
> gpiochip_generic_config() here calls into the pinctrl backend's
> pin_config_set(), which on i.MX8 programs the SCU firmware with the
> PAD wakeup source type.  Non-i.MX8 SoCs don't have an SCU pinctrl backend=
.
>
> The function name is misleading - its only caller is mxc_gpio_set_pad_wak=
eup().

This is just a big hack and I want it removed.

Implicit in this reasoning is: the only config we support on
the pinctrl back-end is wakeups so let's gate the entire function
call if we don't support wakeup.

This is a *generic* back-end like the function says:
gpiochip_generic_config() so the GPIO driver can't make
assumptions about what the pinctrl backend can and
cannot do. In a new SoC using the same driver the
pinctrl back-end could be something different.

So this is breaking modularization and encapsulation.

It is better to let the pin controller return -ENOTSUPP
or whatever is appropriate instead of gating the
call like this,

Yours,
Linus Walleij

