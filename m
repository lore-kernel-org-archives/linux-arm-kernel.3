Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FE5C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccKpY1leYRtGPw2tEgtgVTc2GSp/SOKDOJPp9BmSe4Y=; b=zxy393GNVxEL6N+k+QXrFBYV0s
	TE0uUqaGB9N6jJfNJWE/evglDbuFuQ5FZJA487QmXMHt5h0Bf81uadnc9b3Rz4UR0yz5VCAj1O6ev
	1eD7EWjRU1MQxgyQa60HgG/eGVminTMD8eYVKLPAop/Efn5sEinwxtpzCPuV7sXP+4LAnhp2zIwfg
	mXLDnqnoPlb8rTR6fQkJuLzermcGTTpP5lat3ATi7NsCx0w+KLxOWK7jzPqB5z0sP/Y5bDlM+QpAS
	a64LJcotp3Q3lexUwoUaj867FQXvZb4VN7gFRK+etpaa1Py9TqnP5zPXJp8L2OWu1VGicLaWzdhSu
	100Io1BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLLf-00000005OJr-45hn;
	Mon, 13 Jan 2025 14:23:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLJJ-00000005Noz-1RCk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:20:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21644aca3a0so95230985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736778056; x=1737382856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccKpY1leYRtGPw2tEgtgVTc2GSp/SOKDOJPp9BmSe4Y=;
        b=IpQwaukvuOAzl6oNY8bXY/mU3UsKZmxP6miDcRuylS7viIj5MyhrOulN9R+xVieX2W
         KCQzULrxRDFBSI8xI+HfeTHw7CQS6DvWtYHvUmskX9CO0ohJ4ZSOsxybfO3tMB4/AbNo
         RuHlS8kyqvotFsv+1k4OyozzhbHAuAd9yRCnX9sPySmoGZ2QKtlRk9ADEFPy0+n/vR9m
         FSIEyepsjZ5l1Y5ULXSG9JXQeD8BWNaoh+5rmDizxW31UW+lMLrANEQndvMdkRRKc99k
         SvcpkXTCTcudkkgXIUCaGEDA86tGkKxZYKSe1dWeEnUwvbHrRLnaCpWuwB7CIUxBE/dN
         zC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778056; x=1737382856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccKpY1leYRtGPw2tEgtgVTc2GSp/SOKDOJPp9BmSe4Y=;
        b=KqG+2PxQxb6PNYAWpBvOedjWidYsRlDUzSTqA/OCjTytmWE/oOrsJnhl50djM9T5V3
         wb+ee41PRsSlM/V19HD1UCDtXoBQNL7/VBDTfWYX688JMGMvNEDFcgSrFbclj4ebVaX3
         XgyNY2d1d2zf2YWKQqOcJcEw4xtGdp4JZ0KHxzK6iki0dHV6wK1gHJ3hIusZbsVkoOR+
         78UkmHxc4NAR/M2rR8bKgrpU0AuFMKEmfoNSYAPY7qs+JG7wr6S05dLevzCfUFkqv1xW
         9jdFRuGC3o/9g7FnqScKVEgzgSc9WdPFXafGzsuvE72PjVZbl4NuoCX9PGpPvUIbDMDX
         /Hdw==
X-Forwarded-Encrypted: i=1; AJvYcCWnWmyzQXfxs1y18alMsiLphgz98I3pOElZcCXTdLgWYIZXky3GQ95hJjdBdSMnU1hWfD0EuBKvAIRWCy+/XnlT@lists.infradead.org
X-Gm-Message-State: AOJu0YzsPPk4U1yBYf8fOlZXs/R6Y4UG6Fo/38iF6s1lhFfJL2O8RS83
	FETBvUpleEa8GGTpYmc+k3OpBcgLleapty9Z9w6rgLJA/7UJd2YM
X-Gm-Gg: ASbGncs0sCZRFYXClFBJBfSjtuQkXCeSHCW1LCOzQsWOFymJKlDYX7pPWbhSBzrck3t
	oxEke/2oFqJBnud4JCEtZkYT3XJGR/mcvCD8mybQzdXg6taEN0QKd0Uod609yp6uoWBHDoRbJaW
	R+uwkeNucFb5zTFnggr9QRp3NYYf2BlPfGB8QSW3rZ4lwaX3Ec+uKW8t0QA7gbJ1WzrHcTOsYFd
	Cq8aiyzr7n7oHs6xGqpBG/+og/4VtIf1G6xaXwXHw7NCFFPyn3cIj+qbFMdK5t1jZCkcA==
X-Google-Smtp-Source: AGHT+IGKv3lMSzF+D1LHruGGkM9/Rgx0EUTXEe4+mf7NCbt27F7Ct+oQGMUGSmcsLeFCk+WT+xqn0A==
X-Received: by 2002:a05:6a21:4a41:b0:1e3:e836:8ad8 with SMTP id adf61e73a8af0-1e88d0ef9f6mr36157231637.38.1736778056233;
        Mon, 13 Jan 2025 06:20:56 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d4067f0d1sm6089222b3a.136.2025.01.13.06.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:20:55 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v2 1/3] net: stmmac: Switch to zero-copy in non-XDP RX path
Date: Mon, 13 Jan 2025 22:20:29 +0800
Message-Id: <7e7c594913b003b3eb7a836042fe00515421218e.1736777576.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736777576.git.0x1207@gmail.com>
References: <cover.1736777576.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_062057_381719_CFF9E638 
X-CRM114-Status: GOOD (  16.32  )
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
index 58b013528dea..6ec7bc61df9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1330,7 +1330,7 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 	if (stmmac_xdp_is_enabled(priv))
 		return XDP_PACKET_HEADROOM;
 
-	return 0;
+	return NET_SKB_PAD;
 }
 
 static int stmmac_set_bfsize(int mtu, int bufsize)
@@ -2029,17 +2029,21 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
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
@@ -5574,22 +5578,26 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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


