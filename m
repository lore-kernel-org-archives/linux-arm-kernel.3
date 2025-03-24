Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9024C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtdsIlvZFuNXS5m+ytZfrbj/VE0WKhdwUACbuDCbmXo=; b=zpE81q8Z03X9WoKncBdQnolSIt
	7Nu528zEONB00bH14cyezbVyvWQ4J9ZsUMOWBoIcBx4b8Vjw4Ilrh9/x8tpQb1xSIgduD5yPeoFLS
	RivWaabAu1REr1Ok6+5sEqDka0Q5OUy+7ji4ZuxDYX3OagSdD7LjaavpNRgYO48aHlsPPqDqGL8jp
	9Yic2EAYWm5qo1xvMZHJLmTsrUQSCaAjSQHve5MBkXBFP58MyCVgf258dJpu6Yo6MkYjqniHY9llh
	re3ftNdKAcTd9t1twKS4UK5RTdkoAE88wiSdIropJnlfajBxcKw9mnkIQLbV33HJ5OwbRWaF2FFWP
	zUL/vKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbqy-00000002OWU-2IMj;
	Mon, 24 Mar 2025 07:04:08 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbpE-00000002OJQ-1KWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742799740; x=1774335740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jtdsIlvZFuNXS5m+ytZfrbj/VE0WKhdwUACbuDCbmXo=;
  b=HSue3NhtOq8RjLTq1m2ZDX6J2zCQruZIKzkulzP9FbX9OuuhjAdDd8pD
   nD4QHuo09V7aleMNf+1NOVZfEnEQU9B53EtxbTgEfJqBPdFSsY8d7ou+t
   1fQISWqKkfZA1fwohlCQEVZciKdOTvxTL2iFt/574KE3K61sHjSBRBzJG
   49xD99ldQK8z6zQvqYbP+B4bA/oEJEr6AjZJyCbGHFA3EVJCnSg/DkdtV
   rvV2HzarrVbrS6tJ99daVFlszhPBSEHf2mUHHbmMXB+7auJjzR7HYUr/N
   Yeai+Ny69pBvbAbD0Ow2RO2qa3M0Y+RIe6Z6vUx/GE543tOxzy6Tvx+O4
   Q==;
X-CSE-ConnectionGUID: CV595JCOQeCMw8MqgTRvug==
X-CSE-MsgGUID: 6Kkbv+/QRrKJfXic6OHNtg==
X-IronPort-AV: E=Sophos;i="6.14,271,1736809200"; 
   d="scan'208";a="43112009"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Mar 2025 08:02:15 +0100
X-CheckPoint: {67E10377-15-903EAEAC-E04C76C8}
X-MAIL-CPID: 1D890C64261B07AD8684C1FEF37BE9A0_5
X-Control-Analysis: str=0001.0A00639B.67E1036D.003C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C8771673F9;
	Mon, 24 Mar 2025 08:02:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742799731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtdsIlvZFuNXS5m+ytZfrbj/VE0WKhdwUACbuDCbmXo=;
	b=ZPioefSLN+FlFThMWD0H5hkSLzq2+eFOFR5/Nr1DxIkttSAr16drmLBsreSRcMrylHrIJN
	TtRuu+Ea4B7HK+cGBVFKmRR03kXt7IZ/6limBz2iId/yblXkYZZhkMiHF8+kJANHgEX9bH
	XVEUrl7EOLukSw6jseg6QCeYM4aZGN68IlYSrdx3sJF2ZQbW9WbvY0GIZ7puYCCEb6dCIO
	Kzp3PEoHSNBdRZwFkhtV+fwvWH8LWZWyiIMqh/8MLxM/NFUgJXG5aRwyrZPRjY/lq3L4Ep
	alMs13rW53+XkfDpLEYMCCF4Wf6ZRAA0tqrMfLFleLulmUWb77oEmPg4Lw2wFw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Date: Mon, 24 Mar 2025 08:02:06 +0100
Message-ID: <6144881.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250321200625.132494-10-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-10-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_000220_852909_157733C9 
X-CRM114-Status: GOOD (  18.10  )
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

Am Freitag, 21. M=E4rz 2025, 21:05:59 CET schrieb Marek Vasut:
> The instance of the GPU populated in i.MX95 is the G310,
> describe this GPU in the DT. Include description of the
> GPUMIX block controller, which can be operated as a simple
> reset. Include dummy GPU voltage regulator and OPP tables.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Drop regulator-{always,boot}-on from fixed-gpu-reg regulator
>     - Keep the GPU and GPUMIX always enabled
>     - Switch from fsl, to nxp, vendor prefix
>     - Fix opp_table to opp-table
>     - Describe IMX95_CLK_GPUAPB as coregroup clock
>     - Sort interrupts by their names to match bindings
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 58 ++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 9bb26b466a061..3acdbd7fd4eee 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -249,6 +249,35 @@ dummy: clock-dummy {
>  		clock-output-names =3D "dummy";
>  	};
> =20
> +	gpu_fixed_reg: fixed-gpu-reg {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <920000>;
> +		regulator-max-microvolt =3D <920000>;
> +		regulator-name =3D "vdd_gpu";
> +	};
> +
> +	gpu_opp_table: opp-table {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-500000000 {
> +			opp-hz =3D /bits/ 64 <500000000>;
> +			opp-hz-real =3D /bits/ 64 <500000000>;
> +			opp-microvolt =3D <920000>;
> +		};
> +
> +		opp-800000000 {
> +			opp-hz =3D /bits/ 64 <800000000>;
> +			opp-hz-real =3D /bits/ 64 <800000000>;
> +			opp-microvolt =3D <920000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz =3D /bits/ 64 <1000000000>;
> +			opp-hz-real =3D /bits/ 64 <1000000000>;
> +			opp-microvolt =3D <920000>;
> +		};
> +	};
> +
>  	clk_ext1: clock-ext1 {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
> @@ -1890,6 +1919,35 @@ netc_emdio: mdio@0,0 {
>  			};
>  		};
> =20
> +		gpu_blk_ctrl: reset-controller@4d810000 {
> +			compatible =3D "nxp,imx95-gpu-blk-ctrl";
> +			reg =3D <0x0 0x4d810000 0x0 0xc>;
> +			#reset-cells =3D <1>;
> +			clocks =3D <&scmi_clk IMX95_CLK_GPUAPB>;
> +			assigned-clocks =3D <&scmi_clk IMX95_CLK_GPUAPB>;
> +			assigned-clock-parents =3D <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> +			assigned-clock-rates =3D <133333333>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_GPU>;
> +		};

With the SM release lf-6.12.3-1.0.0 AP does not have any access to
this BLK_CTRL anymore. See [1]

Best regards,
Alexander

[1] https://github.com/nxp-imx/imx-sm/blob/master/sm/doc/rn_cl.md#sm-184-de=
assert-the-gpu-reset-when-the-gpumix-is-powered-up-rn_detail_sm_184

> +
> +		gpu: gpu@4d900000 {
> +			compatible =3D "nxp,imx95-mali", "arm,mali-valhall-csf";
> +			reg =3D <0 0x4d900000 0 0x480000>;
> +			clocks =3D <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
> +			clock-names =3D "core", "coregroup";
> +			interrupts =3D <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "job", "mmu", "gpu";
> +			mali-supply =3D <&gpu_fixed_reg>;
> +			operating-points-v2 =3D <&gpu_opp_table>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_=
GPU>;
> +			power-domain-names =3D "mix", "perf";
> +			resets =3D <&gpu_blk_ctrl 0>;
> +			#cooling-cells =3D <2>;
> +			dynamic-power-coefficient =3D <1013>;
> +		};
> +
>  		ddr-pmu@4e090dc0 {
>  			compatible =3D "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg =3D <0x0 0x4e090dc0 0x0 0x200>;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



