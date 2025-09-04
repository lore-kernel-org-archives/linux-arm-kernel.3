Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFC6CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65sfH/ad84nrJwQJ1pdXZCCcEwu4ZVnR+CKSuX7QrWI=; b=FcNeDwIme5o+6K4qgFc8s9HqQ3
	OYlio9yuTHz1HrjG0JX4z/L8AQJi8Va8FonBdeP0ayrb1nKgc3iYClmg0D7wSmN1DfSrkRdS2RZS8
	af0QjkZdt/bgMQNE06KqfwGvUsg75ENKylOuUJH68rzv4NKWVp9NPCCX6bbSeADflRvAbZwSz1/d5
	Ndo2Ddx7VBYyCb7H/VP71/gO5Kidhwt06lIEuxBhD8U4wFZM4i+z1U7a0LWsuADYkJ3773Y8Vr8c8
	JRyzHZYhz3tCqZp0Oli8rLu1u2GsKoN+yYAdI7RNs8WEMD2d6Ra+HXQuy05RaT4QMbp+HNsXAKPRZ
	j4Bbd1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0l-0000000FxvA-3TtA;
	Fri, 05 Sep 2025 02:17:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCyj-0000000D0Dx-1Tj0;
	Thu, 04 Sep 2025 16:38:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7BED6028E;
	Thu,  4 Sep 2025 16:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D2EC4CEF1;
	Thu,  4 Sep 2025 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757003908;
	bh=jtgRLf0FRRSizIapqgfH1YFeyTX28uqo02yIy46q7Po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gnsNh7VMJZzaYGqHuQqdkPobXeL19Tu7b2Lm8MCbusSaOU2CkGRdFAfNoX/ut3QpN
	 YzbVuu3BhkbPHY0McN5WeuhnhoZkMlKMwrJqYuH4maqd847Us/unbd7bVzRQ+h6xW8
	 1iUZZog+Vao9A+JdN3EHZQ8rrNeo+6BSV6rRYTJqyvCbNC55942BadG7QXTbqPDnT5
	 yy8cDbixT038l/I5G+fMm4DA8bBKwN5SquObq7iQMJzKOk47t+nZBELoOv9Znn/AXK
	 NjAqSGZEd6isRDrOceT5dr1pKfLST/QCeCiXn5H/t38unDwIuhcvuQu5tfHr80UA2x
	 qTrEwZAzDgB8w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Sep 2025 18:37:58 +0200
Subject: [PATCH mt76 v4 04/15] wifi: mt76: Do not always enable NAPIs for
 WED RRO queues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mt7996-rro-rework-v4-4-2cd91e7229d6@kernel.org>
References: <20250904-mt7996-rro-rework-v4-0-2cd91e7229d6@kernel.org>
In-Reply-To: <20250904-mt7996-rro-rework-v4-0-2cd91e7229d6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

Do not initialize NAPIs for WED RRO queues if WED is active.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 68b1dd1dbbe0e2b4850e02ee70253b5e248c69bf..f882b4e10858a233a5422ede80d79c21965136e9 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -967,6 +967,10 @@ mt76_dma_init(struct mt76_dev *dev,
 	init_completion(&dev->mmio.wed_reset_complete);
 
 	mt76_for_each_q_rx(dev, i) {
+		if (mtk_wed_device_active(&dev->mmio.wed) &&
+		    mt76_queue_is_wed_rro(&dev->q_rx[i]))
+			continue;
+
 		netif_napi_add(dev->napi_dev, &dev->napi[i], poll);
 		mt76_dma_rx_fill_buf(dev, &dev->q_rx[i], false);
 		napi_enable(&dev->napi[i]);

-- 
2.50.1


