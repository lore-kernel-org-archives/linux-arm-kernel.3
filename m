Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13C7CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 19:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sj7ga38ro8cZHfPlPXl6upH8aCJCpeUIc4GRnV0wy9M=; b=qOaY6vwpaCPkQK0wFwDiwXSCFp
	kct1FBsHQeQL4TaPVDWK9uT4TvzfZyxN2s7lzs3wN0oweobYisj/i4bYahShM04a+S6mqb2Xof5Fb
	9vtluGlF4jVdlk1eYomizpkCgrLcAXZlKy2LrwVOIbcsOHLVVZcRQO749SmfglSEwRaPBJ7k4YqWJ
	ZWnjuPjZVuH02po9pthFii6akuZzCLwQxZ2UPZ9nmkFdpM3h9bdurUpSTN5Vg1+TIQO67nD1V+AtZ
	QT+bcURHDTCgkn6vKJw9iLcwz0C6zOC3TOtVNP6Vh3JCSaRfk+XpJTpejokC3fySc0RJZBPCQWKr5
	TOJJcmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmu0-00000004y67-1luN;
	Thu, 11 Sep 2025 19:24:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmtx-00000004y5c-2093
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 19:24:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwmtj-0000G2-U2; Thu, 11 Sep 2025 21:23:59 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwmtj-000oOk-0l;
	Thu, 11 Sep 2025 21:23:59 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwmtj-000w1H-0I;
	Thu, 11 Sep 2025 21:23:59 +0200
Date: Thu, 11 Sep 2025 21:23:59 +0200
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
Message-ID: <20250911192359.mpgoeyiafnunnohn@pengutronix.de>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
 <20250903-v6-16-topic-sdma-v1-9-ac7bab629e8b@pengutronix.de>
 <aLhUv+mtr1uZTCth@lizhi-Precision-Tower-5810>
 <20250909120309.5zgez5exbvxn5z3y@pengutronix.de>
 <aMA88W/rDxFesEx+@lizhi-Precision-Tower-5810>
 <20250910193545.gx3qoyjamoxlncqd@pengutronix.de>
 <aMHwbogOA6QTc3Dm@lizhi-Precision-Tower-5810>
 <20250911115056.5iufhnjdhsbiwugw@pengutronix.de>
 <aMLoP1/Wmay2v37G@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMLoP1/Wmay2v37G@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_122413_666879_4CF46C75 
X-CRM114-Status: GOOD (  55.27  )
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

On 25-09-11, Frank Li wrote:
> On Thu, Sep 11, 2025 at 01:50:56PM +0200, Marco Felsch wrote:
> > On 25-09-10, Frank Li wrote:
> > > On Wed, Sep 10, 2025 at 09:35:45PM +0200, Marco Felsch wrote:
> > > > On 25-09-09, Frank Li wrote:
> > > >
> > > > ...
> > > >
> > > > > > > > diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> > > > > > > > index 758fcd0546d8bde8e8dddc6039848feeb1e24475..a50652bc70b8ce9d4edabfaa781b3432ee47d31e 100644
> > > > > > > > --- a/drivers/dma/dmaengine.c
> > > > > > > > +++ b/drivers/dma/dmaengine.c
> > > > > > > > @@ -817,6 +817,7 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
> > > > > > > >  	struct fwnode_handle *fwnode = dev_fwnode(dev);
> > > > > > > >  	struct dma_device *d, *_d;
> > > > > > > >  	struct dma_chan *chan = NULL;
> > > > > > > > +	struct device_link *dl;
> > > > > > > >
> > > > > > > >  	if (is_of_node(fwnode))
> > > > > > > >  		chan = of_dma_request_slave_channel(to_of_node(fwnode), name);
> > > > > > > > @@ -858,6 +859,13 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
> > > > > > > >  	/* No functional issue if it fails, users are supposed to test before use */
> > > > > > > >  #endif
> > > > > > > >
> > > > > > > > +	dl = device_link_add(dev, chan->device->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
> > > > > > >
> > > > > > > chan->device->dev is dmaengine devices. But some dmaengine's each channel
> > > > > > > have device, consumer should link to chan's device, not dmaengine device
> > > > > > > because some dmaengine support per channel clock\power management.
> > > > > >
> > > > > > I get your point. Can you give me some pointers please? To me it seems
> > > > > > like the dma_chan_dev is only used for sysfs purpose according the
> > > > > > dmaengine.h.
> > > > >
> > > > > Not really, there are other dma engineer already reuse it for other purpose.
> > > > > So It needs update kernel doc for dma_chan_dev.
> > > >
> > > > Can you please provide me some pointers? I checked the kernel code base
> > > > for the struct::dma_chan_dev. I didn't found any references within the
> > > > dmaengine drivers. The only usage I found was for the sysfs purpose.
> > >
> > > static void k3_configure_chan_coherency(struct dma_chan *chan, u32 asel)
> > > {
> > > 	struct device *chan_dev = &chan->dev->device;
> > > 	...
> > > }
> > >
> > > >
> > > > > > > chan's device's parent devices is dmaengine devices. it should also work
> > > > > > > for sdma case
> > > > > >
> > > > > > I see, this must be tested of course.
> > > > > > > >         if (chan->device->create_devlink) {
> > > > > > >                 u32 flags = DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER;
> > > > > >
> > > > > > According device_link.rst: using DL_FLAG_STATELESS and
> > > > > > DL_FLAG_AUTOREMOVE_CONSUMER is invalid.
> > > > > >
> > > > > > >                 if (pm_runtime_active(dev))
> > > > > > >                         flags |= DL_FLAG_RPM_ACTIVE;
> > > > > >
> > > > > > This is of course interessting, thanks for the hint.
> > > > > >
> > > > > > > When create device link (apply channel), consume may active.
> > > > > >
> > > > > > I have read it as: "resue the supplier and ensure that the supplier
> > > > > > follows the consumer runtime state".
> > > > > >
> > > > > > >                 dl = device_link_add(chan->slave, &chan->dev->device, flags);
> > > > > >
> > > > > > Huh.. you used the dmaengine device too?
> > > > >
> > > > > /**
> > > > >  * struct dma_chan_dev - relate sysfs device node to backing channel device
> > > > >  * @chan: driver channel device
> > > > >  * @device: sysfs device
> > > > >  * @dev_id: parent dma_device dev_id
> > > > >  * @chan_dma_dev: The channel is using custom/different dma-mapping
> > > > >  * compared to the parent dma_device
> > > > >  */
> > > > > struct dma_chan_dev {
> > > > > 	struct dma_chan *chan;
> > > > > 	struct device device;
> > > > > 	int dev_id;
> > > > > 	bool chan_dma_dev;
> > > > > };
> > > > >
> > > > > struct dma_chan {
> > > > > 	struct dma_device *device; /// this one should be dmaengine
> > > > > 	struct dma_chan_dev *dev; /// this one is pre-chan device.
> > > > > }
> > > >
> > > > I've tested your approach but it turns out that teh dma_chan_dev has no
> > > > driver. Of course we could use the DL_FLAG_STATELESS flag but this is
> > > > described as:
> > > >
> > > > | When driver presence on the supplier is irrelevant and only correct
> > > > | suspend/resume and shutdown ordering is needed, the device link may
> > > > | simply be set up with the ``DL_FLAG_STATELESS`` flag.  In other words,
> > > > | enforcing driver presence on the supplier is optional.
> > > >
> > > > I want to enforce the driver presence, therefore I used the manged flags
> > > > which excludes the DL_FLAG_STATELESS, if I get it right.
> > > >
> > > > Please see the below the debug output:
> > > >
> > > > ** use the dmaengine device as supplier **
> > > >
> > > > device_link_init_status: supplier.dev:30bd0000.dma-controller supplier.drv:imx-sdma supplier.status:0x2 consumer:dev:30840000.spi consumer.drv:spi_imx consumer.status:0x1
> > > > device_link_init_status: supplier.dev:30e10000.dma-controller supplier.drv:imx-sdma supplier.status:0x2 consumer:dev:30c20000.sai consumer.drv:fsl-sai consumer.status:0x1
> > > >
> > > >
> > > > ** use the dma channel device as supplier **
> > > >
> > > > device_link_init_status: supplier.dev:dma0chan0 supplier.drv:no-driver supplier.status:0x0 consumer:dev:30840000.spi consumer.drv:spi_imx consumer.status:0x1
> > > > device_link_init_status: supplier.dev:dma0chan1 supplier.drv:no-driver supplier.status:0x0 consumer:dev:30840000.spi consumer.drv:spi_imx consumer.status:0x1
> > >
> > > It should be similar with phy drivers, which phy_create() create individual
> > > phy devices (like dma channel devices).
> >
> > Unfortunately phy drivers do use the DL_FLAG_STATELESS mechanism. My
> > main goal was to have managed links to overcome the current situation:
> > dmaengine drivers can be removed without removing the consumer drivers
> > first.
> >
> > You have a valid point by making use dma-channel devices ( dma<X>cha<Y>)
> > to manage suspend/resume, as well as runtime-PM for each channel.
> >
> > But I see this rather as an addition to my solution because these links
> > must be stateless and stateless/unmanaged links don't guarantee the
> > correct remove order (my main goal).
> 
> If that, phy should have simiar problems. It should be resolved at higher
> layer to avoid fix this kinds of problem one by one.

I'm not sure because the devlink API is more or less clear about STATELESS
links. So phy should rather consider using managed links if they want to
ensure this.

> > That beeing said, I'm not sure how you want to handle the clock/power
> > enablement per channel-device. This would require additional work on the
> > dma_devclass to add a proper .pm hook else the PM and runtime-PM calls
> > are only forwarded to the parent dmaengine driver. On this level the
> > dmaengine driver has no knowledge which channel is going to be
> > enabled/disabled.
> 
> I have draft runtime pm patch for eDMA.
> 
> >
> > In conclusion, I see my approach as valid to ensure the correct remove
> > order. Your suggestion is valid and can be added later on too since this
> > needs more work to have a proper per-channel runtime-PM.
> 
> We need pave a good road. This part is common dma-engine, which is worth to
> do good solution.

+1

I will send a new v2 which split the devlink patches (common part and
the imx-sdma part) from the rest of this series. This decouples most of
the the imx-sdma cleanup from the devlink discussion and we can continue
there.

Regards,
  Marco

