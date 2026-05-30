Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB24DCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 19:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JFbb87WXannbZgAKQJkoODZG0moYWhbBBJifO3Eihyw=; b=JhYQnw0TmImUKhq8V+PI5syISw
	gUAJam0yUQw5tGK4tHYTyhr6WvwyDGVmijVkfHswNOkq3q593tiLprD2ToQ3D6wyH2lU237S1MLnG
	8TYi3lgXsa3v658aWan6TQIFuv43ZY3Uu+1Egv8wwgKXgwaW6ufIgWcw4DUaRwRZ7j2Wyx11XRvow
	5S1kXZHVmTjsfyiYYz3jH77b/phGC4qln0LsWxuRPruwaNa8vC1CVjtxQjMWDaGgGEG/SMmYOjf9t
	kGbiZeUoRT53qybgTk4lpVkv+CmyiUAXjYXgl4dB7FqqKlHdvqgGJXq1UJn/QJPPNG1/mKP42S53o
	U6Ptkg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPmc-000000092FU-1Hp1;
	Sat, 30 May 2026 19:55:46 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPma-000000092Ez-16vj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 19:55:45 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3698e34a567so13620767a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 12:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780170943; x=1780775743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFbb87WXannbZgAKQJkoODZG0moYWhbBBJifO3Eihyw=;
        b=lSq3INKCaDpuGMcOW8fbd2u8fndu7Kq1cBENiEP4YqLamaWG5MNjU8y49jWGFJ30pm
         3TNOBLs23fBisRkSZfX0CTjmnjo1B6G3YqjF5g4z69XaCgAQ5LWGLqjhTj0tC5csQdM6
         3V2Bn/DU0d4KXPdIAXbb/TN3wsb8VHJ64axXXfkTZ0BxAEn7WQmI/2DF/2EPiwTwYIWV
         8TSyXgVRtvLB2VtKDDw2lxnnNidI39PxPHLtR9q9MNJOSjLObJif1aUr6Itop1lmoF5+
         d7cD0qjbLQMVchBkgui5cy+IowebnWPexE9txTLVeHfw+W0UYbjvFZ94C+YScAgKnap8
         BUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780170943; x=1780775743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFbb87WXannbZgAKQJkoODZG0moYWhbBBJifO3Eihyw=;
        b=e832/zDZ3O58c50no0qX46vyCOUwN4Zj0iTprStTJDzSUmsrSbb9nGw4xSU9mODS9l
         0e2AXDOvDUfnBmre8XSMRaqkuXyX/CTRkEJyA9+99crFeBOjR1nzckh2LPdaVJMeAaeh
         rKWwHCab3G/bQHPN7jN9XU4xDkt1z8cA9aoFAuMlJGkl979Wpe85AR66r/SEDAHG4M1l
         Q2plENMzdjPHISUqzZ7/+Usz7A9eZKxio2w7Mpmddzzrzjxgxx2JMj4vgp4e/WeBswOB
         OAmAKDuInBKGlla86NZpnUnTeRbTnNMJ7eCGKH+Ps4DUhZJRhWy9E/XrxvHwPNLbecdD
         p5Rw==
X-Forwarded-Encrypted: i=1; AFNElJ/n5EP73oRqrkTYHdVTk/UpTpTgtx0owhwB28TavF2XG2B6+S+RZVaGk/+Cni2gh8XCS8myEiOmSAbIGta1Yeg+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4B/yRNBZDlCnY7/4YDMPLMT6cB3fhyaJCZ0Nd4EvUAqbfZVQt
	wAib/rmyAFp35AlTWN2FVBMh4+NnqYDS0vsmzEIxdv37VvdElS5ofWtX
X-Gm-Gg: Acq92OGAikYJee5K7YtghX+ivoiN+R4A+dzP2jfVp1Ith+Wp8p57ZWxvc2onAk7f54B
	q4HBEn0g2o7pSdbrYMKeqoFev7qY95VYj9Cu68Zb4GsrjzoWc9tHV20vdBEa4Er0DtUb4sPj+qj
	LBGzbfk8+eih/dCMg+KQ97K8tmnbFLLrCaLOIgE+GR8sg971eoMvz8lJA5zDQuDZpiL6wS+nrIj
	QE5v2iYktLNyYFBbwzMdjgObifZ57ZzC1j6preXj/HJh6s/zypxyZPFPTODpo3SsY/VuAqdx4Gq
	70COTFXGLA2CKN4gA/yNVYCHWb6Xaf43Tb7CQkTPmAL8K3hdYBdCCypoMclN7kOj8aj/ZpkFQl7
	gYQcJ2sZjTliuQ/Po2U1TvNXR2rD6GuBtNY/kzO9tTPFd8sWZVHRIzUDnOJQ4p+oKdA0OPb5pen
	qHa4cEeLHXaL8SGXeXjNxQK1WsTpJ0J4ajlJcwGmy6C41e5wUqW0JJEA4T43c1D/BPAcLVRotlK
	hIQU7bVaL8L0oAbuQOTwMeimZjjmK9vLK8iPBwZXpr1Tg==
X-Received: by 2002:a17:90b:3f88:b0:36b:ba97:419d with SMTP id 98e67ed59e1d1-36c501cdd5dmr4347411a91.13.1780170943254;
        Sat, 30 May 2026 12:55:43 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6a34ca9sm5503001a91.9.2026.05.30.12.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 12:55:42 -0700 (PDT)
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
Subject: [PATCHv2] serial: mxs-auart: fix probe error paths and clock handling
Date: Sat, 30 May 2026 12:55:03 -0700
Message-ID: <20260530195525.5059-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_125544_337122_F2B124DF 
X-CRM114-Status: GOOD (  22.38  )
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

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: reduce overly zealous devm conversions
 drivers/tty/serial/mxs-auart.c | 127 +++++++++++++--------------------
 1 file changed, 49 insertions(+), 78 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..bbe30841ce2d 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1470,34 +1470,22 @@ static int mxs_get_clks(struct mxs_auart_port *s,
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
+	/*
+	 * Set mod clock rate while it is still disabled so
+	 * CLK_SET_RATE_GATE does not cause clk_set_rate to fail.
+	 * The mod clock will be enabled in mxs_auart_startup()
+	 * and in probe after mxs_get_clks returns.
+	 */
 	err = clk_set_rate(s->clk, clk_get_rate(s->clk_ahb));
-	if (err) {
+	if (err)
 		dev_err(s->dev, "Failed to set rate!\n");
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
 
-disable_clk_ahb:
-	clk_disable_unprepare(s->clk_ahb);
 	return err;
 }
 
@@ -1529,15 +1517,6 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
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
@@ -1549,21 +1528,13 @@ static int mxs_auart_request_gpio_irq(struct mxs_auart_port *s)
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
 
@@ -1598,24 +1569,22 @@ static int mxs_auart_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	s->devtype = (enum mxs_auart_type)of_device_get_match_data(&pdev->dev);
+	s->devtype = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	ret = mxs_get_clks(s, pdev);
 	if (ret)
 		return ret;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		ret = -ENXIO;
-		goto out_disable_clks;
-	}
+	ret = clk_prepare_enable(s->clk);
+	if (ret)
+		return ret;
 
-	s->port.mapbase = r->start;
-	s->port.membase = ioremap(r->start, resource_size(r));
-	if (!s->port.membase) {
-		ret = -ENOMEM;
-		goto out_disable_clks;
+	s->port.membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
+	if (IS_ERR(s->port.membase)) {
+		ret = PTR_ERR(s->port.membase);
+		goto out_disable_clk;
 	}
+	s->port.mapbase = r->start;
 	s->port.ops = &mxs_auart_ops;
 	s->port.iotype = UPIO_MEM;
 	s->port.fifosize = MXS_AUART_FIFO_SIZE;
@@ -1630,21 +1599,17 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto out_iounmap;
+		goto out_disable_clk;
 	}
 
 	s->port.irq = irq;
-	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
-			       dev_name(&pdev->dev), s);
-	if (ret)
-		goto out_iounmap;
 
 	platform_set_drvdata(pdev, s);
 
 	ret = mxs_auart_init_gpios(s, &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize GPIOs.\n");
-		goto out_iounmap;
+		goto out_disable_clk;
 	}
 
 	/*
@@ -1652,15 +1617,34 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	 */
 	ret = mxs_auart_request_gpio_irq(s);
 	if (ret)
-		goto out_iounmap;
+		goto out_disable_clk;
 
 	auart_port[s->port.line] = s;
 
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
@@ -1672,20 +1656,13 @@ static int mxs_auart_probe(struct platform_device *pdev)
 			 (version >> 16) & 0xff, version & 0xffff);
 	}
 
-	return 0;
-
-out_free_qpio_irq:
-	mxs_auart_free_gpio_irq(s);
-	auart_port[pdev->id] = NULL;
+	/* Disable clock – startup will re-enable when the port is opened */
+	clk_disable_unprepare(s->clk);
 
-out_iounmap:
-	iounmap(s->port.membase);
+	return 0;
 
-out_disable_clks:
-	if (is_asm9260_auart(s)) {
-		clk_disable_unprepare(s->clk);
-		clk_disable_unprepare(s->clk_ahb);
-	}
+out_disable_clk:
+	clk_disable_unprepare(s->clk);
 	return ret;
 }
 
@@ -1694,13 +1671,7 @@ static void mxs_auart_remove(struct platform_device *pdev)
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


