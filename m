Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC38BCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 06:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/dL5E5/PAVvSoAmR+aoTsLP141NGqcao3RnOAEaH2u8=; b=lThbDqDkRR7bV37WUY7O2R7Tta
	HqwOkUz7/ap2JpVa33k7+GN2357BMpPrnyK2zZeQ443xBRCgIo7g+5SvLRjSQXcd86JcrnNyJPyAW
	1Hgn1Dmcqd5595yAp2d9/5SRwrAFg0oL3vuAZ5DdtgzWiHdM1Kqub1ttB/9BZL63RsEmMCT5mp0Mm
	GZ5HmkIU9vGbFDA9rssuUMcBZigHxhygRm4x3lhy6AuRf3tY8fmHxFFgdBvknaHOnr6F0tfaPFnor
	X+RwD9NOTH+6XXlV6fA6TJ9JZHl7AtzSMPjpgmGfLqcS3I2lUQQahjI1c15ohsJiEboYVSpK1XZYT
	lcvjOPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdcb-00000008hpy-3ayC;
	Thu, 25 Jun 2026 06:31:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdcW-00000008hnX-3VzZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 06:31:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49249072f03so10215855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 23:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782369086; x=1782973886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dL5E5/PAVvSoAmR+aoTsLP141NGqcao3RnOAEaH2u8=;
        b=bYavz7c/nhrnhuNxAHoU+b9qdUYfrafWoIQgahTqghZTMxRpCcREt+sTfujjpqKSwf
         HJqY/m+ktkqwT0Nc/EZl3/WvxEhN1qXKq+f9n5dgb+Gv6vRn/Uh7IrhDkg9kn5ECS2gK
         4JW/Tem8A14pgBVolhKwf5a51g1ISdOdc6AJOZuKxQUn7LdHxbNzZA6v9+8g+x6CJm8t
         BRJmyBEetUUVKPR7NExJB+lfozfAg96osBny7ZB7zTBdhmVY1An+x6OnhsShCAfpq++e
         JUygLleKw+aAUP38nieYk2tNknSohJ3tN/juy1e0ZIUHATLtRTdn0OEPsIwgfmkCgHUX
         0v4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782369086; x=1782973886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dL5E5/PAVvSoAmR+aoTsLP141NGqcao3RnOAEaH2u8=;
        b=mjvqweBcc6hRN/4KIIdLOR6+beXrtaAaUBtyhAmQXQTcr3DhO6pGCrKZIjTNM9O/ao
         AKfpmbnE1pLmiqgGkzwpw1O+Xox2H5yn/7lQRaPu31L1+deISQOB+pD3KQOWpqKvZYmN
         rXOjnqgAuX8GfWPPOZpkWax30OnKDaJJhqr1kDBCeMHG0xAy2ywGG9Ug7bThsI4UxPiF
         CEF9PJdUdBWg7QRNEEHizZjbRZNIILN0EhXYU8NievuR0GWB68HTypkHasYtZdgd6SS9
         +Oy3w/YfOBigpONiFmAMvBr1XZoba7uQeN+M3vL0qIYK9VPO9VLfpFk42sBhqngX9NsH
         Czww==
X-Forwarded-Encrypted: i=1; AFNElJ8WHHfJLX8ZIeuX4emn9msKQzYHaH7G5ZEUnPtzKY1Vd0W6arTX+2l/ifDFWvWIDgi9D4+0CwM8SjxdV4hngZPv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+JF5B8L0rZ3Ld49gQvO/M1ECgxMlRMrVZi8j7TxPu5ZOGXcyC
	Dxnssu/l/q/YKG62QuyTj1KvLSOitaVO0QjMqnvMH7GQB0IpNSOBXvvh
X-Gm-Gg: AfdE7clQGKKu2uCdRWiAGzUl9/FbFDSoSj++6C9cYDdIu/x/6Mjo5pHogwoSrFIUm0t
	nn9GgpuSgF85EDp9PtN2Q1hoeX+JB3xyBU9KywgodhG2tgL3B9c5KaNdd4QZB3FE2N1whF6OFlD
	JjuEQFfMWtNWuQUnyM8QYor+Xesob2exmql8++ikUe++COfWwjtwj+x5caF8gfTE3JxQHrr7OV4
	ywlWQhWQpSB60mhO2q4vxmtNB/q3a8BdE2Y2t8lk+lhRaqQAFOynoAFscxOLXJVbZUPEjFLn5up
	wM3Mvv/P7hjxTJ29SWSJrTizrkJmVqWsbMXLiirPLTEtLUNZ19Z8y4Q1Tkf/eaLGGrJWJwXL+Pj
	DDPBXtuupJNCGNAF2O3+CGDZX+YSEwkfaMnnFIcCf70kjJZZNXYSqD05tihMQ6Q4yqFsMSNjX15
	IG0dWii4uadeU3BQVQOgxOZloFNSagHomH1qsviR7RtofpIk6eAi66cCmDI66msc0d5Q2dmrBw
X-Received: by 2002:a05:600c:4e4b:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-4926689ab05mr13119825e9.33.1782369085712;
        Wed, 24 Jun 2026 23:31:25 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm13625247f8f.14.2026.06.24.23.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 23:31:25 -0700 (PDT)
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
Subject: [PATCH net v3] net: ti: icssg-prueth: fix XDP_TX from the AF_XDP zero-copy RX path
Date: Thu, 25 Jun 2026 07:31:21 +0100
Message-ID: <20260625063121.24746-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_233128_920087_13C0DC66 
X-CRM114-Status: GOOD (  16.92  )
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
Reviewed-by: Meghana Malladi <m-malladi@ti.com>
---
v3:
 - address Meghana Malladi review nits: split the prueth_xmit_free()
   guard to stay under 80 columns, parenthesize the swdata->type
   ternary (and the matching tx_buff_type one for consistency).
 - no functional change; carry Reviewed-by.
v2: https://lore.kernel.org/netdev/20260623112225.303930-1-devnexen@gmail.com
v1: https://lore.kernel.org/netdev/20260620213756.87499-1-devnexen@gmail.com
 drivers/net/ethernet/ti/icssg/icssg_common.c | 21 +++++++++++++++++---
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  1 +
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 82ddef9c17d5..64ae3704481e 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -185,7 +185,8 @@ void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
 	first_desc = desc;
 	next_desc = first_desc;
 	swdata = cppi5_hdesc_get_swdata(first_desc);
-	if (swdata->type == PRUETH_SWDATA_XSK)
+	if (swdata->type == PRUETH_SWDATA_XSK ||
+	    swdata->type == PRUETH_SWDATA_XDPF_TX)
 		goto free_pool;
 
 	cppi5_hdesc_get_obuf(first_desc, &buf_dma, &buf_dma_len);
@@ -259,6 +260,7 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 			napi_consume_skb(skb, budget);
 			break;
 		case PRUETH_SWDATA_XDPF:
+		case PRUETH_SWDATA_XDPF_TX:
 			xdpf = swdata->data.xdpf;
 			dev_sw_netstats_tx_add(ndev, 1, xdpf->len);
 			total_bytes += xdpf->len;
@@ -769,7 +771,8 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
 	cppi5_hdesc_attach_buf(first_desc, buf_dma, xdpf->len, buf_dma, xdpf->len);
 	swdata = cppi5_hdesc_get_swdata(first_desc);
-	swdata->type = PRUETH_SWDATA_XDPF;
+	swdata->type = (buff_type == PRUETH_TX_BUFF_TYPE_XDP_TX ?
+		PRUETH_SWDATA_XDPF_TX : PRUETH_SWDATA_XDPF);
 	swdata->data.xdpf = xdpf;
 
 	/* Report BQL before sending the packet */
@@ -804,6 +807,7 @@ EXPORT_SYMBOL_GPL(emac_xmit_xdp_frame);
  */
 static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *len)
 {
+	enum prueth_tx_buff_type tx_buff_type;
 	struct net_device *ndev = emac->ndev;
 	struct netdev_queue *netif_txq;
 	int cpu = smp_processor_id();
@@ -826,11 +830,21 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *len
 			goto drop;
 		}
 
+		/* In AF_XDP zero-copy mode xdp_convert_buff_to_frame()
+		 * clones the xsk buffer into a fresh MEM_TYPE_PAGE_ORDER0
+		 * page that is not DMA mapped. Such a frame must be mapped
+		 * via the NDO path; only a page pool-backed frame already
+		 * carries a usable page_pool DMA address.
+		 */
+		tx_buff_type = (xdpf->mem_type == MEM_TYPE_PAGE_POOL ?
+				PRUETH_TX_BUFF_TYPE_XDP_TX :
+				PRUETH_TX_BUFF_TYPE_XDP_NDO);
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
@@ -1395,6 +1409,7 @@ void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
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


