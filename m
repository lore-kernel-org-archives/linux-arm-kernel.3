Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A522C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ue24pFg1jyCcA3ws3iASJJ7hGXge2yixLdFycY9/Sno=; b=lTj0uxn4LQAAPf8hHoaZ3SuWA8
	ksYRafATnIWErtxkyPLmtiZH+AxwVzb92rIi0PHLGOOTiprdGjP8ZPP0/quoCfA/bQ0zIExTL3as0
	IFfoouRG2UUUlHMPs11RWcjooKkp6zGmRza3Bi+lmaFDR9o5YoIIgRMO+WxaBXUDUbE0mV8gHsNSx
	jZa+8ufuw0w3n8zMi8oOXj/92gHaRTbjlGAg7/1mMmoVUm809JRwCEAVzQtS+X7HznE6j86tJnMm2
	cIvZ7g0sBgx+cDD0JIigSYtfawgMcu3DFLz/XuvfjuJwXuAz5Kmv4MZNHnvxRcixBInnK+u+gB3TH
	Uufq8nTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRX8i-00000007WF2-2tc6;
	Tue, 17 Jun 2025 14:18:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWcj-00000007P6e-4AY0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:45:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so45729065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167912; x=1750772712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ue24pFg1jyCcA3ws3iASJJ7hGXge2yixLdFycY9/Sno=;
        b=K0jCabXSF2Ul5N/QW76C2a3qpt0yYiCiqSAeVcat5iDS4uffN8rvg/xV3POtc+5Ott
         1wC9WgDopLwyDNU1t/RCDLbWdNdRI4VsMIaqLn/U7yvb9CrtfH0Ovn+AcKZcrcSRaxwl
         Y8AkRPiUJN25wFCQhYVmdoA9wILA2OoAJAhq7oVYunsMzKS8X1WD+sIk4n2YS8s3Siw1
         CABHmMvTLmP3vQNpiCn2ACeqgpdSWocMleJVugTy9ip4OYTI7kfm3tjtouTcc04i6BNM
         F0qAet7Cg6+mylAHuK+s5fV5PqR9bcVU0fS0jfbhNpwA6xH/9XdTJQtvqDn4U838BvMN
         f68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167912; x=1750772712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ue24pFg1jyCcA3ws3iASJJ7hGXge2yixLdFycY9/Sno=;
        b=IAgSi8eRqoOgPQu2bv7zHgBpPZYEj0z39/jEX1u5BVh184EWlyZGGTYQQ33C0rj3Hf
         pHj8klqkApyT6YoQrPQIyj3kzz7RItpvKFNYUKVOyCtzcBCUULMC5SeEKBcSA+XQqsww
         WntJvuo3/thpHbYvS2A8iWVMvulMAkWZ0AGf7wLeK0tn5w8cXDbvkrDXTcP6FXNBwcrb
         vmW/SRGv3HCifT2x7KsfZjskujXl6FNjKlwrRZd4GnwDyiwxj2bwOhSP7HTI2OosUxia
         ATfy0J1Vmc5/ZDr1Bv4M8G/0Ml8TOEMjAY+f5vj3jj00LrvgA5+dQecHVI0/Bq7bcDib
         cohQ==
X-Gm-Message-State: AOJu0YyCspsJItUqFOjWUznDBosM6VJhnHUUMp5b2T6/6XdNibe16R87
	WYCJSEGpJJ8a7WNeLS45+uOE6V6gE5u7ko5/0+SbJbna1+yLNIFY38HM
X-Gm-Gg: ASbGncvRT9t26ebBFL7frubfFhdQYaYnEarmZ7FpraZuxLWgAuwet6rSEbotyZhS7o7
	CXjKi33Nv9NFM14eu7MigjNXns1ULrn5Nn8ZoA/Woa2tzTGAWOTY12G/haA8vVdwJt+fzTOjxLA
	QksFJvkWMMS2Oddviw/Kft6DUMzpv+lUWx4Y3LgMCpSPwph3Ce5QUaI3omF06fif1AIG7IMiDlV
	zBTMEO6rLotgJO7q0VksFSjDiz/9FVGZLNkvtzE0GbBfYVR3XN6LKL2dKM2Zj/F6Ay0i2sifOIv
	8FL80uzSG8/yARYxpt2zNDoYBbv/0LC3UiVGkYW+Tw6d+zY90pJgGerDVY9hHAeJN2p+gNHU1Xx
	KXuV+tpqz3HI=
X-Google-Smtp-Source: AGHT+IE1aoKv5a09Io8oJ6CkBijarpobW2t/y2akd9EWBr6yVYZ0/zauEgqPBA+P5aXKXLLpPLEZ4g==
X-Received: by 2002:a05:6000:2f88:b0:3a5:1360:6b34 with SMTP id ffacd0b85a97d-3a56d7bacfdmr12201555f8f.2.1750167912192;
        Tue, 17 Jun 2025 06:45:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 5/7] serial: sh-sci: Use private port ID
Date: Tue, 17 Jun 2025 14:45:02 +0100
Message-ID: <20250617134504.126313-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_064514_052053_ECBCCB3D 
X-CRM114-Status: GOOD (  25.39  )
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

From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

New port types cannot be added in serial_core.h, which is shared with
userspace.
In order to support new port types, the coming new ones will have
BIT(7) set in the id value, and in this case, uartport->type is
set to PORT_GENERIC.
This commit therefore changes all the places where the port type is
read, by not relying on uartport->type but on the private
value stored in struct sci_port.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci-common.h |   3 +
 drivers/tty/serial/sh-sci.c        | 159 ++++++++++++++++-------------
 2 files changed, 92 insertions(+), 70 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index bd9d9cfac1c8..fcddf66780c9 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -142,6 +142,9 @@ struct sci_port {
 	int				rx_fifo_timeout;
 	u16				hscif_tot;
 
+	u8				type;
+	u8				regtype;
+
 	const struct sci_port_ops *ops;
 
 	bool has_rtscts;
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 5c4283ce542d..aca2b89802bc 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -75,6 +75,8 @@
 
 #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
 
+#define SCI_PUBLIC_PORT_ID(port) (((port) & BIT(7)) ? PORT_GENERIC : (port))
+
 static struct sci_port sci_ports[SCI_NPORTS];
 static unsigned long sci_ports_in_use;
 static struct uart_driver sci_uart_driver;
@@ -580,7 +582,7 @@ static void sci_start_tx(struct uart_port *port)
 	unsigned short ctrl;
 
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 		u16 new, scr = sci_serial_in(port, SCSCR);
 		if (s->chan_tx)
 			new = scr | SCSCR_TDRQE;
@@ -592,7 +594,7 @@ static void sci_start_tx(struct uart_port *port)
 
 	if (s->chan_tx && !kfifo_is_empty(&port->state->port.xmit_fifo) &&
 	    dma_submit_error(s->cookie_tx)) {
-		if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
+		if (s->regtype == SCIx_RZ_SCIFA_REGTYPE)
 			/* Switch irq from SCIF to DMA */
 			disable_irq_nosync(s->irqs[SCIx_TXI_IRQ]);
 
@@ -601,8 +603,8 @@ static void sci_start_tx(struct uart_port *port)
 	}
 #endif
 
-	if (!s->chan_tx || s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE ||
-	    port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	if (!s->chan_tx || s->regtype == SCIx_RZ_SCIFA_REGTYPE ||
+	    s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 		/* Set TIE (Transmit Interrupt Enable) bit in SCSCR */
 		ctrl = sci_serial_in(port, SCSCR);
 
@@ -611,7 +613,7 @@ static void sci_start_tx(struct uart_port *port)
 		 * (transmit interrupt enable) or in the same instruction to start
 		 * the transmit process.
 		 */
-		if (port->type == PORT_SCI)
+		if (s->type == PORT_SCI)
 			ctrl |= SCSCR_TE;
 
 		sci_serial_out(port, SCSCR, ctrl | SCSCR_TIE);
@@ -620,12 +622,13 @@ static void sci_start_tx(struct uart_port *port)
 
 static void sci_stop_tx(struct uart_port *port)
 {
+	struct sci_port *s = to_sci_port(port);
 	unsigned short ctrl;
 
 	/* Clear TIE (Transmit Interrupt Enable) bit in SCSCR */
 	ctrl = sci_serial_in(port, SCSCR);
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB)
 		ctrl &= ~SCSCR_TDRQE;
 
 	ctrl &= ~SCSCR_TIE;
@@ -633,21 +636,22 @@ static void sci_stop_tx(struct uart_port *port)
 	sci_serial_out(port, SCSCR, ctrl);
 
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
-	if (to_sci_port(port)->chan_tx &&
-	    !dma_submit_error(to_sci_port(port)->cookie_tx)) {
-		dmaengine_terminate_async(to_sci_port(port)->chan_tx);
-		to_sci_port(port)->cookie_tx = -EINVAL;
+	if (s->chan_tx &&
+	    !dma_submit_error(s->cookie_tx)) {
+		dmaengine_terminate_async(s->chan_tx);
+		s->cookie_tx = -EINVAL;
 	}
 #endif
 }
 
 static void sci_start_rx(struct uart_port *port)
 {
+	struct sci_port *s = to_sci_port(port);
 	unsigned short ctrl;
 
 	ctrl = sci_serial_in(port, SCSCR) | port_rx_irq_mask(port);
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB)
 		ctrl &= ~SCSCR_RDRQE;
 
 	sci_serial_out(port, SCSCR, ctrl);
@@ -655,11 +659,12 @@ static void sci_start_rx(struct uart_port *port)
 
 static void sci_stop_rx(struct uart_port *port)
 {
+	struct sci_port *s = to_sci_port(port);
 	unsigned short ctrl;
 
 	ctrl = sci_serial_in(port, SCSCR);
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB)
 		ctrl &= ~SCSCR_RDRQE;
 
 	ctrl &= ~port_rx_irq_mask(port);
@@ -669,10 +674,12 @@ static void sci_stop_rx(struct uart_port *port)
 
 static void sci_clear_SCxSR(struct uart_port *port, unsigned int mask)
 {
-	if (port->type == PORT_SCI) {
+	struct sci_port *s = to_sci_port(port);
+
+	if (s->type == PORT_SCI) {
 		/* Just store the mask */
 		sci_serial_out(port, SCxSR, mask);
-	} else if (to_sci_port(port)->params->overrun_mask == SCIFA_ORER) {
+	} else if (s->params->overrun_mask == SCIFA_ORER) {
 		/* SCIFA/SCIFB and SCIF on SH7705/SH7720/SH7721 */
 		/* Only clear the status bits we want to clear */
 		sci_serial_out(port, SCxSR, sci_serial_in(port, SCxSR) & mask);
@@ -742,13 +749,13 @@ static void sci_init_pins(struct uart_port *port, unsigned int cflag)
 		return;
 	}
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 		u16 data = sci_serial_in(port, SCPDR);
 		u16 ctrl = sci_serial_in(port, SCPCR);
 
 		/* Enable RXD and TXD pin functions */
 		ctrl &= ~(SCPCR_RXDC | SCPCR_TXDC);
-		if (to_sci_port(port)->has_rtscts) {
+		if (s->has_rtscts) {
 			/* RTS# is output, active low, unless autorts */
 			if (!(port->mctrl & TIOCM_RTS)) {
 				ctrl |= SCPCR_RTSC;
@@ -765,7 +772,7 @@ static void sci_init_pins(struct uart_port *port, unsigned int cflag)
 		}
 		sci_serial_out(port, SCPDR, data);
 		sci_serial_out(port, SCPCR, ctrl);
-	} else if (sci_getreg(port, SCSPTR)->size && s->cfg->regtype != SCIx_RZV2H_SCIF_REGTYPE) {
+	} else if (sci_getreg(port, SCSPTR)->size && s->regtype != SCIx_RZV2H_SCIF_REGTYPE) {
 		u16 status = sci_serial_in(port, SCSPTR);
 
 		/* RTS# is always output; and active low, unless autorts */
@@ -852,7 +859,7 @@ static void sci_transmit_chars(struct uart_port *port)
 			c = port->x_char;
 			port->x_char = 0;
 		} else if (stopped || !kfifo_get(&tport->xmit_fifo, &c)) {
-			if (port->type == PORT_SCI &&
+			if (s->type == PORT_SCI &&
 				   kfifo_is_empty(&tport->xmit_fifo)) {
 				ctrl = sci_serial_in(port, SCSCR);
 				ctrl &= ~SCSCR_TE;
@@ -873,7 +880,7 @@ static void sci_transmit_chars(struct uart_port *port)
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 	if (kfifo_is_empty(&tport->xmit_fifo)) {
-		if (port->type == PORT_SCI) {
+		if (s->type == PORT_SCI) {
 			ctrl = sci_serial_in(port, SCSCR);
 			ctrl &= ~SCSCR_TIE;
 			ctrl |= SCSCR_TEIE;
@@ -904,7 +911,7 @@ static void sci_receive_chars(struct uart_port *port)
 		if (count == 0)
 			break;
 
-		if (port->type == PORT_SCI) {
+		if (s->type == PORT_SCI) {
 			char c = sci_serial_in(port, SCxRDR);
 			if (uart_handle_sysrq_char(port, c))
 				count = 0;
@@ -914,8 +921,8 @@ static void sci_receive_chars(struct uart_port *port)
 			for (i = 0; i < count; i++) {
 				char c;
 
-				if (port->type == PORT_SCIF ||
-				    port->type == PORT_HSCIF) {
+				if (s->type == PORT_SCIF ||
+				    s->type == PORT_HSCIF) {
 					status = sci_serial_in(port, SCxSR);
 					c = sci_serial_in(port, SCxRDR);
 				} else {
@@ -1052,6 +1059,7 @@ static int sci_handle_breaks(struct uart_port *port)
 
 static int scif_set_rtrg(struct uart_port *port, int rx_trig)
 {
+	struct sci_port *s = to_sci_port(port);
 	unsigned int bits;
 
 	if (rx_trig >= port->fifosize)
@@ -1065,7 +1073,7 @@ static int scif_set_rtrg(struct uart_port *port, int rx_trig)
 		return rx_trig;
 	}
 
-	switch (port->type) {
+	switch (s->type) {
 	case PORT_SCIF:
 		if (rx_trig < 4) {
 			bits = 0;
@@ -1150,7 +1158,7 @@ static ssize_t rx_fifo_trigger_store(struct device *dev,
 		return ret;
 
 	sci->rx_trigger = sci->ops->set_rtrg(port, r);
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+	if (sci->type == PORT_SCIFA || sci->type == PORT_SCIFB)
 		sci->ops->set_rtrg(port, 1);
 
 	return count;
@@ -1166,7 +1174,7 @@ static ssize_t rx_fifo_timeout_show(struct device *dev,
 	struct sci_port *sci = to_sci_port(port);
 	int v;
 
-	if (port->type == PORT_HSCIF)
+	if (sci->type == PORT_HSCIF)
 		v = sci->hscif_tot >> HSSCR_TOT_SHIFT;
 	else
 		v = sci->rx_fifo_timeout;
@@ -1188,7 +1196,7 @@ static ssize_t rx_fifo_timeout_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (port->type == PORT_HSCIF) {
+	if (sci->type == PORT_HSCIF) {
 		if (r < 0 || r > 3)
 			return -EINVAL;
 		sci->hscif_tot = r << HSSCR_TOT_SHIFT;
@@ -1229,11 +1237,11 @@ static void sci_dma_tx_complete(void *arg)
 		schedule_work(&s->work_tx);
 	} else {
 		s->cookie_tx = -EINVAL;
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
-		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+		if (s->type == PORT_SCIFA || s->type == PORT_SCIFB ||
+		    s->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 			u16 ctrl = sci_serial_in(port, SCSCR);
 			sci_serial_out(port, SCSCR, ctrl & ~SCSCR_TIE);
-			if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+			if (s->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 				/* Switch irq from DMA to SCIF */
 				dmaengine_pause(s->chan_tx_saved);
 				enable_irq(s->irqs[SCIx_TXI_IRQ]);
@@ -1315,10 +1323,10 @@ static void sci_dma_rx_reenable_irq(struct sci_port *s)
 
 	/* Direct new serial port interrupts back to CPU */
 	scr = sci_serial_in(port, SCSCR);
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
-	    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB ||
+	    s->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 		enable_irq(s->irqs[SCIx_RXI_IRQ]);
-		if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
+		if (s->regtype == SCIx_RZ_SCIFA_REGTYPE)
 			s->ops->set_rtrg(port, s->rx_trigger);
 		else
 			scr &= ~SCSCR_RDRQE;
@@ -1558,8 +1566,8 @@ static enum hrtimer_restart sci_dma_rx_timer_fn(struct hrtimer *t)
 			tty_flip_buffer_push(&port->state->port);
 	}
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
-	    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB ||
+	    s->regtype == SCIx_RZ_SCIFA_REGTYPE)
 		sci_dma_rx_submit(s, true);
 
 	sci_dma_rx_reenable_irq(s);
@@ -1682,8 +1690,8 @@ static void sci_request_dma(struct uart_port *port)
 
 		s->chan_rx_saved = s->chan_rx = chan;
 
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
-		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
+		if (s->type == PORT_SCIFA || s->type == PORT_SCIFB ||
+		    s->regtype == SCIx_RZ_SCIFA_REGTYPE)
 			sci_dma_rx_submit(s, false);
 	}
 }
@@ -1753,10 +1761,10 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 		u16 ssr = sci_serial_in(port, SCxSR);
 
 		/* Disable future Rx interrupts */
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
-		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+		if (s->type == PORT_SCIFA || s->type == PORT_SCIFB ||
+		    s->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 			disable_irq_nosync(s->irqs[SCIx_RXI_IRQ]);
-			if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+			if (s->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 				s->ops->set_rtrg(port, 1);
 				scr |= SCSCR_RIE;
 			} else {
@@ -1820,7 +1828,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 	unsigned long flags;
 	u32 ctrl;
 
-	if (port->type != PORT_SCI)
+	if (s->type != PORT_SCI)
 		return sci_tx_interrupt(irq, ptr);
 
 	uart_port_lock_irqsave(port, &flags);
@@ -1867,7 +1875,7 @@ static irqreturn_t sci_er_interrupt(int irq, void *ptr)
 	}
 
 	/* Handle errors */
-	if (port->type == PORT_SCI) {
+	if (s->type == PORT_SCI) {
 		if (sci_handle_errors(port)) {
 			/* discard character in rx buffer */
 			sci_serial_in(port, SCxSR);
@@ -2091,7 +2099,9 @@ static unsigned int sci_tx_empty(struct uart_port *port)
 
 static void sci_set_rts(struct uart_port *port, bool state)
 {
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	struct sci_port *s = to_sci_port(port);
+
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 		u16 data = sci_serial_in(port, SCPDR);
 
 		/* Active low */
@@ -2118,7 +2128,9 @@ static void sci_set_rts(struct uart_port *port, bool state)
 
 static bool sci_get_cts(struct uart_port *port)
 {
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	struct sci_port *s = to_sci_port(port);
+
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 		/* Active low */
 		return !(sci_serial_in(port, SCPDR) & SCPDR_CTSD);
 	} else if (sci_getreg(port, SCSPTR)->size) {
@@ -2164,21 +2176,21 @@ static void sci_set_mctrl(struct uart_port *port, unsigned int mctrl)
 
 	if (!(mctrl & TIOCM_RTS)) {
 		/* Disable Auto RTS */
-		if (s->cfg->regtype != SCIx_RZV2H_SCIF_REGTYPE)
+		if (s->regtype != SCIx_RZV2H_SCIF_REGTYPE)
 			sci_serial_out(port, SCFCR,
 				       sci_serial_in(port, SCFCR) & ~SCFCR_MCE);
 
 		/* Clear RTS */
 		sci_set_rts(port, 0);
 	} else if (s->autorts) {
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+		if (s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 			/* Enable RTS# pin function */
 			sci_serial_out(port, SCPCR,
 				sci_serial_in(port, SCPCR) & ~SCPCR_RTSC);
 		}
 
 		/* Enable Auto RTS */
-		if (s->cfg->regtype != SCIx_RZV2H_SCIF_REGTYPE)
+		if (s->regtype != SCIx_RZV2H_SCIF_REGTYPE)
 			sci_serial_out(port, SCFCR,
 				       sci_serial_in(port, SCFCR) | SCFCR_MCE);
 	} else {
@@ -2315,7 +2327,7 @@ static int sci_sck_calc(struct sci_port *s, unsigned int bps,
 	int err, min_err = INT_MAX;
 	unsigned int sr;
 
-	if (s->port.type != PORT_HSCIF)
+	if (s->type != PORT_HSCIF)
 		freq *= 2;
 
 	for_each_sr(sr, s) {
@@ -2342,7 +2354,7 @@ static int sci_brg_calc(struct sci_port *s, unsigned int bps,
 	int err, min_err = INT_MAX;
 	unsigned int sr, dl;
 
-	if (s->port.type != PORT_HSCIF)
+	if (s->type != PORT_HSCIF)
 		freq *= 2;
 
 	for_each_sr(sr, s) {
@@ -2375,7 +2387,7 @@ static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
 	unsigned int sr, br, prediv, scrate, c;
 	int err, min_err = INT_MAX;
 
-	if (s->port.type != PORT_HSCIF)
+	if (s->type != PORT_HSCIF)
 		freq *= 2;
 
 	/*
@@ -2460,8 +2472,8 @@ static void sci_reset(struct uart_port *port)
 			s->ops->set_rtrg(port, 1);
 			timer_setup(&s->rx_fifo_timer, rx_fifo_timer_fn, 0);
 		} else {
-			if (port->type == PORT_SCIFA ||
-			    port->type == PORT_SCIFB)
+			if (s->type == PORT_SCIFA ||
+			    s->type == PORT_SCIFB)
 				s->ops->set_rtrg(port, 1);
 			else
 				s->ops->set_rtrg(port, s->rx_trigger);
@@ -2521,8 +2533,8 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	 */
 
 	/* Optional Undivided External Clock */
-	if (s->clk_rates[SCI_SCK] && port->type != PORT_SCIFA &&
-	    port->type != PORT_SCIFB) {
+	if (s->clk_rates[SCI_SCK] && s->type != PORT_SCIFA &&
+	    s->type != PORT_SCIFB) {
 		err = sci_sck_calc(s, baud, &srr1);
 		if (abs(err) < abs(min_err)) {
 			best_clk = SCI_SCK;
@@ -2607,7 +2619,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		sci_serial_out(port, SEMR, 0);
 
 	if (best_clk >= 0) {
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+		if (s->type == PORT_SCIFA || s->type == PORT_SCIFB)
 			switch (srr + 1) {
 			case 5:  smr_val |= SCSMR_SRC_5;  break;
 			case 7:  smr_val |= SCSMR_SRC_7;  break;
@@ -2692,12 +2704,12 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	 * (transmit interrupt enable) or in the same instruction to
 	 * start the transmitting process. So skip setting TE here for SCI.
 	 */
-	if (port->type != PORT_SCI)
+	if (s->type != PORT_SCI)
 		scr_val |= SCSCR_TE;
 	scr_val |= SCSCR_RE | (s->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0));
 	sci_serial_out(port, SCSCR, scr_val | s->hscif_tot);
 	if ((srr + 1 == 5) &&
-	    (port->type == PORT_SCIFA || port->type == PORT_SCIFB)) {
+	    (s->type == PORT_SCIFA || s->type == PORT_SCIFB)) {
 		/*
 		 * In asynchronous mode, when the sampling rate is 1/5, first
 		 * received data may become invalid on some SCIFA and SCIFB.
@@ -2741,7 +2753,9 @@ void sci_pm(struct uart_port *port, unsigned int state,
 
 static const char *sci_type(struct uart_port *port)
 {
-	switch (port->type) {
+	struct sci_port *s = to_sci_port(port);
+
+	switch (s->type) {
 	case PORT_IRDA:
 		return "irda";
 	case PORT_SCI:
@@ -2825,8 +2839,7 @@ void sci_config_port(struct uart_port *port, int flags)
 {
 	if (flags & UART_CONFIG_TYPE) {
 		struct sci_port *sport = to_sci_port(port);
-
-		port->type = sport->cfg->type;
+		port->type = SCI_PUBLIC_PORT_ID(sport->type);
 		sci_request_port(port);
 	}
 }
@@ -2964,7 +2977,7 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 	struct clk *clk;
 	unsigned int i;
 
-	if (sci_port->cfg->type == PORT_HSCIF)
+	if (sci_port->type == PORT_HSCIF)
 		clk_names[SCI_SCK] = "hsck";
 
 	for (i = 0; i < SCI_NUM_CLKS; i++) {
@@ -3050,6 +3063,9 @@ static int sci_init_single(struct platform_device *dev,
 
 	sci_port->cfg	= p;
 
+	sci_port->type	= p->type;
+	sci_port->regtype = p->regtype;
+
 	port->iotype	= UPIO_MEM;
 	port->line	= index;
 	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_SH_SCI_CONSOLE);
@@ -3128,11 +3144,11 @@ static int sci_init_single(struct platform_device *dev,
 			return ret;
 	}
 
-	port->type		= p->type;
+	port->type		= SCI_PUBLIC_PORT_ID(p->type);
 	port->flags		= UPF_FIXED_PORT | UPF_BOOT_AUTOCONF | p->flags;
 	port->fifosize		= sci_port->params->fifosize;
 
-	if (port->type == PORT_SCI && !dev->dev.of_node) {
+	if (p->type == PORT_SCI && !dev->dev.of_node) {
 		if (sci_port->reg_size >= 0x20)
 			port->regshift = 2;
 		else
@@ -3322,13 +3338,13 @@ static struct uart_driver sci_uart_driver = {
 
 static void sci_remove(struct platform_device *dev)
 {
-	struct sci_port *port = platform_get_drvdata(dev);
-	unsigned int type = port->port.type;	/* uart_remove_... clears it */
+	struct sci_port *s = platform_get_drvdata(dev);
+	unsigned int type = s->type;	/* uart_remove_... clears it */
 
-	sci_ports_in_use &= ~BIT(port->port.line);
-	uart_remove_one_port(&sci_uart_driver, &port->port);
+	sci_ports_in_use &= ~BIT(s->port.line);
+	uart_remove_one_port(&sci_uart_driver, &s->port);
 
-	if (port->port.fifosize > 1)
+	if (s->port.fifosize > 1)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
 	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
@@ -3682,8 +3698,8 @@ static int sci_probe(struct platform_device *dev)
 		if (ret)
 			return ret;
 	}
-	if (sp->port.type == PORT_SCIFA || sp->port.type == PORT_SCIFB ||
-	    sp->port.type == PORT_HSCIF) {
+	if (sp->type == PORT_SCIFA || sp->type == PORT_SCIFB ||
+	    sp->type == PORT_HSCIF) {
 		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 		if (ret) {
 			if (sp->port.fifosize > 1) {
@@ -3799,8 +3815,11 @@ int __init scix_early_console_setup(struct earlycon_device *device,
 	if (!device->port.membase)
 		return -ENODEV;
 
-	device->port.type = data->type;
+	device->port.type = SCI_PUBLIC_PORT_ID(data->type);
+
 	sci_ports[0].port = device->port;
+	sci_ports[0].type = data->type;
+	sci_ports[0].regtype = data->regtype;
 
 	port_cfg.type = data->type;
 	port_cfg.regtype = data->regtype;
-- 
2.49.0


