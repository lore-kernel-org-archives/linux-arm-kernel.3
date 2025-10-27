Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8173CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgI6V23Ri1vReEoNo6plAZiLdf2JKlAnRf/2oXQccV8=; b=kmkYD04kjgYC5S/mWqeGOnKNzY
	lZjzmHkVYGoia2a1PS/g4CVzLnUH3jSYta5HND2EfdoPi1X2T9JRjZ0py3N4c/DzZYphZEgTx0/6+
	VMpuG3xAER8wXXgWLUdi/Vod8SjG34PI5cM2IU6hLDDzG/ONUIlwpAwO7RLzMOJIElrwBUQYTu6ha
	vZd5N6y/DSwv6sIixDHfOM00LCH7W25CD5TSuEqIiH/xyVdsPrPcoWsTVpnfA74DudaKLcZDCSA2Y
	vKml7ZzGMhexzJrhwS4DhqJF2dqkxi4+QXhmYSqlntuNQQ40bMws4qj8ipJVSJhdNl4dMCMsn/T9H
	y2PKFVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJFU-0000000DUmF-3dqe;
	Mon, 27 Oct 2025 09:10:44 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJFS-0000000DUlj-2WUb;
	Mon, 27 Oct 2025 09:10:43 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cw75W5p7qzyT0;
	Mon, 27 Oct 2025 11:10:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1761556239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FgI6V23Ri1vReEoNo6plAZiLdf2JKlAnRf/2oXQccV8=;
	b=YwnyYSc8oChOBrSUdHjqrf2iSqRRIRfeZQDbYFQ2wNsdKyyA/dxdu1vNyPVQRMTC8tweqJ
	3M8C4h/oU+HsvnnRph7lR51dZJeoh1ICc+yqNlzALf1jJ3JCxFeycpTsh9hc3fkCO3FGFd
	Xja1pavEtX7bHfj81eGBJWXbmVjDvZA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1761556239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FgI6V23Ri1vReEoNo6plAZiLdf2JKlAnRf/2oXQccV8=;
	b=Re120l8vm66ZP8IRQddsokS4lEtpxb66A7cj4WH2b1H9bqLGfwFs9izE7Ip+7s2AJK+jDq
	Yb9pRqGBeg59xuIhvy1JRFEKmxNkjudSyl4OwMrAvlr92ZxYgwBa+sk6zMi+7cHuGTxoi9
	Ofg9T1iUWpW+YT7mwp8Ut/D2r7O1WPU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1761556239; a=rsa-sha256; cv=none;
	b=ujjWn5pbp4xouvvewe+keUfMTohYr/knkyTAzdh/fLzBo3WpXgnjDI8fPm/IoT5K83b4uj
	1e6LMx+lWX9nHzNGfBLPjfNfFRsOlgs1RHEI2r7RbpBQKDtIH9VjgELxl6GxZxD7RT1Sk6
	R5C/bNWIxd7seTnqDbtDJLXrjypXIQ4=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A00FC634C5B;
	Mon, 27 Oct 2025 11:10:39 +0200 (EET)
Date: Mon, 27 Oct 2025 11:10:39 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 17/31] media: synopsys: move imx6-mipi-csi2.c to
 synopsys/mipi-csi2.c
Message-ID: <aP83D-ndmlv5Jns8@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-17-c9286fbb34b9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-17-c9286fbb34b9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_021042_827496_025E95A7 
X-CRM114-Status: GOOD (  18.85  )
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

On Thu, Aug 21, 2025 at 04:15:52PM -0400, Frank Li wrote:
> Move dw MIPI CSI2 common part drivers/staging/media/imx/imx6-mipi-csi2.c
> under synopsys to let more SoC can reuse it.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/synopsys/Kconfig                      | 12 ++++++++++++
>  drivers/media/platform/synopsys/Makefile                     |  2 ++
>  .../imx6-mipi-csi2.c => media/platform/synopsys/mipi-csi2.c} |  0
>  drivers/staging/media/imx/Kconfig                            |  1 +
>  drivers/staging/media/imx/Makefile                           |  2 +-
>  5 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
> index 4fd521f78425a96985fa3b6b017deef36631d1a9..e54dad835349d420dead6d5313c0623567c28c0b 100644
> --- a/drivers/media/platform/synopsys/Kconfig
> +++ b/drivers/media/platform/synopsys/Kconfig
> @@ -1,3 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +config VIDEO_SYNOPSYS_MIPI_CSI2
> +        tristate "Synopsys DesignWare MIPI CSI2 Receiver common library"
> +        depends on VIDEO_DEV
> +        select MEDIA_CONTROLLER
> +        select VIDEO_V4L2_SUBDEV_API
> +        select VIDEOBUF2_DMA_CONTIG
> +        help
> +          Common library for MIPI CSI2 Controller.
> +
> +          To compile this driver as a module, choose M here. The module
> +          will be called synopsys_hdmirx
> +
>  source "drivers/media/platform/synopsys/hdmirx/Kconfig"
> diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
> index 3b12c574dd67c072901108d88cad64ca3a723938..045ed3177738e6d28aa223804b79e6774e141dc8 100644
> --- a/drivers/media/platform/synopsys/Makefile
> +++ b/drivers/media/platform/synopsys/Makefile
> @@ -1,2 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += hdmirx/
> +
> +obj-$(CONFIG_VIDEO_SYNOPSYS_MIPI_CSI2) += mipi-csi2.o

Please give the module a more specific name.

> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
> similarity index 100%
> rename from drivers/staging/media/imx/imx6-mipi-csi2.c
> rename to drivers/media/platform/synopsys/mipi-csi2.c
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index 1cd48028b6416ae16ed69c68186281b6c6bcbec8..53e5c1546ac53e4942974a9acdcf078de1cb6073 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -10,6 +10,7 @@ config VIDEO_IMX_MEDIA
>  	select V4L2_MEM2MEM_DEV
>  	select VIDEOBUF2_DMA_CONTIG
>  	select VIDEO_V4L2_SUBDEV_API
> +	select VIDEO_SYNOPSYS_MIPI_CSI2
>  	help
>  	  Say yes here to enable support for video4linux media controller
>  	  drivers for the i.MX5/6 SOC.
> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> index 064a6c6c069aa440c72a483080cbedf89d370193..1978b82fd1876566acbb952a4d14cf9aca35e996 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -11,4 +11,4 @@ imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
>  obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
>  obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media.o
>  obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media-csi.o
> -obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-mipi-csi2.o imx6-csi2.o
> +obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-csi2.o
> 

-- 
Regards,

Sakari Ailus

