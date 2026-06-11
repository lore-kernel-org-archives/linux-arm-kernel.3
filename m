Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093A1CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 03:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jagaY783ZQexk/NjgnRY09dQ8WqyYDUPOGhKANIhzfg=; b=YWCaeuOFPp6jref+GqHGmiMzPn
	zrh73RbzN9R/O+l3D//RTgxYNSxBJvVdFilj/E0g0bjoffWdI5dtSSWD3h+zd5j4YAE160X8uz1q1
	3JTcbUsv4keL9Ii2Fij+1MIHo4zizoi3esp6sldJ3bf8Lhqs5H2k40hwCgY103R9l8GMpdSOqEs31
	nBNu3+ZtQcoGa1k8D9GB1HuzczDYP2p5jF0pRh4ny149drSdntxjgCmTJd+pBVf9PG23gndrzey0O
	UZ0BYVKIf18XjRAoNuf/lUQiKeHsNgsotWwRX7JBw4YI5OYjMemy7D0z4u18xGe1g6XqNobiTS0m/
	z3KBekyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGH-00000008cjV-0Fn4;
	Thu, 11 Jun 2026 03:39:21 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGE-00000008chw-34Wv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 03:39:19 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-842848fd613so6405452b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 20:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149158; x=1781753958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jagaY783ZQexk/NjgnRY09dQ8WqyYDUPOGhKANIhzfg=;
        b=mNGSs7YTL86utMRBFkjl+K7DcKmQHNxXGyVaXcm8xx8yq9FDxcX5s+A30ZiaQE4hTC
         dWWi3kxir9mSBgyYIcuUpNSbHyLkWzkhRqP8+kpfsZCqZiq0j6BaQ1TM+5btaiaLanBa
         B0FHWijDUExyAbvZ3sK0fMyNVZCT7lN2gvQIp4iuVtTHcHMmdyjrOeUxW4Jrwun8o4JV
         upJZJ4PUJbHQdjcwnMl3ov6V1Si9K9UlNGJiSq8LxCw+K7SDyvJXXBYfen7T7ncMkAlO
         d9iAmYADTtAUyowslyvKJsW/GtZ6SSIyx9VAFy7olb7QEKLHo9igxW2kXA+wFFZjwztf
         UHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149158; x=1781753958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jagaY783ZQexk/NjgnRY09dQ8WqyYDUPOGhKANIhzfg=;
        b=cTtD9SQbxhqV9GMIesFv+n9tbU7cIWmA9A378Na+WwHL9CdsDlKR63R5J55fpNQv5C
         G5MjFp3EVXJ29a1gkiKiGhgTRwyR9OIIHaWydYdilKmaLtVhz3fihM1XGZQHDL5D8c5d
         04hc374U7xymsqecaBWaAMRbjWabXlvntgM6l8MN68cX99lH2WvRZOjemlqSkXTDOi4/
         Xx9oP1QhCSu9KsJfiGL7qhr3/jScBRLZa89pqGh7nmLXMlQtYJBMemO8CAd+zM2ZeXX3
         z0V0DhofTpy79eVieh9gx1n4BRhWIyKjcMyeZWHqyaD4ePP88mPnMVoT/KSkHmdZy3H8
         eELg==
X-Forwarded-Encrypted: i=1; AFNElJ8EMOf2fpx28OgBsKDjcF9GSqvj1gJsV1cvDafYFnxW9HkcUE3prMoxSGNIj5YYPB8t+yJZFyOw+WhaUnAxj3it@lists.infradead.org
X-Gm-Message-State: AOJu0YzI/2kA20jWk9hhOen/KYyqXS4sxfzLnRPY5n9CrLqV76w3wky0
	i5o3Ti0PC+CYa+3D3pGrxwXM6pbJQ7ycppK6XyAjD/5OEK6nOj4DwJs+Km0+BA==
X-Gm-Gg: Acq92OF+cS48jzsBn7futOnhllBcUeANvfut03xH07+R1dji9/vZ1aKCVBez6rV3TRh
	9xS6PFLzCeFqJM6s3DycDeif0jS/2Cd8sIl51wYmr6fmdDg2vCl8gPfdz2jB1HbQNoO1NG8jjQ/
	FK10zlADyDHPcLObMqIgeebgf30KOadG2d1jQ4f/x4JdeQCNKljYPuM4klpr7qX1Mov7OO3+syN
	anu9NIFompqiq+ZIHXsrszskOTZkbbRne3HFf3fg85HwYlkRzgIuiGauTIFhCIOXpKh9YN0wFvD
	5PMUcCBD0Ry4Z1X9xe11HRNJ9o4tnOtolarZHVzN6XMcYj453tUwkMLeYug0nF0OjzAuuOHNHK7
	/H7Bw8ub1x8fKhGr6Y1CDJDuztQuzQid0gxnc1K0ltvgkeAj9nNcCiHO13k6svyz8RW8xTZMALu
	XJ0c+Z0Svuqa5DewcDlpmRUL1cHnYlVFb9P//FPEkwZwpAkKRAqBU8fC0Dqj9A0bjj1UM6jiI1c
	GQ8BJDtuN1jlBL83IhhqdRKSTjSeq2UEDkz9D/9QNszoRZyNc5PIRAA
X-Received: by 2002:a05:6a00:88e:b0:842:48ae:1d56 with SMTP id d2e1a72fcca58-84336b9dc4amr1007360b3a.35.1781149157745;
        Wed, 10 Jun 2026 20:39:17 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:17 -0700 (PDT)
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
Subject: [PATCHv3 3/6] serial: mxs-auart: use devm resources for iomem and GPIO IRQs
Date: Wed, 10 Jun 2026 20:38:53 -0700
Message-ID: <20260611033856.6476-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203918_785263_41B0EA94 
X-CRM114-Status: GOOD (  18.58  )
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
 drivers/tty/serial/mxs-auart.c | 53 +++++++---------------------------
 1 file changed, 11 insertions(+), 42 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index aa59a48bfad7..4499e3206e85 100644
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


