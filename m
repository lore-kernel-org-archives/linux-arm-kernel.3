Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085D6C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uvXoMozXSUq7ECwRvOIW2A8tWpZ7jbIGzymPHm6Jvjg=; b=ZQN8zBKTZAMp5eIrg26Q9WvhED
	wuTkVDYReD64pbudmAgJB9vnU1dPdk30SlmOoUlk2xsMdNPGjdEKT1XbENBrAuS9/NjMn4rAB4p3o
	Qery33jgXSV7sr1TIJARCyejiuWyjUXkurXE2qdIxAIi43qn6YmPZTlz8AHaaO/TUIt0qI6HjRhOm
	6U4NfHq8pOyvJliwq5VTt71/R0fC4DlpNqDXWkop3glC742YKIdXi+hIl1sMVdSS4QoEnig1xwHg+
	CL0dh0fdrQsSKEAl+Wfwpnf2qnCSjPIm1vXzfU0foakIJVdsVvnLlOaxEwGhXjxooKRCPk+S07JDk
	eQRIPnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZ7S-0000000A4kG-2hnc;
	Wed, 22 Jan 2025 11:42:02 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taZ53-0000000A4VN-1RCA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 11:39:35 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1737545967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uvXoMozXSUq7ECwRvOIW2A8tWpZ7jbIGzymPHm6Jvjg=;
	b=HmfKgzt8BUKnKCByrmvAc7jYejozQtTKXhFPQO2ZlaDjE7uqLoeulo4MU1o6x/B6pG0CUS
	iLq8RCru4oNQnLHQ1cGUDLn3n/l6wkTF2itevxnVifj6jgvyEnrF9PwiLvYWP2NsJWAJpW
	lxFrZti5R9Fa4NOmuXh1UQE7g+ma0cs=
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Esben Haabendal <esben@geanix.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH 5.10] serial: imx: Introduce timeout when waiting on transmitter empty
Date: Wed, 22 Jan 2025 14:39:26 +0300
Message-ID: <20250122113927.301596-1-arefev@swemel.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_033933_902471_271C3A45 
X-CRM114-Status: UNSURE (   9.53  )
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

From: Esben Haabendal <esben@geanix.com>

commit e533e4c62e9993e62e947ae9bbec34e4c7ae81c2 upstream. 

By waiting at most 1 second for USR2_TXDC to be set, we avoid a potential
deadlock.

In case of the timeout, there is not much we can do, so we simply ignore
the transmitter state and optimistically try to continue.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
Link: https://lore.kernel.org/r/919647898c337a46604edcabaf13d42d80c0915d.1712837613.git.esben@geanix.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Denis: minor fix to resolve merge conflict.]                                           
Signed-off-by: Denis Arefev <arefev@swemel.ru>                                    
---
Backport fix for CVE-2024-40967
Link: https://nvd.nist.gov/vuln/detail/CVE-2024-40967
---
 drivers/tty/serial/imx.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 6e49928bb864..5abf6685fe3c 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -27,6 +27,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/dma-mapping.h>
 
 #include <asm/irq.h>
@@ -2006,8 +2007,8 @@ imx_uart_console_write(struct console *co, const char *s, unsigned int count)
 {
 	struct imx_port *sport = imx_uart_ports[co->index];
 	struct imx_port_ucrs old_ucr;
-	unsigned int ucr1;
-	unsigned long flags = 0;
+	unsigned long flags;
+	unsigned int ucr1, usr2;
 	int locked = 1;
 
 	if (sport->port.sysrq)
@@ -2038,8 +2039,8 @@ imx_uart_console_write(struct console *co, const char *s, unsigned int count)
 	 *	Finally, wait for transmitter to become empty
 	 *	and restore UCR1/2/3
 	 */
-	while (!(imx_uart_readl(sport, USR2) & USR2_TXDC));
-
+	read_poll_timeout_atomic(imx_uart_readl, usr2, usr2 & USR2_TXDC,
+				 0, USEC_PER_SEC, false, sport, USR2);
 	imx_uart_ucrs_restore(sport, &old_ucr);
 
 	if (locked)
-- 
2.43.0


