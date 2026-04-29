Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C530FFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OhNDJuf5WSrSmnR769FiGI+LIlUvUJxCwDe5cvMw8UY=; b=aZtgRlCS4NwRmujUQ4SApnIe8S
	6ZhNp5fnsovM6FHhVyHYerRWwI0ojjBSrNAanrs3MHpSYAqxzr/34xB/Cu886LFLUgiDWP4ljFTvo
	4kfrluscxzjsCAoIOdy8In8lVxYkZaAteOGxi6z3oi06lOfoAvURI8K3tYAQfGGURpg//Gah87oUe
	8j7U3GHAQ6rf/S6n74+SqZFp+8Q4nT78bHomzVEG17SlHjJH7npUhwbc/9sPqtprfR0gRAzo2NGwh
	+iGatm83pizPOpGT1GW/W4R/f62NxyXYQ5pNxISlqu0rRqo1JmB4+VtoB0BXHWnV5r2h+DFs6rmoA
	v3PpqfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3cy-00000003Y8J-0dJ9;
	Wed, 29 Apr 2026 12:02:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3cx-00000003Y7u-0uDR;
	Wed, 29 Apr 2026 12:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB20860128;
	Wed, 29 Apr 2026 12:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEA7C19425;
	Wed, 29 Apr 2026 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777464169;
	bh=ehMxJE2bllJpJXWhiWSKWBM2mpdz3RpLy82UZ8OKVCk=;
	h=From:Date:Subject:To:Cc:From;
	b=MoPsHaFNQHlTQgukGqCZUHgOecjRH80xznRv4Oo6llI6MC0Kkd2WL1FiYouzRuEl6
	 t575P7VzrM5dCRU6jAILzsc+kf89aztJPJlGl6lijpEyCrbHwp1ekeMfMjbEFdmQxv
	 i5+4pxc+vHo5WPrtCxzCkn5MRuM9CEBbOnQi60B3IrRgwbEY6p0F6iqxQQTlIuMWJI
	 DJph38vrExVmvUyUslg4UN5XxOT16Uss0JfiOlsDDVXMRDNul8P/0ZYsiA+BSu23ef
	 ss6wlAWz8SS75qpcjCcyowNxXaHR2/u6VdxT3xzoLcsaGMzgKigyl5sx0ivqu9o+8C
	 murZ++x0DDtVA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 29 Apr 2026 14:02:31 +0200
Subject: [PATCH net v2] net: airoha: Move entries to queue head in case of
 DMA mapping failure in airoha_dev_xmit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-airoha-xmit-unmap-error-path-v2-1-32e43b7c6d25@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7RhaC6Ir72FY1DrQidKSKRIM4
 e42nMDlez95f4VEwpTgWqwgNHPiGDLoQwHO29AT8jMz6FLXpdENWpboLS4DT/gJgx2RRKLgaCe
 PjdJVdTHUPfQJcmIU6njZ83cINEGbpec0Rfnul7Pap//qs0KFlpwxrj7XlVO3F0mg9zFKD+22b
 T/DtsuIzgAAAA==
X-Change-ID: 20260428-airoha-xmit-unmap-error-path-8125594efb23
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jacob Keller <jacob.e.keller@intel.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
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

In order to respect the original descriptor order and avoid any
potential IOMMU fault or memory corruption, move pending queue entries
to the head of hw queue tx_list if the DMA mapping of current inflight
packet fails in airoha_dev_xmit routine.

Fixes: 3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order DMA tx descriptors")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Remove leftover airoha_queue_entry initialization inside the loop from
  the previous version.
- Link to v1: https://lore.kernel.org/r/20260428-airoha-xmit-unmap-error-path-v1-1-aec44c6765c1@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5effb4a4ae84..fb4f51d67dd7 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2123,14 +2123,12 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 error_unmap:
-	while (!list_empty(&tx_list)) {
-		e = list_first_entry(&tx_list, struct airoha_queue_entry,
-				     list);
+	list_for_each_entry(e, &tx_list, list) {
 		dma_unmap_single(dev->dev.parent, e->dma_addr, e->dma_len,
 				 DMA_TO_DEVICE);
 		e->dma_addr = 0;
-		list_move_tail(&e->list, &q->tx_list);
 	}
+	list_splice(&tx_list, &q->tx_list);
 
 	spin_unlock_bh(&q->lock);
 error:

---
base-commit: 0c7a5ba011d336df4fcd1f667fcc16ea5549be12
change-id: 20260428-airoha-xmit-unmap-error-path-8125594efb23

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


