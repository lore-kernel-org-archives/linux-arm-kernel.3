Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC2AD43374
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68iYgYZPtTrqGDWuMYx5z5BMV4YrJufQaee60Zp3m/s=; b=oMaU3C3Swe/IVZZS/OlNuDBNvM
	x3a0iQJfg9y0xpjkhRH1Lkbmw3JhGo0DYEdJEVMZDMxBJV2dVVFZgxpAWEnBAbBAsmZRQr3Mviqho
	2PzMajsGWPGqUd7G+CHBDAKtAz76mkeKqdRy+JFUcsEiskEXHHqiljA3hAJk2Tkc3LEFwzW3U8I3+
	X1zWb/hMmJ9aTIaCjUL7d4vV2WxO/U2V6HrnFkQ8B7izvWA1pdFRJiJ/goHqnXX64cUe06arwvWPz
	om8T/QsJggyQ56xcw1BbaIJ7sZBxNx8vSQE1wzPTeGHuBnZLdCI136KBKhOFY5qn2xfugP3R83RMK
	OG3uCwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94se-00000007Vxk-1KZY;
	Thu, 07 Nov 2024 15:57:08 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94qK-00000007VWR-0Ahk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730994884; x=1762530884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=68iYgYZPtTrqGDWuMYx5z5BMV4YrJufQaee60Zp3m/s=;
  b=Tg2iT9d1a8wGC2b2mUjr22O8jtfx+41gy5ql0WrvLBf9IHUSycxTJtSl
   hh0a9zqFQ7nlmlHN0iSikAs0y4jCPASyE2i7cyiQXQkE73hqY1jT7xaJ+
   zuYd0npBE6YGkq0rBj7oKXmU4Al8Qtyo4JDWH2ELRKqkHhVEAc6R6WuK4
   FNFhUFaM+KnlB0HaFEgRCJkp8NalXpPVxmWBfM7xZ/zwv36VEnEsHzXhS
   34WJxolpkzxGnC3Y9eDk9dpCH73OnMUIAUxwqsYxpdWIUf9cnKzwtO0oI
   fNFNT2WZmaGU53gd4QAphAUH8lgfGk9j/wSqJGZFNDcPEd0sdohaKDZ1W
   A==;
X-CSE-ConnectionGUID: LKRP2YrGS4ONzZAbOb2EiA==
X-CSE-MsgGUID: MDn25V+cRaaaZRjeLpSeFA==
X-IronPort-AV: E=Sophos;i="6.12,135,1728943200"; 
   d="scan'208";a="39916599"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Nov 2024 16:54:41 +0100
X-CheckPoint: {672CE2C1-19-5736D786-D50827BE}
X-MAIL-CPID: C8E8D31C487399C5B2FEDBBF237F0518_2
X-Control-Analysis: str=0001.0A682F17.672CE2C1.0089,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6BCF16145B;
	Thu,  7 Nov 2024 16:54:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730994876;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=68iYgYZPtTrqGDWuMYx5z5BMV4YrJufQaee60Zp3m/s=;
	b=No6iMnStLW+6z6qd0KOV7E/8Og4zat+TPgQM1mTFFG7ZRt2onLR3PI7q48V6fH+i8/55qZ
	oMoyIXArrvKNSJoCqpRjnNJfWROoppfaT3AqxD+iQJdcaeG15xXy5sfBXIb57JwxfHYeJG
	xqbEAAyOnnR26cmBp4zp8iGMFXRNh/S1nAa3R4zEqmIbikhN+v4JF1pOKTB1ehNG9i3SjF
	OWYRS1wKwH1mXr/UvU1V9Ja+idGCa5y/LSzj8cRTbN2Elu6ZEcY92dZL2xIU6/CpJqzk25
	6j2TLjRWumG4crJGCCw0SUoqdo889W+KeDEQWOhucpWXNMtN0KZE1n7fbe+whA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Pengfei Li <pengfei.li_1@nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, joao.goncalves@toradex.com, frieder.schrempf@kontron.de, marex@denx.de, hvilleneuve@dimonoff.com, peng.fan@nxp.com, m.othacehe@gmail.com, mwalle@kernel.org, Max.Merchel@ew.tq-group.com, hiago.franco@toradex.com, tharvey@gateworks.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, ping.bai@nxp.com, ye.li@nxp.com, aisheng.dong@nxp.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: Add i.MX91 dtsi support
Date: Thu, 07 Nov 2024 16:54:34 +0100
Message-ID: <2966679.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZyzXcktk/sjAtNCg@lizhi-Precision-Tower-5810>
References: <20241108022703.1877171-1-pengfei.li_1@nxp.com> <20241108022703.1877171-3-pengfei.li_1@nxp.com> <ZyzXcktk/sjAtNCg@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_075444_458791_D920E982 
X-CRM114-Status: GOOD (  22.86  )
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

Am Donnerstag, 7. November 2024, 16:06:26 CET schrieb Frank Li:
> On Thu, Nov 07, 2024 at 06:27:02PM -0800, Pengfei Li wrote:
> > The i.MX 91 family features an Arm Cortex-A55 running at up to
> > 1.4GHz, support for modern LPDDR4 memory to enable platform longevity,
> > along with a rich set of peripherals targeting medical, industrial
> > and consumer IoT market segments.
> >
> > The design of the i.MX91 platform is very similar to i.MX93.
> > The mainly difference between i.MX91 and i.MX93 is as follows:
> > - i.MX91 removed some clocks and modified the names of some clocks.
> > - i.MX91 only has one A core
>=20
> - pinmux change
>=20
> >
> > Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770 ++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx91.dtsi      |  66 ++
> >  2 files changed, 836 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
> >
> [snip]
> > diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot=
/dts/freescale/imx91.dtsi
> > new file mode 100644
> > index 000000000000..a9f4c1fe61cc
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> > @@ -0,0 +1,66 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2024 NXP
> > + */
> > +
> > +#include "imx91-pinfunc.h"
> > +#include "imx93.dtsi"
> > +
> > +&{/thermal-zones/cpu-thermal/cooling-maps/map0} {
> > +	cooling-device =3D
> > +		<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > +};
> > +
> > +&clk {
> > +	compatible =3D "fsl,imx91-ccm";
> > +};
> > +
> > +&eqos {
> > +	clocks =3D <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> > +			<&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> > +			<&clk IMX91_CLK_ENET_TIMER>,
> > +			<&clk IMX91_CLK_ENET1_QOS_TSN>,
> > +			<&clk IMX91_CLK_ENET1_QOS_TSN_GATE>;
> > +	assigned-clocks =3D <&clk IMX91_CLK_ENET_TIMER>,
> > +				<&clk IMX91_CLK_ENET1_QOS_TSN>;
> > +	assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> > +					<&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> > +};
> > +
> > +&fec {
> > +	clocks =3D <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> > +			<&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> > +			<&clk IMX91_CLK_ENET_TIMER>,
> > +			<&clk IMX91_CLK_ENET2_REGULAR>,
> > +			<&clk IMX93_CLK_DUMMY>;
> > +	assigned-clocks =3D <&clk IMX91_CLK_ENET_TIMER>,
> > +				<&clk IMX91_CLK_ENET2_REGULAR>;
> > +	assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> > +					<&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> > +	assigned-clock-rates =3D <100000000>, <250000000>;
> > +};
> > +
> > +&i3c1 {
> > +	clocks =3D <&clk IMX93_CLK_BUS_AON>,
> > +			<&clk IMX93_CLK_I3C1_GATE>,
> > +			<&clk IMX93_CLK_DUMMY>;
> > +};
> > +
> > +&i3c2 {
> > +	clocks =3D <&clk IMX93_CLK_BUS_WAKEUP>,
> > +			<&clk IMX93_CLK_I3C2_GATE>,
> > +			<&clk IMX93_CLK_DUMMY>;
> > +};
> > +
> > +&tmu {
> > +	status =3D "disabled";
> > +};
> > +
> > +/* i.MX91 only has one A core */
> > +/delete-node/ &A55_1;
> > +
> > +/* i.MX91 not has cm33 */
> > +/delete-node/ &cm33;
> > +
> > +/* i.MX91 not has power-domain@44461800 */
> > +/delete-node/ &mlmix;
>=20
> If someone want to use it in overlay file, /delete-node/ will not work.

Do you expect someone including this SoC-dtsi in an overlay?
I personally don't, well I'll welcome other comments.

As imx93 is an upgrade to imx91, there is also the possibility to do it
the other way around, similar to imx7s and imx7d. The latter one including
imx7.dtsi and adding additionally peripherals.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



