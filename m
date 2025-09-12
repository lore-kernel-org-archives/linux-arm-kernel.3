Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EC4CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 16:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVGOKR1fh/W7NC1PJLVeO15M5+A5gS3m+PUWm8OF9Kc=; b=QacHHuh/GAM6sRgG0aoGehak0S
	tm5onuTAZkz0y6/kbIXb+I/fwZT5oZQ8mvojrWkhju1Oet1zFZ3i/mbjr4rgZf7ztcJKL0ad0+nfB
	9LbcAypsqjSmuD4aOiDIx8IuFlfwsZ5b5Fe/6JpnXDee+U/mDnc71grX6zWkzdOZICbj0is+kDKd2
	vHMcx+4cnpTruch3GIh9QNbXmuezGVQEccDIRtoikl8elghulOFP2ALhTV6+413l2KXuAa3fO7Fnx
	N58Kvjx4zggCQRr2zpwvvT+7rCkb5ctlJQaJ4Faw3IEtmIMiso3ymplNpQvNfdzw7DE2Qk5op0bfY
	teVyaeRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6y9-0000000AcOC-3beh;
	Fri, 12 Sep 2025 16:49:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6y7-0000000AcMa-2ETm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 16:49:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1ux6xz-0004dA-7V; Fri, 12 Sep 2025 18:49:43 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1ux6xy-000xpe-2y;
	Fri, 12 Sep 2025 18:49:42 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1ux6xy-0033g6-2a;
	Fri, 12 Sep 2025 18:49:42 +0200
Date: Fri, 12 Sep 2025 18:49:42 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/10] dmaengine: imx-sdma: make use of
 devm_add_action_or_reset to unregiser the dma_device
Message-ID: <20250912164942.p7w2p63wvracosra@pengutronix.de>
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
 <20250911-v6-16-topic-sdma-v2-8-d315f56343b5@pengutronix.de>
 <aMQy+Ocs+UWq7WoR@lizhi-Precision-Tower-5810>
 <20250912152508.ccxk2qpcmhxjjsns@pengutronix.de>
 <aMRMWfwcAnkF7wwn@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMRMWfwcAnkF7wwn@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_094951_596282_78956B6C 
X-CRM114-Status: GOOD (  36.19  )
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

On 25-09-12, Frank Li wrote:
> On Fri, Sep 12, 2025 at 05:25:08PM +0200, Marco Felsch wrote:
> > On 25-09-12, Frank Li wrote:
> > > On Thu, Sep 11, 2025 at 11:56:49PM +0200, Marco Felsch wrote:
> > > > Make use of the devm_add_action_or_reset() to register a custom devm_
> > > > release hook. This is required to turn off the IRQs before calling
> > > > dma_async_device_unregister().
> > > >
> > > > Furthermore it removes the last goto error handling within probe() and
> > > > trims the remove().
> > > >
> > > > Make use of disable_irq() and let the devm-irq do the job to free the
> > > > IRQ, because the only purpose of using devm_free_irq() was to disable
> > > > the IRQ before calling dma_async_device_unregister().
> > > >
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  drivers/dma/imx-sdma.c | 23 +++++++++++++++--------
> > > >  1 file changed, 15 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > > > index d39589c20c4b2a26d0239feb86cce8d5a0f5acdd..d6d0d4300f540268a3ab4a6b14af685f7b93275a 100644
> > > > --- a/drivers/dma/imx-sdma.c
> > > > +++ b/drivers/dma/imx-sdma.c
> > > > @@ -2264,6 +2264,14 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
> > > >  				     ofdma->of_node);
> > > >  }
> > > >
> > > > +static void sdma_dma_device_unregister_action(void *data)
> > > > +{
> > > > +	struct sdma_engine *sdma = data;
> > > > +
> > > > +	disable_irq(sdma->irq);
> > >
> > > May not related this cleanup patch, I am just curious why not mask sdma irq
> > > request.
> >
> > You mean by setting irq_set_status_flags(irq, IRQ_DISABLE_UNLAZY)
> > infront? Not sure if this is required since this is just the cleanup
> > path.
> 
> It is not important for this patch.
> 
> >
> > > > +	dma_async_device_unregister(&sdma->dma_device);
> > > > +}
> > > > +
> > > >  static int sdma_probe(struct platform_device *pdev)
> > > >  {
> > > >  	struct device *dev = &pdev->dev;
> > > > @@ -2388,10 +2396,16 @@ static int sdma_probe(struct platform_device *pdev)
> > > >  		return ret;
> > > >  	}
> > > >
> > > > +	ret = devm_add_action_or_reset(dev, sdma_dma_device_unregister_action, sdma);
> > > > +	if (ret) {
> > > > +		dev_err(dev, "Unable to register release hook\n");
> > > > +		return ret;
> > > > +	}
> > >
> > > why not use dev_err_probe() her?
> >
> > Please see my last patch.
> 
> You can direct use dev_err_probe() here, instead replace all in last one.

I get your point and yes I could do this, but I have to do the last
patch anyway. Therefore I'm not sure what difference this makes for this
series.

> 
> Frank
> 
> >
> > Regards,
> >   Marco
> >
> > >
> > > > +
> > > >  	ret = of_dma_controller_register(np, sdma_xlate, sdma);
> > > >  	if (ret) {
> > > >  		dev_err(dev, "failed to register controller\n");
> > > > -		goto err_register;
> > > > +		return ret;
> > >
> > > the same here.
> > >
> > > Frank
> > > >  	}
> > > >
> > > >  	/*
> > > > @@ -2410,11 +2424,6 @@ static int sdma_probe(struct platform_device *pdev)
> > > >  	}
> > > >
> > > >  	return 0;
> > > > -
> > > > -err_register:
> > > > -	dma_async_device_unregister(&sdma->dma_device);
> > > > -
> > > > -	return ret;
> > > >  }
> > > >
> > > >  static void sdma_remove(struct platform_device *pdev)
> > > > @@ -2423,8 +2432,6 @@ static void sdma_remove(struct platform_device *pdev)
> > > >  	int i;
> > > >
> > > >  	of_dma_controller_free(sdma->dev->of_node);
> > > > -	devm_free_irq(&pdev->dev, sdma->irq, sdma);
> > > > -	dma_async_device_unregister(&sdma->dma_device);
> > > >  	/* Kill the tasklet */
> > > >  	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
> > > >  		struct sdma_channel *sdmac = &sdma->channel[i];
> > > >
> > > > --
> > > > 2.47.3
> > > >
> > >
> 

