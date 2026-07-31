Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5B3C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6m+8w0QVgGm8urXe/cU07WfU5xAZ+QJVFPsiFH0egMo=; b=bfcf8sBlISzanI1T8AKqv0dQI9
	7DC1fyA2Lu9Z4mWnqrXzLgPewATvnQ6T46j3UF1E4/A7y+bYo7S95E22Nr9K+gVefddScw01GhXcC
	Rege8KjLJt8lbCcYV0oBHgn/zzBiuFG4lkZNofbrh1htwKbtDESOGKDOuTuSnq5mUTSBKwKU5jRDX
	IhaO6/d09WyjfJwup2Fl+uIaGJA7YYHE2Nvfk174D/G53TQwVrYOqwH27h58soNr8mu0FXZ3DbXnq
	JQNxMOWPpXXGuTracPVD+1j64+8n/66iPIsEEeefVVrdkFr+9NHKmgoxyhkrVMBBHuBCV7Qwdthdu
	1U66ng+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprbu-0000000DK3C-0enn;
	Fri, 31 Jul 2026 18:05:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprbp-0000000DK2d-0OWf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:05:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47db714766aso1463521f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521123; x=1786125923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6m+8w0QVgGm8urXe/cU07WfU5xAZ+QJVFPsiFH0egMo=;
        b=JAepeJEewrx/45OCKhHIooXM/xeKIvvrWyeYGRoYzew1RVM2rzhUWO82R98CfRGSl6
         toH3C2zylTZ6oqJAx4UjV1EvpLk+HRz8W3ONVcBNahLjrWNErqvsOOwejHkXHLUFNSs+
         NSAZtsJ1QsWvb2SJXm+89kbj4W3+d4LFYxUMoVf2kFWzMtq8/fe8Ns2BfMzvF7pUBmhU
         pZuRFXzZyBjIPBJAd8lAreTTq9I1GX5r0jTc9JszwGhliNfSz7w53Aj+fNp9BwSX96iV
         Wqx1bNMYtrQNcFN+6V8mLcTXpUP1WJqcqBDWwXYwqFbwUZXe8S8OJ4RpiEB7fdLCx8wY
         HCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521123; x=1786125923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m+8w0QVgGm8urXe/cU07WfU5xAZ+QJVFPsiFH0egMo=;
        b=MCGJwlRa3EuZFZ7yXqibRu5wP+5iO+BaMg4LzUZgvHiQqfRvIUlPxYbTQghPEZdpQC
         lu4ILeqHODMgSQS7FxHL6omDdB8lk5LqIrfMQlpkLCDMZ9TOqHx37F7M4NXH6jF7hE0m
         jyA382LRReFDbRWjDQsWfY7G/69IkvasQks7ylSKu2E15R6RGsWxd+fj9+hbOg8JUali
         HVbqlZgBpktyl22q9C2Sb+AFxWZCH3/oH3vMHgH6YLovzRE0aU0ALH1FnZ360J0fVXht
         CpoVo7cxloshJVHLHSnD+4AhVcn/ins2uIM4gHChM1Bxzk60CpckcMKSUKVIV3StG74E
         A2jQ==
X-Forwarded-Encrypted: i=1; AHgh+RqekfhTpkoay2IymMTz1BUdKQxFnX1kassnpgtzhfvSrCWmtpLoEuZikb2a/Y63WaK68jfDG4W6qIxnifMfzueh@lists.infradead.org
X-Gm-Message-State: AOJu0YwWatXo0HjgWofItoS4f+FE1t7CKU0cu4UXu5+BtZP254ANSRWn
	vIunoHD9xH/cM8luf8vXTJyRoq7YZVNcm3qhw8fVOgBjMK9I6ixVfMZRdbolP1KK
X-Gm-Gg: AR+sD13dPMfb0epVrR0rN9xAaEo66wCSwH8/gBVo9t4WmaK5PTGShBR/ihdMEYLT19L
	aXx5+moL3gLF6lHmXrCtonhIt0HX/ZOU9c02BrZyeomKcyNSype1niuv7vgsUzQgWqCO5cAiHB6
	MMlvrSS6kxW3bwsJzAOhbgL4BBeN1N8wUVjqoKYbtm+6qQuqnrbP9SkHTXY63aGgjibNGPE/k2Q
	OrT1p+lmDRLrR5e7XVrON07bf09PV2GeL4J3neDuU4+ChynDd39uAbAri/ajFwpaALiyCMeNb5D
	s2WwgBCUQ6OEqQo4tQNCFsOODZUvvoZNlUGo44LTwavT+cviuKWoZJ9rofN3a+Cn0Fo8g/yQoaU
	zPXuwLvxQnpnDxOzrnFGV/MI4c/7u4hb7y3QIzUZTFh3BxCHBCVj2ZXFBnrao6e3i0GMIXBEy5D
	imSB0YIexAvKyOsDKXb1TSTeWYOuM/y+OF5SL4q3nRre87lV/QD6k1wyl9taRcyG3ndQGK8NQ5K
	zOte9XDBjKiU7w1Rs7EbcbFSGrD5A7VPxRjjXX0R3FwD4T/bSoz093z71mCId/Y5dLgYHVgjmAs
	yjfEtBUrCPSwfFskUMBQkFu5VV71wHqx70yKzcD861yU8CmUIsvWldtD1KRbt2Q4VEtY
X-Received: by 2002:a05:6000:310f:b0:47f:775b:f5dc with SMTP id ffacd0b85a97d-47fd32e1c76mr5907524f8f.19.1785521123140;
        Fri, 31 Jul 2026 11:05:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm7094559f8f.22.2026.07.31.11.05.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:05:22 -0700 (PDT)
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
Subject: [PATCH v3 5/5] serial: imx: serialize imx_uart_ports[] lifetime
Date: Fri, 31 Jul 2026 20:05:19 +0200
Message-Id: <20260731180519.10988-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_110527_444821_58594088 
X-CRM114-Status: GOOD (  17.27  )
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

imx_uart_probe() publishes its devm-allocated port in imx_uart_ports[]
before uart_add_one_port() because console setup uses the table. The entry
is not cleared when adding the port fails or after removal, leaving a
dangling pointer.

A sibling probe can register the shared console through that stale entry.
This was reproduced under KASAN on QEMU mcimx6ul-evk by unbinding a
sibling UART, unbinding the console UART and rebinding the sibling.

Keep the entry valid through uart_remove_one_port(), then clear it. Protect
port addition and removal together with their table updates so sibling
operations cannot interleave. Reject an occupied slot rather than
clobbering an active port during a duplicate-line probe.

Fixes: dbff4e9ea2e8 ("IMX UART: remove statically initialized tables")
Fixes: 9f322ad064f9 ("imx: serial: handle initialisation failure correctly")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260719162850.043B41F000E9@smtp.kernel.org
Link: https://lore.kernel.org/all/20260719222501.CB4CB1F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Backport note: the removal fix is self-contained. Complete probe-failure
coverage also requires patch 1. With patch 1, all fallible allocations
precede console registration, so rollback can safely clear the table.
Without it, a late allocation failure (only reachable with fault
injection) can leave the console registered after imx_uart_ports[] is
cleared, turning the pre-existing use-after-free into a NULL
dereference.

 drivers/tty/serial/imx.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..b0f34a6e7d4f 100644
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
@@ -2080,6 +2081,9 @@ static const struct uart_ops imx_uart_pops = {
 
 static struct imx_port *imx_uart_ports[UART_NR];
 
+/* Held across uart_add/remove_one_port(); console callbacks must not take it. */
+static DEFINE_MUTEX(imx_uart_ports_lock);
+
 #if IS_ENABLED(CONFIG_SERIAL_IMX_CONSOLE)
 static void imx_uart_console_putchar(struct uart_port *port, unsigned char ch)
 {
@@ -2632,11 +2636,19 @@ static int imx_uart_probe(struct platform_device *pdev)
 		}
 	}
 
-	imx_uart_ports[sport->port.line] = sport;
-
 	platform_set_drvdata(pdev, sport);
 
-	ret = uart_add_one_port(&imx_uart_uart_driver, &sport->port);
+	scoped_guard(mutex, &imx_uart_ports_lock) {
+		if (imx_uart_ports[sport->port.line]) {
+			ret = -EBUSY;
+		} else {
+			imx_uart_ports[sport->port.line] = sport;
+			ret = uart_add_one_port(&imx_uart_uart_driver,
+						&sport->port);
+			if (ret)
+				imx_uart_ports[sport->port.line] = NULL;
+		}
+	}
 
 err_clk:
 	clk_disable_unprepare(sport->clk_ipg);
@@ -2648,7 +2660,9 @@ static void imx_uart_remove(struct platform_device *pdev)
 {
 	struct imx_port *sport = platform_get_drvdata(pdev);
 
+	guard(mutex)(&imx_uart_ports_lock);
 	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
+	imx_uart_ports[sport->port.line] = NULL;
 }
 
 static void imx_uart_restore_context(struct imx_port *sport)
-- 
2.53.0

