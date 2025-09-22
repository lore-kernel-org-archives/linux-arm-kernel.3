Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA16CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOeym7Uvyy0rLSy0wUaIKg0CEMP3SwfpbRFMVmiTksY=; b=eNpJJYzXfEQVFm9QuetdTjhgTg
	RCM6HjD7SuoBabdlSGHfQMY74rvZK7S8of/MOLbwRh0QIp5/9mFU8WBzFuJOR1ZuLF15r5wVIkaz4
	g1rooXsP2SlK5CVovJaxq+NjFZSTRm5NPwcSxMzTbpNi5TdCqKqaUyj+WyFFKPGWxYgCqJr0P9SMK
	4qq65hM2+zX8Q5IKxVimkFDyzKilTyE4TrDB/S5a/h69DcBaOxd+AaeaaMGjExOS9Jkjt7MTR9DOa
	vGKKYIXrXN5te1xJ86cajC+VzuFboLQWwncV8CsOicEyrRIZVgUZXs+i1GjHJiiz0mZ7AGZ8gs9OK
	wUHPsZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0anR-00000009CA6-29Jd;
	Mon, 22 Sep 2025 07:17:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0anP-00000009C6z-0yCa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:17:12 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7A5A36DC;
	Mon, 22 Sep 2025 09:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758525346;
	bh=eulG1dlDhbrFnqQ/5xFfJsT6m8P5BkUgfXxI6mGrGeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufpHgwcg0ZMn+gEkWQoQ0MiIM9bDGIl/lywer96IBtniuPFz5oOsjbEFh+tg6pgyz
	 JSm9kKuOFPF37Ke5swwPo7gwH4NSjImdP9yrAwL6VemJQ9ugGX+OxKzkIfJMo4gYy+
	 bpSj8V7c/yqUW9qKjjT0arg7TobiT+h2ybCFWkok=
Date: Mon, 22 Sep 2025 10:16:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/3] media: v4l: Add helper to get number of active
 lanes via a pad
Message-ID: <20250922071637.GH10540@pendragon.ideasonboard.com>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
 <20250915-mbus-config-active-lanes-v3-1-97a1282a410b@ideasonboard.com>
 <aNDxR72CmvGofTHy@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aNDxR72CmvGofTHy@valkosipuli.retiisi.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_001711_410313_25D0396F 
X-CRM114-Status: GOOD (  35.87  )
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

On Mon, Sep 22, 2025 at 09:48:39AM +0300, Sakari Ailus wrote:
> On Mon, Sep 15, 2025 at 02:18:33PM +0100, Isaac Scott wrote:
> > Sometimes, users will not use all of the MIPI CSI 2 lanes available when
> > connecting to the MIPI CSI receiver of their device. Add a helper
> > function that checks the mbus_config for the device driver to allow
> > users to define the number of active data lanes through the
> > get_mbus_config op.
> > 
> > If the driver does not implement this op, fall back to using the number
> > of data lanes specified in device tree.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 32 ++++++++++++++++++++++++++++++++
> >  include/media/v4l2-common.h           | 21 +++++++++++++++++++++
> >  2 files changed, 53 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 6e585bc76367..2ce8407f1397 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -571,6 +571,38 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> >  	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> >  }
> >  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > +
> > +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
> > +					unsigned int max_data_lanes)
> > +{
> > +	struct v4l2_mbus_config mbus_config = {};
> > +	struct v4l2_subdev *sd;
> > +	unsigned int lanes;
> > +	int ret;
> > +
> > +	sd = media_entity_to_v4l2_subdev(pad->entity);
> > +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > +			       &mbus_config);
> > +	if (ret < 0 && ret != -ENOIOCTLCMD)
> > +		return ret;
> > +
> > +	/*
> > +	 * This relies on the mbus_config being zeroed at init time.
> > +	 */

This holds on a single line.

> > +	if (!mbus_config.bus.mipi_csi2.num_data_lanes)
> 
> I'd either use the local variable for this (lanes) either all the time, or
> not at all.
> 
> > +		return max_data_lanes;
> > +
> > +	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> > +
> > +	if (lanes > max_data_lanes) {
> > +		dev_dbg(sd->dev, "Active data lanes (%u) exceeds max (%u)\n",
> > +			lanes, max_data_lanes);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return lanes;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
> >  #endif /* CONFIG_MEDIA_CONTROLLER */
> >  
> >  /*
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 0a43f56578bc..6af0695460ab 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -584,6 +584,27 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >  	(pad, mul, div)
> >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> >  			     unsigned int div);
> 
> Is your tree up to date?

We seem to be moving faster than we used to :-)

> > +
> > +/**
> > + * v4l2_get_active_data_lanes - Get number of active data lanes from driver
> > + *
> > + * @pad: The transmitter's media pad.
> > + * @max_data_lanes: The maximum number of active data lanes supported by
> > + * 		    the MIPI CSI link in hardware. This can be configured
> > + * 		    in device tree.
> 
> I'd remove the latter sentence. Alternatively, it needs to be improved:
> there are other sources for this information than DT.
> 
> > + *
> > + * This function is intended for obtaining the number of data lanes that are
> > + * actively being used by the driver for a MIPI CSI-2 device on a given media pad.
> > + * This information is derived from a mbus_config fetched from a device driver
> > + * using the get_mbus_config v4l2_subdev pad op.
> > + *
> > + * Return:
> > + * * >0: Number of active data lanes
> > + * * %-EINVAL: Number of active data lanes is invalid, as it exceeds the maximum
> > + *	       supported data lanes listed in device tree.

Drop "listed in the device tree" here too.

With those small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > + */
> > +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
> > +					unsigned int max_data_lanes);
> >  #else
> >  #define v4l2_get_link_freq(handler, mul, div)		\
> >  	__v4l2_get_link_freq_ctrl(handler, mul, div)

-- 
Regards,

Laurent Pinchart

