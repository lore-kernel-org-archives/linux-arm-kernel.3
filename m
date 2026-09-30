Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D94CA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJOsZWaC6IUUaRjuGy9rJJn3SnTd88gtdaj+lansgUA=; b=zzXwz666UxA2ovWDAupi5stCQ8
	t7NNFxEweOEpfEhojCnbpnYXO99aoHzd1WrbwBpX6dEXHdws4Vv6LeC2sVn7iFt4DqPpAsXxHwqim
	b4LsdnGSwClRIcG6qtkYTswqxerdwaszB5KzwsW4cEi2wfN0AjwTL7hPOfDmnJ3uwVw1OV+JRvuBc
	bQ54QYY7aJTzInLV2TxVgYHRYFKvyx2vYsJtXwQ4amdbtRaT3NlJx7kea58R1lEs7EQQPWnj1/0xq
	DyamNUJfxLBRqKmisWvcSZBW/L8L52pv5OGTGKKX9Ch1Ss2HPjLnoxReeajBm8O967Vi+C8em4Wm+
	liJxoMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoWW-00000005FDR-3Txj;
	Wed, 30 Sep 2026 07:14:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoWV-00000005FCk-1734
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:14:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FBDE60239;
	Wed, 30 Sep 2026 07:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BCD1F000FF;
	Wed, 30 Sep 2026 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790752478;
	bh=EJOsZWaC6IUUaRjuGy9rJJn3SnTd88gtdaj+lansgUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mh9GniNNzA4AYmkAFA/0hRVpMGXcCAexTkHrmE7Ga4vzzd9NMyM5vUKSHmY7ww16j
	 GpPAfHIU4ixt35UegPzfO1oQ0ThXVsYxuoAJuUDy1W7CVOaUzNrCSvY/Tq4HLPd6qf
	 sl4fSuxUYyTHKvBXNzT6Yi7Ul7wtWiroo9HJBXOI=
Date: Wed, 30 Sep 2026 09:14:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Drew Fustini <fustini@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART
 driver
Message-ID: <2026093046-scheme-fastball-59c4@gregkh>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
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

On Wed, Sep 30, 2026 at 10:00:06AM +0300, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> Add a driver for the UARTs of the Cortina Systems CS75xx (Goldengate G2)
> SoCs. The block has transmit and receive FIFOs with full/empty status,
> a 24-bit baud rate divider clocked from the peripheral (APB) clock, a
> receive sampling point register and one interrupt line per port with
> per-cause enable and write-one-to-clear status registers.
> 
> The driver is a rewrite of the vendor driver shipped with the Linux
> 2.6.36 and 4.9 based vendor kernels, using the current serial core API
> (uart_port_tx(), port lock helpers, deferred sysrq handling) and devm
> resource management. It supports the system console and earlycon.
> Hardware flow control is not supported.
> 
> The ports are named ttyCS so that the driver can coexist with the 8250
> driver in multiplatform kernels, and PORT_GENERIC is used rather than
> allocating a new port type.

But even if you build a multi-platform kernel, only one of the uarts is
going to be on the system, so why have a new name for it?  Can't you
just use the "default" name instead?  If you do that, what happens?


> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  drivers/tty/serial/Kconfig       |  24 ++
>  drivers/tty/serial/Makefile      |   1 +
>  drivers/tty/serial/cs75xx-uart.c | 546 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 571 insertions(+)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index bf680d22199..c4239c42190 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -1359,6 +1359,30 @@ config SERIAL_CONEXANT_DIGICOLOR_CONSOLE
>  	  If you have enabled the USART serial port on Conexant Digicolor
>  	  SoCs, you can make it the console by answering Y to this option.
>  
> +config SERIAL_CS75XX
> +	tristate "Cortina Systems CS75xx UART support"
> +	depends on ARCH_CORTINA_CS75XX || COMPILE_TEST
> +	depends on OF
> +	select SERIAL_CORE
> +	help
> +	  Support for the on-chip UARTs of the Cortina Systems CS75xx
> +	  (Goldengate G2) SoCs, such as the CS7542. The ports are named
> +	  ttyCS0 to ttyCS3.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called cs75xx-uart.
> +
> +config SERIAL_CS75XX_CONSOLE
> +	bool "Console on Cortina Systems CS75xx UART"
> +	depends on SERIAL_CS75XX=y
> +	select SERIAL_CORE_CONSOLE
> +	select SERIAL_EARLYCON
> +	help
> +	  Say Y here to use a Cortina Systems CS75xx UART as the system
> +	  console. This also enables the early console, which can be
> +	  selected with "earlycon" on the kernel command line when the
> +	  device tree chosen node has a stdout-path pointing at the UART.
> +
>  config SERIAL_ST_ASC
>  	tristate "ST ASC serial port support"
>  	select SERIAL_CORE
> diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
> index bba7b21a4a1..81bb5e39aa2 100644
> --- a/drivers/tty/serial/Makefile
> +++ b/drivers/tty/serial/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_SERIAL_BCM63XX)		+= bcm63xx_uart.o
>  obj-$(CONFIG_SERIAL_CLPS711X)		+= clps711x.o
>  obj-$(CONFIG_SERIAL_CPM)		+= cpm_uart.o
>  obj-$(CONFIG_SERIAL_CONEXANT_DIGICOLOR)	+= digicolor-usart.o
> +obj-$(CONFIG_SERIAL_CS75XX)		+= cs75xx-uart.o
>  obj-$(CONFIG_SERIAL_DZ)			+= dz.o
>  obj-$(CONFIG_SERIAL_FSL_LINFLEXUART)	+= fsl_linflexuart.o
>  obj-$(CONFIG_SERIAL_FSL_LPUART)		+= fsl_lpuart.o
> diff --git a/drivers/tty/serial/cs75xx-uart.c b/drivers/tty/serial/cs75xx-uart.c
> new file mode 100644
> index 00000000000..c15e2227b97
> --- /dev/null
> +++ b/drivers/tty/serial/cs75xx-uart.c
> @@ -0,0 +1,546 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * UART driver for the Cortina Systems CS75xx (Goldengate G2) SoCs
> + *
> + * Based on the Cortina Systems vendor driver.
> + */

No copyright info?

> +static void cs75xx_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
> +{
> +}

Why an empty function?  Can't you just leave it out?

> +static void cs75xx_uart_break_ctl(struct uart_port *port, int break_state)
> +{
> +}

Same here.

> +static void cs75xx_uart_release_port(struct uart_port *port)
> +{
> +}

This feels wrong.

> +static int cs75xx_uart_request_port(struct uart_port *port)
> +{
> +	return 0;
> +}

As does this.

thanks,

greg k-h

