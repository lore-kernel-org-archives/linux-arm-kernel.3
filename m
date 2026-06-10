Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FB9CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn0e0V+HEIAY5dAJYzbVBmSmbmUkCyWOZZSIYcy0Q78=; b=lZiv2ji3WQ2Rs7krJmET6kzkdf
	tn+a5dEDGu+fKwEFvUrxoKohoioS4/n6feqGjLvJ7X/suz1cm0vYF18YNvAZ0uunytQzgOix8YPu9
	2qv7qPvudLIIJFu6lBsUFsyn+u9nVEWosXdrwSFRQb/+e3KY8n7GibvdpG+yMGR17txmFuwkNN/Xu
	KS8iwufSCbsUPIRNkNkocRLxZhFuByW0C/TkPGXNA2yDzSTd/9b9KEW75TuG1zUpIHY6d+aCO231x
	DlZRV1fVBPT1tDgfImlPz3z5gSyCaLILzudHnal0nn4sHLBceFUAJlMlYGDyqV4yqQKRK0MGI1HfI
	SDkAEvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHlT-00000007cOm-0uCj;
	Wed, 10 Jun 2026 12:10:35 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHlP-00000007cOI-2VeZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:10:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c86214eead7so1661660a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093430; x=1781698230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn0e0V+HEIAY5dAJYzbVBmSmbmUkCyWOZZSIYcy0Q78=;
        b=gndUqwVfMTxRXurTgY7CUSHa8XQBUjhuKfga60hAzqEUcplSJJq2UDsk6twsjbGdJ1
         teP1cuwdEp3n06CkiGDs9oa80UvmODiOyv1Y5zREwEUkY274gAs0cqdq7pi8MuCSEXhX
         codgKSwxflliVBhYq/JfgkhrGeblCfkWITXctzSe70dz7W0lvmV65RUel/7RFuCgZ4nK
         QoK/wdXWinnrI2wIdsOVS5PhbigoE0gmsNkHBKu375BVdtVWvjtc2VoyjN7H0mdAi/Fk
         No9dMcYpMW/WbtUQFrvL0lT9pMRfTDFZyWKHNOQqUkj62Mqi6d8MKEYfrkxZUIhzDflx
         2PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093430; x=1781698230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bn0e0V+HEIAY5dAJYzbVBmSmbmUkCyWOZZSIYcy0Q78=;
        b=WjXo3PMDOXViXxGSnHpIXCCEY60pLJubr5qDIeh0mkzymVod+fOThoDsfeimGIvF9Z
         pXSX54g+8aGRNPwsgEnBaXtsEl6rywJ9rPZC80Z+EFjDCy7C1nOLk7cmkoc2KgX4tFAr
         +PDlE7W2aEaxSnaNQaO7HnIJSFkaXJup+E80K1spPbB5PJpSyTraBI0o19rLEJ33rLFG
         140kEaDJYuR8kDG0mGhOM9s6wmQ8u5NCok1SoLJIQhDkJM0H44azxPslVNZMf6PxEE8w
         dMQlmtpUYTUCykIsh6F4zfnql+NnOip3GwOWOAP5kdsz0nzJNjmq11PsqnXj95yGjYGa
         PzAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tcTp+92k3l3BZsG8ELPjot9U4oWFL4ejyZrPDc9MzBdU8nHd7+oKzCN0QRRoHmoDeAU2hd4LN+4LhbQru2Y4Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8zIh9tx+hfb5BcT/9qFnbzRjs8/nJzUXst/X2Tof4catuZQRL
	A1M49b5D6Rb8hsalMi9hv9zuNo5daiBI5d+akI4lvoVOkcKYPDMJjZR3
X-Gm-Gg: Acq92OGYxbYIqhbZk9YsL1YKt+FnVQv7bHH3/qYneZrcypr3fXW1ok2y6LMbzNOt4I8
	U6at2dhgZadS08U1daUDKRDEHRGDTKSouWSG2Po+NFUrXIoLCJMvoykhEOELnNWBiwIq0iIBtmS
	lFv2YKU1W7RoRSFWe/RHOCrnL2kZwWXMsW39F8pbDXIFW9JbvRIlN5mtK/W/cdeVqGmtk4KMHKq
	l9RaFoS47/1TxCeZOEKZgg7ur5+LGgZXOSJRmyqwoHIio7Ggb0fcAC/9iKEK61jzq3EGompHN+0
	vd6W5VMIA20q5rZQF7qMFfqvNnvvIevxHPPzOf81G+5lAxrzQd4glOBn0fhcIirKoY3k6/zFHjD
	IqmcBFTHhvoyviKv3HelSE/QK8MqQJlmkIvz5txQkbi/IJaLHQmfvFzxLvJgnUJ7CVWMyWTFdHb
	fX6lhb7HEgrt/HZLMyXPQaWGrlW0icXv9QwFuKk3j/DD5bsrHxmaFeOA==
X-Received: by 2002:a05:6a21:7e89:b0:3b5:530d:d980 with SMTP id adf61e73a8af0-3b5530e0518mr2279602637.20.1781093430459;
        Wed, 10 Jun 2026 05:10:30 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:b72a:532f:bb14:101c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm24704308a12.19.2026.06.10.05.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:10:29 -0700 (PDT)
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
Subject: [PATCH v2] usb: gadget: aspeed_udc: check endpoint DMA allocation
Date: Wed, 10 Jun 2026 20:10:22 +0800
Message-ID: <20260610121022.3-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608081948.3-1-ruoyuw560@gmail.com>
References: <20260608081948.3-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_051031_664726_41C2DE48 
X-CRM114-Status: GOOD (  19.96  )
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

v1:
https://lore.kernel.org/all/20260608081948.3-1-ruoyuw560@gmail.com/

Changes in v2:
- Simplify the allocation-failure cleanup path as suggested by Andrew
  Jeffery: disable the clock in the allocation-failure branch and let
  err_cleanup fall through to err.

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1434,25 +1434,12 @@ static void ast_udc_init_hw(struct ast_u
 	ast_udc_write(udc, 0, AST_UDC_EP0_CTRL);
 }
 
-static void ast_udc_remove(struct platform_device *pdev)
+static void ast_udc_cleanup(struct platform_device *pdev)
 {
 	struct ast_udc_dev *udc = platform_get_drvdata(pdev);
 	unsigned long flags;
 	u32 ctrl;
 
-	usb_del_gadget_udc(&udc->gadget);
-	if (udc->driver) {
-		/*
-		 * This is broken as only some cleanup is skipped, *udev is
-		 * freed and the register mapping goes away. Any further usage
-		 * probably crashes. Also the device is unbound, so the skipped
-		 * cleanup is never catched up later.
-		 */
-		dev_alert(&pdev->dev,
-			  "Driver is busy and still going away. Fasten your seat belts!\n");
-		return;
-	}
-
 	spin_lock_irqsave(&udc->lock, flags);
 
 	/* Disable upstream port connection */
@@ -1472,6 +1459,26 @@ static void ast_udc_remove(struct platfo
 	udc->ep0_buf = NULL;
 }
 
+static void ast_udc_remove(struct platform_device *pdev)
+{
+	struct ast_udc_dev *udc = platform_get_drvdata(pdev);
+
+	usb_del_gadget_udc(&udc->gadget);
+	if (udc->driver) {
+		/*
+		 * This is broken as only some cleanup is skipped, *udev is
+		 * freed and the register mapping goes away. Any further usage
+		 * probably crashes. Also the device is unbound, so the skipped
+		 * cleanup is never catched up later.
+		 */
+		dev_alert(&pdev->dev,
+			  "Driver is busy and still going away. Fasten your seat belts!\n");
+		return;
+	}
+
+	ast_udc_cleanup(pdev);
+}
+
 static int ast_udc_probe(struct platform_device *pdev)
 {
 	enum usb_device_speed max_speed;
@@ -1524,6 +1531,12 @@ static int ast_udc_probe(struct platform
 					  AST_UDC_NUM_ENDPOINTS,
 					  &udc->ep0_buf_dma, GFP_KERNEL);
 
+	if (!udc->ep0_buf) {
+		clk_disable_unprepare(udc->clk);
+		rc = -ENOMEM;
+		goto err;
+	}
+
 	udc->gadget.speed = USB_SPEED_UNKNOWN;
 	udc->gadget.max_speed = USB_SPEED_HIGH;
 	udc->creq = udc->reg + AST_UDC_SETUP0;
@@ -1553,20 +1566,20 @@ static int ast_udc_probe(struct platform
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
@@ -1574,9 +1587,10 @@ static int ast_udc_probe(struct platform
 
 	return 0;
 
+err_cleanup:
+	ast_udc_cleanup(pdev);
 err:
 	dev_err(&pdev->dev, "Failed to udc probe, rc:0x%x\n", rc);
-	ast_udc_remove(pdev);
 
 	return rc;
 }

