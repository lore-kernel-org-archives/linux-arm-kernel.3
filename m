Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82415C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 06:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vujtl7k0J0xfsx/gk2sVAPp2kmuOquUNaPtzb/ZzXTI=; b=kDtgUXbrf4Mf3/AtEoDm7N/cb5
	aQWYU2/BnpHN6FDm4wHgQc6nsL1xTh3P7N4L45eTcEpJ6k/1K+riHBT5jCh8Og92qQQrkyRI8x0+e
	PaGWtytcvXBB2KxIkw5ovFclvv2if7AF1WzkV0Vdb1kRoRJMioeAMnl7qpUgziHplKGNzyMJt1ZAe
	mUHHcQ0JGDzfeq1F0XMCpOMBWLad0chwLpKeCaEXI2NvyWclmE+Blvg/4ZvYy/r3J6m+MTYVbIujr
	B4ju7Nxr8Sy3WhwjEzuWKTxQCbVCqbHeUxcE2eOjxvmUypqs2J31QuD0iiLsz3Bi+nhDXZ7C1YnEI
	th+GKU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursbE-00000004dmZ-1Z8J;
	Fri, 29 Aug 2025 06:28:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursYW-00000004dS6-0HNH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 06:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756448748; x=1787984748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vujtl7k0J0xfsx/gk2sVAPp2kmuOquUNaPtzb/ZzXTI=;
  b=UHU7S+XGr9PiA9l01GZmkp2Z9Hc/VDjEHX1czUQqEh7yTpMzVe948c+9
   4tS647FnMNnS1CdHt63B7IS6c50wrOiAdAe+inxLQorHfF8PRsY1ZNHOe
   L7bHxoetn3MA3LDiHz+ua9/G0x3ZcUrl9I/Hf3UDKvwUVANIhmM+1O4H7
   laavDd/+pyswbcE//ZLIYhTQx2RN9xVV7Yc8f+pfHWGtQrbb4hujvSWbR
   tLDvr2VcNwvL1SikSB6eUAZGOioKPwVdGiDUNVJvhSudJq+jpfN7qobfm
   Rnu7Vt3HYQmojis+l5aGODwmtkaOzEMfjFJwvajOKJiZyWFMrD5k/9nMx
   Q==;
X-CSE-ConnectionGUID: 7Mte/+MUQ0aCJWgneVcnew==
X-CSE-MsgGUID: 4hhVDECaQGuUhjDia+aJiA==
X-IronPort-AV: E=Sophos;i="6.18,221,1751234400"; 
   d="scan'208";a="45969392"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Aug 2025 08:25:45 +0200
X-CheckPoint: {68B147E9-A-299FBAB0-EF52EDE7}
X-MAIL-CPID: 0EBBB9024D966849B3550DCC2AF26C29_5
X-Control-Analysis: str=0001.0A002103.68B14809.0018,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19848169E37;
	Fri, 29 Aug 2025 08:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756448740;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vujtl7k0J0xfsx/gk2sVAPp2kmuOquUNaPtzb/ZzXTI=;
	b=DHgMwMjT3u7GRd6pIPJTSqLjyMt9OAO/Mk+hxfrNQAVZiv5jarK923RhXkfJ5GGeL2iBUJ
	2HkTAOlITvBZLYiM6nVl6tYrSLgxvNBOumVP4cGr36EL16JVSbwWCN3Y8GOKqIBFrjRRtW
	/9O9pTId20lCaATJGvyUmI0GeswDLGyvUYEStiaRc1OQ3R6yMWHWZEajSBoHCxGTLPr6z2
	GZWMON+INNJoT6NwOrk01aj5wJlltsdGoY1bQbWWecHpt/Lf8H3o6+BiOXf+JngENFTLmX
	+mynaiaeGNm97EZmPi1gk+uDp9WQLIr5/ryMNKMNEwJhYvfUDnmZJE6C/r5vZw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial device tree for
 TQMa91xxCA/MBa91xxCA
Date: Fri, 29 Aug 2025 08:25:37 +0200
Message-ID: <2674392.Lt9SDvczpP@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aLCfTswvqXDLtAhm@lizhi-Precision-Tower-5810>
References: <20250828094745.3733533-1-alexander.stein@ew.tq-group.com>
 <20250828094745.3733533-3-alexander.stein@ew.tq-group.com>
 <aLCfTswvqXDLtAhm@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_232548_586784_41CD71B5 
X-CRM114-Status: GOOD (  19.92  )
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

Hi Frank,

Am Donnerstag, 28. August 2025, 20:26:22 CEST schrieb Frank Li:
> On Thu, Aug 28, 2025 at 11:47:43AM +0200, Alexander Stein wrote:
> > This adds support for TQMa91xxCA module attached to MBa91xxCA board.
> > TQMa91xx is a SOM using i.MX91 SOC. The SOM features PMIC, RAM, e-MMC a=
nd
> > some optional peripherals like SPI-NOR, RTC, EEPROM, gyroscope and
> > secure element.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../freescale/imx91-tqma9131-mba91xxca.dts    | 737 ++++++++++++++++++
> >  .../boot/dts/freescale/imx91-tqma9131.dtsi    | 295 +++++++
> >  3 files changed, 1033 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91x=
xca.dts
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/d=
ts/freescale/Makefile
> > index 947de7f125caf..3a937232d6f29 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -338,6 +338,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8qxp-tqma8xqps-mb-sm=
arc-2.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8ulp-9x9-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8ulp-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx91-11x11-evk.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx91-tqma9131-mba91xxca.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-9x9-qsb.dtb
> >
> ...
> > +
> > +	pinctrl_jtag: jtaggrp {
> > +		fsl,pins =3D <MX91_PAD_DAP_TCLK_SWCLK__JTAG_MUX_TCK	0x051e>,
> > +			   <MX91_PAD_DAP_TDI__JTAG_MUX_TDI		0x1200>,
> > +			   <MX91_PAD_DAP_TDO_TRACESWO__JTAG_MUX_TDO	0x031e>,
> > +			   <MX91_PAD_DAP_TMS_SWDIO__JTAG_MUX_TMS	0x1200>;
> > +	};
>=20
> Any one use it?

You are right. There is no direct user in DT, but their connection is fixed
to JTAG. I'll hook it up to gpio3, as the GPIOs on these pads belong
to this controller.=20

>=20
> > +
> > +	pinctrl_lpi2c3: lpi2c3grp {
> > +		fsl,pins =3D /* SION | HYS | OD | FSEL_3 | DSE X4 */
> > +			   <MX91_PAD_GPIO_IO28__LPI2C3_SDA		0x4000199e>,
> > +			   <MX91_PAD_GPIO_IO29__LPI2C3_SCL		0x4000199e>;
> > +	};
> > +
> ...
> > +
> > +	/* protectable identification memory (part of M24C64-D @57) */
> > +	eeprom@5f {
> > +		compatible =3D "atmel,24c64d-wl";
> > +		reg =3D <0x5f>;
> > +		vcc-supply =3D <&buck4>;
> > +	};
> > +
> > +	imu@6a {
>=20
> I am not if "imu" is common node name.

Device tree spec name recommendation only mentions gyrometer, but this is a
gyroscope, so I will go with the latter one.

Best regards
Alexander

>=20
> Frank
> > +		compatible =3D "st,ism330dhcx";
> > +		reg =3D <0x6a>;
> > +		vdd-supply =3D <&buck4>;
> > +		vddio-supply =3D <&buck4>;
> > +	};
> > +};
> > +
> > +&usdhc1 {
> > +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 =3D <&pinctrl_usdhc1>;
> > +	pinctrl-1 =3D <&pinctrl_usdhc1>;
> > +	pinctrl-2 =3D <&pinctrl_usdhc1>;
> > +	vmmc-supply =3D <&buck4>;
> > +	vqmmc-supply =3D <&buck5>;
> > +	bus-width =3D <8>;
> > +	non-removable;
> > +	no-sdio;
> > +	no-sd;
> > +	status =3D "okay";
> > +};
> > +
> ...
> > +};
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



