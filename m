Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F205B606D81C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SWqB7QSI;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=ADpUlpgz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sowS8VlK0YFuxRXUqxju6orwyRWV15bvieZJXVvCSf8=; b=SWqB7QSIGZZV0F
	ey4YuRn2r5da198fgpUZN6quZ6vyrb31Okmt/ak2D6ZCR3u+Mr8WHaUiPJIj/+UhXTNxJ200lbnip
	nDLwOoJi8tvLimLm867iOVlPh2IqtL3V02cf8ytll7ZdRNP4p6PwpeoHLHhyDGWdss/7u72qKM7Yj
	JIi5JuFIH+J41VieyfvHP+yDk6szfpx45HFQpbf0kQ7/tLu90g/g6XnQisFe1hPPiHdke2+G7x8pF
	ym9LokDwGE1kUAK+SPXeJiwydNc80iab4dSduf9k3Cvdk+hB+3aRG9Wr4leIkRkfKP9DjEBf93jeo
	KDF+/Yy+tYYSPNS3HwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIU9-0000000CDDG-3nQF;
	Fri, 06 Nov 2026 11:51:57 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIU6-0000000CDBe-3MFW;
	Fri, 06 Nov 2026 11:51:56 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 29B26806EC;
	Fri, 06 Nov 2026 12:51:52 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4gt2lxuuIWH; Fri,  6 Nov 2026 12:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1793965911; bh=2RDJyczQMowvvA1k3+Z+TXrpMLlqD8QWh6I1S4yjCY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ADpUlpgzIKc2V9n81xWTWSQ87qA/slREk3XS40Uj5B133nv8i0ZiW1mNDe9lN8Yaa
	 YeLJSriuTZC9gBgMGWPKQxlk0d1tXRPHt5LqyS2O2sZoR2YJDth0SRMcNgSt3n/xov
	 KsPMgS6jTaIGvK8LskxXs6MDyWPxcifspQ1UoRz26KxJGMpYmzJCEf+nj7h2+zwxw8
	 xV4+nyY8mbATSpVntKScHfx8puriMd16sKhT+sU+movyq7ahiacg12cKv2VGvnMzmf
	 XkUg3cvwPGzc7Q7UsFfdt0IjFd9IBXhcvYCBLBfzlhMFKlOXpT3umOxIN+0OfpXddd
	 BtEjsBQaqfndw==
From: Florian Maurer <fmaurer@disroot.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: mt76: npu: return rx slots to the NPU only after refilling them
Date: Fri,  6 Nov 2026 11:51:12 +0000
Message-ID: <d6314f34e0965464207656d38a145490b6437aa5.1793927986.git.fmaurer@disroot.org>
In-Reply-To: <cover.1793927986.git.fmaurer@disroot.org>
References: <cover.1793927986.git.fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_035155_272430_5F173032 
X-CRM114-Status: GOOD (  17.09  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt76_npu_dequeue() writes the new tail to the dma_idx register of the
NPU rx ring as soon as it has consumed a frame, while the slots are
only refilled with new buffers by mt76_npu_rx_poll() after the whole
NAPI budget. Until then, the descriptors of the released slots still
point to the buffers that were passed up the stack, and on the first
round of the ring the slot that was never filled points to address 0.
If the NPU completes one of these slots, the host processes an entry
without buffer, which crashes in dma_sync_single_for_cpu() under heavy
rx load:

  Unable to handle kernel paging request at virtual address ffffffff80000700
  pc : dcache_inval_poc+0x28/0x58
  lr : arch_sync_dma_for_cpu+0x28/0x38
  Call trace:
   dcache_inval_poc+0x28/0x58 (P)
   __dma_sync_single_for_cpu+0xe4/0xf8
   mt76_npu_rx_poll+0x184/0x390 [mt76]
   __napi_poll+0x34/0x180

Write dma_idx after refilling the ring instead, up to the slot kept
free in front of the tail, which is the same value as before once the
ring is full.

Also check that all slots of a frame are queued and complete before
building the skb. So far a frame whose later slots were not yet
done was freed together with the buffers of its first slots, which
were then used again on the next poll.

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Cc: stable@vger.kernel.org
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
 drivers/net/wireless/mediatek/mt76/npu.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index c4c7c0af6321..6e503a4a890c 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -40,6 +40,11 @@ int mt76_npu_fill_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 		nframes++;
 	}
 
+	/* Hand the slots back to the NPU only once they have a new buffer,
+	 * up to the one kept free in front of the tail.
+	 */
+	Q_WRITE(q, dma_idx, (q->head + 1) % q->ndesc);
+
 	return nframes;
 }
 
@@ -69,17 +74,22 @@ static struct sk_buff *mt76_npu_dequeue(struct mt76_dev *dev,
 
 	nframes = FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK, desc[index].info);
 	nframes = max_t(int, nframes, 1);
+	if (nframes > q->queued)
+		return NULL;
+
+	/* Only take the frame once all of its slots are complete */
+	for (i = 0; i < nframes; i++) {
+		int idx = (index + i) % q->ndesc;
+
+		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, desc[idx].ctrl))
+			return NULL;
+	}
 
 	for (i = 0; i < nframes; i++) {
 		struct mt76_queue_entry *e = &q->entry[index];
 		int len = FIELD_GET(NPU_RX_DMA_DESC_CUR_LEN_MASK,
 				    desc[index].ctrl);
 
-		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, desc[index].ctrl)) {
-			dev_kfree_skb(skb);
-			return NULL;
-		}
-
 		dma_sync_single_for_cpu(dev->dma_dev, e->dma_addr[0],
 					e->dma_len[0],
 					page_pool_get_dma_dir(q->page_pool));
@@ -108,7 +118,6 @@ static struct sk_buff *mt76_npu_dequeue(struct mt76_dev *dev,
 	}
 	q->tail = index;
 	q->queued -= i;
-	Q_WRITE(q, dma_idx, q->tail);
 
 	return skb;
 }
-- 
2.47.3


