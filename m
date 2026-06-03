Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE40CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBVGXB/2UTdyKtSi19WHbufi1S2ilaO9ich5RG7k16s=; b=0HqX+wYjFOb7xZdODwyP9QH5Jv
	dCbaxHSHpQG98GVRuPSKfCOtJe1s9Jnix79VzJx/HFRPY/v3Ui5GSlbeDKzVixC5CAFiXlZN6oPWl
	aPDjrcavfVJrWNSaEYWBbZAUAFdgNQ/6I3C4gqoIt+pPD2c3dzZJldep+/3U7BtXmrKHHctaxWm5z
	60j3sgyYf0WUSkxMuito4onxT+bswrZVNg8bv5KKPar/UUSXgQiWKSSTMJBvxkP2AtDdolFtz0P3u
	Sw4hIUu512orvwfDqfMPWLXRrOZrNWzbdC8ZqyQ+EUmqQ91FQhhB0g/fvgcNGCvJn1OM2AN1mXHw1
	IVzzHFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbpB-0000000E8oS-0cBL;
	Wed, 03 Jun 2026 02:59:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbp8-0000000E8mU-2sI6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:59:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c132ac5ec2so10784785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 19:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455558; x=1781060358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBVGXB/2UTdyKtSi19WHbufi1S2ilaO9ich5RG7k16s=;
        b=SIlsdbtd27VyrxSg4y1PRWu3r0xW41H88V/p+90mO6zOzABRjE6I+QGaLqQDBkGDdd
         ojNeEvQYG2QDWYxqtfG+X9hyPOVz1OanXnulSo5vo15rtAZN1bkmLkiriugj9bLKunPO
         1edDVRhujl5fhv/sTuC/eQy2Vf2EhCjtOAt+qtoXiN8NAWahV35Gdkn4ybgrTqkKl49Z
         hcW8G9GLtteVHggxfXT5cbOOP7p1eWIgWFRcgqlE083uEeIeVB5IO0sJNPX360dfrk3i
         fhaAqsB82UICKkEgEXDr97eDaO3GHkaVBxgQ3mfnXR9d31i+0cEfcG7RVBvWJPvM0Eqa
         uz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455558; x=1781060358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EBVGXB/2UTdyKtSi19WHbufi1S2ilaO9ich5RG7k16s=;
        b=BH3o/lozL+HEJyRREUSg7jrJSxxt/hDIjg0r1Itw4Wy4k9qTZ8W8oq/O6QoAsLQeF7
         5PS10U7BGM4dEzjidN4ZKewt6IDJTVQGD5DFnFsPJtD5GP6bMhQG5LkBimnYjKl4pTRo
         g0+g9Cx49YeDUxkCVqBFHTO/se+5ogNsYtQTzrR1S46Z3kPEwkt7E22VsU5GArJTrTG9
         uUwKjkUE+Ank6Nm0K2JfRqu16gEOoSyzhHZxfgCaiHOhEdfpYpY+m6QcbvvholpIkV+o
         gD6R2xNtKv8gVC0/aEFaJ7jbqVwi7r/b5Sq1l9FMVTIYAJrChPq0rwHXLGzNdG3Phywa
         +ptg==
X-Forwarded-Encrypted: i=1; AFNElJ88ET0cWwBarg59pBDjsOXXrHbUdpluvCEzRtxBLywoTrgBBvcMR9jUQ4kZbcW+WTgNO07QbIlms6b+k7ORCcvp@lists.infradead.org
X-Gm-Message-State: AOJu0YzNwvOR++7z2bYdxPtDBSnL4aP2nUyOFCHnhpufHQgPkdHW0u8x
	e3HXpXHYazq6czHMCl3T8/UePkokalqyGAHQn9j1j8vMQ5ouLJMMBCGa
X-Gm-Gg: Acq92OESldvEzl1ATY4KIVdtqMBCQWuc9enACtva0lAfLKmxXXHXkf9xWHEXKlrjBXo
	qfhWgpuQRwex4nGQgBA9WuNONVxmRUv36UYUneqz/WJ4lG+hTYcDxfy/hmd/4nmLlcJntOACAM6
	t5Z7cPBpiU3fK3TPmMObEmvtKRbJqarh3xQzvTBlo7yP140GtJNUHf/rSySaCIAoPm/3S1xE1kL
	LN4mCBxQp/4IIQunypwQWhtJPNkv55JtugBWEWqaWYq9Hx6p/KfiBBisi3qidklXWlo1LpoY6B7
	+2ltzonFA7gimCg84PfA3b/y1w9NRfcOIY9PY0aWirHhkv8AbnCUlib45IH4dJKQE8KUY3g1x+U
	S4Ja2N3BTdX9+3rGsgpzsyZ29ntBucPnLyN9GZk4bjOVO64K24+Sxkqv3H4+4n1UcH6EPDzKJJW
	WJMlBn4VhrMR2KrA71wwmpN2hZo26a8QZZ7uptuvfxmc9CyBEkZDW90YFK/DEK+XmB8vGOQg1Mh
	QwNFzuQg7AEbAL6iCtjhLaI1n4D5X6qa58elJ1++21kpw==
X-Received: by 2002:a17:902:ccd1:b0:2c0:f807:56b6 with SMTP id d9443c01a7336-2c163a16bcdmr15056895ad.4.1780455557822;
        Tue, 02 Jun 2026 19:59:17 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm8093805ad.17.2026.06.02.19.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:59:17 -0700 (PDT)
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
Subject: [PATCH 2/3] serial: mxs-auart: use devm resources for iomem and GPIO IRQs
Date: Tue,  2 Jun 2026 19:58:56 -0700
Message-ID: <20260603025857.287148-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603025857.287148-1-rosenp@gmail.com>
References: <20260603025857.287148-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_195918_728747_F2F4D23B 
X-CRM114-Status: GOOD (  18.71  )
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

Replace platform_get_resource + ioremap with
devm_platform_get_and_ioremap_resource and convert GPIO IRQ
request_irq/free_irq to devm_request_irq. This eliminates the
mxs_auart_free_gpio_irq function and its call sites, and the
out_iounmap error label. Simplify the remove function accordingly.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 55 ++++++++--------------------------
 1 file changed, 12 insertions(+), 43 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 1390fa000a5b..4499e3206e85 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1517,15 +1517,6 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
 	return 0;
 }
 
-static void mxs_auart_free_gpio_irq(struct mxs_auart_port *s)
-{
-	enum mctrl_gpio_idx i;
-
-	for (i = 0; i < UART_GPIO_MAX; i++)
-		if (s->gpio_irq[i] >= 0)
-			free_irq(s->gpio_irq[i], s);
-}
-
 static int mxs_auart_request_gpio_irq(struct mxs_auart_port *s)
 {
 	int *irq = s->gpio_irq;
@@ -1537,21 +1528,13 @@ static int mxs_auart_request_gpio_irq(struct mxs_auart_port *s)
 			continue;
 
 		irq_set_status_flags(irq[i], IRQ_NOAUTOEN);
-		err = request_irq(irq[i], mxs_auart_irq_handle,
-				IRQ_TYPE_EDGE_BOTH, dev_name(s->dev), s);
+		err = devm_request_irq(s->dev, irq[i], mxs_auart_irq_handle,
+				       IRQ_TYPE_EDGE_BOTH, dev_name(s->dev), s);
 		if (err)
 			dev_err(s->dev, "%s - Can't get %d irq\n",
 				__func__, irq[i]);
 	}
 
-	/*
-	 * If something went wrong, rollback.
-	 * Be careful: i may be unsigned.
-	 */
-	while (err && (i-- > 0))
-		if (irq[i] >= 0)
-			free_irq(irq[i], s);
-
 	return err;
 }
 
@@ -1586,7 +1569,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	s->devtype = (enum mxs_auart_type)of_device_get_match_data(&pdev->dev);
+	s->devtype = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	ret = mxs_get_clks(s, pdev);
 	if (ret)
@@ -1596,18 +1579,12 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		ret = -ENXIO;
+	s->port.membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
+	if (IS_ERR(s->port.membase)) {
+		ret = PTR_ERR(s->port.membase);
 		goto out_disable_clk;
 	}
-
 	s->port.mapbase = r->start;
-	s->port.membase = ioremap(r->start, resource_size(r));
-	if (!s->port.membase) {
-		ret = -ENOMEM;
-		goto out_disable_clk;
-	}
 	s->port.ops = &mxs_auart_ops;
 	s->port.iotype = UPIO_MEM;
 	s->port.fifosize = MXS_AUART_FIFO_SIZE;
@@ -1622,21 +1599,21 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto out_iounmap;
+		goto out_disable_clk;
 	}
 
 	s->port.irq = irq;
 	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
 			       dev_name(&pdev->dev), s);
 	if (ret)
-		goto out_iounmap;
+		goto out_disable_clk;
 
 	platform_set_drvdata(pdev, s);
 
 	ret = mxs_auart_init_gpios(s, &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize GPIOs.\n");
-		goto out_iounmap;
+		goto out_disable_clk;
 	}
 
 	/*
@@ -1644,7 +1621,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	 */
 	ret = mxs_auart_request_gpio_irq(s);
 	if (ret)
-		goto out_iounmap;
+		goto out_disable_clk;
 
 	auart_port[s->port.line] = s;
 
@@ -1667,11 +1644,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	return 0;
 
 out_free_qpio_irq:
-	mxs_auart_free_gpio_irq(s);
-	auart_port[pdev->id] = NULL;
-
-out_iounmap:
-	iounmap(s->port.membase);
+	auart_port[s->port.line] = NULL;
 
 out_disable_clk:
 	clk_disable_unprepare(s->clk);
@@ -1683,11 +1656,7 @@ static void mxs_auart_remove(struct platform_device *pdev)
 	struct mxs_auart_port *s = platform_get_drvdata(pdev);
 
 	uart_remove_one_port(&auart_driver, &s->port);
-	auart_port[pdev->id] = NULL;
-	mxs_auart_free_gpio_irq(s);
-	iounmap(s->port.membase);
-	if (is_asm9260_auart(s))
-		clk_disable_unprepare(s->clk);
+	auart_port[s->port.line] = NULL;
 }
 
 static struct platform_driver mxs_auart_driver = {
-- 
2.54.0


