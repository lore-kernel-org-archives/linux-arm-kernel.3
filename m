Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E847DCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLIWiigL5qWkQhHyN5vS0UWUMaLMgvl0mWkBnAFMRsw=; b=QmwLqjsgcYy4QSyccHdXjROAO0
	7rL3DHLjg78w737aHz0HRFpFYiZapawljQ3lm3wuN1JYfrj4jZUPwyzS4GvffUcFRLVynfTJ9zKa3
	7N+wqKIXyjpa/r6C11gqbeBMQe7KY0v0nUsUXDOuKgbbJ7iIHO8e80OaxE/l8MK7YbIKzJ9CKhlqz
	lQSTCv9imYrS98kleaKCI3H6nv9X/PRDBu2yrxHhUEtWpOotJNmjaLc7768UHpzGPyQiia2a8mKJq
	PLsTr8u+x7pjZc3mIDERrCaAqCXIgNfZbkuVyqgHWdR1A+19IJLk/xOmFavl/nTKeZ0JL6eP9n7z9
	YNn67JlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCMf-00000008Cy1-02ky;
	Thu, 01 Oct 2026 08:42:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCMd-00000008Cwo-0iP1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:42:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 453D160235;
	Thu,  1 Oct 2026 08:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A3F1F00898;
	Thu,  1 Oct 2026 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790844122;
	bh=sLIWiigL5qWkQhHyN5vS0UWUMaLMgvl0mWkBnAFMRsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G+0lvHbLcFxKT0ugHqD6AlK9Gls4ZhylEh9mf7J/TlAmiElBtW+AFkgOt39e8KCWe
	 a4AcA4Iw2D/dF/uGlkq51D41Rc291FEYxM7nAzSNgtccCnzc9YGeyeDSsKzvNODz31
	 DPmOqeetYahY1mfms1B5rkDyGZTa7fPL+qRsIkrI=
Date: Thu, 1 Oct 2026 10:41:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH] serial: ma35d1: unmap MMIO on remove
Message-ID: <2026100146-salvaging-scouts-1f4d@gregkh>
References: <20260924110400.1556396-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924110400.1556396-1-lgs201920130244@gmail.com>
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

On Thu, Sep 24, 2026 at 07:04:00PM +0800, Guangshuo Li wrote:
> ma35d1serial_probe() maps up->port.membase with ioremap(), but
> ma35d1serial_remove() does not perform the matching iounmap(). The probe
> error path already releases this mapping after disabling the clock.
> 
> Add iounmap() to the remove path after clk_disable_unprepare() to match
> the resource cleanup order used by ma35d1serial_probe().
> 
> Fixes: 930cbf92db01 ("tty: serial: Add Nuvoton ma35d1 serial driver support")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/tty/serial/ma35d1_serial.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
> index 920fe7ff5083..e5eaaf154911 100644
> --- a/drivers/tty/serial/ma35d1_serial.c
> +++ b/drivers/tty/serial/ma35d1_serial.c
> @@ -770,6 +770,7 @@ static void ma35d1serial_remove(struct platform_device *dev)
>  
>  	uart_remove_one_port(&ma35d1serial_reg, port);
>  	clk_disable_unprepare(up->clk);
> +	iounmap(up->port.membase);
>  }
>  
>  static int ma35d1serial_suspend(struct platform_device *dev, pm_message_t state)
> 
> base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
> -- 
> 2.43.0
> 

Did you forget an Assisted-by: tag?

thanks,

greg k-h

