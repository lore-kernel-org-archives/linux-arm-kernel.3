Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E84C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2mn31q9tQU1OehKqhUUtfCvCnBZjiisREJ8x835WzvQ=; b=uqEg3I0qhRRKCvEHq7yNcrC5b7
	4oZZSViiYx4aAdKo/5y2tSkab0JLf1I1yKLcJO1irOmsnk9u3+YLyUVCn1I/jaZeqZi3qgoy5JedF
	657ZLH55W6XM4gjsHuMZi1ZxdyduXWV4aXp07Jq5F70TIOeWPVxOlkWN2dPQBqvWkpbAVAKa0pZ0c
	BvU2rvbDrekRNXC3WGqVrD3fgOcmBuaBkFV1PQEywRqWlA/QOR+IstydP0HhbZSxGevLbVN5retpl
	31arpwnmw7bJ+LGhMO6ekRUCEtK3sc+68T8gC94kTWZ9krjI8KYrdWeu+zLLn39iV1xYSk11cgwJt
	dCbBTzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlej-0000000DRvI-3zAq;
	Thu, 23 Jul 2026 05:07:37 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmleh-0000000DRuk-2D3T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 05:07:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso204303a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 22:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784783254; x=1785388054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mn31q9tQU1OehKqhUUtfCvCnBZjiisREJ8x835WzvQ=;
        b=XXoYIFXOCu2hjeoV/GOgpSKwjWCKzRW16x0VpYPSWGOR2nzVdsuKKIHKtXY1UmjTo5
         t8iRaEspu0z0CMtsSdXYzvEnAWfIS+1vlLdz1FHEimETTsZR4TMhoArZprXDiYSaSzd4
         fazF9J2ReeqQL6OyD9rW2Il+r1Tu7PsM6UOk2VecKAaEGrYFyqon2gznAQftIxiTuNkS
         IED/DtZ9Cd5mdtwc7FkqJJ2mHSf/OW+VnQnDfdEqCGsZrlU3wePXdayvsnHATlMMjAbC
         uPvBTAqw7hyCY34yB1r9g4gbC2deT/mp5oYi3xS+WfMxU1u+oYiT0VUPixg6ZmI8Akr8
         ubPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784783254; x=1785388054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mn31q9tQU1OehKqhUUtfCvCnBZjiisREJ8x835WzvQ=;
        b=UPXIhXGGiv9+OdKdtglsiqlruQREd4iKHHOZzNXZt+u6x1pt1Elc2mDItYPm74dmvI
         eIHIc/gp7rdr9U1pL0jmCmUkIodmuMPgjTM0tZAg0ulcTPTvUrw3hVqu2qPolHCbUNM3
         sy6dU/NLEk1Ue4XVBUp86WD+DM10o0GRdmvty5hZq2Ap8fxCBcHCgFfGAtVrjkBa2Z9r
         ViNMLGT0ZyghnnyU1D8GWOEomN01iuwdbmfiPhH38yLcw+h8Njc50PnNtEZLV4xqzxQt
         9MBq1y4CjBnluRyLFQImEg1qqhib/a5eO3O2sP0OcZ9ucxE2nwpfIxpvczE0B1Ntstmg
         8/7w==
X-Forwarded-Encrypted: i=1; AHgh+RqrPk25bL3JWuvT6v9RJOwAJF/a9z8MTSqB1up8c8EdgxtQjpA0biElp8/jco5mZ5CNtLjxILNBTNeTktcnkenQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxI7gqzW6w84EJvwN9Wo5MA4Pr2pdZ/ZGUyelZoU7PS1gWEJlUU
	TYnU20aboPkQAfy2Vy9j6Zzp+l82HP6g1ot1TJGmMutn1El9or+5ZOxP
X-Gm-Gg: AR+sD12fjNM2vQd5b2hEP4VuEn1YIB9ImA7aMbMFCGYF+zNCeHKEbTzceScejFL3ZZR
	WQxkrXZIdhYxoq2oY6eZ59qcjQFIdeqxo9nqFpvlNR8x2tPeduK57iP7nTVe1FPXXGmfJnuvbk3
	qC3BzM7G8FcAI/L11yECLxXQMazTJT+/GBKC0RqCavgYpBVdBOoPaxSdPD/6xh45lNLkseU3HA4
	ipITgV9aWLe+ryuCfE8RKOBsO2TBp2uvUWdC1GzZVaxblJm5EZNjXW0laYPlzDGZ0qZNL3Ix6dM
	dWiEwo1IwL8aNmSKkgIR2GGXdPAsxyunWhJtQu/p6D+hOHraoxTK4HUBRCBW8cSoMNxDOgGOeHD
	GmUxaU9LJ85e1DpiSMKsQV2px0UBzixpqcq3KhFTEoumJoyNzGlHMu7+DGsO3I/YKTZwajI2D/W
	9qdQqIHkK2wH5ER4hJDraW/3FCV20mPq/uJVQG/kC29NAos4RXxOBvXvaPpaEqSK6bjqM/Ml41i
	9uNw5t4IvE/zciJII44Xlxn7m36trAOap0ldc2i4OW9RCa2xBmnzkmP2Y2fVrVyJw==
X-Received: by 2002:a05:6a21:6f12:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c44b01327emr1596136637.25.1784783254443;
        Wed, 22 Jul 2026 22:07:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f02e454sm2100411a12.0.2026.07.22.22.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:07:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: use more devm in _probe
Date: Wed, 22 Jul 2026 22:07:32 -0700
Message-ID: <20260723050732.290935-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_220735_594730_AC856E12 
X-CRM114-Status: GOOD (  14.38  )
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
 drivers/dma/at_hdmac.c | 49 ++++++++++--------------------------------
 1 file changed, 11 insertions(+), 38 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..25d846ed7a7b 100644
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
@@ -2121,13 +2103,6 @@ static void at_dma_remove(struct platform_device *pdev)
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
@@ -2135,8 +2110,6 @@ static void at_dma_remove(struct platform_device *pdev)
 		atc_disable_chan_irq(atdma, chan->chan_id);
 		list_del(&chan->device_node);
 	}
-
-	clk_disable_unprepare(atdma->clk);
 }
 
 static void at_dma_shutdown(struct platform_device *pdev)
-- 
2.55.0


