Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8603DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tBXtQKspl/tQc262TteMj1K5AZZrIiuUgh3p3e1Bj8A=; b=stSvAa0baxtQ8jrDzbPfLAbthq
	NE6F6DkSZnSj7LCzE2zEqAM7byXi8emBr7aCCxNQV5Pad7nfNK9zm4Upuq9QHIhy5r8gBJyBstpc8
	GU4KhcRvU4+jLsG6zI0NDTgHs4VBsdk4Kogo00PAD0vTghZNn89QQnBt8O0XMJy0QHoll4/74JQ62
	+TPMYRtc/IqT5byKuAEZaBgomu6iz1y9B3kwqL3QNkJ05zCCQlz29/2OCDYX3sV5Tzd0CoS5v8bx2
	kz1DZHwZcucyGVrJHXpbh2b+2xJfFzd5MqcxfTqUlXnqbAnYoS/wWfzO06OHMjZVpI0vmlvXxca/K
	aRq56YSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirEe-0000000E9gE-1get;
	Fri, 14 Feb 2025 08:39:44 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirDC-0000000E9S9-1nsF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:38:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DAD3441DB;
	Fri, 14 Feb 2025 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739522290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tBXtQKspl/tQc262TteMj1K5AZZrIiuUgh3p3e1Bj8A=;
	b=Ex59S/KNwROOk1PwwvtxM9GKHtgky3sFkhbU7jy5wYAL/i+5/1UYcClvUg5n9f9iDuGiQ/
	6Rh14vi3u+X+/Gn8IqhkT8iWWyYJh4Y5owvjM8tyuDSsC2Ls4ZERdMYqRH0LzV1+XnTbN6
	3ZXHJSfJMP5e9cMdP8N+DqZipPsZ+bAwUGVnxEXBZInCsCrqfYpkhfVJZs+rI3pDN76SPA
	WGG06i9NneGrFVq4OLt248K7gfn62GNdKj6VMzjhnlXigWFjoJdSYK4gphYPefK61xWORM
	uBPDPC6n6nws7ALKsHvfvwCGn4PPZVy+IEOGMJc2MsISUq6PvvDaTsbNmNPieQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Fri, 14 Feb 2025 09:38:01 +0100
Subject: [PATCH v2] serial: mctrl_gpio: add parameter to skip sync
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-atomic_sleep_mctrl_serial_gpio-v2-1-1e60c732fd90@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOgAr2cC/42NQQqDMBAAv1L23BSTNhJ66j+KhBhXXYiuJEFax
 L83+oIeZw4zGySMhAmelw0irpSI5wLqegE/unlAQV1hUJXSlZJ34TJP5G0KiIudfI7BHgkX7LA
 QC2N0X/fYaqNbKJElYk+fc/BuCo+UMsfv+VvlYf9Or1JIoSqJWDv5MK57tcw50HzzPEGz7/sPk
 DTZtM4AAAA=
X-Change-ID: 20250213-atomic_sleep_mctrl_serial_gpio-885f6feb585b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-doc@vger.kernel.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegledulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekveeftdeifedvfefgvdfgjeduieevudeltdeulefhhefgiedvhfethffgffegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddujedrtddrudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgsv
 ghtsehlfihnrdhnvghtpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_003814_768365_6A3B84DB 
X-CRM114-Status: GOOD (  17.73  )
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

The following splat has been observed on a SAMA5D27 platform using
atmel_serial:

BUG: sleeping function called from invalid context at kernel/irq/manage.c:738
in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 27, name: kworker/u5:0
preempt_count: 1, expected: 0
INFO: lockdep is turned off.
irq event stamp: 0
hardirqs last  enabled at (0): [<00000000>] 0x0
hardirqs last disabled at (0): [<c01588f0>] copy_process+0x1c4c/0x7bec
softirqs last  enabled at (0): [<c0158944>] copy_process+0x1ca0/0x7bec
softirqs last disabled at (0): [<00000000>] 0x0
CPU: 0 UID: 0 PID: 27 Comm: kworker/u5:0 Not tainted 6.13.0-rc7+ #74
Hardware name: Atmel SAMA5
Workqueue: hci0 hci_power_on [bluetooth]
Call trace:
  unwind_backtrace from show_stack+0x18/0x1c
  show_stack from dump_stack_lvl+0x44/0x70
  dump_stack_lvl from __might_resched+0x38c/0x598
  __might_resched from disable_irq+0x1c/0x48
  disable_irq from mctrl_gpio_disable_ms+0x74/0xc0
  mctrl_gpio_disable_ms from atmel_disable_ms.part.0+0x80/0x1f4
  atmel_disable_ms.part.0 from atmel_set_termios+0x764/0x11e8
  atmel_set_termios from uart_change_line_settings+0x15c/0x994
  uart_change_line_settings from uart_set_termios+0x2b0/0x668
  uart_set_termios from tty_set_termios+0x600/0x8ec
  tty_set_termios from ttyport_set_flow_control+0x188/0x1e0
  ttyport_set_flow_control from wilc_setup+0xd0/0x524 [hci_wilc]
  wilc_setup [hci_wilc] from hci_dev_open_sync+0x330/0x203c [bluetooth]
  hci_dev_open_sync [bluetooth] from hci_dev_do_open+0x40/0xb0 [bluetooth]
  hci_dev_do_open [bluetooth] from hci_power_on+0x12c/0x664 [bluetooth]
  hci_power_on [bluetooth] from process_one_work+0x998/0x1a38
  process_one_work from worker_thread+0x6e0/0xfb4
  worker_thread from kthread+0x3d4/0x484
  kthread from ret_from_fork+0x14/0x28

This warning is emitted when trying to toggle, at the highest level,
some flow control (with serdev_device_set_flow_control) in a device
driver. At the lowest level, the atmel_serial driver is using
serial_mctrl_gpio lib to enable/disable the corresponding IRQs
accordingly.  The warning emitted by CONFIG_DEBUG_ATOMIC_SLEEP is due to
disable_irq (called in mctrl_gpio_disable_ms) being possibly called in
some atomic context (some tty drivers perform modem lines configuration
in regions protected by port lock).

Split mctrl_gpio_disable_ms into two differents APIs, a non-blocking one
and a blocking one. Replace mctrl_gpio_disable_ms calls with the
relevant version depending on whether the call is protected by some port
lock.

Suggested-by: Jiri Slaby <jirislaby@kernel.org>
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes in v2:
- create dedicated APIs instead of using custom flag
- Link to v1: https://lore.kernel.org/r/20250213-atomic_sleep_mctrl_serial_gpio-v1-1-201ee6a148ad@bootlin.com
---
 Documentation/driver-api/serial/driver.rst |  2 +-
 drivers/tty/serial/8250/8250_port.c        |  2 +-
 drivers/tty/serial/atmel_serial.c          |  2 +-
 drivers/tty/serial/imx.c                   |  2 +-
 drivers/tty/serial/serial_mctrl_gpio.c     | 34 ++++++++++++++++++++++++------
 drivers/tty/serial/serial_mctrl_gpio.h     | 17 ++++++++++++---
 drivers/tty/serial/sh-sci.c                |  2 +-
 drivers/tty/serial/stm32-usart.c           |  2 +-
 8 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/Documentation/driver-api/serial/driver.rst b/Documentation/driver-api/serial/driver.rst
index 84b43061c11be2d6b4e3cd29fb8e6ecbdebe646d..60434f2b0286373d64b7aa8ae309454d7bd8859e 100644
--- a/Documentation/driver-api/serial/driver.rst
+++ b/Documentation/driver-api/serial/driver.rst
@@ -103,4 +103,4 @@ Some helpers are provided in order to set/get modem control lines via GPIO.
 .. kernel-doc:: drivers/tty/serial/serial_mctrl_gpio.c
    :identifiers: mctrl_gpio_init mctrl_gpio_free mctrl_gpio_to_gpiod
            mctrl_gpio_set mctrl_gpio_get mctrl_gpio_enable_ms
-           mctrl_gpio_disable_ms
+           mctrl_gpio_disable_ms_sync mctrl_gpio_disable_ms_no_sync
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index d7976a21cca9ce50557ca5f13bb01448ced0728b..218a1d98f1ed3e2697624444be33243050df3a85 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -1680,7 +1680,7 @@ static void serial8250_disable_ms(struct uart_port *port)
 	if (up->bugs & UART_BUG_NOMSR)
 		return;
 
-	mctrl_gpio_disable_ms(up->gpios);
+	mctrl_gpio_disable_ms_no_sync(up->gpios);
 
 	up->ier &= ~UART_IER_MSI;
 	serial_port_out(port, UART_IER, up->ier);
diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index f44f9d20a97440c9aea41e9ebe34c34d4dfa0a1c..8918fbd4bddd5dfe7705a75d4132dda59fe9e5e6 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -700,7 +700,7 @@ static void atmel_disable_ms(struct uart_port *port)
 
 	atmel_port->ms_irq_enabled = false;
 
-	mctrl_gpio_disable_ms(atmel_port->gpios);
+	mctrl_gpio_disable_ms_no_sync(atmel_port->gpios);
 
 	if (!mctrl_gpio_to_gpiod(atmel_port->gpios, UART_GPIO_CTS))
 		idr |= ATMEL_US_CTSIC;
diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 9c59ec128bb4fc0ff54cb9a1a66eabbc9e391a9a..cfeb3f8cf45eaeea8afaa767a4ad849bb8d19f69 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1608,7 +1608,7 @@ static void imx_uart_shutdown(struct uart_port *port)
 		imx_uart_dma_exit(sport);
 	}
 
-	mctrl_gpio_disable_ms(sport->gpios);
+	mctrl_gpio_disable_ms_sync(sport->gpios);
 
 	uart_port_lock_irqsave(&sport->port, &flags);
 	ucr2 = imx_uart_readl(sport, UCR2);
diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
index 8855688a5b6c09f073349bd144586f54331d891f..ca55bcc0b61119d0b76e6943e0f223a4a9e25c02 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.c
+++ b/drivers/tty/serial/serial_mctrl_gpio.c
@@ -322,11 +322,7 @@ void mctrl_gpio_enable_ms(struct mctrl_gpios *gpios)
 }
 EXPORT_SYMBOL_GPL(mctrl_gpio_enable_ms);
 
-/**
- * mctrl_gpio_disable_ms - disable irqs and handling of changes to the ms lines
- * @gpios: gpios to disable
- */
-void mctrl_gpio_disable_ms(struct mctrl_gpios *gpios)
+static void mctrl_gpio_disable_ms(struct mctrl_gpios *gpios, bool sync)
 {
 	enum mctrl_gpio_idx i;
 
@@ -342,10 +338,34 @@ void mctrl_gpio_disable_ms(struct mctrl_gpios *gpios)
 		if (!gpios->irq[i])
 			continue;
 
-		disable_irq(gpios->irq[i]);
+		if (sync)
+			disable_irq(gpios->irq[i]);
+		else
+			disable_irq_nosync(gpios->irq[i]);
 	}
 }
-EXPORT_SYMBOL_GPL(mctrl_gpio_disable_ms);
+
+/**
+ * mctrl_gpio_disable_ms_sync - disable irqs and handling of changes to the ms
+ * lines, and wait for any pending IRQ to be processed
+ * @gpios: gpios to disable
+ */
+void mctrl_gpio_disable_ms_sync(struct mctrl_gpios *gpios)
+{
+	mctrl_gpio_disable_ms(gpios, true);
+}
+EXPORT_SYMBOL_GPL(mctrl_gpio_disable_ms_sync);
+
+/**
+ * mctrl_gpio_disable_ms_no_sync - disable irqs and handling of changes to the
+ * ms lines, and return immediately
+ * @gpios: gpios to disable
+ */
+void mctrl_gpio_disable_ms_no_sync(struct mctrl_gpios *gpios)
+{
+	mctrl_gpio_disable_ms(gpios, false);
+}
+EXPORT_SYMBOL_GPL(mctrl_gpio_disable_ms_no_sync);
 
 void mctrl_gpio_enable_irq_wake(struct mctrl_gpios *gpios)
 {
diff --git a/drivers/tty/serial/serial_mctrl_gpio.h b/drivers/tty/serial/serial_mctrl_gpio.h
index fc76910fb105a3d560e824baa43e9515576e895a..79e97838ebe5672a1b00ef848dcda1e8c1b9568e 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.h
+++ b/drivers/tty/serial/serial_mctrl_gpio.h
@@ -87,9 +87,16 @@ void mctrl_gpio_free(struct device *dev, struct mctrl_gpios *gpios);
 void mctrl_gpio_enable_ms(struct mctrl_gpios *gpios);
 
 /*
- * Disable gpio interrupts to report status line changes.
+ * Disable gpio interrupts to report status line changes, and block until
+ * any corresponding IRQ is processed
  */
-void mctrl_gpio_disable_ms(struct mctrl_gpios *gpios);
+void mctrl_gpio_disable_ms_sync(struct mctrl_gpios *gpios);
+
+/*
+ * Disable gpio interrupts to report status line changes, and return
+ * immediately
+ */
+void mctrl_gpio_disable_ms_no_sync(struct mctrl_gpios *gpios);
 
 /*
  * Enable gpio wakeup interrupts to enable wake up source.
@@ -148,7 +155,11 @@ static inline void mctrl_gpio_enable_ms(struct mctrl_gpios *gpios)
 {
 }
 
-static inline void mctrl_gpio_disable_ms(struct mctrl_gpios *gpios)
+static inline void mctrl_gpio_disable_ms_sync(struct mctrl_gpios *gpios)
+{
+}
+
+static inline void mctrl_gpio_disable_ms_no_sync(struct mctrl_gpios *gpios)
 {
 }
 
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index b1ea48f38248eb42d98353daa289bbe67191d201..41f987632bce82c9d041d9ab1f5162d2af1a78e4 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2298,7 +2298,7 @@ static void sci_shutdown(struct uart_port *port)
 	dev_dbg(port->dev, "%s(%d)\n", __func__, port->line);
 
 	s->autorts = false;
-	mctrl_gpio_disable_ms(to_sci_port(port)->gpios);
+	mctrl_gpio_disable_ms_sync(to_sci_port(port)->gpios);
 
 	uart_port_lock_irqsave(port, &flags);
 	sci_stop_rx(port);
diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 1ec5d8c3aef8ddbca615a149c2fe81c90c83a22b..4c97965ec43b30113a255661e6a64a6b476d7a9c 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -944,7 +944,7 @@ static void stm32_usart_enable_ms(struct uart_port *port)
 
 static void stm32_usart_disable_ms(struct uart_port *port)
 {
-	mctrl_gpio_disable_ms(to_stm32_port(port)->gpios);
+	mctrl_gpio_disable_ms_sync(to_stm32_port(port)->gpios);
 }
 
 /* Transmit stop */

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250213-atomic_sleep_mctrl_serial_gpio-885f6feb585b

Best regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


