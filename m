Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B27C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89/1QTHY+P2k/VmhOcq1gS6++X73OgfX35mbDFl/Tg4=; b=Koeha/tt6GZqa7ROaOvywe9/RX
	cvqPZjq9lkpYKJrkBH8vBJBiGMl//jyFe9ijfqDjQPhG9ZxvFIEs6isREx35AN2LTjKdPr0Ki93Sn
	LELIIOfGTEn4nCITTDGlOH6uZQk7wW70a903Aot7FV6kZ1BxJiOpVKfS3qz3V87YFFchAwo6eiTpB
	qPNcBo0nO7BWLB92abKIdiYsg+22a4dm+YtJAiUtP19TREWXrAZcAjOzkhxbpGBZm1nj4vLtZS4F8
	uv18PC8quwzz5bJXC7oWlEyO3rjohjQPEr3uHg79d4uQdJnevR2vZXkCN1c3cpeXjHDqt+fenG+Mr
	Ud2Fuvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvHM-00000006Kvd-1KdY;
	Tue, 10 Jun 2025 09:28:24 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOv0Y-00000006HZb-3K9V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 09:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749546662; x=1781082662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=89/1QTHY+P2k/VmhOcq1gS6++X73OgfX35mbDFl/Tg4=;
  b=O4ol68GDifc03HmRZf3u4eXORyEKtYdsRuKRzLrpiho4wubbgQFkq71d
   ObVlgIvmBzlhGnvNTyBXtzUn/at0j1KZwHU0QRf7klP7kDIQX2819S8ZD
   Alco92NrKlo8K/3q6OcQ3gklVBo3KCQOLgptn9Cx+6cw9pmssg2IVf565
   +vTPmxwRZL/OcpMAHyLVbTMvDw4GnoJQFSBHJXXR88mxR9g/1pqTIrlb2
   Od+oSstFcKHK5DRBXuj4DfuDczwBslogQ/A7EUPE1HRrMeQhDUIuPnIbC
   csEcT3kzbhyAN2W7iG0vFKrD7eFETOZsYsKfSH9bXA/x+BlWiIto3kByH
   A==;
X-CSE-ConnectionGUID: TZzA5Zw5R3+FCYRCkwSeUw==
X-CSE-MsgGUID: fxHh5eLSQrGT90TbIgBlgA==
X-IronPort-AV: E=Sophos;i="6.16,224,1744063200"; 
   d="scan'208";a="44540151"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Jun 2025 11:11:00 +0200
X-CheckPoint: {6847F6A4-B-BC084F3F-FD2A1205}
X-MAIL-CPID: 4230B68194477521F3998EB01D52AF94_0
X-Control-Analysis: str=0001.0A00639F.6847F6B1.0071,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0427B160D4B;
	Tue, 10 Jun 2025 11:10:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749546656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89/1QTHY+P2k/VmhOcq1gS6++X73OgfX35mbDFl/Tg4=;
	b=QLZdngqkjuwoDKVsdxIKGXK8RBU8otgV9LfGqaHv+NmtS3MoAVXGdE3ZbhW9rIDuLj0vq2
	yYFrVyqgrYpGwiMoQtrSRv0x29bwEEO+QcQ5iAGMukGyELvHxVquVjzKiOVslgy9hp+3O4
	WK4hB62/ZLQLb2OKqWdzEKeAA95aPuHekFVg6ammudxMwFxQXZRbD7VBVbKN6CUEs3O5lG
	6z8vwB8vnQE/xTIawG5cAf2Wc4f6Z1ZKstY0t8P0a9jsoKP02V+Z7A2ObG2LEDMznnrX8x
	EKFCAgHvWe4jGSd+mz12CgBbyEqFPMjDMpnbHHm7XU5NBwCA94maboL+3H2nlg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] media: imx-mipi-csis: Rename register macros to match
 reference manual
Date: Tue, 10 Jun 2025 11:10:54 +0200
Message-ID: <3358871.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250608235840.23871-2-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_021103_140844_F1ECD0F4 
X-CRM114-Status: GOOD (  20.92  )
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

Hi Laurent,

thanks for the patch.

Am Montag, 9. Juni 2025, 01:58:33 CEST schrieb Laurent Pinchart:
> The CSIS driver uses register macro names that do not match the
> reference manual of the i.MX7[DS] and i.MX8M[MNP] SoCs in which the CSIS
> is integrated. Rename them to match the documentation, making the code
> easier to read alongside the reference manuals.
>=20
> One of the misnamed register fields is MIPI_CSIS_INT_SRC_ERR_UNKNOWN,
> which led to the corresponding event being logged as "Unknown Error".
> The correct register field name is MIPI_CSIS_INT_SRC_ERR_ID, documented
> as "Unknown ID error". Update the event description accordingly.
>=20
> While at it, also replace a few *_OFFSET macros with parametric macros
> for consistency, and add the missing MIPI_CSIS_ISP_RESOL_VRESOL and
> MIPI_CSIS_ISP_RESOL_HRESOL register field macros.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 69 +++++++++++-----------
>  1 file changed, 36 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index 2beb5f43c2c0..d59666ef7545 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -55,13 +55,13 @@
>  /* CSIS common control */
>  #define MIPI_CSIS_CMN_CTRL			0x04
>  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
> -#define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
> +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_NONE	(0 << 10)
> +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	(1 << 10)
> +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
> +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	(3 << 8)
>  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
> -#define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
> -#define MIPI_CSIS_CMN_CTRL_ENABLE		BIT(0)
> -
> -#define MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET	8
> -#define MIPI_CSIS_CMN_CTRL_LANE_NR_MASK		(3 << 8)
> +#define MIPI_CSIS_CMN_CTRL_SW_RESET		BIT(1)
> +#define MIPI_CSIS_CMN_CTRL_CSI_EN		BIT(0)
> =20
>  /* CSIS clock control */
>  #define MIPI_CSIS_CLK_CTRL			0x08
> @@ -87,7 +87,7 @@
>  #define MIPI_CSIS_INT_MSK_ERR_WRONG_CFG		BIT(3)
>  #define MIPI_CSIS_INT_MSK_ERR_ECC		BIT(2)
>  #define MIPI_CSIS_INT_MSK_ERR_CRC		BIT(1)
> -#define MIPI_CSIS_INT_MSK_ERR_UNKNOWN		BIT(0)
> +#define MIPI_CSIS_INT_MSK_ERR_ID		BIT(0)
> =20
>  /* CSIS Interrupt source */
>  #define MIPI_CSIS_INT_SRC			0x14
> @@ -107,7 +107,7 @@
>  #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
>  #define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
>  #define MIPI_CSIS_INT_SRC_ERR_CRC		BIT(1)
> -#define MIPI_CSIS_INT_SRC_ERR_UNKNOWN		BIT(0)
> +#define MIPI_CSIS_INT_SRC_ERR_ID		BIT(0)
>  #define MIPI_CSIS_INT_SRC_ERRORS		0xfffff
> =20
>  /* D-PHY status control */
> @@ -123,8 +123,8 @@
>  #define MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE_MASK	GENMASK(31, 24)
>  #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(n)	((n) << 22)
>  #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE_MASK	GENMASK(23, 22)
> -#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_CLK	BIT(6)
> -#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_DAT	BIT(5)
> +#define MIPI_CSIS_DPHY_CMN_CTRL_S_DPDN_SWAP_CLK	BIT(6)
> +#define MIPI_CSIS_DPHY_CMN_CTRL_S_DPDN_SWAP_DAT	BIT(5)
>  #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_DAT	BIT(1)
>  #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_CLK	BIT(0)
>  #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE		(0x1f << 0)
> @@ -179,21 +179,23 @@
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
> -#define MIPI_CSIS_ISPCFG_PIXEL_MASK		(3 << 12)
> -#define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
> -#define MIPI_CSIS_ISPCFG_FMT(fmt)		((fmt) << 2)
> -#define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
> +#define MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK	(3 << 12)
> +#define MIPI_CSIS_ISPCFG_PARALLEL		BIT(11)
> +#define MIPI_CSIS_ISPCFG_DATAFORMAT(fmt)	((fmt) << 2)
> +#define MIPI_CSIS_ISPCFG_DATAFORMAT_MASK	(0x3f << 2)
> =20
>  /* ISP Image Resolution register */
>  #define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
> +#define MIPI_CSIS_ISP_RESOL_VRESOL(n)		((n) << 16)
> +#define MIPI_CSIS_ISP_RESOL_HRESOL(n)		((n) << 0)
>  #define CSIS_MAX_PIX_WIDTH			0xffff
>  #define CSIS_MAX_PIX_HEIGHT			0xffff
> =20
>  /* ISP SYNC register */
>  #define MIPI_CSIS_ISP_SYNC_CH(n)		(0x48 + (n) * 0x10)
> -#define MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET	18
> -#define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET	12
> -#define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET	0
> +#define MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(n)	((n) << 18)
> +#define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(n)	((n) << 12)
> +#define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(n)	((n) << 0)
> =20
>  /* ISP shadow registers */
>  #define MIPI_CSIS_SDW_CONFIG_CH(n)		(0x80 + (n) * 0x10)
> @@ -246,7 +248,7 @@ static const struct mipi_csis_event mipi_csis_events[=
] =3D {
>  	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_ID,		"Unknown ID Error" },
>  	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported=
" },
>  	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
>  	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> @@ -517,7 +519,7 @@ static void mipi_csis_sw_reset(struct mipi_csis_devic=
e *csis)
>  	u32 val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> =20
>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> -			val | MIPI_CSIS_CMN_CTRL_RESET);
> +			val | MIPI_CSIS_CMN_CTRL_SW_RESET);
>  	usleep_range(10, 20);
>  }
> =20
> @@ -527,9 +529,9 @@ static void mipi_csis_system_enable(struct mipi_csis_=
device *csis, int on)
> =20
>  	val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>  	if (on)
> -		val |=3D MIPI_CSIS_CMN_CTRL_ENABLE;
> +		val |=3D MIPI_CSIS_CMN_CTRL_CSI_EN;
>  	else
> -		val &=3D ~MIPI_CSIS_CMN_CTRL_ENABLE;
> +		val &=3D ~MIPI_CSIS_CMN_CTRL_CSI_EN;
>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
> =20
>  	val =3D mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
> @@ -549,8 +551,8 @@ static void __mipi_csis_set_format(struct mipi_csis_d=
evice *csis,
> =20
>  	/* Color format */
>  	val =3D mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(0));
> -	val &=3D ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
> -		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
> +	val &=3D ~(MIPI_CSIS_ISPCFG_PARALLEL | MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK=
 |
> +		 MIPI_CSIS_ISPCFG_DATAFORMAT_MASK);
> =20
>  	/*
>  	 * YUV 4:2:2 can be transferred with 8 or 16 bits per clock sample
> @@ -568,12 +570,13 @@ static void __mipi_csis_set_format(struct mipi_csis=
_device *csis,
>  	if (csis_fmt->data_type =3D=3D MIPI_CSI2_DT_YUV422_8B)
>  		val |=3D MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> =20
> -	val |=3D MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
> +	val |=3D MIPI_CSIS_ISPCFG_DATAFORMAT(csis_fmt->data_type);
>  	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(0), val);
> =20
>  	/* Pixel resolution */
> -	val =3D format->width | (format->height << 16);
> -	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0), val);
> +	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0),
> +			MIPI_CSIS_ISP_RESOL_VRESOL(format->height) |
> +			MIPI_CSIS_ISP_RESOL_HRESOL(format->width));
>  }
> =20
>  static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> @@ -635,10 +638,10 @@ static void mipi_csis_set_params(struct mipi_csis_d=
evice *csis,
>  	u32 val;
> =20
>  	val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> -	val &=3D ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
> -	val |=3D (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
> +	val &=3D ~MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK;
> +	val |=3D MIPI_CSIS_CMN_CTRL_LANE_NUMBER(lanes - 1);
>  	if (csis->info->version =3D=3D MIPI_CSIS_V3_3)
> -		val |=3D MIPI_CSIS_CMN_CTRL_INTER_MODE;
> +		val |=3D MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT;

Mh, what about i.MX8MP which also has these bitfield defined, but is
not a MIPI_CSIS_V3_3 core?

Best regards,
Alexander

>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
> =20
>  	__mipi_csis_set_format(csis, format, csis_fmt);
> @@ -647,10 +650,10 @@ static void mipi_csis_set_params(struct mipi_csis_d=
evice *csis,
>  			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(csis->hs_settle) |
>  			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(csis->clk_settle));
> =20
> -	val =3D (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
> -	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
> -	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET);
> -	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0), val);
> +	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0),
> +			MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(0) |
> +			MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(0) |
> +			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
> =20
>  	val =3D mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
>  	val |=3D MIPI_CSIS_CLK_CTRL_WCLK_SRC;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



