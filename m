Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160C6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIa0qniLt3ujCE+4O4UPB7qZ0RShF6h5l/lk8Dm/wFk=; b=eR2xESEOYzyrjTlPg2bddE9hho
	jLMulZcK0lFclKc3naBt0fclavpGgznfp2FVmG0VtC+fG3Wv8opgliSgWUWWdzy/qYamoP/TcuqbE
	TMXkdMSFMr7g72wXfa/y+8EpwnLjdrQkzeeSz4OWjLUVuv6GbJGO7uOgaeqYzAlAZZw5AX7saA+Uz
	u99Mm+gCRCk9aqzZIYKPBKaNDFl1NC479jHmZI/905Sa+Tf2karfYyGNU4andbJVUpH0Kq2m4wsHk
	LRBeJ4pLhlSrXGnBhJRrJRFYAGvxzfxPlryjjORO2qhjcSkr5dCne86XGpzKCicK0+9LuvJDt61r2
	OtPWAOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqum-000000050NU-3UCD;
	Sat, 23 Aug 2025 16:16:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqcn-00000004wx2-0zh9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:57:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0287B44EFD;
	Sat, 23 Aug 2025 15:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C842FC4CEF4;
	Sat, 23 Aug 2025 15:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964668;
	bh=s7oD37zLo4PNqPj/0q6kfWR1oTy0TLuV58NqZ0ga9Qc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bhvde1O2ygcrGguXmvnmR07UkPAS0Jvm3rZz84Is0xnvwI6mvKjfBDnIPWH697qQ2
	 8jPg4ZpiZ9tQVhZZNAJKf47REOJoPYA7zFwUGoeRdPHHPDpg474Fn1fosF4QLqqdTx
	 lWLtYrfHzjBKgvfx6ZUENfB/Hgm5L7ROOtQ5i1TLh+pMjF69hYS937v2u68xPHWdnP
	 izlL1nucTRV7hYyMuRj+dL7tE8YUSQ70Vrc/9kqXuBloZxNaKb+x0fG5MLdHRPCIAS
	 n9M6fV+OrJaNkDvwq2C3oIxC8se9pgBXiB3NAJZ1pbsVaBWHtVvCDnKQFgwqj50V+r
	 0UMzEBhIYa+JA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] dmaengine: dma350: Use dmaenginem_async_device_register
Date: Sat, 23 Aug 2025 23:40:01 +0800
Message-ID: <20250823154009.25992-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085749_291204_47E08D02 
X-CRM114-Status: GOOD (  10.39  )
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

Use managed API dmaenginem_async_device_register() to simplify code
path.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/dma/arm-dma350.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 6a9f81f941b0..36c8bfa67d70 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -632,7 +632,7 @@ static int d350_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dmac);
 
-	ret = dma_async_device_register(&dmac->dma);
+	ret = dmaenginem_async_device_register(&dmac->dma);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
 
@@ -641,9 +641,6 @@ static int d350_probe(struct platform_device *pdev)
 
 static void d350_remove(struct platform_device *pdev)
 {
-	struct d350 *dmac = platform_get_drvdata(pdev);
-
-	dma_async_device_unregister(&dmac->dma);
 	of_dma_controller_free(pdev->dev.of_node);
 }
 
-- 
2.50.0


