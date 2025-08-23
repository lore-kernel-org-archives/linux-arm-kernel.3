Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED39CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8VX6q4SLW6XTQ4SBgLqTZXOM7mhPBvjlSBRKSc2NaI=; b=IGN82em1M+Zvay/cIhdITmFKmQ
	Kvn2RDAriSeLGzZWiY+O5O789YeQssZOmQeXQGRrJzbEQGBBTGRHzbnCK8GQlG1twAGZS+S2tVRTx
	Afk5lVTcUorhuLWdSH02nbvE/g2qHRW3DGNW9gFQZqo+pV8QRa6JwVX+IJDfZ3VMfpsB6dKA90et5
	tnEx8cB4d7s/QMFLUcBZE8UEZMwbwIHCBKzZFfTHDc6uhjmRtTxHY8fpnt/hXSFuaTSTppJGwmEO/
	xSAYF4xBTuPyHzcLpGrijRjYBMwspV+ygglo5h/WJwAWkYBHbEfkY5pD+0ah1Ri2neqLoBgAfrn87
	pGswmB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upr2b-000000051lb-0N2T;
	Sat, 23 Aug 2025 16:24:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqcw-00000004wzY-1pkv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0D125C4573;
	Sat, 23 Aug 2025 15:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD23BC116B1;
	Sat, 23 Aug 2025 15:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964677;
	bh=pVQUvqJRO5H4sWHsAkGOHbGYc59txE4I2DP6q9gpHjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KAgudiOBs/ydEz7Y58Rut0JazrdH1up7gt3gCUfUXKuw+UnVYsonvPtJg3vchhnM7
	 kOfA9WWGjieQlf68ZZs7oj6+fL9R9SZOVUssw6YaLnKJrMgiy1D6wRHzp53xyUUk7g
	 r3bbW89sWFMnv7ct8puViNlM/ZeSTPlkS0BHydhJCZPtUo2JuE+kbO0GCXNDZ3ieds
	 jFXzWZSFHnJ+YP72rg4kENj7myFu8IkVw91IiTW0OVtXpKp9l4PWy2EULSjoy7bZXu
	 7evyz9/jIoOtmeEcqcbkMNNbuUD5LJAeic3whvG1tiGEQ/Ju93efldoTWG0sEygFl8
	 cDEGXocRB0zXQ==
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
Subject: [PATCH 09/14] dmaengine: dma350: Support dma-channel-mask
Date: Sat, 23 Aug 2025 23:40:04 +0800
Message-ID: <20250823154009.25992-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085758_514143_FD18D964 
X-CRM114-Status: GOOD (  13.29  )
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

Not all channels are available to kernel, we need to support
dma-channel-mask.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/dma/arm-dma350.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 6a6d1c2a3ee6..72067518799e 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -534,7 +534,7 @@ static int d350_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct d350 *dmac;
 	void __iomem *base;
-	u32 reg;
+	u32 reg, dma_chan_mask;
 	int ret, nchan, dw, aw, r, p;
 	bool coherent, memset;
 
@@ -563,6 +563,15 @@ static int d350_probe(struct platform_device *pdev)
 
 	dmac->nchan = nchan;
 
+	/* Enable all channels by default */
+	dma_chan_mask = nchan - 1;
+
+	ret = of_property_read_u32(dev->of_node, "dma-channel-mask", &dma_chan_mask);
+	if (ret < 0 && (ret != -EINVAL)) {
+		dev_err(&pdev->dev, "dma-channel-mask is not complete.\n");
+		return ret;
+	}
+
 	reg = readl_relaxed(base + DMAINFO + DMA_BUILDCFG1);
 	dmac->nreq = FIELD_GET(DMA_CFG_NUM_TRIGGER_IN, reg);
 
@@ -592,6 +601,11 @@ static int d350_probe(struct platform_device *pdev)
 	memset = true;
 	for (int i = 0; i < nchan; i++) {
 		struct d350_chan *dch = &dmac->channels[i];
+		char ch_irqname[8];
+
+		/* skip for reserved channels */
+		if (!test_bit(i, (unsigned long *)&dma_chan_mask))
+			continue;
 
 		dch->coherent = coherent;
 		dch->base = base + DMACH(i);
@@ -602,7 +616,9 @@ static int d350_probe(struct platform_device *pdev)
 			dev_warn(dev, "No command link support on channel %d\n", i);
 			continue;
 		}
-		dch->irq = platform_get_irq(pdev, i);
+
+		snprintf(ch_irqname, sizeof(ch_irqname), "ch%d", i);
+		dch->irq = platform_get_irq_byname(pdev, ch_irqname);
 		if (dch->irq < 0)
 			return dch->irq;
 
-- 
2.50.0


