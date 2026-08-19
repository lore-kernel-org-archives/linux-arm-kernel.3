Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39DBC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 02:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SBCK/LQXrRW8zqnuOvxzwY4GDHR6MSTRIVAxA4wZlO8=; b=iAgECyeKoiqMrZapMFPgRaGavR
	JC58Vigef0NOo3ypNtgOnALCXd127QqiJmfbRQYen3710jPARf6uZaLiO7zxQvAy2d/xYSZ6lQmgB
	0IvFzuAUExnI7Q8XvUm1wbn7amQm2rzDoY3TgANUqzq32kS+QkHEfPd2PGVoyFRolyR7ogg7FO82o
	C0BTmivEIGkFD1UXClWsRP4T5a9a9YZX2cL21igE9vZ7Go3VHDzQtudm8P283HeHP9ZKdDjj+cS9p
	UMonNXc6mEp/k0Wex5alEK+h3m1O/8Y5J6n2VgMyNKPdiFszKfQDDHNRrjinbVwYDHODzPA3v02ug
	icxn6Amw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVus-00000008rdi-2pE6;
	Wed, 19 Aug 2026 02:20:34 +0000
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net ([206.189.79.184])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVuo-00000008rd4-2Dqg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 02:20:33 +0000
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wC3gX3bEoVq7JmmAA--.42198S3;
	Wed, 19 Aug 2026 10:20:12 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app1 (Coremail) with SMTP id yy_KCgCHiaPbEoVqNqb7Aw--.26282S2;
	Wed, 19 Aug 2026 10:20:11 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] serial: imx: cancel RS485 trigger hrtimers in shutdown and remove
Date: Wed, 19 Aug 2026 02:19:16 +0000
Message-Id: <20260819021916.442827-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: yy_KCgCHiaPbEoVqNqb7Aw--.26282S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?hwMz9wXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVCjTgEH9dVomQuWcozCBBFqHGffgUj/kiZ79lR96Dn6tPZKPn6Kv4uFpy6/Kyifm6gz
	W5tHy1KOfp+zmAq5OVip9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw48Kw4xXr4kJFWrCr47Jrc_yoW8tryxpF
	Z2gr9IkFWqqa1SvanrAF1jgFW5twn3AFW7Gr1xGa4Fv398JF1FkF13KFZYvFW7t34UtFWa
	vr48tr4DCFZrtFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr1j6rxdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lF7xvr2IYc2Ij64vIr40E4x8a64kEw24lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7gAwDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_192030_580881_F710B8C5 
X-CRM114-Status: GOOD (  10.80  )
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

The rs485 delay hrtimers trigger_start_tx and trigger_stop_tx are
embedded in the devm allocated struct imx_port, and their callbacks
reach the port through container_of() and touch registers under the
port lock.  Nothing cancels them synchronously: the tx paths only
call hrtimer_try_to_cancel(), which does not wait for a running
callback, and the bounded wait in imx_uart_shutdown() can give up,
force tx_state to OFF, and leave a timer armed.  After
imx_uart_remove() returns, devm frees the port and a late callback
dereferences freed memory.

Cancel both timers at the end of imx_uart_shutdown(), after the port
lock is dropped and before the clocks are disabled, and again in
imx_uart_remove() before the devm free: serial core does not call the
driver shutdown on every path that reaches remove().

This issue was found by an in-house static analysis tool.

Fixes: bd78ecd6056d ("serial: imx: use hrtimers for rs485 delays")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/tty/serial/imx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..86c99f73c50a 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1707,6 +1707,10 @@ static void imx_uart_shutdown(struct uart_port *port)
 
 	uart_port_unlock_irqrestore(&sport->port, flags);
 
+	/* The rs485 trigger callbacks take the port lock and touch registers. */
+	hrtimer_cancel(&sport->trigger_start_tx);
+	hrtimer_cancel(&sport->trigger_stop_tx);
+
 	clk_disable_unprepare(sport->clk_per);
 	clk_disable_unprepare(sport->clk_ipg);
 }
@@ -2649,6 +2653,10 @@ static void imx_uart_remove(struct platform_device *pdev)
 	struct imx_port *sport = platform_get_drvdata(pdev);
 
 	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
+
+	/* Serial core can reach remove() without calling the driver shutdown. */
+	hrtimer_cancel(&sport->trigger_start_tx);
+	hrtimer_cancel(&sport->trigger_stop_tx);
 }
 
 static void imx_uart_restore_context(struct imx_port *sport)


