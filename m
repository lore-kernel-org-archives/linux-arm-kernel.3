Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164BDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 07:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dqKu5I7uOPMHUZKqPpJsCMi42qK9nPhevyNH9rW6dA=; b=mhVeB+J1WvBH/MhvjF1VNIgSI+
	F8wmB68TXReUgpMHNh+7vDeoX3KcPgSMAIDzP39rmTvWSzgBDZP51TEVf+/Y+bWmhRAB5W6G3KuXz
	rkFnrF3eAPIA3obT8skMvQVqfmovHQ/WXhbFYMb7fCUHYp9kFkzV0TFE8FyAHTsZp/GnZrvJ79wN9
	cjcPg0B9q3fw1bIJV4vH7Humm80JTe93jOGNUPwsD2derMos1TOqHeSQuzAD4NJy0ALJ21imd1LBv
	KRs2p7pcIDxjFdT73reA52mqOibzjIl1gtZbdL0IBiYadvl86HR8CFy5tPVh8Vn33dio0FyaILHFE
	fOPGBATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXk1-00000004Ce6-1V10;
	Fri, 20 Dec 2024 07:48:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXi2-00000004CRY-1kFH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 07:46:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tOXhw-0004Qw-1Z; Fri, 20 Dec 2024 08:46:00 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOXhu-004L5Y-2b;
	Fri, 20 Dec 2024 08:45:59 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOXhv-00ANip-1X;
	Fri, 20 Dec 2024 08:45:59 +0100
Date: Fri, 20 Dec 2024 08:45:59 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Message-ID: <Z2Ugt8NVued0_4c4@pengutronix.de>
References: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
 <Z2UeKZcpeRUt2OQ4@pengutronix.de>
 <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_234606_610157_055F40C4 
X-CRM114-Status: GOOD (  48.71  )
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

On Fri, Dec 20, 2024 at 07:38:47AM +0000, Carlos Song wrote:
> 
> 
> > -----Original Message-----
> > From: Oleksij Rempel <o.rempel@pengutronix.de>
> > Sent: Friday, December 20, 2024 3:35 PM
> > To: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Cc: Carlos Song <carlos.song@nxp.com>; Andi Shyti <andi.shyti@kernel.org>;
> > Frank Li <frank.li@nxp.com>; kernel@pengutronix.de; shawnguo@kernel.org;
> > s.hauer@pengutronix.de; festevam@gmail.com; linux-i2c@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; Clark Wang <xiaoning.wang@nxp.com>
> > Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
> >
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report this
> > email' button
> >
> >
> > On Fri, Dec 20, 2024 at 08:06:25AM +0100, Ahmad Fatoum wrote:
> > > Hello Carlos,
> > >
> > > On 20.12.24 07:58, Carlos Song wrote:
> > > >
> > > >
> > > >> -----Original Message-----
> > > >> From: Oleksij Rempel <o.rempel@pengutronix.de>
> > > >> Sent: Friday, December 20, 2024 2:13 PM
> > > >> To: Carlos Song <carlos.song@nxp.com>
> > > >> Cc: Andi Shyti <andi.shyti@kernel.org>; Frank Li
> > > >> <frank.li@nxp.com>; kernel@pengutronix.de; shawnguo@kernel.org;
> > > >> s.hauer@pengutronix.de; festevam@gmail.com;
> > > >> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > > >> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > > >> Clark Wang <xiaoning.wang@nxp.com>; Ahmad Fatoum
> > > >> <a.fatoum@pengutronix.de>
> > > >> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
> > > >>
> > > >> Caution: This is an external email. Please take care when clicking
> > > >> links or opening attachments. When in doubt, report the message
> > > >> using the 'Report this email' button
> > > >>
> > > >>
> > > >> On Fri, Dec 20, 2024 at 05:59:38AM +0000, Carlos Song wrote:
> > > >>>>> So we make this logic. Anyway we let the I2C controller
> > > >>>>> registered whether
> > > >>>> DMA is available or not(except defer probe).
> > > >>>>> Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing
> > > >>>>> happened if
> > > >>>> DMA is defer probed or not enabled(This is an expected).
> > > >>>>> However we still need i2c DMA status is known when meet an
> > > >>>>> unexpected
> > > >>>> error, so we use dev_err_probe() to print error.
> > > >>>>
> > > >>>> Why dev_err_probe() instead of dev_err()?
> > > >>>>
> > > >>> Hi,
> > > >>> In patch V2 discussion, Marc suggested just return
> > > >>> dev_err_probe(), but I don't accept it so I choose to use
> > > >>> dev_err_probe() to print error in V3.[1]
> > > >> In this case, the two APIs have the same function, do you mean
> > > >> dev_err() is more suitable?
> > > >>
> > > >> Yes, dev_err_probe() should be used in combination with return. For
> > > >> example:
> > > >>   return dev_err_probe(...);
> > > >>
> > > >> It will pass the return value on exit of the function and
> > > >> optionally print of the error message if it is not EPROBE_DEFER.
> > > >> Practically it replace commonly used coding pattern:
> > > >>   if (ret == -EPROBE_DEFER) {
> > > >>     return ret;
> > > >>   } else if (ret) {
> > > >>     dev_err(..);
> > > >>     return ret;
> > > >>   }
> > > >>
> > > > Hi,
> > > >
> > > > Get your good point. I will change my code in V6:
> > > > +       ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > +       if (ret) {
> > > > +               if (ret == -EPROBE_DEFER)
> > > > +                       goto clk_notifier_unregister;
> > > > +               else if (ret == -ENODEV)
> > > > +                       dev_dbg(&pdev->dev, "Only use PIO
> > mode\n");
> > > > +               else
> > > > +                       dev_err(&pdev->dev, "Failed to setup DMA,
> > only use PIO mode\n");
> > > > +       }
> > > >
> > > > I think this is what you want to see, right?
> > >
> > > This loses the information why the error happens (ret). Using
> > > dev_err_probe even if no probe deferral is expected in that branch is
> > > perfectly fine and the kernel-doc even points it out:
> > >
> > >   Using this helper in your probe function is totally fine even if @err
> > >   is known to never be -EPROBE_DEFER.
> >
> > Thank you for the feedback. While I recognize the benefits of
> > dev_err_probe() for compact and standardized error handling, using it without
> > returning its result raises a red flag.
> >
> > The function's primary purpose is to combine error logging with returning the
> > error code. If the return value is not used, it can create confusion and suggests
> > potential oversight or unintended behavior. This misuse might mislead readers
> > into thinking that the function always returns at that point, which is not the case
> > here.
> >
> > In this scenario, using dev_err() directly is more explicit and avoids any ambiguity
> > about the control flow or error handling intent. It keeps the code clear and
> > aligned with its actual behavior.
> >
> 
> how about this?
> 
> +       ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> +       if (ret) {
> +               if (ret == -EPROBE_DEFER)
> +                       goto clk_notifier_unregister;
> +               else if (ret == -ENODEV)
> +                       dev_dbg(&pdev->dev, "Only use PIO mode\n");
> +               else
> +                       dev_err(&pdev->dev, "Failed to setup DMA (%d), only use PIO mode\n", ret);
> +       }

Please use human readable version of error value. In this case it will
be:
  dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n", ERR_PTR(ret));


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

