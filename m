Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B84EE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DWvz4FIsTedk19znRvZZJelt03dcWvbuzrMQRhoxDE=; b=hKZgl7YCnKoceA9BHZFm2H1wtu
	dZjnabm+HxsaYHueb5O2iZFtpEIkNux67VFw/Crqh238ZEcf82lfqBQwJsZxayM+GZruGwVNOmpmK
	Q3vdcwElg3VCfQOASWosxiMHI2u0nOHMviW+mxsUT1S/ZcUR4ndL3pBpuesHOGeiSh+vr4WOw8OYz
	UntY9dh7gyVfx814g6lVajobbmdLtXX2Bv/ID4ZQDHuEwPyn4qDAhOw9EubAcStk7p93yGHN7u7Dn
	lE3FgkHd/9Gudw6+LMISo+xlppYjkc6P5myay4LScMaML+Zho8z9HQ9oRJRtODw3doMTWxuM+B+Ym
	9CGZJnaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoW9-0000000CWc1-1RS2;
	Wed, 04 Dec 2024 12:30:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoTh-0000000CVwu-0nxW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 12:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF644A414DA;
	Wed,  4 Dec 2024 12:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41900C4CED1;
	Wed,  4 Dec 2024 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733315255;
	bh=Tf2N6u4X8T3vx9X8/GSCe+wHISQSsJpRIqZ4jdWOQhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDOl4K0/L3XsCDjL2mHnFZZjDG0k3XFNtrRIAMxEGvSfdqy8jckhtbl1MtBS/aqth
	 ZM1imGjRPctJZuFJmVJVsM+CclByUFIxt8BwlUXyWWT+jCW0QWy3cMpxOszYsvVfra
	 IE8X0egYx5puCN0hCXnHTV+PZcfigGbItA2UjOV4GbU34uv3M44W0Zv7+XrUDRM668
	 RwztyBG54VEeXir6p93oOZCNI6x4nhcCs1AwjKIWFYHxSIhelpBYifmorF47xI1H65
	 FC3hcIz09kR3LEB61ZbTBAGTzNWm4k7Ihz5fJq7Sep2k2aYjUUuChGyLEi2CqeSDt1
	 paANWv7fZpMzw==
Date: Wed, 4 Dec 2024 17:57:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V5 2/9] dmaengine: bcm2835-dma: add suspend/resume pm
 support
Message-ID: <Z1BKtHPN+2qiveHJ@vaman>
References: <20241025103621.4780-1-wahrenst@gmx.net>
 <20241025103621.4780-3-wahrenst@gmx.net>
 <Z03l308ur7xuE1SB@vaman>
 <d418a30d-f0b0-49c5-8f2a-ddda9a7eeb07@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d418a30d-f0b0-49c5-8f2a-ddda9a7eeb07@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_042737_351538_FBB8FE15 
X-CRM114-Status: GOOD (  25.25  )
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

On 02-12-24, 19:51, Stefan Wahren wrote:
> Hi Vinod,
> 
> Am 02.12.24 um 17:52 schrieb Vinod Koul:
> > On 25-10-24, 12:36, Stefan Wahren wrote:
> > > bcm2835-dma provides the service to others, so it should
> > > suspend late and resume early.
> > > 
> > > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > > ---
> > >   drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
> > >   1 file changed, 30 insertions(+)
> > > 
> > > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > > index e1b92b4d7b05..647dda9f3376 100644
> > > --- a/drivers/dma/bcm2835-dma.c
> > > +++ b/drivers/dma/bcm2835-dma.c
> > > @@ -875,6 +875,35 @@ static struct dma_chan *bcm2835_dma_xlate(struct of_phandle_args *spec,
> > >   	return chan;
> > >   }
> > > 
> > > +static int bcm2835_dma_suspend_late(struct device *dev)
> > > +{
> > > +	struct bcm2835_dmadev *od = dev_get_drvdata(dev);
> > > +	struct bcm2835_chan *c, *next;
> > > +
> > > +	list_for_each_entry_safe(c, next, &od->ddev.channels,
> > > +				 vc.chan.device_node) {
> > > +		void __iomem *chan_base = c->chan_base;
> > > +
> > > +		if (readl(chan_base + BCM2835_DMA_ADDR)) {
> > > +			dev_warn(dev, "Suspend is prevented by chan %d\n",
> > > +				 c->ch);
> > > +			return -EBUSY;
> > > +		}
> > Can you help understand how this helps by logging... we are not adding
> > anything except checking this and resume is NOP as well!
> My intention of this patch is just to make sure, that no DMA transfer is
> in progress during late_suspend. So i followed the implementation of
> fsldma.c
> 
> Additionally i added this warning mostly to know if this ever occurs.
> But i wasn't able to trigger.

Okay in the case I dont think it is a abd idea. But the patch
description should mention that add a warning while suspending if
channels are active or something like that.
Patch title and description should mention this..

> 
> Should i drop the warning and make resume callback = NULL?

Yes that would be better as well, no point in having dummy code

-- 
~Vinod

