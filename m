Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F73CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JV49SWdPmcGRT6Dg7FHAEJztoUKiRbKKXQCn+lsd+V0=; b=CDmkfRhxVgbMZUo++3/LDwoxvE
	zI44hG4cpCFRp5SWWHqQ5hA/NcxgZKiJdZyOWsQRcf0zib8R1NI3iA/B4I4uM0xr8EC04TIi9VIOx
	T8PFDBlFhQO0pjhxe9kmFgQbjywa5i0Zk7mkTbX/UFGCf8r2uhpLIIHbEeYBHGqG8HcTw2SpdE5OZ
	9g4+SaydI1NOAE6/qjsgHbk/ox0HNR5kjLr/GFDXulqnU/CutfFeFAKblHgMp8LisPjQXfHNv5ukT
	wuUV1yN0qAVQ4yNOcpD2y/LVKaY0jcwNOjorMLv93PxLsU0T0yO4+JicxQsFjt/vqrCJbW2TQpowa
	S5X7oeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xl-00000008qa7-05RC;
	Tue, 09 Sep 2025 17:17:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvx4B-00000006wCM-0mMl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 12:03:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uvx42-0007MX-6N; Tue, 09 Sep 2025 14:03:10 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uvx41-000Pf6-2a;
	Tue, 09 Sep 2025 14:03:09 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uvx41-00E2PJ-25;
	Tue, 09 Sep 2025 14:03:09 +0200
Date: Tue, 9 Sep 2025 14:03:09 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] dmaengine: add support for device_link
Message-ID: <20250909120309.5zgez5exbvxn5z3y@pengutronix.de>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
 <20250903-v6-16-topic-sdma-v1-9-ac7bab629e8b@pengutronix.de>
 <aLhUv+mtr1uZTCth@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLhUv+mtr1uZTCth@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_050319_230507_BE1651E7 
X-CRM114-Status: GOOD (  44.81  )
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

On 25-09-03, Frank Li wrote:
> On Wed, Sep 03, 2025 at 03:06:17PM +0200, Marco Felsch wrote:
> > Add support to create device_links between dmaengine suppliers and the
> > dma consumers. This shifts the device dep-chain teardown/bringup logic
> > to the driver core.
> >
> > Moving this to the core allows the dmaengine drivers to simplify the
> > .remove() hooks and also to ensure that no dmaengine driver is ever
> > removed before the consumer is removed.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> 
> Thank you work for devlink between dmaengine and devices. I have similar
> idea.
> 
> This patch should be first patch.

I can shuffle it of course!

> The below what planned commit message in my local tree.

Okay, so you focused on runtime PM handling. Not quite sure if I can
test this feature with the SDMA engine. I also have limited time for
this feature.

Is it okay for you and the DMA maintainers to add the runtime PM feature
as separate patch (provided by NXP/Frank)?

> Implementing runtime PM for DMA channels is challenging. If a channel
> resumes at allocation and suspends at free, the DMA engine often remains on
> because most drivers request a channel at probe.
> 
> Tracking the number of pending DMA descriptors is also problematic, as some
> consumers append new descriptors in atomic contexts, such as IRQ handlers,
> where runtime resume cannot be called.
> 
> Using a device link simplifies this issue. If a consumer requires data
> transfer, it must be in a runtime-resumed state, ensuring that the DMA
> channel is also active by device link. This allows safe operations, like
> appending new descriptors. Conversely, when the consumer no longer requires
> data transfer, both it and the supplier (DMA channel) can enter a suspended
> state if no other consumer is using it.
> 
> Introduce the `create_link` flag to enable this feature.
>
> also suggest add create_link flag to enable this feature in case some
> side impact to other dma-engine. After some time test, we can enable it
> default.

What regressions do you have in mind? I wouldn't hide the feature behind
a flag because this may slow done the convert process, because no one is
interessted in, or has no time for testing, ...

> >  drivers/dma/dmaengine.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> > index 758fcd0546d8bde8e8dddc6039848feeb1e24475..a50652bc70b8ce9d4edabfaa781b3432ee47d31e 100644
> > --- a/drivers/dma/dmaengine.c
> > +++ b/drivers/dma/dmaengine.c
> > @@ -817,6 +817,7 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
> >  	struct fwnode_handle *fwnode = dev_fwnode(dev);
> >  	struct dma_device *d, *_d;
> >  	struct dma_chan *chan = NULL;
> > +	struct device_link *dl;
> >
> >  	if (is_of_node(fwnode))
> >  		chan = of_dma_request_slave_channel(to_of_node(fwnode), name);
> > @@ -858,6 +859,13 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
> >  	/* No functional issue if it fails, users are supposed to test before use */
> >  #endif
> >
> > +	dl = device_link_add(dev, chan->device->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
> 
> chan->device->dev is dmaengine devices. But some dmaengine's each channel
> have device, consumer should link to chan's device, not dmaengine device
> because some dmaengine support per channel clock\power management.

I get your point. Can you give me some pointers please? To me it seems
like the dma_chan_dev is only used for sysfs purpose according the
dmaengine.h.

> chan's device's parent devices is dmaengine devices. it should also work
> for sdma case

I see, this must be tested of course.

>         if (chan->device->create_devlink) {
>                 u32 flags = DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER;

According device_link.rst: using DL_FLAG_STATELESS and
DL_FLAG_AUTOREMOVE_CONSUMER is invalid.

>                 if (pm_runtime_active(dev))
>                         flags |= DL_FLAG_RPM_ACTIVE;

This is of course interessting, thanks for the hint.

> When create device link (apply channel), consume may active.

I have read it as: "resue the supplier and ensure that the supplier
follows the consumer runtime state".

>                 dl = device_link_add(chan->slave, &chan->dev->device, flags);

Huh.. you used the dmaengine device too?

Regards,
  Marco


>         }
> 
> Need update kernel doc
> 
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index bb146c5ac3e4c..ffb3a8f0070ba 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -323,7 +323,8 @@ struct dma_router {
>   * @cookie: last cookie value returned to client
>   * @completed_cookie: last completed cookie for this channel
>   * @chan_id: channel ID for sysfs
> - * @dev: class device for sysfs
> + * @dev: class device for sysfs, also use for pre channel runtime pm and
> + *       use custom/different dma-mapping
> 
> Frank
> 
> 
> > +	if (!dl) {
> > +		dev_err(dev, "failed to create device link to %s\n",
> > +			dev_name(chan->device->dev));
> > +		return ERR_PTR(-EINVAL);
> > +	}
> >  	chan->name = kasprintf(GFP_KERNEL, "dma:%s", name);
> >  	if (!chan->name)
> >  		return chan;
> >
> > --
> > 2.47.2
> >
> 

