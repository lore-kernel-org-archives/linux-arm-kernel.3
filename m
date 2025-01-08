Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23C3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 00:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A/B0lFPcENBxS4FEb8EDKILhK0N1bRr3Xra/0nwevUc=; b=WkyjjyQFdc8wUuXzZA/Oz1l6eM
	YdItpr5yy9H9df4lmftjW00ocWk4Aj9vojjMmoH8st//tuQ/ORDJxds4Mz7I3bHpMf6TSiTMAuFz+
	FstqhvaGSrrT/SrFSdZSpq3Kn89CgmZuBxaZhH51x5oVSI+Oj9lFOeGRkEnXIeqGvC1J46iCnRRt4
	idnEbw3VBXW/2GPvBFyiAfmVsfKaJ5sMnMxDCuaT2a5khIav+mt6sAAzZV0SdXohFoq+ZCf+HGGbI
	tsUJEW+3KU6exFN/SK949coIze1VGvn4mtsQHV+Xv9tXyS7OsQRR1Rd3Ya8R7vY+1cd578gOyk9C4
	KUVuYZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKIX-00000006fBA-1CaO;
	Wed, 08 Jan 2025 00:51:49 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKHJ-00000006f2a-3jM6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 00:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736297434; x=1767833434;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3pepWCQ/w0pYqD518g7xPAZwkgW7P/rUAva7kIPw9e8=;
  b=Hb6xl9VUq3aR1bYUnfzk/0x+BA8xi9ZOKVOzSza5PIC/JBqzcqspV00o
   HV28FHhurkY8f3Fy96B4JPcJOJdajiv6bKC/eqdcMoYnrctHY0O/Be2sV
   FIRjaoGfVoW2w4HUmewHitVIQsBRuq+ASUGk0Ktb4tkMWNPLn74jIqrb9
   h4ml1xesO0qMRl/oVH1v+qtKcoVW60CVEIs+IbXOgwnRFELLQlYRfqN4D
   zpjZ73eP6vkoM/CY62peKvNVLGIF6Eaop5MDZIRCWjQOc7iruUp46jkhG
   f22tAP84aRPLPFQzYXcNAhyTN9M1yuBzUA89cWYdKgSPHr2laCb30gwp3
   w==;
X-CSE-ConnectionGUID: mgs+iD5DSoaTnM2oEHvo5A==
X-CSE-MsgGUID: fuULeX+5R2O5HCu1+1HCMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="173201864"
X-IronPort-AV: E=Sophos;i="6.12,296,1728918000"; 
   d="scan'208";a="173201864"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 09:50:27 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CD416DF502
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jan 2025 09:50:24 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F98AD5083
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jan 2025 09:50:24 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id 6FCDC40054C45;
	Wed,  8 Jan 2025 09:50:24 +0900 (JST)
From: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
To: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	fj6611ie@aa.jp.fujitsu.com
Subject: [PATCH] serial: amba-pl011: Implement nbcon console
Date: Wed,  8 Jan 2025 00:47:30 +0000
Message-Id: <20250108004730.2302996-1-fj6611ie@aa.jp.fujitsu.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_165034_215734_23D3891A 
X-CRM114-Status: GOOD (  22.40  )
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
The codes for legacy console are retained, and the module
parameter (use_nbcon) allows switching between legacy and NBCON.
The default is off (use legacy console) for now.

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
 drivers/tty/serial/amba-pl011.c | 113 ++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 69b7a3e1e..52fab3170 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -41,6 +41,7 @@
 #include <linux/sizes.h>
 #include <linux/io.h>
 #include <linux/acpi.h>
+#include <linux/moduleparam.h>
 
 #define UART_NR			14
 
@@ -263,6 +264,7 @@ struct uart_amba_port {
 	char			type[12];
 	bool			rs485_tx_started;
 	unsigned int		rs485_tx_drain_interval; /* usecs */
+	bool			console_line_ended;
 #ifdef CONFIG_DMA_ENGINE
 	/* DMA stuff */
 	unsigned int		dmacr;		/* dma control reg */
@@ -274,6 +276,10 @@ struct uart_amba_port {
 #endif
 };
 
+/* if non-zero, the console is nbcon. */
+static int use_nbcon;
+module_param(use_nbcon, int, 0444);
+
 static unsigned int pl011_tx_empty(struct uart_port *port);
 
 static unsigned int pl011_reg_to_offset(const struct uart_amba_port *uap,
@@ -2305,6 +2311,7 @@ static void pl011_console_putchar(struct uart_port *port, unsigned char ch)
 	while (pl011_read(uap, REG_FR) & UART01x_FR_TXFF)
 		cpu_relax();
 	pl011_write(ch, uap, REG_DR);
+	uap->console_line_ended = (ch == '\n');
 }
 
 static void
@@ -2411,6 +2418,8 @@ static int pl011_console_setup(struct console *co, char *options)
 	if (ret)
 		return ret;
 
+	uap->console_line_ended = true;
+
 	if (dev_get_platdata(uap->port.dev)) {
 		struct amba_pl011_data *plat;
 
@@ -2494,6 +2503,106 @@ static int pl011_console_match(struct console *co, char *name, int idx,
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
+static void
+pl011_console_switch_to_nbcon(struct console *co)
+{
+	co->write = NULL;
+	co->write_atomic = pl011_console_write_atomic;
+	co->write_thread = pl011_console_write_thread;
+	co->device_lock = pl011_console_device_lock;
+	co->device_unlock = pl011_console_device_unlock;
+	co->flags = CON_PRINTBUFFER | CON_ANYTIME | CON_NBCON;
+	pr_info("Serial: switched to nbcon\n");
+}
+
 static struct uart_driver amba_reg;
 static struct console amba_console = {
 	.name		= "ttyAMA",
@@ -2737,6 +2846,10 @@ static int pl011_register_port(struct uart_amba_port *uap)
 	pl011_write(0xffff, uap, REG_ICR);
 
 	if (!amba_reg.state) {
+		/* Replaces the console descriptor if NBCON is selected. */
+		if (amba_reg.cons && use_nbcon)
+			pl011_console_switch_to_nbcon(amba_reg.cons);
+
 		ret = uart_register_driver(&amba_reg);
 		if (ret < 0) {
 			dev_err(uap->port.dev,
-- 
2.34.1


