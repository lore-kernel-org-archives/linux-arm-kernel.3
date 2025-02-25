Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4308FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKR2/tifCb6okA4X4epz/KUOoNfhkvPJV9FCmEibHqI=; b=2vFF+3T7DH/e8aLda3aG5fNxwx
	RXaycGTrutjtI0OZiH+7dfS7rQ4T4F+82etPOif6HbQ6YIJiSxIpTy9V3Ir+eajXR66he/o4oQNcE
	ML2OWJcAMatdqHP+hdsXdNIsdIb7f4eR5bVQnzr5bqbYvntFOD/bINgQhsnWf9OQ5crnfnbpwBt11
	HFPdIbLC+yuyHzedhUp8jSwnplkfJrEonsDcDQBL4yfvoaPzoz7G9oRaTWIWEQWoTSB7lD3OZolpy
	ruptV1mbdw0Go0Twe332FIvKKBtvO682mPRej3SVzJy8YLiPccc9tTk6qnVLUGueJ7jNQrb/DijVj
	9LBYYu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtH0-0000000H3lI-3jx5;
	Tue, 25 Feb 2025 11:38:51 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms21-0000000GnMO-13Jq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740478757; x=1772014757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DKR2/tifCb6okA4X4epz/KUOoNfhkvPJV9FCmEibHqI=;
  b=YEIKXQOM0UHYWMi2c0ZH1KJzWMW+tlkCLeytyKxT7HNb/eZ2BCuSNhuY
   eo5ft8stuNEcNqG5+dXnUT6s5mPN3SvqumV8hCRChbYXR2wr2w8NzPWyA
   2xsng5fJsz29mLoTQctzyMLLLx1SV3wwpFVkfGg0Dnn7oDbqv22qjEU2J
   qPM5edADgC23PsHQtOGiNpxLJTswZx7rB2MGi6X6EB4MpndXGMpEYRaRR
   kOa9vbP+viqGtErj5Q/F3UaSVMDUuWpcO0+SglOEYpilPoKFLxJjllV06
   f6kNs4g9ToOGfZiaP66BBndPCuY3zEz/M68X6ce8+j/g/1hEL9bScFuGL
   A==;
X-CSE-ConnectionGUID: xABZvsWMRgG2Dhmn/Dj8gQ==
X-CSE-MsgGUID: ZllzypggQ6ulAa3R2d3UHg==
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; 
   d="scan'208";a="42067507"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Feb 2025 11:19:12 +0100
X-CheckPoint: {67BD9920-57-EBA888C4-C1AC8B84}
X-MAIL-CPID: 78E27B4DAC71B22F8FCE08B9E6208EC3_0
X-Control-Analysis: str=0001.0A002101.67BD9921.0060,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14472160AF0;
	Tue, 25 Feb 2025 11:19:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740478748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DKR2/tifCb6okA4X4epz/KUOoNfhkvPJV9FCmEibHqI=;
	b=OaDhyVGyq/jpR0XnEBugrkJikhHocbi3gCS84qUod9vNJ7g8aFm6OnQBBGPVfs++S0/EBL
	YBLqXyUAYLpP8hUPLRRuV0uHjFmO/TpQFW3G/t0OH1V+jwRxcpiHQ2A/+9RncuBA/n7J37
	kHXnybS6V5qLvRWkmn8+oXLwnRt8tkvNOG5zY7Cf4KBKI5q9XDwwXgEyiRiQ0qO24V4AZ8
	PTI8vs2Ljr46oPJAi5GwhR46gq3K+yjpVvthtCwntelqwX+lkH7Lc2su2GJTpDbRVreJ01
	yAKVtaIUOvqA4CAzzoiMJhLGjXWtJFlyehSalSglKUS2XVIgGxsDZ8DEh4cltg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 5/5] arm64: dts: mba8xx: Add PCIe support
Date: Tue, 25 Feb 2025 11:19:03 +0100
Message-ID: <4633177.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z7zCyHtpKo0WAPMh@lizhi-Precision-Tower-5810>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
 <20250107140110.982215-6-alexander.stein@ew.tq-group.com>
 <Z7zCyHtpKo0WAPMh@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021917_784940_8E0088E2 
X-CRM114-Status: GOOD (  16.17  )
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

Am Montag, 24. Februar 2025, 20:04:40 CET schrieb Frank Li:
> On Tue, Jan 07, 2025 at 03:01:10PM +0100, Alexander Stein wrote:
> > Add PCIe support for TQMa8Xx on MBa8Xx board.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/boot/dts/freescale/mba8xx.dtsi | 32 +++++++++++++++++++----
> >  1 file changed, 27 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boo=
t/dts/freescale/mba8xx.dtsi
> > index 276d1683b03bb..117f657283191 100644
> > --- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> > @@ -36,6 +36,13 @@ chosen {
> >  		stdout-path =3D &lpuart1;
> >  	};
> >
> > +	/* Non-controllable PCIe reference clock generator */
> > +	pcie_refclk: clock-pcie-ref {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <100000000>;
> > +	};
> > +
> >  	gpio-keys {
> >  		compatible =3D "gpio-keys";
> >  		pinctrl-names =3D "default";
> > @@ -208,6 +215,12 @@ &flexcan2 {
> >  	status =3D "okay";
> >  };
> >
> > +&hsio_phy {
> > +	fsl,hsio-cfg =3D "pciea-x2-pcieb";
> > +	fsl,refclk-pad-mode =3D "input";
> > +	status =3D "okay";
> > +};
> > +
> >  &i2c1 {
> >  	tlv320aic3x04: audio-codec@18 {
> >  		compatible =3D "ti,tlv320aic32x4";
> > @@ -309,7 +322,16 @@ &lsio_gpio3 {
> >  			  "", "", "", "";
> >  };
> >
> > -/* TODO: Mini-PCIe */
> > +&pcieb {
> > +	phys =3D <&hsio_phy 0 PHY_TYPE_PCIE 0>;
> > +	phy-names =3D "pcie-phy";
> > +	pinctrl-0 =3D <&pinctrl_pcieb>;
> > +	pinctrl-names =3D "default";
> > +	reset-gpios =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> > +	disable-gpio =3D <&expander 7 GPIO_ACTIVE_LOW>;
>=20
> "disable-gpio" is undocument property.

Thanks for noticing, old downstream property slipped through. Will remove i=
t.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



