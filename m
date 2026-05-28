Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63425CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OLSjl6CXuzR38T343RTt9SyGP7hxMKOqUC5yJePUlLg=; b=JKI14TD1MwTY/L+ntPWEVsm+hR
	HnldhnjyLNvEAd0koWnf/PUPsmWN+2gc4o6RQNLcK7D46uitUrsNGM4B537hL/9Ec9HLGsa17+/gZ
	+lWS4LXPc9AUwr79GDsGwqFOeuwva9J8qNCwtm2lGYJCJILIFf7yx+7PERMbKf8m8274iM4I40mFC
	OrZWvSMGcSRGF9YrJWrmVq79HlpIpiVLduU5GMzQhW+XkyA7mfOLyNeHXvOcXYNWgRK5v1B76ZcMr
	5Zq7k9GtAOA3JM+oxhsPXHRKcO/8J0tOM5LnZXu7stZ4fpZ1p1MoLHwx6wRpLEoATxiy4Qa5VYSNA
	oH+9CDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjoE-00000006VpW-2FLa;
	Thu, 28 May 2026 23:06:38 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjoB-00000006Vow-3d5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 23:06:37 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2f0ad52830cso17247066eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780009595; x=1780614395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLSjl6CXuzR38T343RTt9SyGP7hxMKOqUC5yJePUlLg=;
        b=cuF3pVCXAj2TGI30PcLBCeDm523HZTuQoG0a4nCRQiT4IHi+GS6YapeD5+S9t2qwzX
         PvGfc9wtyNxI1SWvmbACJnqduhGedeacWz8iyPHnl8K1pgh9t4U0WSMOw7fmNbrsytVb
         sjhVaMBGpqqpqxCfMTSkpRDC8lIgRrdAQZNyfH/YljIZPsbd+6yFtCBf5ru992JfJ7Fa
         awNNmzQYGiB2GKDqLnTK8MDUmpTnVE7bauv8YZ6sMSAcTv2pZ6zLLqG3cf1KbPFm5xyI
         vM+9H/yrExzc9RICdr59M/uzO15S/8zHffAGV1OL9Yw0vnx8uSG3nuJTuwEGPeTDZGs2
         K+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780009595; x=1780614395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLSjl6CXuzR38T343RTt9SyGP7hxMKOqUC5yJePUlLg=;
        b=p8RjqazY0feYo5QyyWlqoNElXtXyMf5eizIHqxn+3OkJwWpLFHHEzEUpCD2ais7U8/
         D64QCCBYRjkKgBPIu/Fs8Heif21+s/oDtX9RGSo8L8tA9uZ4WSNInS9rYwpzcF+giH3d
         LVWpsC0Af4LlM/TVuPXQi7rVI3pqt0+bfV0MkrxqF/JhtxQ2w3uPc7T5gMjE9RkUTNXk
         67FFUnWO6cp5UT9a1tIIQWrhbZj7BjxvaEE1ljiYy4+526s1nnXMdtV2RGfkzzO84EnP
         xQn+WaMAs2c3a35P2eGfBubYFcsv6bP3gqNmiDHalNW0gL7ARJbqosDdy/lPy636IWiZ
         sfUA==
X-Forwarded-Encrypted: i=1; AFNElJ+agZ4fRIZXGVALUau/qnAoFhVPFAEpfgLTxVtEEdaIbD1v0/PXwPsbTKHLR7bocw7J0f+P4T1ht/1Fvwcg31PK@lists.infradead.org
X-Gm-Message-State: AOJu0Yya/g5h1aD8SPKoTVa69kcDCrr1kPLiGc4DeV1gOO3NXX6I1a1g
	bkRuZL2cBrTkF8TziYnMrewKxNv6Oqs1T6CaoYfdkF9mf0N8U58e69W5
X-Gm-Gg: Acq92OHgoHgUp070/9RCwyxc/t0OQ1kZTnTioQc5Qhtu/Fsv1bwZPJlx43RxNfNH846
	aTCrV+N87nqUIVMqjhKZnglxkNOqxsHBus85u/A0qC3NCim+hhHZM5VIjIH9xQAzJXdOhP4Jve0
	kNZUnMAGQkH08e0keKFgct9jIT4Aq8vYhivLvUOGyMLQFw5OPundztuIFU6TjK959S33+LogioE
	Faw7LSaVplll8KA3f1EhzUrNOz3/P60SGBBJydlxm115XJCj4sGrVs4P6UaGPdhkNtWmFAlM8HM
	0ltCwwJG24szmJ+wNL/DEaoByeopHbZE0s9AOQqDEOKCqOOznKrWStzAEbLwE347ay4Rhdmu0J/
	+b2eAkdmM9NFINFd/1CkJ2KjtKR8coNmqVJ5M8JCs94Mb3h2aB+7pJEN8Ityk4QYmtgBqqXrFwq
	n/+t/7MtzUslJd4kmiY5ohVhHXwhKQ5Ef973MD33b+fOowJS2ewnfN5WIRg/n0XYGeF2dbSqtzl
	iKcp+oGRbfaO+LBVT3or7qGWsBQJ8Oz1nqlWTXWnCpBeg==
X-Received: by 2002:a05:7300:cd97:b0:2ea:b975:3db1 with SMTP id 5a478bee46e88-304eb0f8bdemr260267eec.23.1780009594548;
        Thu, 28 May 2026 16:06:34 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ebcc8016sm223109eec.23.2026.05.28.16.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 16:06:33 -0700 (PDT)
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
Subject: [PATCH] serial: mxs-auart: fix probe error paths and clock handling
Date: Thu, 28 May 2026 16:06:16 -0700
Message-ID: <20260528230616.186792-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_160635_915177_4B38C376 
X-CRM114-Status: GOOD (  21.48  )
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

Sashiko reported three pre-existing bugs in the mxs-auart driver:

- For non-ASM9260 variants, mxs_get_clks() obtained the clock but never
  prepared/enabled it, leaving register accesses in probe at risk of
  faulting if the bootloader had gated the clock.
- The error path and remove function used pdev->id instead of
  s->port.line to clear the auart_port[] slot.  For DT-probed devices
  pdev->id is -1, causing an out-of-bounds write and leaving a dangling
  pointer in the array.
- The probe error path called iounmap() while the IRQ was still
  registered. An interrupt during that window would dereference the
  unmapped membase.

All of this is a consequence of using mixed devm and non devm. Instead
of working around these issues, go full devm so that everything can be
cleaned up properly.

devm_clk_get_enabled allows removing clk_prepare_enable.

devm_platform_get_and_ioremap_resource is a bit worrying as it calls
request_mem_region. Manual review of the dts files shows no overlapping
memory regions, so should be good to go.

Use devm in mxs_auart_request_gpio_irq as devm is used in probe.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 110 ++++++---------------------------
 1 file changed, 20 insertions(+), 90 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..8b6463df11b3 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1457,48 +1457,24 @@ static void mxs_init_regs(struct mxs_auart_port *s)
 static int mxs_get_clks(struct mxs_auart_port *s,
 			struct platform_device *pdev)
 {
-	int err;
-
 	if (!is_asm9260_auart(s)) {
-		s->clk = devm_clk_get(&pdev->dev, NULL);
+		s->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 		return PTR_ERR_OR_ZERO(s->clk);
 	}
 
-	s->clk = devm_clk_get(s->dev, "mod");
+	s->clk = devm_clk_get_enabled(s->dev, "mod");
 	if (IS_ERR(s->clk)) {
 		dev_err(s->dev, "Failed to get \"mod\" clk\n");
 		return PTR_ERR(s->clk);
 	}
 
-	s->clk_ahb = devm_clk_get(s->dev, "ahb");
+	s->clk_ahb = devm_clk_get_enabled(s->dev, "ahb");
 	if (IS_ERR(s->clk_ahb)) {
 		dev_err(s->dev, "Failed to get \"ahb\" clk\n");
 		return PTR_ERR(s->clk_ahb);
 	}
 
-	err = clk_prepare_enable(s->clk_ahb);
-	if (err) {
-		dev_err(s->dev, "Failed to enable ahb_clk!\n");
-		return err;
-	}
-
-	err = clk_set_rate(s->clk, clk_get_rate(s->clk_ahb));
-	if (err) {
-		dev_err(s->dev, "Failed to set rate!\n");
-		goto disable_clk_ahb;
-	}
-
-	err = clk_prepare_enable(s->clk);
-	if (err) {
-		dev_err(s->dev, "Failed to enable clk!\n");
-		goto disable_clk_ahb;
-	}
-
-	return 0;
-
-disable_clk_ahb:
-	clk_disable_unprepare(s->clk_ahb);
-	return err;
+	return clk_set_rate(s->clk, clk_get_rate(s->clk_ahb));
 }
 
 static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
@@ -1529,15 +1505,6 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
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
@@ -1549,21 +1516,13 @@ static int mxs_auart_request_gpio_irq(struct mxs_auart_port *s)
 			continue;
 
 		irq_set_status_flags(irq[i], IRQ_NOAUTOEN);
-		err = request_irq(irq[i], mxs_auart_irq_handle,
-				IRQ_TYPE_EDGE_BOTH, dev_name(s->dev), s);
+		err = devm_request_irq(s->dev, irq[i], mxs_auart_irq_handle, IRQ_TYPE_EDGE_BOTH,
+				       dev_name(s->dev), s);
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
 
@@ -1604,18 +1563,10 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		ret = -ENXIO;
-		goto out_disable_clks;
-	}
-
+	s->port.membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
+	if (IS_ERR(s->port.membase))
+		return PTR_ERR(s->port.membase);
 	s->port.mapbase = r->start;
-	s->port.membase = ioremap(r->start, resource_size(r));
-	if (!s->port.membase) {
-		ret = -ENOMEM;
-		goto out_disable_clks;
-	}
 	s->port.ops = &mxs_auart_ops;
 	s->port.iotype = UPIO_MEM;
 	s->port.fifosize = MXS_AUART_FIFO_SIZE;
@@ -1628,23 +1579,20 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	s->mctrl_prev = 0;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto out_iounmap;
-	}
+	if (irq < 0)
+		return irq;
 
 	s->port.irq = irq;
-	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
-			       dev_name(&pdev->dev), s);
+	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0, dev_name(&pdev->dev), s);
 	if (ret)
-		goto out_iounmap;
+		return ret;
 
 	platform_set_drvdata(pdev, s);
 
 	ret = mxs_auart_init_gpios(s, &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize GPIOs.\n");
-		goto out_iounmap;
+		return ret;
 	}
 
 	/*
@@ -1652,15 +1600,17 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	 */
 	ret = mxs_auart_request_gpio_irq(s);
 	if (ret)
-		goto out_iounmap;
+		return ret;
 
 	auart_port[s->port.line] = s;
 
 	mxs_auart_reset_deassert(s);
 
 	ret = uart_add_one_port(&auart_driver, &s->port);
-	if (ret)
-		goto out_free_qpio_irq;
+	if (ret) {
+		auart_port[s->port.line] = NULL;
+		return ret;
+	}
 
 	/* ASM9260 don't have version reg */
 	if (is_asm9260_auart(s)) {
@@ -1673,20 +1623,6 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-
-out_free_qpio_irq:
-	mxs_auart_free_gpio_irq(s);
-	auart_port[pdev->id] = NULL;
-
-out_iounmap:
-	iounmap(s->port.membase);
-
-out_disable_clks:
-	if (is_asm9260_auart(s)) {
-		clk_disable_unprepare(s->clk);
-		clk_disable_unprepare(s->clk_ahb);
-	}
-	return ret;
 }
 
 static void mxs_auart_remove(struct platform_device *pdev)
@@ -1694,13 +1630,7 @@ static void mxs_auart_remove(struct platform_device *pdev)
 	struct mxs_auart_port *s = platform_get_drvdata(pdev);
 
 	uart_remove_one_port(&auart_driver, &s->port);
-	auart_port[pdev->id] = NULL;
-	mxs_auart_free_gpio_irq(s);
-	iounmap(s->port.membase);
-	if (is_asm9260_auart(s)) {
-		clk_disable_unprepare(s->clk);
-		clk_disable_unprepare(s->clk_ahb);
-	}
+	auart_port[s->port.line] = NULL;
 }
 
 static struct platform_driver mxs_auart_driver = {
-- 
2.54.0


