Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAFFE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b52Suyskub1G37wa43GjTwqWUtENWHK5RoKTPvElvkQ=; b=3f3LArmzVc1UnwTfTIRZKNN90G
	NrT1St2lCkpVdh0LZG3BSzRykpVZGZyXuCWOluQuUcF27qeFwKaoBPwEpgIoWh0cbQmeLRQInbz5K
	C/29LrOaqkiRDtZJ/LvYYUVShAvlLLW1yj62yoyuE7oK2WIFJnqzPewoImyh/Ix2ZsNIKYvkWqrY6
	aaUYy22S3uUWZDvaFWLqxJvJtdsocPcpy88dOgxD8YFCsPGGYdIwXjcry9hyvel7Wspy8E+/0IhPG
	J26byNoXk46VqmuL09CANeK/lAkfThKZTa8byNc4mjEZ2uTClWpP0eczwjI2LJig+g89hKvPy2hqv
	4rL3aHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKw8c-0000000AnrF-2XnL;
	Tue, 10 Dec 2024 09:02:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKw7Z-0000000AnkM-2oZr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:01:34 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tKw73-00051L-G9; Tue, 10 Dec 2024 10:01:01 +0100
Message-ID: <b092fdec6fda26c56b4f2cc5927bbaa4a6d786f9.camel@pengutronix.de>
Subject: Re: [PATCH v2] serial: imx: Use uart_port_lock_irq() instead of
 uart_port_lock()
From: Lucas Stach <l.stach@pengutronix.de>
To: Xiaolei Wang <xiaolei.wang@windriver.com>, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, esben@geanix.com, marex@denx.de,
  ilpo.jarvinen@linux.intel.com, linux@rasmusvillemoes.dk, 
 stefan.eichenberger@toradex.com, l.sanfilippo@kunbus.com, 
 cniedermaier@dh-electronics.com, rickaran@axis.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Tue, 10 Dec 2024 10:00:57 +0100
In-Reply-To: <20241210034223.1493522-1-xiaolei.wang@windriver.com>
References: <20241210034223.1493522-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_010133_700858_20A545FE 
X-CRM114-Status: GOOD (  15.29  )
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

Am Dienstag, dem 10.12.2024 um 11:42 +0800 schrieb Xiaolei Wang:
> When executing 'ehco mem > /sys/power/state', the following
> deadlock occurs. Since there is output during the serial
> port entering the suspend process, the suspend will be
> interrupted, resulting in the nesting of locks. Therefore,
> use uart_port_lock_irq() instead of uart_port_unlock().
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

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>=20
> v1:
>   https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241209124=
732.693834-1-xiaolei.wang@windriver.com/
> v2:
>   use uart_port_lock_irq() instead of uart_port_lock_irqsave()
>=20
>  drivers/tty/serial/imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 17f70e4bee43..9c59ec128bb4 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -2692,7 +2692,7 @@ static void imx_uart_enable_wakeup(struct imx_port =
*sport, bool on)
>  {
>  	u32 ucr3;
> =20
> -	uart_port_lock(&sport->port);
> +	uart_port_lock_irq(&sport->port);
> =20
>  	ucr3 =3D imx_uart_readl(sport, UCR3);
>  	if (on) {
> @@ -2714,7 +2714,7 @@ static void imx_uart_enable_wakeup(struct imx_port =
*sport, bool on)
>  		imx_uart_writel(sport, ucr1, UCR1);
>  	}
> =20
> -	uart_port_unlock(&sport->port);
> +	uart_port_unlock_irq(&sport->port);
>  }
> =20
>  static int imx_uart_suspend_noirq(struct device *dev)


