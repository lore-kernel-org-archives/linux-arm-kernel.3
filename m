Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBDFC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GZuBKa5ESBM1sRTvDk7zO5q8SVteXo+V4m4gZSpseg=; b=RCnqyXCv+sEJm+tbLAJKk79e0W
	7LVcuYz21RNf78IuO1igd3/G1hVsD9YSi0MLv+wzhv1ftxM042KHgIT3dr69h8LhacPLLjNVy9DXu
	1IHYgv3RqGRZ0y2YIxdAO0RWy22WuYI9JPepa9th5gcaGYN2rSdYZV6rhr+dePEliXx04ztccpbyd
	tFY0ITOZALIq++8MqLV/72REVsBCH6bvrFHK3gEY2xqZQSfm1bn29IcHUdL+zavbYyKQN4POU4tMx
	mcDfswDNsb3oEoV0u226IK9h5P9eTv3VFpw6K7ODF+HX7/dtO3XamRSohhbcYcunQ2kZoyof0m+BQ
	tymWcr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Ej-0000000681F-11vm;
	Thu, 06 Aug 2026 15:42:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Eg-000000067ys-00d6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 15:42:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-495590dde14so27055605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1786030940; x=1786635740; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GZuBKa5ESBM1sRTvDk7zO5q8SVteXo+V4m4gZSpseg=;
        b=Jh7hcHNzNNdjwQHwb8r5w/93xLnGKC2jZG991GuV2yyDvqoxEB/vqYC6D6MnQiauqw
         a9NlPqL/SXIWGisvL1JQtMr3N1OjWcJglamxaL645MwQgEWCNDWBt4pmLSdDTraNZO+X
         5pBxKGHW+nwH1WjH5qLdDemF1w891iGAqg3M5Zp06oVqAxeUJlJGx7YFfunDA6CSaj6R
         /rw/MzSKL/CKmXjcOojcRt8/tudeg48IbzbIrtkQmFWn/tIzZazlu5nal5TvdEmxAYwt
         5fvedsiN4bIOwKkCuPNzGZSX7lVP/cZLIxupPCFnf2rIzcuBGLA8xqyCZk5wLyZLVE/C
         RZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030940; x=1786635740;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GZuBKa5ESBM1sRTvDk7zO5q8SVteXo+V4m4gZSpseg=;
        b=dRjYroj7i5Wz0CXGNrR/H8FxwaHnPVshdOp2PP4qcBEskqedPLPghY77EoxGQMtkoS
         IFijh1lE/NsjmCgeJcLj5d/uQdpnSvp8egWYcSEq1F6CALAigdedG6YJq8Guejx1eNRC
         zEQp6Vksjsspj+iFg7Ezez7+bcb6zLc/wnCM0RreyaxkWaGJMqGY2+lyI5k5U7f5FrxG
         BZaZOmbtrU+2Pp1i22dvtBh+Q8ggA9+wgtmoiLCwBFPf4nCQlGLEe6InkdmhYYIQhLZz
         Xmx4KDq4QfsQittEJe31bt216eo/1qz5EUB+VZV8GksD2GuUm/kdnLpD114ZmbbFFuSp
         VdxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHqSRqJNIh5GKNDQ2mrOXCz8BHYkfGmo+4jpUDfs2kC0Q6SKs2Ko5U+8v20RHeUOIPRy2E0Rlah3BMgE3MLtVv@lists.infradead.org
X-Gm-Message-State: AOJu0YxWZnQL7onXtD86jLOSpE0xfjaCYNZlcrmDeoSoEJAZNA6959Gl
	7rnyYJ7+G8jwTY2PdzrF49NtH+Msz2AYhUlJJsgdA/yNe4XDr/FW95oY+CXJa2PzA/8=
X-Gm-Gg: AR+sD12Oy3zZbjjEaokiPwfFp0mdsYabHokXYO8OsskZjvapA1mofJsVTbiEz5Myzyx
	YEVgfcgMp0RMso0G2FUJh61UIVLZBjIVcOgs2u0RRIl6NgIwUeD+odH18f7pbAG7aR2At1xdsUm
	IzQx9SGJaX0las/0O7/Nn2xmxg4neofPSquc99xztId+8mfUzQSi1Dc2K8OEkhSvIqp13twwt6i
	trBtdaDeOXcnMTKgNf+QQkQ31F9vGBTZrbBUy65JG+2wBnh2bxbOUfMG8S8a+KQFTzxNJU3PZ6m
	1pO4I5TkI2epk/Xlok177OXwoZAA5UKucmW6niG13laYTGIUDHpE7VFMMUOBcD0UQsnw4VXU2Si
	Y97GJ2meRlbZHYtoBtb4qWWIC94SdwRmhg8nR3cyC4lINLSrpj+/Fbr0cmkuiRbcA2hR9i9MbOi
	SIid2WFsCtgSroXXfKaC/faT8RA//uoqakE0QgJP3xUJ5opOIIeBRJMiEJ10K4Lci5+TpDmHqbB
	JXAEjdb3kZoEk/x5x8iSo/7lLqMARl3pVV6k6CQDnlNgSZ5Qt+Mg+evoZjPMPTYxP7dgI4gJ3xx
	QNZ+hTW+ccAclMuYY09b8H3H
X-Received: by 2002:a05:600c:c043:b0:495:7a5a:d96c with SMTP id 5b1f17b1804b1-4994e7d89cfmr172359555e9.18.1786030939373;
        Thu, 06 Aug 2026 08:42:19 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b25c01sm6605380f8f.29.2026.08.06.08.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 08:42:18 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
	phil@raspberrypi.com,
	stefan@agner.ch,
	bcm-kernel-feedback-list@broadcom.com,
	linux-serial@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] serial: 8250_bcm2835aux: Add support for RTS/CTS auto flow control
Date: Thu,  6 Aug 2026 17:42:04 +0200
Message-ID: <7e5ed3fb37ee4e113706c258d792121b868861a9.1786030659.git.sairon@sairon.cz>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786030659.git.sairon@sairon.cz>
References: <cover.1786030659.git.sairon@sairon.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_084222_090335_CE234AD5 
X-CRM114-Status: GOOD (  28.71  )
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

The bcm2835aux mini UART can automatically de-assert RTS based on the RX
FIFO fill level and gate the transmitter on CTS, but the driver never
made use of it. Wire it up:

- Enable AUTORTS/AUTOCTS (with the RTS4 threshold and inverted, i.e.
  conventional active-low, polarity) whenever CRTSCTS is set on ports
  declaring the "uart-has-rtscts" property, advertised via
  UPF_HARD_FLOW.

- Gate the AUTORTS function on TIOCM_RTS in set_mctrl() so that
  clearing RTS (port close, TIOCMBIC, B0) actually de-asserts the pin
  while auto flow control is active.

- Implement throttle()/unthrottle() by disabling the RX interrupts and
  letting the FIFO fill up, making the hardware de-assert RTS - the
  same approach as in 8250_omap. Re-sync this state on termios and
  rs485 changes, as those paths may re-enable the RX interrupts (or
  leave them disabled) behind the throttle's back.

- Never enable auto flow control together with rs485, which uses RTS
  as the transceiver direction control. As the software CTS fallback
  of the serial core cannot work without a modem status interrupt,
  strip CRTSCTS whenever it cannot be handled in hardware.

- Restore RXEN when rs485 is disabled, as the emulation may be torn
  down without the rs485_stop_tx() callback ever being called, which
  would leave the receiver disabled.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jan Čermák <sairon@sairon.cz>
---
 drivers/tty/serial/8250/8250_bcm2835aux.c | 160 +++++++++++++++++++++-
 1 file changed, 156 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c b/drivers/tty/serial/8250/8250_bcm2835aux.c
index 0609582a62f7..cf9cf08ddb17 100644
--- a/drivers/tty/serial/8250/8250_bcm2835aux.c
+++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
@@ -7,9 +7,9 @@
  * Based on 8250_lpc18xx.c:
  * Copyright (C) 2015 Joachim Eastwood <manabian@gmail.com>
  *
- * The bcm2835aux is capable of RTS auto flow-control, but this driver doesn't
- * take advantage of it yet.  When adding support, be sure not to enable it
- * simultaneously to rs485.
+ * The bcm2835aux's RTS/CTS auto flow-control is enabled for ports declaring
+ * the "uart-has-rtscts" property, but never simultaneously to rs485, which
+ * repurposes RTS as the transceiver direction control.
  */
 
 #include <linux/clk.h>
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/tty.h>
 
 #include "8250.h"
 
@@ -34,6 +35,18 @@
 #define BCM2835_AUX_UART_CNTL_RTSINV	0x40 /* Invert auto RTS polarity */
 #define BCM2835_AUX_UART_CNTL_CTSINV	0x80 /* Invert auto CTS polarity */
 
+/*
+ * Set auto RTS to de-assert with 4 FIFO slots left (RTS4).
+ *
+ * The RTSINV/CTSINV bits select the auto flow assert level, which out of
+ * reset is active-high. Set them to get the conventional active-low RTS/CTS.
+ */
+#define BCM2835_AUX_UART_CNTL_AUTORTS_MASK \
+	(BCM2835_AUX_UART_CNTL_AUTORTS | BCM2835_AUX_UART_CNTL_RTS4 | \
+	 BCM2835_AUX_UART_CNTL_RTSINV)
+#define BCM2835_AUX_UART_CNTL_AUTOCTS_MASK \
+	(BCM2835_AUX_UART_CNTL_AUTOCTS | BCM2835_AUX_UART_CNTL_CTSINV)
+
 /**
  * struct bcm2835aux_data - driver private data of BCM2835 auxiliary UART
  * @clk: clock producer of the port's uartclk
@@ -46,6 +59,139 @@ struct bcm2835aux_data {
 	u32 cntl;
 };
 
+static bool bcm2835aux_tty_throttled(struct uart_port *port)
+{
+	struct tty_struct *tty = port->state ? port->state->port.tty : NULL;
+
+	return tty && tty_throttled(tty);
+}
+
+/* Program the CNTL auto flow bits from port->status and mctrl */
+static void bcm2835aux_update_flow(struct uart_port *port, unsigned int mctrl)
+{
+	struct bcm2835aux_data *data = dev_get_drvdata(port->dev);
+	struct uart_8250_port *up = up_to_u8250p(port);
+
+	data->cntl &= ~(BCM2835_AUX_UART_CNTL_AUTORTS_MASK |
+			BCM2835_AUX_UART_CNTL_AUTOCTS_MASK);
+	if ((port->status & UPSTAT_AUTORTS) && (mctrl & TIOCM_RTS))
+		data->cntl |= BCM2835_AUX_UART_CNTL_AUTORTS_MASK;
+	if (port->status & UPSTAT_AUTOCTS)
+		data->cntl |= BCM2835_AUX_UART_CNTL_AUTOCTS_MASK;
+
+	serial_out(up, BCM2835_AUX_UART_CNTL, data->cntl);
+}
+
+static void bcm2835aux_enable_rx_irq(struct uart_port *port)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+
+	up->ier |= UART_IER_RLSI | UART_IER_RDI;
+	serial_out(up, UART_IER, up->ier);
+}
+
+static void bcm2835aux_set_autoflow(struct uart_port *port, tcflag_t cflag,
+				    bool rs485_enabled)
+{
+	bool was_enabled = port->status & UPSTAT_AUTORTS;
+	bool enable;
+
+	/*
+	 * rs485 uses RTS as the transceiver direction control, which is
+	 * mutually exclusive with the auto flow-control of the pin.
+	 */
+	enable = (cflag & CRTSCTS) && (port->flags & UPF_HARD_FLOW) &&
+		 !rs485_enabled;
+
+	if (enable) {
+		port->status |= UPSTAT_AUTORTS | UPSTAT_AUTOCTS;
+		/* Restore the throttle state lost in startup/resume/rs485 paths */
+		if (bcm2835aux_tty_throttled(port)) {
+			/* let the FIFO fill up and de-assert RTS in hardware */
+			port->ops->stop_rx(port);
+			/* reclaim an RTS lowered by software flow control */
+			if ((cflag & CBAUD) != B0)
+				port->mctrl |= TIOCM_RTS;
+		}
+	} else {
+		port->status &= ~(UPSTAT_AUTORTS | UPSTAT_AUTOCTS);
+		/* unthrottle() will no longer be called after leaving auto-RTS mode */
+		if (was_enabled)
+			bcm2835aux_enable_rx_irq(port);
+	}
+
+	bcm2835aux_update_flow(port, port->mctrl);
+}
+
+static void bcm2835aux_set_mctrl(struct uart_port *port, unsigned int mctrl)
+{
+	serial8250_do_set_mctrl(port, mctrl);
+	bcm2835aux_update_flow(port, mctrl);
+}
+
+static void bcm2835aux_set_termios(struct uart_port *port,
+				   struct ktermios *termios,
+				   const struct ktermios *old)
+{
+	/*
+	 * Strip CRTSCTS when the hardware auto flow-control cannot be
+	 * used, as the serial core's software CTS fallback cannot work
+	 * without a modem status interrupt.
+	 */
+	if (!(port->flags & UPF_HARD_FLOW) ||
+	    (port->rs485.flags & SER_RS485_ENABLED))
+		termios->c_cflag &= ~CRTSCTS;
+
+	serial8250_do_set_termios(port, termios, old);
+
+	guard(uart_port_lock_irqsave)(port);
+
+	bcm2835aux_set_autoflow(port, termios->c_cflag,
+				port->rs485.flags & SER_RS485_ENABLED);
+}
+
+static void bcm2835aux_throttle(struct uart_port *port)
+{
+	guard(uart_port_lock_irqsave)(port);
+
+	port->ops->stop_rx(port);
+}
+
+static void bcm2835aux_unthrottle(struct uart_port *port)
+{
+	guard(uart_port_lock_irqsave)(port);
+
+	bcm2835aux_enable_rx_irq(port);
+}
+
+static int bcm2835aux_rs485_config(struct uart_port *port,
+				   struct ktermios *termios,
+				   struct serial_rs485 *rs485)
+{
+	tcflag_t cflag = termios ? termios->c_cflag : 0;
+	bool rs485_enabled;
+	int ret;
+
+	ret = serial8250_em485_config(port, termios, rs485);
+	if (ret)
+		return ret;
+
+	rs485_enabled = rs485->flags & SER_RS485_ENABLED;
+	if (!rs485_enabled) {
+		struct bcm2835aux_data *data = dev_get_drvdata(port->dev);
+
+		data->cntl |= BCM2835_AUX_UART_CNTL_RXEN;
+	}
+
+	/*
+	 * termios is NULL when rs485 is set up from firmware properties at
+	 * port registration, before the port has been opened.
+	 */
+	bcm2835aux_set_autoflow(port, cflag, rs485_enabled);
+
+	return 0;
+}
+
 static void bcm2835aux_rs485_start_tx(struct uart_8250_port *up, bool toggle_ier)
 {
 	if (!(up->port.rs485.flags & SER_RS485_RX_DURING_TX)) {
@@ -99,7 +245,11 @@ static int bcm2835aux_serial_probe(struct platform_device *pdev)
 	up.port.dev = &pdev->dev;
 	up.port.type = PORT_16550;
 	up.port.flags = UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_SKIP_TEST | UPF_IOREMAP;
-	up.port.rs485_config = serial8250_em485_config;
+	up.port.set_termios = bcm2835aux_set_termios;
+	up.port.set_mctrl = bcm2835aux_set_mctrl;
+	up.port.throttle = bcm2835aux_throttle;
+	up.port.unthrottle = bcm2835aux_unthrottle;
+	up.port.rs485_config = bcm2835aux_rs485_config;
 	up.port.rs485_supported = serial8250_em485_supported;
 	up.rs485_start_tx = bcm2835aux_rs485_start_tx;
 	up.rs485_stop_tx = bcm2835aux_rs485_stop_tx;
@@ -134,6 +284,8 @@ static int bcm2835aux_serial_probe(struct platform_device *pdev)
 	ret = uart_read_port_properties(&up.port);
 	if (ret)
 		goto rm_swnode;
+	if (device_property_read_bool(&pdev->dev, "uart-has-rtscts"))
+		up.port.flags |= UPF_HARD_FLOW;
 
 	up.port.regshift = 2;
 	up.port.fifosize = 8;
-- 
2.55.0


