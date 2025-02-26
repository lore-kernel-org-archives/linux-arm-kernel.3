Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B59C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTp1DwcDw762KDomIRK2976/YjMdtiSjqpoN9MvDBnw=; b=ZfgU15ZGAXfHNYiqefc5e6cLal
	3TERwr8FugddZ/+8r6aSRRf9MY5hwBIGiTR3/RhuJ4JN8Tr2TgzTssBMrFqxJOruiKHpYJbh0JbnL
	oZpEc424Gx0Y243X1Wc5sJDhwWb3+yaMC9ACi9hoQsFA42G5QjPzApTwGGNoHmDfRM+iyKF2A3Y10
	Cj0ZaE/IHhbMm7pPH16ruo0GYXS9Fwu+loiEsmxY5ARCapwfdCVx6PugztN5/jBSAWxd/Prt7QCCn
	Ewk27okO7mBGJKAqKYxdofMMyjssnLIOwRYF+cPZjXhK+rw9uqcY7V6DED2fFv0mvAZYeOVohs1FM
	DK3+bzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCtX-00000002um4-0uyB;
	Wed, 26 Feb 2025 08:35:55 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCo0-00000002t23-27Hf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740558612; x=1772094612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QTp1DwcDw762KDomIRK2976/YjMdtiSjqpoN9MvDBnw=;
  b=a2KIG2mZ9KXzk2kUjzokfDYPEcofv0tvvzkZIlFf8GWhMkkFJduWquV7
   N0GsFcinzvfO0iMBaWlN0f2OIeN9bOm4RFKqrdx6i++vaXbVU5kfzNFuE
   /oH57WjkhmeuNBme9cj7WC2zhOv2NiPWH7xtgFm3gKGc1MHpSxWVaf1C5
   GZrS8bWJeW/ZKFzqGSXODRrwwGOVieTAop0v11BwS/MfcMdiW3i9VdWqA
   W1AHU1x5w0hXqv+OkrqwGGqriqWUIGIMIfmHxjDvgHxTwA2NLUJsNbok5
   I5JybMfhJg1RPUdgxrF/zX5wdswWvx/Q+Q3GFx57KP48n4z/TZzpZKPpZ
   w==;
X-CSE-ConnectionGUID: mnH/OuQLRu6ZleMIQlem2g==
X-CSE-MsgGUID: 7jd0BkKsS/eVEg8don57xg==
X-IronPort-AV: E=Sophos;i="6.13,316,1732575600"; 
   d="scan'208";a="42100428"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Feb 2025 09:30:09 +0100
X-CheckPoint: {67BED111-35-28232521-C0C2250B}
X-MAIL-CPID: 7BEE2FE34E5CA2663E70FFD0064A9E7F_4
X-Control-Analysis: str=0001.0A002114.67BED111.0049,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E89C168E0D;
	Wed, 26 Feb 2025 09:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740558605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QTp1DwcDw762KDomIRK2976/YjMdtiSjqpoN9MvDBnw=;
	b=k4b8csBFyeNFO8pULNoZ5iEdQxDjDA8ObrojCjEeglCFxvD0zH8hinWyCXxU2aUkTBk2k2
	JRLqwoDkA052+wne1RXCwY8xO8EEyt8PeM2vyA0Z6RLBHAewoGdmO8sSkM2JigdSZ3pecq
	3X4HQUsYs8SvtX1qVdWZ7nvDDD/m4aAgCk50bii/dy8tq9WQ39e3uxkdTgNbiUI3J2mFlm
	jOBdWcAUPGTg/4Rhd8voBj0RXnFeJj7Nsfq23lacJNjlKrsxwYTrz0tN2Gd1/jxQqKRQVk
	Bd0EOloWzEMKJ9IDH5b3VkfkRIlEX/38U0czCNgYGFtN7ICm0L2pwOFTwFXVSg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: imx95: add ref clock for pcie nodes
Date: Wed, 26 Feb 2025 09:30:01 +0100
Message-ID: <2979558.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250225170802.2671972-1-Frank.Li@nxp.com>
References: <20250225170802.2671972-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_003013_037616_12A12735 
X-CRM114-Status: GOOD (  14.79  )
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

Am Dienstag, 25. Februar 2025, 18:08:02 CET schrieb Frank Li:
> Add "ref" clock for i.MX95's pcie and fix below CHECK_DTBS warnings:
> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-n=
ames: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
> 	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 - v3
> - fix typo 1000000
>=20
> change from v1 - v2
> - rebase to dt/dt64
> - add clock 100mhz
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 25 ++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 51625bc9154ec..9bb26b466a061 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -291,6 +291,13 @@ sai5_mclk: clock-sai-mclk5 {
>  		clock-output-names =3D "sai5_mclk";
>  	};
> =20
> +	clk_sys100m: clock-sys100m {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <100000000>;
> +		clock-output-names =3D "clk_sys100m";
> +	};
> +

Where does this clock come from? Does this origin on board-level?

Best regards,
Alexander

>  	osc_24m: clock-24m {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
> @@ -1595,6 +1602,14 @@ usb3_dwc3: usb@4c100000 {
>  			};
>  		};
> =20
> +		hsio_blk_ctl: syscon@4c0100c0 {
> +			compatible =3D "nxp,imx95-hsio-blk-ctl", "syscon";
> +			reg =3D <0x0 0x4c0100c0 0x0 0x1>;
> +			#clock-cells =3D <1>;
> +			clocks =3D <&clk_sys100m>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +		};
> +
>  		usb3_phy: phy@4c1f0040 {
>  			compatible =3D "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
>  			reg =3D <0x0 0x4c1f0040 0x0 0x40>,
> @@ -1633,8 +1648,9 @@ pcie0: pcie@4c300000 {
>  			clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> -				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> -			clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> +				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +				 <&hsio_blk_ctl 0>;
> +			clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
>  			assigned-clocks =3D<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
>  					 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> @@ -1706,8 +1722,9 @@ pcie1: pcie@4c380000 {
>  			clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> -				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> -			clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> +				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +				 <&hsio_blk_ctl 0>;
> +			clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
>  			assigned-clocks =3D<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
>  					 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



