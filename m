Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10192CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nq9DBAp+ZidFs/i9eIn3NMeX29enpW/llv4L5PAztqo=; b=fnrsSEOTOdbJpwSlWCZB1ngOmd
	JIZCowG9Geu7ul6zLMrx8Q5vkYvfqrN5UCwcGnmP6F6etaNNG6FWh5yySPbXd1R9J9B8WhRg6bZxY
	7ri9A9NPYI7rUvFywSo+/HTfrQo/FIJyJDIHxI8vfQ27JZbSOkw16np5mBoSTtneGzb9Cg2h5j2D8
	zvDE2jjxYY2ndgFpaSNuSOBT3RSlw03qfUpTXjc9rC3i0dRzu8AF3HAWal1ZQ8aJmlOn+HTshKom4
	HUN0XqaeY8zhB5sLZ/ul5mjL20xXcu1Qxu9AMZaNCKwgUQA/KB6qIppv9e0/QMPpfqbDj1bQhBB+3
	xlGLTkFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHpc-0000000DS4d-2Yuf;
	Wed, 10 Sep 2025 10:13:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHpZ-0000000DS2o-29uM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 10:13:38 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwHpR-0004AL-Gk; Wed, 10 Sep 2025 12:13:29 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwHpR-000Zh5-0Z;
	Wed, 10 Sep 2025 12:13:29 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwHpR-00GDw4-06;
	Wed, 10 Sep 2025 12:13:29 +0200
Date: Wed, 10 Sep 2025 12:13:28 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] dmaengine: imx-sdma: make use of
 devm_add_action_or_reset to unregiser the dma_device
Message-ID: <20250910101328.7rp5ulsrahpqfdtz@pengutronix.de>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
 <20250903-v6-16-topic-sdma-v1-6-ac7bab629e8b@pengutronix.de>
 <aLhWfPjnZZpKr/w1@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLhWfPjnZZpKr/w1@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_031337_555781_115CCF1E 
X-CRM114-Status: GOOD (  27.94  )
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

On 25-09-03, Frank Li wrote:
> On Wed, Sep 03, 2025 at 03:06:14PM +0200, Marco Felsch wrote:
> > Make use of the devm_add_action_or_reset() to register a custom devm_
> > release hook. This is required since we want to turn of the IRQs before
> 
> turn off?
> 
> > doing the dma_async_device_unregister().
> >
> > This removes the last goto error handling within the probe function and
> 
> Remove the last ..

I rephrased the commit message.

> > further trims the remove() function. Instead of freeing the irq, we can
> > disable it and let the devm-irq do the job to free the irq, since the
> > only purpose was to have the irqs disabled before calling
> > dma_async_device_unregister().
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/dma/imx-sdma.c | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > index 5a571d3f33158813e0c56484600a49b19a6a72e2..f6bb2f88a62781c0431336c365fa30c46f1401ad 100644
> > --- a/drivers/dma/imx-sdma.c
> > +++ b/drivers/dma/imx-sdma.c
> > @@ -2232,6 +2232,14 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
> >  				     ofdma->of_node);
> >  }
> >
> > +static void sdma_dma_device_unregister_action(void *data)
> > +{
> > +	struct sdma_engine *sdma = data;
> > +
> > +	disable_irq(sdma->irq);
> > +	dma_async_device_unregister(&sdma->dma_device);
> > +}
> > +
> >  static int sdma_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -2358,10 +2366,12 @@ static int sdma_probe(struct platform_device *pdev)
> >  		return ret;
> >  	}
> >
> > +	devm_add_action_or_reset(dev, sdma_dma_device_unregister_action, sdma);
> > +
> 
> need check return value.

Sure, thanks.

Regards,
  Marco

> 
> Frank
> 
> >  	ret = of_dma_controller_register(np, sdma_xlate, sdma);
> >  	if (ret) {
> >  		dev_err(dev, "failed to register controller\n");
> > -		goto err_register;
> > +		return ret;
> >  	}
> >
> >  	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
> > @@ -2388,11 +2398,6 @@ static int sdma_probe(struct platform_device *pdev)
> >  	}
> >
> >  	return 0;
> > -
> > -err_register:
> > -	dma_async_device_unregister(&sdma->dma_device);
> > -
> > -	return ret;
> >  }
> >
> >  static void sdma_remove(struct platform_device *pdev)
> > @@ -2400,8 +2405,6 @@ static void sdma_remove(struct platform_device *pdev)
> >  	struct sdma_engine *sdma = platform_get_drvdata(pdev);
> >  	int i;
> >
> > -	devm_free_irq(&pdev->dev, sdma->irq, sdma);
> > -	dma_async_device_unregister(&sdma->dma_device);
> >  	/* Kill the tasklet */
> >  	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
> >  		struct sdma_channel *sdmac = &sdma->channel[i];
> >
> > --
> > 2.47.2
> >
> 

