Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1E0D767F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hOpYl0LfA7bo1KbM/NIBBwUpBaJ7uesB4UvPkEViU2E=; b=gwr4vvQvKTDuDY/kHua13zZ1cQ
	IjTO4QkTW2RmC5wjZbW1QxcRFEhZYjkpT4KPPwQo3jd/A0WSCzcUoJvyeiIAuwooomyS9sgcyBQXn
	03OlB50tsZW+go/LUvkcgD+Z1ewmJXlKa6gUXLq3qA5iF9f/RKWRTXi/0Zt3ghHjycSztJ86KoDSi
	QBGhdJsnRSsaTTqAWAcZYrCL5sGKuG+GqjeW33GvHSVEuWdeLwaJcWvuIh9kkQFQFyFHHbeYm5QWT
	OxUsebyhyJqYDcA32DntGkceYaUkLc+ReHfIIJXW+pwLH2oS2OP7VzAJeaewSVwsGAyKD+oPXadk0
	uBOSxrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYyp-0000000AEcP-07yh;
	Fri, 19 Dec 2025 11:49:07 +0000
Received: from mail.elsta.tech ([194.150.96.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYyl-0000000AEag-2FH9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 11:49:05 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.elsta.tech (Postfix) with ESMTP id A4AAA8C00C4;
	Fri, 19 Dec 2025 12:48:49 +0100 (CET)
Received: from mail.elsta.tech ([127.0.0.1])
 by localhost (mail.elsta.tech [127.0.0.1]) (amavis, port 10032) with ESMTP
 id DEvcV_dUNv5h; Fri, 19 Dec 2025 12:48:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.elsta.tech (Postfix) with ESMTP id 6B7308C00E1;
	Fri, 19 Dec 2025 12:48:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.elsta.tech 6B7308C00E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elsta.tech;
	s=0883730E-C77C-11E9-9DA4-0BE9876769AA; t=1766144929;
	bh=hOpYl0LfA7bo1KbM/NIBBwUpBaJ7uesB4UvPkEViU2E=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=iILWY+BhjMKoV1KRmRYyIjX0AbkZtBhm34NMkFotbKlq9yJu7miFUTNwJWJbkLUbK
	 kuFzh2OgTZkcTx+qCYyrbMCMlyGELH8kPoUAxCTXEL8J1IROKwGT0BLu9am9Dv/sQ9
	 qcjdrSBjkLkusEuSZO2ATP+TSJPRDQWvWIZg+fwP52Jw5KtVPqHcMKTD6Fi9/91BM3
	 K+1aPZdGa7zFW5S895wkX7ExH497qyBw/jng2y17G2mqxCKnn0TajS4v5KZJRnnDmy
	 a9RfVTg8lVbRDW7vyzs4QBXsK82I0DJsWvOq8RtkHLOT6uSOMHQh1MkXT9mPjLKuLm
	 pRU8NSwcz2tsw==
X-Virus-Scanned: amavis at elsta.tech
Received: from mail.elsta.tech ([127.0.0.1])
 by localhost (mail.elsta.tech [127.0.0.1]) (amavis, port 10026) with ESMTP
 id KQat8c1F5THC; Fri, 19 Dec 2025 12:48:49 +0100 (CET)
Received: from dev-VirtualBox.elsta-tech.lan (unknown [172.31.0.125])
	by mail.elsta.tech (Postfix) with ESMTPSA id 430E88C00C4;
	Fri, 19 Dec 2025 12:48:49 +0100 (CET)
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
Subject: [PATCH] serial: xilinx_uartps: fix rs485 delay_rts_after_send
Date: Fri, 19 Dec 2025 12:48:26 +0100
Message-Id: <20251219114826.135017-1-jakub.turek@elsta.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_034904_045929_97BAAE39 
X-CRM114-Status: GOOD (  10.20  )
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
 drivers/tty/serial/xilinx_uartps.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xili=
nx_uartps.c
index 1e4d54fd5762..923a8b57ec82 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -432,6 +432,12 @@ static void cdns_uart_handle_tx(void *dev_id)
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
@@ -448,13 +454,6 @@ static void cdns_uart_handle_tx(void *dev_id)
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


