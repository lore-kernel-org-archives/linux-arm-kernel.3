Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA2BC55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS21yTI0rcv51Q8aavyyNBBsDmumFL7yWEF67ieXDWs=; b=D0l6TA+Q58XaYU/LsSxynMBCSt
	DcUcxbNQMKSKkRSReXz3l7w5KGj6hIp4cgjtdKn9Jp19yUNs8qTD/TC3eFUJ02cXmWh9KUY+bqREM
	ivpukAjTzcizclMoL/XLeNbzxuDpCQ6dbMHEgR2kaUP7dy6lH+y6A6x+9+LgC8iw5srlCr6HWAWml
	MTRdNjFPUVsZNI317L1jH4UL7gThtiqRthNhgPljSqWKM0kU10/6PooP3D45Y0yHvQ1qSMZ/OiYmZ
	gnHzccuy8SGEXGhaEL4DbvEha5dcqGMUaWF5h+xcF1hGgodTLpJgWmMgh3g6VhQY/n+F3CzBSuJH2
	+4+ERbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrQ9-000000051TH-0LLv;
	Thu, 06 Aug 2026 06:17:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrQ7-000000051TB-3Uc9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:17:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FF0243442;
	Thu,  6 Aug 2026 06:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A041F000E9;
	Thu,  6 Aug 2026 06:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785997055;
	bh=yS21yTI0rcv51Q8aavyyNBBsDmumFL7yWEF67ieXDWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MlabXB9GKBJudzWrLBOKy7SdTB1UCvv7NV3CG46IrpYrWpZnQyaJY8SdScJZ/Qznj
	 bU+0tnDmp6WKcrhPz9eVCmpbzOH4eDruOsJatfYd2tRy+jnix9U+AIDbUM/u8JVO1m
	 LAsvxlt0aiK2mtZZepbhus13Qqm4wfIO5nxOkIuU=
Date: Thu, 6 Aug 2026 08:16:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] usb: host: ehci-atmel: stop clocks before releasing HCD
Message-ID: <2026080623-flatworm-stagnate-82f2@gregkh>
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

You just sent a bunch of obviously-llm-helped patches without properly
attributing that.  Please resend new versions with the correct
information, AND correctly cc: the stable tree for when you have Fixes:
tags like this.

thanks,

greg k-h

