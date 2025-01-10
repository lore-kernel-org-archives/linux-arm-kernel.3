Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32123E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxF3XO1B6LZpy7SsHuT7EE8l6m2FcLCgWD0toKoIsSE=; b=5CeWLdexc2bVWnOGzuMnfjamaN
	kvHRWc8+wpWiihGyNGksehc6Zeg2d7hgCVp+7TZvnkYfOaY6iP03bC1rgNYOZwR8p7yGIlZBxyniP
	GmThGQ0KV/vn/xEBs1sQ5ww+XUjqM9PWr3/LDzw5ggiQsv9lPf0ANjg7tBNGXFPoXtFFL9jVZs1Ro
	01QojbzQLKrrv8lEyvqmdSVc/mqyc8cavop/BY/btxKijqp47dnHlgOnkX1bO3YRyzGPInfO2pOZc
	liZ9ex2aWMontXDtYxFQbT8YTQO/yqStu+xFx4YCuq99bqqoSqklM1M28LI2wFROZzod3cfO9pO+1
	irj4eArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBks-0000000EqIm-3TT7;
	Fri, 10 Jan 2025 09:56:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBiX-0000000EpPb-0RfU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:54:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21661be2c2dso28682625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 01:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736502852; x=1737107652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxF3XO1B6LZpy7SsHuT7EE8l6m2FcLCgWD0toKoIsSE=;
        b=KnRGx/TdLIzGZheoO250YVkCY+9FJFGDzaB9g8BzhNmY+aOYQbhwh3Y67xYApbIZtz
         6e6maVi45SwKLTdN0Tuk3cnR0f8RT7ikSBnFw6muN6UApx9w8G34j7kNZvNXC7ZIF1+w
         cll8WjaH6a2b2FV8Ldhche5NxALv5wVmQDUQATD1EgRs5KuXN/ZA5Y9IjAEiSebEcPkT
         mkgq+g2ZfJj+x8lAAKpX1FTXByZWoR7g4jEEFR/7ULXngBSbVwCsIqU32Ox8E4eofeco
         UPSbSPH/CIyYldCYx7O7azOHJShRJ6z+B3B2BQfq90wM2yU2s9OY6d/E7kU/YWCrFatT
         o86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502852; x=1737107652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxF3XO1B6LZpy7SsHuT7EE8l6m2FcLCgWD0toKoIsSE=;
        b=WLTTDOdiBmDkokZaepF6d5igTRGO6mS1iZQK3Wm9e/cw7Of8zHuZBLrb7TObsA3leG
         z3MOIdLlyh/N0QPWkWSZXS6JsZsZVuisY8xpfkqH36tNSqT7J6mqRme2KKiLcCMyHPMB
         n1+QmWwDj6jsd/mzw/w0KINfBw4bdqAq0ZwMIC8xb0igDzxFmf/txiQDL1yReT4O9dyq
         ZJvijfx+uaP89Wepb2AC6uZdxt3do4jALBJwJBFkcsz4csrux5dZPBnlYAzR2+GY6ONv
         fIgRdZBnm+CVYaWZkIaE+CUMz3hnnkwOnSAQo/MU6S3IFg/bkDclGYwzZg9lSCVNALs/
         s+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNIj1ZARFW/F0iRPlijnwHKspPcjzC288r7ZW+DUKMiaandpLR5AKQ79LV9p6cWBvomv6N5rBy+cOuONBF0r/a@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9rpX+7/uHsObGH6SlB9Lyq+3wG/8zNqlqPBMKt6WMP6fPNs8b
	tuSwprhI/yMtzaAVAytAwSwzcq9YgP08cLhEKLPYY7dIAg2k/70+
X-Gm-Gg: ASbGnctHAWxwRSkoDNLrsL3DHGX37mY69EKf8AtkoaeSmDP68qpYk+1VhkWqLmyV3+R
	B87+RqbbrQpV0LUKq9QfkgYN9WQb8cRgWkLq/YeN/b2S5NJu2HEcNzwwKgnGgRVqZsiRQv89YrZ
	X3SVUHj+Kj0K/RD3F+58Gtn9QUMJIgLYZsZZTr0Stim2+9LbFrP+lYklOLfiAtC7gmUsMlVwOLx
	Rjjs4+0nlcbRVXW9W3oWVpNUlgp7fw1p5UUWXTGUocj5QYK3NC3z/87KuLqvIp0qQwH+A==
X-Google-Smtp-Source: AGHT+IFkCU9VmZRMCAwHW5xP2aexBm6vAYxF+cTLnmmRPs6gpn7mMaFELbrG88Frm/BNN1k4tXE+QA==
X-Received: by 2002:a05:6a00:1404:b0:725:d9b6:3958 with SMTP id d2e1a72fcca58-72d21f471c5mr15157812b3a.14.1736502852468;
        Fri, 10 Jan 2025 01:54:12 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d4069217dsm1186183b3a.151.2025.01.10.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:54:12 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v1 1/3] net: stmmac: Switch to zero-copy in non-XDP RX path
Date: Fri, 10 Jan 2025 17:53:57 +0800
Message-Id: <600c76e88b6510f6a4635401ec1e224b3bbb76ec.1736500685.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736500685.git.0x1207@gmail.com>
References: <cover.1736500685.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_015413_141594_1937D580 
X-CRM114-Status: GOOD (  16.18  )
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
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 +++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 548b28fed9b6..5c39292313de 100644
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
index 038df1b2bb58..43125a6f8f6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1320,7 +1320,7 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 	if (stmmac_xdp_is_enabled(priv))
 		return XDP_PACKET_HEADROOM;
 
-	return 0;
+	return NET_SKB_PAD;
 }
 
 static int stmmac_set_bfsize(int mtu, int bufsize)
@@ -2019,17 +2019,21 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
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
@@ -5574,19 +5578,20 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
+			skb_reserve(skb, ctx.xdp.data - ctx.xdp.data_hard_start);
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


