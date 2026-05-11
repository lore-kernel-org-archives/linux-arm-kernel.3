Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACBDCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YB3xQvGJoqibMTqNNFJOjx0Z5uvyRUH3n2r61yTP/Ss=; b=R2+NJVqkl7UTMsEijXLv/Aft/k
	WknODLp7mudy/LGjbptvXGpx54rB5IlvYi/CnWU3ueMi1VTYiqfkG14ZA3oTAr73YAVI6TRyUYaLy
	/AGaA3KfuTA/7AHIx/6J7cLxXcOCmKBqImEcghna4LK6yh0PMGR9jLVLsUgFEKR4Jqjz8O3hG30xL
	dC1mmd3wY6O2VZKrIIzATS0aoMRxYxzLbfFOXaqx4Zu+SqreZiAf/N7i2rXbwLlrygEZQvtcT/HHb
	BHF/s5GY3p+lZyohwr/JsFXBU6JnYNa/pYNSGk7Sh6aV4KeUDinaOFPzJVQu4sqCGCTdzf1aUJKKA
	YaIt8oug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSO3-0000000E20P-09kv;
	Mon, 11 May 2026 15:17:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSO0-0000000E1zl-33bS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 077FC416EB;
	Mon, 11 May 2026 15:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2B0C2BCB0;
	Mon, 11 May 2026 15:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778512655;
	bh=zKCinbLF9/05nHgJe6u1v8NNbt/3+lyqIdxHn57Fxl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kt7VAMP3kzbLjcFr2teD2id+M1aaRCGt3pkp8WVcTHRySSI123F6ze2k7FSchRQ5c
	 nIQ/bntnyF8nz9ZHmIpCgI72BsGxp5tPVmC5R8GAr1F2BUtR20nufrOJleKPRt4A+i
	 KruGtYRaeLzKy8xxAzlE3yT0Hu21stop9xyjVY2k=
Date: Mon, 11 May 2026 17:17:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rakesh Alasyam <alasyamrakesh77@gmail.com>
Cc: richard.genoud@bootlin.com, jirislaby@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] serial: atmel: honor CREAD in atmel_set_termios
Message-ID: <2026051106-obliged-dismount-d85f@gregkh>
References: <20260501081317.15477-1-alasyamrakesh77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501081317.15477-1-alasyamrakesh77@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_081736_785313_19B099BE 
X-CRM114-Status: GOOD (  17.48  )
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

On Fri, May 01, 2026 at 01:43:17PM +0530, Rakesh Alasyam wrote:
> Ignore received characters when CREAD is cleared by adding RXRDY
> to ignore_status_mask.
> 
> This replaces an existing TODO in the driver.
> 
> Signed-off-by: Rakesh Alasyam <alasyamrakesh77@gmail.com>
> ---
>  drivers/tty/serial/atmel_serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 5d8c1cfc1c60..5b062d8ccabe 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -2184,8 +2184,8 @@ static void atmel_set_termios(struct uart_port *port,
>  		if (termios->c_iflag & IGNPAR)
>  			port->ignore_status_mask |= ATMEL_US_OVRE;
>  	}
> -	/* TODO: Ignore all characters if CREAD is set.*/
> -
> +	if (!(termios->c_cflag & CREAD))
> +		port->ignore_status_mask |= ATMEL_US_RXRDY;
>  	/* update the per-port timeout */
>  	uart_update_timeout(port, termios->c_cflag, baud);
>  
> -- 
> 2.43.0
> 
> 

Cool, was this tested to work properly?

And a blank line is needed before the comment, right?

thanks,

greg k-h

