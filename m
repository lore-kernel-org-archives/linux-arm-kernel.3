Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8376BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRUKLt/ukaXX+B0nlvMjln9crr9KcOSia8ySxMWOrSk=; b=BpaoBo4IzkqUC0L0TrnX6fiEY/
	k6V3HeWNpPZjp0f+KtdKN7FJ3axUC807nAru8XBm/h/tPbCxyMtBDx4ZCfz4/K9r8II/1MLH0CHzZ
	vQGMidbY03cIdr71AyWlJZpHcXLku6bmjWTLyumQwMNdLRz2dpwSpsKygBScuyp/lut+rkynJQmLU
	h3pEWQMqwTGMWnF+050zL1m13nWxM/gujklSK7AR95v+HwAR4M4368JG0f8Sj/v9rlv6egtHLy4Sx
	TtrLxzdTCcfsXGfQ+cNHxBhb4HOA7Rh0LavPSEM0BRNA0cgUmngOQLzpzj0jTXJx08NzXn5AZjki/
	Z1LZ1gtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0MW-0000000BVHy-3Zb1;
	Tue, 24 Dec 2024 08:33:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0LL-0000000BVCB-20hN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 08:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98EECA41427;
	Tue, 24 Dec 2024 08:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4D6C4CED0;
	Tue, 24 Dec 2024 08:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735029162;
	bh=FC+OB8lfeiAk9A4BKbHuLRMjp7BLRrFmmM83lyJOKQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrBYHCjJS3HPFIa3KUtGyuuFnbB/ezOv4VNSvOB6wjXRrrbLws38eyocGijRvduPD
	 JhMnM8J4rqEzyToLuzhj6datxr3T9wpfJMSX45WSKHcyazl8dw7ydsntwBnE4IyRPX
	 g+KEX0GCzsDHvqwXjE2RPTdZwXceQKLtcKoGwoZTEYSZcVYTxhizsLDFkHvvkAqPQZ
	 xPvN2tqtznhVkPL+Xqyx3iPHjbIDc/NNo12DqCMF7idiQLEK08eOlV69jYILTdWgT0
	 dY+3YNCk35IMg6yPCpjv8QJfnbT11CLoA1SdzidV5C+cV8kdDiyiS3p9hkT2I7+I8j
	 YOlWvHAkLKFoA==
Date: Tue, 24 Dec 2024 09:32:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Clark Wang <xiaoning.wang@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v6] i2c: imx: support DMA defer probing
Message-ID: <ltb3ywaz2req4yqdqmtq4ejbzh4esjszbx4x6ab3k5zmqxhdpg@qqjetty6fs3q>
References: <20241223034416.544022-1-carlos.song@nxp.com>
 <gfjir4qyyptxjizkc2k5r2elwn74fndia644evv6acwyuj3fr5@3pl3xt7rqntw>
 <AM0PR0402MB3937905A3108833DD8F52982E8032@AM0PR0402MB3937.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB3937905A3108833DD8F52982E8032@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_003243_596884_905E8E8F 
X-CRM114-Status: GOOD (  20.69  )
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

> > > @@ -1802,6 +1803,18 @@ static int i2c_imx_probe(struct platform_device
> > *pdev)
> > >       if (ret == -EPROBE_DEFER)
> > >               goto clk_notifier_unregister;
> > >
> > > +     /* As we can always fall back to PIO, let's ignore the error setting up
> > DMA. */
> > > +     ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> > > +     if (ret) {
> > > +             if (ret == -EPROBE_DEFER)
> > > +                     goto clk_notifier_unregister;
> > > +             else if (ret == -ENODEV)
> > > +                     dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > > +             else
> > > +                     dev_err(&pdev->dev, "Failed to setup DMA (%pe),
> > only use PIO mode\n",
> > > +                             ERR_PTR(ret));
> > 
> > My question here is not just about the use of dev_err vs dev_err_probe, but why
> > don't we exit the probe if we get an error.
> > 
> > We should use PIO only in case of ENODEV, in all the other cases I think we
> > should just leave. E.g. why don't we exit if we meet ret == -ENOMEM?
> 
> Hi, Andi
> 
> Thank you! From my point, I2C is critical bus so it should be available as much as possible.
> -ENOMEM or other unknown errors all are from i2c_imx_dma_request(). So error happened in enable DMA mode process.

OK, makes sense, it's the idea of "let things fail on their own,
I'll move forward as much as I can"; we need to be aware of
the choice. Please add a comment above.

But then it's not an error, but a warning. With errors we bail
out, with warnings we tell users that something went wrong.

Sorry for keeping you on this point for so long, but do you mind
swapping this dev_err in dev_warn, with a comment explaining the
reason we decided not to leave?

Thanks,
Andi

