Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0991CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 03:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Enn6naQw+wLmV0GhfZ0seolUzIj1ObU+9VW8J0DyP44=; b=Ru4WzNbLgHZWUnbp4Z02qU47DN
	aJAj7FJUDxu1xmqz226CLIyYanzv2XeiFhKJeqda4ljixrG5ZWpk7gILXhJMeDVU5pZlX45qyhmTB
	t3u/dLG1EueztrcmStMLXMI5FPGmxLXXpjcYgQ0Ccs+ASclUqmEqpgbwbB3YoDfJaHEoeCfdjBA/x
	jsa5JpEBB5WbJJ4G1NHCQO0fYkT5/2g3Fxf78dmb9MQ9cJ+9uKd4pd36LiYCVMKFlRkddmX69zvw0
	LVnrpnMsmYIhV2es2buFxl5jCBBp7e/ynDo1dkDxx51Oi7NY/YbZwz64eDKVgGBqx1MydhW68zLUi
	Q4/9V2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGN-00000008cmo-1T3B;
	Thu, 11 Jun 2026 03:39:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGF-00000008ciX-477f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 03:39:21 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8424b00710aso4671989b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 20:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149159; x=1781753959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enn6naQw+wLmV0GhfZ0seolUzIj1ObU+9VW8J0DyP44=;
        b=EwKFNoyglZcr/j8DUDL/QfqizYR37WDZICoiuJCoUogdfA2KVMG42UxhCdbiN6YbVJ
         H4XIJb0ZVg/hIF2pLEy/vKfiFJyZYz4cZ3pERPONzJ4yxHj1nNDiF5J/ymFSaEDpkfQm
         ugcR3xTJPAlk1+B+hQ54yhhrQPmDMH4voxSp+YLmEhwSX5GVrauUE5O6RM9hlY5865oE
         5XShoVPI3AQ52fn2yvm29x84XmREVK86+p1z/1ObAM7DqTtXpy9qaJO9Hvg6fVSW5TVs
         +W2Zy07vuPBK3QIh1YbdNp+c/B8V/xJGVidcC+pZhOzVm3f9TvMS4lTLtM57o2uf5kop
         tseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149159; x=1781753959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Enn6naQw+wLmV0GhfZ0seolUzIj1ObU+9VW8J0DyP44=;
        b=ilNIb3Xrt57HdrY+UwP4OLrn0kWQO2F4iZwxd12z+LPNv4ZBZVtSoyOs7C39hafwjk
         d2w9ybcvm6glxbHHG1W1R1XlV4FbNic9a8ivKFx9tRpJYpA9erlXQyuGXltEyUi9HRlB
         XF1bvoBjCHsT2mmxQTwTrhlLLy1PKkeAqDsjX92BgzblOE2cNe143HrMV4IuNMGHlKFV
         kht9e7IYFZf9oE/mfr3cND1OjhWX9NG/ArjTlQth/snE06XYrBA67N/sb/P4eDfhG0ep
         poOjhDYLJZ6xhgeIO4SZVJEPnzzx38mn5dv1SNobjwRBYxUxombbL2r54+E4i+WzHnu5
         NiZA==
X-Forwarded-Encrypted: i=1; AFNElJ/NxP6baL8gQcJIbHxQ61oVvPEUqNAe052U9SFKPLvGWuI366V+pjyrVzlXB6Oy/7zJXAydaBWuZ7OfLQqn0Wbq@lists.infradead.org
X-Gm-Message-State: AOJu0YyltCy3Ojy6HHbutFLrtGF8bD33UVK38IMjs18Am5AD95bo4dJb
	pJGLYaXhA4PrfkggJBoWaac4pjHCQHqIQkvVn7q9pxGh1UZh6BL3Zsxb
X-Gm-Gg: Acq92OEvoE2DnYDwDgwQOqeeil+ZFmEg7qQnX2n9Hb6KJR+/fuXwzCQjVTqRtvc9Mqu
	7+11TBHzOFQS4kHFv/osCN70pVXar8bOyqB3GVU4m0+QZj1S7s436CtS5uySNLQroZDc262AfIc
	e42x+xfnjL9Liag9H+2VYfMt8RLXRx/W6PUJQaA4HznsluroGPSrVTNS30PbJ0ELopa+/e1uAsj
	VrE+y4KJI1WF0MTHw03UydPKzn5u9dq9f5iqm2BfvePzDR8PznrPqctAIjsS8W03MfO5s2drGAG
	QGpWozG/ysjul07XWo2dlB2ndpuCKbcvEXa0APfHh2QLJ2zDVle0kYr/GI6Y4+BLQX7NZqHEtIe
	uQG2JfiZCQ2Bz3kwkIfMrQVNOIUSy+VD8uY2za3uzrOoeXXvbKBW4Sm8WZpVmTiEJ/zHEI0LtnM
	chJMXLUCDXjvn/VmASBwlcsoiiFFVIvOTwaYfdcWl2uHXrc3XBVkTbIAKt5d1epORHnxivFeHLL
	zH7wrPQgszIGD0aDEzxSkB0YAbnxQgpmGLUa/U8k5OgsrL/+pa8fQ+v
X-Received: by 2002:a05:6a00:1812:b0:842:3801:47b with SMTP id d2e1a72fcca58-84336a29db5mr1024457b3a.18.1781149158983;
        Wed, 10 Jun 2026 20:39:18 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:18 -0700 (PDT)
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
Subject: [PATCHv3 4/6] serial: mxs-auart: fix IRQ registration ordering and manage console clock
Date: Wed, 10 Jun 2026 20:38:54 -0700
Message-ID: <20260611033856.6476-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203920_016487_48E401E9 
X-CRM114-Status: GOOD (  19.40  )
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


