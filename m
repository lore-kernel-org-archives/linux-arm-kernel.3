Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD123CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGICm9g4dRXmU+6sf5Z8nF9V+YHMwgRzuS0Vk6yWmQ0=; b=nSxtjtH0KVdW9caE6wcrH1eVN6
	TJ4D9jmdAWX+2ZKnRiWpW0Yy3DQRo7e3gZ87/ZfdGNDeM4/Z2qQFatpBzibhhNt6qq9YSSiihffR8
	stye43kYO4MauVWY8z2I+I3vMAnnVk1PSb7GZHARX/TayhsAy6AMuaQbZIxoVTSA/KaE8IyuElGWH
	0JrgdK6lq3Xsm0IJbYpJEgE2aqGZ8IFKlBoShcPN1HQg7obxwRXZR26TVKIjdyPxewAir+eqozSlG
	ewNcHTNMfrlXgYq55o57TUBds14d3Bq3Y5MSOfwKjoLkjtPYItNMPNTA/SgV8f6YvtrpCy9IEvce9
	eZE8DlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEs2M-00000006PmH-2WXP;
	Fri, 31 Oct 2025 16:31:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEs2L-00000006Pm9-46XN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 16:31:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A618460241;
	Fri, 31 Oct 2025 16:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D00C4CEE7;
	Fri, 31 Oct 2025 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761928296;
	bh=zW829c3pZwV8tsnXSpZcuT+PeSyI9qJf7eQP02+ZFXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfpYzVSnpBx2JIf4UZTkGylOO01LoGMr6kaTAtbxyIQgB6kMrogWmJUEZAQU3xtHT
	 TKh5uHJD2YFuaPRMk74ktnoi6CgWWjaEAe/WJHkrg6YvtmW0XSz4sdEDN2e3vjmPcj
	 KIa2c3vPKJTYTg+Ztr7NhjBRmU4WmJG969TZX0Gg=
Date: Fri, 31 Oct 2025 17:31:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: jirislaby@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: ma35d1: Fix resource leaks on driver removal
Message-ID: <2025103115-humped-body-d522@gregkh>
References: <20251029080039.1010-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029080039.1010-1-vulab@iscas.ac.cn>
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

On Wed, Oct 29, 2025 at 04:00:39PM +0800, Haotian Zhang wrote:
> The driver fails to release resources acquired during probe. It calls
> of_clk_get() to obtain the clock reference but never calls clk_put()
> in the remove path, leaking the clock reference count. Similarly, it
> calls ioremap() to map UART registers but never calls iounmap() during
> removal, leaking the I/O memory mapping.
> 
> Switch to devm_clk_get() for automatic clock resource management and
> add iounmap() call in ma35d1serial_remove() to properly release the
> memory mapping.
> 
> Fixes: 930cbf92db01 ("tty: serial: Add Nuvoton ma35d1 serial driver support")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/tty/serial/ma35d1_serial.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
> index 285b0fe41a86..37e9f6166290 100644
> --- a/drivers/tty/serial/ma35d1_serial.c
> +++ b/drivers/tty/serial/ma35d1_serial.c
> @@ -711,7 +711,7 @@ static int ma35d1serial_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&up->port.lock);
>  
> -	up->clk = of_clk_get(pdev->dev.of_node, 0);
> +	up->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(up->clk)) {
>  		ret = PTR_ERR(up->clk);
>  		dev_err(&pdev->dev, "failed to get core clk: %d\n", ret);
> @@ -762,6 +762,7 @@ static void ma35d1serial_remove(struct platform_device *dev)
>  
>  	uart_remove_one_port(&ma35d1serial_reg, port);
>  	clk_disable_unprepare(up->clk);
> +	iounmap(up->port.membase);

You are doing two different things in this patch, shouldn't this be 2
different commits?

thanks,

greg k-h

