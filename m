Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148D2D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 10:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ryuX/qitU2BIwDF+E9hyeH8B+3/BmCHfNnTrdhmPIWU=; b=mntkMgG2pVUWIn3CHc5ToJJqHw
	vGdlAqygW93xdulIZBwtk8ytLABRlf6ENHIwmaJCZrt3fsZHXaA4eTXIRLEEO1OnuMsp5bW0atzuQ
	LP7f8hMhwx6jqw58gHr0bZI1XrFHbcYCeciQr82Y0eLiu5E0vx/3K/UFseMgGleMcg8uptMgDIyhs
	UEio6UZgRWppeJHw7/dgo1y0qDKxaOXQlp11WC2fs19tWzaZ0hzLi4h9bXP4CbByY6N+jpHJNyA+Y
	5qmEolaXsGcpeNyVdkqanlm3BGf4y3cOI3Tm1l5/3DhbwnsKI2x8cmWbuAtwAwrSFcyzkznWMcRXb
	AG6lRldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGkI-0000000CK12-13rJ;
	Sun, 21 Dec 2025 10:33:02 +0000
Received: from mail.elsta.tech ([194.150.96.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGkF-0000000CK0R-2aWz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 10:33:01 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.elsta.tech (Postfix) with ESMTP id 006E28C00C4;
	Sun, 21 Dec 2025 11:32:46 +0100 (CET)
Received: from mail.elsta.tech ([127.0.0.1])
 by localhost (mail.elsta.tech [127.0.0.1]) (amavis, port 10032) with ESMTP
 id FwUVyEzGZUEm; Sun, 21 Dec 2025 11:32:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.elsta.tech (Postfix) with ESMTP id AD6758C00E1;
	Sun, 21 Dec 2025 11:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.elsta.tech AD6758C00E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elsta.tech;
	s=0883730E-C77C-11E9-9DA4-0BE9876769AA; t=1766313166;
	bh=ryuX/qitU2BIwDF+E9hyeH8B+3/BmCHfNnTrdhmPIWU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=PBoc1kjEXEnSCy7xR4sOTnWO0jBSlItt5r7kemJ94c4hVXTQCIjDxxTSwuKwfzxUj
	 PkyBfGDL7RkeRZAfLIaXkrSG/F/OMCuSzdH0GDqxyvIogc+MjILpk4EKLmtUX9qQtk
	 W/xZh3vthdzFBOXIPI9IzlspaC2NibKMDUGD9RaL3UKUs2mzunZCW7xlXk8UcKGqs2
	 1ovpFZk2d8cUNlAmMnwAro8P6iVr6TwuVY2zkAXFhWA9masZ/u+TdvXgLDLKFlEPZi
	 uRdsEZHIKYvZya5hwCWJ3I2whuY1B9POkKTrSIxA3V8eI3CsYWGXvTYY4uVCAhH5fg
	 Zt9wAGGXf4uWA==
X-Virus-Scanned: amavis at elsta.tech
Received: from mail.elsta.tech ([127.0.0.1])
 by localhost (mail.elsta.tech [127.0.0.1]) (amavis, port 10026) with ESMTP
 id iyEbB486Pprq; Sun, 21 Dec 2025 11:32:46 +0100 (CET)
Received: from dev-VirtualBox.elsta-tech.lan (unknown [176.221.120.47])
	by mail.elsta.tech (Postfix) with ESMTPSA id 1D9AE8C00C4;
	Sun, 21 Dec 2025 11:32:46 +0100 (CET)
From: "j.turek" <jakub.turek@elsta.tech>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: michal.simek@amd.com,
	namcao@linutronix.de,
	tglx@linutronix.de,
	zack.rusin@broadcom.com,
	sean.anderson@linux.dev,
	hshah@axiado.com,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"j.turek" <jakub.turek@elsta.tech>
Subject: [PATCH v2] serial:xilinx_uartps:fix rs485 delay_rts_after_send
Date: Sun, 21 Dec 2025 11:32:21 +0100
Message-Id: <20251221103221.1971125-1-jakub.turek@elsta.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_023300_128600_D407A426 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

RTS line control with delay should be triggered when there is no more byt=
es
in kfifo and hardware buffer is empty. Without this patch RTS control is
scheduled right after feeding hardware buffer and this is too early.
RTS line may change state before hardware buffer is empty.
With this patch delayed RTS state change is triggered when function
cdns_uart_handle_tx is called from cdns_uart_isr on CDNS_UART_IXR_TXEMPTY
exactly when hardware completed transmission

Signed-off-by: Jakub Turek  <jakub.turek@elsta.tech>

Fixes: fccc9d9233f9 ("tty: serial: uartps: Add rs485 support to uartps dr=
iver")
---
 drivers/tty/serial/xilinx_uartps.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

v2:
 - Fix build error by declaring rts_delay as ktime_t

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xili=
nx_uartps.c
index 1e4d54fd5762..8b08f478253e 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -428,10 +428,17 @@ static void cdns_uart_handle_tx(void *dev_id)
 	struct tty_port *tport =3D &port->state->port;
 	unsigned int numbytes;
 	unsigned char ch;
+	ktime_t rts_delay;
=20
 	if (kfifo_is_empty(&tport->xmit_fifo) || uart_tx_stopped(port)) {
 		/* Disable the TX Empty interrupt */
 		writel(CDNS_UART_IXR_TXEMPTY, port->membase + CDNS_UART_IDR);
+		/* Set RTS line after delay */
+		if (cdns_uart->port->rs485.flags & SER_RS485_ENABLED) {
+			cdns_uart->tx_timer.function =3D &cdns_rs485_rx_callback;
+			rts_delay =3D ns_to_ktime(cdns_calc_after_tx_delay(cdns_uart));
+			hrtimer_start(&cdns_uart->tx_timer, rts_delay, HRTIMER_MODE_REL);
+		}
 		return;
 	}
=20
@@ -448,13 +455,6 @@ static void cdns_uart_handle_tx(void *dev_id)
=20
 	/* Enable the TX Empty interrupt */
 	writel(CDNS_UART_IXR_TXEMPTY, cdns_uart->port->membase + CDNS_UART_IER)=
;
-
-	if (cdns_uart->port->rs485.flags & SER_RS485_ENABLED &&
-	    (kfifo_is_empty(&tport->xmit_fifo) || uart_tx_stopped(port))) {
-		hrtimer_update_function(&cdns_uart->tx_timer, cdns_rs485_rx_callback);
-		hrtimer_start(&cdns_uart->tx_timer,
-			      ns_to_ktime(cdns_calc_after_tx_delay(cdns_uart)), HRTIMER_MODE_=
REL);
-	}
 }
=20
 /**
--=20
2.34.1


