Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674FACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFTk0TSpBeXxf6hKuKa2XlSilEwSVVDbgDk2cmj7DVo=; b=kuXLsGq7pqexDXJQjr9R4JDLgv
	hY7ABH1XDGSFsRW8C0cEtW0JwRt651Q3zsudzLQGS5pWrRB458HNbCxGURV5GnrVXxMkrbIgZBbPH
	0kzD/A+NWJ2dnHRU/VXPgdPvlRuk4dRFU4zhJmaPAhu46Q5vJV8MG0MLzX6Z8wBb2UIH1l3kTj3Lk
	tgMHBQ2SWmQlnXMNgQd+RHWgv/OJadKEUyIYAV3f/k+co608A+1ZaOzJQ6zt7D0xVnJ+ED+kv89mR
	JKmZYNWuv16gyzkMTLNYw9vFbWoAdEB0v6T5nnGfXNg06NQkXIbGYNlWTKm+U/FeH51b5oGY17n7S
	23PqP25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqsB-00000004zvf-4Bjw;
	Sat, 23 Aug 2025 16:13:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqck-00000004wwP-2bjM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:57:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E94843910;
	Sat, 23 Aug 2025 15:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4589C4CEF4;
	Sat, 23 Aug 2025 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964665;
	bh=KWbtZGmR1vxk04Y7G5CXe1Skc7vZRzVxtl2PKtoxGyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PLx3ZixC5rCj5/eVezg1t0UYlvV5cDEBwQ3KALN4OfBsNOpaiYgUkPhVFwcCYXMn4
	 C0/N2wRGJktQVl3BUuI/i03IoCiElCoxfvGSMUKoD4aPJl+iaTNhDe2GF0voPK55JM
	 DYyEf/xDjGw7N77PITP7rTNS9KF4L31OAJwJivt/DFibuiqgHGDXqO3F2TRrqbcvF/
	 w6Iv6lWo1mVn1zT5wiy7KxbkCGL7u3KCnBY+FoeC4kny2DmlePZhafN3iwMuUKTPeH
	 FXx51RwVPNE/EOzHdMz70t2+jYa3fGz7dcLdZ/wfkq289ZKrzf2nS++gzHqiA0lFRG
	 58hmAKxwT+WaA==
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
Subject: [PATCH 05/14] dmaengine: dma350: Register the DMA controller to DT DMA helpers
Date: Sat, 23 Aug 2025 23:40:00 +0800
Message-ID: <20250823154009.25992-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085746_676485_13EEDB47 
X-CRM114-Status: GOOD (  12.13  )
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

Register the DMA controller to DT DMA helpers so that we convert a DT
phandle to a dma_chan structure.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/dma/arm-dma350.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 17af9bb2a18f..6a9f81f941b0 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -7,6 +7,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_dma.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
@@ -635,7 +636,7 @@ static int d350_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
 
-	return 0;
+	return of_dma_controller_register(dev->of_node, of_dma_xlate_by_chan_id, &dmac->dma);
 }
 
 static void d350_remove(struct platform_device *pdev)
@@ -643,6 +644,7 @@ static void d350_remove(struct platform_device *pdev)
 	struct d350 *dmac = platform_get_drvdata(pdev);
 
 	dma_async_device_unregister(&dmac->dma);
+	of_dma_controller_free(pdev->dev.of_node);
 }
 
 static const struct of_device_id d350_of_match[] __maybe_unused = {
-- 
2.50.0


