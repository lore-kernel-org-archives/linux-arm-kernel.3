Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A6FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hr9YqOCA8Y3071Ik6hsTPZ9M/v7Zg4ekFpBsl2WDaLY=; b=ARQbCxtmeRS6TA3Ik+8wvkYDnx
	IdM3P4IhLlzvtyX5YBeJz4R7yzmLIx0xv4fogS+sMrO3b38lve/dxW0rrWIUoggeLeXGtz2C9n70U
	ocWt98kkgwfmj8wL5/iojjf3fgn8Z8VdyDPLczmsJp564VP6OvaJTRuzL7DK8j0dqRmIgSxyQOAgK
	V5RWnfLeDcX45O/XqNEDr+2TCejSmt2HvmD4yvkr0Qyv57bEjSWGk521EIbq38qlBKHf/A8932lVa
	xGCn0LIxMKtV2mP2pMEmgYdGaZ0tWvbqj8E9ZeiVVzKDkuFGkB6TUJ8URlfbl12mWjtbe4+S0ajqF
	8oFOM1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcwi-0000000Ekr8-0Z5i;
	Mon, 24 Feb 2025 18:12:48 +0000
Received: from out-184.mta1.migadu.com ([95.215.58.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcuL-0000000EkQF-0Nbh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:10:22 +0000
Date: Mon, 24 Feb 2025 13:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740420619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hr9YqOCA8Y3071Ik6hsTPZ9M/v7Zg4ekFpBsl2WDaLY=;
	b=NtgrqWf2iPGHA0+vBammpPjvlGLIDfDmYo5fnf0gziuMNPJzJbQmocyMGO+ox2jCnZHARg
	jKyVbut4Vcpj5XI1V/JlarMPSv2qdzrDYvQrjBwvhG2OGPguFu4zspV2txlMsdwdYW8VvW
	IpJNM2SOaQs5k6zH803EMy44vyuBbMJSt6eJKemA9idbU7zqL+tlOxO+jqkTeiLnL7JIqH
	1aJJ6hepTGrHbH98DJjANaM6UQG6JGABYSciCDiBJ9rna76wLRNzxqmi96uyzsOFH0mNPr
	brvBkZbWb2iUoMBMRQxb/GjsGXFo5Zo5ohwjSaHM0eZ5rR3rtNUMiE9qtr5mxw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] soc: apple: rtkit: Use high prio work queue
Message-ID: <Z7y2BpFT-70JrY2i@blossom>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
 <20250222-apple-soc-misc-v1-3-1a3af494a48a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250222-apple-soc-misc-v1-3-1a3af494a48a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_101021_275861_9188968C 
X-CRM114-Status: GOOD (  15.53  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sat , Feb 22, 2025 at 04:56:48PM +0000, Sven Peter via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> rtkit messages as communication with the DCP firmware for framebuffer
> swaps or input events are time critical so use WQ_HIGHPRI to prevent
> user space CPU load to increase latency.
> With kwin_wayland 6's explicit sync mode user space load was able to
> delay the IOMFB rtkit communication enough to miss vsync for surface
> swaps. Minimal test scenario is constantly resizing a glxgears
> Xwayland window.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/soc/apple/rtkit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index 35734ae8c9ce..b7f4654c3341 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -695,7 +695,7 @@ struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
>  	rtk->mbox->rx = apple_rtkit_rx;
>  	rtk->mbox->cookie = rtk;
>  
> -	rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_MEM_RECLAIM,
> +	rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_HIGHPRI | WQ_MEM_RECLAIM,
>  					  dev_name(rtk->dev));
>  	if (!rtk->wq) {
>  		ret = -ENOMEM;
> 
> -- 
> 2.34.1
> 
> 

