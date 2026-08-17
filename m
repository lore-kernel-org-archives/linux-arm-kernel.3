Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED717C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 20:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RXw3GvcQ0suhRqm3C8ZSkikl01zp6z0tF3rJPTXGM90=; b=V7OKQrLBqiHbBL2byeqHVIZh6n
	15oaueFeoDT3IwBBV9av9wLxj/IXrjzoi1J89MMbPwKxNYUCK4dI9YrLyGWlxHqJD4bktx7MC+uQ6
	EPaofNd6vJu7+qpWiNIPEc+b9jTVzw8k88qfcGTi9hV4nyEUnnLPc4RJSahl3FFrRYS9AtQdbXYih
	ZV7lOmiD9vySIxS/ajXfLZxLGg2lTQdajHSWlba+P4JYrZQ1bHMntYGkxbClr0Nr/cEDhMv0aNuOj
	XxVz2aFfNjNwQTUKQ9C/aOjcRUROQf3Uy8ceGzaHur0dKM8EsBS9nY7QXR9Qc1OuQ+JvPj3o9rlCV
	YaWQnwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3gl-00000006lVd-0IJb;
	Mon, 17 Aug 2026 20:12:07 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3gh-00000006lV3-3VYU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 20:12:05 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2979602a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786997523; x=1787602323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXw3GvcQ0suhRqm3C8ZSkikl01zp6z0tF3rJPTXGM90=;
        b=ZXs2mQw3z4LyH5amoJmAsPU1OK1UQXhwlDH4tIeR4aZ3g/Vx3/Xten4/g8LIbhkIf4
         g6TnEinCPPCdLyT3CIMZZVJ4PDgArZZpJ7x9lfALYTKOCH44fQ+S/I1y+b2wdq4v30S+
         lL5whEnbJHCBzSZXT0a5DOTczVtCNHIGbu1k9rOEFuMLbXPSeQ4XuF21am+OSrMeyIBa
         PE2aeHW+Ieee6NEdHDEcAPRsxaE+VdZQJlkb4reG+XZ13c/UBcIx5rQlYjFtTRp+UvFy
         WnHGJBY3CHtYJcJMCsHZA9JkFDatPcIabQHRv2HTggG30gGECrs7nUhw+1q6+i0vZfn9
         z5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997523; x=1787602323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXw3GvcQ0suhRqm3C8ZSkikl01zp6z0tF3rJPTXGM90=;
        b=AMp2lra3iYzW73wwmP2WKbhIb3ZOvXAAV5VsJEIQOFtwhZ9cqpk09gSMdXmW5WmqTx
         /GKdAaLLnnBWNqPrtWqi0Xt1VgY70XTrbH/KjS6Ftz59AQs2vqqN5pivzfb24EMfF+kh
         ulhpti17xBOacMw8sScLoowFoNZD4WUM4wPhk5UOuM1jN53eR2wmF1acroxPiKKM63m4
         HhwicNi2hUZBhthBnw8RUOxToPYjPi4VXh8FfJnMVmWYU+4AZge9CZKuKKA2BJndX3w7
         zGoBK0Z8DqDmjR5lRgzlNLTcHJIKcn+VfdRfRFw9Wm+9xj3o4mctRssBvkjUR8JTtx0b
         j71A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3W5TTzYAsy+AxOEpcNZNE51HIhMZKWy7VJ8Nzpi+H1bFjJFNw3dRkkkTpqdEjcNb/JT7Y7ZYC1C4LTPUFevLM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+oQoeWBpc5oXbTkOCejxw9ZluN6KEMhTICTNdIwYphg7z1lTt
	xhLUyDtarNaWJu+cAWFxoUjN+6O9B5nSHhFput1bkY9ynpeEq7cPl1rB
X-Gm-Gg: AR+sD12LkUUb9L3+lbVkxglraxjLcuz/dfxKHWEtqtRh1aTATwi4cU37qwCTytw8NtJ
	V5JCdaEh/ITmplGvrvLP9n5AheBoma4t1GOJmiVn+fML7Z3DGc2mSmhX7AABgVXjh264tI6O8nG
	Ym9wny/1qsHraFIiKZaOJHo+tr7i9zKWqRN8kj6XurAhrwLHuXuIAnYKLucRMm43rJ/V4SyvXu7
	FcNfi1cNLPcqtn3Em0gqh/oFJb8+khdlC5Z9i1+pgxpu5IEpl01rp8UXOX5vq7iqzh0neaVS852
	2NndMOCxkG9QWIUSek+Ht+FpBGhRrCsikxKzrn31BV0AjES2Q7KP24/VJ1OqAvkQBzcjdGh+kXC
	s4odlBOb2MFf0D52S5sz5ZOxnyGCk0YFsOPKa99EGYAygwwUK+yCmng3Repb78bqXga8888gDlA
	oR75/5Ozcbuz+qHNBfFN4q0AR+Y8MwDpmWgM6i018VgrCR3cxN63+x6IDLLbtQ0O7RVslQJCNBi
	gY+AvcMvbH72Lxl6u4ghUoWKNGWX7UL2fa3voJuk+rii5AMt1HTvUgGrl1QWp3GISuxFweglBNO
	RCJLxMlrVsMX6AUufwkpWYxCLfZCYRlFncqEsA==
X-Received: by 2002:a17:90b:5606:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3933b78b698mr28362534a91.6.1786997522783;
        Mon, 17 Aug 2026 13:12:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e84244sm6315796a91.6.2026.08.17.13.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 13:12:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: at_hdmac: use devm APIs in probe()
Date: Mon, 17 Aug 2026 13:12:00 -0700
Message-ID: <20260817201200.10952-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_131203_887755_912F3831 
X-CRM114-Status: GOOD (  13.09  )
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
Simplify the error handling path and removes explicit cleanup code.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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


