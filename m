Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF54CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pURwj9yWnSULFv5YQjoOoOGHsEH6Xrp4gb/yO90tH4A=; b=Jt5eVLfY1RUMObDsZfq2dCxNEq
	GtPoqWPSpqjKyb2HhrtMQQAsfgzALMG7tLY5Um3mUgxbbh6WahQAOgb37UoChp6Z5dOeoUHrheOuL
	waB6laQR9DAlr/nSEfb5XRQH0ubEju0mS+mt5UwB5tNRvObjUVyzU939nipnhw+/S06nBcNNlbKL0
	a8WsNm/DvNwq4j5Q50juKucg9K/6R8vbwcxqaGo0FqM7AILFaMA71RcxAG4IyilEcUkXqLz5vNMQF
	WFTTDdGuVpW0VhwiU4U7hcqaw8yW50RqdwkLIUiRid8+PNeduOQleG1oJMSrBgpZXgXg5QyQ8V0Sw
	jMFYYQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqxO-000000050uZ-2LBz;
	Sat, 23 Aug 2025 16:19:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqcq-00000004wxv-488s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:57:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 344AEA58CB1;
	Sat, 23 Aug 2025 15:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF90C113CF;
	Sat, 23 Aug 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964671;
	bh=9tnT3V8EMcpHOzCuSJMK/RG61d+XRxnJ3mZs8oaJHDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rOFxm+c/6i/liATaMDBVIBhL8IELGHv+jqCsZrmJCA/HM6ZxX4WbHJpHmk1GGyGVQ
	 Q0PVlJrL8W6rJcZheVVzDIknqphzQk5DxZKT34WKt0D2QeTR1+Rw/1czG7+owmLqUg
	 DT4NtwEr7iVsqHu6KIsk1rPIPAX3I7udvfEUtOx642H2HUYvEeFZm65hgEVoqQUnqI
	 rHBzq3wOrwaQeQ+UH4IGl5sAGS+yabcOVWkiOHod0Cos7+915Q9FaqjWvaz9MwvyK3
	 7+KDRBC8o9Lno72xbpmVR6uCAOA6FSev48qUu3YVQJQBw4P4X+SnRO8Dg+etHyA9hO
	 QbJLXNVP85+qw==
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
Subject: [PATCH 07/14] dmaengine: dma350: Remove redundant err msg if platform_get_irq() fails
Date: Sat, 23 Aug 2025 23:40:02 +0800
Message-ID: <20250823154009.25992-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085753_087412_18D6A7A7 
X-CRM114-Status: GOOD (  10.72  )
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

The platform_get_irq() prints an error message if finding the IRQ
fails.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/dma/arm-dma350.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 36c8bfa67d70..6a6d1c2a3ee6 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -604,8 +604,7 @@ static int d350_probe(struct platform_device *pdev)
 		}
 		dch->irq = platform_get_irq(pdev, i);
 		if (dch->irq < 0)
-			return dev_err_probe(dev, dch->irq,
-					     "Failed to get IRQ for channel %d\n", i);
+			return dch->irq;
 
 		dch->has_wrap = FIELD_GET(CH_CFG_HAS_WRAP, reg);
 		dch->has_trig = FIELD_GET(CH_CFG_HAS_TRIGIN, reg) &
-- 
2.50.0


