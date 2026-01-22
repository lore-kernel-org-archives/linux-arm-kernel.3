Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE955D62613
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ePs9oLQx+ASceiPBfdfxBNJeoen+WsYKE+jP3d8Zrc=; b=qmeDWniKDpUat9sm608C9ZCEiA
	+1NUVs8MGK/OVQFvbji9mGA/CTzpRO+ZsXesJhmK3qhfv5sQ5j8uDAZ5unXWrVh+ZUCUROrKTuOL/
	9/C6ruAmNWfcE59AwW3OImdS8oCidvtoe8qD7dCfOeSU8jva1V2jApmBTh7lLPDhe9SPgWdRpcZiC
	e+32nIMuwtky1cY52oLIXmDCHtfm+fODcJiiA0yjlKeADkZw6duOVrRdg+6fg7OFMwKeGKbmqb4x2
	KTk50FvekJ77keNcLKXDT3JGUd2qMikMhWNSkUQE50W35P0L4hSCX9QrKzw+2kX7oZ0yWyteS+NAp
	98txEY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7f-00000006sS9-1UxJ;
	Thu, 22 Jan 2026 10:41:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7O-00000006s33-0YXw;
	Thu, 22 Jan 2026 10:40:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15EF44174F;
	Thu, 22 Jan 2026 10:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9738AC19425;
	Thu, 22 Jan 2026 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078449;
	bh=MywH8r2SZSBalpNJ9OdEdz5o7Oc0QkcvnF7g3fOHIaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TC8ohXA6IiBnc/nKJg7Pm0o2ptWQhR6DVq0InMjbU4HQhDSmVv8HoC1xHh880V8xO
	 CiUNZoExm2UWkrdIat0/58ghctnxtKE/8A43ruqGPNdLHAWk5ZVv8mbxtpy93BwD9f
	 zOQNM/fEUl7PPsXTKtl4LwJxPrRVzAyn+rWHsio1S2s1FS7/SZid8H7d5qOVN04olR
	 0nXg2ME7CpTz5RBP/nPOa/q0/gr2dEFr/ogkkyVQJQ1sPhbbkC7SYj533vE9OHWm08
	 AXxokDpQ+iIt6WjRDibvbJOfuOaA4g/sXnVvbTlzeTP1wvbkcy9kB6Ckm/7fYtxKlK
	 40pRPifW56/9Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:40:01 +0100
Subject: [PATCH mt76 v2 17/17] wifi: mt76: Enable NPU support for MT7996
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-17-2374614c0de6@kernel.org>
References: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
In-Reply-To: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Kang Yang <kang.yang@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_024050_263578_74C0675E 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Enable NPU offloading for MT7990 chipset.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/npu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index bc8f2012be9dbe2c7fc1fc885b6135d796d8c0d6..c4c7c0af63217a7e85b2d97b37febba16899e332 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -450,10 +450,6 @@ int mt76_npu_init(struct mt76_dev *dev, phys_addr_t phy_addr, int type)
 	struct airoha_npu *npu;
 	int err = 0;
 
-	/* NPU offloading is only supported by MT7992 */
-	if (!is_mt7992(dev))
-		return 0;
-
 	mutex_lock(&dev->mutex);
 
 	npu = airoha_npu_get(dev->dev);
@@ -486,7 +482,7 @@ int mt76_npu_init(struct mt76_dev *dev, phys_addr_t phy_addr, int type)
 	dev->mmio.phy_addr = phy_addr;
 	dev->mmio.npu_type = type;
 	/* NPU offloading requires HW-RRO for RX packet reordering. */
-	dev->hwrro_mode = MT76_HWRRO_V3_1;
+	dev->hwrro_mode = is_mt7996(dev) ? MT76_HWRRO_V3 : MT76_HWRRO_V3_1;
 	dev->rx_token_size = 32768;
 
 	rcu_assign_pointer(dev->mmio.npu, npu);

-- 
2.52.0


