Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8FCC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vVcXyX+xtzatyZ67qI3iXm3uKRPpWAgfVSJ1CwJGWU=; b=xJs/lDt65xxH1Q2hKMzc6FpWRL
	EtLwG1d1sH1E8Rg54mAQsoVRNzNnoloY/iMb+3qM1DfIFwnBMF0rAHccUHwnq3JDhTaM8MMLPXDCl
	N/m4ftdhKCdSkC4WEw6fragiE+OrSZrY+hU1E1gJUM6kdjEGiwaOOGMvV0rFPVSy7HLWojnda1MBg
	ihVo0YTsBsAaG6Bk2Y6fRwiTZOZ1oTzV4B8T2IAvEbJpf1hzuogbYZmqF5wMMtYYhsi1LakcSwiUC
	87gwmSLGHxjYrvftw3vS30o1XVbixoLvsCFIT8Nwg+Pkn1G071/ii99hawiv3NorGGR3GMPAM0bog
	xDJTrKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXdp-00000004e1y-224s;
	Tue, 01 Jul 2025 09:51:05 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXJ8-00000004bTO-3rak
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 09:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751362183; x=1782898183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8vVcXyX+xtzatyZ67qI3iXm3uKRPpWAgfVSJ1CwJGWU=;
  b=c4fSb3fYVMvthrQdWCq60WLnl3iBfR3P/1nZtfNZA5kwT39kudidgpuV
   12n8qzfGsJ3yQmsUy1/ZM8kgev1jYsoneZXxSxmiIXCPPhaQzzIbY6ktZ
   72oIwQpEK4Jlej94/PoG22MxXk7yBXqm4TxrkN9tLqI1D73L6JfUxj1K7
   PTCu6dJiKRFqs1iXn8CvUTsrYcbzkQeIsSzI8jzIEC2S3iNqdN75dRzYj
   dJFyiMhoJDcxgdmEFU50mMBK47peEnf1IZfUvGoy1a5D05hLgY3YCVbEH
   FppN6wJ9YCFO9N27zi2cmtiqVenfIAFMv674L7prItoBDuGNmDUgC4ejl
   Q==;
X-CSE-ConnectionGUID: KWegZx3uSZGHf6XTYw6g6w==
X-CSE-MsgGUID: qmSnhnSMRbaxG+oCZztomQ==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44950513"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 11:29:40 +0200
X-CheckPoint: {6863AA84-E-497D558D-EBA6F5A1}
X-MAIL-CPID: 981E69C418C58EEAF382A4535AF8D054_3
X-Control-Analysis: str=0001.0A006374.6863AA90.0033,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DFB216AFEF;
	Tue,  1 Jul 2025 11:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751362175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8vVcXyX+xtzatyZ67qI3iXm3uKRPpWAgfVSJ1CwJGWU=;
	b=lVOPbZTbPJo4LFWHire8cx5wWjMgRq2jKMq62onNgUFtLflzcJbZQCxUeK2vfnqPGryy5Z
	ZLd5VWGBOisn6mQ1kYJ32BUud4hUYnI81POx4azUVCiKsfKk2eihq2oZ++3h8q8CANHz4Z
	3lSm74XuT0Kw97NbQLfhAotJ6XOFlHOkYO4kdBccwhLHLDuviy8L3fmQ2tEG3RCPYSgZOz
	7EWUfWqBrkrtlQCNzg2i0S9A2uSc5oHO6zrgrSz5ZrKnE3TXzDjuKlMqQNK+aKROXj/don
	LECZXLpgaV8VaT2DPj+4TLYWO2+x957TpLBKsxeQhWESOeUPqZDovjr1AcVNSg==
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
Subject: Re: [PATCH 4/5] clk: imx95-blk-ctl: Add clock for i.MX94 LVDS/Display CSR
Date: Tue, 01 Jul 2025 11:29:34 +0200
Message-ID: <4665053.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250701-imx95-blk-ctl-7-1-v1-4-00db23bd8876@nxp.com>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
 <20250701-imx95-blk-ctl-7-1-v1-4-00db23bd8876@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_022943_165002_374475ED 
X-CRM114-Status: GOOD (  17.99  )
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

thanks for the patch.

Am Dienstag, 1. Juli 2025, 09:04:40 CEST schrieb Peng Fan:
> i.MX94 BLK CTL LVDS CSR's LVDS_PHY_CLOCK_CONTRL register controls the clo=
ck
> gating logic of LVDS units. Display CSR's DISPLAY_ENGINES_CLOCK_CONTROL
> register controls the selection of the clock feeding the display engine.
>=20
> Add clock gate support for the two CSRs.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 50 +++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-im=
x95-blk-ctl.c
> index 828ee0a81ff62c6e4f61eef350b9073f19f5351f..5fe582b0d4a9a197f2c1a49dc=
18f15ca83ccb4a4 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024-2025 NXP
>   */
> =20
> +#include <dt-bindings/clock/nxp,imx94-clock.h>
>  #include <dt-bindings/clock/nxp,imx95-clock.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> @@ -300,6 +301,51 @@ static const struct imx95_blk_ctl_dev_data hsio_blk_=
ctl_dev_data =3D {
>  	.clk_reg_offset =3D 0,
>  };
> =20
> +static const struct imx95_blk_ctl_clk_dev_data imx94_lvds_clk_dev_data[]=
 =3D {
> +	[IMX94_CLK_DISPMIX_LVDS_CLK_GATE] =3D {
> +		.name =3D "lvds_clk_gate",
> +		.parent_names =3D (const char *[]){ "ldbpll", },
> +		.num_parents =3D 1,
> +		.reg =3D 0,
> +		.bit_idx =3D 1,
> +		.bit_width =3D 1,
> +		.type =3D CLK_GATE,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.flags2 =3D CLK_GATE_SET_TO_DISABLE,
> +	},
> +};
> +
> +static const struct imx95_blk_ctl_dev_data imx94_lvds_csr_dev_data =3D {
> +	.num_clks =3D ARRAY_SIZE(imx94_lvds_clk_dev_data),
> +	.clk_dev_data =3D imx94_lvds_clk_dev_data,
> +	.clk_reg_offset =3D 0,
> +	.rpm_enabled =3D true,
> +};
> +
> +static const char * const imx94_disp_engine_parents[] =3D {
> +	"disppix", "ldb_pll_div7"
> +};
> +
> +static const struct imx95_blk_ctl_clk_dev_data imx94_dispmix_csr_clk_dev=
_data[] =3D {
> +	[IMX94_CLK_DISPMIX_CLK_SEL] =3D {
> +		.name =3D "disp_clk_sel",
> +		.parent_names =3D imx94_disp_engine_parents,
> +		.num_parents =3D ARRAY_SIZE(imx94_disp_engine_parents),
> +		.reg =3D 0,
> +		.bit_idx =3D 1,
> +		.bit_width =3D 1,
> +		.type =3D CLK_MUX,
> +		.flags =3D CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct imx95_blk_ctl_dev_data imx94_dispmix_csr_dev_data =
=3D {
> +	.num_clks =3D ARRAY_SIZE(imx94_dispmix_csr_clk_dev_data),
> +	.clk_dev_data =3D imx94_dispmix_csr_clk_dev_data,
> +	.clk_reg_offset =3D 0,
> +	.rpm_enabled =3D true,
> +};
> +
>  static int imx95_bc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -474,6 +520,8 @@ static const struct of_device_id imx95_bc_of_match[] =
=3D {
>  	{ .compatible =3D "nxp,imx95-hsio-blk-ctl", .data =3D &hsio_blk_ctl_dev=
_data },
>  	{ .compatible =3D "nxp,imx95-vpu-csr", .data =3D &vpublk_dev_data },
>  	{ .compatible =3D "nxp,imx95-netcmix-blk-ctrl", .data =3D &netcmix_dev_=
data},
> +	{ .compatible =3D "nxp,imx94-lvds-csr", .data =3D &imx94_lvds_csr_dev_d=
ata },
> +	{ .compatible =3D "nxp,imx94-display-csr", .data =3D &imx94_dispmix_csr=
_dev_data },

Similar to patch 1, sort them properly.

Best regards,
Alexander

>  	{ /* Sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, imx95_bc_of_match);
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



