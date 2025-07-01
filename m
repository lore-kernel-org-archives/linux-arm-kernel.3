Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C91C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=El0njB9QkMGVFRshxMbajamTSfz0oZTddg/R/RGwV9k=; b=c17EOijYgQNT5pokyDmXbApg7W
	F7ktqhudRPjXDMa0w9EBMj3mQghZCJC27oeHyeNUPdvli2DaX1f6QM8r0TZM/E8nHPkjG7Gj64u7I
	+B7wfckDW2Ovqmu6X0WshOIhXPneejiyJi1vxwrrphjHW+Pfql3HXh17q/D8EWXvZtdQRGbcUdEAD
	YwDGXW/LLhviHrZHJa62gPEivl/RF8y7ZP1mXoonq7fkYmGq1UuYFp8p8nbQPChHOAvkfs48OjsjV
	ij1xCx210+SrMh65J3tunXl5FgoHc/CewgUHLPxxUVqh07IpjVMR8UHXkT/lg1+sbkLEM6CIWDm1g
	DOXhLGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXZF-00000004ddw-31lm;
	Tue, 01 Jul 2025 09:46:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXHo-00000004bHg-29YT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 09:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=El0njB9QkMGVFRshxMbajamTSfz0oZTddg/R/RGwV9k=; b=IlMadqDLVKptNtwNIJ9FM814Sq
	d5lemxRXo0sdH5lDRxLoZCA0fcIrvKdtBTl2ND0A+cciOfoUDIJKcQ1dXC2PuhfA9lrdERv8bBQeN
	uMjtQQS1gVy4haqN6wKRllR+uFzYveOhMKcK5799j1bo1rgme/If5N7oMSjgHNfuUGDOIDSo7cK99
	tz0F3sogAKkdKHqdr3tOS0MW1KXaofJCT3DqL8G4ON4x5ARUGTwvPrzQAIF9nH8yQi+BA5ewcUz3u
	9SyNf4FimGRsI8mLtYjuQOXVVBhbDYgv2LDcX4hzo+BgljGREZ232YHQUfpu/WH7AmkzfJ+RYPsSI
	bTJUNKiw==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXHl-000000072Yq-03wC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 09:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751362097; x=1782898097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=El0njB9QkMGVFRshxMbajamTSfz0oZTddg/R/RGwV9k=;
  b=Op2EaIp4h9yIljKlmCSgkTkZ4dgBcqfkGHFH4VsxNhlRVN5n+3cVX3MU
   4gomJBkOBQdsVt5ihfFgYTwMX/0I9Ei0g5acydHFQRV2c3OFvx18G6zz0
   rXKw50ugYmQ+OL+OdkeXiio7XtrrYs84CDlGPRH1mjt4YZFyTU9/5942G
   1WKJyEY1xE8BtRAj6JmZ7Zk/ggOxN4zesN03/h9gf+6zwDdrEVdR1knZw
   +iWerVJRAjVVTNkUKvgWM1KP/qQldaLNAAqnZGEAr1Gr26O8jZmrsZAA1
   mSLzC4lBfd+kR4Lt3egP+1ywyY1wwIyjjBY+f6iXxnADjAyjFAk9ldrPS
   w==;
X-CSE-ConnectionGUID: 5Zf31/qcQgK5fwixQENzjg==
X-CSE-MsgGUID: nsiA9ZZdRnWjzj7r6P5fPg==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44950455"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 11:28:13 +0200
X-CheckPoint: {6863AA2D-7-ABFC28F4-D6731B76}
X-MAIL-CPID: 1F1760676F1FD6B864D31B9984EE8645_5
X-Control-Analysis: str=0001.0A006370.6863AA54.0046,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB77916AFA8;
	Tue,  1 Jul 2025 11:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751362088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=El0njB9QkMGVFRshxMbajamTSfz0oZTddg/R/RGwV9k=;
	b=SVDMR+lOaUcf3oyASPFD1CmRQwfXLjQ5VrKgrNYJRRQW0kqIaT4ZvvRwBCVvciNuFiF0yp
	5jJFO7JmRmhP+eRD/4kdJGqOUe0Ss8t47mjttec9DibDXU7BCty+xwDDWfrYsmfyp4DQ6V
	D4kp42bB8bZwQPUeNx4gZAHUulfbXk1y5MrgkAk20Vkvwsb9JjS/CeVScYJKO86SGOhkDw
	SdpTLKIOv3hr8Xzs+0nk+E43KXeZy610y3Yz+Dtz3fzyfqVqHDUXdvFAgy5pC5PVN0F5FE
	waAUnxYR2IsB0HMHHqSH5VM8YbwAdS+QOeeON/bXntcKgROBmcASAEoGTZuaTA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <frank.li@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Date: Tue, 01 Jul 2025 11:28:07 +0200
Message-ID: <2791534.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250701-imx95-blk-ctl-7-1-v1-5-00db23bd8876@nxp.com>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
 <20250701-imx95-blk-ctl-7-1-v1-5-00db23bd8876@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_102817_397679_91CB2675 
X-CRM114-Status: GOOD (  12.87  )
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

Am Dienstag, 1. Juli 2025, 09:04:41 CEST schrieb Peng Fan:
> Add nodes for LVDS/DISPLAY CSR.
>=20
> Add ldb_pll_div7 node which is used for clock source of DISPLAY CSR.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943.dtsi | 34 +++++++++++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/=
dts/freescale/imx943.dtsi
> index 45b8da758e87771c0775eb799ce2da3aac37c060..cf67dba21e4f6f27fff7e5d29=
744086e4ec9c021 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi

Why is this specific to imx943 but not imx94? What is the difference anyway?

Best regards
Alexander

> @@ -3,6 +3,8 @@
>   * Copyright 2025 NXP
>   */
> =20
> +#include <dt-bindings/clock/nxp,imx94-clock.h>
> +
>  #include "imx94.dtsi"
> =20
>  / {
> @@ -145,4 +147,36 @@ l3_cache: l3-cache {
>  			cache-unified;
>  		};
>  	};
> +
> +	ldb_pll_pixel: ldb_pll_div7 {
> +		compatible =3D "fixed-factor-clock";
> +		#clock-cells =3D <0>;
> +		clocks =3D <&scmi_clk IMX94_CLK_LDBPLL>;
> +		clock-div =3D <7>;
> +		clock-mult =3D <1>;
> +		clock-output-names =3D "ldb_pll_div7";
> +	};
> +
> +	soc {
> +		dispmix_csr: syscon@4b010000 {
> +			compatible =3D "nxp,imx94-display-csr", "syscon";
> +			reg =3D <0x0 0x4b010000 0x0 0x10000>;
> +			clocks =3D <&scmi_clk IMX94_CLK_DISPAPB>;
> +			#clock-cells =3D <1>;
> +			power-domains =3D <&scmi_devpd IMX94_PD_DISPLAY>;
> +			assigned-clocks =3D <&scmi_clk IMX94_CLK_DISPAXI>,
> +					  <&scmi_clk IMX94_CLK_DISPAPB>;
> +			assigned-clock-parents =3D <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>,
> +						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +			assigned-clock-rates =3D <400000000>,  <133333333>;
> +		};
> +
> +		lvds_csr: syscon@4b0c0000 {
> +			compatible =3D "nxp,imx94-lvds-csr", "syscon";
> +			reg =3D <0x0 0x4b0c0000 0x0 0x10000>;
> +			clocks =3D <&scmi_clk IMX94_CLK_DISPAPB>;
> +			#clock-cells =3D <1>;
> +			power-domains =3D <&scmi_devpd IMX94_PD_DISPLAY>;
> +		};
> +	};
>  };
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



