Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FA1E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXCnaWSWoS9YIAoAn/Kz0auizRnOExZj6rmeVZu6DlA=; b=UsQw2lolQ7ra43/f/n9txH9xTJ
	zY056N/swtbY2q4Y6V73TN4TeZ1TLoY5t77m6TMtkrQl637bF1XkSCqgFjeso/7NHqd/tPE+4ib1M
	Lm/6vgbUMaYX31YSr2mSE3Np4LSsgHR0dZTxMAq06H9J1uz11X/tcvMZYZVeCiw8H9+05hkbeHMKh
	CTdcMwrX5Ari8s4Rm4jmA25rwAIYkqFCwExO8gQ2VRy6MIf97si8/+mmTu807U1OrxwMxWJPnMX+6
	ygrb4Ad7JZbEb0w1fkElZRvEk80qBb4aNyRf9MS3Wd51b2bPkDjJOwD8Y3gIlzr0u9bUFOX9ZtZBQ
	ygEgFIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjQK-00000000gy9-1u9Y;
	Mon, 06 Jan 2025 09:29:24 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjP7-00000000gX6-046e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 09:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736155689; x=1767691689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PXCnaWSWoS9YIAoAn/Kz0auizRnOExZj6rmeVZu6DlA=;
  b=Pm84sfiTym5I8A98poGoqBbD93FCjQZUCHtZ92jgrzjbB2MsIv74zh4W
   sNB4PMf1AmcOZj0ABfn7DEiwO1MXYnk71/9BEvE8iYzD88rQFOQFN3/ob
   bAcmS7TD8YaP3DNC2wnq6rdm6x8dmCCluVr5pl7qlmqr4biALdA8ekz58
   98iscqoeInv33125IpcHvCwFZiq//VdnVb9xaYYDCALiMnTek3tdzxao1
   0ldXiF7qeDMHFg8TIyqiD9wuu4qLi+W9Ftpc0MacZrz0ope53YGxIim4d
   UPE3hCOeF+a77LZq8pQIRy0OjPWjypqWc5iCdkI5jMAG8Sj7+GFWGJ/Z9
   Q==;
X-CSE-ConnectionGUID: 6x+pJm1kQV+PLyHp27u1Og==
X-CSE-MsgGUID: Q8H4DRZ5SH2ERl3GvlTiWQ==
X-IronPort-AV: E=Sophos;i="6.12,292,1728943200"; 
   d="scan'208";a="40872479"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 Jan 2025 10:28:04 +0100
X-CheckPoint: {677BA224-1D-93478228-E4E4FEDD}
X-MAIL-CPID: 656E0C9F61E47A078C794C090AB99A91_5
X-Control-Analysis: str=0001.0A682F18.677BA224.00D7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF2041611BC;
	Mon,  6 Jan 2025 10:27:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736155680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXCnaWSWoS9YIAoAn/Kz0auizRnOExZj6rmeVZu6DlA=;
	b=qBgKK/c2OOczIJKtnZla8yDN6CVkurjHjRX7unHcq1ZBTSH3bn/FmTKaT8MbBKgJEZZqXl
	Fh33/mhESZ4HpuHSLc+bPJvIPUHRv0hj4tWj4W0UBZscl6KqFwtSLEsb67NPdoRRorUrn+
	lARXlALXdx4Zyu+MsYfdnNdlcmxIPKsGzy5ENuPaKP4p2aKLNbeXD70w7NFDtHgjBRKP9S
	bd2aCA7NzihRxltsh8N2KB2tWB5FyMHeS1C+Fo+5ebys7MLKs4efzApGIOB1+7x5j0o5+S
	7WXqfGoIFPPVQoPS7ehCgqo4+X0L1Vf6gmljz0x0h4N7L48nRVub5cxyT2oWeQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, frank.li@nxp.com, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Wei Fang <wei.fang@nxp.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: imx95: add NETC related nodes
Date: Mon, 06 Jan 2025 10:27:57 +0100
Message-ID: <12612864.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241219061340.1633173-2-wei.fang@nxp.com>
References: <20241219061340.1633173-1-wei.fang@nxp.com> <20241219061340.1633173-2-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_012809_546538_7DF5381D 
X-CRM114-Status: GOOD (  13.16  )
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

Am Donnerstag, 19. Dezember 2024, 07:13:39 CET schrieb Wei Fang:
> Add NETC related nodes for i.MX95.
>=20
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 94 ++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index e9c7a8265d71..8b0eb1d835e8 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1697,10 +1697,104 @@ sai2: sai@4c880000 {
>  			status =3D "disabled";
>  		};
> =20
> +		netc_blk_ctrl: system-controller@4cde0000 {
> +			compatible =3D "nxp,imx95-netc-blk-ctrl";
> +			reg =3D <0x0 0x4cde0000 0x0 0x10000>,
> +			      <0x0 0x4cdf0000 0x0 0x10000>,
> +			      <0x0 0x4c81000c 0x0 0x18>;
> +			reg-names =3D "ierb", "prb", "netcmix";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +			power-domains =3D <&scmi_devpd IMX95_PD_NETC>;
> +			assigned-clocks =3D <&scmi_clk IMX95_CLK_ENET>,
> +					  <&scmi_clk IMX95_CLK_ENETREF>;
> +			assigned-clock-parents =3D <&scmi_clk IMX95_CLK_SYSPLL1_PFD2>,
> +						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD0>;
> +			assigned-clock-rates =3D <666666666>, <250000000>;
> +			clocks =3D <&scmi_clk IMX95_CLK_ENET>;
> +			clock-names =3D "ipg";
> +			status =3D "disabled";
> +
> +			netc_bus0: pcie@4ca00000 {
> +				compatible =3D "pci-host-ecam-generic";
> +				reg =3D <0x0 0x4ca00000 0x0 0x100000>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				device_type =3D "pci";
> +				bus-range =3D <0x0 0x0>;
> +				msi-map =3D <0x0 &its 0x60 0x1>,	//ENETC0 PF
> +					  <0x10 &its 0x61 0x1>, //ENETC0 VF0
> +					  <0x20 &its 0x62 0x1>, //ENETC0 VF1
> +					  <0x40 &its 0x63 0x1>, //ENETC1 PF
> +					  <0x80 &its 0x64 0x1>, //ENETC2 PF
> +					  <0x90 &its 0x65 0x1>, //ENETC2 VF0
> +					  <0xa0 &its 0x66 0x1>, //ENETC2 VF1
> +					  <0xc0 &its 0x67 0x1>; //NETC Timer
> +					 /* ENETC0~2 and Timer BAR0 - non-prefetchable memory */
> +				ranges =3D <0x82000000 0x0 0x4cc00000  0x0 0x4cc00000  0x0 0xe0000
> +					 /* Timer BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd00000  0x0 0x4cd00000  0x0 0x10000
> +					 /* ENETC0~2: VF0-1 BAR0 - non-prefetchable memory */
> +					 0x82000000 0x0 0x4cd20000  0x0 0x4cd20000  0x0 0x60000
> +					 /* ENETC0~2: VF0-1 BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd80000  0x0 0x4cd80000  0x0 0x60000>;
> +
> +				enetc_port0: ethernet@0,0 {
> +					compatible =3D "pci1131,e101";
> +					reg =3D <0x000000 0 0 0 0>;
> +					clocks =3D <&scmi_clk IMX95_CLK_ENETREF>;
> +					clock-names =3D "ref";
> +					status =3D "disabled";
> +				};
> +
> +				enetc_port1: ethernet@8,0 {
> +					compatible =3D "pci1131,e101";
> +					reg =3D <0x004000 0 0 0 0>;
> +					clocks =3D <&scmi_clk IMX95_CLK_ENETREF>;
> +					clock-names =3D "ref";
> +					status =3D "disabled";
> +				};
> +
> +				enetc_port2: ethernet@10,0 {
> +					compatible =3D "pci1131,e101";
> +					reg =3D <0x008000 0 0 0 0>;
> +					status =3D "disabled";
> +				};
> +
> +				netc_timer: ethernet@18,0 {
> +					reg =3D <0x00c000 0 0 0 0>;
> +					status =3D "disabled";
> +				};
> +			};
> +
> +			netc_bus1: pcie@4cb00000 {
> +				compatible =3D "pci-host-ecam-generic";
> +				reg =3D <0x0 0x4cb00000 0x0 0x100000>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				device_type =3D "pci";
> +				bus-range =3D <0x1 0x1>;
> +					 /* EMDIO BAR0 - non-prefetchable memory */
> +				ranges =3D <0x82000000 0x0 0x4cce0000  0x0 0x4cce0000  0x0 0x20000
> +					 /* EMDIO BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd10000  0x0 0x4cd10000  0x0 0x10000>;
> +
> +				netc_emdio: mdio@0,0 {
> +					compatible =3D "pci1131,ee00";
> +					reg =3D <0x010000 0 0 0 0>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					status =3D "disabled";
> +				};
> +			};
> +		};
> +
>  		ddr-pmu@4e090dc0 {
>  			compatible =3D "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg =3D <0x0 0x4e090dc0 0x0 0x200>;
>  			interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
>  	};
>  };
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



