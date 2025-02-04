Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30D1C02196
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 04:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tJ7T37wUF60uWDmHRPOEPkfYDiAWusUjyGekkVbrQEk=; b=yLn16PDDA2iZlIMgUtNp3PAQ83
	N5UM/btJQKvxJH4CSs7vzP3eGvn+NEQ62pc63NwaR9HeFRvkp9T1k4nHCy6AlN8D5+q834Zap6OgA
	x/o2bx0TH1i6lCT3hibbQhiCmOMKzbc/RTxtQLp0DCoQtp4q3a8NDQa574EF7Ut85C8AQ9c2hWqHb
	cdrgW+5Pa36cpbNB5VTicZARJ2b1coZL/TGuFyTtAHjplNAWqminqwohmIycc/HhHMzhKbCAooq2E
	EwrnEEK9sONMh6RAZ0jPfTbWKOM45pIrM+qa4Kotrbcb8WP+nuhzWS0L4ehJqOC+1WZFeG8jq3+ht
	Eb9YBJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfApZ-0000000HFQQ-0eA1;
	Tue, 04 Feb 2025 04:46:37 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAoC-0000000HFNh-2RCU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 04:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1738644312; x=1770180312;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3zy0L8jyvmOgTgcv1niUmquwu7TF0/oDLJMYtvZPfZc=;
  b=DTzv8VwiFhGKyX8E0D8ha/VpIS8rNoYn2IjFJroxJwwt8dcXsaqjimPC
   aIwaiVBH8SeUPf8sPrsobvmdBIJBhcOwRSgApird3WVsq3/XiipNdQL67
   kw2w2Wrg1fIzOMT9Ikt2q/xm6YVhqD+qxXy+D5EqaSFL785d0kuQ73TaK
   NFNGdrnGyekcCiL8Y0pjbpbS4qItgQUVmtqTrfvLONqD86iZ6M2hF25PK
   pPbHrP6Exj27XXhtZQ7sjO1yNH2u9iS+5ISnbHq6a2saz9xn3zEpxrqyx
   21IpWX2KBFFr1IyCHCdtdkGLX9CNSWEjluDATVwN84eT4uvZpIpPJDG2K
   g==;
X-CSE-ConnectionGUID: WlfAXwsPShOfVorbtM3gPA==
X-CSE-MsgGUID: ISKKrcXwReyTVphRpIOXDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="167674613"
X-IronPort-AV: E=Sophos;i="6.13,257,1732546800"; 
   d="scan'208";a="167674613"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 13:45:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 61AFAD4808
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Feb 2025 13:45:04 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BD42D4C10
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Feb 2025 13:45:04 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id B920540054BEE;
	Tue,  4 Feb 2025 13:45:03 +0900 (JST)
From: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
To: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	fj6611ie@aa.jp.fujitsu.com
Subject: [PATCH v3] serial: amba-pl011: Implement nbcon console
Date: Tue,  4 Feb 2025 04:44:28 +0000
Message-Id: <20250204044428.2191983-1-fj6611ie@aa.jp.fujitsu.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_204512_907895_9C6D6B90 
X-CRM114-Status: GOOD (  24.01  )
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

Stress testing was conducted on a physical machine(A64FX).
The results are as follows:

- The output speed and volume of messages using the NBCON console were
  comparable to the legacy console (data suggests a slight improvement).

- When inducing a panic (sysrq-triggered or NMI) under heavy contention
  on the serial console output,
  the legacy console resulted in the loss of some or all crash messages.
  However, using the NBCON console, no message loss occurred.

This testing referenced the NBCON console work for 8250 [3].

[0] https://lore.kernel.org/all/ZuRRTbapH0DCj334@pathway.suse.cz/
[1] https://lore.kernel.org/all/20240913140538.221708-1-john.ogness@linutronix.de/T/
[2] https://lore.kernel.org/linux-arm-kernel/20240913-serial-imx-nbcon-v3-1-4c627302335b@geanix.com/T/
[3] https://lore.kernel.org/lkml/ZsdoD6PomBRsB-ow@debarbos-thinkpadt14sgen2i.remote.csb/#t

Signed-off-by: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
---
This patch removes the legacy console code.
Please comment if you have any concerns.

Changes in v3:
- Add stress test results to patch comments.
- based on tty-next branch
  https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
v2: https://lore.kernel.org/all/20250115052749.3205675-1-fj6611ie@aa.jp.fujitsu.com/

Changes in v2:
- Remove the module parameter used to switch between legacy and NBCON.
- Remove codes for legacy console.
- Fix build errors detected by the test robot.
- based on 6.13-rc7
v1: https://lore.kernel.org/all/20250108004730.2302996-1-fj6611ie@aa.jp.fujitsu.com/

Thanks Greg for the comment.
---
 drivers/tty/serial/amba-pl011.c | 143 ++++++++++++++++++++++----------
 1 file changed, 97 insertions(+), 46 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 04212c823..9a9a1d630 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -272,6 +272,7 @@ struct uart_amba_port {
 	enum pl011_rs485_tx_state	rs485_tx_state;
 	struct hrtimer		trigger_start_tx;
 	struct hrtimer		trigger_stop_tx;
+	bool			console_line_ended;
 #ifdef CONFIG_DMA_ENGINE
 	/* DMA stuff */
 	unsigned int		dmacr;		/* dma control reg */
@@ -2366,50 +2367,7 @@ static void pl011_console_putchar(struct uart_port *port, unsigned char ch)
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
@@ -2472,6 +2430,8 @@ static int pl011_console_setup(struct console *co, char *options)
 	if (ret)
 		return ret;
 
+	uap->console_line_ended = true;
+
 	if (dev_get_platdata(uap->port.dev)) {
 		struct amba_pl011_data *plat;
 
@@ -2555,14 +2515,105 @@ static int pl011_console_match(struct console *co, char *name, int idx,
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

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.34.1


