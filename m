Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3599ACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ys2vKnTb6cJREp0qwzs1Izhfo3++EtDqp5GeKI75fvM=; b=MP2Ln7q3+1aLc0EPMiXejbSUR7
	prXZLLhaYo8vOCuwP0kBlxpcznpEej19hOSGdOUQtOlJNHGTi8DZOSsWSl5XtdtxuExqkdTK9gTLl
	C6Dgthu0m+FSvjUAN92Tn4GNWzqQ2I7BNWlKTu8USQL3on/+dYpyO6uL1u9BIAEXfpI7zAzdQKXET
	7x0wzIWPuwHU5U89xkpM3ZaDbVNxqS/cj77twQVaC8GmEmd3+bjUg3nh19rJ/zMB/5UPCYw+ehOo1
	lHQ2VI/EcOjT1ZDQYW5a4LODTwP44vWbQ0NQ/CRxu7CZ1YXsVQ70kj8Td/j/Cxq59zmX6uS1V3DyA
	tX6d+4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvEp-00000002h6r-0yPk;
	Fri, 15 Aug 2025 14:16:59 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsZo-00000002KaX-3qAn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:26:30 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c3KYp6mS5zyQq;
	Fri, 15 Aug 2025 14:26:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755257184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ys2vKnTb6cJREp0qwzs1Izhfo3++EtDqp5GeKI75fvM=;
	b=hzujG3oQAB1dNQRmpyQy0aBbDRC4UkwnOZB6zKVfoll/mkd0vN8ACfPrZyY/Xdyl2qDIoZ
	BcvlXDhUmDCPl3ojuPy5VsgFGbWQIAm2YYKQPoBC9i4AvTd9UdkxVQz9rmYc52m+yKivKY
	5wailclwvDVJVMmHobgEoTW6lZLZkr8=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755257184; a=rsa-sha256; cv=none;
	b=vBlEjvcrooXrywqyWFErSTdFxG7s41RMaDvkZbEt0z5mnjOGGXVl2YEJrfwVvb3yYlVpmm
	5jFDOysiXTB2Ewu2e+yUyraC46q2GQaqcqy2X9EkKS0wuActqCuDEGw5hhi6WfOeUPSaRJ
	3e6sPBxkvP/4vIS3Nzc91FLbIyZHwhI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755257184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ys2vKnTb6cJREp0qwzs1Izhfo3++EtDqp5GeKI75fvM=;
	b=VkEd/6RlyiH18u/l3Vd4PtvMATZ5OFHr0Fp1es9Vu+flhCSW9VqD3drqS2caRjLC22RKTO
	f5qoM4VMvT/2hRG0KuqAInyeRBjUlMkMLD1cubDrYOaH7Q8q/bFoAS9awwR/Bin56jN2o/
	s7qN6R/mLNo75M1mSYbSR7QrHFnBj5A=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3DEBA634C93;
	Fri, 15 Aug 2025 14:25:23 +0300 (EEST)
Date: Fri, 15 Aug 2025 11:25:24 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
 <20250815103205.GJ6201@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815103205.GJ6201@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_042629_139110_1B9E6ABB 
X-CRM114-Status: GOOD (  44.92  )
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

On Fri, Aug 15, 2025 at 01:32:05PM +0300, Laurent Pinchart wrote:
> On Fri, Aug 15, 2025 at 09:18:13AM +0000, Sakari Ailus wrote:
> > On Thu, Aug 14, 2025 at 12:37:01PM +0100, Isaac Scott wrote:
> > > Although 4 lanes may be physically available, we may not be using all of
> > > them. Get the number of configured lanes in the case a driver has
> > > implemented the get_mbus_config op.
> > > 
> > > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > > 
> > > ---
> > > 
> > > Currently, the imx-mipi-csis driver parses the device tree to determine
> > > the number of configured lanes for the CSI receiver. This may be
> > > incorrect in the case that the connected device only uses a subset of
> > > lanes, for example. Allow the drivers for these cameras to create a
> > > mbus_config to configure the number of lanes that are actually being
> > > used.
> > > 
> > > If the driver does not support the get_mbus_config op, this patch will
> > > have no functional change.
> > > 
> > > Compile tested against media-master (v6.17-rc1)
> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > index 2beb5f43c2c0..efe4e2ad0382 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
> > >  	return container_of(sdev, struct mipi_csis_device, sd);
> > >  }
> > >  
> > > +static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
> > > +{
> > > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > +	struct v4l2_mbus_config mbus_config = { 0 };
> > > +	int ret;
> > > +
> > > +	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
> > > +			       0, &mbus_config);
> > > +	if (ret == -ENOIOCTLCMD) {
> > > +		dev_dbg(csis->dev, "No remote mbus configuration available\n");
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (ret) {
> > > +		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > > +		dev_err(csis->dev, "Unsupported media bus type %u\n",
> > > +			mbus_config.type);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
> > > +		dev_err(csis->dev,
> > > +			"Unsupported mbus config: too many data lanes %u\n",
> > > +			mbus_config.bus.mipi_csi2.num_data_lanes);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> 
> There's a bug here, you override the number of lanes retrieved from DT,
> which is the number of connected lanes, with the number of lanes used by
> the source for its particular configuration. You will never be able to
> then use more lanes in a different source configuration.
> 
> > > +	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);
> > 
> > None of the above is really specific to this driver. Could you instead
> > implement a function that parses the information from the fwnode endpoint
> > and uses mbus configuration on top?
> 
> That would need to parse the endpoint every time we start streaming, it
> doesn't sound ideal.

Perhaps not, but does that matter in practice? Parsing the endpoint is,
after all, fairly trivial. The advantage would be simplifying drivers.

Alternatively we could think of caching this information somewhere but I
don't think it's worth it.

> 
> > The function could take struct media_pad pointer as an argument, or struct
> > v4l2_subdev pointer and the pad number.
> > 
> > I wonder if any other parameters could change dynamically but I can't think
> > of that now, so perhaps just the number of lanes is what the function
> > should indeed return.
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > >  {
> > >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > >  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > >  	csis_fmt = find_csis_format(format->code);
> > >  
> > > +	ret = mipi_csis_get_active_lanes(sd);
> > > +	if (ret < 0)
> > > +		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > > +
> > >  	ret = mipi_csis_calculate_params(csis, csis_fmt);
> > >  	if (ret < 0)
> > >  		goto err_unlock;
> 

-- 
Regards,

Sakari Ailus

