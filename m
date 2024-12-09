Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357E0E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk0pN8ozc59fohPWr70k8WrvZ2GZJumzrKYZFs4eCpA=; b=M5qzORWN/BVveq7FEvnxbodb27
	0CSq+J5ZSGG7GE15tQNfSkcxpsaH10ywU2ay1NhteSKoDzFHTmpaIIiI60MeNSzyQMQLxb3cJRe9U
	hv7CLn3uu6xSQJXw7dmKSrJqvQa02DrlnjMyWDBxZMUkOIiilCtwIvHZerpTiiBRi7rNJxM10KQXz
	sqb1DriiEQqfuvfr1NhJ97wOJ9gPxtFrgyQkKZDuFXMt9r4eROJNNo5svOKkETGyQbLOyiEZ2yftp
	U9+tKHdgORtqKYhfR12w/UAl1QEjRIHDSg6JuYTTkDvqBYU0Iekzjrc5gOfO03AtyXojGSLWNJGxy
	hrtWYoow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKetz-00000008ENv-2iUa;
	Mon, 09 Dec 2024 14:38:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKesx-00000008EFH-12Pm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:37:20 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tKesi-00068A-Ni; Mon, 09 Dec 2024 15:37:04 +0100
Message-ID: <ea1ca102ab0ec5068d82935623fd9ffb0b9aade1.camel@pengutronix.de>
Subject: Re: [PATCH] serial: imx: Use uart_port_lock_irqsave() instead of
 uart_port_lock()
From: Lucas Stach <l.stach@pengutronix.de>
To: Xiaolei Wang <xiaolei.wang@windriver.com>, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, esben@geanix.com, 
	linux@rasmusvillemoes.dk, l.sanfilippo@kunbus.com, marex@denx.de, 
	stefan.eichenberger@toradex.com, cniedermaier@dh-electronics.com, 
	rickaran@axis.com, xiaoliei.wang@windriver.com
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Date: Mon, 09 Dec 2024 15:37:01 +0100
In-Reply-To: <20241209124732.693834-1-xiaolei.wang@windriver.com>
References: <20241209124732.693834-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_063719_285313_C38837DD 
X-CRM114-Status: GOOD (  17.38  )
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

Am Montag, dem 09.12.2024 um 20:47 +0800 schrieb Xiaolei Wang:
> When executing 'ehco mem > /sys/power/state', the following
> deadlock occurs. Since there is output during the serial
> port entering the suspend process, the suspend will be
> interrupted, resulting in the nesting of locks. Therefore,
> use uart_port_lock_irqsave instead of uart_port_unlock.
>=20
> WARNING: inconsistent lock state
> 6.12.0-rc2-00002-g3c199ed5bd64-dirty #23 Not tainted
> --------------------------------
> inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
> sh/494 [HC0[0]:SC0[0]:HE1:SE1] takes:
> c4db5850 (&port_lock_key){?.-.}-{3:3}, at: imx_uart_enable_wakeup+0x14/0x=
254
> {IN-HARDIRQ-W} state was registered at:
>   lock_acquire+0x104/0x348
>   _raw_spin_lock+0x48/0x84
>   imx_uart_int+0x14/0x4dc
>   __handle_irq_event_percpu+0xac/0x2fc
>   handle_irq_event_percpu+0xc/0x40
>   handle_irq_event+0x38/0x8c
>   handle_fasteoi_irq+0xb4/0x1b8
>   handle_irq_desc+0x1c/0x2c
>   gic_handle_irq+0x6c/0xa0
>   generic_handle_arch_irq+0x2c/0x64
>   call_with_stack+0x18/0x20
>   __irq_svc+0x9c/0xbc
>   _raw_spin_unlock_irqrestore+0x2c/0x48
>   uart_write+0xd8/0x3a0
>   do_output_char+0x1a8/0x1e4
>   n_tty_write+0x224/0x440
>   file_tty_write.constprop.0+0x124/0x250
>   do_iter_readv_writev+0x100/0x1e0
>   vfs_writev+0xc4/0x448
>   do_writev+0x68/0xf8
>   ret_fast_syscall+0x0/0x1c
> irq event stamp: 31593
> hardirqs last  enabled at (31593): [<c1150e48>] _raw_spin_unlock_irqresto=
re+0x44/0x48
> hardirqs last disabled at (31592): [<c07f32f0>] clk_enable_lock+0x60/0x12=
0
> softirqs last  enabled at (30334): [<c012d1d4>] handle_softirqs+0x2cc/0x4=
78
> softirqs last disabled at (30325): [<c012d510>] __irq_exit_rcu+0x120/0x15=
c
>=20
> other info that might help us debug this:
>  Possible unsafe locking scenario:
>=20
>        CPU0
>        ----
>   lock(&port_lock_key);
>   <Interrupt>
>     lock(&port_lock_key);
>=20
> Fixes: 3c199ed5bd64 ("serial: imx: Grab port lock in imx_uart_enable_wake=
up()")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/tty/serial/imx.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 17f70e4bee43..4470bcb3ef19 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -2691,8 +2691,9 @@ static void imx_uart_save_context(struct imx_port *=
sport)
>  static void imx_uart_enable_wakeup(struct imx_port *sport, bool on)
>  {
>  	u32 ucr3;
> +	unsigned long flags;
> =20
> -	uart_port_lock(&sport->port);
> +	uart_port_lock_irqsave(&sport->port, &flags);

This function is only called from process context, so it should be fine
to use uart_port_lock_irq().

Regards,
Lucas

> =20
>  	ucr3 =3D imx_uart_readl(sport, UCR3);
>  	if (on) {
> @@ -2714,7 +2715,7 @@ static void imx_uart_enable_wakeup(struct imx_port =
*sport, bool on)
>  		imx_uart_writel(sport, ucr1, UCR1);
>  	}
> =20
> -	uart_port_unlock(&sport->port);
> +	uart_port_unlock_irqrestore(&sport->port, flags);
>  }
> =20
>  static int imx_uart_suspend_noirq(struct device *dev)


