Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30C4C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 22:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DudDQKCoIhab8frMhgA6W9h7XpPyKDOhbOMYUMP2BNI=; b=ZqAVBez0dEprJIexbtm+QaLFV+
	jnhiaoL0Pn8v4MriWMt/IZX9AbdWK0NhLf2Hk/pDMTw8xzQG1JbdFOgemz6a8CvqBV4PU8d3lDCyg
	epwkKxZ+GG4k4QUwWCXwrJ2i0H/1L/QbdL4nYpkMYAxZx687UhgeqWyjprrIX6ckQ/S0bXb2pq7y1
	b2MTyvybJL3uG0JxpTrACBIxB6aV+3HzhEgXmIKnQeZ26LtMalI4cDLeMYLS3r43gpp5rKX31e622
	r6CnvAxNNcsXZe5soVWt2eNLUileWbHNzzcVFrNn7pE7DODb4wNEvgguj7m3hujPPKU7s8dccn57y
	633YGWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOpa-0000000HLO1-3eh0;
	Fri, 24 Jul 2026 22:57:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOpY-0000000HLNg-1tJV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 22:57:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-381b831d535so1091046a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784933843; x=1785538643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DudDQKCoIhab8frMhgA6W9h7XpPyKDOhbOMYUMP2BNI=;
        b=az+5kS3vL5M7kI6sC7RfHlgLYwFfdmNXjuQJr64IogOg6N2oG/Oky2UVDAkPi3xHpW
         vFhbgc82Igl4fbSILHya1LbqCzPA7uQfOEdmgSOsYjbs91vonWdPdGc8RgS3lVwmQf4g
         ko2j/mFQeAPSHUDfuDQn5TouDve1QLBgZ6/+LQdjc33LUftIQ9i+qCwNw6aMGXIq82Ac
         OniraoeuvJh2doRDjtCkSsBqhWCECFv3/rQEZQZSduuQDLrTh95t3gKYPIF+Sj58yx+y
         om6DomXuGsBoqp1KThL45vtgj6zAlD3Ba12lHCWVgbytzK4mA1QKzERuGjr5bdrqtwJc
         pf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784933843; x=1785538643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DudDQKCoIhab8frMhgA6W9h7XpPyKDOhbOMYUMP2BNI=;
        b=h0mz5qDwItPCINnR1FwxAFvO1EUU4NuYDhoxcSowRtnkAbJl2qgJyYxOAC/IR3G0hO
         p/DuepNEOxxay2S09xdyweECI/m15u4QYXfMyzrIoLhXEnrPPQQk4vOYkdg9T33FVY6o
         bxCtEFu3paDUdQN4YfkafBj5Aorce45OPOwlmyzeuEVoM/DFgjEoL8sBqeZ3StKe6wpq
         ah6Xt+J/JRiDSyeiCsS7SszaS3S0N84W9BeW/4G2OvrCbUvIaqKCUUEBfm0XGe102gwo
         lPGYqqkgdlbeX54PvIpYPAyJ14MmaATdqqhL0lzwkMitLhY9BBBdCHbsbhhkkfRul2Ax
         9hLw==
X-Forwarded-Encrypted: i=1; AHgh+RrBpTJH6CzpLKmJ+nvUm3R/6W/E5QIh61fOeUcDVjL5u5YbSDlYN2Q8y5C/ROzwEhvKha1VW8ZpBLZP9EsuOAgo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn23Fdbxw5/f3tcu3ERradl+t4iUyxOX1bZZ1mx0KhbsNtCaRd
	YiQBYwUb95XCKTGrvOqH8XiQEhAqENMpUccqXCQjf3w+PIDNTx9pLuCx2gMoGA==
X-Gm-Gg: AR+sD13D9w/QwVOn6QBzJCZ8vmj/ROM0y/R+w7bjVR7OmOISERc3TlLKKVviTR8Ik9z
	9+T5QPzmeHi0ydp2Q4bnrvZpUK3KXr+wVPMJLaukV3tLptgWt7RU1KL6YYRRSek3Am9SKCZH1HN
	Zx84H3ziXX6R2PEHPtxDHwYehE9a6uEGj30Od7tv83Pb76Lo3KtpMVesqz1uKNp5Jede4QlCUy4
	TVwnbf1IY3v7/6GgJgt7SzxxZZxGJ179jXWO6hDGNhZJubfWyrhtL0ZHWNT22unXksP4rJeBwJS
	2QmJDyt5SahID2F8yV1mv2CYLHZ4UIVoQw1q63d2aIyJsnl/D3RrQiXNYASAH8eGcziVhtxInZp
	s8dmQha8s/U/v0zWjdvZky8xwHGN00jj8fQ6XbEdbeHT5k1plFzYOAXmjQSsbG36yrPZ4n+GLmA
	aFzJBYCgo5Tjw9r0gCx9utipLHmgVy10e/1w6Wp37qyg7eu5cwut6xtEVODVZX8BrXBQ9Yc5wo2
	v7e7JkoHqIUF84Hrxr08mb/uwH1fm7372or3tgqgpqceTqSX0juyCNQBTDyr65OBw==
X-Received: by 2002:a17:90b:1f85:b0:387:e0db:3fae with SMTP id 98e67ed59e1d1-38f298bc8e2mr342043a91.39.1784933842946;
        Fri, 24 Jul 2026 15:57:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292d1d75sm119239a91.5.2026.07.24.15.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 15:57:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: at_hdmac: use more devm in _probe
Date: Fri, 24 Jul 2026 15:57:20 -0700
Message-ID: <20260724225720.43410-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_155724_500260_48471BB3 
X-CRM114-Status: GOOD (  13.26  )
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

As devm is already used in _probe, complete the conversion so that
everything unwinds in proper order.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove list_del
 drivers/dma/at_hdmac.c | 50 ++++++++++--------------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..f16cf29ca548 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1980,40 +1980,34 @@ static int __init at_dma_probe(struct platform_device *pdev)
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
@@ -2080,10 +2074,10 @@ static int __init at_dma_probe(struct platform_device *pdev)
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
@@ -2092,27 +2086,15 @@ static int __init at_dma_probe(struct platform_device *pdev)
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
@@ -2121,22 +2103,12 @@ static void at_dma_remove(struct platform_device *pdev)
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


