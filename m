Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAA7CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 02:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpKy5knsmmd1p8nTc0jfnCzVmk9Bc9SpbS3Px4S10NI=; b=NuK/BWmKtejRgAuXmK8fCFhSQx
	57Zt/J6o5ITZnDO7ZrxN89qCsHo4+DBHgzau8tT9aeCSTqHdaNWGsn9CsUJAokZi066PTyAb1TsUd
	rMhviT6GkxDJMynnCcjyhF+c5mt4w3nFWqKZn5kMZXbOzei60kdYenTE64n6VvmzpBiigG3W00uO1
	0GMAivPkGzAMzTfy3UWmgdUv5l7i0Iz0WqY9vksl01Cc2BhZ/iw9w2t7EulQxkQuRhupBL4YQ71Zz
	ydxSzDSDDQnT6G5go2F/vw2PePk0QHgqHNtXMG0nhGG8n9tVqM4b1Cvg4NdF5cN8mhfgWHJKRjeBT
	U+Z0nGBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCqV-0000000D0if-1eBU;
	Mon, 27 Oct 2025 02:20:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCqS-0000000D0iG-3lzM;
	Mon, 27 Oct 2025 02:20:30 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 61680236;
	Mon, 27 Oct 2025 03:18:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761531517;
	bh=0CPmrnJL35JfeSwF9I2tzAzFRtMEjte+93fbLG7UNU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+hjqnVXDi8L+biq5hrxrkwgQ7iKXFsSi2wbLCLPUZ6/HtkYFWa3AS1AvSksK1ldJ
	 f7HZcdQYnaDiNFVUc68KRRLeQ5ifXosnR1K0icoUFGQYIOqG9xYuz/NIcUYPTJhLdz
	 eV7XunXdJF65K/cWOBRNefdvLPo/1oKm4mYxTPT8=
Date: Mon, 27 Oct 2025 04:20:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
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
Subject: Re: [PATCH v3 12/31] media: staging: media: imx6-mipi-csi2: move sd
 imx6's specific initialization into imx6-sci2.c
Message-ID: <20251027022010.GW13023@pendragon.ideasonboard.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-12-c9286fbb34b9@nxp.com>
 <20251027014448.GV13023@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027014448.GV13023@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_192029_079397_7664E74A 
X-CRM114-Status: GOOD (  30.14  )
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

On Mon, Oct 27, 2025 at 03:44:49AM +0200, Laurent Pinchart wrote:
> On Thu, Aug 21, 2025 at 04:15:47PM -0400, Frank Li wrote:
> > Move imx6's specific sd's owner, name, csi2_internal_ops, grp_id into
> 
> grp_id needs to go. It's specific to the i.MX6 IPUv3 framework, and is
> the main part hindering splitting the CSI-2 receiver driver from the
> rest of the code.
> 
> > imx6-sci2.c.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/staging/media/imx/imx6-csi2.c      | 23 +++++++++++++++++++++++
> >  drivers/staging/media/imx/imx6-mipi-csi2.c | 29 ++++++-----------------------
> >  include/media/dw-mipi-csi2.h               |  4 ++++
> >  3 files changed, 33 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
> > index 72eff685fad99b3def46cf2866565191b7de9a8b..66274d8d73b67b35682bb82a9eb745bb24da7ae4 100644
> > --- a/drivers/staging/media/imx/imx6-csi2.c
> > +++ b/drivers/staging/media/imx/imx6-csi2.c
> > @@ -19,6 +19,29 @@ struct imx6_csi2 {
> >  	struct dw_mipi_csi2_dev dw;
> >  };
> >  
> > +static int csi2_registered(struct v4l2_subdev *sd)
> > +{
> > +	struct dw_mipi_csi2_dev *csi2 = sd_to_dw_mipi_csi2_dev(sd);
> > +
> > +	/* set a default mbus format  */
> > +	return imx_media_init_mbus_fmt(&csi2->format_mbus,
> > +				      IMX_MEDIA_DEF_PIX_WIDTH,
> > +				      IMX_MEDIA_DEF_PIX_HEIGHT, 0,
> > +				      V4L2_FIELD_NONE, NULL);
> > +}
> > +
> > +static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
> > +	.init_state = imx_media_init_state,
> > +	.registered = csi2_registered,

Also, these two operations should be handled by the new driver. The imx6
media framework has a set of helper functions to handle initialization
of formats, with data structures shared between drivers. It's fine
duplicating some of the code, with a copy of the required data in the
new driver. It will be a good opportunity to both avoid historical
mistake with the new code (for instance, imx_media_init_state() should
really not be implemented as a wrapper around get subdev get_fmt
operation), and to remove code from the shared helpers that is
CSI-2-specific, if any.

> > +};
> > +
> > +static const struct dw_mipi_csi2_config imx6_config = {
> > +	.module = THIS_MODULE,
> > +	.name = "imx6-mipi-csi2",
> > +	.internal_ops = &csi2_internal_ops,
> > +	.grp_id = IMX_MEDIA_GRP_ID_CSI2,
> > +};
> > +
> >  static int csi2_probe(struct platform_device *pdev)
> >  {
> >  	struct imx6_csi2 *csi2;
> > diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > index b5911a37972be868e10c115ada1910fa04b2765c..ff06a739b957b305625d145c04c06999d0c13cae 100644
> > --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> > +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > @@ -15,11 +15,11 @@
> >  #include <linux/platform_device.h>
> >  #include <media/dw-mipi-csi2.h>
> >  #include <media/v4l2-common.h>
> > +#include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-mc.h>
> >  #include <media/v4l2-subdev.h>
> > -#include "imx-media.h"
> >  
> >  /*
> >   * The default maximum bit-rate per lane in Mbps, if the
> > @@ -44,8 +44,6 @@ struct dw_csi2_regs {
> >  	u32	phy_tst_ctrl1;
> >  };
> >  
> > -#define DEVICE_NAME "imx6-mipi-csi2"
> > -
> >  /* Help check wrong access unexisted register at difference IP version */
> >  #define DW_REG_EXIST		0x80000000
> >  #define DW_REG(x)		(DW_REG_EXIST | (x))
> > @@ -544,17 +542,6 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >  
> > -static int csi2_registered(struct v4l2_subdev *sd)
> > -{
> > -	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
> > -
> > -	/* set a default mbus format  */
> > -	return imx_media_init_mbus_fmt(&csi2->format_mbus,
> > -				      IMX_MEDIA_DEF_PIX_WIDTH,
> > -				      IMX_MEDIA_DEF_PIX_HEIGHT, 0,
> > -				      V4L2_FIELD_NONE, NULL);
> > -}
> > -
> >  /* --------------- CORE OPS --------------- */
> >  
> >  static int csi2_log_status(struct v4l2_subdev *sd)
> > @@ -605,11 +592,6 @@ static const struct v4l2_subdev_ops csi2_subdev_ops = {
> >  	.pad = &csi2_pad_ops,
> >  };
> >  
> > -static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
> > -	.init_state = imx_media_init_state,
> > -	.registered = csi2_registered,
> > -};
> > -
> >  static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
> >  			     struct v4l2_subdev *sd,
> >  			     struct v4l2_async_connection *asd)
> > @@ -709,14 +691,15 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
> >  	csi2->regs = &dw_csi2_v0;
> >  	v4l2_subdev_init(&csi2->sd, &csi2_subdev_ops);
> >  	v4l2_set_subdevdata(&csi2->sd, &pdev->dev);
> > -	csi2->sd.internal_ops = &csi2_internal_ops;
> >  	csi2->sd.entity.ops = &csi2_entity_ops;
> >  	csi2->sd.dev = &pdev->dev;
> > -	csi2->sd.owner = THIS_MODULE;
> >  	csi2->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> > -	strscpy(csi2->sd.name, DEVICE_NAME, sizeof(csi2->sd.name));
> >  	csi2->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > -	csi2->sd.grp_id = IMX_MEDIA_GRP_ID_CSI2;
> > +
> > +	csi2->sd.owner = config->module;
> > +	strscpy(csi2->sd.name, config->name, sizeof(csi2->sd.name));
> > +	csi2->sd.internal_ops = config->internal_ops;
> > +	csi2->sd.grp_id = config->grp_id;
> >  
> >  	for (i = 0; i < CSI2_NUM_PADS; i++) {
> >  		csi2->pad[i].flags = (i == CSI2_SINK_PAD) ?
> > diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
> > index 4e656f09c81db9dc9f232ed061f70803a5478c85..dfd25e23ea93fd53b064471b6a9557ef9c070fe7 100644
> > --- a/include/media/dw-mipi-csi2.h
> > +++ b/include/media/dw-mipi-csi2.h
> > @@ -10,6 +10,10 @@
> >  #include <media/v4l2-subdev.h>
> >  
> >  struct dw_mipi_csi2_config {
> > +	struct module *module;
> > +	const char *name;
> > +	int grp_id;
> > +	const struct v4l2_subdev_internal_ops *internal_ops;
> >  };
> >  
> >  /*

-- 
Regards,

Laurent Pinchart

