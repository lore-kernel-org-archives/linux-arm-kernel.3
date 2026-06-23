Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB40CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Ll5fGvrULmASpVjjrUyqyYpgppQmeYjrRkuEZdoatc=; b=2j1L12a+k//GKTya8cQ1FyjLpK
	FevbcGVlh88FQ8ISBn1u4dcgYwTxTmGVH5dW/ZLutZbQQutlWNmROLznoh3r4pjQfv+ReGJ5NoUqD
	bdkqZ8dKerZpKrqzrlABZC6I8jLM0ksZhaTXkbSU4b+JHK3xFp1uPODSZqr2Fyu8b7Aug8wLYuzxQ
	13f/0dGkbkZ3osqtYaOa1rKzEw8OqqAaKV/L1FAIVkqfeqwf/uAAAhPsFNCfyuneQ/4vznEWpnd+o
	ZebFOvA4EKXVwPeRpzJx1JNad/Z9X793p8+rWWFO6Hyas3LeE/0iTAQqXa9iFHx4bFxh4RWu5xfFG
	GIu6nzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzD8-00000006Aql-3y0O;
	Tue, 23 Jun 2026 11:22:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzD5-00000006AqI-3pm5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:22:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4908b92904fso78446725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782213750; x=1782818550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ll5fGvrULmASpVjjrUyqyYpgppQmeYjrRkuEZdoatc=;
        b=QCYCNSfdlKf7Yoxej5D5L/+TJRXQtt6NQxbDL8I7cxLmTFwM167d3KsCWGHPvbatwA
         SNatwyTzCzfBEMjUUg/Gy5CnWEyKm/DoDIK4H4vA0QCZCbiLHbHhp0XV9X5JprAC1/Iu
         ewAsAJDgV5t26MZ1LYD929zevpq2F9ULyUoZxQzJEMgG8Xm0nWOZxQEmtql7BM3puiDL
         IUbAnlzDPYW1r0I347ZxgZHL7REpC20ZP4+z+zKCqv+Mtrg1Hfmk82CtTaFr7HqYcvMZ
         oO5afdtDVVzzq9qXYJBMbXinnGtyA6cYTN2Ag3xk+TPo7nza1Jy35TQ892bAspK/Nphi
         OtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213750; x=1782818550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ll5fGvrULmASpVjjrUyqyYpgppQmeYjrRkuEZdoatc=;
        b=CVG2DNoD8pnyc9SKiBgCatMj4O2lNn2mXpNaGm35QBxeW1z542BkGr/EcaohsoPy+G
         zolUmrMYMZhGXKSzeNO8667BF9B/nZVhxNcmjSyqRu9aAzeZzY1lqlD6w7Gx0WLLf4iS
         SX20g8GzcGKvkIO0pfGj+9x/vc4mf/jqXL460WOlaS9gsSOhJ4r9ZFO+Xr+iohOq8o21
         1vnC5Xg56oUbu2qVud1ExlPkYKJeD6nbxOhNRHVJytiyzT6udZuYnlQDyjuwL2UQOoEe
         +bFyIOujrAxRfZopmtik5vgfUr/gJllIkLYR0XcTm5CU9sc+tINZVJEuTr1xuSgzE2+a
         c12Q==
X-Forwarded-Encrypted: i=1; AFNElJ+WEibEYSDvOZIcNSln8a2UhAdg7HMgwCwLpDNqrJq943w+OWmyi32IBLxpALs/bY6CR30NtHOw2ZywpaYqncph@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3eeY1AqkJm52L/+Jl00jQSqu1xMhHboQx1BtHkU+OuIS1icVf
	089pC8USZWfALMs8FksAU2U9+LOH/8F6N8cU/bP0vT+tXHa+3O/EWMRn
X-Gm-Gg: AfdE7ck6pIytXrimPiRrIKoPJbFXIMTZkiHriI0ItyYsh/9cCxBOPNaWb2MmHElIV2k
	fVKE4EaL3uG0HayT6U5iTEjE7n4NxOBs4VCY+Cfm1RyX0QtwQe18rfiBT4TvOIfhXltJF4ZAMH3
	KCKl/QycL7dDiHSpEA0GHSjz0o6fyX831IEIazAYGtmVOp5dNHy7CqeN8gNSpBH6FiuR2zji+gd
	iEVlHWqLQwyk/dTobJ17ZqJtJM/99dOH885HIhoH+tdgx5GRmGLqDx6iMZIEgHt3OwSKf8BVPfs
	upOJcNzgO4/1dYgQvZ6KN5V1EIHn7+3qOhmP/L8b8lRrJYYF/E1CWpoDpvKBn8tv2PsXdwgt9QK
	QpXS5iLg/hu4bdZNVwvx1Elyn+nPnmTxPqYCtzMlWz7o5dqX42De84cL/jOTfjaGDONbUnXHU94
	euz4nqm1Uyg/gjeLnd+Ac19h4K8SA6dwVyugc7VjBL9B2xUFk6j+ggUySV9zoS+0IlTozQPKmhe
	1K1mxOVWNk=
X-Received: by 2002:a05:600c:4455:b0:492:40f2:4d78 with SMTP id 5b1f17b1804b1-4925b34a2e6mr33035365e9.2.1782213749442;
        Tue, 23 Jun 2026 04:22:29 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923cbe7sm272220715e9.8.2026.06.23.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:22:29 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	m-malladi@ti.com,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH net v2] net: ti: icssg-prueth: fix XDP_TX from the AF_XDP zero-copy RX path
Date: Tue, 23 Jun 2026 12:22:25 +0100
Message-ID: <20260623112225.303930-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_042232_002683_D04EE005 
X-CRM114-Status: GOOD (  17.83  )
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

On XDP_TX from the zero-copy RX path, emac_run_xdp() converts the xsk
buffer via xdp_convert_zc_to_xdp_frame(), which clones the data into a
fresh MEM_TYPE_PAGE_ORDER0 page that is not DMA mapped. Transmitting it
as PRUETH_TX_BUFF_TYPE_XDP_TX derives the DMA address with
page_pool_get_dma_addr(), reading an uninitialized page->dma_addr, so
the device DMAs from a bogus address (corrupt TX, or an IOMMU fault).

Pick the TX buffer type from the frame's memory type: keep
PRUETH_TX_BUFF_TYPE_XDP_TX for page_pool frames and use
PRUETH_TX_BUFF_TYPE_XDP_NDO for the cloned zero-copy frame, which is then
DMA mapped through the NDO path and unmapped on completion.

While at it, fix the page_pool XDP_TX completion path. A
PRUETH_TX_BUFF_TYPE_XDP_TX frame carries a page_pool-owned DMA mapping
(established against rx_chn->dma_dev), yet prueth_xmit_free()
unconditionally calls dma_unmap_single() on it with tx_chn->dma_dev,
tearing down a mapping the driver does not own; xdp_return_frame()
already recycles the page back to the pool. Tag such frames with a
dedicated PRUETH_SWDATA_XDPF_TX type so the completion path skips the
unmap, the same way PRUETH_SWDATA_XSK buffers are handled.

Fixes: 7a64bb388df3 ("net: ti: icssg-prueth: Add AF_XDP zero copy for RX")
Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
v2:
 - fold in the page_pool XDP_TX completion-path unmap fix raised by
   Meghana Malladi: tag page_pool TX frames with PRUETH_SWDATA_XDPF_TX
   so prueth_xmit_free() skips dma_unmap_single() on a pool-owned
   mapping; xdp_return_frame() already recycles the page.
 - add Fixes: 62aa3246f462 for that path.
 - no change to the original zero-copy fix.
v1: https://lore.kernel.org/netdev/20260620213756.87499-1-devnexen@gmail.com
 drivers/net/ethernet/ti/icssg/icssg_common.c | 20 +++++++++++++++++---
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  1 +
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 82ddef9c17d5..96c8bf5ef671 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -185,7 +185,7 @@ void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
 	first_desc = desc;
 	next_desc = first_desc;
 	swdata = cppi5_hdesc_get_swdata(first_desc);
-	if (swdata->type == PRUETH_SWDATA_XSK)
+	if (swdata->type == PRUETH_SWDATA_XSK || swdata->type == PRUETH_SWDATA_XDPF_TX)
 		goto free_pool;
 
 	cppi5_hdesc_get_obuf(first_desc, &buf_dma, &buf_dma_len);
@@ -259,6 +259,7 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 			napi_consume_skb(skb, budget);
 			break;
 		case PRUETH_SWDATA_XDPF:
+		case PRUETH_SWDATA_XDPF_TX:
 			xdpf = swdata->data.xdpf;
 			dev_sw_netstats_tx_add(ndev, 1, xdpf->len);
 			total_bytes += xdpf->len;
@@ -769,7 +770,8 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
 	cppi5_hdesc_attach_buf(first_desc, buf_dma, xdpf->len, buf_dma, xdpf->len);
 	swdata = cppi5_hdesc_get_swdata(first_desc);
-	swdata->type = PRUETH_SWDATA_XDPF;
+	swdata->type = buff_type == PRUETH_TX_BUFF_TYPE_XDP_TX ?
+		PRUETH_SWDATA_XDPF_TX : PRUETH_SWDATA_XDPF;
 	swdata->data.xdpf = xdpf;
 
 	/* Report BQL before sending the packet */
@@ -804,6 +806,7 @@ EXPORT_SYMBOL_GPL(emac_xmit_xdp_frame);
  */
 static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *len)
 {
+	enum prueth_tx_buff_type tx_buff_type;
 	struct net_device *ndev = emac->ndev;
 	struct netdev_queue *netif_txq;
 	int cpu = smp_processor_id();
@@ -826,11 +829,21 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *len
 			goto drop;
 		}
 
+		/* In AF_XDP zero-copy mode xdp_convert_buff_to_frame()
+		 * clones the xsk buffer into a fresh MEM_TYPE_PAGE_ORDER0
+		 * page that is not DMA mapped. Such a frame must be mapped
+		 * via the NDO path; only a page pool-backed frame already
+		 * carries a usable page_pool DMA address.
+		 */
+		tx_buff_type = xdpf->mem_type == MEM_TYPE_PAGE_POOL ?
+				PRUETH_TX_BUFF_TYPE_XDP_TX :
+				PRUETH_TX_BUFF_TYPE_XDP_NDO;
+
 		q_idx = cpu % emac->tx_ch_num;
 		netif_txq = netdev_get_tx_queue(ndev, q_idx);
 		__netif_tx_lock(netif_txq, cpu);
 		result = emac_xmit_xdp_frame(emac, xdpf, q_idx,
-					     PRUETH_TX_BUFF_TYPE_XDP_TX);
+					     tx_buff_type);
 		__netif_tx_unlock(netif_txq);
 		if (result == ICSSG_XDP_CONSUMED) {
 			ndev->stats.tx_dropped++;
@@ -1395,6 +1408,7 @@ void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 		dev_kfree_skb_any(skb);
 		break;
 	case PRUETH_SWDATA_XDPF:
+	case PRUETH_SWDATA_XDPF_TX:
 		xdpf = swdata->data.xdpf;
 		xdp_return_frame(xdpf);
 		break;
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index df93d15c5b78..00bb760d68a9 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -153,6 +153,7 @@ enum prueth_swdata_type {
 	PRUETH_SWDATA_CMD,
 	PRUETH_SWDATA_XDPF,
 	PRUETH_SWDATA_XSK,
+	PRUETH_SWDATA_XDPF_TX,
 };
 
 enum prueth_tx_buff_type {
-- 
2.53.0


