Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AF5CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 02:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YV0x4Z1dGmQM5ajA1jDd4c3hKXAfvoyFMDhGZCf50GY=; b=jAu4vNGeoLxjJcfDPhdhmdVslN
	5l7NGDJPHyYqiiChscXYyz6aiKxa7AuAlKjgbnEYUUyxo+8TbmsGOsSvT3h8kTgQRAN3H0upViD0V
	d9Dq5qTJ5cYv8Yys+EF3zzsgI3rG3qMSqKgD5Gn1VnO6IulrOCp9x5iQsyp/IzApEIYnu2VpDJIHh
	Gck9BArk7dqCW2NrfG+3lxsHgYcOEgXANv5yFcqJsSjejm++bcwa/R4aH8Lf7QfmiVpPuTc8YLgjr
	Eu9BEU7l9Kk4EJWULR5/1raBtvcRPAwsBNxYIBM9MpndPNzIrXBEiZGe88ot5rJa+It7Kybigb16A
	6ZxzfD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoCNZ-00000009E8L-229A;
	Tue, 19 Aug 2025 02:47:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoCL0-00000009Dn4-03qi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 02:44:39 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3B903107;
	Tue, 19 Aug 2025 04:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755571418;
	bh=9EysvuKINcRci7su5I+sjv97IMVoSmplvCn4cL1WqrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7xD3NZo6McFUcc66L18EHJXjCnYtWn+rQEpVvxlDUCEmI7UAcWq6LlGKPeBlsAtX
	 AeYAgh30fS6k5dtEN6vUP5Fu2gchOTuyFxzmPyI716zezE34mGZAjRsIJZvOZvAgUN
	 r2+gCmesu9c9l0bXHcEgMkKvs8qBJ3E5EBTwxLW4=
Date: Tue, 19 Aug 2025 05:44:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <20250819024413.GJ5862@pendragon.ideasonboard.com>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
 <20250815103205.GJ6201@pendragon.ideasonboard.com>
 <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
 <20250815113633.GM6201@pendragon.ideasonboard.com>
 <aJ8pKs_6YpAiPjlq@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJ8pKs_6YpAiPjlq@valkosipuli.retiisi.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_194438_199419_6A53E362 
X-CRM114-Status: GOOD (  54.63  )
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

On Fri, Aug 15, 2025 at 12:33:46PM +0000, Sakari Ailus wrote:
> On Fri, Aug 15, 2025 at 02:36:33PM +0300, Laurent Pinchart wrote:
> > On Fri, Aug 15, 2025 at 11:25:24AM +0000, Sakari Ailus wrote:
> > > On Fri, Aug 15, 2025 at 01:32:05PM +0300, Laurent Pinchart wrote:
> > > > On Fri, Aug 15, 2025 at 09:18:13AM +0000, Sakari Ailus wrote:
> > > > > On Thu, Aug 14, 2025 at 12:37:01PM +0100, Isaac Scott wrote:
> > > > > > Although 4 lanes may be physically available, we may not be using all of
> > > > > > them. Get the number of configured lanes in the case a driver has
> > > > > > implemented the get_mbus_config op.
> > > > > > 
> > > > > > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > > > > > 
> > > > > > ---
> > > > > > 
> > > > > > Currently, the imx-mipi-csis driver parses the device tree to determine
> > > > > > the number of configured lanes for the CSI receiver. This may be
> > > > > > incorrect in the case that the connected device only uses a subset of
> > > > > > lanes, for example. Allow the drivers for these cameras to create a
> > > > > > mbus_config to configure the number of lanes that are actually being
> > > > > > used.
> > > > > > 
> > > > > > If the driver does not support the get_mbus_config op, this patch will
> > > > > > have no functional change.
> > > > > > 
> > > > > > Compile tested against media-master (v6.17-rc1)
> > > > > > ---
> > > > > >  drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
> > > > > >  1 file changed, 41 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > > index 2beb5f43c2c0..efe4e2ad0382 100644
> > > > > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > > @@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
> > > > > >  	return container_of(sdev, struct mipi_csis_device, sd);
> > > > > >  }
> > > > > >  
> > > > > > +static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
> > > > > > +{
> > > > > > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > > > +	struct v4l2_mbus_config mbus_config = { 0 };
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
> > > > > > +			       0, &mbus_config);
> > > > > > +	if (ret == -ENOIOCTLCMD) {
> > > > > > +		dev_dbg(csis->dev, "No remote mbus configuration available\n");
> > > > > > +		return 0;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (ret) {
> > > > > > +		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > > > > > +		dev_err(csis->dev, "Unsupported media bus type %u\n",
> > > > > > +			mbus_config.type);
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
> > > > > > +		dev_err(csis->dev,
> > > > > > +			"Unsupported mbus config: too many data lanes %u\n",
> > > > > > +			mbus_config.bus.mipi_csi2.num_data_lanes);
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > > > +
> > > > > > +	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> > > > 
> > > > There's a bug here, you override the number of lanes retrieved from DT,
> > > > which is the number of connected lanes, with the number of lanes used by
> > > > the source for its particular configuration. You will never be able to
> > > > then use more lanes in a different source configuration.
> > > > 
> > > > > > +	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);
> > > > > 
> > > > > None of the above is really specific to this driver. Could you instead
> > > > > implement a function that parses the information from the fwnode endpoint
> > > > > and uses mbus configuration on top?
> > > > 
> > > > That would need to parse the endpoint every time we start streaming, it
> > > > doesn't sound ideal.
> > > 
> > > Perhaps not, but does that matter in practice? Parsing the endpoint is,
> > > after all, fairly trivial. The advantage would be simplifying drivers.
> > 
> > It's trivial from a code point of view, but it's not a cheap operation.
> > I'd like to avoid making starting streaming more expensive.
> 
> How cheap is "not cheap"? I'd be surprised if parsing an endpoint took more
> time than e.g. an I²C register write. Of course it depends on the CPU...

Still, it's not cheap, and I think it can easily be avoided.

> > > Alternatively we could think of caching this information somewhere but I
> > > don't think it's worth it.
> > 
> > Drivers likely need to parse endpoints for other reasons. I'd cache the
> > value in drivers, like done today, and pass it to a get_active_lanes
> > helper.
> 
> Then drivers presumably would also validate this against the endpoint
> configuration, wouldn't they? That's extra code in every CSI-2 receiver
> driver.

Why so ? The number of connected lanes can be passed to the helper
function, which can use it to validate the number of lanes reported by
the source subdev.

> > > > > The function could take struct media_pad pointer as an argument, or struct
> > > > > v4l2_subdev pointer and the pad number.
> > > > > 
> > > > > I wonder if any other parameters could change dynamically but I can't think
> > > > > of that now, so perhaps just the number of lanes is what the function
> > > > > should indeed return.
> > > > > 
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > > >  {
> > > > > >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > > >  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > > > > >  	csis_fmt = find_csis_format(format->code);
> > > > > >  
> > > > > > +	ret = mipi_csis_get_active_lanes(sd);
> > > > > > +	if (ret < 0)
> > > > > > +		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > > > > > +
> > > > > >  	ret = mipi_csis_calculate_params(csis, csis_fmt);
> > > > > >  	if (ret < 0)
> > > > > >  		goto err_unlock;

-- 
Regards,

Laurent Pinchart

