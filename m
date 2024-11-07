Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1C3D43352
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Br6j9tCD7gey4qn/vnRgBNealpC4+9i3aXfalCeYdjY=; b=Pu5pI0KuQA84X0FS8RlREhhn/m
	HxYBlQUBa13j+3UnJQTvpqGtu4yeoPQ8L3AtOPjuYBRtdHCCU/g/2ipyUcAaNpztYsUoMFGr5kqsW
	KIVY0+L0HqcBP6ywKdoaEREHW+/hWLVVgIA5nNKG2z+s9srUvFEH6RTH8/wsfa3Jpd2zjES/aoNFl
	BYjYcf29DiP69fW7Oi50sreL0LVBJhpldBJNdcPClMcuB9zwp0fFY5j6FGy8Dbof6ZcAB5Qm/32H/
	8vu8HvPFNBfMN9mtiba0KGvRv+5CNdM7x//PspAGV2UINFIIrhbVP+O8nNXaETrxwZwfHba32Txji
	bSymz3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92FN-000000072m8-2v2K;
	Thu, 07 Nov 2024 13:08:25 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92Dc-000000072MW-29yX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 13:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730984796; x=1762520796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Br6j9tCD7gey4qn/vnRgBNealpC4+9i3aXfalCeYdjY=;
  b=qpdNEOMGBYqmdQFoqWzsZfnfMQeFx1qrS/V+50y+Htp+k9orp4SsKdQ5
   /CIN8AGFlZMbWd8mcXUZ3mq1BhtuwR7dmecRvlCF8+N3Tt3DSHMS+ExHq
   VZCittHDLQXWetRHzzPmq0CmUwr8RXoqes1wxBF1e2sHzOVTAHoj97gcj
   R0lUwKXeHsHP+IpfdUDnRMk3z7wucOEUZU3G+gV6LeG/JbGcdax0VgfnO
   cpDArP5ZzZAvBNjdN6kO5AQAdqWXW+mlkwz45QvtmRQyPEhNL/y9VLulq
   kgbhAv/w+yvRZsMTRaBtomiCzyYLOFrAJqyha8KNX7nRcrZT/vn/bE2zx
   w==;
X-CSE-ConnectionGUID: +ng6v8WES5qSaYqsyOTeLw==
X-CSE-MsgGUID: BSiAM4hKRbeF+0LucP8ebQ==
X-IronPort-AV: E=Sophos;i="6.12,266,1728943200"; 
   d="scan'208";a="39912117"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Nov 2024 14:06:34 +0100
X-CheckPoint: {672CBB5A-B-F5DC7025-F79421CB}
X-MAIL-CPID: A4A1CF9EA10526AAB45BE20D0F4302DB_0
X-Control-Analysis: str=0001.0A682F25.672CBB5A.007A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98D5B16486F;
	Thu,  7 Nov 2024 14:06:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730984789;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Br6j9tCD7gey4qn/vnRgBNealpC4+9i3aXfalCeYdjY=;
	b=pRwh6o2kI6cs3FUXrpAfae/cn1kML4uB1wFP/V33+GJenfaOoEtobo7UGticUQfXOXt6Wh
	9ZJE7ZJzg+Jc/Z/4B/9eHs+rFsR9PnY6sj2d4A4NBiMF4ce7wK/ceN9fGPWjC/0KOChEVd
	i45m2u/SkVU4ViBeNvRtNC68sIVG9Xfu8ATyVFdCGLZImpqcrQohirSWRgysbrH8ecbA8f
	B+Xzsp5K0/qahF3rA2wqxCg2+DkPpnBLKo/86MyfeHWSvpVdodB1tVw2WZIw4Qe3zPPzy3
	/ZeEHruT+KsdIqmm5AaYo2aFBapIBwCZLNB5lX7X1+RH414Msi5pAhyqYVBgCA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, Pengfei Li <pengfei.li_1@nxp.com>, linux-arm-kernel@lists.infradead.org
Cc: joao.goncalves@toradex.com, frieder.schrempf@kontron.de, marex@denx.de, hvilleneuve@dimonoff.com, peng.fan@nxp.com, m.othacehe@gmail.com, mwalle@kernel.org, Max.Merchel@ew.tq-group.com, hiago.franco@toradex.com, tharvey@gateworks.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, ping.bai@nxp.com, ye.li@nxp.com, aisheng.dong@nxp.com, frank.li@nxp.com, Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 2/3] arm64: dts: freescale: Add i.MX91 dtsi support
Date: Thu, 07 Nov 2024 14:06:27 +0100
Message-ID: <1907807.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2350046.ElGaqSPkdT@steina-w>
References: <20241108022703.1877171-1-pengfei.li_1@nxp.com> <20241108022703.1877171-3-pengfei.li_1@nxp.com> <2350046.ElGaqSPkdT@steina-w>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_050637_068537_DF1D1447 
X-CRM114-Status: GOOD (  16.01  )
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

Am Donnerstag, 7. November 2024, 13:49:50 CET schrieb Alexander Stein:
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
>=20
> Is it just me or is the alignment of new lines not matching?
>=20
>=20
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
>=20
> Here as well: Is it just me or is the alignment of new lines not matching?
>=20
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
>=20
> Why does the TMU needs to be disabled instead of deleted?
>=20
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
> >=20
>=20
> Shouldn't the following node also be removed?
> * mipi_csi
> * dsi
> * lvds_bridge
> * lcdif_to_dsi
> * lcdif_to_ldb

Add mu1 and mu2 to that list.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



