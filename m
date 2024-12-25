Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D7FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 22:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDBQjCefPfj8fB4jeRScZzmhIA+IeM1jHIl/EbpmxAw=; b=RWpWk7g3vvw6OcWNnTOxUVzouI
	tblA86WB7S4Dh1A1tB5OPbQjn/k5TVzKz8ki4aVUo0MwAeofD2CyK6vKyRVajzQqdhATrWyemPcoB
	g7eIUOf0RFFli7TgK1B9X7cQ8vZSPGk/p83DWWqIOXS8hVYkDDYFgVcg0l0PO+AqR+vzEr+EJ66GF
	YzOxXMlO+TU7ymaZYKHVxZigFVaMb+xsIesgzQMRFqdWvOS/3VAZhJOgKHJpL3Pz05bTh4Q+WEkes
	i1/CPN2KkgT0zgpFU20+D9KXBbjYjGlviI35zsVN8GkXajL/npnp5PdhFvOGY1GdcBA/v8bctxWAv
	LjWTH+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQa6g-0000000EPyB-1H1e;
	Wed, 25 Dec 2024 22:43:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQa5T-0000000EPr8-2lME
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 22:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B97C45C5E2A;
	Wed, 25 Dec 2024 22:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D71FC4CECD;
	Wed, 25 Dec 2024 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735166561;
	bh=5xhMOfN6JmZsY8VJLgaVsuAnaodvP/oPFG7a++D5lRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aznsHQOOjUX4nE5wfD/9Mg0RoVwnvNA+7kvv4EhqgxTlwQzFpF4ysOTgINbOCWvc5
	 1tcsiWbaAGYVuTkRk4cUAinfjujyFQn69fgXlS1ZGUEN4DdXxgTEBA8xKmnae6ACdW
	 aOGoY1q9ZFBawfu5Ot3kItNuIiERQEzy0QyAUCLbELGcI3ReVd55ul5BO6WP4yaOoj
	 DQyKZk+0MKtJaMneuG12dGBax9HnGowBXj04+DoZtDEE5RK7CwREDcuiSVyQckfNWy
	 DwyEMq3Zi+IBeqCfh5rCWq6eT1HxI86SbgaqhnMVLxITMo+pLRdyOGAbMYDzZhq6N1
	 ymV37MbuR1N2g==
Date: Wed, 25 Dec 2024 23:42:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Clark Wang <xiaoning.wang@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v6] i2c: imx: support DMA defer probing
Message-ID: <abyji6y7ytn7dhhdudslug6esglutwjausunl2nstvjxkveris@vz3jbu5iyhsb>
References: <20241223034416.544022-1-carlos.song@nxp.com>
 <gfjir4qyyptxjizkc2k5r2elwn74fndia644evv6acwyuj3fr5@3pl3xt7rqntw>
 <AM0PR0402MB3937905A3108833DD8F52982E8032@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <ltb3ywaz2req4yqdqmtq4ejbzh4esjszbx4x6ab3k5zmqxhdpg@qqjetty6fs3q>
 <AM0PR0402MB3937C3087A22A1DB8FAE91ECE80C2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB3937C3087A22A1DB8FAE91ECE80C2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_144243_798075_57AB254A 
X-CRM114-Status: GOOD (  30.39  )
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

Hi Carlos,

On Wed, Dec 25, 2024 at 10:56:34AM +0000, Carlos Song wrote:
> > > > > @@ -1802,6 +1803,18 @@ static int i2c_imx_probe(struct
> > > > > platform_device
> > > > *pdev)
> > > > >       if (ret == -EPROBE_DEFER)
> > > > >               goto clk_notifier_unregister;
> > > > >
> > > > > +     /* As we can always fall back to PIO, let's ignore the error
> > > > > + setting up
> > > > DMA. */
> > > > > +     ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > > +     if (ret) {
> > > > > +             if (ret == -EPROBE_DEFER)
> > > > > +                     goto clk_notifier_unregister;
> > > > > +             else if (ret == -ENODEV)
> > > > > +                     dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > > > > +             else
> > > > > +                     dev_err(&pdev->dev, "Failed to setup DMA
> > > > > + (%pe),
> > > > only use PIO mode\n",
> > > > > +                             ERR_PTR(ret));
> > > >
> > > > My question here is not just about the use of dev_err vs
> > > > dev_err_probe, but why don't we exit the probe if we get an error.
> > > >
> > > > We should use PIO only in case of ENODEV, in all the other cases I
> > > > think we should just leave. E.g. why don't we exit if we meet ret ==
> > -ENOMEM?
> > >
> > > Hi, Andi
> > >
> > > Thank you! From my point, I2C is critical bus so it should be available as much
> > as possible.
> > > -ENOMEM or other unknown errors all are from i2c_imx_dma_request(). So
> > error happened in enable DMA mode process.
> > 
> > OK, makes sense, it's the idea of "let things fail on their own, I'll move forward as
> > much as I can"; we need to be aware of the choice. Please add a comment
> > above.
> > 
> > But then it's not an error, but a warning. With errors we bail out, with warnings
> > we tell users that something went wrong.
> > 
> > Sorry for keeping you on this point for so long, but do you mind swapping this
> > dev_err in dev_warn, with a comment explaining the reason we decided not to
> > leave?
> > 
> 
> Hi, Andi
> 
> It doesn't matter! I am very happy to receive so many suggestions to help enhance the patch.
> I will do following things at V7:
> 1. Change dev_err to dev_warn
> 2. Use a more detailed comment to explain why we decided not to leave when meet DMA error.

Thank you! I appreciate your responsiveness!

Andi

