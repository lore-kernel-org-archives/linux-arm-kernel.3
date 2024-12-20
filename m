Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CE1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVsc614XsfmnjDR1QbDYAxBtRFE60C2ghiXEL7ttYLA=; b=Hw7CsuZ32K2H1z5iCeZUPY6SZg
	JMoCfowIkRxrXGxYNjS2WAXWHVvFYVsGLkkYg8B+gVxMDDvSAM03AgqLaYoVXzJgRRG19mW3z+SHk
	vhw/hjgWC1T+Vkmp9VvzC20giWV2oItYh8eYV70c3RvmJFOIXNqxOLMvZBAs9YNwgMLNFnjDiglJJ
	gGYuKh3Wb8Cwd3uGqEtSlqQv7k+hndyj/o+VEFm/7q5380OJrtXIszmfAtC44vG9aL/ZimhVmI9HC
	WjTcxKxG7FQiYoF++u0diCnGYqmx1ENaAZqSOeThiYClb5++WLA9EBdz9Cbb69p4bmze5vtdPfBBX
	nxyR1pSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObUk-00000004p0Q-44BI;
	Fri, 20 Dec 2024 11:48:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObTC-00000004ogw-32y1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:47:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tObT5-0005Gt-Uu; Fri, 20 Dec 2024 12:46:55 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tObT4-004Msi-2X;
	Fri, 20 Dec 2024 12:46:55 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tObT5-00AQqo-1S;
	Fri, 20 Dec 2024 12:46:55 +0100
Date: Fri, 20 Dec 2024 12:46:55 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Carlos Song <carlos.song@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <frank.li@nxp.com>,
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
Message-ID: <Z2VZLw0RGiEA68Nd@pengutronix.de>
References: <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
 <Z2UeKZcpeRUt2OQ4@pengutronix.de>
 <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2Ugt8NVued0_4c4@pengutronix.de>
 <AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de>
 <AM0PR0402MB39374CFFA66D8121DB218334E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <451e8c12-7b45-4b12-af10-63f60ba6e92e@pengutronix.de>
 <AM0PR0402MB3937E87BBDC5CEA1C51E4E3AE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <f2690b83-b907-4ade-bb9d-daa0636c6786@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2690b83-b907-4ade-bb9d-daa0636c6786@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_034702_766104_9B749132 
X-CRM114-Status: GOOD (  27.09  )
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

On Fri, Dec 20, 2024 at 11:51:27AM +0100, Ahmad Fatoum wrote:
> Hi Carlos,
> 
> On 20.12.24 11:46, Carlos Song wrote:
> > 
> > 
> >> -----Original Message-----
> >> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >> Sent: Friday, December 20, 2024 5:32 PM
> >> To: Carlos Song <carlos.song@nxp.com>; Oleksij Rempel
> 
> >> I know -110, but -12 I need to look up :) Both are cryptic to end users, which is
> >> why %pe was added on top of the existing %p:
> >>
> >> If CONFIG_SYMBOLIC_ERRNAME is enabled %pe expands to an error string, e.g.
> >> "ENOMEM" or "ETIMEDOUT". If it's disabled, you get the same error number
> >> that was printed raw before.
> >>
> >> Cheers,
> >> Ahmad
> >>
> > 
> > Wow! Looks so cool.
> > Thank you very much for your patient explanation! I agree it.
> > 
> > Also I will change the comment from your suggestion[1]:
> > 
> > "
> >   /*
> >    * As we can always fall back to PIO, let's ignore the error setting up
> >    * DMA and see if we run into errors while setting up PIO mode.
> >    */
> > "
> > In fact, other errors are also from DMA setting not from setting PIO mode.
> > So can I comment simply like this?
> > 
> >         /* As we can always fall back to PIO, let's ignore the error setting up DMA. */
> >         ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> >         if (ret) {
> >                 if (ret == -EPROBE_DEFER)
> >                         goto clk_notifier_unregister;
> >                 else if (ret == -ENODEV)
> >                         dev_dbg(&pdev->dev, "Only use PIO mode\n");
> >                 else
> >                         dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n", ERR_PTR(ret));
> >         }
> > 
> > [1]https://lore.kernel.org/imx/89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de/
> 
> Sure, looks good to me. @Oleksij?

Ack, looks good. Thank you!

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

