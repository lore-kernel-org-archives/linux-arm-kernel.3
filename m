Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D6DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 03:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRq1k9DQ7dcpFSRaoKAokYKGtHAonMVK3g5kkcieDXA=; b=qYBv6JPppmcafLxudsqCzW2Z0R
	yY7Uy+cCv/ZqwKd3/ZbeLJdnZQnMiK8fXYv67cYJaimuTnt1/3H5NwAtXaKl9tK+6W9Ndn7byHWMJ
	M5uE6lg4Wh7VOqIXOe3AamABaqAe6Zf4TpxSu+xVdX+QFgGVgsLPPeZvgCrWpXXKYQD25qAerMgxy
	kQAqcTg1L/qCgTtSgADAzfJ92xvKI19JwMcSseNn8HrVCq2yT6ZXgJOWz9cD34wvUDY77ed7ql/IL
	R7OLSeoKP1RQzGEuKMx+njgEd8bQA/HIVNW+AtLEiaUiAWOlDMsHux8eVsZxAc/R9uVLXVV9ovP7c
	XJx5M/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXu6W-0000000AVip-1h6L;
	Wed, 15 Jan 2025 03:30:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXu44-0000000AVFN-28A3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 03:27:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21634338cfdso104953005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 19:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736911652; x=1737516452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRq1k9DQ7dcpFSRaoKAokYKGtHAonMVK3g5kkcieDXA=;
        b=mqrYUyVjzUmIoBzFXuMvrtAaIk4qP2n9NIIMN2HcXyuvQWSIFIjepvr0pU/mVDRqh2
         7ERUHp5vaDNuBANNheFQk0c6kjhBNE5gNKevmSmQI8TpkRVEtVGh2M8SPAYcooJCp5VB
         MpwAFO9gCmgwy1xDSsIGGhrpqHYDc80C/ptwmwhglz2+PeQ4dY1QXz+7LPgdu0iIb+ru
         vzwxfSMd3JjyXLxMjRcTF90o3CgRzXke4yOk4Osfcyy1fOG/6y6ZdpmW8jG3ZPsgQAsr
         8/LaoV54p+G5CW/0DU6WGjC5tltiOkhh3YytgtCehfCYEgmxvwkf1Ikf7uR/FlD0Tig4
         51IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736911652; x=1737516452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRq1k9DQ7dcpFSRaoKAokYKGtHAonMVK3g5kkcieDXA=;
        b=rc43JKeyNk58GIkkumA7z9cPMAiZtJ+AKzWR8nmCXTdbqPjTZretykbxXyM8ZU36kQ
         KvkwiHbbVI1k85tVf5WDEpcioxYJfRpncdKzhrOfpj8l0kjkLSnM3gOgYYdgJ0fohTO5
         90F19pPElpuzMWG8+oVb03gvNgxYGuLqdyMyrViiaUg0gBjPmBYBquXOX5h9XOWFdaf9
         l4VJW1rSE6UbLh0rEJf7k2G374qKLOhv19Wprr5efC8Ftzl08C7I6iAslicUhdGEkqpF
         p4A77o4FgtYGx9EM0MMEwDVbWXqfoxIG3bcmRSSSj8Ca+/3D5bQSAb4QMGAOw3FcbeYW
         +Bsg==
X-Forwarded-Encrypted: i=1; AJvYcCVgcdPg44Sp+I+eMWEW35J9+KEyqkJvB5sFP2+LTGKf8xke2WxdW+8CiIsle2VqL7n+FJ/0X8HLx4o/KX9RFEBk@lists.infradead.org
X-Gm-Message-State: AOJu0YxQtbe7rSbMldxsnBJQ9qUFGvfiOYihiUUGkT1425wMxa43I1qE
	0a/GBFiDk4hYdllQUAa4M6beJF/eR/flUNk6t8SA1eutmua9/ROd
X-Gm-Gg: ASbGncuS/v7TP6QWAAyrpceJbbhhgaCc4MBqKtlxvlyFl6xjykX69MC/MG+OCLKbHqk
	RTCb3F6+ytl14PJvVBeocYXhExa/Y2LoG3v1dtZZPB+GhnyPOA1duoJjuTLncDU9V/tPuJ5uycL
	M5D2AHYOiypNmlasj1VzODK0+IJazjbiRMzBkSn7Bx0vHaX464SoW+GJlLsfycMuEPc/imgCKjJ
	YFb4Jh1gBmh9cofi0c4TfLwwBiypN1RsQ/bhDMvgrg2tie4ZMZpZ7VNx+PcBwh6nEhjZg==
X-Google-Smtp-Source: AGHT+IG7F3H2v0kSliTabXyeox9qkdn3NF3T6JxmOyvChSMJeeHU3yFa4THc3jIhecOqrdwKMRxkVA==
X-Received: by 2002:a05:6a00:35c7:b0:725:ef4d:c1bd with SMTP id d2e1a72fcca58-72d21fcec0fmr43073016b3a.19.1736911651509;
        Tue, 14 Jan 2025 19:27:31 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d405493basm8166452b3a.27.2025.01.14.19.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 19:27:31 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in non-XDP RX path
Date: Wed, 15 Jan 2025 11:27:02 +0800
Message-Id: <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736910454.git.0x1207@gmail.com>
References: <cover.1736910454.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_192732_545232_EEB24A99 
X-CRM114-Status: GOOD (  16.07  )
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

Avoid memcpy in non-XDP RX path by marking all allocated SKBs to
be recycled in the upper network stack.

This patch brings ~11.5% driver performance improvement in a TCP RX
throughput test with iPerf tool on a single isolated Cortex-A65 CPU
core, from 2.18 Gbits/sec increased to 2.43 Gbits/sec.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 ++++++++++++-------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index e8dbce20129c..f05cae103d83 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -126,6 +126,7 @@ struct stmmac_rx_queue {
 	unsigned int cur_rx;
 	unsigned int dirty_rx;
 	unsigned int buf_alloc_num;
+	unsigned int napi_skb_frag_size;
 	dma_addr_t dma_rx_phy;
 	u32 rx_tail_addr;
 	unsigned int state_saved;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index acd6994c1764..1d98a5e8c98c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1341,7 +1341,7 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 	if (stmmac_xdp_is_enabled(priv))
 		return XDP_PACKET_HEADROOM;
 
-	return 0;
+	return NET_SKB_PAD;
 }
 
 static int stmmac_set_bfsize(int mtu, int bufsize)
@@ -2040,17 +2040,21 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	struct stmmac_channel *ch = &priv->channel[queue];
 	bool xdp_prog = stmmac_xdp_is_enabled(priv);
 	struct page_pool_params pp_params = { 0 };
-	unsigned int num_pages;
+	unsigned int dma_buf_sz_pad, num_pages;
 	unsigned int napi_id;
 	int ret;
 
+	dma_buf_sz_pad = stmmac_rx_offset(priv) + dma_conf->dma_buf_sz +
+			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
+	num_pages = DIV_ROUND_UP(dma_buf_sz_pad, PAGE_SIZE);
+
 	rx_q->queue_index = queue;
 	rx_q->priv_data = priv;
+	rx_q->napi_skb_frag_size = num_pages * PAGE_SIZE;
 
 	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
 	pp_params.pool_size = dma_conf->dma_rx_size;
-	num_pages = DIV_ROUND_UP(dma_conf->dma_buf_sz, PAGE_SIZE);
-	pp_params.order = ilog2(num_pages);
+	pp_params.order = order_base_2(num_pages);
 	pp_params.nid = dev_to_node(priv->device);
 	pp_params.dev = priv->device;
 	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
@@ -5582,22 +5586,26 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		}
 
 		if (!skb) {
+			unsigned int head_pad_len;
+
 			/* XDP program may expand or reduce tail */
 			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
 
-			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
+			skb = napi_build_skb(page_address(buf->page),
+					     rx_q->napi_skb_frag_size);
 			if (!skb) {
+				page_pool_recycle_direct(rx_q->page_pool,
+							 buf->page);
 				rx_dropped++;
 				count++;
 				goto drain_data;
 			}
 
 			/* XDP program may adjust header */
-			skb_copy_to_linear_data(skb, ctx.xdp.data, buf1_len);
+			head_pad_len = ctx.xdp.data - ctx.xdp.data_hard_start;
+			skb_reserve(skb, head_pad_len);
 			skb_put(skb, buf1_len);
-
-			/* Data payload copied into SKB, page ready for recycle */
-			page_pool_recycle_direct(rx_q->page_pool, buf->page);
+			skb_mark_for_recycle(skb);
 			buf->page = NULL;
 		} else if (buf1_len) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,
-- 
2.34.1


