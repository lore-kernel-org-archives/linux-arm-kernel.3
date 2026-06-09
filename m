Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC0BCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKS7XMv9e5LK8MyR/zZMe/dyiYpKe1C4eUZZtYsk1uk=; b=LUhO3SbeZ+durCcXiaGf9Ko7Z8
	9XaHvs2c2Hhxvny+Wmwrq++Z26FH2XbAvEja2wq0Y002y0MN4bTjFTqvzMQFeYbUCrcCsK8iG0eml
	EwIWmnsksDUJuytl2ihZBFu/L008Dp7FqYvd2Qh3CJlmB0HxNnVqc0YUBFwMnF6gTtgYCObC2Z+LG
	JAvDZ2svgWHhUxBI3CAJq+fXdrSLriiCyL2ePL/2IrY2k+D+20Woos1IKoMRNI1C/rP6rv5aYDT1h
	Ov9akF/Uql8bV2V6kQKUxYo+8lYDfA0eaC7rB3w0Vrnk7H8mN/ihWVcxvzvaIOXJXAJRXk0ejBlaB
	rMbByLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2IW-00000006Ijx-17ca;
	Tue, 09 Jun 2026 19:39:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2IT-00000006Iin-0IUH;
	Tue, 09 Jun 2026 19:39:39 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 365118CB;
	Tue,  9 Jun 2026 21:39:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781033942;
	bh=57RZdRkZIFyD25VaAF3kemxhABhLiGaYTI7Ckv/IEBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7RmH0/Lf4EOwZsOkln5Hl9Gjlx9vz+GWA8dXbVfXG6+ST0CwKh5houiOmd+0upq0
	 PTQVbL3mi90pl/MVS8Zc3+enQebZ6kBWyqVs9kWGo17efdkNgjT7k/E8XU8x9roSm5
	 5fZevTgQAtFm22K7EO0eswesQobqR6CjXfHEUlNI=
Date: Tue, 9 Jun 2026 22:39:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Fix asc leaked in error/remove
 path
Message-ID: <20260609193929.GC1132670@killaraus.ideasonboard.com>
References: <20260609-bcmpiclean-v1-1-23bdeb19caf6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-bcmpiclean-v1-1-23bdeb19caf6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_123937_557267_FD3A4790 
X-CRM114-Status: GOOD (  14.39  )
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

On Tue, Jun 09, 2026 at 08:05:23PM +0300, Eugen Hristev wrote:
> v4l2_async_nf_add_fwnode_remote() allocates the asc, which is freed when
> v4l2_async_nf_cleanup() is called.
> 
> Call v4l2_async_nf_cleanup() properly in the driver paths.
> 
> Discovered with kmemleak after rmmod:
> 
> unreferenced object 0xffff000084526b80 (size 64):
>   comm "modprobe", pid 185, jiffies 4295013512
>   hex dump (first 32 bytes):
>     01 00 00 00 00 00 00 00 e8 0d ff bf 00 00 ff ff  ................
>     40 83 bc 84 00 00 ff ff 60 83 bc 84 00 00 ff ff  @.......`.......
>   backtrace (crc ac584083):
>     [<00000000ffb081a7>] kmemleak_alloc+0x38/0x44
>     [<00000000d2fd9301>] __kmalloc+0x1b0/0x250
>     [<000000004dd5354d>] __v4l2_async_nf_add_fwnode+0x28/0x9c
>     [<0000000067587657>] __v4l2_async_nf_add_fwnode_remote+0x3c/0x64
> 
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..1508843ae58c 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2613,6 +2613,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
>  	return 0;
>  
>  error:
> +	v4l2_async_nf_cleanup(&unicam->notifier);
>  	fwnode_handle_put(ep_handle);
>  	return ret;
>  }
> @@ -2745,6 +2746,7 @@ static void unicam_remove(struct platform_device *pdev)
>  	v4l2_device_unregister(&unicam->v4l2_dev);
>  	media_device_unregister(&unicam->mdev);
>  	v4l2_async_nf_unregister(&unicam->notifier);
> +	v4l2_async_nf_cleanup(&unicam->notifier);
>  
>  	unicam_subdev_cleanup(unicam);
>  
> 
> ---
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
> change-id: 20260609-bcmpiclean-69a8ee3192b0

-- 
Regards,

Laurent Pinchart

