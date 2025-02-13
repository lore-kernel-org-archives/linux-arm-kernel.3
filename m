Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26184C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4QJVLDvWsDWRMQkm29I/yRVaDWamxuy5N9/YEC1ux80=; b=1xg4qtxaWaXWMpLnqCoh3GLsJz
	Eca5PMKPyfI/ckJqwFssV17Q+tG1YPTyPyxP9TQxS+XOHny9dvy8dPLNWN3NqBX/tq+G2O6LC00Ox
	8a6sZrj4Awapv5BCStZ3X2bjCwdd/Avvk/VhHJt9PhhS/9dP298dwtJYZN9m8r+bSEspv/w3Xs63U
	NqKA3U+Z+MqPHDeh68R3zqUKjky/hL9lSp345sgqrR4qgyfE6ll04X2ZXQpnxn+r6fnOBJZMB8kOR
	cbicsZ2IzjG5TA4Vu4IMHLJv2MQW5cTWPHb5SZ3eLiL30e4mbmwjgsmrhN9K1WKrwmrm56LZXhj9l
	QABlSXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXSS-0000000As5a-1zmW;
	Thu, 13 Feb 2025 11:32:40 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXKb-0000000Apgp-2anX;
	Thu, 13 Feb 2025 11:24:35 +0000
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 707324226E06;
	Thu, 13 Feb 2025 11:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 707324226E06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1739445866;
	bh=4QJVLDvWsDWRMQkm29I/yRVaDWamxuy5N9/YEC1ux80=;
	h=From:To:Cc:Subject:Date:From;
	b=TIGdJJ768Z2yBZ/Zu+rVnHatw0HDInhwvE295xuwuxNrRN5d/LqhiRkcKRzgn4oYm
	 AlSCwb6+KTYtd679GTLrncHd/l/vYurXCBUXAK4mqdqqZrTPVcYecx+lr3ARtwgxrH
	 EsK4u//Nl1NaWIilE3ueKgQwC1Ka/Atirfe6cKGg=
From: Vitalii Mordan <mordan@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Amit Singh Tomar <amittomer25@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] tty: owl-uart: fix call balance of owl_port->clk handling routines
Date: Thu, 13 Feb 2025 14:24:16 +0300
Message-Id: <20250213112416.1610678-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_032433_840456_43CB2342 
X-CRM114-Status: GOOD (  12.73  )
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

If owl_port->clk was enabled in owl_uart_probe(), it must be disabled in
all error paths to ensure proper cleanup. However, if uart_add_one_port()
returns an error in owl_uart_probe(), the owl_port->clk clock will not be
disabled.

Use the devm_clk_get_enabled() helper function to ensure proper call
balance for owl_port->clk.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: abf42d2f333b ("tty: serial: owl: add "much needed" clk_prepare_enable()")
Cc: stable@vger.kernel.org
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/tty/serial/owl-uart.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/owl-uart.c b/drivers/tty/serial/owl-uart.c
index 0542882cfbbe..64446820437c 100644
--- a/drivers/tty/serial/owl-uart.c
+++ b/drivers/tty/serial/owl-uart.c
@@ -680,18 +680,12 @@ static int owl_uart_probe(struct platform_device *pdev)
 	if (!owl_port)
 		return -ENOMEM;
 
-	owl_port->clk = devm_clk_get(&pdev->dev, NULL);
+	owl_port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(owl_port->clk)) {
-		dev_err(&pdev->dev, "could not get clk\n");
+		dev_err(&pdev->dev, "could not get and enable clk\n");
 		return PTR_ERR(owl_port->clk);
 	}
 
-	ret = clk_prepare_enable(owl_port->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "could not enable clk\n");
-		return ret;
-	}
-
 	owl_port->port.dev = &pdev->dev;
 	owl_port->port.line = pdev->id;
 	owl_port->port.type = PORT_OWL;
@@ -701,7 +695,6 @@ static int owl_uart_probe(struct platform_device *pdev)
 	owl_port->port.uartclk = clk_get_rate(owl_port->clk);
 	if (owl_port->port.uartclk == 0) {
 		dev_err(&pdev->dev, "clock rate is zero\n");
-		clk_disable_unprepare(owl_port->clk);
 		return -EINVAL;
 	}
 	owl_port->port.flags = UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_LOW_LATENCY;
@@ -725,7 +718,6 @@ static void owl_uart_remove(struct platform_device *pdev)
 
 	uart_remove_one_port(&owl_uart_driver, &owl_port->port);
 	owl_uart_ports[pdev->id] = NULL;
-	clk_disable_unprepare(owl_port->clk);
 }
 
 static struct platform_driver owl_uart_platform_driver = {
-- 
2.25.1


