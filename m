Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8800CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRxYbbRpG8SnrdS2t5XPjJ5hZKIvGPSPazcf1mwxX4w=; b=polsdApOIQ8A/QywvmCNd3bUUg
	uLdAA2T2ZovEb577jzgvJe4M0dCefttjvF5x7vKYaMHAv4lXgdswVD/qsfopx7THIbWyG02jy0l/5
	VcirgJKGVwiOC5JX02J5DibU3vu3xgu0Rirksimq/VKaH4fB5EBYD2LtTv1d5lY0xjGGapM4tIL/M
	yWP9rCSkXw0Arz3NJ0+DyPEw1bfDF28vonQ6iAbXDDRghothudxwvzJGj8aaEhYjtOX6l0yjcAwBE
	HQC0XOMXk+hXBm54EvcrTFXOR2JVXkziNsiLeQuw9I/CC+rnyqPmxVriZMy4/33xqHT2i9kS476vJ
	a4Mx0icA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTtn-0000000EHbW-1I0M;
	Mon, 11 May 2026 16:54:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTtl-0000000EHbD-2knQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:54:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B70BA60123;
	Mon, 11 May 2026 16:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203F0C2BCC9;
	Mon, 11 May 2026 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778518468;
	bh=DxNKfAPo28kAoeTgWlEme9aKX+ABVoG+bB/6QcbEC/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBkaG16RS6MPU2g5ll8ABLwrZomJWWpWlFXhsFEOK7pic0yGJiv6pPTTDr6TzWU1A
	 T+3RGnm3hF40+9G/54ye9/0ew0dxe6kpfZGTGYi+83GTLqQKKxY70qYbZ/9W9YQmvh
	 AcXwea1WKhrLlnIqTWdt2fQX6Um9KY1S4gmqbLfY=
Date: Mon, 11 May 2026 18:54:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rakesh Alasyam <alasyamrakesh77@gmail.com>
Cc: richard.genoud@gmail.com, jirislaby@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] tty: serial: atmel: Ignore chars when CREAD is cleared
Message-ID: <2026051113-embezzle-pastrami-8a6f@gregkh>
References: <2026051106-obliged-dismount-d85f@gregkh>
 <20260511155655.26435-1-alasyamrakesh77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511155655.26435-1-alasyamrakesh77@gmail.com>
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

On Mon, May 11, 2026 at 09:26:55PM +0530, Rakesh Alasyam wrote:
> Ignore received characters when CREAD is cleared by adding RXRDY
> to ignore_status_mask.
> 
> This replaces an existing TODO in the driver.
> 
> Tested on hardware.
> 
> Signed-off-by: Rakesh Alasyam <alasyamrakesh77@gmail.com>
> 
> ---
> 
> v2:
> - Add blank line before comment
> - Tested on hardware
> ---
>  drivers/tty/serial/atmel_serial.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 5d8c1cfc1c60..5c756dc904b0 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -2184,7 +2184,8 @@ static void atmel_set_termios(struct uart_port *port,
>  		if (termios->c_iflag & IGNPAR)
>  			port->ignore_status_mask |= ATMEL_US_OVRE;
>  	}
> -	/* TODO: Ignore all characters if CREAD is set.*/
> +	if (!(termios->c_cflag & CREAD))
> +		port->ignore_status_mask |= ATMEL_US_RXRDY;
>  
>  	/* update the per-port timeout */
>  	uart_update_timeout(port, termios->c_cflag, baud);
> -- 
> 2.43.0
> 

No v2 in the subject line :(

