Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2FA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 05:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vr58pZBt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8e88usUcYauyf3azJlO/PIAv73piHOHPPh8TVgMWY7s=; b=vr58pZBt5lunDKTW0XlVx2Loed
	QCliubZTMo8kIQACBK2saOKjLv+pGLGrl5l216iQCdBZ39nsyUq+IbqTxk4YknajN+vRVNyN4ulr7
	o9kbDVo4J5DYQCEQYhATRFDaqUxSuXoq5lbjtvczEIN+QGXvFEAO0UFxgLYDDe7fUDVtRZpxoO4jv
	sUrKTNKTy3BphwV4vtgKEVURbrxWnfih7hEF3pfhuX5PEPJ094w9uPZbBlAG2XEadjpqPputnBsIb
	Y1Mrzk0W1j0YZUzAG/Yy0YdHSyUbBzR+pmUoNMVH8K9uHHvRYN9y/2fMdT2AfhFYlaIp5mTKT7CkM
	MT70NPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqUn-00000000kLR-0vCb;
	Sun, 25 Oct 2026 05:10:13 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqUk-00000000kKc-22C7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 05:10:12 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id EAB0892009C; Sun, 25 Oct 2026 06:10:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id DDFC292009B;
	Sun, 25 Oct 2026 05:10:03 +0000 (GMT)
Date: Sun, 25 Oct 2026 05:10:03 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: James Hilliard <james.hilliard1@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
    =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
    Tony Lindgren <tony@atomide.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Richard Genoud <richard.genoud@bootlin.com>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
    Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
    =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
    Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, 
    linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
Message-ID: <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com> <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_221010_715106_B01F3404 
X-CRM114-Status: GOOD (  15.33  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 24 Oct 2026, James Hilliard wrote:

> uart_write_wakeup() expects the UART port lock to be held. Several worker,
> DMA completion and interrupt paths call it without that lock, including
> indirect calls from uart_handle_cts_change() and the transmit helpers.

 Fair enough, and thank you for the cleanup and spotting the issue in the 
first place, however...

> diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
> index b4e1b90e5960..b15f76acd06b 100644
> --- a/drivers/tty/serial/sb1250-duart.c
> +++ b/drivers/tty/serial/sb1250-duart.c
> @@ -454,10 +454,12 @@ static irqreturn_t sbd_interrupt(int irq, void *dev_id)
>  
>  		if (intstat & M_DUART_ISR_RX)
>  			sbd_receive_chars(sport);
> -		if (intstat & M_DUART_ISR_IN)
> -			sbd_status_handle(sport);
> -		if (intstat & M_DUART_ISR_TX)
> -			sbd_transmit_chars(sport);
> +		scoped_guard(uart_port_lock_irqsave, uport) {
> +			if (intstat & M_DUART_ISR_IN)
> +				sbd_status_handle(sport);
> +			if (intstat & M_DUART_ISR_TX)
> +				sbd_transmit_chars(sport);
> +		}

... why do you think the whole functions need to be called with the lock 
held while they may or may not call the handlers in question even?  I 
think we should avoid excessive locking where possible to avoid holding 
execution elsewhere unnecessarily, shouldn't we?

  Maciej

