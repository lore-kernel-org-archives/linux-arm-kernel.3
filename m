Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CA5CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Enn6naQw+wLmV0GhfZ0seolUzIj1ObU+9VW8J0DyP44=; b=LnurEZKTJd3LiNzChmRtoonZ46
	+H+nOSKowDSlgQcD39s4qj3GLEOjhsyZBmzO1Q3SbICv3mTEfR9xqY+HAkicbdsAguJX/wjXH8jUc
	WfqimO1FVvEdbIfOTbm/XvmyQBl500CfESxIOGi3Nl1ifX+S9MZEUymG6KM8uD4fRdo8AgOcMV16s
	6pnZcObzxS7of0LJifdJjDSjclsLhSuWfSfmdJmeW4MHXSQ4uWSjQlMKqBaB1iTWsJX8Ne/WUltRF
	AdS98ejT3JhOVvDo2QssGhzAXBHmWWEJL2A7Y5TqcDgcZ1QfEP9z12skH3oRzWlHubFh0kHBps6PN
	YgIB0BAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX54r-00000006SnD-1FVm;
	Tue, 09 Jun 2026 22:37:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX54m-00000006Sl1-3fOc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:37:42 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf18c30bb2so44092815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044660; x=1781649460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enn6naQw+wLmV0GhfZ0seolUzIj1ObU+9VW8J0DyP44=;
        b=DaHzBnQiBTxdRuRgLw991louTau2Rb9I3oj6t76WKJZHVzj68+RV4FcSx6MsOgbJb4
         00F3kX9j37pp+ual9fmZ3TrLlarS4UlEMIlyG0q0lKAte6ff0sgY+ahDZ7yr+XSZznY2
         qy2dwFgYhx/RUCQ0Wf7p57ZvvQf6vlVwL58Wt/jxdLlffil+QMnqk0sfHAPN6itu5ByX
         IYpuucjr+V5ZMSV9ElWqdb59QC9QIsOeMqe/+TzECAOhr7L01RuwPMyfamPLuAjeVrRF
         4k3Nb8fA9QJQBTGXUXAHitWJnT8hUKmGF6N+9ZYfHYhXhZM5lOZ2VL6Ju7GWq1IwwAcG
         g3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044660; x=1781649460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Enn6naQw+wLmV0GhfZ0seolUzIj1ObU+9VW8J0DyP44=;
        b=a0BcdO31Rpx8B1nI97HsIp+E6M5DbSff31rlp6HRUao9ofMkcI/3zU0y9cblBZrxTs
         va61AwuQuHw1PfoDcSRTCC8t7p3xn/luk25b1K6i5BF/F8oCYUsblELBGfKxiHG9cOWo
         srn0FPO/3LKahZ9OTXPcr9jyxdkkydhtug5gHuiHeaGfa9oFcnB9CZx3lRHrnEAKOuLg
         CggcFk9mrh1kH/giA9KoEvFGaO1bUNrur361/4kfQRRWVvG2Wk4YRLeuXJUWKIKOYd7/
         EQsCKImbmo4D+luOmgNmiDUS8jvaZ2Axx9ptbIW5JBwP3FkgX+UEIu6cI+yC6m0MueQa
         DMzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1P8MW9YSwzv7yCM2BRSJBoIR0eD25AG2WfRhtjcoifpWWpZ8IygH3sJlcLYmX80ZoL0/NkwPLsB57AHlncJY7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4npX/SDU6dK3i5imozX2EiF+hz95Vnd8dDlFGVPFhnFsU08C+
	f+LBb6WDzqApWt0/ismQl9Q5O839yFo1iwWI0DnTcZXiyuxv4xkhlw4l
X-Gm-Gg: Acq92OHBC+h6efFjry/l6p9RU9v2Cv2kZRpCSgHWclCopPpzSWe22cnpVCiUKzBcPRn
	S35AFLalRMuH2K/9+eNWrwEp5HId1jZA0B9hi0mo4p7lM4JYIJ2Hi/cVL3wT7FLaMJHYFQV5KC5
	tvVCDvrgspqakJAFj7Ue7NFXCct/TyPsuKjAeviooaW85PwQipOK5Xk030NwQ2FW9spGDxlxlBK
	5k9w/WiBRgLPC/p5Kh8hZsQGvPGbqD6bicl5x5l3asni6q1y232Xv4oifmPkFO+2PCKpIXp2Aow
	5ikqGSjxR3nAEWSKzKR9R8bjxFflr3V2c7TeAktGXgHCAwr8tS7N5Ygl+yW+8i+qFPGp69kB20F
	qmC6QvB19BPi5cv6eULCBimpoKh82eGNMPPMg5CsvFuGkdTtsG1AWrLPpo3DtjtKtodQxI9BzVy
	jPtjvddFvuRqnn5XmIeXmDIkpmm9q4Hxdr2eWdnlNaT5bFWe53WyX0UURx2MpRUrxprpH9nNxcl
	A0Rz6iEAIgsQ0YdsfzV8t7eZpgu/qoco89/kNLq8fHFog==
X-Received: by 2002:a17:903:1aef:b0:2c2:7e17:39f6 with SMTP id d9443c01a7336-2c27e173ecfmr119389525ad.36.1781044659986;
        Tue, 09 Jun 2026 15:37:39 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm293750655ad.9.2026.06.09.15.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:37:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv2 4/4] serial: mxs-auart: fix IRQ registration ordering and manage console clock
Date: Tue,  9 Jun 2026 15:37:17 -0700
Message-ID: <20260609223717.41670-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609223717.41670-1-rosenp@gmail.com>
References: <20260609223717.41670-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_153740_958587_E9D14EA9 
X-CRM114-Status: GOOD (  19.75  )
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

Move the main UART IRQ registration after uart_add_one_port so that
s->port.state and s->port.lock are initialized before the interrupt
handler can run. Mask all UART interrupts before adding the port to
prevent spurious IRQs left by the bootloader.

After probe succeeds, disable the module clock for non-console ports
since startup will re-enable it on port open. For console ports, keep
the clock prepared so auart_console_write() can safely call
clk_enable() from atomic context.

Guard the IRQ handler and get_mctrl with clk_enable/clk_disable since
GPIO IRQs and serial-core status queries can fire while the clock is
disabled for non-console ports.

In remove, disable the clock for console ports to balance the enable
done in probe, preventing a clock leak on unbind.

Assisted-by: opencode:big-pickle
---
 drivers/tty/serial/mxs-auart.c | 49 +++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 4499e3206e85..e2b656638ab3 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -738,9 +738,13 @@ static u32 mxs_auart_modem_status(struct mxs_auart_port *s, u32 mctrl)
 static u32 mxs_auart_get_mctrl(struct uart_port *u)
 {
 	struct mxs_auart_port *s = to_auart_port(u);
-	u32 stat = mxs_read(s, REG_STAT);
+	u32 stat;
 	u32 mctrl = 0;
 
+	clk_enable(s->clk);
+	stat = mxs_read(s, REG_STAT);
+	clk_disable(s->clk);
+
 	if (stat & AUART_STAT_CTS)
 		mctrl |= TIOCM_CTS;
 
@@ -1079,6 +1083,7 @@ static irqreturn_t mxs_auart_irq_handle(int irq, void *context)
 	struct mxs_auart_port *s = context;
 	u32 mctrl_temp = s->mctrl_prev;
 
+	clk_enable(s->clk);
 	uart_port_lock(&s->port);
 
 	stat = mxs_read(s, REG_STAT);
@@ -1118,6 +1123,7 @@ static irqreturn_t mxs_auart_irq_handle(int irq, void *context)
 	}
 
 	uart_port_unlock(&s->port);
+	clk_disable(s->clk);
 
 	return IRQ_HANDLED;
 }
@@ -1603,10 +1609,6 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	}
 
 	s->port.irq = irq;
-	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
-			       dev_name(&pdev->dev), s);
-	if (ret)
-		goto out_disable_clk;
 
 	platform_set_drvdata(pdev, s);
 
@@ -1627,9 +1629,28 @@ static int mxs_auart_probe(struct platform_device *pdev)
 
 	mxs_auart_reset_deassert(s);
 
+	/* Mask all UART interrupts to prevent spurious IRQs from bootloader */
+	mxs_write(0, s, REG_INTR);
+
 	ret = uart_add_one_port(&auart_driver, &s->port);
-	if (ret)
-		goto out_free_qpio_irq;
+	if (ret) {
+		auart_port[s->port.line] = NULL;
+		goto out_disable_clk;
+	}
+
+	/*
+	 * Request the main IRQ after uart_add_one_port so that
+	 * s->port.state and s->port.lock are initialized before
+	 * the handler can run in response to a bootloader-left
+	 * interrupt.
+	 */
+	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
+			       dev_name(&pdev->dev), s);
+	if (ret) {
+		uart_remove_one_port(&auart_driver, &s->port);
+		auart_port[s->port.line] = NULL;
+		goto out_disable_clk;
+	}
 
 	/* ASM9260 don't have version reg */
 	if (is_asm9260_auart(s)) {
@@ -1641,10 +1662,16 @@ static int mxs_auart_probe(struct platform_device *pdev)
 			 (version >> 16) & 0xff, version & 0xffff);
 	}
 
-	return 0;
+	/*
+	 * Disable clock -- startup will re-enable when the port is opened.
+	 * For the console port the clock must stay prepared so that
+	 * auart_console_write() can safely call clk_enable() from
+	 * atomic context.
+	 */
+	if (!uart_console(&s->port))
+		clk_disable_unprepare(s->clk);
 
-out_free_qpio_irq:
-	auart_port[s->port.line] = NULL;
+	return 0;
 
 out_disable_clk:
 	clk_disable_unprepare(s->clk);
@@ -1657,6 +1684,8 @@ static void mxs_auart_remove(struct platform_device *pdev)
 
 	uart_remove_one_port(&auart_driver, &s->port);
 	auart_port[s->port.line] = NULL;
+	if (uart_console(&s->port))
+		clk_disable_unprepare(s->clk);
 }
 
 static struct platform_driver mxs_auart_driver = {
-- 
2.54.0


