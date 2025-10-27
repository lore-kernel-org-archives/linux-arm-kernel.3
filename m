Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A0BCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyjgFgAJoe1NfLjFy2/kXsCs4lpwLLREGuFJxP0iwv4=; b=ryQBNKY/8qmB5475OSQrGhkfOp
	Ewgs4KVvUl5g/IyP/OjyY/ivq/pMGimLp+XGXRZ6FjDcosph7hfkXxmKNTg1+8yxMauop5a4OJOPm
	5HbldmBIWirBBWKUGa+7SVWlO9FxiTd/vAFcoIgi+z97vjrXvnV41QdMkyN0P4lNfbGTyL5CPA3B5
	Trqw9BG+cFFVIQopeRXEsCkxtAPObQ3DRtdKWLEy/uq6SYNqrHXOUqIFBt6R3csm4xNA07hvzac/Q
	4hxwOsZKckQ7FfwhtrHhNKw2naeG3hRH+hQR6xFQR32Ji7N3v1iaxTo1Sg+eOGEoGGbJjb/xeeiWl
	hg1Ym18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBla-0000000CvYp-1JVx;
	Mon, 27 Oct 2025 01:11:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBlX-0000000CvYP-45dN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:11:21 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B938B666;
	Mon, 27 Oct 2025 02:09:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761527370;
	bh=wDAHYZ2XDq9G1bNOJF4J3PL4MjpM9SKkBVwAR7etS9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjG63zty12ng3dohZnH7VMI9WGMBDwHQaQjSBDAlq4Gky9yqB9GNG9u2SonxF/mtV
	 3XQaQ2mRydgaXAjfrjcsya5qOrE3t6u7KcaOmp4NVv9V68HSi+OcPXTfyYvTvuu+Gl
	 sTKzxc5CSXh5A14ko9mvKra4w1Zy3UG1oE3pGrho=
Date: Mon, 27 Oct 2025 03:11:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>, robh@kernel.org,
	Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dmaengine: add device_link support
Message-ID: <20251027011103.GR13023@pendragon.ideasonboard.com>
References: <20250912-v6-16-topic-dma-devlink-v1-0-4debc2fbf901@pengutronix.de>
 <20250912-v6-16-topic-dma-devlink-v1-1-4debc2fbf901@pengutronix.de>
 <aNVufDmHjLRauKYo@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aNVufDmHjLRauKYo@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_181120_178226_46EE535D 
X-CRM114-Status: GOOD (  35.77  )
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

On Thu, Sep 25, 2025 at 12:31:56PM -0400, Frank Li wrote:
> On Fri, Sep 12, 2025 at 12:00:41AM +0200, Marco Felsch wrote:
> > Shift the device dependency handling to the driver core by adding
> > support for devlinks.
> >
> > The link between the consumer device and the dmaengine device is
> > established by the consumer via the dma_request_chan() automatically if
> > the dmaengine driver supports it (create_devlink flag set).
> >
> > By adding the devlink support it is ensured that the supplier can't be
> > removed while the consumer still uses the dmaengine. Furthermore it
> > ensures that the supplier driver is present and actual bound before the
> > consumer is uses the supplier.

How is the latter ensured by this patch ? The link is created in
dma_request_chan() (which is called by the consumer), after successfully
obtaining the channel. I don't see how the link improves that mechanism.

> >
> > Additional PM and runtime-PM dependency handling can be added easily too
> > by setting the required flags (not implemented by this commit).

I've long thought that the DMA engine API should offer calls to "prepare"
and "unprepare" (names subject to bikeshedding) a DMA engine channel, so
that consumers can explicitly indicate when they are getting ready to
use DMA, and when they stop.

> >
> > The new create_devlink flag controlls the devlink creation to not cause
> > any regressions with existing dmaengine drivers. This flag can be
> > removed once all drivers are successfully tested to support devlinks.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> 
> Add previous discussion link:
> https://lore.kernel.org/all/aLhUv+mtr1uZTCth@lizhi-Precision-Tower-5810/
> 
> Another thread
> https://lore.kernel.org/dmaengine/20250801120007.GB4906@pendragon.ideasonboard.com/
> 
> Add Laurent Pinchart, who may instest this topic also.
> 
> Add Rob Herring, who may know why dma engine can't create dev_link default
> like other provider (clk, phy, gpio ...)
> 
> 
> >  drivers/dma/dmaengine.c   | 15 +++++++++++++++
> >  include/linux/dmaengine.h |  3 +++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> > index 758fcd0546d8bde8e8dddc6039848feeb1e24475..e81985ab806ae87ff3aa4739fe6f6328b2587f2e 100644
> > --- a/drivers/dma/dmaengine.c
> > +++ b/drivers/dma/dmaengine.c
> > @@ -858,6 +858,21 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
> >  	/* No functional issue if it fails, users are supposed to test before use */
> >  #endif
> >
> > +	/*
> > +	 * Devlinks between the dmaengine device and the consumer device
> > +	 * are optional till all dmaengine drivers are converted/tested.
> > +	 */
> > +	if (chan->device->create_devlink) {
> > +		struct device_link *dl;
> > +
> > +		dl = device_link_add(dev, chan->device->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
> 
> I suggest link to per channel device, instead dma engine devices.
> chan->dev->device like phy drivers because some dma-engine have per channel
> resources, like power domain and clocks.
> 
> Frank
> 
> > +		if (!dl) {
> > +			dev_err(dev, "failed to create device link to %s\n",
> > +					dev_name(chan->device->dev));
> > +			return ERR_PTR(-EINVAL);
> > +		}
> > +	}
> > +
> >  	chan->name = kasprintf(GFP_KERNEL, "dma:%s", name);
> >  	if (!chan->name)
> >  		return chan;
> > diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> > index bb146c5ac3e4ccd7bc0afbf3b28e5b3d659ad62f..c67737a358df659f2bf050a9ccb8d23b17ceb357 100644
> > --- a/include/linux/dmaengine.h
> > +++ b/include/linux/dmaengine.h
> > @@ -817,6 +817,8 @@ struct dma_filter {
> >   *	DMA tansaction with no software intervention for reinitialization.
> >   *	Zero value means unlimited number of entries.
> >   * @descriptor_reuse: a submitted transfer can be resubmitted after completion
> > + * @create_devlink: create a devlink between a dma_chan_dev supplier and
> > + *	dma-channel consumer device
> >   * @residue_granularity: granularity of the transfer residue reported
> >   *	by tx_status
> >   * @device_alloc_chan_resources: allocate resources and return the
> > @@ -894,6 +896,7 @@ struct dma_device {
> >  	u32 max_burst;
> >  	u32 max_sg_burst;
> >  	bool descriptor_reuse;
> > +	bool create_devlink;
> >  	enum dma_residue_granularity residue_granularity;
> >
> >  	int (*device_alloc_chan_resources)(struct dma_chan *chan);
> >
> > --
> > 2.47.3
> >

-- 
Regards,

Laurent Pinchart

