Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D83C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wj1ZfPdeCtpc/N6JP64tm6/t1y5lewgjdiheVyn6YoU=; b=X83R6NFA05L/lXK5UdjlSnhDG/
	WAYmTwNSf69y6c1QIUUAB4EIkR1+Yac8zdLr4ACsEhEaUlS/YtJ7TZ9W6Oq3g+7t4fXAZAVwqSh5G
	B6dzKfXVJGKHUOqSWXE+BpbKaQQXD6EoZrHGeOX8akZrgtmbc3iJ2IXWlJ8/xJoqZWid3KlQjfY9v
	ourP9b/EToY4FX4p78XFBVPTTVhkeyU/WwhjLX9QiHcCpOSYzPyCc3gMK2NYoLFkqgB71mBD9I+jz
	siUUo6WWCMHI1Kt7UcaM4X22Bcsj0zIjmJi/oQjgUs+upeYblNppT0AuFjYZfDz5LAT03PdH4wSB4
	fgOFlzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrQK-000000051UV-0iSq;
	Thu, 06 Aug 2026 06:17:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrQJ-000000051UL-09w2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:17:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 737F743CFC;
	Thu,  6 Aug 2026 06:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8A31F000E9;
	Thu,  6 Aug 2026 06:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785997066;
	bh=Wj1ZfPdeCtpc/N6JP64tm6/t1y5lewgjdiheVyn6YoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W7qTC75XX5CcxVUt3USgZxJ57nIcMYCJb9G+D/XPJWClJ1PxrkFalD7TbcnHeTIPh
	 55DwBJzZqn5vD3V/a7ATaR0DG6/GL9Y1n6f/IhUdKRk/pxndOyHQv1//7iBjrewVQf
	 OhZX2vZ2b1EMnaK32BgLt6YasSIixkFK00OBQJi4=
Date: Thu, 6 Aug 2026 08:16:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] usb: host: ehci-atmel: stop clocks before releasing HCD
Message-ID: <2026080610-easter-unwieldy-57ea@gregkh>
References: <20260806060557.1747-1-getshell@seu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806060557.1747-1-getshell@seu.edu.cn>
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

On Thu, Aug 06, 2026 at 02:05:57PM +0800, Hongyan Xu wrote:
> usb_put_hcd() drops the driver's HCD reference and can free the HCD and its
> private data. The remove callback then calls atmel_stop_ehci(), which
> obtains that HCD from platform data and dereferences its private data to
> disable the clocks.
> 
> Stop the controller clocks before dropping the HCD reference so that
> atmel_stop_ehci() cannot access an already freed HCD.
> 
> Fixes: 501c9c0802d9 ("USB: at91: Add USB EHCI driver for at91sam9g45 series")
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---
>  drivers/usb/host/ehci-atmel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 65747270fd88..bcd56f888ec9 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -177,9 +177,8 @@ static void ehci_atmel_drv_remove(struct platform_device *pdev)
>  	struct usb_hcd *hcd = platform_get_drvdata(pdev);
>  
>  	usb_remove_hcd(hcd);
> -	usb_put_hcd(hcd);
> -
>  	atmel_stop_ehci(pdev);
> +	usb_put_hcd(hcd);
>  }
>  
>  static int __maybe_unused ehci_atmel_drv_suspend(struct device *dev)
> -- 
> 2.50.1.windows.1
> 
> 

How was this tested?

