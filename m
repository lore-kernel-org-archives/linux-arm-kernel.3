Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7FEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 05:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nptIyIqQBiqj+PKxXH2Y10wA068ME5keXAMn/xz+RI=; b=o6pxQOOesueibZMW8ke2dyDsq4
	DUMHBL1O8FeNptnko9fCJKvUJ5hmpHty8u1w9k+ZMdOOZsGjUIwXXN6Y/uFIaZkmhUzutQzp1WlIX
	wFjsds0J95JHTmRwsPHOAuRE3KwNeJnOqZeU+79d1a5EuJQyLxwEfCTXpY4pwPgXseRLQ9O2mSshN
	VhTZBMv+vbpdWSDdDlY72qW5Lkv6npHat7RaIr6/Enw2fVfkDeuWhwy4og4F3BNiuNE1jZ4bykPra
	wiRLblzFyuo9t/qy3j3KMc1OJPxlLTKoHksDrPBjhkUD/AWPOrk0x8krq2iLLcSZxjCsvuWUuER3V
	q4TVe+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVeK-00000003ypr-2Xcd;
	Fri, 20 Dec 2024 05:34:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVd8-00000003yh3-2DfS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 05:32:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tOVcz-0004FO-Sr; Fri, 20 Dec 2024 06:32:45 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOVcy-004K8x-2S;
	Fri, 20 Dec 2024 06:32:45 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOVcz-00AMOy-1O;
	Fri, 20 Dec 2024 06:32:45 +0100
Date: Fri, 20 Dec 2024 06:32:45 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Message-ID: <Z2UBfcq6pE-JMUrb@pengutronix.de>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_213254_581408_B36B0B69 
X-CRM114-Status: GOOD (  36.02  )
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

On Fri, Dec 20, 2024 at 02:45:09AM +0000, Carlos Song wrote:
> 
> 
> > -----Original Message-----
> > From: Oleksij Rempel <o.rempel@pengutronix.de>
> > Sent: Thursday, December 19, 2024 8:23 PM
> > To: Andi Shyti <andi.shyti@kernel.org>
> > Cc: Carlos Song <carlos.song@nxp.com>; Frank Li <frank.li@nxp.com>;
> > kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Clark Wang
> > <xiaoning.wang@nxp.com>; Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
> >
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report this
> > email' button
> >
> >
> > On Thu, Dec 19, 2024 at 01:02:29PM +0100, Andi Shyti wrote:
> > > Hi Carlos,
> > >
> > > > +   /*
> > > > +    * Init DMA config if supported, -ENODEV means DMA not enabled at
> > > > +    * this platform, that is not a real error, so just remind "only
> > > > +    * PIO mode is used". If DMA is enabled, but meet error when request
> > > > +    * DMA channel, error should be showed in probe error log. PIO mode
> > > > +    * should be available regardless of DMA.
> > > > +    */
> > > > +   ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > +   if (ret) {
> > > > +           if (ret == -EPROBE_DEFER)
> > > > +                   goto clk_notifier_unregister;
> > > > +           else if (ret == -ENODEV)
> > > > +                   dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > > > +           else
> > > > +                   dev_err_probe(&pdev->dev, ret, "Failed to setup
> > > > + DMA, only use PIO mode\n");
> > >
> > > Just for understanding, should we quit in this last case, as well?
> > >
> > > Before we were ignoring ENODEV and EPROBE_DEFER, but now you are
> > > making it clear that other failures like ENOMEM might happen.
> >
> > Good point, dev_err_probe() would not print an error in case of EPROBE_DEFER,
> > but in this case we should only print error and continue with PIO.
> >
> Hi,
> 
> Thank you all very much! As I comment at previous mail:
> DMA mode should be optional for i2c-imx, because i2c-imx can accept DMA mode not enabled, because it still can work in CPU mode.[1]
> [1]https://lore.kernel.org/imx/AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com/
> 
> Also we don't want to annoy current user without DMA[2]
> [2] https://lore.kernel.org/imx/20241127-analytic-azure-hamster-727fd8-mkl@pengutronix.de/
> 
> So we make this logic. Anyway we let the I2C controller registered whether DMA is available or not(except defer probe).
> Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing happened if DMA is defer probed or not enabled(This is an expected).
> However we still need i2c DMA status is known when meet an unexpected error, so we use dev_err_probe() to print error.

Why dev_err_probe() instead of dev_err()?

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

