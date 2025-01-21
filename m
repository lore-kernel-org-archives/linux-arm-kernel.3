Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386E7C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3cZpanloXDoxojzdV0aPxpUOLF0Hgk325gXplQ0T+4=; b=o3d6Vgyb05BK4w2ISXN2VTuwQY
	xIR258MQHglX1Ar6KhmCDVjfOIVc84nWaudrLhIc3+dPhOggHPoHQqTNToR7j6t/8y/El6WcOZ1rG
	vRpxzgA6VtyOOoF2+RYbK7O1jBXY0UxJEzuKBMLqKkLBv2GrxUAsfMDZaiA9mLkqzpxFHCuVsmP+p
	Ftt1SzXO9shFtP6iLmVGEQ8H0SvDnVr54XUJUTYsAWx6vLjGd6ev4uuG/n/El8SbH/8ZZuv5MAhRg
	YHnzpXZW3f+g2Rd29dlQFVuZtZDd8Tz7aitnipAG/Vuq5Bjl9Cr8xwHtfmQij2osWxh5uMEDXheyM
	+fyYfkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9jB-00000007Gw9-2tOA;
	Tue, 21 Jan 2025 08:35:17 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9hs-00000007Gfx-3H3s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737448436; x=1768984436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G3cZpanloXDoxojzdV0aPxpUOLF0Hgk325gXplQ0T+4=;
  b=P0jXjAT+c5KIOvskNaIc6h4yx9FnIKaiNlz28rkUkJw3KT2g01Gb8Nly
   x2lXdQDDyu6pRchv6CvOARi7QkrXWA+oN5WanM+jwmOlg7jQnJk8v7Tgy
   LPPFZVCkQZdXDwIXtxjUCzvA7Rhb8jy1VH1Wa5eH4RauMoCuG6POpYweF
   nw2hoeLhUdkyDawL8oxG3K28QLQ+0YH4WGygD/+cOPTCs26DkQvr2LQXY
   fjjyTeA8KW0X97duF0Ut4cKmCSLu5D0Csh7ze90AcYt+xhhQHcOaEd0nC
   la0Nj1mzvH5d7DQ9HSIzFeaWVcdupVIjBRJ8/UOCkRUN+RY39l6Kr+Zww
   Q==;
X-CSE-ConnectionGUID: s/QLek6PRviSvmsKMu36TQ==
X-CSE-MsgGUID: EHoxZmIuRCmQsXlrTAccbg==
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="41192121"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jan 2025 09:33:54 +0100
X-CheckPoint: {678F5BF2-1E-1D00F64B-E6C57517}
X-MAIL-CPID: A7FA745264EE711FC457078F7BB5A89D_3
X-Control-Analysis: str=0001.0A682F26.678F5BF2.0094,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 380FE16EFEF;
	Tue, 21 Jan 2025 09:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737448429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3cZpanloXDoxojzdV0aPxpUOLF0Hgk325gXplQ0T+4=;
	b=aU7V3VRoXu++6axJN01wKbFTFjkA09sWNjrSn/i+m3zkFV/sZljTaAVSd/F4pUEr/xW64k
	dXcnYC62T8aTYZDAp8QQDzApbrvjHnkGjWhXrp+7FeuFB9oa3OHBhBQ3gv0r5Tfo87qj1f
	TIw/Ogg7wpphWkds+hWQkuKCD6Dh1wj8SErWQvMq3T9tAphDU8HKl/H2LJ8U84XRcOev57
	PDUp1aEeoTIu2v+E3rQUv32cRPQt044W6TDjFTuBRt3XdL3wCXWwiSrzM4LqPFaOVUJu28
	Kay1Qz7J8Pklfl/EK2ehjmRi87EdiBAqBQx4RoxeERQK0MGj/TIIvSvq+4RqzA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com, will@kernel.org, kernel@pengutronix.de, festevam@gmail.com, Joy Zou <joy.zou@nxp.com>
Cc: joao.goncalves@toradex.com, marex@denx.de, hvilleneuve@dimonoff.com, hiago.franco@toradex.com, peng.fan@nxp.com, frieder.schrempf@kontron.de, m.othacehe@gmail.com, mwalle@kernel.org, Max.Merchel@ew.tq-group.com, quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org, arnd@arndb.de, nfraprado@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, ping.bai@nxp.com, ye.li@nxp.com, aisheng.dong@nxp.com, frank.li@nxp.com, carlos.song@nxp.com
Subject: Re: [PATCH v4 2/5] arm64: dts: freescale: Add i.MX91 dtsi support
Date: Tue, 21 Jan 2025 09:33:44 +0100
Message-ID: <1945264.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250121074017.2819285-3-joy.zou@nxp.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com> <20250121074017.2819285-3-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_003357_325737_1DBC715D 
X-CRM114-Status: GOOD (  18.84  )
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

Am Dienstag, 21. Januar 2025, 08:40:14 CET schrieb Joy Zou:
> From: Pengfei Li <pengfei.li_1@nxp.com>
>=20
> The i.MX 91 family features an Arm Cortex-A55 running at up to
> 1.4GHz, support for modern LPDDR4 memory to enable platform longevity,
> along with a rich set of peripherals targeting medical, industrial
> and consumer IoT market segments.
>=20
> The design of the i.MX91 platform is very similar to i.MX93.
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core
> - i.MX91 has different pinmux
>=20
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770 ++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx91.dtsi      |  70 ++
>  2 files changed, 840 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
>=20
> [snip]
> diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/d=
ts/freescale/imx91.dtsi
> new file mode 100644
> index 000000000000..67a5a487ab57
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include "imx91-pinfunc.h"
> +#include "imx93.dtsi"
> +
> +/delete-node/ &A55_1;
> +/delete-node/ &cm33;
> +/delete-node/ &mlmix;
> +/delete-node/ &mu1;
> +/delete-node/ &mu2;
> +
> +&clk {
> +	compatible =3D "fsl,imx91-ccm";
> +};
> +
> +&eqos {
> +	clocks =3D <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> +		 <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> +		 <&clk IMX91_CLK_ENET_TIMER>,
> +		 <&clk IMX91_CLK_ENET1_QOS_TSN>,
> +		 <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>;
> +	assigned-clocks =3D <&clk IMX91_CLK_ENET_TIMER>,
> +			  <&clk IMX91_CLK_ENET1_QOS_TSN>;
> +	assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +				 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> +};
> +
> +&fec {
> +	clocks =3D <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> +		 <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> +		 <&clk IMX91_CLK_ENET_TIMER>,
> +		 <&clk IMX91_CLK_ENET2_REGULAR>,
> +		 <&clk IMX93_CLK_DUMMY>;
> +	assigned-clocks =3D <&clk IMX91_CLK_ENET_TIMER>,
> +			  <&clk IMX91_CLK_ENET2_REGULAR>;
> +	assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +				 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> +	assigned-clock-rates =3D <100000000>, <250000000>;
> +};
> +
> +&i3c1 {
> +	clocks =3D <&clk IMX93_CLK_BUS_AON>,
> +		 <&clk IMX93_CLK_I3C1_GATE>,
> +		 <&clk IMX93_CLK_DUMMY>;
> +};
> +
> +&i3c2 {
> +	clocks =3D <&clk IMX93_CLK_BUS_WAKEUP>,
> +		 <&clk IMX93_CLK_I3C2_GATE>,
> +		 <&clk IMX93_CLK_DUMMY>;
> +};
> +
> +&iomuxc {
> +	compatible =3D "fsl,imx91-iomuxc";
> +};
> +
> +&tmu {
> +	status =3D "disabled";
> +};
> +
> +&ddr_pmu {
> +	compatible =3D "fsl,imx91-ddr-pmu", "fsl,imx93-ddr-pmu";
> +};
> +
> +&map0 {
> +	cooling-device =3D <&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +};
>=20

Somehow I don't like it that much. Instead of removing nodes from imx93.dtsi
wouldn't it make more sense to include from imx91.dtsi into imx93.dtsi
and _add_ nodes with are unique to i.MX93? Otherwise each add to imx93.dtsi
requires an remove in imx91.dtsi for this unique to i.MX93, e.g. NPU.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



