Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE6AC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 21:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rFbylBrZDIAgIOQuj/sws9qSGB10wS55ldz6AYSO0mU=; b=kchK8mXyV2nTlPYFdq94BRg5Pb
	3wPYdFvm3VOaP/yqh5BJgQ3LaS2l3zoGu8Wb9XvP90f90PIAYobZ/yTEOgbYzlsrnKr6+zeLZnjgk
	84Av1AP7HoXBXnVpuaTAMft+Xso0xW16bN65PacYe26bh8MkwpqnAyQN1UFOuUSYF10av5tEfmdxW
	foz9qZA9xCAOUurJfYABvftEEBHPRb0veIiR3ZzMj2MmA98z3lp+Hp3210cTJFCotUYmh6S22yDxW
	ifj04ycCafJyEhB0aZG1CWJfHxltubwvSgoBGRleG435owRabXVCtMC9qH5pz1a+zdwf6G6ZCLtYk
	rMuF686g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43KZ-0000000AJHE-0okE;
	Tue, 08 Sep 2026 21:26:15 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43KU-0000000AJFq-2nQP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 21:26:11 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-859e0bc7dd9so375119b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 14:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788902770; x=1789507570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFbylBrZDIAgIOQuj/sws9qSGB10wS55ldz6AYSO0mU=;
        b=Xvt+9StR/2HvqCltv6WQjIUIUjSbbXhCc7huCf1a9zmtQCdqTjZEAwJskJ3FpGHVBn
         VyCch0vsLtrJZ2KyiAg6+QogyMq8AuSrhcJNak2mdBxN4zZgtlCze/Zpuu8VVCvOGToN
         j9VgEPVOk1Jqea320uzl2KgalG/O3a1i6dWErya9DOVNPteP+vlRu9a403moCTJyinds
         9ruK6CtQG4RDP2SrjL3GhervSRBfp/hSPVmB2QaGFjgsx/grydtEo1Houw/JR5148TP0
         7fry1U/1EdLzAymRyCyvk6Osrjj7p38PwBXC39Af/FQ8KHXLvPhweBe/5p9leK5mKxwA
         Q80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902770; x=1789507570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFbylBrZDIAgIOQuj/sws9qSGB10wS55ldz6AYSO0mU=;
        b=r5GcDmNUYuANHPWO9BF//q5rza2c1EFUb/qzPjImqVktjo3tI74ancVU+OE4XqCu04
         J5ZVorKFl6xXLqciDwOMPHwHGmI6i4DfR1CUqezQlO+YUNEnUdVWkrObqVqLMyvtfT6S
         JmAy6vz2eNT4e7jm8km5G2GvvXBEGJwnnssM0OYQ7lhtDyrvpH0g18ORqnElsHzwe3jo
         jgSMJvzfbk1rX+B9lJBf4qoWFq2KIS4I+iASqnJMXVHV0c0meKI9AL5nAdbYgtNG91KW
         CWdXTwiXsYUcoP5Cm+dM5RGBWzohRNpMw4LzrkiPqFycDlps6oir2kr24v87+qADZk+/
         uGuw==
X-Forwarded-Encrypted: i=1; AKwUvBwqclPHnUquPG4NjOcWrNa+UPPZoSKLC+pE92BXhaU/vdR6VrhTAIk74Chc7uMvACAhSpgiRMO8IclVheA9E/2f@lists.infradead.org
X-Gm-Message-State: AFuF++ndsEq7gFkqdhGBgD8jRMvxiYho/SoqTTW+p5AUjXbRqOCXOHeK
	qb0inhnmlYNXhsF6yRW7vLAN+xNlKthN/EwsrKreG5W1KSMmMwPhsDWP
X-Gm-Gg: AYBFou3sFobr92uqYxxMfK8eIMQrwcABYyRDXuGQlKNEJvwHtZlmh9xv7Cs3Qiqcfow
	rPvXyv1ta6GAF1G01XhUggqviAknnUTshudRKap0aJUh8LnNUUhqmshXKFiCbvz0PDUuLa4Lq5f
	poqGF/CSwQOXGssYvlKVMkERPGIjeeSnHadA8hVmmDNJwa9ShiNStzTv0QklJdxNg4mRgIU0+ZO
	0H5DwK4gFhVk8lzancixViTFAW5IZlu33B8b8pq81tS4Q42FYS1nbkOk7I3XhGPURVPl1rsEzOO
	xI2iWxv2Jfnl867lNAJHr1QBJJgis0BsnMmEoiUbH4E82Q+voibWPxsR8mwkfovIlrhwjtVe7zp
	iDMWKHZ00BgePSj1z7UnpNmMOPJffPRSi7uYKGPdnGdbE6eI+KNmDvIGh23YNp2TXXrRx0cQhZP
	4qXRudYB5sITUwGj2BWazdA7hazDoBBTA+XbgopQvhy3EESfSujob+72AZJcJ0ffIwTXIYqypNA
	BlnFFQG1PLRinyKUxxvl/nmYgIasQpAYcW1uALrjDQdRRGWzYJEAWg1SpMVwzWQ6eCv+6G8UZnD
	FwPpkzWjzRm1lMTdDvoJCDD+0Ref79Vvy3jY6kwvuU27cWnm
X-Received: by 2002:a05:6a20:9187:b0:3d3:adad:f177 with SMTP id adf61e73a8af0-3dabb2ec0famr2238273637.25.1788902769542;
        Tue, 08 Sep 2026 14:26:09 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4640bc66bsm4782413a12.10.2026.09.08.14.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:26:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: use devm_clk_get_enabled()
Date: Tue,  8 Sep 2026 14:26:07 -0700
Message-ID: <20260908212607.590224-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_142610_711380_9BD66D2A 
X-CRM114-Status: GOOD (  11.86  )
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

Replace the devm_clk_get() + clk_prepare_enable() pair with
devm_clk_get_enabled(), which handles enable/disable and the
unprepare on driver detach automatically.  This lets us drop the
err_irq cleanup label and the clk_disable_unprepare() calls in
probe error paths and at_dma_remove().

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index f4d0c72787d1..cae26ea890fa 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1994,20 +1994,16 @@ static int __init at_dma_probe(struct platform_device *pdev)
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
 
 	err = request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
 	if (err)
-		goto err_irq;
+		return err;
 
 	platform_set_drvdata(pdev, atdma);
 
@@ -2126,8 +2122,6 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	dma_pool_destroy(atdma->lli_pool);
 err_desc_pool_create:
 	free_irq(irq, atdma);
-err_irq:
-	clk_disable_unprepare(atdma->clk);
 	return err;
 }
 
@@ -2145,8 +2139,6 @@ static void at_dma_remove(struct platform_device *pdev)
 	at_dma_cleanup_channels(atdma);
 	dma_pool_destroy(atdma->memset_pool);
 	dma_pool_destroy(atdma->lli_pool);
-
-	clk_disable_unprepare(atdma->clk);
 }
 
 static void at_dma_shutdown(struct platform_device *pdev)
-- 
2.55.0


