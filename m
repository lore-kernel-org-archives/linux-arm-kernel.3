Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B386EFD8752
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5FIWaWE0co3LowI/eMGOtAkN3ZAvhxjd0+PkwHLDyk=; b=US2vQHilDsEmOxH+/++5OpuQG6
	AUMKoKw9pdvFdXTQNTEaOUszwAz5ty6Xa6MJhnx4Tuuy5VLYWN41A34bxU6UtCQ82BXKUg3t2b+0g
	o3ZepsEwtR2u487pBC5vdZNsl+epeM9s3UMS/JAZmLAI0sWRD7ak7CYvka2GzAfRcdnjWQcLerpFV
	Nu62RgTvJzufspvkOHhIfdBTAdsXAy6B10wgQJg/TaKYNte47Quw5fp6QVVl8dsXBeru9oPM96qvZ
	pi9aTp1p2bZsqnV47CUjAMKWcaOoXvubkpGF88Hih9wZA8Tgjb2RjsMlqBdzJzn/0EzZM2ivL6rYt
	v6xnbpKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TJH-00000006H52-38bk;
	Tue, 17 Mar 2026 12:14:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TJG-00000006H4N-3bnq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 12:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=b5FIWaWE0co3LowI/eMGOtAkN3ZAvhxjd0+PkwHLDyk=; b=hPj3oIq00cu6mt3y1K9NcGqJYA
	vHYRpI41jc2NHVd61EZMo9a0uarqhBxhT1ctzeQ38gQOGIjdZwyU+x6ineWhoSNXzMoMMRd1tWByl
	3+LccsFARExm2DSFRsBC3rH1Wg/ZJ3FZNxMi4MoRtVbp4eWbXdpzKV0HTW2xeeSanOSjOgQcHPWl+
	/aNQ5CrchDNcH2+Hjf5MYOlRJ/SdN+yxyJOu0Q1YGsngB57krV/lQNAgSExzkwgIgl9aVbSwNN7zW
	xmbkfgaa97RhJQyALKDAkumf480xj3TXGvE4/a/fOCdoSWP2WXen+fTouZfcMJDkD7OCuYSqECdUV
	PtNCS9AA==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TJD-00000008vks-2ge5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=b5FIWaWE0co3LowI/eMGOtAkN3ZAvhxjd0+PkwHLDyk=; b=AcMYPuNvp23pX/uMLsfp6PvAf/
	lVpicQjIZ0JsL8mywrl8D9VA9wXzqSJSoxYrlJAaAU2PlTW4Ko5r03uHUqkUo06uxSMxrYK+FKGle
	8SRviTMyFyT+BumJcrHRj+CYiKKbPYdtmutRknNNRH/dA6zqhTdoHmn0dJNaqkmFyRHmIZZOULunP
	umgJONixYRVPw9vP0AeZlxCP2pj3edqe4HG6Rh3mSV6jPWYrEgVMBaIJoxgPJQVS/hMcc4Nu8Y7IH
	IGGmPvgkvRdPp320mQdT+YWwrNoXgaBAJw2LHf9KEk+wT4Dzz4hsMBs69FhYfA7kFuMu9O8ZhWq3G
	F/0YTFCg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2TJC-000K6r-22;
	Tue, 17 Mar 2026 13:14:02 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2TJB-000JvM-0u;
	Tue, 17 Mar 2026 13:14:02 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: add initial device tree for
 TQMa93xx/MBa93xxLA-MINI
Date: Tue, 17 Mar 2026 13:14:01 +0100
Message-ID: <12858524.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <30599533-91de-41fd-9420-3f8693ec92ac@kernel.org>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>
 <30599533-91de-41fd-9420-3f8693ec92ac@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_121403_872267_0C01EF42 
X-CRM114-Status: GOOD (  23.77  )
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

Hi,

Am Dienstag, 17. M=E4rz 2026, 13:10:06 CET schrieb Krzysztof Kozlowski:
> On 17/03/2026 12:17, Alexander Stein wrote:
> > From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> >=20
> > This adds support for TQMa93xx module attached to MBa93xxLA-MINI board.
>=20
>=20
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94

Sure, will do in v2. Thanks.

> > TQMa93xx is a SOM series using i.MX93 SOC.
> > The MBa93xxLA-MINI has a small form factor and is designed with
> > WLAN, Bluetooth and WWAN applications in mind.
> >=20
> > Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../imx93-tqma9352-mba93xxla-mini.dts         | 637 ++++++++++++++++++
> >  2 files changed, 638 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93x=
xla-mini.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/d=
ts/freescale/Makefile
> > index 31bc80586c682..db536522600ac 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -461,6 +461,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx93-phycore-rpmsg.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba91xxca.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba93xxca.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba93xxla.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba93xxla-mini.dtb
> > =20
> >  imx93-tqma9352-mba91xxca-lvds-tm070jvhg33-dtbs :=3D imx93-tqma9352-mba=
91xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
> >  imx93-tqma9352-mba91xxca-rgb-cdtech-dc44-dtbs :=3D imx93-tqma9352-mba9=
1xxca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-min=
i.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
> > new file mode 100644
> > index 0000000000000..97693aa5e904d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
> > @@ -0,0 +1,637 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > +/*
> > + * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > + * D-82229 Seefeld, Germany.
> > + * Author: Martin Schmiedel
> > + */
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/net/ti-dp83867.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include <dt-bindings/usb/pd.h>
> > +#include "imx93-tqma9352.dtsi"
> > +
> > +/{
> > +	model =3D "TQ-Systems i.MX93 TQMa93xxLA on MBa93xxLA-MINI SBC";
> > +	compatible =3D "tq,imx93-tqma9352-mba93xxla-mini",
> > +		     "tq,imx93-tqma9352", "fsl,imx93";
> > +	chassis-type =3D "embedded";
> > +
> > +	chosen {
> > +		stdout-path =3D &lpuart1;
> > +	};
> > +
> > +	aliases {
> > +		eeprom0 =3D &eeprom0;
> > +		ethernet0 =3D &eqos;
> > +		ethernet1 =3D &fec;
> > +		gpio0 =3D &gpio1;
> > +		gpio1 =3D &gpio2;
> > +		gpio2 =3D &gpio3;
> > +		gpio3 =3D &gpio4;
> > +		i2c0 =3D &lpi2c1;
> > +		i2c1 =3D &lpi2c2;
> > +		i2c2 =3D &lpi2c3;
> > +		i2c3 =3D &lpi2c4;
> > +		i2c4 =3D &lpi2c5;
> > +		mmc0 =3D &usdhc1;
> > +		mmc1 =3D &usdhc2;
> > +		mmc2 =3D &usdhc3;
> > +		rtc0 =3D &pcf85063;
> > +		rtc1 =3D &bbnsm_rtc;
> > +		serial0 =3D &lpuart1;
> > +		serial1 =3D &lpuart2;
> > +		serial2 =3D &lpuart3;
> > +		serial3 =3D &lpuart4;
> > +		serial4 =3D &lpuart5;
> > +		serial5 =3D &lpuart6;
> > +		serial6 =3D &lpuart7;
> > +		serial7 =3D &lpuart8;
> > +		spi0 =3D &lpspi1;
> > +		spi1 =3D &lpspi2;
> > +		spi2 =3D &lpspi3;
> > +		spi3 =3D &lpspi4;
> > +		spi4 =3D &lpspi5;
> > +		spi5 =3D &lpspi6;
> > +	};
> > +
> > +	backlight_lvds: backlight {
> > +		compatible =3D "pwm-backlight";
> > +		pwms =3D <&tpm5 0 5000000 0>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_backlight>;
> > +		brightness-levels =3D <0 4 8 16 32 64 128 255>;
> > +		default-brightness-level =3D <7>;
> > +		power-supply =3D <&reg_12v0>;
> > +		enable-gpios =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;
> > +		status =3D "disabled";
>=20
> Why do you add disabled nodes? If the display is not on the board, then
> the node should not be here.
>=20
> There is no user of that in patch 3/3, either.

Well, LVDS (via LDB) on i.MX93 is not yet in mainline, patches are pending.
So there is no user yet. But the wiring for the backlight and panel is fixed
already on the mainboard, e.g. LVDS channels, PWM channels, GPIOs etc.

So this node will be enabled on a later display overlay. Right now
everything is setup already.


Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



