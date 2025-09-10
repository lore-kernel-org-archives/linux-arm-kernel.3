Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C3ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Fd5gtwxSLBDdL7Y0NIu2dwjeM3XbnWRrEUe+gsJ6JE=; b=yUJBj11lS6tRxZ2S6DJSAP5I2N
	9gzhiIFBkzQ/b7Jv+eQdmqOFFHHkmBdQH7ZXqBBpNtbbOWkZd0cncfgV/USJ8jCqbM+KZZaqT38CT
	gCeOR4X3UWSru5sXCSJK1ljnoJi/XUnlaaeA8g0myXNyq96VwjA+VXt4numwnEzUBm0Za/QqfXYCg
	JJ9IWWSvos/XJkLF13BQx9hyGJS4oYX+P3eVmvjBXLRXLoZeqvfeH7RATVgAfaWTrYewNevWJhtkZ
	VlSaDgmXSjnSUHkketxe02F2pAZSoKl4RxqCnXFw/Pj1SwwB9cG3J/1g/r9hUGHlW93niyBqRoCJa
	FjFTClOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHOF-0000000DJRm-0P60;
	Wed, 10 Sep 2025 09:45:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHOC-0000000DJPg-23tI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:45:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwHO6-0000Ts-30; Wed, 10 Sep 2025 11:45:14 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwHO5-000ZMU-2h;
	Wed, 10 Sep 2025 11:45:13 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwHO5-00GDN2-2E;
	Wed, 10 Sep 2025 11:45:13 +0200
Date: Wed, 10 Sep 2025 11:45:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] dmaengine: imx-sdma: fix missing
 of_dma_controller_free()
Message-ID: <20250910094513.eawc5n6zbddtg5c5@pengutronix.de>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
 <20250903-v6-16-topic-sdma-v1-8-ac7bab629e8b@pengutronix.de>
 <aLhZ2zfh5bnNoH8X@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLhZ2zfh5bnNoH8X@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_024520_531016_1D52C78D 
X-CRM114-Status: GOOD (  22.66  )
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
> On Wed, Sep 03, 2025 at 03:06:16PM +0200, Marco Felsch wrote:
> > Add the missing of_dma_controller_free() to free the resources allocated
> > via of_dma_controller_register(). The missing free was introduced long
> > time ago  by commit 23e118113782 ("dma: imx-sdma: use
> > module_platform_driver for SDMA driver") while adding a proper .remove()
> > implementation.
> >
> > Fixes: 23e118113782 ("dma: imx-sdma: use module_platform_driver for SDMA driver")
> 
> Look it is hard to back port to old kernel.  Can move it to before cleanup?

I know that fixing commits should come first but this commit dates back
to v3.18-rc1, therefore I thought that backporting this commit would
cause more troubles than it's worth it.

Anyway, after checking the current LTS and stable kernels I think that
the commit could be backported without troubles because the APIs used
do exist on all these kernels.

Regards,
  Marco

> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/dma/imx-sdma.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > index e30dd46cf6522ee2aa4d3aca9868a01afbd29615..6c6d38b202dd2deffc36b1bd27bc7c60de3d7403 100644
> > --- a/drivers/dma/imx-sdma.c
> > +++ b/drivers/dma/imx-sdma.c
> > @@ -2232,6 +2232,13 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
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
> > @@ -2370,6 +2377,8 @@ static int sdma_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "failed to register controller\n");
> >
> > +	devm_add_action_or_reset(dev, sdma_dma_of_dma_controller_unregister_action, sdma);
> > +
> >  	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
> >  	ret = of_address_to_resource(spba_bus, 0, &spba_res);
> >  	if (!ret) {
> >
> > --
> > 2.47.2
> >
> 

