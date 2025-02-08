Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96731C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 07:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjx4J8EG6AlNkv1ILZ/9qNmt0VFTmBM9+pJ2hNqo0EI=; b=DnTpwDjYw2wDVab8m84NSC3IqT
	DxRybxFn9aKuPj8Jvg+BxMGR9DZrQ9hbb9tBZft42FM8xNT2lkzC4fYbz6Ui00JAky+kuBqH3tQ5S
	a5+/XVKnU7jRj57SNa5MhGd6gowaUFCzg2qtX77tN3fkAdz9WfGoJEaHiWTR4SYM61bfM+qQq2wGf
	weye0Em3CaJCMGUjySTl31guUeRsyaYVGkQtZCZlYT2oPFr297NfpOVxZ4x+xSu5t1Iza1KD5C6k0
	r7XfmrBWxQKPB6AKebTMyvQOOwy5+xX9DS2D3HPn2eeNQ4uBux4LJB+uN2b6r4/+ug9eFH6Q+6WOu
	3c8LxyRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgf2T-0000000CNNs-2sct;
	Sat, 08 Feb 2025 07:14:05 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgf14-0000000CNB2-3txt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 07:12:40 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5187CGxR3966865
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Feb 2025 01:12:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738998736;
	bh=sjx4J8EG6AlNkv1ILZ/9qNmt0VFTmBM9+pJ2hNqo0EI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RS/09aktS9Dik6z613nHKvdSki6zzDV8fcBHWH7j/CNqey1dSaV/KT2Sy44hkCKHl
	 xVROcGbfIH5yyCuAxTjaovtOUlm5XbakEccpG9yZejvUgYvMPb+rDIdnxXF4YnWYBp
	 RB5pewV2D2C390w8xr7JuJ/ioEf7m0w3Zt8k66rs=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5187CGKW026088
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 8 Feb 2025 01:12:16 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 8
 Feb 2025 01:12:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 8 Feb 2025 01:12:16 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5187CF1x072376;
	Sat, 8 Feb 2025 01:12:15 -0600
Date: Sat, 8 Feb 2025 12:42:14 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Peter Chen <peter.chen@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <pawell@cadence.com>,
        <rogerq@kernel.org>, <gregkh@linuxfoundation.org>, <balbi@kernel.org>,
        <jun.li@nxp.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH] usb: cdns3: exit cdns3_gadget_udc_start if
 FAST_REG_ACCESS cannot be set
Message-ID: <miuivpqhatkgtw5g7rl6xj7o4gzxztz6hif53t765elwvhddsq@gqmbxkkabm2y>
References: <20250206125943.786949-1-s-vadapalli@ti.com>
 <20250207022523.GA22848@nchen-desktop>
 <tf7qwkoybolexehzagzel67kdxdfsve2f3qdueomedld72v7pp@bquo47wpsxul>
 <20250208053944.GA28062@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250208053944.GA28062@nchen-desktop>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_231239_157407_A550E8A1 
X-CRM114-Status: GOOD (  32.53  )
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

On Sat, Feb 08, 2025 at 01:39:44PM +0800, Peter Chen wrote:
> On 25-02-07 11:12:50, Siddharth Vadapalli wrote:
> > On Fri, Feb 07, 2025 at 10:25:23AM +0800, Peter Chen wrote:
> > 
> > Hello Peter,
> > 
> > > On 25-02-06 18:29:36, Siddharth Vadapalli wrote:
> > > > When the device is in a low power state, access to the following
> > > > registers takes a long time:
> > > > - EP_CFG
> > > > - EP_TRADDR
> > > > - EP_CMD
> > > > - EP_SEL
> > > > - EP_STS
> > > > - USB_CONF

[...]

> > > > @@ -2997,6 +2997,20 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
> > > >  	/* limit speed if necessary */
> > > >  	max_speed = min(driver->max_speed, gadget->max_speed);
> > > >  
> > > > +	/*  keep Fast Access bit */
> > > > +	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
> > > > +	reg = readl(&priv_dev->regs->usb_pwr);
> > > > +	if (!(reg & PUSB_PWR_FST_REG_ACCESS_STAT)) {
> > > > +		ret = readl_poll_timeout_atomic(&priv_dev->regs->usb_pwr, reg,
> > > > +						(reg & PUSB_PWR_FST_REG_ACCESS_STAT),
> > > > +						10, 1000);
> > > > +		if (ret) {
> > > > +			dev_err(priv_dev->dev, "Failed to enable fast access\n");
> > > > +			spin_unlock_irqrestore(&priv_dev->lock, flags);
> > > > +			return ret;
> > > > +		}
> > > > +	}
> > > > +
> > > >  	switch (max_speed) {
> > > >  	case USB_SPEED_FULL:
> > > >  		writel(USB_CONF_SFORCE_FS, &priv_dev->regs->usb_conf);
> > > 
> > > Hi Siddharth,
> > > 
> > > Would you please keep this change at cdns3_gadget_config in case the
> > > controller is power lost during the system suspend?
> > 
> > I did think of that initially, but the problem with doing so is that we
> > are already accessing USB_CONF above in the "switch(max_speed)" section.
> > The PUSB_PWR_FST_REG_ACCESS bit needs to be set before accessing any of:
> > - EP_CFG
> > - EP_TRADDR
> > - EP_CMD
> > - EP_SEL
> > - EP_STS
> > - USB_CONF
> > 
> > Please let me know if you have an alternate suggestion to address the
> > above.
> > 
> 
> How about move cdns3_gadget_config at the beginning of function
> cdns3_gadget_udc_start, and add your changes at cdns3_gadget_config?

Yes, I could do that, but I will still move the following section within
cdns3_gadget_config() function to the top of that function:

	/*  keep Fast Access bit */
	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);

Additionally, I will update cdns3_gadget_config() to return an error
code if Fast Access bit cannot be set. The diff corresponding to this is:
--------------------------------------------------------------------------------------------
diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index fd1beb10bba7..67d8b0805ba0 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -2935,10 +2935,24 @@ static int cdns3_gadget_pullup(struct usb_gadget *gadget, int is_on)
 	return 0;
 }
 
-static void cdns3_gadget_config(struct cdns3_device *priv_dev)
+static int cdns3_gadget_config(struct cdns3_device *priv_dev)
 {
 	struct cdns3_usb_regs __iomem *regs = priv_dev->regs;
 	u32 reg;
+	int ret;
+
+	/*  keep Fast Access bit */
+	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
+	reg = readl(&priv_dev->regs->usb_pwr);
+	if (!(reg & PUSB_PWR_FST_REG_ACCESS_STAT)) {
+		ret = readl_poll_timeout_atomic(&priv_dev->regs->usb_pwr, reg,
+						(reg & PUSB_PWR_FST_REG_ACCESS_STAT),
+						10, 1000);
+		if (ret) {
+			dev_err(priv_dev->dev, "enabling fast access timed out\n");
+			return ret;
+		}
+	}
 
 	cdns3_ep0_config(priv_dev);
 
@@ -2971,10 +2985,10 @@ static void cdns3_gadget_config(struct cdns3_device *priv_dev)
 	/* enable generic interrupt*/
 	writel(USB_IEN_INIT, &regs->usb_ien);
 	writel(USB_CONF_CLK2OFFDS | USB_CONF_L1DS, &regs->usb_conf);
-	/*  keep Fast Access bit */
-	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
 
 	cdns3_configure_dmult(priv_dev, NULL);
+
+	return 0;
 }
 
 /**
@@ -2990,10 +3004,15 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
 	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
 	unsigned long flags;
 	enum usb_device_speed max_speed = driver->max_speed;
+	int ret;
 
 	spin_lock_irqsave(&priv_dev->lock, flags);
 	priv_dev->gadget_driver = driver;
 
+	ret = cdns3_gadget_config(priv_dev);
+	if (ret)
+		return ret;
+
 	/* limit speed if necessary */
 	max_speed = min(driver->max_speed, gadget->max_speed);
 
@@ -3018,7 +3037,6 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
 		break;
 	}
 
-	cdns3_gadget_config(priv_dev);
 	spin_unlock_irqrestore(&priv_dev->lock, flags);
 	return 0;
 }
@@ -3471,11 +3489,15 @@ __must_hold(&cdns->lock)
 static int cdns3_gadget_resume(struct cdns *cdns, bool hibernated)
 {
 	struct cdns3_device *priv_dev = cdns->gadget_dev;
+	int ret;
 
 	if (!priv_dev->gadget_driver)
 		return 0;
 
-	cdns3_gadget_config(priv_dev);
+	ret = cdns3_gadget_config(priv_dev);
+	if (ret)
+		return ret;
+
 	if (hibernated)
 		writel(USB_CONF_DEVEN, &priv_dev->regs->usb_conf);
--------------------------------------------------------------------------------------------

Regards,
Siddharth.

