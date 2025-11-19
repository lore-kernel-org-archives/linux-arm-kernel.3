Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7328BCF256B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNqt4YQp8airUPhXo8g6JH7+fCNfQR0ftfXPMj35wRk=; b=h5BgjLy5t90mCooehYQq53ZcU7
	oEKcen62c/2vSHqfE8Jv6XMjhvPYapnhXqxNOWJHmDM+0y7f+/l6nkBNva9pQGOIPUoMCisWsMyKm
	O1QyNWai+STIHQbWInIqidNX3gEpcjT1It1PkS3fs4YjHdA9z12pLAqXrmQ2L+SllwEyFNhdA5XD5
	2kVGmkgn6GNGXprubwZpEaw38G6KVYagBImqv2VygW8RzhL4Sthv4FRLTa/+xmuuUUrFr+uyh7U5y
	qHUb6BRlA6nUpQ5umAVZxfarn+k9FccpSZT/bQWXKrGD8TvpJ7YbIQ+fvMEHxeb1PcOj32mhJCCw0
	NHXjbkPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeR7-00000002rXW-1Tsf;
	Wed, 19 Nov 2025 09:25:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeR4-00000002rWo-3d4T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 09:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B390643710;
	Wed, 19 Nov 2025 09:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CE9C19424;
	Wed, 19 Nov 2025 09:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763544305;
	bh=7CFuSj4IG2U8EHX0SPSAk32/9j7h/b0rTxyBDxOWsfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qfF5G8a5i8tMZSgemK6nOdyDUBJko+TBjRiB7VlpL/x0pjrWJHlx23VxsOJAb7ItB
	 RUdjb00cA6JqQhL4KwVz6opuc1dkiZZAZTAk01/RKc+i6zCiPakXANCe2Pss3EI6V2
	 bJ/YDiH0zKxjaNbqSOOOtWi51PDyFLHxQ8DybqXyCrT3dL9DZIBU0JUmyc07vlykQe
	 tZNR+Xb3GLnsXFZylu844n9K48BNHMPM1RGB4+t1d1QfGXerRtPou2sxBaGHkISkS7
	 tbDGdvpJlXjddK7+uvfHTIT/Ca0YYWhyi+YLteYUif7huS6L+8vXKM9zKTQtppIoEJ
	 KncW5XJsEDQEg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/6] serial: xilinx_uartps: drop cdns_uart::cdns_uart_driver
Date: Wed, 19 Nov 2025 10:24:53 +0100
Message-ID: <20251119092457.826789-3-jirislaby@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251119092457.826789-1-jirislaby@kernel.org>
References: <20251119092457.826789-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_012510_975685_73DC7A44 
X-CRM114-Status: GOOD (  15.99  )
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

Provided the uart driver is available globally, there is no need to
store a pointer to it in struct cdns_uart. Instead, use the global
cdns_uart_uart_driver in the code directly.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---
Cc: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/tty/serial/xilinx_uartps.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index a66b44d21fba..c793fc74c26b 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -190,7 +190,6 @@ MODULE_PARM_DESC(rx_timeout, "Rx timeout, 1-255");
  * @port:		Pointer to the UART port
  * @uartclk:		Reference clock
  * @pclk:		APB clock
- * @cdns_uart_driver:	Pointer to UART driver
  * @baud:		Current baud rate
  * @clk_rate_change_nb:	Notifier block for clock changes
  * @quirks:		Flags for RXBS support.
@@ -204,7 +203,6 @@ struct cdns_uart {
 	struct uart_port	*port;
 	struct clk		*uartclk;
 	struct clk		*pclk;
-	struct uart_driver	*cdns_uart_driver;
 	unsigned int		baud;
 	struct notifier_block	clk_rate_change_nb;
 	u32			quirks;
@@ -1465,7 +1463,6 @@ static struct console cdns_uart_console = {
 static int cdns_uart_suspend(struct device *device)
 {
 	struct uart_port *port = dev_get_drvdata(device);
-	struct cdns_uart *cdns_uart = port->private_data;
 	int may_wake;
 
 	may_wake = device_may_wakeup(device);
@@ -1489,7 +1486,7 @@ static int cdns_uart_suspend(struct device *device)
 	 * Call the API provided in serial_core.c file which handles
 	 * the suspend.
 	 */
-	return uart_suspend_port(cdns_uart->cdns_uart_driver, port);
+	return uart_suspend_port(&cdns_uart_uart_driver, port);
 }
 
 /**
@@ -1550,7 +1547,7 @@ static int cdns_uart_resume(struct device *device)
 		uart_port_unlock_irqrestore(port, flags);
 	}
 
-	return uart_resume_port(cdns_uart->cdns_uart_driver, port);
+	return uart_resume_port(&cdns_uart_uart_driver, port);
 }
 #endif /* ! CONFIG_PM_SLEEP */
 static int __maybe_unused cdns_runtime_suspend(struct device *dev)
@@ -1686,8 +1683,6 @@ static int cdns_uart_probe(struct platform_device *pdev)
 		}
 	}
 
-	cdns_uart_data->cdns_uart_driver = &cdns_uart_uart_driver;
-
 	match = of_match_node(cdns_uart_of_match, pdev->dev.of_node);
 	if (match && match->data) {
 		const struct cdns_platform_data *data = match->data;
@@ -1862,7 +1857,7 @@ static int cdns_uart_probe(struct platform_device *pdev)
 	clk_disable_unprepare(cdns_uart_data->pclk);
 err_out_unregister_driver:
 	if (!instances)
-		uart_unregister_driver(cdns_uart_data->cdns_uart_driver);
+		uart_unregister_driver(&cdns_uart_uart_driver);
 	return rc;
 }
 
@@ -1880,7 +1875,7 @@ static void cdns_uart_remove(struct platform_device *pdev)
 	clk_notifier_unregister(cdns_uart_data->uartclk,
 			&cdns_uart_data->clk_rate_change_nb);
 #endif
-	uart_remove_one_port(cdns_uart_data->cdns_uart_driver, port);
+	uart_remove_one_port(&cdns_uart_uart_driver, port);
 	port->mapbase = 0;
 	clk_disable_unprepare(cdns_uart_data->uartclk);
 	clk_disable_unprepare(cdns_uart_data->pclk);
@@ -1896,7 +1891,7 @@ static void cdns_uart_remove(struct platform_device *pdev)
 	reset_control_assert(cdns_uart_data->rstc);
 
 	if (!--instances)
-		uart_unregister_driver(cdns_uart_data->cdns_uart_driver);
+		uart_unregister_driver(&cdns_uart_uart_driver);
 }
 
 static struct platform_driver cdns_uart_platform_driver = {
-- 
2.51.1


