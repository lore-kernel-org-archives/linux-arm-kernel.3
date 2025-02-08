Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91482C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 05:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7uux7ZG5VqW2HD3+HgDOSxANaDlnl1/sJpSY9OwK0U=; b=CnHoBAyAVCYxrowmFOqzCWJJJS
	b1XZwwZGVl5Y5lvSZu7gpqaKNN4fehGRyMcF5WG57VFPf1IpTbssYEjMD4TO+/TN8cc6p0AHCutiH
	5moEaF49/Wuk/qvrK2fpDDghgQ1QLBl21HS5rXV50t9LTZBlTNv73vMOx+1K2KUjwP9a/oPYROIzQ
	mUNrWncTPTIdqP9RaQEddakOPfuG86O5MObjFola+C8CwIrWf2Hvzr9mw4S3lv3WLSOMmhln5ZJNv
	+kp2RP0sYKeV/nR7zJ+mrHxjPelJ9VTNgV6DxXcX7eU3C5+T3bZm6gz3uGTJL1dLOvhNRVTzxCXOi
	LLOoG4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgdak-0000000CEMd-48eK;
	Sat, 08 Feb 2025 05:41:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgdZM-0000000CEC6-0H2v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 05:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7A53A4145E;
	Sat,  8 Feb 2025 05:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A947C4CED6;
	Sat,  8 Feb 2025 05:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738993194;
	bh=EIO2RApIMTaoQHu0AYGuzLxcnzfiMUbPkQ+Ttz9uEII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7IS+KGI3Cu01/xSeKZlmjbimenl4l3+vdhqWbdTyYouNNAUtuuQyWwiHKVab3XdB
	 IB8DBjZoyV7v0hhgNXxbff/mQ4HWs+m6zW94oGZB5LRvd4hYLwvkeeoIn3ilJEvi6r
	 d5sR38oZnjxCT2bzT+5w4IMqQAl2yyowhLtQ14Cx4wgFbu/70jSYWyPIo+/4ANPurY
	 K2Vsydclww71WiA2sgAFS235YE0a/UI72AZy008IOfcGiw/Mo7tN8/zXACsW96UHkI
	 R6JA0YGDChkYHuY3eC0/8hCSicNYgXRy9TDwA71pP8+0ttdS7ftm/K4BaU25IZCoPJ
	 n/1jziYmSveFg==
Date: Sat, 8 Feb 2025 13:39:44 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: pawell@cadence.com, rogerq@kernel.org, gregkh@linuxfoundation.org,
	balbi@kernel.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH] usb: cdns3: exit cdns3_gadget_udc_start if
 FAST_REG_ACCESS cannot be set
Message-ID: <20250208053944.GA28062@nchen-desktop>
References: <20250206125943.786949-1-s-vadapalli@ti.com>
 <20250207022523.GA22848@nchen-desktop>
 <tf7qwkoybolexehzagzel67kdxdfsve2f3qdueomedld72v7pp@bquo47wpsxul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tf7qwkoybolexehzagzel67kdxdfsve2f3qdueomedld72v7pp@bquo47wpsxul>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_213956_238283_4AF59C29 
X-CRM114-Status: GOOD (  36.55  )
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

On 25-02-07 11:12:50, Siddharth Vadapalli wrote:
> On Fri, Feb 07, 2025 at 10:25:23AM +0800, Peter Chen wrote:
> 
> Hello Peter,
> 
> > On 25-02-06 18:29:36, Siddharth Vadapalli wrote:
> > > When the device is in a low power state, access to the following
> > > registers takes a long time:
> > > - EP_CFG
> > > - EP_TRADDR
> > > - EP_CMD
> > > - EP_SEL
> > > - EP_STS
> > > - USB_CONF
> > > 
> > > To address this, the fast register access feature can be enabled by
> > > setting PUSB_PWR_FST_REG_ACCESS bit of the USB_PWR register, which
> > > allows quick access by software. Software is expected to poll on
> > > PUSB_PWR_FST_REG_ACCESS_STAT to ensure that fast register access has
> > > been enabled by the controller. Attempting to access any of the
> > > aforementioned registers after setting PUSB_PWR_FST_REG_ACCESS but
> > > before PUSB_PWR_FST_REG_ACCESS_STAT has been set will result in
> > > undefined behavior and potentially result in system hang.
> > > 
> > > Hence, poll on PUSB_PWR_FST_REG_ACCESS_STAT before proceeding with
> > > gadget configuration, and exit if it cannot be enabled.
> > > 
> > > Fixes: b5148d946f45 ("usb: cdns3: gadget: set fast access bit")
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > ---
> > > 
> > > Hello,
> > > 
> > > This patch is based on commit
> > > 92514ef226f5 Merge tag 'for-6.14-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> > > of Mainline Linux.
> > > 
> > > Regards,
> > > Siddharth.
> > > 
> > >  drivers/usb/cdns3/cdns3-gadget.c | 18 ++++++++++++++++--
> > >  1 file changed, 16 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> > > index fd1beb10bba7..b62691944272 100644
> > > --- a/drivers/usb/cdns3/cdns3-gadget.c
> > > +++ b/drivers/usb/cdns3/cdns3-gadget.c
> > > @@ -2971,8 +2971,6 @@ static void cdns3_gadget_config(struct cdns3_device *priv_dev)
> > >  	/* enable generic interrupt*/
> > >  	writel(USB_IEN_INIT, &regs->usb_ien);
> > >  	writel(USB_CONF_CLK2OFFDS | USB_CONF_L1DS, &regs->usb_conf);
> > > -	/*  keep Fast Access bit */
> > > -	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
> > >  
> > >  	cdns3_configure_dmult(priv_dev, NULL);
> > >  }
> > > @@ -2990,6 +2988,8 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
> > >  	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
> > >  	unsigned long flags;
> > >  	enum usb_device_speed max_speed = driver->max_speed;
> > > +	int ret;
> > > +	u32 reg;
> > >  
> > >  	spin_lock_irqsave(&priv_dev->lock, flags);
> > >  	priv_dev->gadget_driver = driver;
> > > @@ -2997,6 +2997,20 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
> > >  	/* limit speed if necessary */
> > >  	max_speed = min(driver->max_speed, gadget->max_speed);
> > >  
> > > +	/*  keep Fast Access bit */
> > > +	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
> > > +	reg = readl(&priv_dev->regs->usb_pwr);
> > > +	if (!(reg & PUSB_PWR_FST_REG_ACCESS_STAT)) {
> > > +		ret = readl_poll_timeout_atomic(&priv_dev->regs->usb_pwr, reg,
> > > +						(reg & PUSB_PWR_FST_REG_ACCESS_STAT),
> > > +						10, 1000);
> > > +		if (ret) {
> > > +			dev_err(priv_dev->dev, "Failed to enable fast access\n");
> > > +			spin_unlock_irqrestore(&priv_dev->lock, flags);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > >  	switch (max_speed) {
> > >  	case USB_SPEED_FULL:
> > >  		writel(USB_CONF_SFORCE_FS, &priv_dev->regs->usb_conf);
> > 
> > Hi Siddharth,
> > 
> > Would you please keep this change at cdns3_gadget_config in case the
> > controller is power lost during the system suspend?
> 
> I did think of that initially, but the problem with doing so is that we
> are already accessing USB_CONF above in the "switch(max_speed)" section.
> The PUSB_PWR_FST_REG_ACCESS bit needs to be set before accessing any of:
> - EP_CFG
> - EP_TRADDR
> - EP_CMD
> - EP_SEL
> - EP_STS
> - USB_CONF
> 
> Please let me know if you have an alternate suggestion to address the
> above.
> 

How about move cdns3_gadget_config at the beginning of function
cdns3_gadget_udc_start, and add your changes at cdns3_gadget_config?

Regards,
Peter

