Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E31AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 05:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H37U1nr2lOv9jYFyNln2CSztqFrKuMmT/UtblK3qmKo=; b=lrFsQrWLxL6oGiO9NVDqlcXrOG
	r7xjnol67vwvooL3NSFoVT5zahLPVetqSZ2PVDPX71AAhH9MGThP2uJAMMqygmhVkX+4XakVoFncq
	QYbJEp0ZZg0/nV+lQX6OXLC//9wDoNW6pvqVZt7S9Orpx4Vaq9gv/qz5+Bt2+bJ4ZdlxxefVX759t
	OlTMSL6/d6W0q9SLpe93s+fpsbLJPHDjpj1JFzisP6pSGG5ca9wZ/SycBNvWXXNBD+Uy6YTGaA4jV
	YdYSWoF49y9uUKT6ueyoi3/wHeqsqXW1PfPqWDx+IRqBoc7uLa2AbeE0Ii9TW2oAZGjPZB6N40bWh
	2qQ1GCVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgHA8-00000008OW3-2jhY;
	Fri, 07 Feb 2025 05:44:24 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgH8k-00000008OJc-3Qwv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 05:43:00 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5175gq222868858
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 23:42:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738906972;
	bh=H37U1nr2lOv9jYFyNln2CSztqFrKuMmT/UtblK3qmKo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hqgmSoZywUlBqmrCAcuuV6QlsFMrfFxXuVFw/rn3+23Kya2iHIDU5WD7xE2tcctho
	 /lsrOdmumIvgbOa6OpkczXC/ODrOGEopDwh1kX15CGxmLaiLvFZ75eKiZBoWMgr2Zu
	 AkJEnnvQqRQUC3Qntag//YDudh07urACNQCdPZBc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5175gqS0016443
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 23:42:52 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 23:42:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 23:42:52 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5175gptM115695;
	Thu, 6 Feb 2025 23:42:51 -0600
Date: Fri, 7 Feb 2025 11:12:50 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Peter Chen <peter.chen@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <pawell@cadence.com>,
        <rogerq@kernel.org>, <gregkh@linuxfoundation.org>, <balbi@kernel.org>,
        <jun.li@nxp.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH] usb: cdns3: exit cdns3_gadget_udc_start if
 FAST_REG_ACCESS cannot be set
Message-ID: <tf7qwkoybolexehzagzel67kdxdfsve2f3qdueomedld72v7pp@bquo47wpsxul>
References: <20250206125943.786949-1-s-vadapalli@ti.com>
 <20250207022523.GA22848@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250207022523.GA22848@nchen-desktop>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_214259_044555_8FAD97D0 
X-CRM114-Status: GOOD (  32.98  )
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

On Fri, Feb 07, 2025 at 10:25:23AM +0800, Peter Chen wrote:

Hello Peter,

> On 25-02-06 18:29:36, Siddharth Vadapalli wrote:
> > When the device is in a low power state, access to the following
> > registers takes a long time:
> > - EP_CFG
> > - EP_TRADDR
> > - EP_CMD
> > - EP_SEL
> > - EP_STS
> > - USB_CONF
> > 
> > To address this, the fast register access feature can be enabled by
> > setting PUSB_PWR_FST_REG_ACCESS bit of the USB_PWR register, which
> > allows quick access by software. Software is expected to poll on
> > PUSB_PWR_FST_REG_ACCESS_STAT to ensure that fast register access has
> > been enabled by the controller. Attempting to access any of the
> > aforementioned registers after setting PUSB_PWR_FST_REG_ACCESS but
> > before PUSB_PWR_FST_REG_ACCESS_STAT has been set will result in
> > undefined behavior and potentially result in system hang.
> > 
> > Hence, poll on PUSB_PWR_FST_REG_ACCESS_STAT before proceeding with
> > gadget configuration, and exit if it cannot be enabled.
> > 
> > Fixes: b5148d946f45 ("usb: cdns3: gadget: set fast access bit")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> > 
> > Hello,
> > 
> > This patch is based on commit
> > 92514ef226f5 Merge tag 'for-6.14-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> > of Mainline Linux.
> > 
> > Regards,
> > Siddharth.
> > 
> >  drivers/usb/cdns3/cdns3-gadget.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> > index fd1beb10bba7..b62691944272 100644
> > --- a/drivers/usb/cdns3/cdns3-gadget.c
> > +++ b/drivers/usb/cdns3/cdns3-gadget.c
> > @@ -2971,8 +2971,6 @@ static void cdns3_gadget_config(struct cdns3_device *priv_dev)
> >  	/* enable generic interrupt*/
> >  	writel(USB_IEN_INIT, &regs->usb_ien);
> >  	writel(USB_CONF_CLK2OFFDS | USB_CONF_L1DS, &regs->usb_conf);
> > -	/*  keep Fast Access bit */
> > -	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
> >  
> >  	cdns3_configure_dmult(priv_dev, NULL);
> >  }
> > @@ -2990,6 +2988,8 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
> >  	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
> >  	unsigned long flags;
> >  	enum usb_device_speed max_speed = driver->max_speed;
> > +	int ret;
> > +	u32 reg;
> >  
> >  	spin_lock_irqsave(&priv_dev->lock, flags);
> >  	priv_dev->gadget_driver = driver;
> > @@ -2997,6 +2997,20 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
> >  	/* limit speed if necessary */
> >  	max_speed = min(driver->max_speed, gadget->max_speed);
> >  
> > +	/*  keep Fast Access bit */
> > +	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
> > +	reg = readl(&priv_dev->regs->usb_pwr);
> > +	if (!(reg & PUSB_PWR_FST_REG_ACCESS_STAT)) {
> > +		ret = readl_poll_timeout_atomic(&priv_dev->regs->usb_pwr, reg,
> > +						(reg & PUSB_PWR_FST_REG_ACCESS_STAT),
> > +						10, 1000);
> > +		if (ret) {
> > +			dev_err(priv_dev->dev, "Failed to enable fast access\n");
> > +			spin_unlock_irqrestore(&priv_dev->lock, flags);
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	switch (max_speed) {
> >  	case USB_SPEED_FULL:
> >  		writel(USB_CONF_SFORCE_FS, &priv_dev->regs->usb_conf);
> 
> Hi Siddharth,
> 
> Would you please keep this change at cdns3_gadget_config in case the
> controller is power lost during the system suspend?

I did think of that initially, but the problem with doing so is that we
are already accessing USB_CONF above in the "switch(max_speed)" section.
The PUSB_PWR_FST_REG_ACCESS bit needs to be set before accessing any of:
- EP_CFG
- EP_TRADDR
- EP_CMD
- EP_SEL
- EP_STS
- USB_CONF

Please let me know if you have an alternate suggestion to address the
above.

Regards,
Siddharth.

