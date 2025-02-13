Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D201FC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UowCjU8InQ7S9fttyW9MJwCZjmHyPuu+gHOWuKgB3r4=; b=oZSoCtiuMFD+N6oHywQhugheuh
	ju1zJADn6cGNqxB0yVygFE1Xi592KLa6Yw4162+wYvIqc2fxzvcQ3cjPZQUZHKaXZRvd6FubZCDJe
	cCdR7ArM/vDUCweUitf25SXfKomM7Yg2RJugO1qF6SKTn4gkoHgUHLOLjV6LBK9BA9oLUSzDFYJ3b
	ukBqcWAABA9f8WD03HgZ3XXmfslfdqMS7xW8uVRSbCFt1zPVVn35wvMlqU2Kh3QMqoRhfAvvpxl07
	6eg8ammuo84hTrMNPicNEkCLTYuhyHyxjx8hbsyVCG013c9y+cJjerm9/8o7sfqFnmv0cBPYt/j6W
	OLsn3dGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiW1N-0000000AZMR-42KB;
	Thu, 13 Feb 2025 10:00:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVyv-0000000AYp7-1hlA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:58:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00D19A41FB0;
	Thu, 13 Feb 2025 09:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDB5C4CED1;
	Thu, 13 Feb 2025 09:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739440684;
	bh=Oqtou6ex2ZovnqK8tj3tuIXnnbRe2REcT3xMiDQmKmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b8/8WoyVsel2U/9lZYawTcA0EpGS/8C8U1Jegh4xK7SLoZCDoabMYKzR+8MQR0c8D
	 IRjmgcetxywX+e6X18JzO29Dhok/zGYihc7UUULzB1vx+HjLFp4BiOvgUCqCFD74No
	 S1+pUQ7HhjIreXprrvApDNcj9wOJON6+0sV1glOk=
Date: Thu, 13 Feb 2025 10:58:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>
Subject: Re: [PATCH] serial: mctrl_gpio: add parameter to skip sync
Message-ID: <2025021347-cling-smoked-9f28@gregkh>
References: <20250213-atomic_sleep_mctrl_serial_gpio-v1-1-201ee6a148ad@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213-atomic_sleep_mctrl_serial_gpio-v1-1-201ee6a148ad@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_015805_571693_FB970AA1 
X-CRM114-Status: GOOD (  24.96  )
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
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>, Fabio Estevam <festevam@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jiri Slaby <jirislaby@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-stm32@st-md-mailman.stormreply.com, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-serial@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, linux-kernel@vger.kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 13, 2025 at 09:25:04AM +0100, Alexis Lothoré wrote:
> The following splat has been observed on a SAMA5D27 platform using
> atmel_serial:
> 
> BUG: sleeping function called from invalid context at kernel/irq/manage.c:738
> in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 27, name: kworker/u5:0
> preempt_count: 1, expected: 0
> INFO: lockdep is turned off.
> irq event stamp: 0
> hardirqs last  enabled at (0): [<00000000>] 0x0
> hardirqs last disabled at (0): [<c01588f0>] copy_process+0x1c4c/0x7bec
> softirqs last  enabled at (0): [<c0158944>] copy_process+0x1ca0/0x7bec
> softirqs last disabled at (0): [<00000000>] 0x0
> CPU: 0 UID: 0 PID: 27 Comm: kworker/u5:0 Not tainted 6.13.0-rc7+ #74
> Hardware name: Atmel SAMA5
> Workqueue: hci0 hci_power_on [bluetooth]
> Call trace:
>   unwind_backtrace from show_stack+0x18/0x1c
>   show_stack from dump_stack_lvl+0x44/0x70
>   dump_stack_lvl from __might_resched+0x38c/0x598
>   __might_resched from disable_irq+0x1c/0x48
>   disable_irq from mctrl_gpio_disable_ms+0x74/0xc0
>   mctrl_gpio_disable_ms from atmel_disable_ms.part.0+0x80/0x1f4
>   atmel_disable_ms.part.0 from atmel_set_termios+0x764/0x11e8
>   atmel_set_termios from uart_change_line_settings+0x15c/0x994
>   uart_change_line_settings from uart_set_termios+0x2b0/0x668
>   uart_set_termios from tty_set_termios+0x600/0x8ec
>   tty_set_termios from ttyport_set_flow_control+0x188/0x1e0
>   ttyport_set_flow_control from wilc_setup+0xd0/0x524 [hci_wilc]
>   wilc_setup [hci_wilc] from hci_dev_open_sync+0x330/0x203c [bluetooth]
>   hci_dev_open_sync [bluetooth] from hci_dev_do_open+0x40/0xb0 [bluetooth]
>   hci_dev_do_open [bluetooth] from hci_power_on+0x12c/0x664 [bluetooth]
>   hci_power_on [bluetooth] from process_one_work+0x998/0x1a38
>   process_one_work from worker_thread+0x6e0/0xfb4
>   worker_thread from kthread+0x3d4/0x484
>   kthread from ret_from_fork+0x14/0x28
> 
> This warning is emitted when trying to toggle, at the highest level,
> some flow control (with serdev_device_set_flow_control) in a device
> driver. At the lowest level, the atmel_serial driver is using
> serial_mctrl_gpio lib to enable/disable the corresponding IRQs
> accordingly.  The warning emitted by CONFIG_DEBUG_ATOMIC_SLEEP is due to
> disable_irq (called in mctrl_gpio_disable_ms) being possibly called in
> some atomic context (some tty drivers perform modem lines configuration
> in regions protected by port lock).
> 
> Add a flag to mctrl_gpio_disable_ms to allow controlling whether the
> function should block, depending the context in which it is called.
> Update mctrl_gpio_disable_ms calls with the relevant flag value,
> depending on whether the call is protected by some port lock.
> 
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
> ---
> This series follows a report made here:
> https://lore.kernel.org/linux-serial/3d227ebe-1ee6-4d57-b1ec-78be59af7244@bootlin.com/
> ---
>  drivers/tty/serial/8250/8250_port.c    | 2 +-
>  drivers/tty/serial/atmel_serial.c      | 2 +-
>  drivers/tty/serial/imx.c               | 2 +-
>  drivers/tty/serial/serial_mctrl_gpio.c | 9 +++++++--
>  drivers/tty/serial/serial_mctrl_gpio.h | 4 ++--
>  drivers/tty/serial/sh-sci.c            | 2 +-
>  drivers/tty/serial/stm32-usart.c       | 2 +-
>  7 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index d7976a21cca9ce50557ca5f13bb01448ced0728b..b234c6c1fe8b3dae4efc2091c8aecf1f1dddc9f8 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -1680,7 +1680,7 @@ static void serial8250_disable_ms(struct uart_port *port)
>  	if (up->bugs & UART_BUG_NOMSR)
>  		return;
>  
> -	mctrl_gpio_disable_ms(up->gpios);
> +	mctrl_gpio_disable_ms(up->gpios, false);

This a bad api.

When you read this line in the driver, do you know what "false" means
here?

Please make two functions, mctrl_gpio_disable_ms_sync() and
mctrl_gpio_disable_ms_no_sync() which can internally just call
mctrl_gpio_disable_ms() with the boolean, but no driver should have to
call that at all.

That way, when you read driver code, you KNOW what is happening and you
don't have to hunt around in a totally different C file to try to figure
it out and loose your concentration.

thanks,

greg k-h

