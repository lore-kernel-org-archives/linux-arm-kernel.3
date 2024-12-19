Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12135E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVjgrQn8Kz4udT6tzl75DQdtN/PzzMcqDzmpRZCKMhU=; b=hzYw8OlyG8rPLYu1aX5M/4u4g2
	QejUBV02Kn6MBTt+7Y/P62sUPGcLI4sc3opENVv0v9Wmr2s2QVb7KuMGhtW65LZwmfLZlJd4fISki
	NtIakIA09Y1FymTgyBzHJbrfgpKdcHXz2VdZJsTupi8v85c3243W8YH0EOG+A7y0wH/i7fo1hk0ia
	UUxgJQvEVOCjIbn6YPBiCqqXdWo9m0kfPxl5k0jGGXDAuvD3edI0QJtPun2n8mQUFM/IQ3AwiIL2f
	Rd4VZDF8OVs0CfARG0AERXcaTTjipbokxjK4BR1dX0/2itv+GhL+2tDj4gLCMumFIfBBOu+DnsoKs
	0yPzKU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFZl-00000001m9n-1rUk;
	Thu, 19 Dec 2024 12:24:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFYf-00000001lzp-20UU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:23:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tOFYR-000535-OG; Thu, 19 Dec 2024 13:22:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOFYQ-004CcC-2E;
	Thu, 19 Dec 2024 13:22:59 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOFYR-008SaE-19;
	Thu, 19 Dec 2024 13:22:59 +0100
Date: Thu, 19 Dec 2024 13:22:59 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Carlos Song <carlos.song@nxp.com>, frank.li@nxp.com,
	kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Clark Wang <xiaoning.wang@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Message-ID: <Z2QQI2gJNLjI-fam@pengutronix.de>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_042313_514375_FFBCBDC6 
X-CRM114-Status: GOOD (  22.83  )
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

On Thu, Dec 19, 2024 at 01:02:29PM +0100, Andi Shyti wrote:
> Hi Carlos,
> 
> > +	/*
> > +	 * Init DMA config if supported, -ENODEV means DMA not enabled at
> > +	 * this platform, that is not a real error, so just remind "only
> > +	 * PIO mode is used". If DMA is enabled, but meet error when request
> > +	 * DMA channel, error should be showed in probe error log. PIO mode
> > +	 * should be available regardless of DMA.
> > +	 */
> > +	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> > +	if (ret) {
> > +		if (ret == -EPROBE_DEFER)
> > +			goto clk_notifier_unregister;
> > +		else if (ret == -ENODEV)
> > +			dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > +		else
> > +			dev_err_probe(&pdev->dev, ret, "Failed to setup DMA, only use PIO mode\n");
> 
> Just for understanding, should we quit in this last case, as
> well?
> 
> Before we were ignoring ENODEV and EPROBE_DEFER, but now you are
> making it clear that other failures like ENOMEM might happen.

Good point, dev_err_probe() would not print an error in case of EPROBE_DEFER,
but in this case we should only print error and continue with PIO.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

