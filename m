Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B204CC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 05:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JA5XMiOxCtI6Cv6cvLy2e2rZtS3fpKUachOjJ9i3SoA=; b=NzU1FXd8eB4RsaHfmYtVWSOuKp
	rUo+z5p3eVQg8pOsqwWpDCAaHCPUooSCr5De5pwfB8o8TZp5gNl/6l4KmckpZ+nuBKkulsNhptqKc
	aOJX2pFVdLTvscV/5wExGJuMajmzyFLTJUENK9fENopgsk3Yd1M2DLDD/GRbTgWAMZ5FN6WgU0Xp8
	AxGBenxWBNJY1vDOTsbwIRjmsPUTK2kmbwNU/1IZIhNTz4Ko+5X7Bp49axxRDyGhm/mNQjNjGEwaR
	C8+6dgiYZ9l8MzcpA47xW71ALvaA45esu/CamMV9E2Z5nq4qgzYXn6PdPouo6J5BrkQgADg1t49wt
	peU7yLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0MP-0000000F4pT-0TGY;
	Sun, 23 Aug 2026 05:03:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0MM-0000000F4p8-2MqG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 05:03:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2d032846c95so28920845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 22:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787461386; x=1788066186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JA5XMiOxCtI6Cv6cvLy2e2rZtS3fpKUachOjJ9i3SoA=;
        b=MOt16oCyy6RehpyiEBfn5bPejbMmrQT7N5T2AMJ6olVYLn6r/Eu6Mh8WwgdOTIXrJ7
         R7Okf8Lk3JMQZ6whp9QJnZWWzNbMOWUziJodUkssxrktbFcE+yZd2t78szKVpKLpQB8j
         /U0lwm6R+SK9ZchqjJCNf5IbBCsCGfnS8QOf90DqYSRVN9tejCE02h3c/27BUHa+XCOs
         QI+aJ9hJaSr52q4RCGLopOi/dPvgzmLlHQQSbGr4202W9/La9FBlpEghu8GOcaXRHIf3
         ifOvScvj7v9hC8t2/Ivi7d4EKa4Gile7r1ene8f6XV7ATcho3/5894PKu8wFkn9QLrd4
         RHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787461386; x=1788066186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JA5XMiOxCtI6Cv6cvLy2e2rZtS3fpKUachOjJ9i3SoA=;
        b=QUdOfep25w9Q7UQsJ9mtzobRPJdsEdBDth6bymBj5ZIb4juk8ZcAWG6Jfmg02QSHG9
         7fiHp86s/ioRWsGmvS0wz2Zxr3CDAtxgq54DNozMbtkOV0zy7LMMr4+MlrfMG3RSbrQ5
         +baVufnQ/c0kSZphh4WwWHdUg3eg0VSt/+QX0cvm5VgFFn0H+/pQA14KO80YH/3mX/UH
         CpxSwk9IOuIvhsQRXvoGcsfzAubGRnTaZT/Z7oybg5bqKUGf8cHnHlgkAkUS/z3MdJNy
         QhWVeD3BHgbh7a2u+rSRuINRlHonRoQazhLers3hnMkEMoYQ4wQBDlLBFHb6EW5det58
         w1iw==
X-Forwarded-Encrypted: i=1; AHgh+RqWD0YV8svVz8Y7zyXgvn/ZWHCIqws0uvpX6J/5FGW+5tH4/7xVODYWQKiIJAsJ13mYuFuup030VdlSEUSjsvGt@lists.infradead.org
X-Gm-Message-State: AFuF++maSYuJnPjcUEd1kk/eSyifHRCEqudB4gMm7dYBBmDIgu/iBUCB
	0OwuQjzWb24viewZLr0jCbMoHRwg7tVsM5rOu2E0zqGc/w9ZuT6h/Nxk
X-Gm-Gg: AR+sD10ArG3M4ZlkLriCmwZ/GmiWKC9igKiODTY+MmiWVMatYOxM5AW1K9HOwuBmmR+
	NGfwcCPD/k1DT9K/lISXhiLa0B98SdQsHzCyNqEwl3cGvtZ17LIfF2MBMMYT99UJsEgh/0NDQCk
	/xlQekcnBuNvhP8mgdRvzMoXJOzeAE5G8TWD9pVrI1QSCv4u4hIVYOS8SiCyYbcckfKIolf6DO7
	Wq9a6W498CLS3aMKH5wCWquUTrr2atoYI6iNlrA7nQPn9eEPINE80muhcYDSgEqawGt8VWGhjjH
	E+81t0yaNrfgyPgF0eMUdz/tm2XJ3CTuoZWqotq5CZY0r+PH6BNbQPx1Y7zRYx8NMZdmOmnz25r
	4fIgDjFvtuhS34XZMHMFd9DuKCeUAw0KKVh6FGK+DVpeEDob62GaCg8124OlyW1UpJ6vX0dM8UM
	M/Hm7grqJWGfHQI5ohZh3xHfcDZ0zRiVPEsN32e1zegAyd2v9xIo0IDgNmuNq//Hx28pTnRhRJy
	tNzXP8a0Bk89dKLMCjrmTDsvN9RANfLRDZ4iDYMpJ/75nUQo1I/1QTs6PAmiBrLX3tnfBlUZ5Xx
	IzUn9rvzjrJlHR/rgCojboHhfOnWpPuj11++kw==
X-Received: by 2002:a05:6a20:7292:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cd301c72f7mr26440958637.18.1787461385654;
        Sat, 22 Aug 2026 22:03:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199daeccbsm134270a12.7.2026.08.22.22.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 22:03:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv4] dmaengine: at_hdmac: use devm APIs in at_dma_probe()
Date: Sat, 22 Aug 2026 22:03:03 -0700
Message-ID: <20260823050303.17725-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_220306_612612_DBD648D9 
X-CRM114-Status: GOOD (  12.89  )
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

Convert resource allocation and setup in probe() to use devm-managed APIs.
Simplify the error handling path and remove explicit cleanup code.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v4: adjust subject and description again
 v3: fix subject and description
 v2: remove list_del
 drivers/dma/at_hdmac.c | 50 ++++++++++--------------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 971f8bc9ec48..49a85ac66e83 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1986,40 +1986,34 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	atdma->dma_device.cap_mask = plat_dat->cap_mask;
 	atdma->all_chan_mask = (1 << plat_dat->nr_channels) - 1;
 
-	atdma->clk = devm_clk_get(&pdev->dev, "dma_clk");
+	atdma->clk = devm_clk_get_enabled(&pdev->dev, "dma_clk");
 	if (IS_ERR(atdma->clk))
 		return PTR_ERR(atdma->clk);
 
-	err = clk_prepare_enable(atdma->clk);
-	if (err)
-		return err;
-
 	/* force dma off, just in case */
 	at_dma_off(atdma);
 
-	err = request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
+	err = devm_request_irq(&pdev->dev, irq, at_dma_interrupt, 0, "at_hdmac", atdma);
 	if (err)
-		goto err_irq;
+		return err;
 
 	platform_set_drvdata(pdev, atdma);
 
 	/* create a pool of consistent memory blocks for hardware descriptors */
-	atdma->lli_pool = dma_pool_create("at_hdmac_lli_pool",
+	atdma->lli_pool = dmam_pool_create("at_hdmac_lli_pool",
 					  &pdev->dev, sizeof(struct at_lli),
 					  4 /* word alignment */, 0);
 	if (!atdma->lli_pool) {
 		dev_err(&pdev->dev, "Unable to allocate DMA LLI descriptor pool\n");
-		err = -ENOMEM;
-		goto err_desc_pool_create;
+		return -ENOMEM;
 	}
 
 	/* create a pool of consistent memory blocks for memset blocks */
-	atdma->memset_pool = dma_pool_create("at_hdmac_memset_pool",
+	atdma->memset_pool = dmam_pool_create("at_hdmac_memset_pool",
 					     &pdev->dev, sizeof(int), 4, 0);
 	if (!atdma->memset_pool) {
 		dev_err(&pdev->dev, "No memory for memset dma pool\n");
-		err = -ENOMEM;
-		goto err_memset_pool_create;
+		return -ENOMEM;
 	}
 
 	/* clear any pending interrupt */
@@ -2086,10 +2080,10 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	  dma_has_cap(DMA_SLAVE, atdma->dma_device.cap_mask)  ? "slave " : "",
 	  plat_dat->nr_channels);
 
-	err = dma_async_device_register(&atdma->dma_device);
+	err = dmaenginem_async_device_register(&atdma->dma_device);
 	if (err) {
 		dev_err(&pdev->dev, "Unable to register: %d.\n", err);
-		goto err_dma_async_device_register;
+		return err;
 	}
 
 	/*
@@ -2098,27 +2092,15 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	 * dma_request_channel().
 	 */
 	if (pdev->dev.of_node) {
-		err = of_dma_controller_register(pdev->dev.of_node,
+		err = devm_of_dma_controller_register(&pdev->dev, pdev->dev.of_node,
 						 at_dma_xlate, atdma);
 		if (err) {
 			dev_err(&pdev->dev, "could not register of_dma_controller\n");
-			goto err_of_dma_controller_register;
+			return err;
 		}
 	}
 
 	return 0;
-
-err_of_dma_controller_register:
-	dma_async_device_unregister(&atdma->dma_device);
-err_dma_async_device_register:
-	dma_pool_destroy(atdma->memset_pool);
-err_memset_pool_create:
-	dma_pool_destroy(atdma->lli_pool);
-err_desc_pool_create:
-	free_irq(platform_get_irq(pdev, 0), atdma);
-err_irq:
-	clk_disable_unprepare(atdma->clk);
-	return err;
 }
 
 static void at_dma_remove(struct platform_device *pdev)
@@ -2127,22 +2109,12 @@ static void at_dma_remove(struct platform_device *pdev)
 	struct dma_chan		*chan, *_chan;
 
 	at_dma_off(atdma);
-	if (pdev->dev.of_node)
-		of_dma_controller_free(pdev->dev.of_node);
-	dma_async_device_unregister(&atdma->dma_device);
-
-	dma_pool_destroy(atdma->memset_pool);
-	dma_pool_destroy(atdma->lli_pool);
-	free_irq(platform_get_irq(pdev, 0), atdma);
 
 	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
 			device_node) {
 		/* Disable interrupts */
 		atc_disable_chan_irq(atdma, chan->chan_id);
-		list_del(&chan->device_node);
 	}
-
-	clk_disable_unprepare(atdma->clk);
 }
 
 static void at_dma_shutdown(struct platform_device *pdev)
-- 
2.55.0


