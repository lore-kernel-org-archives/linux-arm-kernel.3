Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75967CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQM8/bXLwnHI0Nwp6B/mbCtcMHwqmZBefz4Rf3Ov6Bg=; b=l4xZYsOpaW0NeRBqmlY/KmuKci
	wpErK2NYS+N/FtvimqkPL/kP9i2dsWzNJZ2XOvoW/AFwvuEGgGZfp8zpqoZAcjoQJOoEYRjoMU6fE
	PgW9aGUfhd8CC6J4+FvXjuzqQz8ehhIX5TFD2nwNEyiqGyqcwTSDLyp0hHiuUNFvu3xanL1aN642x
	VtLsCHomFg0rHsiZfZolu+Au+PoI2cJFw7ts5IaafRpr2aQQnOYcAZ0lRCQW8EPMqPWM3NO5R60TT
	wjZtC8PDDUWcaRrdDAtaywR2ORuIokzkQiUiJx26DQGpb+nRl3xKJm9XgplD7syjeZ0VbGYHQ5wRe
	98PX/n+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbpD-0000000E8qD-1UkB;
	Wed, 03 Jun 2026 02:59:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbpA-0000000E8nK-0oDe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:59:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso35527695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 19:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455559; x=1781060359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQM8/bXLwnHI0Nwp6B/mbCtcMHwqmZBefz4Rf3Ov6Bg=;
        b=MTWkW0OXlXQX5prIAq00/k1wqS14frRHMdl5BAv3DYCRb4X8DsOIH27p2UP6vv+Cg0
         tBs5756EnMW1PsJNXPolrLghyfLKqFxi6wyov4uujXRkDOeAndf+BFBKo3pvf3G7q8eQ
         Gt0NaqOlXA2z2Y2vUEMIn4ai3F8k6fjdUnzY7aT4CE1FPzhuW9ThOpDv/N7R9In7z1lB
         U3ZWluuBvvTBsdab/Qx7GX9Pa4Jjd44nF8iz3fSrNx5KQg6HZlp4IepQTZgShaLMfBYI
         dDngTrblkh10qB/sYt7ipW76DMNW0WKxpz1RWy0uuFXuZ1jFix0/tXS2y/kmk4Hq8gqh
         nPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455559; x=1781060359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQM8/bXLwnHI0Nwp6B/mbCtcMHwqmZBefz4Rf3Ov6Bg=;
        b=EcjuNVW3rmPrOStSAJ8PXLif9av8it5PdQX+N6fNgdwgw3zTBcGkkPZRQd8RX8KuO/
         0btitzeA0lBbxqZyFsJnKsXQFhkcsF9kIZ9pH8/LVa8Cu0h8ygUTc2RniL2YZ7L75eF8
         NE+PqRiKHiHCA3PBT7ARlYrqUVQ3ZudYFZ2HAIO0UVrhFzm+vH6DL1pafoRZcASc6HYR
         120QDW00KKTe2GMa235n87P0ciutbDBsinMuEguZ6BsLMJasnZUdsubhWqwRZZZidnW4
         Q165sjgAH7c2MDx3sm1rmfRHIIw05G0FL/DUcf8m72bqWfYBIimBOTXi5iQ6sNNki6Dh
         61Qg==
X-Forwarded-Encrypted: i=1; AFNElJ+bab1AjfmssQ1vF5O0t0MuKvoDChw8cLAQh2/vjKlAo3H7G1HY4BV3473q3+wXytT1CCaY8G8DAXbb2B1OEy8J@lists.infradead.org
X-Gm-Message-State: AOJu0Yw70/I2uNIJtBvBe6BQgNez5a+cZZT5p2C76SHunPPiLsCEExUu
	ajQ4TXhwgNqX9zVOXV3xdDK1vGh9mglqyglePtzmFwE0VQYFPcF1wbZI
X-Gm-Gg: Acq92OFp+T+M8jlJ3+cSawE1+6X12iBeecS//dbh+dYKCPoLmEO5FDC5+bo448byAtN
	amekQKab9NU8RB2nfYpexDq6mckNBo/1LFLBYoxFxuPdwjaX/OPynMCBp+CAW2bNYgfFzTCowTT
	A8Z4WF2r4OlyZUdD5aptwRNKaJqmkrmuW9N6BrzbzaE9wHBmC3SePG9j/EDVdw2t7AcOt2fLgIr
	DMb0jXm5WIPvOmfFCFJd7WrwE6HPavG6W6LcQzyIAJfe/eN3Ea1oSZbtV0z60YiFRIC8dDdGTyP
	1MDeNvOgKkkgFmET8J03c1JNZLPOiymYHND5/zDsItuaNWjekehM73M24PEmz9GSg6Vs4MmxswP
	nGIuzgwfYarPF6OTIkOXVkNlj4zfb9renFOroS4fRxS2UQzZBp59+pEtCgSsUnTOLQqaLCf0XiO
	40SlJ+kUWVbZ8HaevkzhKwW+wu9N35MBvFf/TYfC2egP3NwJhLveNrG0i7KCtxyIe9nd+fp7xJW
	AdYS8gp31kb/pprmqHQpXBVQoaXkff6YNkJNHq5h3MVuQ==
X-Received: by 2002:a17:903:948:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c1639ec888mr14025245ad.4.1780455559275;
        Tue, 02 Jun 2026 19:59:19 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm8093805ad.17.2026.06.02.19.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:59:18 -0700 (PDT)
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
Subject: [PATCH 3/3] serial: mxs-auart: fix IRQ registration ordering and manage console clock
Date: Tue,  2 Jun 2026 19:58:57 -0700
Message-ID: <20260603025857.287148-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603025857.287148-1-rosenp@gmail.com>
References: <20260603025857.287148-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_195920_240477_E7B412DA 
X-CRM114-Status: GOOD (  16.13  )
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

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 39 ++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 4499e3206e85..d40d82f112c0 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1603,10 +1603,6 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	}

 	s->port.irq = irq;
-	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
-			       dev_name(&pdev->dev), s);
-	if (ret)
-		goto out_disable_clk;

 	platform_set_drvdata(pdev, s);

@@ -1627,9 +1623,28 @@ static int mxs_auart_probe(struct platform_device *pdev)

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
@@ -1641,10 +1656,16 @@ static int mxs_auart_probe(struct platform_device *pdev)
 			 (version >> 16) & 0xff, version & 0xffff);
 	}

-	return 0;
+	/*
+	 * Disable clock - startup will re-enable when the port is opened.
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
--
2.54.0


