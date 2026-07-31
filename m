Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F53BC55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6m+8w0QVgGm8urXe/cU07WfU5xAZ+QJVFPsiFH0egMo=; b=NvxLBoOt86zGOW8/YtrfEDr/z+
	j6LjKmEqpFZdP238l1chf5ja82AWOyyUJFlYqBD7e7Fy8fff2O8MoOofajC3ZbmiruN4MpmC9ODV/
	AZkEzfrkjlY3y+pFhYEEEg34y/oEslLkGTYmiSOib01LEScqxcJv8q43orR6dlo9TfHrqtNurJ/Pm
	6EuCNL71Q0+gwc47+/oU4duspzFQj1fUETPkjnEP51RvSRAJiHB7jiZNr5yewQK+gRR411z4rIAM6
	Yh+ZMSi7w+uIzuqp1UxyY5r6/B9sHOwczwSUrlV3iupUtu/GkCNBAoiSyvx1WJGH0WaKybmisen/d
	iJ3YkEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprp3-0000000DLNg-0hqs;
	Fri, 31 Jul 2026 18:19:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprp0-0000000DLMS-2KzC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:19:03 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f7027ca11so884993f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521941; x=1786126741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m+8w0QVgGm8urXe/cU07WfU5xAZ+QJVFPsiFH0egMo=;
        b=myT7WY4BCf6vE+naTBG4p5RQSPVgWgiTAdZ42nE9Pz5wfn99emg5bh6Egeb35jJ2VN
         dynKTU5Z2V4S2TbtrQK0RMxtKlRpkG65VvtUQWykYA4z2cXJVrYXp8mox40Rpv97FoNv
         jyahry+N8B9u8JoH5zgIh2MOxOhUSApuYj69K796LzpOFHKwyuDoO3rBNNcz244N8yDk
         BbwGuaEwM8GSRjsgP/nkd8vFXVEO3dUk0tKPtTL1yZNnGJbrSl8U+QXHm36LSJgsQl44
         lKB2lPF2DcnMjN8MXP/Rew7rsUican4Eg39NdiGjAW4DD814mG0roBx0Fb6sXyx6vzo9
         jYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521941; x=1786126741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6m+8w0QVgGm8urXe/cU07WfU5xAZ+QJVFPsiFH0egMo=;
        b=jR0iXudgaRLVB4hqvw23SMoMb0lxc5oVTrdx4A7LGrVRCcbnKxxGtCT94YE8+K8bzm
         sIoqdvskWkMmHsg7jpHS0zbVnMiEQcFj1xAqVGVWIklCauXiD52NEiAKkWZKGHInGEdA
         VoXuu8XgO0e7naPhmeEyJeDiIp6Wf2pMHc9qlMSlEGTMwCSSSo9rtEtR7gOAoWPjjef/
         Vcf9Mbh5MWw9xCX2W5oNOcgYOk9+A2s3ZS/YRnX4IqnpTS6kDVfrohQQ47NOl5R9W89/
         JnUWSjI90BRyFZGB8ps6L8iqBolwYJZ7CHGLBmtAkBslQ24Uw2wkKqRywd4/sBzQKJgt
         EliQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtQzsBtXGE1Vbfowfv2ppmlJb9adPdYXrjcQuQY78DKMQkuFtfVfSXdPnzBiDZ60uwb13Y8liRMPq6Q1OggvOy@lists.infradead.org
X-Gm-Message-State: AOJu0YzAmrwfRru9ighD/qocVOPx3DY0ldRiOKpk7USXYu7UKDdYNVGJ
	YKH9DLMd1Gx2z8cRZuTq0pHT63AZzvFlHZSYROZpL03SvYjNkmbv5XES
X-Gm-Gg: AR+sD10FFE3npX2lDs0AYJd4i4Z683psQxmkaoZqEaGUTxTSAdpIFz7+QkZEc/vUgtL
	O8kAewdeP7DCkZSNyi7HphJrlHEd5CeiNX4PnV9rh1NmZsUokkbgvY6gbrdKtKY+gEo+JejXgeL
	81uJblYC5pCzMWlKlZ8gqGoiYD3BAggaef0VT8YI3srYxcEJgupPCHJ4FAIddIJIP7Mgf24bP3y
	qWl8ZWgayb4Mr64SavZuhvA7nX3d5++svizc/Pz7WJsBxZiskUlzmYYV58n/DGd+JxXy+tn9uM7
	XO+MfXhDtn0OX4j+gV5im/QrA9qFd3InxS570FCOj5mD3yqCOwUpgOWY/RIrZDWp+XN6zAFbZVo
	HkrRUzLI2AGrqFYAHV42joozIolRAVuX49rQswuL/B5becn72mXnCXmzjsdxPTSdnmq+wvmjF1I
	Heimws3yuKAVmS0fd0Sp6EsNVmXrr+uXIjsMuDfuRtWFkjryJsx5sYxehSbFjGBSg3YfJ+QqGRY
	rHyK6TO4BFrgcfJm/eXj2mffX37q9hxRf5YaE2kSsSEtqRW9dHZ4olMiaVnrKsFPk1/A452sO4g
	Vsc2vs1X0DQxCu1yRnIvIfmoWBVsMbA6alsvGxdp0mCDOKUXUu9tcfDdFTOckoj8Sz+a6XBQCGK
	Mp9g=
X-Received: by 2002:a5d:5002:0:b0:473:823:1924 with SMTP id ffacd0b85a97d-47fd7314b2cmr986964f8f.39.1785521940802;
        Fri, 31 Jul 2026 11:19:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1756sm7293694f8f.4.2026.07.31.11.18.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:19:00 -0700 (PDT)
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
Subject: [PATCH v4 5/5] serial: imx: serialize imx_uart_ports[] lifetime
Date: Fri, 31 Jul 2026 20:18:44 +0200
Message-Id: <20260731181844.11330-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260731181844.11330-1-kmehltretter@gmail.com>
References: <20260731181844.11330-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_111902_621567_9776A79D 
X-CRM114-Status: GOOD (  17.46  )
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

