Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5DDC982FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 01:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hsXXHTt/F3CzSZoKQdsqanQABifE4XgtI3g2DS04rwE=; b=ecciqV7dAOVgxdDDIQDIP7kVGx
	muYWELiO3580utbRKJXjmV3NwZafQyU4+d5IxZ4pdTM2NprTR+K2YxwIcKqMl9YKgaOAgd7jrdE7X
	QrcvAgRCNc7SSPUxZtHJRSGZMZa+d9aEXfWz93JBzxzpDZjpg1yRzLzpPcPyZ6Ep2cGR1E41KvFQ1
	Y4FYSpIRYnOnjz8oIKm5a3rFItYBGIqu21YvEgDzwOrUBVx3Bu3DYljOm044uJkv6zk3OqfAxU1W6
	JsVREHS02rG6oVQN0Vm20HAh/LuCRpp7asB+6w5kjQsoY/XH5lfL31IF1bCA8vNRz0sDd6Hk1OXjq
	qlnOJNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pCA-00000003saE-36x6;
	Tue, 22 Sep 2026 01:21:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pC9-00000003sa1-1lqC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 01:21:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91E0260210;
	Tue, 22 Sep 2026 01:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D9D4C2BCB3;
	Tue, 22 Sep 2026 01:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790040076;
	bh=AGoA4/iwqNxIvbkM9m87fuPgQXFSWC2djc1JB6O1P2w=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=HG6C+lS6tONxVEtjmomvH142ZZZH44Zv+Nu8LHiVRHhVtzkTkQRHqo3TRLH3oe3FC
	 EBCUzhXbXelUOfj1n93SLFGcpuZtTDUHkCZvknkLmeNoP0hgz2+eypSgPpWOogKDnc
	 QTmR9MWzjFuvE9vJb9JikkQjOKBv+zruvqqAwp4sF6Tc7lukamIIIK1Vg9WRHfT6UZ
	 U2z0plvkAMsMO64PnaNSAOQGn0C4L54DIjTax9o5TuIq2/J2O8aPMUDTU8ykAqeDDr
	 /2ZPvOQo/Ded5e26ZzqEDHFGXiYKNklV49fm/+ZpLOhEp5xteqXL1WFHiv/Ry5e7Ym
	 KNTdOM1jsFOLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EA6C982F0;
	Tue, 22 Sep 2026 01:21:16 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:21:13 -0400
Subject: [PATCH] serial: xilinx_uartps: publish console_port with release
 semantics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-uartps-v1-1-9fc2f3d4b1a5@vt.edu>
X-B4-Tracking: v=1; b=H4sIAAjYsWoC/yXM0Q6CMAyF4VchvbaGDaLiqxgvulJlJk7SAjEhv
 LsbXn4nJ/8KJhrF4FqtoLJEi5+U4Q4V8EDpKRj7bPC1P9Wdd/gOOJNOoyGLC47Jd3RpIP9HlUf
 87q3b/W+bw0t4KoHyCGSCQSnxUKady/nYoHIL2/YDZzaMOY0AAAA=
X-Change-ID: 20260921-mb-uartps-ce1b1ca29a83
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790040075; l=2025;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=+qMMTlUnAlo5wMcrO/0fIIBY+h1Jroi7pkVqcuiqtuM=;
 b=Jh8+BFE5Ah6Lj6zvIelxnqC4MWlNXWoUGsODf6eaUwkm2e5X7Q9/8eLbZR4lYiM+l6uTGR6ms
 cUuaLI+lyEqAVStd+mqyXzmD5TpCCIAFT2Ay4mSDu9KTEZvMDEG4puJ
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
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
Reply-To: jaidevshastri@vt.edu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jaidev Shastri <jaidevshastri@vt.edu>

cdns_uart_probe() assigns the first probed port to console_port with a
plain store once the port is set up. cdns_uart_console_write() and
cdns_uart_console_setup() read it with plain loads.

Store it with smp_store_release() and read it with smp_load_acquire().

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 drivers/tty/serial/xilinx_uartps.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index a072b75db..59e0d388d 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1371,7 +1371,8 @@ static struct uart_port *console_port;
 static void cdns_uart_console_write(struct console *co, const char *s,
 				unsigned int count)
 {
-	struct uart_port *port = console_port;
+	/* Pairs with the smp_store_release() in cdns_uart_probe(). */
+	struct uart_port *port = smp_load_acquire(&console_port);
 	unsigned long flags;
 	unsigned int imr, ctrl;
 	int locked = 1;
@@ -1414,7 +1415,8 @@ static void cdns_uart_console_write(struct console *co, const char *s,
  */
 static int cdns_uart_console_setup(struct console *co, char *options)
 {
-	struct uart_port *port = console_port;
+	/* Pairs with the smp_store_release() in cdns_uart_probe(). */
+	struct uart_port *port = smp_load_acquire(&console_port);
 
 	int baud = 9600;
 	int bits = 8;
@@ -1812,7 +1814,8 @@ static int cdns_uart_probe(struct platform_device *pdev)
 	 */
 	if (!console_port) {
 		cdns_uart_console.index = id;
-		console_port = port;
+		/* Pairs with the smp_load_acquire() in the console callbacks. */
+		smp_store_release(&console_port, port);
 	}
 #endif
 	if (cdns_uart_data->port->rs485.flags & SER_RS485_ENABLED)

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-uartps-ce1b1ca29a83

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>



