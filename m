Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C4FC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bxFcBF0XtJdF3mmKEpWa55fZ5mN9n6znZ7Fl8Z8Rh0=; b=VpIKfLWdZTKMsQkDwfeyeFNEgs
	c5g0oYiPgSLCEuHhdyXAMPLuWrYqkwqB1Ppivo+n/naClWJJZydMuolXFQ0rksXnBp9ljhdUcKOIL
	3/oi8j/eUjh5I6bmo7jtrMMOH8txjk2V1k5mFY/OlJSdczhRCWPfdzFwZta4u6ROmVKmFvQ6Uytyg
	bc8YcXd1ZzI1YgeXjL840AlCv8uFvVAAPZ3AC1VWSvAmZ2vYKX7uN+trQ/z5vmO7NLjAbbQVlgI+1
	vN9J/vjg1T9O1D/tUiaO/NRpAd3NwDkbuyUROh3sujIP0v8hOqT93T6aU7hCwNQ5tW6mwxkxNEIct
	+mpbuVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyEu-0000000AhX7-1VRt;
	Fri, 28 Feb 2025 11:09:08 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxjl-0000000AcrH-2SLB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740739017; x=1772275017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8bxFcBF0XtJdF3mmKEpWa55fZ5mN9n6znZ7Fl8Z8Rh0=;
  b=qaI92DJ5Igoc3C4BthBWgr7/dZ4vrqLhN0HvOCafbMItats/6ZQxnooz
   kCe8m47uzyyVuKA4f/E1LQVD/+D5aC5IvefVJ9SFlO6htPJJXB9w3j0Fn
   5BKlMJdr80wYTCKd7vMCcpo3ZuM6EWDx2MpjEmIBkNvfRasdaOYAqoBWu
   CfXBAGKjbDSY88+ydllUpAKpksceB9LSOsadUp2ifH2AruZm8p5ewkvM1
   i5wkcr9DYV34w8Du+9TJX+EJeKtzic6qQs6XAj0zwDdwhR4ahSHl0XKU2
   +liQXjlMOumawwpbDTIkCJBjMjOjmrVTF+RZhzY1CaxwrVNVXRgfqSLbh
   A==;
X-CSE-ConnectionGUID: kT0dpwDzStuJfz3Prmzn0A==
X-CSE-MsgGUID: FTZjkLIRRhmFufIh1X86Mw==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; 
   d="scan'208";a="42171938"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Feb 2025 11:36:54 +0100
X-CheckPoint: {67C191C6-12-FDFF3AB5-CA03ADD1}
X-MAIL-CPID: 48BE83E6EAF2BDBFDA4A0D1D3FAED6CF_2
X-Control-Analysis: str=0001.0A002112.67C191C6.010C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23EA016994C;
	Fri, 28 Feb 2025 11:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740739010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8bxFcBF0XtJdF3mmKEpWa55fZ5mN9n6znZ7Fl8Z8Rh0=;
	b=ReJ1IdXKdRVBZGodmegLEoU61ogdxEs+Wnljz/8CFMR/Q4U6x95VJ6rRHJwuDby+U6OVFK
	vdzAs8HWwjj8zCPmzVlN2hRJ5Q0IO3xzTABlO1ldQUgMePyw4DWhVmTzRWvDYSoijMqnCK
	p+AC3CmG1O8I35tXTUC9Q56FC3HbHorLJKaaXqWqFWzIwmCTbTd2c3SoTx8i3cpqFLNROs
	7gi0CVMJxGNeLKNGvMv97Ikvy6rhvFE2y1BqPiO5Ax+ZQRVg53/CCQpbZJX8IA53utxoMs
	GHOOGXhv1eJgnyBXQVa1ZajKEVxSkcWTi+jKROWvPKFOxbaQ1384JHG158jK8A==
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
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Date: Fri, 28 Feb 2025 11:36:47 +0100
Message-ID: <2153305.bB369e8A3T@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227170012.124768-10-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_023657_784569_44A4870B 
X-CRM114-Status: GOOD (  17.97  )
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

Hi Marek,

Am Donnerstag, 27. Februar 2025, 17:58:09 CET schrieb Marek Vasut:
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
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 62 ++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 3af13173de4bd..36bad211e5558 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -249,6 +249,37 @@ dummy: clock-dummy {
>  		clock-output-names =3D "dummy";
>  	};
> =20
> +	gpu_fixed_reg: fixed-gpu-reg {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <920000>;
> +		regulator-max-microvolt =3D <920000>;
> +		regulator-name =3D "vdd_gpu";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};

Is this an internal voltage?

> +
> +	gpu_opp_table: opp_table {

Node-Names use dash instead of underscore.

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
> @@ -1846,6 +1877,37 @@ netc_emdio: mdio@0,0 {
>  			};
>  		};
> =20
> +		gpu_blk_ctrl: reset-controller@4d810000 {
> +			compatible =3D "fsl,imx95-gpu-blk-ctrl";
> +			reg =3D <0x0 0x4d810000 0x0 0xc>;

Mh, GPU_BLK_CTRL is /just a bit) more than the GPU reset. Does it make sense
to make this an gpu-reset-only node, located at 0x4d810008?

> +			#reset-cells =3D <1>;
> +			clocks =3D <&scmi_clk IMX95_CLK_GPUAPB>;
> +			assigned-clocks =3D <&scmi_clk IMX95_CLK_GPUAPB>;
> +			assigned-clock-parents =3D <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> +			assigned-clock-rates =3D <133333333>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_GPU>;
> +			status =3D "disabled";
> +		};
> +
> +		gpu: gpu@4d900000 {
> +			compatible =3D "fsl,imx95-mali", "arm,mali-valhall-csf";
> +			reg =3D <0 0x4d900000 0 0x480000>;
> +			clocks =3D <&scmi_clk IMX95_CLK_GPU>;

There is also IMX95_CLK_GPUAPB. Is this only required for the rese control =
above?

> +			clock-names =3D "core";
> +			interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "gpu", "job", "mmu";

DT bindings say this order: job, mmu, gpu

Best regards
Alexander

> +			mali-supply =3D <&gpu_fixed_reg>;
> +			operating-points-v2 =3D <&gpu_opp_table>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_=
GPU>;
> +			power-domain-names =3D "mix", "perf";
> +			resets =3D <&gpu_blk_ctrl 0>;
> +			#cooling-cells =3D <2>;
> +			dynamic-power-coefficient =3D <1013>;
> +			status =3D "disabled";
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



