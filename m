Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08776C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 18:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EVrnJsceOV57c2tNdctaK4XJJ0MWKnP8xv9YojGc8k=; b=0LbsR6gRDPjZZseU7P3PXPElGe
	wLsIOFXzJuAtW5dAa63iiaiERnhfKsahkMHqs3MWRgS4kxp6vxeMaav37ipG21H1zA/9tVAFoxtFH
	AuomrICv6zhtkmsAcd/vaeCWTVusknWIMEuTglwz4ZKVgp2RwiY+7SgGclT2DVpJApreNlzHdSgBY
	bI5OrPwzM7gAAoD2bA4wMwqIdDvWh2HmvHZ2TtVPH8EApXJfTqjF3UszgmfHThuW75omPX+DmB7J6
	owkCXPGVIWnpZEEfo08oe8o1IUfDr4YE5GH1IGZH3QZzz8ogWMSHILU/BsuhzkXumTNp/XNpY5yh9
	K6NToqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufMi5-0000000ANuq-3QAj;
	Fri, 25 Jul 2025 17:59:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufMfb-0000000ANFg-3HSm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 17:57:25 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0FEA0C66;
	Fri, 25 Jul 2025 19:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753466197;
	bh=5ldzZ9vyLUpLw7BH0/+el75YcJaK4n9pqdRVPuEkdaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GUoipYeI4r5hxShSrw8p3pKpANuUknHdeOB6tf2trLpU50/AJJHr2gSz0BvuCacl0
	 0ntiCKiiL74GFeFu/Ve3GUvIUxwe9JPu+bCOJCB4aVY3Ls/b3dDYN3wABpEzw/GBgk
	 YM80nWbUZ6egMPhVsFIE1V0L1aIEyGQr47DuN5Yo=
Date: Fri, 25 Jul 2025 20:57:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Zhipeng Wang <zhipeng.wang_1@nxp.com>
Subject: Re: [PATCH v3 2/4] media: nxp: add V4L2 subdev driver for camera
 parallel interface (CPI)
Message-ID: <20250725175711.GA27425@pendragon.ideasonboard.com>
References: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
 <20250708-imx8qxp_pcam-v3-2-c8533e405df1@nxp.com>
 <20250725000404.GW11202@pendragon.ideasonboard.com>
 <aIOk9W/RBKmS8uVQ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aIOk9W/RBKmS8uVQ@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_105723_954033_4CFA2177 
X-CRM114-Status: GOOD (  35.22  )
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

On Fri, Jul 25, 2025 at 11:38:29AM -0400, Frank Li wrote:
> On Fri, Jul 25, 2025 at 03:04:04AM +0300, Laurent Pinchart wrote:
> > Hi Frank,
> >
> > Thank you for the patch.
> >
> > On Tue, Jul 08, 2025 at 01:48:43PM -0400, Frank Li via B4 Relay wrote:
> > > From: Alice Yuan <alice.yuan@nxp.com>
> > >
> > > Add a V4L2 sub-device driver for the CPI controller found on i.MX8QXP,
> > > i.MX8QM, and i.MX93 SoCs. This controller supports parallel camera sensors
> > > and enables image data capture through a parallel interface.
> > >
> > > Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> > > Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> > > Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change in v3
> > > - replace csi with cpi
> > > - use __free(fwnode_handle) to simpilfy code
> > > - remove imx91 driver data, which is the same as imx93
> > >
> > > change in v2
> > > - remove MODULE_ALIAS
> > > - use devm_pm_runtime_enable() and cleanup remove function
> > > - change output format to 1x16. controller convert 2x8 to 1x16 format
> > > ---
> > >  MAINTAINERS                                   |   1 +
> > >  drivers/media/platform/nxp/Kconfig            |  11 +
> > >  drivers/media/platform/nxp/Makefile           |   1 +
> > >  drivers/media/platform/nxp/imx-parallel-cpi.c | 920 ++++++++++++++++++++++++++
> > >  4 files changed, 933 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8ae0667d2bb41fb6a1549bd3b2b33f326cbd1303..14842a3b860a6f23846f12a684eedcbb9eb69e19 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15112,6 +15112,7 @@ F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > >  F:	drivers/media/platform/nxp/imx-mipi-csis.c
> > > +F:	drivers/media/platform/nxp/imx-parallel-cpi.c
> > >  F:	drivers/media/platform/nxp/imx7-media-csi.c
> > >  F:	drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > >
> > > diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> > > index 40e3436669e213fdc5da70821dc0b420e1821f4f..504ae1c6494f331c16124a224421ac7acd433ba5 100644
> > > --- a/drivers/media/platform/nxp/Kconfig
> > > +++ b/drivers/media/platform/nxp/Kconfig
> > > @@ -39,6 +39,17 @@ config VIDEO_IMX_MIPI_CSIS
> > >  	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
> > >  	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
> > >
> > > +config VIDEO_IMX_PARALLEL_CPI
> > > +	tristate "NXP i.MX9/i.MX8 Parallel CPI Driver"
> >
> > I'd write it in numerical order, "i.MX8/i.MX9"
> >
> > > +	depends on ARCH_MXC || COMPILE_TEST
> > > +	depends on VIDEO_DEV
> > > +	select MEDIA_CONTROLLER
> > > +	select V4L2_FWNODE
> > > +	select VIDEO_V4L2_SUBDEV_API
> > > +	help
> > > +	  Video4Linux2 sub-device driver for PARALLEL CPI receiver found
> > > +	  on some iMX8 and iMX9 SoCs.
> > > +
> > >  source "drivers/media/platform/nxp/imx8-isi/Kconfig"
> > >
> > >  # mem2mem drivers
> > > diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> > > index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..5346919d2f1083b51ec99b66981c5d38b3df960c 100644
> > > --- a/drivers/media/platform/nxp/Makefile
> > > +++ b/drivers/media/platform/nxp/Makefile
> > > @@ -7,5 +7,6 @@ obj-y += imx8-isi/
> > >  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> > >  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> > >  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
> > > +obj-$(CONFIG_VIDEO_IMX_PARALLEL_CPI) += imx-parallel-cpi.o
> > >  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
> > >  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> > > diff --git a/drivers/media/platform/nxp/imx-parallel-cpi.c b/drivers/media/platform/nxp/imx-parallel-cpi.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..718f02bf70c4d0ae74ecf842c1ecb1a1afbcdd45
> > > --- /dev/null
> > > +++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
> > > @@ -0,0 +1,920 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * i.MX Parallel CPI receiver driver.
> > > + *
> > > + * Copyright 2019-2025 NXP
> > > + *
> > > + */
> > > +
> > > +#include <linux/bits.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/debugfs.h>
> >
> > I don't think you use this.
> >
> > > +#include <linux/delay.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/interrupt.h>
> >
> > I don't think you use this either.
> >
> > > +#include <linux/io.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/mfd/syscon.h>
> >
> > Alphabetical order please.
> >
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_domain.h>
> >
> > This doesn't seem needed.
> >
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/reset.h>
> >
> > Same here.
> >
> > > +#include <linux/spinlock.h>
> >
> > And here. Please verify all headers, drop the ones you don't need, and
> > add any you may have forgotten. That includes the media/ headers.
> 
> Do you have good method to check it?

There are tools such as include-what-you-use, but I haven't tested that
one with the kernel.

> > > +
> > > +#include <media/v4l2-common.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-event.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-mc.h>
> > > +#include <media/v4l2-subdev.h>
> 
> ...
> 
> > > +
> > > +	/* Software Reset */
> > > +	imx_cpi_sw_reset(pcpidev);
> > > +
> > > +	/* Config PL Data Type */
> > > +	val = readl(pcpidev->regs + pdata->if_ctrl_reg);
> > > +	val |= IF_CTRL_REG_DATA_TYPE(DATA_TYPE_OUT_YUV444);
> >
> > Don't you need to clear the field first ? Same everywhere else where
> > applicable.
> 
> imx_cpi_sw_reset() clean all register.

OK. I wonder if you could then replace some (most ? all ?) of the
read-update-write sequences with plain writes.

> > > +	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
> > > +
> > > +	/* Enable sync Force */
> > > +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> > > +	val |= (CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN);
> > > +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
> 
> ....

-- 
Regards,

Laurent Pinchart

