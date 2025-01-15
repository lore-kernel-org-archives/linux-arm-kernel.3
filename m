Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B77C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 05:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xm7yo3/9XHh56lprlYmpc/Yefc/eA46G6+YDkimM6ss=; b=LGckjO9jKnjip0mNkCQ23XN2AV
	ON76g81mMeYLWHWFmi0Bpigazx4QtWXS5snR/04H1TT5CHmYYTxTH0Bl5GR3K+1zASqltC5SZ3JRE
	+OKY1yZ0Bil/Cq+ne6pR3LN1+5RKKIBQOOoAMGc+KXBsa4dCwbRhMsGRH3Xbcq5pM8tdM0dEuD2JI
	4H9cHyYgmNgyLhjHGBfHF0PKG3C97aGNYaNrTI557D5TDWM2k/gCBNj9CbvemyxgkgxYstxunz/g5
	uK0oA3efpm3Nz43YXvOh7Qxc04TD8ANwav1iCBIfHqZQpE1GFsp1YS3RYgog3J/5MbkV7SHKEgCzX
	uaiAqL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvz8-0000000Aggd-1a9s;
	Wed, 15 Jan 2025 05:30:34 +0000
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvxt-0000000AgVI-0A8r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 05:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736918957; x=1768454957;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=15vISLEFmhZT5eZz3ZWj8X7kjiMs2WR2CnqANRurGpQ=;
  b=GqW20JDOCh5c7NkdEGJ6GWBtYm7xQpeaZeuww4As/dpMREtlbSySzFJB
   BY/T/H/AnJR5fcqt8v2Ihsh6OINJ+tvTV2b1kz8nUs0mCb7eVlnbH+JjF
   TZBZCWfNLVxdgpfbvHPSX2cxGvUTkqEuxic8SB7mWM4bLXAd3YmOprqLN
   Jr11xvPuxfTLHCM/sGFc2eqjstMxTRqd8Wt5qkSUCEW5dVYu9vSBwQ//K
   tMbPCpLyrrE/j2uCEWhrxwa3ZlY9vgE70BqWGJu5mYiYCfCgR5o8xb7qU
   HC7meeiACbdmqSDzWvIfsoSrwIDouiInzSEgKiZnoiIwhJScMPJive5wO
   A==;
X-CSE-ConnectionGUID: jSNlg2vZR/+YeEMl/BdsXg==
X-CSE-MsgGUID: HsBSRhTtT/iVoviXk7bQSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="186820628"
X-IronPort-AV: E=Sophos;i="6.12,316,1728918000"; 
   d="scan'208";a="186820628"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 14:29:10 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 63D2CE852B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 14:29:08 +0900 (JST)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E5BDD504A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 14:29:08 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id D5E794005AA38;
	Wed, 15 Jan 2025 14:29:07 +0900 (JST)
From: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
To: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	fj6611ie@aa.jp.fujitsu.com
Subject: [PATCH v2] serial: amba-pl011: Implement nbcon console
Date: Wed, 15 Jan 2025 05:27:48 +0000
Message-Id: <20250115052749.3205675-1-fj6611ie@aa.jp.fujitsu.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_212917_430577_E22DFB26 
X-CRM114-Status: GOOD (  22.61  )
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

Implement the callbacks required for an NBCON console [0] on the 
amba-pl011 console driver.

Referred to the NBCON implementation work for 8250 [1] and imx [2].

The normal-priority write_thread checks for console ownership
each time a character is printed.
write_atomic holds the console ownership until the entire string
is printed.

UART register operations are protected from other contexts by 
uart_port_lock, except for a final flush(nbcon_atomic_flush_unsafe) 
on panic.

The patch has been verified to correctly handle the output and
competition of messages with different priorities and flushing
panic message to console after nmi panic using ARM64 QEMU and
a physical machine(A64FX).

[0] https://lore.kernel.org/all/ZuRRTbapH0DCj334@pathway.suse.cz/
[1] https://lore.kernel.org/all/20240913140538.221708-1-john.ogness@linutronix.de/T/
[2] https://lore.kernel.org/linux-arm-kernel/20240913-serial-imx-nbcon-v3-1-4c627302335b@geanix.com/T/

Signed-off-by: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
---
This patch removes the legacy console code.
Please comment if you have any concerns.

I plan to try a stress test, referencing the work for 8250.
https://lore.kernel.org/lkml/ZsdoD6PomBRsB-ow@debarbos-thinkpadt14sgen2i.remote.csb/#t

Changes in v2:
- Remove the module parameter used to switch between legacy and nbcon.
- Remove codes for legacy console.
- Fix build errors detected by the test robot.
- based on 6.13-rc7
v1: https://lore.kernel.org/all/20250108004730.2302996-1-fj6611ie@aa.jp.fujitsu.com/

Thanks Greg for the advice & comment.
---
 drivers/tty/serial/amba-pl011.c | 143 ++++++++++++++++++++++----------
 1 file changed, 97 insertions(+), 46 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 69b7a3e1e..577fd3258 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -263,6 +263,7 @@ struct uart_amba_port {
 	char			type[12];
 	bool			rs485_tx_started;
 	unsigned int		rs485_tx_drain_interval; /* usecs */
+	bool			console_line_ended;
 #ifdef CONFIG_DMA_ENGINE
 	/* DMA stuff */
 	unsigned int		dmacr;		/* dma control reg */
@@ -2305,50 +2306,7 @@ static void pl011_console_putchar(struct uart_port *port, unsigned char ch)
 	while (pl011_read(uap, REG_FR) & UART01x_FR_TXFF)
 		cpu_relax();
 	pl011_write(ch, uap, REG_DR);
-}
-
-static void
-pl011_console_write(struct console *co, const char *s, unsigned int count)
-{
-	struct uart_amba_port *uap = amba_ports[co->index];
-	unsigned int old_cr = 0, new_cr;
-	unsigned long flags;
-	int locked = 1;
-
-	clk_enable(uap->clk);
-
-	if (oops_in_progress)
-		locked = uart_port_trylock_irqsave(&uap->port, &flags);
-	else
-		uart_port_lock_irqsave(&uap->port, &flags);
-
-	/*
-	 *	First save the CR then disable the interrupts
-	 */
-	if (!uap->vendor->always_enabled) {
-		old_cr = pl011_read(uap, REG_CR);
-		new_cr = old_cr & ~UART011_CR_CTSEN;
-		new_cr |= UART01x_CR_UARTEN | UART011_CR_TXE;
-		pl011_write(new_cr, uap, REG_CR);
-	}
-
-	uart_console_write(&uap->port, s, count, pl011_console_putchar);
-
-	/*
-	 *	Finally, wait for transmitter to become empty and restore the
-	 *	TCR. Allow feature register bits to be inverted to work around
-	 *	errata.
-	 */
-	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr)
-						& uap->vendor->fr_busy)
-		cpu_relax();
-	if (!uap->vendor->always_enabled)
-		pl011_write(old_cr, uap, REG_CR);
-
-	if (locked)
-		uart_port_unlock_irqrestore(&uap->port, flags);
-
-	clk_disable(uap->clk);
+	uap->console_line_ended = (ch == '\n');
 }
 
 static void pl011_console_get_options(struct uart_amba_port *uap, int *baud,
@@ -2411,6 +2369,8 @@ static int pl011_console_setup(struct console *co, char *options)
 	if (ret)
 		return ret;
 
+	uap->console_line_ended = true;
+
 	if (dev_get_platdata(uap->port.dev)) {
 		struct amba_pl011_data *plat;
 
@@ -2494,14 +2454,105 @@ static int pl011_console_match(struct console *co, char *name, int idx,
 	return -ENODEV;
 }
 
+static void
+pl011_console_write_atomic(struct console *co, struct nbcon_write_context *wctxt)
+{
+	struct uart_amba_port *uap = amba_ports[co->index];
+	unsigned int old_cr = 0;
+
+	if (!nbcon_enter_unsafe(wctxt))
+		return;
+
+	clk_enable(uap->clk);
+
+	if (!uap->vendor->always_enabled) {
+		old_cr = pl011_read(uap, REG_CR);
+		pl011_write((old_cr & ~UART011_CR_CTSEN) | (UART01x_CR_UARTEN | UART011_CR_TXE),
+				uap, REG_CR);
+	}
+
+	if (!uap->console_line_ended)
+		uart_console_write(&uap->port, "\n", 1, pl011_console_putchar);
+	uart_console_write(&uap->port, wctxt->outbuf, wctxt->len, pl011_console_putchar);
+
+	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
+		cpu_relax();
+
+	if (!uap->vendor->always_enabled)
+		pl011_write(old_cr, uap, REG_CR);
+
+	clk_disable(uap->clk);
+
+	nbcon_exit_unsafe(wctxt);
+}
+
+static void
+pl011_console_write_thread(struct console *co, struct nbcon_write_context *wctxt)
+{
+	struct uart_amba_port *uap = amba_ports[co->index];
+	unsigned int old_cr = 0;
+
+	if (!nbcon_enter_unsafe(wctxt))
+		return;
+
+	clk_enable(uap->clk);
+
+	if (!uap->vendor->always_enabled) {
+		old_cr = pl011_read(uap, REG_CR);
+		pl011_write((old_cr & ~UART011_CR_CTSEN) | (UART01x_CR_UARTEN | UART011_CR_TXE),
+				uap, REG_CR);
+	}
+
+	if (nbcon_exit_unsafe(wctxt)) {
+		int i;
+		unsigned int len = READ_ONCE(wctxt->len);
+
+		for (i = 0; i < len; i++) {
+			if (!nbcon_enter_unsafe(wctxt))
+				break;
+			uart_console_write(&uap->port, wctxt->outbuf + i, 1, pl011_console_putchar);
+			if (!nbcon_exit_unsafe(wctxt))
+				break;
+		}
+	}
+
+	while (!nbcon_enter_unsafe(wctxt))
+		nbcon_reacquire_nobuf(wctxt);
+
+	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
+		cpu_relax();
+
+	if (!uap->vendor->always_enabled)
+		pl011_write(old_cr, uap, REG_CR);
+
+	clk_disable(uap->clk);
+
+	nbcon_exit_unsafe(wctxt);
+}
+
+static void
+pl011_console_device_lock(struct console *co, unsigned long *flags)
+{
+	__uart_port_lock_irqsave(&amba_ports[co->index]->port, flags);
+}
+
+static void
+pl011_console_device_unlock(struct console *co, unsigned long flags)
+{
+	__uart_port_unlock_irqrestore(&amba_ports[co->index]->port, flags);
+}
+
 static struct uart_driver amba_reg;
 static struct console amba_console = {
 	.name		= "ttyAMA",
-	.write		= pl011_console_write,
 	.device		= uart_console_device,
 	.setup		= pl011_console_setup,
 	.match		= pl011_console_match,
-	.flags		= CON_PRINTBUFFER | CON_ANYTIME,
+	.write_atomic	= pl011_console_write_atomic,
+	.write_thread	= pl011_console_write_thread,
+	.device_lock	= pl011_console_device_lock,
+	.device_unlock	= pl011_console_device_unlock,
+	.flags		= CON_PRINTBUFFER | CON_ANYTIME | CON_NBCON,
 	.index		= -1,
 	.data		= &amba_reg,
 };
-- 
2.34.1


