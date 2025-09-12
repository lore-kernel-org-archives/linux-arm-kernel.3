Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50599CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csAzZ8FZ49gbOpT1qO36yKQ2VKTfxWrpZ1dw22MczSo=; b=fHENxAZ27mF42EMHN7UIrBykSm
	z6Nqanw4jtBK7YLbmbUcclcC4W/xwWFxgAap+D4mcnO540HVLmdNDo/vbmVJrW2OHOApP2vzNXdR9
	+LktLOPn6nlGnyTA10ilG/lV1XssO1RL7yEyreaMILnon6U+4FLDvP+MYRPALkA/pdIVTtGtrWplt
	mfEthq1g1a2VaXdfLKbQfzdnBpM6mO3eentYOqK62ZhnIvDRtcaF8ZwnALkKP+y6HEcaVICfc7aOF
	FylVDqkrIe2ZaaOPSnTK+JdQVk5eEbuRfoB/TbExOR7lPkd9mbggGjPZXjbOEwzlQ+C9rQx6xH7fF
	a81XSizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5hB-0000000AFXx-20yD;
	Fri, 12 Sep 2025 15:28:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5hA-0000000AFWR-0VUj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:28:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1ux5h3-0005sz-Dg; Fri, 12 Sep 2025 17:28:09 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1ux5h3-000xIq-0a;
	Fri, 12 Sep 2025 17:28:09 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1ux5h3-0032oV-0E;
	Fri, 12 Sep 2025 17:28:09 +0200
Date: Fri, 12 Sep 2025 17:28:09 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] dmaengine: imx-sdma: make use of
 devm_add_action_or_reset to unregiser the dma-controller
Message-ID: <20250912152809.nj3yk5wmrb7ojjoo@pengutronix.de>
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
 <20250911-v6-16-topic-sdma-v2-9-d315f56343b5@pengutronix.de>
 <aMQzNDE8QuUZwGkt@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMQzNDE8QuUZwGkt@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_082816_157074_F5624BD5 
X-CRM114-Status: GOOD (  24.67  )
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
> On Thu, Sep 11, 2025 at 11:56:50PM +0200, Marco Felsch wrote:
> > Use the devres capabilities to cleanup the driver remove() callback.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/dma/imx-sdma.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > index d6d0d4300f540268a3ab4a6b14af685f7b93275a..a7e6554ca223e2e980caf2e2dea832db9ad60ed6 100644
> > --- a/drivers/dma/imx-sdma.c
> > +++ b/drivers/dma/imx-sdma.c
> > @@ -2264,6 +2264,13 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
> >  				     ofdma->of_node);
> >  }
> >
> > +static void sdma_dma_of_dma_controller_unregister_action(void *data)
> > +{
> > +	struct sdma_engine *sdma = data;
> > +
> > +	of_dma_controller_free(sdma->dev->of_node);
> > +}
> > +
> >  static void sdma_dma_device_unregister_action(void *data)
> >  {
> >  	struct sdma_engine *sdma = data;
> > @@ -2408,6 +2415,12 @@ static int sdma_probe(struct platform_device *pdev)
> >  		return ret;
> >  	}
> >
> > +	ret = devm_add_action_or_reset(dev, sdma_dma_of_dma_controller_unregister_action, sdma);
> > +	if (ret) {
> > +		dev_err(dev, "failed to register of-dma-controller unregister hook\n");
> > +		return ret;
> > +	}
> > +
> 
> return dev_err_probe()

Please check my last patch.

Regards,
  Marco

> 
> Frank
> >  	/*
> >  	 * Because that device tree does not encode ROM script address,
> >  	 * the RAM script in firmware is mandatory for device tree
> > @@ -2431,7 +2444,6 @@ static void sdma_remove(struct platform_device *pdev)
> >  	struct sdma_engine *sdma = platform_get_drvdata(pdev);
> >  	int i;
> >
> > -	of_dma_controller_free(sdma->dev->of_node);
> >  	/* Kill the tasklet */
> >  	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
> >  		struct sdma_channel *sdmac = &sdma->channel[i];
> >
> > --
> > 2.47.3
> >
> 

