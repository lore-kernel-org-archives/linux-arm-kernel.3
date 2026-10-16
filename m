Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4413FCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEa/2At4h8ZJit76fcYpbi2gFdx3R7gwg1DXrCjiWtw=; b=4x1XmkYxBDMg1QT+Xflu1IyMAc
	GgoYNmcJLWYf165n7YRCEpAWAekSwhSJ2Af2ko22zxXTaOROBgmuuKmg9iczYC8edCxGfS/6OuxL9
	w7N35f4sIk68t7L+r47qXLzVStjXaQiUZi2j7JsNMTfpI45+fhYXJQXzuaf2LLIrZjYLjbejhXQ2n
	U/CWbMqnlWZujMJNBzpZesF5f6LLrLX8q/X55M1NMl1n3GdW4YXZe7ITb2KfJqX9HcQJ0rFzAOI0c
	+DCTHBmhEO5oLANQ1XfU+C3oyYjimxkvjl4W2tVx3aHwCfye5IE6V0FNCn/vA4jQA8Ihxr9iBR9Bn
	9x6r7PcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe0F-00000002Rjc-07hh;
	Fri, 16 Oct 2026 09:13:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe07-00000002Rbd-1Y3t
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 09:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EEa/2At4h8ZJit76fcYpbi2gFdx3R7gwg1DXrCjiWtw=; b=qAvvap3Q0OkQ+WQTw+EGvZdMD/
	ET/GrH4rWZz26KiZ/2bHm8+WTUc2MBK0cNfnV7g+7DWKPnoI6FgrbL+rSNXUbk/wMZEh9PP5BjVa6
	fiCwOYnN1SW8Atz1Ly0G1B97Y8PPJ2ShAstSa60j35d/4rJOuMUkxptBuhN6lay6vEtSLDyWYUKqD
	VgBQqyCBJjXYhFHAa3yjf5iSwZFaK5SAqz/rTW6u8AC+PoVmnoc4BuTwNIkoaD7wOY1D2s2/7xTqJ
	klOlgT0SeiL8VTpvMh2jYaNDR5kfsKnT/dMR1bBoORor7PGcyxFvNTRgIpeCzSzcMLHxTd1Xu1jM7
	/+8W2wxw==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdzx-00000001J4C-15rF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:13:16 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cd60d155070so1435322a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 02:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141986; x=1792746786; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EEa/2At4h8ZJit76fcYpbi2gFdx3R7gwg1DXrCjiWtw=;
        b=TquWuaU60D5hjHViuaDCzdG3NfMPIFGfw2NbJe/F4dkA4eNEvLvcoX8PCqNaSoem/z
         OzOdMOfBNyb+uPHohO8Y7zgOoh4GGURvGOOQzkFm1JTR7VyODw6uRM3T7OY9XrNS3pUz
         APOTygRoV3ZkIcHVMiuxRZcJR177vMDIrAjHDZrHDnCiZqPNv2ayeafXvYYYHFUjlZ2m
         qS6JHpW5EMafukAO+uD8nA0ewDJy3xYyVDNRp/21BfMEkQDCHvCUPhslHK+3dmAiVB6Z
         GegGPysXREF5v1XUHPyeo2XvGjjvCll0QB5pMOkFwj8THPXmLNlA3cDVMkogVgjzM1qi
         un0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141986; x=1792746786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEa/2At4h8ZJit76fcYpbi2gFdx3R7gwg1DXrCjiWtw=;
        b=u6vE8GcK4vmdvaLN1kbIF2kIPjMd087LT/w3gh3w0l5+pS1zyrVkfl1ytte3xhCXKn
         2m71YQbOETwWgYiVL/Zgtl4PF/3cxsPIX7njc+24m3DR44MUwzd1SyTipgNx8NYhctgp
         9nKivAzRUnbBq1APlQVnjBZzn0kg3/tYBUnga+zQDJ984D0+q5H0KlPj7k2qPh2af84F
         SehWxLJeksgihRe3cdYRRSrjI9ipCFwvt9QSddw69zuswKA1/DUg0XHWD9R2AJ9B7Cdk
         KLEBrLDTKnKBN3VWSGY22Z5o921e98xVWRWf6V7fnrzubUEH6pF1h9C2Tdq5nZUrCnfK
         TdcQ==
X-Forwarded-Encrypted: i=1; AKwUvByfZkmmOlf7PA061Hw0yv/F8wvNiGgQwggtLrJWinE8+e1TttrQBNNQG3Xj1Kr8o5jyNFthGKQts65ZN6X79IWf@lists.infradead.org
X-Gm-Message-State: AFq9FYICNyzwV5oRCPEJIS1xJEjGmdS/ActDdUheGdr3BxWWRxAtcbaD
	G9fZuWJ7koun4yUx6qHywDGVTcMSssCkzA5ecIS6HcNC1KSUxp1zaMDW
X-Gm-Gg: AYBFou2I9hXLGzImXMKoETsPf6toXuMHx43EN6+3fBXmX6ZfJWMf00iQwjBtVU6AYbX
	VsCuV29afEisZeXemKg6Ek8vChBrzkgBcJXjA8NVFlD0DBxbf+Igs3KL/qQh2H5ivKcgvgf18O9
	2UYKZ6Cj0US/YblUaMTN8ADGs49p/AR2pS3h528JA7si0KmQ2DuUOZsmSdY21Re79+Fg64Q1MMM
	glzjeEndoHtmevl6yMeZKWrkNzl6vNnnQ44VofaP/XKLsh+FVsEzLlctPwOQAG2FhgxqZIYooMA
	V8Wxt141oB0ruvipbGEPvS6SdOWTqxSWIisttzSOPTDPlM3vAYpBni4J/SG8vTPcmMNYGBnIoG8
	f8eUCZPmWKEdeR+eDgjr8352dQsJGeuHIZdenWaFtUiL24Sv1xUNugs0TLJmurwYsmLRzWx7rsv
	BFekmsMzQx42SVzL+stOfy7t2z5HJsvpLD3wrk2DMXhI6F95cccBYQoP3Jki6ztOhxpDjrZ+O2Q
	a0XPPhwEaRgtlpDvHMSSjzt7YFOZmL8/kgKxL8AhJOe7O50nqJiJ1PNxQpD
X-Received: by 2002:a05:6a21:1bc2:b0:3dd:a197:7368 with SMTP id adf61e73a8af0-3e16c0b3393mr19115807637.65.1792141986248;
        Fri, 16 Oct 2026 02:13:06 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:13:05 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:35 +0800
Subject: [PATCH net v5 3/5] net: ethernet: mtk_wed: free up rings during
 detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-3-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
In-Reply-To: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141973; l=3046;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=U6JZO9nx3rPOiVZRdnCq19XQmBvRUGHPkux0rhIb7wY=;
 b=nho+TYyw4v1ERH9ayHCtI/6QwLa6MGM/Qf8gpXAuCuRUXlco0OF1n/jItA5a2GBAW2NuSlqtz
 6PqqC3ACTmFAmO1YrmJ7m8BXbsbZYKG9hA4G/3QUJ68hCZj+vVdi8Au
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_101314_643450_1CF53FCF 
X-CRM114-Status: GOOD (  14.41  )
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

During __mtk_wed_detach, rx_ring and tx_wdma aren't freed up.

Fix this by add them to mtk_wed_free_rx_rings, also set
MTK_WED_RING_CONFIGURED flag in tx/rx ring and wdma tx/rx ring setup.
Only free rings that has the flag set.

This patch is pulled from mtk-openwrt-feeds to address Sashiko's review.

Link: https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cause-memory-leak-issue.patch
Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3f0be70c3f14..b8264435acbe 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -949,6 +949,16 @@ mtk_wed_free_ring(struct mtk_wed_device *dev, struct mtk_wed_ring *ring)
 static void
 mtk_wed_free_rx_rings(struct mtk_wed_device *dev)
 {
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->rx_ring); i++)
+		if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
+			mtk_wed_free_ring(dev, &dev->rx_ring[i]);
+
+	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
+		if ((dev->tx_wdma[i].flags & MTK_WED_RING_CONFIGURED))
+			mtk_wed_free_ring(dev, &dev->tx_wdma[i]);
+
 	mtk_wed_free_rx_buffer(dev);
 	mtk_wed_free_ring(dev, &dev->rro.ring);
 }
@@ -959,9 +969,11 @@ mtk_wed_free_tx_rings(struct mtk_wed_device *dev)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(dev->tx_ring); i++)
-		mtk_wed_free_ring(dev, &dev->tx_ring[i]);
+		if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
+			mtk_wed_free_ring(dev, &dev->tx_ring[i]);
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
-		mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
+		if ((dev->rx_wdma[i].flags & MTK_WED_RING_CONFIGURED))
+			mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
 }
 
 static void
@@ -1885,6 +1897,8 @@ mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 					 dev->hw->soc->wdma_desc_size, true))
 		return -ENOMEM;
 
+	wdma->flags |= MTK_WED_RING_CONFIGURED;
+
 	wdma_w32(dev, MTK_WDMA_RING_RX(idx) + MTK_WED_RING_OFS_BASE,
 		 wdma->desc_phys);
 	wdma_w32(dev, MTK_WDMA_RING_RX(idx) + MTK_WED_RING_OFS_COUNT,
@@ -1931,6 +1945,8 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 		}
 	}
 
+	wdma->flags |= MTK_WED_RING_CONFIGURED;
+
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_BASE,
 		 wdma->desc_phys);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_COUNT,
@@ -2504,6 +2520,7 @@ mtk_wed_tx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs,
 
 	ring->reg_base = MTK_WED_RING_TX(idx);
 	ring->wpdma = regs;
+	ring->flags |= MTK_WED_RING_CONFIGURED;
 
 	if (mtk_wed_is_v3_or_greater(dev->hw) && idx == 1) {
 		/* reset prefetch index */

-- 
2.47.3


