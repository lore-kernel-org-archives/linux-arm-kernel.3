Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B9DC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PWe1Y8pYuAa7B+GagSYE8D0P3UeZCJcEkhdzL5G7fY=; b=AtynzF8bYNrnabEGiqkJ9BmAU6
	6dX9OfAX+0Ey0gojqtWv2zmJ3JBdYdnXYMarVML+p153MiBeE11NcsNHDXN0ql5yh4GxjD1aBnC4c
	ObT3qOm7y60OGrySEYg3U+twxnF4NxsZEJREYwo/NADYxIUm+vyOSgtVpi/UvQZNSuCvp6ZCxhVEj
	Yv1wxkaVTTBle7iWPex/yWbbDu9EXtzHlbm4tT/5680veb67hDitb3pkvDa17mx8UAfP8z+QCXOC7
	5hoIctg+EI4YTwVdo23sUezFm2u7JvnYWrlGzchxP++ILwYv1+7CqJW/0zuI46v3ka1kuBUqp2DKS
	BGU4tk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZio-00000005PvJ-2GRv;
	Sun, 19 Jul 2026 22:10:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZim-00000005Pu9-2hSo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 22:10:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49557167508so9526985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 15:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784499051; x=1785103851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PWe1Y8pYuAa7B+GagSYE8D0P3UeZCJcEkhdzL5G7fY=;
        b=apEQ7zsYd+iBhJzBtCx+ShO/IK/e8TiHfr4TNB5WNDDq1WbS57xg+/WCJkIMuEO0ND
         Jch0FMEj2tv/B7V/h9NyxWy87vLsj1Bd/kK1XI9MvuUM7ek4sYXp0jKqcnlUyv2OQUOh
         g+QuL+2dKDM3w9jxhPJXBBdgKN/VABaL1YR2fdUzSs34sLW5oRhkYrKow/NqU9I38shr
         RfzhCyTzI0jT4arCSUJMXvgUSXx1PwxNn+8k68zLFhkGFOXvCDgnw01eUKnJvxQLBy05
         yNcCLI9zd+VtDYwrUrH26ix3ahMpUTzwgyKOv3FLhco3GGbV0lyw2VCkWWqWpgKml5fm
         nasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784499051; x=1785103851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PWe1Y8pYuAa7B+GagSYE8D0P3UeZCJcEkhdzL5G7fY=;
        b=aXIASPbsiIaqwkEKfM7J7rbuiLp1iZoxglPvC/PMjB8FchaaAXGGJ9lUyf5ciZCw/K
         g7t7r9q8k4+FF279h2PcpOIXpGZszHRJO4baQu+tKoaZkkwX96DvY87M2mQ7RxOAcrtR
         7ivrfROkKNMrua9Bp3C4a4rBo/wYe71RFefIU6mfosv8LP2Kvg96TPog0XA90spWvSvF
         6+gPjoGwIhlkA6ZLpxvH2ES46ui1Y8bJZtrYA12g2/y46FXeKtcEl0V+v5DV+yxg2Pqh
         6hJ5DkT9io1wObgt0dB4a9rZ6QDxfcZ1iVsjCugnFECYHfiFwSMhOlf3YxZ+iMiFa/52
         qcOg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4zink6fCB/ev+iaYuW7uV/o/awyJKQmqmf2NECswVRUAIc5MPv6Gakbd2gNxUDydaKT89OwGZ3pl2n/ufZ3TU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8YchdNcl18eFTzuCf73FHfXasMc58a7nZLOk/Tybmz3UnwgXN
	NwBTxzJbCZQFTHq2CLrKd7UvvRmeqyBa3+QAUDsMOThl1IFaIKbWoRAU
X-Gm-Gg: AfdE7clTXJHtmcCwsfBa2s7KqL0YcBHyiGs3mtQWJGUYC1yUNHyl4FpkPK0SK7tRZVD
	0E9IBY32ZNjyBqPOm5Dupdmu3C7/Hx4S8BAQmPeiVx0XY4EgH2PKJZyvn+lz00EdqIbD+05lD0x
	I5MWzwaRetijsX3St/c5dPnWY6VZ+3WHYdycEGOnpA0yuAWMs/k44CHmAL4FRkLK26m9xNG3Yuv
	TFLRWofgugaVyUs5Q3bzDD5IO6Bzc2F3moeGIn/9d3Ydsoj+qUy4+F0pE3GigjyIW/GtXvk7oIn
	m09aBsbu5YMauPeUN855mEUYj2mWEu/V9ZLftEs2hjBcHEfVJZMJibOsY21ilMeQIPmgkhW0nf2
	dUZUPzT4lHXeL5OoAZOb9nHuSuEcQbbOCkIbGkmbB6Cd3wNrJRKFm/XEMi2A7q8YlcqJs2t7NUY
	FWx6TvFWn24V97AjaQkGTmO3uFH6uVAbeyucJnKirBggrlvxH53smtHRtp2gI3hLCznWH5jrcZn
	lEwRjL347KyeccVjvz9XKzPZdT17Qn54Eh0Ye+d4R0q6R/3tmh0FSpYB5mlFxPc1gqGSlzNZZMi
	An1UeBNCXJgFr0bnU6jzprvxaqWRkZ/3d80=
X-Received: by 2002:a05:600c:1f93:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-4954a3d64d4mr124694595e9.6.1784499050684;
        Sun, 19 Jul 2026 15:10:50 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955370d78csm114492445e9.12.2026.07.19.15.10.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 15:10:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] serial: imx: serialize imx_uart_ports[] lifetime
Date: Mon, 20 Jul 2026 00:10:14 +0200
Message-Id: <20260719221014.44354-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260719221014.44354-1-kmehltretter@gmail.com>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_151052_713715_33B1F442 
X-CRM114-Status: GOOD (  18.91  )
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

imx_uart_probe() publishes the port in imx_uart_ports[] before
uart_add_one_port(), because console setup during that call uses the
table. The entry is not cleared if adding the port fails or after
imx_uart_remove() removes it.

The port is devm-allocated, so a failed probe or unbind leaves the table
pointing at freed memory. A later registration of the shared console can
then dereference the stale entry. Reproduced on QEMU's mcimx6ul-evk by
unbinding a sibling UART, unbinding the console UART and rebinding the
sibling:

  BUG: KASAN: slab-use-after-free in imx_uart_console_setup+0xd0/0x3d8

The entry must remain valid until uart_remove_one_port() unregisters the
console. Clearing it afterward without serialization still races a
sibling probe: the sibling can register the shared console using the
dying entry before it is cleared. The next console write then
dereferences NULL.

Use a driver-wide mutex to serialize table publication, port addition
and rollback with port removal and table clearing. Console callbacks
remain lockless because uart_add_one_port() may invoke setup while
probe holds the mutex.

The probe-failure path also relies on "serial: core: do fallible
allocations before the console can be registered", which moves the
uport->name and uport->tty_groups allocations before console
registration. Both changes should be backported together.

Fixes: dbff4e9ea2e8 ("IMX UART: remove statically initialized tables")
Fixes: 9f322ad064f9 ("imx: serial: handle initialisation failure correctly")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260719162850.043B41F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/imx.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..def874f9cd00 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -22,6 +22,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/ktime.h>
+#include <linux/mutex.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/rational.h>
 #include <linux/slab.h>
@@ -2080,6 +2081,15 @@ static const struct uart_ops imx_uart_pops = {
 
 static struct imx_port *imx_uart_ports[UART_NR];
 
+/*
+ * Store the port in imx_uart_ports[] before uart_add_one_port() and clear
+ * it only after uart_remove_one_port() returns. Console callbacks in both
+ * calls use the table, so this mutex serializes these sequences between
+ * sibling ports. Callbacks must not take it because uart_add_one_port()
+ * may invoke setup while it is held.
+ */
+static DEFINE_MUTEX(imx_uart_ports_lock);
+
 #if IS_ENABLED(CONFIG_SERIAL_IMX_CONSOLE)
 static void imx_uart_console_putchar(struct uart_port *port, unsigned char ch)
 {
@@ -2632,11 +2642,14 @@ static int imx_uart_probe(struct platform_device *pdev)
 		}
 	}
 
-	imx_uart_ports[sport->port.line] = sport;
-
 	platform_set_drvdata(pdev, sport);
 
+	mutex_lock(&imx_uart_ports_lock);
+	imx_uart_ports[sport->port.line] = sport;
 	ret = uart_add_one_port(&imx_uart_uart_driver, &sport->port);
+	if (ret)
+		imx_uart_ports[sport->port.line] = NULL;
+	mutex_unlock(&imx_uart_ports_lock);
 
 err_clk:
 	clk_disable_unprepare(sport->clk_ipg);
@@ -2647,8 +2660,12 @@ static int imx_uart_probe(struct platform_device *pdev)
 static void imx_uart_remove(struct platform_device *pdev)
 {
 	struct imx_port *sport = platform_get_drvdata(pdev);
+	unsigned int line = sport->port.line;
 
+	mutex_lock(&imx_uart_ports_lock);
 	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
+	imx_uart_ports[line] = NULL;
+	mutex_unlock(&imx_uart_ports_lock);
 }
 
 static void imx_uart_restore_context(struct imx_port *sport)
-- 
2.53.0

