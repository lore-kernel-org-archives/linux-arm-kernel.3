Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACBECDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=36jF0aae/2qf/mqPeDqHORRtGgqdr7FBWT7b1LCQhJc=; b=kZNyQMEHjJqjMkxu2W9aetXqN9
	OOldRdcH3oOVm2wA9BSEZJ86X3o/q1ZDDVxRcDF0IwhaTx4syUtNM0S/1oJ3qdoTFWa3myBhgiqCw
	SaRLfh+hFC/Nim80jb59M2Kj8BIdG0j9Dy33YB04PDjGsDZLBkE1U9RKzXg1gUTwrXvuTBowEEmfI
	tKzcoZEEeUmpRP0PGi263TF6CnUVxnHwWw9mHCplW+pORYP0lR6Dq/GyEJM+RNZeL0sVO5Jh1HdhY
	yVg3UjYFynl4zALwzyXvLeJqRdp14xq3AD5H3OhOGdwusEAvvUmM2Wlln7nc0kV94b7DDLh3KyNyE
	dBLg3cMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcInL-00000007Ns9-24P1;
	Wed, 24 Jun 2026 08:17:15 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcInH-00000007NrH-3y4d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:17:13 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-37c5b9d42efso1088956a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 01:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782289031; x=1782893831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=36jF0aae/2qf/mqPeDqHORRtGgqdr7FBWT7b1LCQhJc=;
        b=ghbeAJH7dlo7XQQJL2L1IixS8icEIbKOdy3yuuT+DGO/LyxGDdNx5rJV6cPdVidCzn
         NUtYvDLDzJlhYeR751tMSd1TYlz4bWyH17454m8cHc+6qhVfDjs7rQv/l/rul4Kb5VdW
         xVeAe29vLcUFAyGy/iQ91QCa4LjoIVB46ANLAAWCR/DPy6wDm0/c2Gv0zYR8dkX7OZzc
         +zNjaQYyLZ+0VEv7kkyr1IZ+3uUoVXoUOBqbnClZy5MHUrY/4V7EywrxOudRZ8436mN2
         cx4PrRE2W21wDcevhnQ7f9xViplwvqv0W9v8lPs9cRHjesdQbo3Gx+8Q2rQoDaxwLA/4
         Sx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782289031; x=1782893831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36jF0aae/2qf/mqPeDqHORRtGgqdr7FBWT7b1LCQhJc=;
        b=KO+CGk0HiaRMfpp/2gs61DjNjlNXpY5Mt0Z1xtWj4VMvyQuYFQtfJeKCEvZ4YyMvv1
         VqGgT7XBJLbSfso/dNsDnabC+Ba5/iqq6hkWtvh499NOJ/CDnNRffwuKo+TXHGrxe6Qo
         emuM9GuXgS8nqVBTziPpYIxbtrIThJYBIf0pkBP1o08SgmIXtklfhvuBFLzIMtoV0SJk
         bvarKQTMcSL2r7qitvu6nB7k0vBw6l5yXwWleWaITTxdc+R8hdoISxuYlVKFdG3+WhND
         nIIExc9Bg03sTcedW4rUOcYW6FqzSl6h7NSpo+pv7m83K5Vg7K3iQC+JuDsHM4LFhcOo
         vIiA==
X-Forwarded-Encrypted: i=1; AHgh+RoNBYMA+C61WESfhBWSyWgKaYYOGOhvuFH1Q3MK6XXigCXwAAaInwQQvzd8quoafGZJSp1e82aMh+rNbRCtHFba@lists.infradead.org
X-Gm-Message-State: AOJu0YzgByiSZ9ODgQl0Fp3d4rcmR+f8fjbO5vDH98RrgGFue72hHxv3
	Hjg8TARiegrclv1WQkzoeEeXwhXJ8i+VZs7O09AJsDkZCE7OS6nVUak=
X-Gm-Gg: AfdE7clue12y7rUoAtEb3ul4KbgA9HXJ78HxL3zgvCl3wM41LXpoENVO0L54xZq7pga
	/s+/COX5IjcSRPv8IOl93QzuP9PoNAlWHzoYpu6GU/NV3Ul5SUmz2wwx7Aj2t54XOkEcdFVB2Ac
	DlflfAjCKshHUJvg13dOogmFYxHByH2SEhSoIuwcCIqJTG4z3gA63TiqIBBq6d+/5PyF+GKR53Y
	K/obeGfPhbrypQV4QObMOxenA6SvRJeatUF3D+a91FSKPupHuo8J48Yd+aXIm1fJxargSJ5GoCY
	q/nR2U+MqVR92uf5+MJicPrncoo+C5nZ7b0PwCuAZ8CqlFnquR3XcAziYBCPsUkyABx46h7riDa
	vhXORkmhdtHxQ0gLsm/d88oqDRB5NHOfdJvK2Y3ha4vDn+wjOfviaO/aBlvUcf6i1/CXgGPaRPg
	1g1i3vWLfuvF6vMZuPNg+nFagPWoAnyS9BXjm+0JuOAqOq+mdAhKxNq5YQIgCmSJD/
X-Received: by 2002:a17:903:8c5:b0:2bd:3c21:a053 with SMTP id d9443c01a7336-2c7c3ff8e32mr60401005ad.24.1782289030882;
        Wed, 24 Jun 2026 01:17:10 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f7de7sm121836085ad.32.2026.06.24.01.17.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 01:17:10 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] dmaengine: mediatek: hsdma: fix runtime PM leak on init failure
Date: Wed, 24 Jun 2026 17:16:38 +0900
Message-ID: <20260624081701.19358-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_011712_010343_C1627D1D 
X-CRM114-Status: GOOD (  14.26  )
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

mtk_hsdma_hw_init() enables runtime PM and gets a runtime PM reference
before enabling the HSDMA clock. It currently ignores failures from
pm_runtime_get_sync(); if runtime resume fails, the usage count remains
held. If clk_prepare_enable() then fails, runtime PM is left enabled with
the usage count held.

Use pm_runtime_resume_and_get() so resume failures do not leak the usage
count, and unwind runtime PM when clk_prepare_enable() fails.

The probe path also ignores the return value from mtk_hsdma_hw_init(), so a
failed hardware init can continue as a successful probe. Propagate
mtk_hsdma_hw_init() failures from probe, while keeping a separate unwind
label so mtk_hsdma_hw_deinit() is only called after hardware init succeeds.

Fixes: 548c4597e984 ("dmaengine: mediatek: Add MediaTek High-Speed DMA controller for MT7622 and MT7623 SoC")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
 drivers/dma/mediatek/mtk-hsdma.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index a43412ff5e..987e5274fc 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -849,16 +849,25 @@ static int mtk_hsdma_hw_init(struct mtk_hsdma_device *hsdma)
 	int err;
 
 	pm_runtime_enable(hsdma2dev(hsdma));
-	pm_runtime_get_sync(hsdma2dev(hsdma));
+	err = pm_runtime_resume_and_get(hsdma2dev(hsdma));
+	if (err < 0)
+		goto err_disable_pm;
 
 	err = clk_prepare_enable(hsdma->clk);
 	if (err)
-		return err;
+		goto err_put_pm;
 
 	mtk_dma_write(hsdma, MTK_HSDMA_INT_ENABLE, 0);
 	mtk_dma_write(hsdma, MTK_HSDMA_GLO, MTK_HSDMA_GLO_DEFAULT);
 
 	return 0;
+
+err_put_pm:
+	pm_runtime_put_sync(hsdma2dev(hsdma));
+err_disable_pm:
+	pm_runtime_disable(hsdma2dev(hsdma));
+
+	return err;
 }
 
 static int mtk_hsdma_hw_deinit(struct mtk_hsdma_device *hsdma)
@@ -983,7 +992,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 		goto err_unregister;
 	}
 
-	mtk_hsdma_hw_init(hsdma);
+	err = mtk_hsdma_hw_init(hsdma);
+	if (err)
+		goto err_free;
 
 	err = devm_request_irq(&pdev->dev, hsdma->irq,
 			       mtk_hsdma_irq, 0,
@@ -991,7 +1002,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev,
 			"request_irq failed with err %d\n", err);
-		goto err_free;
+		goto err_deinit;
 	}
 
 	platform_set_drvdata(pdev, hsdma);
@@ -1000,8 +1011,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_free:
+err_deinit:
 	mtk_hsdma_hw_deinit(hsdma);
+err_free:
 	of_dma_controller_free(pdev->dev.of_node);
 err_unregister:
 	dma_async_device_unregister(dd);
-- 
2.47.1

