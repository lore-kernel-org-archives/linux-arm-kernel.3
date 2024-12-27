Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2082CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 22:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L823infgxoPboFK1hsbz+0QBq7B/x6XIBXkE7NZh1f8=; b=PjhGxMjDKS9cpNtSpw4CmrfG1K
	dcGliU/az0Mg0Jomz3uOFdaEdwmbitwET2chwWUFCcNZIXngisMCpCGR4pt7CzGUN5/VVcOAev7mQ
	5430SOH+tDUxuLcVkDit9HnHLWBeNwiXAdZgzqCzQVJ51/aCxgHeHB4wXns0nZ60Tt8/H0kR+tY5Y
	5Ne10fyvgNtMdZ3rFhh/Lh9IyKHF+ETxhPsY1bsZH0yuo5V1hO+hkiCZiGDVVe0XXYaBdZFe1K2iR
	9tAFyiR2WFklzY+IbUoGVD1tsrMTyk7YYkDoOAdPFkodR4u37AbFDvTjR3sUmVmcMluFe0bw1J3RF
	GnCs/lnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRJ7i-000000013bu-3Auh;
	Fri, 27 Dec 2024 22:48:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRJ5F-000000013ET-3cU7;
	Fri, 27 Dec 2024 22:45:31 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1735339526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L823infgxoPboFK1hsbz+0QBq7B/x6XIBXkE7NZh1f8=;
	b=YGbNTbzBTy66oo55AeF5o775D61asoChdnm8Biwh8koJlPtqF6aee12UoeuOc1Bl3BET7K
	rl+TE1nVICwyB//mgl11pGUdHNpt4Q+uCHYvVXWN7tTkLpxfOOXpX85KZk4DKX8r7YbWfx
	hSsEDYz23eZEVKy6Dmvuiwej7PxxLf5Pbs0lHaipHjX7jOhm79QgC8hjBtDqQz7WAYY92o
	fvgZyQQANt7AWGgRXJbbw8NJo5fgQV2N69GzN3ox0uBUgbWV0FTzghta9cZV5urbNECuhQ
	dYmtLF5NWFoRX51JHmcMPRB+lTQINVKAFts3//9viw/rzs4ijbgZeH1wcAKkmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1735339526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L823infgxoPboFK1hsbz+0QBq7B/x6XIBXkE7NZh1f8=;
	b=oWsyHpU7fUTd2Uyl0zR6i6Y1C96s5dNNwcaZBG/PLK2L4Wz7IUPWOsAAeYdvT9KDnhcfLM
	Zh93w+x+ytHgv0BQ==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Esben Haabendal <esben@geanix.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Matt Turner <mattst88@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH tty-next v4 4/6] serial: 8250: Provide flag for IER toggling for RS485
Date: Fri, 27 Dec 2024 23:51:20 +0106
Message-Id: <20241227224523.28131-5-john.ogness@linutronix.de>
In-Reply-To: <20241227224523.28131-1-john.ogness@linutronix.de>
References: <20241227224523.28131-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_144530_189920_59C273AF 
X-CRM114-Status: GOOD (  17.45  )
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

For RS485 mode, if SER_RS485_RX_DURING_TX is not available, the
console ->write() callback needs to enable/disable Tx. It does
this by calling the ->rs485_start_tx() and ->rs485_stop_tx()
callbacks. However, some of these callbacks also disable/enable
interrupts and makes power management calls. This causes 2
problems for console writing:

1. A console write can occur in contexts that are illegal for
   pm_runtime_*(). It is not even necessary for console writing
   to use pm_runtime_*() because a console already does this in
   serial8250_console_setup() and serial8250_console_exit().

2. The console ->write() callback already handles
   disabling/enabling the interrupts by properly restoring the
   previous IER value.

Add an argument @toggle_ier to the ->rs485_start_tx() and
->rs485_stop_tx() callbacks to specify if they may disable/enable
receive interrupts while using pm_runtime_*(). Console writing
will not allow the toggling.

For all call sites other than console writing there is no
functional change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/tty/serial/8250/8250.h            |  4 ++--
 drivers/tty/serial/8250/8250_bcm2835aux.c |  4 ++--
 drivers/tty/serial/8250/8250_omap.c       |  2 +-
 drivers/tty/serial/8250/8250_port.c       | 26 +++++++++++++----------
 include/linux/serial_8250.h               |  4 ++--
 5 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index e5310c65cf52..11e05aa014e5 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -231,8 +231,8 @@ void serial8250_rpm_put_tx(struct uart_8250_port *p);
 
 int serial8250_em485_config(struct uart_port *port, struct ktermios *termios,
 			    struct serial_rs485 *rs485);
-void serial8250_em485_start_tx(struct uart_8250_port *p);
-void serial8250_em485_stop_tx(struct uart_8250_port *p);
+void serial8250_em485_start_tx(struct uart_8250_port *p, bool toggle_ier);
+void serial8250_em485_stop_tx(struct uart_8250_port *p, bool toggle_ier);
 void serial8250_em485_destroy(struct uart_8250_port *p);
 extern struct serial_rs485 serial8250_em485_supported;
 
diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c b/drivers/tty/serial/8250/8250_bcm2835aux.c
index fdb53b54e99e..0609582a62f7 100644
--- a/drivers/tty/serial/8250/8250_bcm2835aux.c
+++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
@@ -46,7 +46,7 @@ struct bcm2835aux_data {
 	u32 cntl;
 };
 
-static void bcm2835aux_rs485_start_tx(struct uart_8250_port *up)
+static void bcm2835aux_rs485_start_tx(struct uart_8250_port *up, bool toggle_ier)
 {
 	if (!(up->port.rs485.flags & SER_RS485_RX_DURING_TX)) {
 		struct bcm2835aux_data *data = dev_get_drvdata(up->port.dev);
@@ -65,7 +65,7 @@ static void bcm2835aux_rs485_start_tx(struct uart_8250_port *up)
 		serial8250_out_MCR(up, UART_MCR_RTS);
 }
 
-static void bcm2835aux_rs485_stop_tx(struct uart_8250_port *up)
+static void bcm2835aux_rs485_stop_tx(struct uart_8250_port *up, bool toggle_ier)
 {
 	if (up->port.rs485.flags & SER_RS485_RTS_AFTER_SEND)
 		serial8250_out_MCR(up, 0);
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 42b4aa56b902..c2b75e3f106d 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -365,7 +365,7 @@ static void omap8250_restore_regs(struct uart_8250_port *up)
 
 	if (up->port.rs485.flags & SER_RS485_ENABLED &&
 	    up->port.rs485_config == serial8250_em485_config)
-		serial8250_em485_stop_tx(up);
+		serial8250_em485_stop_tx(up, true);
 }
 
 /*
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 812f003c252d..e38271f477d1 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -578,7 +578,7 @@ static int serial8250_em485_init(struct uart_8250_port *p)
 
 deassert_rts:
 	if (p->em485->tx_stopped)
-		p->rs485_stop_tx(p);
+		p->rs485_stop_tx(p, true);
 
 	return 0;
 }
@@ -1398,10 +1398,11 @@ static void serial8250_stop_rx(struct uart_port *port)
 /**
  * serial8250_em485_stop_tx() - generic ->rs485_stop_tx() callback
  * @p: uart 8250 port
+ * @toggle_ier: true to allow enabling receive interrupts
  *
  * Generic callback usable by 8250 uart drivers to stop rs485 transmission.
  */
-void serial8250_em485_stop_tx(struct uart_8250_port *p)
+void serial8250_em485_stop_tx(struct uart_8250_port *p, bool toggle_ier)
 {
 	unsigned char mcr = serial8250_in_MCR(p);
 
@@ -1422,8 +1423,10 @@ void serial8250_em485_stop_tx(struct uart_8250_port *p)
 	if (!(p->port.rs485.flags & SER_RS485_RX_DURING_TX)) {
 		serial8250_clear_and_reinit_fifos(p);
 
-		p->ier |= UART_IER_RLSI | UART_IER_RDI;
-		serial_port_out(&p->port, UART_IER, p->ier);
+		if (toggle_ier) {
+			p->ier |= UART_IER_RLSI | UART_IER_RDI;
+			serial_port_out(&p->port, UART_IER, p->ier);
+		}
 	}
 }
 EXPORT_SYMBOL_GPL(serial8250_em485_stop_tx);
@@ -1438,7 +1441,7 @@ static enum hrtimer_restart serial8250_em485_handle_stop_tx(struct hrtimer *t)
 	serial8250_rpm_get(p);
 	uart_port_lock_irqsave(&p->port, &flags);
 	if (em485->active_timer == &em485->stop_tx_timer) {
-		p->rs485_stop_tx(p);
+		p->rs485_stop_tx(p, true);
 		em485->active_timer = NULL;
 		em485->tx_stopped = true;
 	}
@@ -1470,7 +1473,7 @@ static void __stop_tx_rs485(struct uart_8250_port *p, u64 stop_delay)
 		em485->active_timer = &em485->stop_tx_timer;
 		hrtimer_start(&em485->stop_tx_timer, ns_to_ktime(stop_delay), HRTIMER_MODE_REL);
 	} else {
-		p->rs485_stop_tx(p);
+		p->rs485_stop_tx(p, true);
 		em485->active_timer = NULL;
 		em485->tx_stopped = true;
 	}
@@ -1559,6 +1562,7 @@ static inline void __start_tx(struct uart_port *port)
 /**
  * serial8250_em485_start_tx() - generic ->rs485_start_tx() callback
  * @up: uart 8250 port
+ * @toggle_ier: true to allow disabling receive interrupts
  *
  * Generic callback usable by 8250 uart drivers to start rs485 transmission.
  * Assumes that setting the RTS bit in the MCR register means RTS is high.
@@ -1566,11 +1570,11 @@ static inline void __start_tx(struct uart_port *port)
  * stoppable by disabling the UART_IER_RDI interrupt.  (Some chips set the
  * UART_LSR_DR bit even when UART_IER_RDI is disabled, foiling this approach.)
  */
-void serial8250_em485_start_tx(struct uart_8250_port *up)
+void serial8250_em485_start_tx(struct uart_8250_port *up, bool toggle_ier)
 {
 	unsigned char mcr = serial8250_in_MCR(up);
 
-	if (!(up->port.rs485.flags & SER_RS485_RX_DURING_TX))
+	if (!(up->port.rs485.flags & SER_RS485_RX_DURING_TX) && toggle_ier)
 		serial8250_stop_rx(&up->port);
 
 	if (up->port.rs485.flags & SER_RS485_RTS_ON_SEND)
@@ -1604,7 +1608,7 @@ static bool start_tx_rs485(struct uart_port *port)
 	if (em485->tx_stopped) {
 		em485->tx_stopped = false;
 
-		up->rs485_start_tx(up);
+		up->rs485_start_tx(up, true);
 
 		if (up->port.rs485.delay_rts_before_send > 0) {
 			em485->active_timer = &em485->start_tx_timer;
@@ -3423,7 +3427,7 @@ void serial8250_console_write(struct uart_8250_port *up, const char *s,
 
 	if (em485) {
 		if (em485->tx_stopped)
-			up->rs485_start_tx(up);
+			up->rs485_start_tx(up, false);
 		mdelay(port->rs485.delay_rts_before_send);
 	}
 
@@ -3461,7 +3465,7 @@ void serial8250_console_write(struct uart_8250_port *up, const char *s,
 	if (em485) {
 		mdelay(port->rs485.delay_rts_after_send);
 		if (em485->tx_stopped)
-			up->rs485_stop_tx(up);
+			up->rs485_stop_tx(up, false);
 	}
 
 	serial_port_out(port, UART_IER, ier);
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index e0717c8393d7..144de7a7948d 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -161,8 +161,8 @@ struct uart_8250_port {
 	void			(*dl_write)(struct uart_8250_port *up, u32 value);
 
 	struct uart_8250_em485 *em485;
-	void			(*rs485_start_tx)(struct uart_8250_port *);
-	void			(*rs485_stop_tx)(struct uart_8250_port *);
+	void			(*rs485_start_tx)(struct uart_8250_port *up, bool toggle_ier);
+	void			(*rs485_stop_tx)(struct uart_8250_port *up, bool toggle_ier);
 
 	/* Serial port overrun backoff */
 	struct delayed_work overrun_backoff;
-- 
2.39.5


