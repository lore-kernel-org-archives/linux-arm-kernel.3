Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268D0C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 07:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AB188XGB4sbY3JcvO+RtPjAq1fA2l4207oGcIEuttd0=; b=JavQQ5FLeJ2mcrYr6A2FgY8LbE
	pEjJ//8OmANFgSUEGYuBjvf7UfJlQYkmM4vmaAIyHg3l8RTKeP1UNgN0/gKVKg+mK/+VHFsWrKPkM
	E1UT2niAFj3T58qAdh1Jo/7cFrgc9kU8TXXY65uxxaTvwtvuNM17V3oOqux4XetWb8AVfx8GpXvMZ
	qStg3nIYUVZFi5jl3GqkPuiWW+dbnlxdW6areZ9srfiuLnKvvpbxRTYXLN+qcgCshO1+rXaJZUijx
	P+xuUP9+i3D9v0PT7yxDHCXzHJvrRIycaozpfrZ9jbjagHE1RLPUKkKPze83r+Q3dejPxtZFoNwP/
	GlID6g1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVl7-00000003NMb-3jy9;
	Wed, 05 Aug 2026 07:09:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVl4-00000003NLY-2HSd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 07:09:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so6988015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913784; x=1786518584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AB188XGB4sbY3JcvO+RtPjAq1fA2l4207oGcIEuttd0=;
        b=Zmd250JP9XjGtUOnPFTnNZdltGx++3X0ytGmoupNQ3H/GHglw86oyBKL2s6fVFjyBI
         Sa7BIxKv6hZfoY6VHM80rfFp29jku7gJiIoy8WFqpp1aKLfnCGdwYYXU5NfD301y0GBb
         kR6GKqmelJItOl+jdpZd6jryZ+ou5QAZsW+fpYX1X/eqWsakPcHkxflpeKsUssNj8dGD
         +v25rZw8Cz9NKRzu6TcVUGJBkfzNCu46TTCYSTY3g6CQSHs+9PARWHwI8GmZgkpB100i
         L5jE2mtpQnBsB+jh5YhRJbaPXQ4qhCRiI5f9QaX+O0RU9Vnm4oRF7q8swJUB6W54Jr+p
         p3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913784; x=1786518584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AB188XGB4sbY3JcvO+RtPjAq1fA2l4207oGcIEuttd0=;
        b=iSX4cOXqIoNageHDb8ek1dbb7OQeizFLTwXdquJ6BDK0cDA78Z+hFa80yxnc6tkDdT
         RsRiby9U22cqe5xZz5/wP9oYhUst+tO+QuAF1EHz+6ny5qosYa+5RX3tSeg34gYjxbpK
         AD8E4xsnFn+VhAPCvaCHvQ/rWdDKycoweGdbJ0qiiYVo41SwDQpPbZKW4VwavhDDl3o+
         slZFPOYkBl+XKpW8wQdphJtiYfPje30agFl38oQGDjpqf3F0SqtURCdbgNay3B9xUyzR
         9PjYalzrCGfisEq6Rw0bTeUxPbDh9THET2tj4ZVL+vGgq5vyM5kMRSHC1dzvIIXo1Nsr
         l7Og==
X-Forwarded-Encrypted: i=1; AHgh+RpUYqMcKA+Rg4JGs8KC06MjRBf84g2bM0qckcmf9Ctm8whiheJUNcBSm6I7NolXedxVBQSWoMleP5LoftomCQ6W@lists.infradead.org
X-Gm-Message-State: AOJu0YxzkM6p3KivYFEkUDN0ZorNKlaiSfsz6mwRTlAW5g01WbM6AU6b
	taVEwPa6XQ7wuVH9jq3jdWxKlO8rkUZsl7bEM/xJZAi4knlUHjezabjomUn+zypM
X-Gm-Gg: AR+sD13iDR0cOLyRQZtjjRmR8mlm7EZ1G6h1gcqEsHQsY9GMGtdiZ+NgAQVnBpfueuM
	PtXyxnev+hqFLx8z7ss0qXIPPRgrHgmQa2E60C/AumqaOxTlMJp2FZ9Qk//QrJoH+12CQKPZ4kR
	phQfwRAPNF+4p85aaYlknos+3lkyqxGXK1ak6swxLJAGaE/ibmFi5IRcB05vOIObOGiwIhBNCUi
	6W7uLSx5X4MXHvOzaFUs+3qQAAl1ocY9tZDuwlHc1dyANmp6KggliP2QOsobtAkg4k91tTFJ3uA
	Y4bjlr7GsLXkaYXY5XkmvlK2wIPeNJAF8Byy3YPzrFZZH7Qai/y/I0ckhUQcNEc7iAJj8nXj0iY
	qH7HtVcgfxqCahn7j8VRd9dgENorq+0tRMbqG0UV1FCeKylgbcZBDQhkFybBL2JAR3JLs8ddqzo
	G0waTe97sAsrlWqIpkJrriJ838B97AzwDUEfzEDeyF16bPQeBXOdUycDT3x1sfkX9sAw==
X-Received: by 2002:a05:600c:138a:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-4994e714d8fmr46447075e9.6.1785913783962;
        Wed, 05 Aug 2026 00:09:43 -0700 (PDT)
Received: from fedora ([46.205.219.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4c32e0sm35567225e9.0.2026.08.05.00.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:09:43 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH] net: airoha: npu: use coherent DMA for mailbox messages
Date: Wed,  5 Aug 2026 09:08:51 +0200
Message-ID: <20260805070851.2885888-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_000946_704945_8B39F499 
X-CRM114-Status: GOOD (  12.69  )
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

Commit 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox
buffer") switched airoha_npu_send_msg() to DMA_BIDIRECTIONAL so
non-coherent CPUs invalidate caches before reading NPU GET responses.

On EN7581 + MT7996 that change regresses probe: the mailbox completes
successfully, but WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0 and
mt76 never binds NPU offload. Healthy boards report 0.1111.

Mailbox messages are tiny and already copied by the caller. Bounce
through dma_alloc_coherent() so the CPU observes the NPU-written
response without relying on streaming DMA direction.

Verified on Quantum Fiber W1700K (EN7581 + MT7996).

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..d2f6c9c084b8 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -166,12 +166,21 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	u16 core = 0; /* FIXME */
 	u32 val, offset = core << 4;
 	dma_addr_t dma_addr;
+	void *dma_buf;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(npu->dev, dma_addr);
-	if (ret)
-		return ret;
+	/*
+	 * Mailbox payloads are small and bidirectional (CPU sets the
+	 * request, NPU writes the response). Streaming DMA_BIDIRECTIONAL
+	 * mapping regresses EN7581+MT7996: MBOX reports success but
+	 * WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0. Use a
+	 * coherent bounce buffer so the CPU always sees the NPU response.
+	 */
+	dma_buf = dma_alloc_coherent(npu->dev, size, &dma_addr, GFP_ATOMIC);
+	if (!dma_buf)
+		return -ENOMEM;
+
+	memcpy(dma_buf, p, size);
 
 	spin_lock_bh(&npu->cores[core].lock);
 
@@ -191,7 +200,9 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 
 	spin_unlock_bh(&npu->cores[core].lock);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	if (!ret)
+		memcpy(p, dma_buf, size);
+	dma_free_coherent(npu->dev, size, dma_buf, dma_addr);
 
 	return ret;
 }
-- 
2.55.0


