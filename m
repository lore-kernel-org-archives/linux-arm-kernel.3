Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57B7C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xfkBHNnNfhnAk+NPVOb8AHFgB+axQL5PKulKsKTDgk=; b=pEBw6X1txnhqA3U9+DKaJGMV6Q
	8L8WR0XBficd7AhNXDtv3BZkYY7yfZF0zP2BE6Pcf6m8NBfUeJC9lHIz/1RhBl3IwxHImODiCPEpk
	Fr+k1dybKSKeU2l+Lc8PF4ZK4UaRr2U0I9OdSxqPGSbqrXD8+hxSmucl2afyvxac7oA6IKkpi/oMZ
	QWPh3MjQOXPSPJVm38dsBseH1PRslgVyGWWCNsdoO5XeVWPqztwUhlu4Ng1Q1YLViJdN/29ukjUR6
	I1ED94IZLP6LyohwaMQDgezCu7z6GAFrlwVqob+sTbM+nGdouA/7bWw3GHojdFnOPwETWNwWXGw8B
	EpSp9kAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgE75-000000085R7-1Y9p;
	Fri, 07 Feb 2025 02:29:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgE3i-0000000852j-1qPA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66955A44B0A;
	Fri,  7 Feb 2025 02:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F8BC4CEDD;
	Fri,  7 Feb 2025 02:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738895133;
	bh=O19jyvsGHqWSGaKQKD2496HsMxSWIhf1biOH4whG3x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mg81V0AFzNqlLXufz6dZLoe/3L46leDO3mLZO8/31BU39J0EjYvtJ8S5c4716uDTY
	 d9ndYowId6BWt/WubqUhpYnQ7cTx8hLic47al6XjRHmJQNvF+Jcfgf+vRmvh5v4xZH
	 9jYR0/pFYucasHTWIZw9JjMub7QIhDMyL6ZWxeKnkgjU/poBd+/7dH0ZmJlOu+4NIG
	 F6MyqeYX1R9s48C9SEdNJ7gRz9U23lq14c3zsyTXf/OPe0QOoFGVTnpO63TZBWsOIq
	 6GBvj8FcJleDnKC9V3BIwtdhpJcSBWhe0Rrl3KhDNr+rgA9LouS6qZ6Zq6CwK9yBX3
	 gf1yyH1n7rX+g==
Date: Fri, 7 Feb 2025 10:25:23 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: pawell@cadence.com, rogerq@kernel.org, gregkh@linuxfoundation.org,
	balbi@kernel.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH] usb: cdns3: exit cdns3_gadget_udc_start if
 FAST_REG_ACCESS cannot be set
Message-ID: <20250207022523.GA22848@nchen-desktop>
References: <20250206125943.786949-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206125943.786949-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_182534_604092_D97CFACE 
X-CRM114-Status: GOOD (  25.62  )
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

On 25-02-06 18:29:36, Siddharth Vadapalli wrote:
> When the device is in a low power state, access to the following
> registers takes a long time:
> - EP_CFG
> - EP_TRADDR
> - EP_CMD
> - EP_SEL
> - EP_STS
> - USB_CONF
> 
> To address this, the fast register access feature can be enabled by
> setting PUSB_PWR_FST_REG_ACCESS bit of the USB_PWR register, which
> allows quick access by software. Software is expected to poll on
> PUSB_PWR_FST_REG_ACCESS_STAT to ensure that fast register access has
> been enabled by the controller. Attempting to access any of the
> aforementioned registers after setting PUSB_PWR_FST_REG_ACCESS but
> before PUSB_PWR_FST_REG_ACCESS_STAT has been set will result in
> undefined behavior and potentially result in system hang.
> 
> Hence, poll on PUSB_PWR_FST_REG_ACCESS_STAT before proceeding with
> gadget configuration, and exit if it cannot be enabled.
> 
> Fixes: b5148d946f45 ("usb: cdns3: gadget: set fast access bit")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on commit
> 92514ef226f5 Merge tag 'for-6.14-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> of Mainline Linux.
> 
> Regards,
> Siddharth.
> 
>  drivers/usb/cdns3/cdns3-gadget.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index fd1beb10bba7..b62691944272 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -2971,8 +2971,6 @@ static void cdns3_gadget_config(struct cdns3_device *priv_dev)
>  	/* enable generic interrupt*/
>  	writel(USB_IEN_INIT, &regs->usb_ien);
>  	writel(USB_CONF_CLK2OFFDS | USB_CONF_L1DS, &regs->usb_conf);
> -	/*  keep Fast Access bit */
> -	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
>  
>  	cdns3_configure_dmult(priv_dev, NULL);
>  }
> @@ -2990,6 +2988,8 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
>  	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
>  	unsigned long flags;
>  	enum usb_device_speed max_speed = driver->max_speed;
> +	int ret;
> +	u32 reg;
>  
>  	spin_lock_irqsave(&priv_dev->lock, flags);
>  	priv_dev->gadget_driver = driver;
> @@ -2997,6 +2997,20 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
>  	/* limit speed if necessary */
>  	max_speed = min(driver->max_speed, gadget->max_speed);
>  
> +	/*  keep Fast Access bit */
> +	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
> +	reg = readl(&priv_dev->regs->usb_pwr);
> +	if (!(reg & PUSB_PWR_FST_REG_ACCESS_STAT)) {
> +		ret = readl_poll_timeout_atomic(&priv_dev->regs->usb_pwr, reg,
> +						(reg & PUSB_PWR_FST_REG_ACCESS_STAT),
> +						10, 1000);
> +		if (ret) {
> +			dev_err(priv_dev->dev, "Failed to enable fast access\n");
> +			spin_unlock_irqrestore(&priv_dev->lock, flags);
> +			return ret;
> +		}
> +	}
> +
>  	switch (max_speed) {
>  	case USB_SPEED_FULL:
>  		writel(USB_CONF_SFORCE_FS, &priv_dev->regs->usb_conf);

Hi Siddharth,

Would you please keep this change at cdns3_gadget_config in case the
controller is power lost during the system suspend?

Peter

