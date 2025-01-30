Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA711C02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rd2a38AIvhmJF+sIIntn3sECyoZlnToSJTC1vvQgGpU=; b=vv0tUuTaOS1lFZCyeVd7tzGE88
	BgwFFp5akvnOxDl9UXW0hVZAzk+DalUSVrsVHbwDJylW/J8X0PFf8pV4qBJuM+pkDRWpjFZue+5PM
	bFqLVbiVOb8oFiw5P8gXr6i3eiWbxJxqFpM0K37C2IZSVo+FJIOa1a0kFsaGNM6wThfCBrZjtU9Jd
	7SlM2r5AT+rEhaQZvQkFFVjFymeK/WDOYhb+g4SKXvYtMJFAzReN7wmaVPbNk1KKMwUfQgFt6yN5k
	RaCUBW+Nz2NHHtNDPu4VT1cn+azTyDmWEpLqNk4TaYNWDl4xVAjyFv4NyfaoifSxux/9hTt1pNEtF
	JIlocjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRCY-00000008XJy-3frg;
	Thu, 30 Jan 2025 09:51:10 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRBF-00000008XEp-2ChD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 09:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738230589; x=1769766589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rd2a38AIvhmJF+sIIntn3sECyoZlnToSJTC1vvQgGpU=;
  b=qxvGeVmCMivSUFGwuSJvbSiR40sL+gX4fz1mOFQsGgsgkgW/Ml04CVJo
   tOWiLdEcaNjS+XsGC5hcvmumUxHZhfj72WrrMoRnN9moUWhp2npWCfIo9
   Dv8Sn3YIKSk0aB2Z/7FYnNM2IYBf62cIPxRrsWRVheFZ2SwGYWXCZTh4E
   x8FOxXlK4rqvmNSDNoxxfeVKcjbOqt4mGBnU1QPILZKtVRo0BMBlSOKgl
   biLesQI0rvGLOfdZSusaa1bFPdutBonj/+JeZ4LEpn2gocXdZDwocZBuo
   z1J8xb0O5JxBuZYomRA5Fet/INSKb9WlhKcGkhXosQp24aiK6cUAC8BCX
   A==;
X-CSE-ConnectionGUID: yJZjX8XqQE24M0r03Fnbdg==
X-CSE-MsgGUID: bNrVFvibQqGR23uGzNF9Fw==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; 
   d="scan'208";a="41370002"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jan 2025 10:49:43 +0100
X-CheckPoint: {679B4B37-18-1CE016C0-E589DA3E}
X-MAIL-CPID: DD08E384A724ED70B11DF9CE815C91BE_1
X-Control-Analysis: str=0001.0A682F27.679B4B37.00B9,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13D53167A0C;
	Thu, 30 Jan 2025 10:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738230579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd2a38AIvhmJF+sIIntn3sECyoZlnToSJTC1vvQgGpU=;
	b=A3i5T7FWTQyr0aYYLUVJR4wNh6PNlonbj/S8+XBd3QZqrMwR+vGsSwIvojS4R3cgU/OMLN
	p9Pjody1PtAvH+UMO+dbKEqVe7trjFcXhyEn3iwNJWo3NHdhBF9RPpBjB7zLCwpKaYWXEV
	ICiB9ceIlgzNe2T7pbWQ8XTS9TaHEo8qziWro20NYknF0NYcJFB50W0oH9XiXODbpuC9M+
	/0GVIlz9GvnXV6N/Lz+lCp7pYWn0IUHN1Bi+ZHNn5pYOZljPehu+D+jpE/GuGyzENCqDb6
	CVMMKX1nxi+2ytByDrctmB3v31E1dfGnREvIZZkFJshWW+YSWDuQuQdpHAVSBg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: nvmem: imx-ocotp: Introduce #access-controller-cells
Date: Thu, 30 Jan 2025 10:49:37 +0100
Message-ID: <2771977.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250121-imx-ocotp-v6-1-76dab40e13db@nxp.com>
References: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com> <20250121-imx-ocotp-v6-1-76dab40e13db@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_014950_061483_6F993145 
X-CRM114-Status: GOOD (  14.87  )
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

Am Dienstag, 21. Januar 2025, 16:05:31 CET schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Introduce "#access-controller-cells" to make OCOTP be an accessing
> controller, because i.MX Family OCOTP supports a specific peripheral
> or function being fused which means being disabled.
>=20
> Add the i.MX[95,93] OCOTP gate index.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  5 +++
>  include/dt-bindings/nvmem/fsl,imx93-ocotp.h        | 24 ++++++++++++
>  include/dt-bindings/nvmem/fsl,imx95-ocotp.h        | 43 ++++++++++++++++=
++++++
>  3 files changed, 72 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Doc=
umentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index b2cb76cf9053a883a158acaf5eaa108895818afc..c78e202ced22f1c278f7be827=
b71ba434832d2a7 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -54,6 +54,11 @@ properties:
>    clocks:
>      maxItems: 1
> =20
> +  "#access-controller-cells":
> +    const: 1
> +    description:
> +      Contains the gate ID associated to the peripheral.
> +
>  required:
>    - "#address-cells"
>    - "#size-cells"
> diff --git a/include/dt-bindings/nvmem/fsl,imx93-ocotp.h b/include/dt-bin=
dings/nvmem/fsl,imx93-ocotp.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..6ef525173845fd4ee0e847cf5=
a17e53a14f71362
> --- /dev/null
> +++ b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#ifndef _DT_BINDINGS_NVMEM_IMX93_OTPC_H
> +#define _DT_BINDINGS_NVMEM_IMX93_OTPC_H

This doesn't match the filename.

> +
> +#define IMX93_OCOTP_NPU_GATE		0
> +#define IMX93_OCOTP_A550_GATE		1
> +#define IMX93_OCOTP_A551_GATE		2
> +#define IMX93_OCOTP_M33_GATE		3
> +#define IMX93_OCOTP_CAN1_FD_GATE	4
> +#define IMX93_OCOTP_CAN2_FD_GATE	5
> +#define IMX93_OCOTP_CAN1_GATE		6
> +#define IMX93_OCOTP_CAN2_GATE		7
> +#define IMX93_OCOTP_USB1_GATE		8
> +#define IMX93_OCOTP_USB2_GATE		9
> +#define IMX93_OCOTP_ENET1_GATE		10
> +#define IMX93_OCOTP_ENET2_GATE		11
> +#define IMX93_OCOTP_PXP_GATE		12
> +#define IMX93_OCOTP_MIPI_CSI1_GATE	13
> +#define IMX93_OCOTP_MIPI_DSI1_GATE	14
> +#define IMX93_OCOTP_LVDS1_GATE		15
> +#define IMX93_OCOTP_ADC1_GATE		16
> +
> +#endif
> diff --git a/include/dt-bindings/nvmem/fsl,imx95-ocotp.h b/include/dt-bin=
dings/nvmem/fsl,imx95-ocotp.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..2d21d1f690974d0215c713521=
68378a150f489af
> --- /dev/null
> +++ b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#ifndef _DT_BINDINGS_NVMEM_IMX95_OTPC_H
> +#define _DT_BINDINGS_NVMEM_IMX95_OTPC_H

This doesn't match the filename.

Best regards,
Alexander

> +
> +#define IMX95_OCOTP_CANFD1_GATE		0
> +#define IMX95_OCOTP_CANFD2_GATE		1
> +#define IMX95_OCOTP_CANFD3_GATE		2
> +#define IMX95_OCOTP_CANFD4_GATE		3
> +#define IMX95_OCOTP_CANFD5_GATE		4
> +#define IMX95_OCOTP_CAN1_GATE		5
> +#define IMX95_OCOTP_CAN2_GATE		6
> +#define IMX95_OCOTP_CAN3_GATE		7
> +#define IMX95_OCOTP_CAN4_GATE		8
> +#define IMX95_OCOTP_CAN5_GATE		9
> +#define IMX95_OCOTP_NPU_GATE		10
> +#define IMX95_OCOTP_A550_GATE		11
> +#define IMX95_OCOTP_A551_GATE		12
> +#define IMX95_OCOTP_A552_GATE		13
> +#define IMX95_OCOTP_A553_GATE		14
> +#define IMX95_OCOTP_A554_GATE		15
> +#define IMX95_OCOTP_A555_GATE		16
> +#define IMX95_OCOTP_M7_GATE		17
> +#define IMX95_OCOTP_DCSS_GATE		18
> +#define IMX95_OCOTP_LVDS1_GATE		19
> +#define IMX95_OCOTP_ISP_GATE		20
> +#define IMX95_OCOTP_USB1_GATE		21
> +#define IMX95_OCOTP_USB2_GATE		22
> +#define IMX95_OCOTP_NETC_GATE		23
> +#define IMX95_OCOTP_PCIE1_GATE		24
> +#define IMX95_OCOTP_PCIE2_GATE		25
> +#define IMX95_OCOTP_ADC1_GATE		26
> +#define IMX95_OCOTP_EARC_RX_GATE	27
> +#define IMX95_OCOTP_GPU3D_GATE		28
> +#define IMX95_OCOTP_VPU_GATE		29
> +#define IMX95_OCOTP_JPEG_ENC_GATE	30
> +#define IMX95_OCOTP_JPEG_DEC_GATE	31
> +#define IMX95_OCOTP_MIPI_CSI1_GATE	32
> +#define IMX95_OCOTP_MIPI_CSI2_GATE	33
> +#define IMX95_OCOTP_MIPI_DSI1_GATE	34
> +#define IMX95_OCOTP_V2X_GATE		35
> +
> +#endif
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



