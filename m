Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C339C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBSRmBZqvSMofNWLtUeCzHkwk0Rv6M/cR5ZCysz+mVc=; b=jBHj08gXRYv936h4XnJlJiMYmw
	pW0H5+01xhbcpVPbY6kAzEp4J0242khKVqd+/xYtwvY2/RqxLoM64Ej3Kth6PqeHlonwIKgo0PTvs
	VlKXlsA24Oq95PGrKbm92Vn8wHPk3fJZdbSFpGeXTVMvNyc899BNKAGg6HU3h8gotWqcBiTK9kbu+
	YSlgxepznOaccrWu5Anr3a5JAzpIgNF7fBE2uHpEQx/aVaiZ/YOIeTmJBiNncnCG4EIX2ZEJ9l12Y
	xIzk4OUNgD23Ww1QYX0ohoAZeXPlx0EAwtK2mkVwbtJEoBxNocgayrG2VEURJqwLjQN1rjnERGTEx
	PDIklmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTU1-0000000Ayka-0sqU;
	Thu, 30 Jul 2026 16:19:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTTu-0000000AyjQ-2vDX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:19:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ED4C60A5C;
	Thu, 30 Jul 2026 16:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC9B1F000E9;
	Thu, 30 Jul 2026 16:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785428377;
	bh=LBSRmBZqvSMofNWLtUeCzHkwk0Rv6M/cR5ZCysz+mVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xjb5XdHB3bEwG5hD2Vgy9wHHpxY1Nx6jOh8fjWDWFq3wWJEZZjksW5khODV5MjOEa
	 FTPmFjXrPLOXlVZLf48kCxK3POQBEbLgiH7H47ff4O55nKAwrtP6nwkRc+0xS3UMr+
	 VLHA0eFpHXqraRbrgydIh6Lw3YUjbY3RPUxe77yI=
Date: Thu, 30 Jul 2026 16:31:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] serial: imx: serialize imx_uart_ports[] lifetime
Message-ID: <2026073011-crock-utmost-6392@gregkh>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
 <20260719221014.44354-5-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719221014.44354-5-kmehltretter@gmail.com>
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

On Mon, Jul 20, 2026 at 12:10:14AM +0200, Karl Mehltretter wrote:
> imx_uart_probe() publishes the port in imx_uart_ports[] before
> uart_add_one_port(), because console setup during that call uses the
> table. The entry is not cleared if adding the port fails or after
> imx_uart_remove() removes it.
> 
> The port is devm-allocated, so a failed probe or unbind leaves the table
> pointing at freed memory. A later registration of the shared console can
> then dereference the stale entry. Reproduced on QEMU's mcimx6ul-evk by
> unbinding a sibling UART, unbinding the console UART and rebinding the
> sibling:
> 
>   BUG: KASAN: slab-use-after-free in imx_uart_console_setup+0xd0/0x3d8
> 
> The entry must remain valid until uart_remove_one_port() unregisters the
> console. Clearing it afterward without serialization still races a
> sibling probe: the sibling can register the shared console using the
> dying entry before it is cleared. The next console write then
> dereferences NULL.
> 
> Use a driver-wide mutex to serialize table publication, port addition
> and rollback with port removal and table clearing. Console callbacks
> remain lockless because uart_add_one_port() may invoke setup while
> probe holds the mutex.
> 
> The probe-failure path also relies on "serial: core: do fallible
> allocations before the console can be registered", which moves the
> uport->name and uport->tty_groups allocations before console
> registration. Both changes should be backported together.
> 
> Fixes: dbff4e9ea2e8 ("IMX UART: remove statically initialized tables")
> Fixes: 9f322ad064f9 ("imx: serial: handle initialisation failure correctly")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260719162850.043B41F000E9@smtp.kernel.org
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/tty/serial/imx.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 251a50c8aa38..def874f9cd00 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -22,6 +22,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/ktime.h>
> +#include <linux/mutex.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/rational.h>
>  #include <linux/slab.h>
> @@ -2080,6 +2081,15 @@ static const struct uart_ops imx_uart_pops = {
>  
>  static struct imx_port *imx_uart_ports[UART_NR];
>  
> +/*
> + * Store the port in imx_uart_ports[] before uart_add_one_port() and clear
> + * it only after uart_remove_one_port() returns. Console callbacks in both
> + * calls use the table, so this mutex serializes these sequences between
> + * sibling ports. Callbacks must not take it because uart_add_one_port()
> + * may invoke setup while it is held.
> + */
> +static DEFINE_MUTEX(imx_uart_ports_lock);

Again, LLMs love to write comments/text, be sane please.  This comment
has nothing to do with the storing and such.

> +
>  #if IS_ENABLED(CONFIG_SERIAL_IMX_CONSOLE)
>  static void imx_uart_console_putchar(struct uart_port *port, unsigned char ch)
>  {
> @@ -2632,11 +2642,14 @@ static int imx_uart_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	imx_uart_ports[sport->port.line] = sport;
> -
>  	platform_set_drvdata(pdev, sport);
>  
> +	mutex_lock(&imx_uart_ports_lock);

guard()?

> +	imx_uart_ports[sport->port.line] = sport;
>  	ret = uart_add_one_port(&imx_uart_uart_driver, &sport->port);
> +	if (ret)
> +		imx_uart_ports[sport->port.line] = NULL;
> +	mutex_unlock(&imx_uart_ports_lock);
>  
>  err_clk:
>  	clk_disable_unprepare(sport->clk_ipg);
> @@ -2647,8 +2660,12 @@ static int imx_uart_probe(struct platform_device *pdev)
>  static void imx_uart_remove(struct platform_device *pdev)
>  {
>  	struct imx_port *sport = platform_get_drvdata(pdev);
> +	unsigned int line = sport->port.line;

Why are you reading this outside of the lock?

>  
> +	mutex_lock(&imx_uart_ports_lock);

guard()?

thanks,

greg k-h

