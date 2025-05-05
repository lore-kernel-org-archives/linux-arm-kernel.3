Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF42C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 01:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SikJNgzF8qbrWfeaoAzxbaXvQMUBhZ0SeB5mvJ0AwRI=; b=kXMDgZAA+0dvnOOeFqyIwvl8wG
	YbX77KzbGyvT3WBFXyZKZ4irQTnmGO2achH91LCB1o0ITl+3u1SaY46JcMePrx9Rp1SMLqNLJ72tK
	9sQfjTIXoHI632NVMwIM6y3DxM7ju8VaCy66f6N5ZDDaSB1K7fcQFAAuTh9rM8N9tUSId0OmAEJ24
	LDtjL/1/7LwWgIMsTZuA+6iOU8A+cb27ep+RIqconyaTPJphXlRfBA8Ha6trp6zA/oIAPKpkCPYFf
	YRgYOK6xAatsJVtZ2ONXtDP6TYGhQnfdptOWXTBQxEf+9knT6SYHHaCOU34StNzkHbzgip/WmkYe9
	90kyZlmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBkLC-00000006DxG-2eJ6;
	Mon, 05 May 2025 01:09:54 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBkJH-00000006DbV-1WB4;
	Mon, 05 May 2025 01:07:56 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uBkDE-000000004ZL-12PW;
	Mon, 05 May 2025 01:07:35 +0000
Date: Mon, 5 May 2025 02:07:32 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Elad Yifee <eladwf@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 1/2] net: ethernet: mtk_eth_soc: reset all TX queues
 on DMA free
Message-ID: <c9ff9adceac4f152239a0f65c397f13547639175.1746406763.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_180755_397329_D30B800D 
X-CRM114-Status: GOOD (  12.36  )
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

The purpose of resetting the TX queue is to reset the byte and packet
count as well as to clear the software flow control XOFF bit.

MediaTek developers pointed out that netdev_reset_queue would only
resets queue 0 of the network device.

Queues that are not reset may cause unexpected issues.

Packets may stop being sent after reset and "transmit timeout" log may
be displayed.

Import fix from MediaTek's SDK to resolve this issue.

Link: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/319c0d9905579a46dc448579f892f364f1f84818
Fixes: f63959c7eec31 ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: Use netdev_tx_reset_subqueue()

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 8fda4ce80d811..53c39561b6d9a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3186,11 +3186,19 @@ static int mtk_dma_init(struct mtk_eth *eth)
 static void mtk_dma_free(struct mtk_eth *eth)
 {
 	const struct mtk_soc_data *soc = eth->soc;
-	int i;
+	int i, j, txqs = 1;
+
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA))
+		txqs = MTK_QDMA_NUM_QUEUES;
+
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
+		if (!eth->netdev[i])
+			continue;
+
+		for (j = 0; j < txqs; j++)
+			netdev_tx_reset_subqueue(eth->netdev[i], j);
+	}
 
-	for (i = 0; i < MTK_MAX_DEVS; i++)
-		if (eth->netdev[i])
-			netdev_reset_queue(eth->netdev[i]);
 	if (!MTK_HAS_CAPS(soc->caps, MTK_SRAM) && eth->scratch_ring) {
 		dma_free_coherent(eth->dma_dev,
 				  MTK_QDMA_RING_SIZE * soc->tx.desc_size,
-- 
2.49.0

