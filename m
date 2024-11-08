Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFD8D5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERNHBkanBqKFL3ox9eUbC/F74vANoxKE7ufPEj4aVYk=; b=MxG4y8OhOeeAP/ELdOquXv4Cbw
	Pf5DxJwUlzS0qIR+WanS7rPPIsbVun+oQt59a6N6LmZb7ij9ytXIfcywqZvjMm0Cn/JFj3fgDIl2f
	krFQFYEZMfsJMri0YtMjbC7EwSkrcVPuXhzt0ARq4edWOX76yPmaX8lRSdFfosLT5ZYs8EMqeDYSf
	CvTxz/6aiHaBS96m78irn1hSbBBPbchxzO5O1J2fMsmiPlhLuCpMJtZIMo4a17F68y4xBRrYw8OrO
	132A6H04ECNqiiDsnOktNcFZ7hV7tB3L9ibozUN+tgmxdlpMXhmkFmv2tVpjbxV2pCRu5yib1VdRF
	Nh1wOUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pzv-0000000Ar4r-2Oyc;
	Fri, 08 Nov 2024 14:30:03 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PbK-0000000An0X-1BJ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731074678; x=1762610678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ERNHBkanBqKFL3ox9eUbC/F74vANoxKE7ufPEj4aVYk=;
  b=fiw63X102bV8kgUneYGOUP1SgBeJKlnb9ppylYck/0Snw6f02YwwrAdG
   kF6RxZmJxuHg2MbChCeJ9SjIpg6CKvChEIqIGPjh2HD6NwcC4xWMYzILl
   B6Vd3HI6AYsfKFWc4LOb8m0k+O4lQFXYTjhnY2BZtkzTxCO1GKWqlw6wt
   1p9lrqUHvzfYePlwx9wsK3jseCbLkmsAEWKrjdadTDLXroRzHYn0uKCqC
   eHOhBpQHpjdBq/38/EwhxuBk5NR43IWr6BaPl6xmcXZ+ATFqjqBM4VNTN
   xAP19/JEziiATRjwtgw7wKk1sLV/lIda4JFB4EP6OWJDz7vdJLOxmJ3X3
   g==;
X-CSE-ConnectionGUID: buIqScCRRSqM1NGVvIff2Q==
X-CSE-MsgGUID: Cuwk4pU8SquUSdlrlunCag==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39937249"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 15:04:36 +0100
X-CheckPoint: {672E1A74-A-5736D786-D50827BE}
X-MAIL-CPID: EF367DDD2A39F4625B8CF4B973AAEAE0_2
X-Control-Analysis: str=0001.0A682F26.672E1A74.0090,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9F3E160D5C;
	Fri,  8 Nov 2024 15:04:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731074671;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ERNHBkanBqKFL3ox9eUbC/F74vANoxKE7ufPEj4aVYk=;
	b=sWU5QszwvFP/gLmWvlo/us2SLOtRCvPL4eiaeekEVUxGrKVu0IpTdQlv2Kyq9EFUXM2swr
	f5b8iqekGnKlwQ7vN7vpKvFxkrsQ0X9XRzWOiT9rYaAVHVyQTDDf9M+3oXin+KmXKmyoZF
	X7oRD/tpP9ULHbqRMva0p3Ez9I3MApjpkzBWWH5kJQAOGk74mwIi3hc7IJzcvj235U0ha+
	YO1Gk3e6ol5J8HmH2PDCotoJ38RNSZJWxJTILEuKp4h80aEc4pSeDZYnt6+JiimzE3z2su
	rz2GF8waLrYJpQY1p2xS9NdqiN1NHDFqyJGEdZ7C2rf1BkmAWdmJMWBtap5OQg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, joao.goncalves@toradex.com, frieder.schrempf@kontron.de, marex@denx.de, hvilleneuve@dimonoff.com, peng.fan@nxp.com, m.othacehe@gmail.com, mwalle@kernel.org, Max.Merchel@ew.tq-group.com, hiago.franco@toradex.com, tharvey@gateworks.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, ping.bai@nxp.com, ye.li@nxp.com, aisheng.dong@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: Add i.MX91 dtsi support
Date: Fri, 08 Nov 2024 15:04:29 +0100
Message-ID: <10563047.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Zy3gXvuWb76beZKo@pengfei-OptiPlex-Tower-Plus-7010>
References: <20241108022703.1877171-1-pengfei.li_1@nxp.com> <2350046.ElGaqSPkdT@steina-w> <Zy3gXvuWb76beZKo@pengfei-OptiPlex-Tower-Plus-7010>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_060438_645804_23201B27 
X-CRM114-Status: GOOD (  34.98  )
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

Am Freitag, 8. November 2024, 10:56:46 CET schrieb Pengfei Li:
> On Thu, Nov 07, 2024 at 01:49:50PM +0100, Alexander Stein wrote:
> > Hi,
> >=20
> > thanks for putting me on CC.
> >=20
> > Am Freitag, 8. November 2024, 03:27:02 CET schrieb Pengfei Li:
> > > The i.MX 91 family features an Arm Cortex-A55 running at up to
> > > 1.4GHz, support for modern LPDDR4 memory to enable platform longevity,
> > > along with a rich set of peripherals targeting medical, industrial
> > > and consumer IoT market segments.
> > >=20
> > > The design of the i.MX91 platform is very similar to i.MX93.
> > > The mainly difference between i.MX91 and i.MX93 is as follows:
> > > - i.MX91 removed some clocks and modified the names of some clocks.
> > > - i.MX91 only has one A core
> > >=20
> > > Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770 ++++++++++++++++=
++
> > >  arch/arm64/boot/dts/freescale/imx91.dtsi      |  66 ++
> > >  2 files changed, 836 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
> > >=20
> > > diff --git a/arch/arm64/boot/dts/freescale/imx91-pinfunc.h b/arch/arm=
64/boot/dts/freescale/imx91-pinfunc.h
> > > new file mode 100644
> > > index 000000000000..bc58ce2102b2
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx91-pinfunc.h
> >=20
> > FWIW this is a 1:1 copy from downstream kernel
>=20
> Hi, thanks for the comments.
>=20
> Yes, it is same as downstream kernel.
>=20
> >=20
> > > diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/bo=
ot/dts/freescale/imx91.dtsi
> > > new file mode 100644
> > > index 000000000000..a9f4c1fe61cc
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> > > @@ -0,0 +1,66 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright 2024 NXP
> > > + */
> > > +
> > > +#include "imx91-pinfunc.h"
> > > +#include "imx93.dtsi"
> > > +
> > > +&{/thermal-zones/cpu-thermal/cooling-maps/map0} {
> > > +	cooling-device =3D
> > > +		<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > > +};
> > > +
> > > +&clk {
> > > +	compatible =3D "fsl,imx91-ccm";
> > > +};
> > > +
> > > +&eqos {
> > > +	clocks =3D <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> > > +			<&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> > > +			<&clk IMX91_CLK_ENET_TIMER>,
> > > +			<&clk IMX91_CLK_ENET1_QOS_TSN>,
> > > +			<&clk IMX91_CLK_ENET1_QOS_TSN_GATE>;
> > > +	assigned-clocks =3D <&clk IMX91_CLK_ENET_TIMER>,
> > > +				<&clk IMX91_CLK_ENET1_QOS_TSN>;
> > > +	assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> > > +					<&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> >=20
> > Is it just me or is the alignment of new lines not matching?
>=20
> Not sure about others, the alignment on my side is correct.
>=20
> >=20
> >=20
> > > +};
> > > +
> > > +&fec {
> > > +	clocks =3D <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> > > +			<&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> > > +			<&clk IMX91_CLK_ENET_TIMER>,
> > > +			<&clk IMX91_CLK_ENET2_REGULAR>,
> > > +			<&clk IMX93_CLK_DUMMY>;
> > > +	assigned-clocks =3D <&clk IMX91_CLK_ENET_TIMER>,
> > > +				<&clk IMX91_CLK_ENET2_REGULAR>;
> > > +	assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> > > +					<&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> >=20
> > Here as well: Is it just me or is the alignment of new lines not matchi=
ng?
>=20
> Same as above.
>=20
> >=20
> > > +	assigned-clock-rates =3D <100000000>, <250000000>;
> > > +};
> > > +
> > > +&i3c1 {
> > > +	clocks =3D <&clk IMX93_CLK_BUS_AON>,
> > > +			<&clk IMX93_CLK_I3C1_GATE>,
> > > +			<&clk IMX93_CLK_DUMMY>;
> > > +};
> > > +
> > > +&i3c2 {
> > > +	clocks =3D <&clk IMX93_CLK_BUS_WAKEUP>,
> > > +			<&clk IMX93_CLK_I3C2_GATE>,
> > > +			<&clk IMX93_CLK_DUMMY>;
> > > +};
> > > +
> > > +&tmu {
> > > +	status =3D "disabled";
> >=20
> > Why does the TMU needs to be disabled instead of deleted?
>=20
> Actually, the i.MX91 also has a TMU, but the i.MX91 uses a different IP t=
han the i.MX93, so a new driver is required.
> However, this new driver is not applied yet on upstream kernel, so it is =
disabled here for now.

Then, the compatible should be changed as well.

> >=20
> > > +};
> > > +
> > > +/* i.MX91 only has one A core */
> > > +/delete-node/ &A55_1;
> > > +
> > > +/* i.MX91 not has cm33 */
> > > +/delete-node/ &cm33;
> > > +
> > > +/* i.MX91 not has power-domain@44461800 */
> > > +/delete-node/ &mlmix;
> > >=20
> >=20
> > Shouldn't the following node also be removed?
> > * mipi_csi
> > * dsi
> > * lvds_bridge
> > * lcdif_to_dsi
> > * lcdif_to_ldb
> >=20
> > Also in downstream kernel IMX91_CLK_MEDIA_AXI, which is IMX93_CLK_MEDIA=
_AXI
> > upstream, is set to 200 MHz. Is this applicable here as well?
> >=20
>=20
> For these nodes, it is only in the downstream kernel and not yet applied =
to the upstream kernel for i.MX93.
> So they cannot be removed in the upstream kernel yet.

Ah, sorry. They originated form my local changes. They need to be removed
later on when they get added to imx93 though.

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



