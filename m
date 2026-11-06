Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE03606D81A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PtDAwC0u;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=CwUbqx4K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qNCPz1qS0WlotHwtOcXkBBv1t3RqQf7gB9qlyBr1wno=; b=PtDAwC0ujl7YyE
	kXzr3EIJ5zEvdeUvAKOOvhcY0oZ0oQexKdKN7k7tj0STegGgleQjDUare1tSmySAc4kHCyhdxE41y
	pU0ivbnoX9FQ/VgoZbgJ606MYeEuCMBIJypa3PUma/AGnfOdodWl83uQFZQl5Vvfu8oQ5JGgVa/ia
	/mCOrAcRWOVqBUF2JN0hRmxUU62FK3ADwLXvlR+r5ZsRy+4Ewu2oAAj2kcZZjpvLmUCpJ/JID1x/Q
	KevDL1aVtem8fCE/uO/vRIAQTqN5LPid67C1NC9g8ZTOQpvDXoxXrP/6G7OAiUZYHLWgshwMWIzCJ
	v4zfnzc866SLZgjhftzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIUC-0000000CDFq-25Ra;
	Fri, 06 Nov 2026 11:52:00 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIU6-0000000CDBm-3Lpr;
	Fri, 06 Nov 2026 11:51:58 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9FEE080715;
	Fri, 06 Nov 2026 12:51:52 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6S4EyYb3b8WD; Fri,  6 Nov 2026 12:51:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1793965912; bh=bHsCy/8Mgc9r9WQB/zRflWkg+WKF0J8K86mGDeLdTFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CwUbqx4KL3V7ac6SIzCcniXy8SVsO5VFRL8UisBs3WJEpO+8M9xPh2KgmwI5JcGua
	 AgMR4n1nsvsK3TTUOv8glUDHgxFT7dVgMcR0cNqoXIvxTnZGiSZLnb+SbtoBsJWePb
	 ELHzQakKZvU5HwhFWzF5EcB8JKKX1ltIWNaUipY8VwyIHt7M7RXhya1hi2v9MuII/n
	 dXObC1thwjBAgz6j4at3umszIEuJ5yHq+tFvAdcSJhc76ddj5z6n62z7oDzZ1VExlA
	 eP+soAoouAFcYRmMkS8Z8ALkVeoqwZxaWRYYv2Wj8YjltKXdnbScEzIAYNegngb4Ed
	 D2i8oKlY5LgvQ==
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
Subject: [PATCH wireless 2/2] wifi: mt76: npu: read the rx slot count after the first slot is complete
Date: Fri,  6 Nov 2026 11:51:13 +0000
Message-ID: <653d93b3c35975cd13dd6b33d76ea6517b55be91.1793927986.git.fmaurer@disroot.org>
In-Reply-To: <cover.1793927986.git.fmaurer@disroot.org>
References: <cover.1793927986.git.fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_035155_275412_A25D3B04 
X-CRM114-Status: GOOD (  15.10  )
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

mt76_npu_dequeue() reads the slot count of a frame from the info word
of its first descriptor before checking the done bit of that slot. If
the NPU completes the slot in between, the count is still the 0 left
by the refill, so a frame spanning two slots is taken as a single slot
frame and its second slot is parsed as the start of the next frame.
With mt7996 this shows up as bogus tx-free events, which hit the
WARN_ON_ONCE() checks in mt7996_mac_tx_free(). From the code, such an
event can also release tokens that are still in use.

Check the done bit of the first slot before reading the slot count,
and order the descriptor reads with dma_rmb().

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Cc: stable@vger.kernel.org
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
 drivers/net/wireless/mediatek/mt76/npu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index 6e503a4a890c..f00ae683a7eb 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -72,18 +72,25 @@ static struct sk_buff *mt76_npu_dequeue(struct mt76_dev *dev,
 	int i, nframes, index = q->tail;
 	struct sk_buff *skb = NULL;
 
+	if (!q->queued ||
+	    !FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, desc[index].ctrl))
+		return NULL;
+
+	/* The slot count is only valid once the first slot is complete */
+	dma_rmb();
 	nframes = FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK, desc[index].info);
 	nframes = max_t(int, nframes, 1);
 	if (nframes > q->queued)
 		return NULL;
 
 	/* Only take the frame once all of its slots are complete */
-	for (i = 0; i < nframes; i++) {
+	for (i = 1; i < nframes; i++) {
 		int idx = (index + i) % q->ndesc;
 
 		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, desc[idx].ctrl))
 			return NULL;
 	}
+	dma_rmb();
 
 	for (i = 0; i < nframes; i++) {
 		struct mt76_queue_entry *e = &q->entry[index];
-- 
2.47.3


