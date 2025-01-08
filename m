Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A697EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0u83Xgz9I4bi5xsbhIsloF0YqIhh17FKuV4H0UoU5ww=; b=Sblu9Ip6E5V2mq2DfYWBgVvPBx
	6mE6miJjCl3R4DoMt9RfKpvuQ/IoSmazWHb8wnmFPoMwPUjK+Wq2gP/hPOar+hPsWcBf/v0H6In92
	cyLKTbVohyfFyAS5LO8qALpah71pB9rMMwAHezS3AO8zmfkWc+f3MifT+PjZVYQxsjAJLXt4YN1fP
	8tRcaAOEGXFNmJ8QVCCzOrMUJbS/pzaw9ipae4w9kLifzsfHaXvcSIMJfvOVa8H0MSJB4a+k4zBkK
	gkNgB8iKoy4jlz1yrsxOcksdjNB5J4mx36E2XMJrjvhaG+m5zXv8XbRWYweb0qR0MM0jOMuENslhb
	NvUViSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVT8G-00000007wvm-02tm;
	Wed, 08 Jan 2025 10:17:48 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSpZ-00000007tJY-1DCn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736330309; x=1767866309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0u83Xgz9I4bi5xsbhIsloF0YqIhh17FKuV4H0UoU5ww=;
  b=oEfUm/O+VepfVio0M+XywFXtqWVD64zGh+Cbyvn+SzmviQm0JFwFJ1eR
   g2scIWYrMTWFArmFZbFsb+eLN7Q1xDh4pqX4zF7+6jdW4+29cKu+x81KH
   qZIHzO2b4NxAnZ280u5aWj/n0Vhym4M0ZAw4sBzEe5zbO8yiEuiwzci9Q
   DfMFONI4U1pOnmINPCGx7e84QBmgtQA/V/Dc1A/sgTq2CG8veEVgFPfhn
   jyJmsfbfIVtPyqnc2b3ikvlcFeobZ8L8JqkyRI/jhJKOqrx02xNxRh5gy
   EYAYkug5+8jFpTqqTLyUMtFvskqaa70yQEyVqn9rHkPdGSTyacDOVBWFf
   w==;
X-CSE-ConnectionGUID: YHZAKEp0Ra2+QZ47KMTTEA==
X-CSE-MsgGUID: pbHsOkChQeqHt4VZdYxmHQ==
X-IronPort-AV: E=Sophos;i="6.12,297,1728943200"; 
   d="scan'208";a="40916525"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Jan 2025 10:58:25 +0100
X-CheckPoint: {677E4C41-17-3C670366-E45AD810}
X-MAIL-CPID: 192DAC510A0192EB7D5B2486BF7B0BCE_4
X-Control-Analysis: str=0001.0A682F25.677E4C41.00A7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5C9A1651A1;
	Wed,  8 Jan 2025 10:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736330300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0u83Xgz9I4bi5xsbhIsloF0YqIhh17FKuV4H0UoU5ww=;
	b=VhHicdg4cmMlIa1F2X9CupLrQLbLLmjPr7NpJeQ6MIGrHnX3sVq1Oc8JLQjCg7hTvCWKw1
	boqifhwPmry6Q3YELoOPMAXOjLrw5P36Pr0KZukXukZW8TOt64mHzzxZobSkbxkQlx1DTn
	a0GlsV8T0PLUrqQKM2hEoF6k/m1wXZk4/eBH/SjpspIsNQugy32eXtL+VjSnNrezWhFn9Q
	JT28YcOSbxLoqHFO11I7Vf0kd0/gBRwfYd8brMjJwpcBDjJoaQAGk7NHniltA/aUdcSD9W
	IQAU05XItLYZepfTWjJLIPnDaJVFUjNKK5Kxn6O2mRbffo7NIKScywhvQO0qog==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/5] arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
Date: Wed, 08 Jan 2025 10:58:18 +0100
Message-ID: <4427798.ejJDZkT8p0@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z31KrdxPULx8K5ao@lizhi-Precision-Tower-5810>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com> <20250107140110.982215-2-alexander.stein@ew.tq-group.com> <Z31KrdxPULx8K5ao@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_015829_822002_44A8524D 
X-CRM114-Status: GOOD (  16.25  )
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

Am Dienstag, 7. Januar 2025, 16:39:25 CET schrieb Frank Li:
> On Tue, Jan 07, 2025 at 03:01:06PM +0100, Alexander Stein wrote:
> > IRQ mapping is already present. Add the missing DMA interrupt.
>=20
> PCI host side have not use bridge's DMA yet although hardware support it.

So this is a driver limitation, right? So IMHO the device description is
independent from that and still correct, right?

Best regards,
Alexander

> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm=
64/boot/dts/freescale/imx8-ss-hsio.dtsi
> > index 70a8aa1a67911..4bdfc15487cbc 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> > @@ -57,8 +57,9 @@ pcieb: pcie@5f010000 {
> >  		ranges =3D <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
> >  			 <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
> >  		#interrupt-cells =3D <1>;
> > -		interrupts =3D <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > -		interrupt-names =3D "msi";
> > +		interrupts =3D <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-names =3D "msi", "dma";
> >  		#address-cells =3D <3>;
> >  		#size-cells =3D <2>;
> >  		clocks =3D <&pcieb_lpcg IMX_LPCG_CLK_6>,
> > --
> > 2.34.1
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



