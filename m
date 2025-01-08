Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2B6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/TVXvMCdzRBNPQn9W0BvBp7CqaNlADmUj0mA9GZG0g=; b=KzZJWlsNN2tOIrPFBuunOdHlBY
	M6HIv+NYFfXv6aMJwm5az0rlWuI/c7HGsKc6lchOVo4BoyryVS2FvfxkwmxIa5Yif7AKnNd20Nb9s
	BOYk0DAQNygDxmuJcaYghmlxMOz6eKx4Z40dSJZyqrrRCiviKh1dOIi1qUnUyBGTxhWXNlRmoOsAN
	M0sCAgJq3aqWZNSz+L5+FbMWtcxBatgulpqv249J0XX8HIcH3gtWGbBgGU9my+34VZdcvUSNHGCnP
	pvCs3N969fZ7tAUMYBHjWp4KQFayfdgapfrdKosRt9OpHGdr1fnPBHNVkuLp6RfW1CGYs+U8sS+2w
	SBjSSIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRDP-00000007WHn-0RTx;
	Wed, 08 Jan 2025 08:14:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRBk-00000007W0h-08rq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7ECF5A40AAA;
	Wed,  8 Jan 2025 08:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD10C4CEE0;
	Wed,  8 Jan 2025 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736323994;
	bh=tRgRy8gM6MaS6N044gOjTwzD7jxxj2feUGYBJJLTg/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0Kn2klvt5ASlC1OAmrvwRdle0k28Id+SCbIl+iFauiALT665T/b7NmtgOLS3xzakj
	 s38dAFTp49eQp8X7WolXssh2M3Pd/x8TquoSfpphTvwXo3wIysepRC9SXm3VW6emHn
	 pjISi93b/mlZ07uQB79IKI349pOjvHmFFfjrABPg=
Date: Wed, 8 Jan 2025 09:13:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Cc: Russell King <linux@armlinux.org.uk>, Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] serial: amba-pl011: Implement nbcon console
Message-ID: <2025010845-deceiver-imaginary-ea04@gregkh>
References: <20250108004730.2302996-1-fj6611ie@aa.jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108004730.2302996-1-fj6611ie@aa.jp.fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_001316_552151_91A76775 
X-CRM114-Status: GOOD (  31.10  )
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

On Wed, Jan 08, 2025 at 12:47:30AM +0000, Toshiyuki Sato wrote:
> Implement the callbacks required for an NBCON console [0] on the 
> amba-pl011 console driver.
> The codes for legacy console are retained, and the module
> parameter (use_nbcon) allows switching between legacy and NBCON.
> The default is off (use legacy console) for now.
> 
> Referred to the NBCON implementation work for 8250 [1] and imx [2].
> 
> The normal-priority write_thread checks for console ownership
> each time a character is printed.
> write_atomic holds the console ownership until the entire string
> is printed.
> 
> UART register operations are protected from other contexts by 
> uart_port_lock, except for a final flush(nbcon_atomic_flush_unsafe) 
> on panic.
> 
> The patch has been verified to correctly handle the output and
> competition of messages with different priorities and flushing
> panic message to console after nmi panic using ARM64 QEMU and
> a physical machine(A64FX).
> 
> [0] https://lore.kernel.org/all/ZuRRTbapH0DCj334@pathway.suse.cz/
> [1] https://lore.kernel.org/all/20240913140538.221708-1-john.ogness@linutronix.de/T/
> [2] https://lore.kernel.org/linux-arm-kernel/20240913-serial-imx-nbcon-v3-1-4c627302335b@geanix.com/T/
> 
> Signed-off-by: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
> ---
>  drivers/tty/serial/amba-pl011.c | 113 ++++++++++++++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
> index 69b7a3e1e..52fab3170 100644
> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -41,6 +41,7 @@
>  #include <linux/sizes.h>
>  #include <linux/io.h>
>  #include <linux/acpi.h>
> +#include <linux/moduleparam.h>
>  
>  #define UART_NR			14
>  
> @@ -263,6 +264,7 @@ struct uart_amba_port {
>  	char			type[12];
>  	bool			rs485_tx_started;
>  	unsigned int		rs485_tx_drain_interval; /* usecs */
> +	bool			console_line_ended;
>  #ifdef CONFIG_DMA_ENGINE
>  	/* DMA stuff */
>  	unsigned int		dmacr;		/* dma control reg */
> @@ -274,6 +276,10 @@ struct uart_amba_port {
>  #endif
>  };
>  
> +/* if non-zero, the console is nbcon. */
> +static int use_nbcon;
> +module_param(use_nbcon, int, 0444);

Why is a module parameter needed here?  That feels wrong and not
scalable at all.  What happens if you have multiple devices, which one
is nbcon and which isn't?


> +
>  static unsigned int pl011_tx_empty(struct uart_port *port);
>  
>  static unsigned int pl011_reg_to_offset(const struct uart_amba_port *uap,
> @@ -2305,6 +2311,7 @@ static void pl011_console_putchar(struct uart_port *port, unsigned char ch)
>  	while (pl011_read(uap, REG_FR) & UART01x_FR_TXFF)
>  		cpu_relax();
>  	pl011_write(ch, uap, REG_DR);
> +	uap->console_line_ended = (ch == '\n');
>  }
>  
>  static void
> @@ -2411,6 +2418,8 @@ static int pl011_console_setup(struct console *co, char *options)
>  	if (ret)
>  		return ret;
>  
> +	uap->console_line_ended = true;
> +
>  	if (dev_get_platdata(uap->port.dev)) {
>  		struct amba_pl011_data *plat;
>  
> @@ -2494,6 +2503,106 @@ static int pl011_console_match(struct console *co, char *name, int idx,
>  	return -ENODEV;
>  }
>  
> +static void
> +pl011_console_write_atomic(struct console *co, struct nbcon_write_context *wctxt)
> +{
> +	struct uart_amba_port *uap = amba_ports[co->index];
> +	unsigned int old_cr = 0;
> +
> +	if (!nbcon_enter_unsafe(wctxt))
> +		return;
> +
> +	clk_enable(uap->clk);
> +
> +	if (!uap->vendor->always_enabled) {
> +		old_cr = pl011_read(uap, REG_CR);
> +		pl011_write((old_cr & ~UART011_CR_CTSEN) | (UART01x_CR_UARTEN | UART011_CR_TXE),
> +				uap, REG_CR);
> +	}
> +
> +	if (!uap->console_line_ended)
> +		uart_console_write(&uap->port, "\n", 1, pl011_console_putchar);
> +	uart_console_write(&uap->port, wctxt->outbuf, wctxt->len, pl011_console_putchar);
> +
> +	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
> +		cpu_relax();
> +
> +	if (!uap->vendor->always_enabled)
> +		pl011_write(old_cr, uap, REG_CR);
> +
> +	clk_disable(uap->clk);
> +
> +	nbcon_exit_unsafe(wctxt);
> +}
> +
> +static void
> +pl011_console_write_thread(struct console *co, struct nbcon_write_context *wctxt)
> +{
> +	struct uart_amba_port *uap = amba_ports[co->index];
> +	unsigned int old_cr = 0;
> +
> +	if (!nbcon_enter_unsafe(wctxt))
> +		return;
> +
> +	clk_enable(uap->clk);
> +
> +	if (!uap->vendor->always_enabled) {
> +		old_cr = pl011_read(uap, REG_CR);
> +		pl011_write((old_cr & ~UART011_CR_CTSEN) | (UART01x_CR_UARTEN | UART011_CR_TXE),
> +				uap, REG_CR);
> +	}
> +
> +	if (nbcon_exit_unsafe(wctxt)) {
> +		int i;
> +		unsigned int len = READ_ONCE(wctxt->len);
> +
> +		for (i = 0; i < len; i++) {
> +			if (!nbcon_enter_unsafe(wctxt))
> +				break;
> +			uart_console_write(&uap->port, wctxt->outbuf + i, 1, pl011_console_putchar);
> +			if (!nbcon_exit_unsafe(wctxt))
> +				break;
> +		}
> +	}
> +
> +	while (!nbcon_enter_unsafe(wctxt))
> +		nbcon_reacquire_nobuf(wctxt);
> +
> +	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
> +		cpu_relax();
> +
> +	if (!uap->vendor->always_enabled)
> +		pl011_write(old_cr, uap, REG_CR);
> +
> +	clk_disable(uap->clk);
> +
> +	nbcon_exit_unsafe(wctxt);
> +}
> +
> +static void
> +pl011_console_device_lock(struct console *co, unsigned long *flags)
> +{
> +	__uart_port_lock_irqsave(&amba_ports[co->index]->port, flags);
> +}
> +
> +static void
> +pl011_console_device_unlock(struct console *co, unsigned long flags)
> +{
> +	__uart_port_unlock_irqrestore(&amba_ports[co->index]->port, flags);
> +}
> +
> +static void
> +pl011_console_switch_to_nbcon(struct console *co)
> +{
> +	co->write = NULL;
> +	co->write_atomic = pl011_console_write_atomic;
> +	co->write_thread = pl011_console_write_thread;
> +	co->device_lock = pl011_console_device_lock;
> +	co->device_unlock = pl011_console_device_unlock;
> +	co->flags = CON_PRINTBUFFER | CON_ANYTIME | CON_NBCON;
> +	pr_info("Serial: switched to nbcon\n");

dev_info()?

thanks,

greg k-h

