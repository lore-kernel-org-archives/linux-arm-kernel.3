Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FE6D25B45
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dk3aVOqgTcwdt5w3a55cR/hKuqyDrS2JEEZxDfqpt4o=; b=ARNhL69/f3Tr103DH4hujF3OET
	9gNhSaGf3WKseFcKnFp4O5z8+VSMl+KAjQDwP8b3l1IVfiLdHMQRJ1HXa5mxZTViptWDnM38JYi5C
	MorqUcjcVM6TEQOGQ+qtQZWvdqQnk/92xxZ4p4xP82BMwAJMjmSfcWVxHtIMu+E5bpmGmhMcKCBWl
	D56HTCk/soVJLZCLUzpqrvGjUjKPQUERz2v3J2DDKEPHSAjpN422QYRxT1zXK/FQA1KVI//O3VrSb
	cde2V+YoKYFkSdTO419OuNgBHXL37lGaKUoydeE7FftF4Qlo6Xi8rBAI8alfHPp9/eHH0YiAYpBs9
	Dmj8M+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3jK-0000000Fvn7-0p82;
	Wed, 28 Jan 2026 11:29:02 +0000
Received: from twinsen.zall.org ([109.74.194.249])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3jH-0000000Fvlz-1D2D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:29:00 +0000
Received: by twinsen.zall.org (Postfix, from userid 1000)
	id C76786E3F; Wed, 28 Jan 2026 11:28:54 +0000 (UTC)
Date: Wed, 28 Jan 2026 11:28:54 +0000
From: Alyssa Milburn <amilburn@zall.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Faraz Ata <faraz.ata@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: Alyssa Milburn <amilburn@zall.org>
Subject: [PATCH] tty: serial: samsung_tty: avoid dev_dbg deadlock
Message-ID: <aXny9km6N1v9eoXU@zall.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_032859_508265_1BC71877 
X-CRM114-Status: GOOD (  10.43  )
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

commit a05025d0ce72 ("tty: serial: samsung_tty: use standard
debugging macros") changed the debug prints to dev_dbg, which can
result in deadlocks:

s3c24xx_serial_set_termios can be called with the port lock, and then
calls dev_dbg, which needs the console mutex. At the same time,
s3c24xx_serial_console_write can be called with the console lock
(e.g., inside console_unlock), and needs the port lock.

To avoid this, move one dev_dbg call and just delete the other.

Signed-off-by: Alyssa Milburn <amilburn@zall.org>
---
 drivers/tty/serial/samsung_tty.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 563688c50751..4a82779a4c38 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1582,12 +1582,12 @@ static void s3c24xx_serial_set_termios(struct uart_port *port,
 		ulcon |= S3C2410_LCON_PNONE;
 	}
 
-	uart_port_lock_irqsave(port, &flags);
-
 	dev_dbg(port->dev,
 		"setting ulcon to %08x, brddiv to %d, udivslot %08x\n",
 		ulcon, quot, udivslot);
 
+	uart_port_lock_irqsave(port, &flags);
+
 	wr_regl(port, S3C2410_ULCON, ulcon);
 	wr_regl(port, S3C2410_UBRDIV, quot);
 
@@ -1607,12 +1607,6 @@ static void s3c24xx_serial_set_termios(struct uart_port *port,
 	if (ourport->info->has_divslot)
 		wr_regl(port, S3C2443_DIVSLOT, udivslot);
 
-	dev_dbg(port->dev,
-		"uart: ulcon = 0x%08x, ucon = 0x%08x, ufcon = 0x%08x\n",
-		rd_regl(port, S3C2410_ULCON),
-		rd_regl(port, S3C2410_UCON),
-		rd_regl(port, S3C2410_UFCON));
-
 	/*
 	 * Update the per-port timeout.
 	 */
-- 
2.52.0


