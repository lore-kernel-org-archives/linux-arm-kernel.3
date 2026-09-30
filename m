Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BC7CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0WxQ39RjBcB1jrcYDrPxck7Uv6Hs0rmrCNtOSCLKE0g=; b=lnhOpNTNKPWulr73CZAxg0JvJm
	2IaKgZOuZYPIGyx3LcG/Xe+5K4nlB5ju9JEQM1+mP4diAZsV6B1jwmUDsCbBL0ibSZnxjPFVeokia
	wHNd1ojXumA2xjGkAlZXlXNb1bTzlNE9WQ5KbENc6R1kzlXksdF6uqnQeHfOGlPl8HaKHeW33hIWj
	Hwvo5uoHe8uZkz/m1wv4ShYl3oPk6CoHw0XHTeXhEhq+4SkW1wiPcYFgs37HsA0Qlf9rtx+xngnrg
	6MdnJgT14hgLEfTv6IW/jfSH4fr++I7YGQ0wD7yt6A0v64EGAAlC0kQKy9ppfUPSoQ7UNWr72kigc
	hpGdKFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtrQ-000000064Cr-0gIQ;
	Wed, 30 Sep 2026 12:56:36 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtrM-000000064BS-0Fw8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:56:34 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485984ebf5cso4286991f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1790772989; x=1791377789; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WxQ39RjBcB1jrcYDrPxck7Uv6Hs0rmrCNtOSCLKE0g=;
        b=DcGiHfLbCoOSFKF8B10owCkmtzcP1r7hv3GScyFCZj+vSD3M2Tb754+XMrubNufxvL
         E9KBF8ByIeu5oTCpdgZjdjfa4ZgWe8Zs8TZ4c7cWtMJhZclZg+68rgLHWFiMQkszSwS7
         5xPgjt0PxviyzXAp+5XWZd/epQy7lbDbDttmZJ6UrbjqEf2783gaToVnhuX77Pc3OduI
         rgESUxu65qpQGKOM57cCl4HS68PnUyRJfGPVOi+O4RP5mWsw0LsW6LC7IH1J622Na2d4
         YdvUBpn6uqu44AqdrIhWTD4mmjRNvlYXx2VLjTBm6Fm+E47uum2EqOt9OuAKPF30AX3R
         2hnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772989; x=1791377789;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0WxQ39RjBcB1jrcYDrPxck7Uv6Hs0rmrCNtOSCLKE0g=;
        b=vBK+9tphAtd1s//7RqXiOEaK1Cu5KxncIZgHW2xGnpw47/irDYjkJYlmb6lPnwiusG
         uIdN5NGUa1FZFXWtvCcfE27e4UXUKqvjytQSm+fSFO9RV1fIh3673SdTGrkvzkzlz1NU
         Agu+8KQzZPqA+rbGAriGup9u24iCiInax0KT6fBNvn6JSe0vCdo8CGLRcvNDY/gOIGEF
         Qil8K3ahh+8xjkPN7hzOvZVmPOfrfRnTB4nd4HAnxbexM3EPMI1UVfzSxaDm2jGQNfeQ
         ZgKxj8twYKPoSl6XCU/qGGM2cocPhUdXrzRalA/heXqmmGXm354svM3xDQN9CxLmGb45
         c24Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+1O2DpXKAyuCp5UmX1UfZHShGJYbap+18pAbtINbJ9cKFwA/2tj5LPrP8pc0pYUiOOEwmFd4gvtObNwyVaLjt@lists.infradead.org
X-Gm-Message-State: AFq9FYLIo5wjLqg0MS89T1pVeGuhtzjh/N60Gc728hFB5wrGmR+0g5vh
	MnosRI8a+SksnElXAkPayCn6wfM6G1e42OkM8dV2uoVW1mnLaX0k1BcDtpRwMyHQ0/qbFX4qLl6
	RBZLuDBg=
X-Gm-Gg: AYBFou0+Xx6Olm7wfsbTcXzXuSgI3ZvBsonInLSgegfd0A3DexHLLcG5fbflsip2vu/
	XVlKKDC5eoHnwZP0KHEP85rmWdlw8g/EaHTM+C/KVomprw5zf1vuPsEZWKNxVAFbium2DZgjWhk
	m4yStdkXJNBjVGgaocbSKMD3x4JAiaAEu8XQP6uiTrIeLqMRMNNGaghxTpaMEJtOjGKAokRRQ7R
	7IW7qJNXkBnFAXGHW7dtAKPPbHDGVxLEad4boOFApDeMPHOg8F+PEXvcHSVMroT00unVkQ3xR5V
	oYVPnh0djpAIwseCkBklg+VI554GmkTybsqi1A4el4ucMVBHsrznnjkfFJXReC2208fG5LN276h
	zGwhIvtLnudNbDg2xq3Wta3C38SiPrQvtitAiHY10G2MbllyPHfQvHUSoqsBWnbdMFm+9E2Ag/5
	qX9VdIKDz0rfhhxJE8egvyso5ldHLTbOEoM9pYLgLUpl/oH9614eaqACMa9+8ceHqEkshN4VOm5
	1hiUvV4/ky1rGH8aOTDU2jxvyBJKyexhcsfkmDAK7T8i+vei5MqB56y3Js=
X-Received: by 2002:a05:6000:3c7:b0:487:94b:2262 with SMTP id ffacd0b85a97d-48b02546709mr2648253f8f.52.1790772989518;
        Wed, 30 Sep 2026 05:56:29 -0700 (PDT)
Received: from krabice.lan ([2a02:8308:5084:6400:9c5f:33da:d2c3:ec96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm3567025f8f.12.2026.09.30.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:56:28 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com
Cc: phil@raspberrypi.com,
	stefan@agner.ch,
	bcm-kernel-feedback-list@broadcom.com,
	linux-serial@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Subject: [PATCH v2] serial: 8250_bcm2835aux: Add support for RTS/CTS auto flow control
Date: Wed, 30 Sep 2026 14:56:20 +0200
Message-ID: <20260930125620.221836-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_055632_163844_12B0E68C 
X-CRM114-Status: GOOD (  29.07  )
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

- Gate the AUTORTS function on TIOCM_RTS in set_mctrl() so that clearing
  RTS (port close, TIOCMBIC, B0) actually de-asserts the pin while auto
  flow control is active.

- Implement throttle()/unthrottle() by disabling the RX interrupts and
  letting the FIFO fill up, making the hardware de-assert RTS - the same
  approach as in 8250_omap. Re-sync this state on termios and rs485
  changes, as those paths may re-enable the RX interrupts (or leave them
  disabled) behind the throttle's back.

- Never enable auto flow control together with rs485, which uses RTS as
  the transceiver direction control. As the software CTS fallback of the
  serial core cannot work without a modem status interrupt, strip
  CRTSCTS whenever it cannot be handled in hardware. Keep it when a CTS
  GPIO is present, as the serial core's mctrl_gpio handling then
  delivers the interrupt and the software fallback keeps working.

- Restore RXEN when rs485 is disabled, as the emulation may be torn down
  without the rs485_stop_tx() callback ever being called, which would
  leave the receiver disabled.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jan Čermák <sairon@sairon.cz>
---

Notes:
    v2:
    - Keep CRTSCTS when a CTS GPIO is configured on the port, so the
      serial core's GPIO-driven software CTS fallback keeps working
      [Sashiko]
    - Take a tty reference with tty_port_tty_get() in
      bcm2835aux_tty_throttled() [Sashiko]
    
    v1: https://lore.kernel.org/r/cover.1786030659.git.sairon@sairon.cz

 drivers/tty/serial/8250/8250_bcm2835aux.c | 171 +++++++++++++++++++++-
 1 file changed, 167 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c b/drivers/tty/serial/8250/8250_bcm2835aux.c
index 0609582a62f7..5b32448885ce 100644
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
@@ -46,6 +59,150 @@ struct bcm2835aux_data {
 	u32 cntl;
 };
 
+static bool bcm2835aux_tty_throttled(struct uart_port *port)
+{
+	struct tty_struct *tty;
+	bool throttled;
+
+	if (!port->state)
+		return false;
+
+	tty = tty_port_tty_get(&port->state->port);
+	throttled = tty && tty_throttled(tty);
+	tty_kref_put(tty);
+
+	return throttled;
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
+	struct uart_8250_port *up = up_to_u8250p(port);
+	bool hw_flow = (port->flags & UPF_HARD_FLOW) &&
+		       !(port->rs485.flags & SER_RS485_ENABLED);
+
+	/*
+	 * Strip CRTSCTS when the hardware auto flow-control cannot be
+	 * used, as the serial core's software CTS fallback cannot work
+	 * without a modem status interrupt. A CTS GPIO provides one.
+	 */
+	if (!hw_flow && !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_CTS))
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
@@ -99,7 +256,11 @@ static int bcm2835aux_serial_probe(struct platform_device *pdev)
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
@@ -134,6 +295,8 @@ static int bcm2835aux_serial_probe(struct platform_device *pdev)
 	ret = uart_read_port_properties(&up.port);
 	if (ret)
 		goto rm_swnode;
+	if (device_property_read_bool(&pdev->dev, "uart-has-rtscts"))
+		up.port.flags |= UPF_HARD_FLOW;
 
 	up.port.regshift = 2;
 	up.port.fifosize = 8;

base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.55.0


