Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011CEC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5p9FTy7AYLJTuOgTYlyr5CXgIB8ZTMo/qUcqJKJ+R2A=; b=dnWlcpTONbCZNzfEbP+WkSaXvu
	caOK17i4qp4zhxdni0IXTuZsvMm7zxieGv9nURCMxIyhujygo1hIlVoGwf5xPGHZORiog7vyp6i8c
	Gr/+yNBbG1Ucot4MR1afdKyxmmIIdpgrkKSLsabZsoY7vGJyyXIOKatX8ztb0LdjdoveNKajXHAGM
	fsOpTOUXvgVaHB4mt0s7TiLlWKdKVTQ6Y3IP0IE4jZgraz+C5SI9eWJCwO7CihH9Y4rnqk3CIIMFA
	31bvn/2knTNqcOkUS8nZbwKLUipIWk/cFfz6QEQQZTBYsw5U7Vu1/WzF7lP6tsooWRJKqQx0BgplZ
	z8LbHCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDqO-0000000FYLT-0DQi;
	Wed, 14 May 2025 15:16:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDWy-0000000FUMg-2fq0;
	Wed, 14 May 2025 14:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5p9FTy7AYLJTuOgTYlyr5CXgIB8ZTMo/qUcqJKJ+R2A=; b=SFWN+OqtmTFp2j4dLkRybIlqbz
	5kjm0yFYbNSjomwR3wYbcWIguySDN8zXHaf4maKpcUl5Hj5gjb2Vy83Q27W/vpy3k0BurvwIoM5Ed
	/UNEggWNoaBh6Pdh98RnwmxebJVxs00iySpDhB4cF81oHmH/SQ0dPL22DT8cCiaICV+DcjDY4F2Ad
	p2zjKo/AWtIqgK5etugm8QkZz0q0m7Rk2vqi+3qidN9Wbd+2bOiEIBiRteC3rwmfb+Y1OZ6+jtRST
	njHyej/a6n3S8uFgijlss264TMF9Y4qGOkwNktqz2VQ7sx6xxlggaVmJY93vrCBSK9VxFFcDIV/iF
	GEMIv6zQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFDWv-0000000HDk5-1uBX;
	Wed, 14 May 2025 14:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5p9FTy7AYLJTuOgTYlyr5CXgIB8ZTMo/qUcqJKJ+R2A=; b=LHWtmkWWW0cgvOXeSkW5bnE2fg
	fF8OFmRs3E23GBjNKjvlIhsDPzL4M7H/qMbzMMjXCcPnTlWz1yItm8KGVjDHobIUgfQrByyOqovtS
	P1kfJUHIV4vmrDFCHRHT/VuGRnMkpvLmUaNB2YbaxnZDovY9paCznZm6mNeuPN96BbIMF6ZYmuDsi
	G7SWWK7P9TmzuWdnOzkdfeWbx21aGkzSy03eKU3E27JB7vEMUyG2x2+gNqpOgEciZtmzbayRmcyGM
	ia4gSsIt7Qc2FxQNEbWP6LYkYzM7+lV9dUeYX+cqvdJbTO3DN2qTOcOalkDVyajAcGiOVegtL6w37
	B4yiBFMA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFDWs-0006q0-Jr; Wed, 14 May 2025 16:56:18 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: quentin.schulz@cherry.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 4/6] arm64: dts: rockchip: add px30-cobra base dtsi and board
 variants
Date: Wed, 14 May 2025 16:56:17 +0200
Message-ID: <38830328.XM6RcZxFsP@diego>
In-Reply-To: <20250514133951.GA1975151-robh@kernel.org>
References: <20250513150234.2331221-1-heiko@sntech.de>
 <20250513150234.2331221-5-heiko@sntech.de>
 <20250514133951.GA1975151-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_155621_695827_FA72B911 
X-CRM114-Status: GOOD (  22.36  )
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

Am Mittwoch, 14. Mai 2025, 15:39:51 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Rob Herring:
> On Tue, May 13, 2025 at 05:02:32PM +0200, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > Cobra are Touchscreen devices built around the PX30 SoC using
> > a variety of display options.
> >=20
> > The devices feature an EMMC, network port, usb host + OTG ports and
> > a 720x1280 display with a touchscreen.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile         |   4 +
> >  .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
> >  .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
> >  .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
> >  .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  73 +++
> >  arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 566 ++++++++++++++++++
> >  6 files changed, 760 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146=
w-a2.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146=
w.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148=
w.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd182=
9.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dt=
s/rockchip/Makefile
> > index 3e8771ef69ba..8151e8bb1cd3 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -1,4 +1,8 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-cobra-ltk050h3146w-a2.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-cobra-ltk050h3146w.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-cobra-ltk050h3148w.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-cobra-ltk500hd1829.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-evb.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-engicam-px30-core-ctouch2.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-engicam-px30-core-ctouch2-of10.d=
tb
> > diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dt=
s b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
> > new file mode 100644
> > index 000000000000..1d26164be7b8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
> > @@ -0,0 +1,39 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> > + */
> > +
> > +/dts-v1/;
> > +#include "px30-cobra.dtsi"
> > +
> > +/ {
> > +	model =3D "Theobroma Systems Cobra with LTK050H3146W-A2 Display";
> > +	compatible =3D "tsd,px30-cobra-ltk050h3146w-a2", "tsd,px30-cobra", "r=
ockchip,px30";
> > +};
> > +
> > +&dsi {
> > +	status =3D "okay";
> > +
> > +	panel@0 {
> > +		compatible =3D "leadtek,ltk050h3146w-a2";
> > +		reg =3D <0>;
> > +		backlight =3D <&backlight>;
> > +		iovcc-supply =3D <&vcc_1v8>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&dsp_rst>;
> > +		reset-gpios =3D <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
> > +		vci-supply =3D <&vcc_2v8>;
> > +
> > +		port {
>=20
> 'port' is not allowed by this binding.

It is since last week [0], because the Leadtek displays got their port
property added.


[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3Dbf0636f4348e098e2338eebbe42d7780c58a1195




