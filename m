Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF94CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QaxSxNePW62N/aLYNU2ICZZcrY71w9JpJK96h4Ml418=; b=tAXUPGHGLNAbOnJOmBhk5rcgxu
	BSyVdKCDYTfNtXrwgpObz9eAsKpmjXZHdmuoOPolTY5Q2nNt8YpqVPC2OM3KjeD74UK1GjdrrIiJa
	T5DBBw9U2FfGFwf2siYtc/FVs2qOj538L1mA/7UkPRru3i8ihfigv5YGHcKG1HJS8hvBQM0d+0AB5
	oFNQSD6GHA2EbjjWEUn2miuXpdBGeBBUR4GlgRTaKgPcNbu9BM/ZkUbzMb//ZvsMZg/LMnDd+lSRa
	IHjUxikSC+gW2JTajdAbCyZa/QGAf6IUIUUty+Zks0S32M9y+4ptKdKzn6msgoPT8M/H4patmnooF
	TcvaHQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVDM-000000034oT-3Nx9;
	Mon, 08 Jun 2026 08:20:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVDK-000000034nZ-3Mm4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:20:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso39676765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 01:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780906805; x=1781511605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaxSxNePW62N/aLYNU2ICZZcrY71w9JpJK96h4Ml418=;
        b=MHTrOFBmduug7t3BDOPTZc0KHvhUDX4QzLG6lGz3VPaGJLMjzUHgCirVGeo+Zf+2AT
         01WdIV8yg7ZNjVPCQZY+WIXUEDP1iYiwNO9a/9Lf/X0HhJkxybsNuTOibv9j7JGC7Rm3
         32q9h3G6hW6ThGGZBXRNk0r0iBJ+ro3TJv5hN8/GoxuKA1CFIt0E7Rjar1E4GEd427lx
         9/0AUtOVME2LOpxtGb5/qbQndtL46O8FjbaTprQbbZJYWLKw26G59dp30uRDbJf0HGAo
         fZks9IqjGbcDe8cTvQa4s3ag5MYCA2H8yYWnfKzMjb4uu6dWcDA+KOA0O9Z4cV3rUYXT
         T4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906805; x=1781511605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaxSxNePW62N/aLYNU2ICZZcrY71w9JpJK96h4Ml418=;
        b=FAKzFKTPGldnO10x2MUOf4aV2w5qKHMcRbd/J1l40Ef54RR4yXNIUudLVSaFR1d3JJ
         Ge53CTAphClrzCl2o4m6jotf+9ZWkWmbmWATql4aeArbRTSL59/IOcF0IYZs2XtYBLlk
         tdwKVFbkijBSSVhm3yLG5iYuk9FRM439UBvmxMLqxhwXDd9wsUmMYn1Gyopg74WCKSb8
         BwofKvD5GtcHy1loTESmsjnfpMeJOdXIWGeGunJq+rOOOsboxsRi2YMglHSsUE4gUP0l
         Cmitu3KG3mrrxDNeNmAlWimrYD+nJjIgpfmmB7CDz+XyoioTif5CXfeNYoq9hyxnOVP6
         eiqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QjuIPSpFu//STRWvDwvk72FVhDYzkH+XKB1j81GViLKqDOkxmkBlb1SX3NBug0di1FxVO2VWX94fIxrUWjNn3@lists.infradead.org
X-Gm-Message-State: AOJu0YwRNVx+VeQ5g3ziCFIw7ylyMoBhLVwzEpCrI2T3UD9dY33ZWRA3
	K1zyve9PRRye3tkELesWYMoDfyvam4mIG0ikpFhtCMfYRCoN9bImhJGX
X-Gm-Gg: Acq92OGhp9P47bMCwC7Qqx9JzyycE5HeSW5aFTGeSUCRqTvnq5D89uCD5zyVcpW/SsS
	tOrl9m165Na6EH+MJ+bRiqf0iuq63U9UTR/DSn75Zs3k9xozojqAzaIkW1sNMckigzL/+1rHl/m
	hB3ggNz1rmqM1ioI3Vu8L4YMkNxnk7XxI5WQhecCOWg6hFPkXkYe+MItJHkgejfwfhs2ldn6qRf
	xjiez1Q35u3cfpY88rNr+ANGtIOsn/n6qocxqwcYm3S+PbEZlLplmM46g/oaFApqz8orjfIJDV6
	HgXOsNvnkyKbQqDTYny0g5Tsii5ugv1XrsFeSEn1/24Wnhrt3c7WYFhB85RpZN7hEqsAXr7M52B
	qXK1U/sjce0M9QrGBbHZ+mzuL0ycKixrHTiO0JL0ScTnG5jYOjozrnvni2S2hO5KBQ7VkMQAphz
	9BMOAHFrA34cW4Yen+fnTTDgtRXHNZqdy/g9ezAW+eKRhla+xMYYPE
X-Received: by 2002:a17:903:3c48:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c1e80cede0mr162261145ad.3.1780906804922;
        Mon, 08 Jun 2026 01:20:04 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:9a2:954d:67fe:d9c2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa3a5fsm183050945ad.36.2026.06.08.01.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:20:04 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] usb: gadget: aspeed_udc: check endpoint DMA allocation
Date: Mon,  8 Jun 2026 16:19:48 +0800
Message-ID: <20260608081948.3-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_012006_845927_3A391374 
X-CRM114-Status: GOOD (  17.35  )
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

ast_udc_probe() allocates a coherent DMA buffer used as the backing store
for endpoint buffers. ast_udc_init_ep() derives per-endpoint buffer
pointers from udc->ep0_buf, so a failed allocation is dereferenced during
probe.

Check the allocation before endpoint setup. The existing probe error path
called ast_udc_remove(), which unregisters the gadget unconditionally and
is not safe before usb_add_gadget_udc() succeeds. Add a local cleanup
helper for probe failures so pre-registration failures only unwind the
resources that were actually initialized.

This was found by a local static analysis checker for unchecked allocator
returns while scanning Linux 6.16. The change was checked by applying it
to current mainline and by running checkpatch. I do not have access to
Aspeed UDC hardware, so no runtime testing was performed.

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
Note: a 2022 patch attempted to add only a NULL check for this
allocation:
https://lore.kernel.org/all/20221213025120.23149-1-jiasheng@iscas.ac.cn/

This version also fixes the probe unwind path so the clock is disabled
on allocation failure and usb_del_gadget_udc() is not called before the
gadget has been registered.

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 7fc6696b7..809a7d5b7 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1434,11 +1434,34 @@ static void ast_udc_init_hw(struct ast_udc_dev *udc)
 	ast_udc_write(udc, 0, AST_UDC_EP0_CTRL);
 }
 
+static void ast_udc_cleanup(struct platform_device *pdev)
+{
+	struct ast_udc_dev *udc = platform_get_drvdata(pdev);
+	unsigned long flags;
+	u32 ctrl;
+
+	spin_lock_irqsave(&udc->lock, flags);
+
+	/* Disable upstream port connection */
+	ctrl = ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
+	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
+
+	clk_disable_unprepare(udc->clk);
+
+	spin_unlock_irqrestore(&udc->lock, flags);
+
+	if (udc->ep0_buf)
+		dma_free_coherent(&pdev->dev,
+				  AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
+				  udc->ep0_buf,
+				  udc->ep0_buf_dma);
+
+	udc->ep0_buf = NULL;
+}
+
 static void ast_udc_remove(struct platform_device *pdev)
 {
 	struct ast_udc_dev *udc = platform_get_drvdata(pdev);
-	unsigned long flags;
-	u32 ctrl;
 
 	usb_del_gadget_udc(&udc->gadget);
 	if (udc->driver) {
@@ -1453,23 +1476,7 @@ static void ast_udc_remove(struct platform_device *pdev)
 		return;
 	}
 
-	spin_lock_irqsave(&udc->lock, flags);
-
-	/* Disable upstream port connection */
-	ctrl = ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
-	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
-
-	clk_disable_unprepare(udc->clk);
-
-	spin_unlock_irqrestore(&udc->lock, flags);
-
-	if (udc->ep0_buf)
-		dma_free_coherent(&pdev->dev,
-				  AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
-				  udc->ep0_buf,
-				  udc->ep0_buf_dma);
-
-	udc->ep0_buf = NULL;
+	ast_udc_cleanup(pdev);
 }
 
 static int ast_udc_probe(struct platform_device *pdev)
@@ -1523,6 +1530,10 @@ static int ast_udc_probe(struct platform_device *pdev)
 					  AST_UDC_EP_DMA_SIZE *
 					  AST_UDC_NUM_ENDPOINTS,
 					  &udc->ep0_buf_dma, GFP_KERNEL);
+	if (!udc->ep0_buf) {
+		rc = -ENOMEM;
+		goto err_disable_clk;
+	}
 
 	udc->gadget.speed = USB_SPEED_UNKNOWN;
 	udc->gadget.max_speed = USB_SPEED_HIGH;
@@ -1553,20 +1564,20 @@ static int ast_udc_probe(struct platform_device *pdev)
 	udc->irq = platform_get_irq(pdev, 0);
 	if (udc->irq < 0) {
 		rc = udc->irq;
-		goto err;
+		goto err_cleanup;
 	}
 
 	rc = devm_request_irq(&pdev->dev, udc->irq, ast_udc_isr, 0,
 			      KBUILD_MODNAME, udc);
 	if (rc) {
 		dev_err(&pdev->dev, "Failed to request interrupt\n");
-		goto err;
+		goto err_cleanup;
 	}
 
 	rc = usb_add_gadget_udc(&pdev->dev, &udc->gadget);
 	if (rc) {
 		dev_err(&pdev->dev, "Failed to add gadget udc\n");
-		goto err;
+		goto err_cleanup;
 	}
 
 	dev_info(&pdev->dev, "Initialized udc in USB%s mode\n",
@@ -1574,9 +1585,14 @@ static int ast_udc_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_disable_clk:
+	clk_disable_unprepare(udc->clk);
+	goto err;
+err_cleanup:
+	ast_udc_cleanup(pdev);
+	goto err;
 err:
 	dev_err(&pdev->dev, "Failed to udc probe, rc:0x%x\n", rc);
-	ast_udc_remove(pdev);
 
 	return rc;
 }

-- 
2.51.0

