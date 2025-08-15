Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC69CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vR25AXim65wojBdyTxXRBGJ8QWNepkiT/ISuwWOV+Lc=; b=KSS3Oge5bQWylXg+I3vmZD4DaB
	ZGuGDUCS2Lm5v8a17AiZ4SXASrW2xGMjKmsCmD+nq5Ez/Ze/lrPLin76W0RoJkBTpkF6cQiZsG5/C
	ZxzIq+RmFjF+PLdjITfl5qlKA9dGlfj3KpqoDNJW1RvcEcH9VCT224ifsVdw7Url6B8N73VbI7MEo
	7+ODu4nb8/1PTV7rsdgbCBhZPTZHoYJZ6qlYLaxyvxMXXLKMx/4LQVaEB2Oxp1Dzgx9VBUjG8k9Kq
	XBnLeAGsQVcLwAmxCMvu9MLVF3i5JzvzB8opT43sB4b24Shaz6dbSJ+8NP1bf73W3LzcTVGW5Ueoo
	ukT63EnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwM7-00000002qHq-2NbA;
	Fri, 15 Aug 2025 15:28:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsjx-00000002Lmi-08Mu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:36:58 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 26128605;
	Fri, 15 Aug 2025 13:35:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755257758;
	bh=2GIMgu8NPtt6P2qI5ejUuahA1+6uQNRov1RsqwBWiqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4e3KVOK2J0XXmCqgj9JJfIrcgYxrrI+rTidxCHGaWXadY1ai6uVWvVchaozmrBsU
	 WmCsl4otPF8doCkfsyoLO18ZUHqBQUM1ngLtQE8HYes4PNC0qzwKnBsDjCx2iCGfHP
	 b3fPKZ0X6xpvtJyKPqtNsM4xe44EmFHXQNmXLbY8=
Date: Fri, 15 Aug 2025 14:36:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <20250815113633.GM6201@pendragon.ideasonboard.com>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
 <20250815103205.GJ6201@pendragon.ideasonboard.com>
 <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_043657_211926_C24435DA 
X-CRM114-Status: GOOD (  48.08  )
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

On Fri, Aug 15, 2025 at 11:25:24AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Fri, Aug 15, 2025 at 01:32:05PM +0300, Laurent Pinchart wrote:
> > On Fri, Aug 15, 2025 at 09:18:13AM +0000, Sakari Ailus wrote:
> > > On Thu, Aug 14, 2025 at 12:37:01PM +0100, Isaac Scott wrote:
> > > > Although 4 lanes may be physically available, we may not be using all of
> > > > them. Get the number of configured lanes in the case a driver has
> > > > implemented the get_mbus_config op.
> > > > 
> > > > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > > > 
> > > > ---
> > > > 
> > > > Currently, the imx-mipi-csis driver parses the device tree to determine
> > > > the number of configured lanes for the CSI receiver. This may be
> > > > incorrect in the case that the connected device only uses a subset of
> > > > lanes, for example. Allow the drivers for these cameras to create a
> > > > mbus_config to configure the number of lanes that are actually being
> > > > used.
> > > > 
> > > > If the driver does not support the get_mbus_config op, this patch will
> > > > have no functional change.
> > > > 
> > > > Compile tested against media-master (v6.17-rc1)
> > > > ---
> > > >  drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
> > > >  1 file changed, 41 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > index 2beb5f43c2c0..efe4e2ad0382 100644
> > > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > @@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
> > > >  	return container_of(sdev, struct mipi_csis_device, sd);
> > > >  }
> > > >  
> > > > +static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
> > > > +{
> > > > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > +	struct v4l2_mbus_config mbus_config = { 0 };
> > > > +	int ret;
> > > > +
> > > > +	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
> > > > +			       0, &mbus_config);
> > > > +	if (ret == -ENOIOCTLCMD) {
> > > > +		dev_dbg(csis->dev, "No remote mbus configuration available\n");
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	if (ret) {
> > > > +		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > > > +		dev_err(csis->dev, "Unsupported media bus type %u\n",
> > > > +			mbus_config.type);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
> > > > +		dev_err(csis->dev,
> > > > +			"Unsupported mbus config: too many data lanes %u\n",
> > > > +			mbus_config.bus.mipi_csi2.num_data_lanes);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> > 
> > There's a bug here, you override the number of lanes retrieved from DT,
> > which is the number of connected lanes, with the number of lanes used by
> > the source for its particular configuration. You will never be able to
> > then use more lanes in a different source configuration.
> > 
> > > > +	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);
> > > 
> > > None of the above is really specific to this driver. Could you instead
> > > implement a function that parses the information from the fwnode endpoint
> > > and uses mbus configuration on top?
> > 
> > That would need to parse the endpoint every time we start streaming, it
> > doesn't sound ideal.
> 
> Perhaps not, but does that matter in practice? Parsing the endpoint is,
> after all, fairly trivial. The advantage would be simplifying drivers.

It's trivial from a code point of view, but it's not a cheap operation.
I'd like to avoid making starting streaming more expensive.

> Alternatively we could think of caching this information somewhere but I
> don't think it's worth it.

Drivers likely need to parse endpoints for other reasons. I'd cache the
value in drivers, like done today, and pass it to a get_active_lanes
helper.

> > > The function could take struct media_pad pointer as an argument, or struct
> > > v4l2_subdev pointer and the pad number.
> > > 
> > > I wonder if any other parameters could change dynamically but I can't think
> > > of that now, so perhaps just the number of lanes is what the function
> > > should indeed return.
> > > 
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > >  {
> > > >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > >  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > > >  	csis_fmt = find_csis_format(format->code);
> > > >  
> > > > +	ret = mipi_csis_get_active_lanes(sd);
> > > > +	if (ret < 0)
> > > > +		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > > > +
> > > >  	ret = mipi_csis_calculate_params(csis, csis_fmt);
> > > >  	if (ret < 0)
> > > >  		goto err_unlock;

-- 
Regards,

Laurent Pinchart

