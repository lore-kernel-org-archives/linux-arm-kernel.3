Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F0DC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeegLINSUVfOlfX4/9rlXB2NUVxrFUlmYGkBGDGCAS8=; b=T8W+lFL0N5/DbRtOQcYzQuFIQ5
	eUMkZRZ57QRWUa4Kn9ujFemryUYqwrtFk0RdjZey4HAfkGySeOkyO0GhgvWes2HnKEDvwPjr/FWj8
	pyWKOnG+/WQ8Fo9JU8DSx51nUFbInRPK9J4RHSRHWqTIa3KkdPfKMKKQ7Ur83CHuty6SFtbZeek4P
	vfVZWk1sdcT/ElSjZmvRowJ4iLNSXsbKTt5hF+i6q8I8BuGiy/PYE5HtycGW8q5uioNcNsSY7il/R
	KHha4WOjicBei96LfkIYvxSg/87DQ/fyhWR3r75IM0Dn1uw0E7NtPgJXCXYF8wSdKsSp3nrY/oa73
	biJA1Qwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nV4-0000000BoON-3wUz;
	Thu, 24 Sep 2026 17:44:50 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nUy-0000000BoKq-3TrS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:44:46 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466cc9b2f1dso68324fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790271884; x=1790876684; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VeegLINSUVfOlfX4/9rlXB2NUVxrFUlmYGkBGDGCAS8=;
        b=LNqOC9IZT5wRh9dhreVwFhgmgyucLYg3VK9lRVgQuLuzuaq1Tk1GiXSVO2HYuoZ4wZ
         aXBT4vUqA8MJdCwy50gBP0UaCm0uYMun4+culJHD7eGZX9JN6Wd4GTUdDsGUDA6mpmgG
         5fKtxJWwJBGb3LvuT/BhW7qwkFrRNaKAhy8kv6ovmaDnpGJW6n3LAI57DNEVhv3mjDbX
         hF95/5APsSA/U8Ew/q1wChwr9ax7VtYsnx5ks3UAgXVm9AJiul8/t4av6Nr2rCBJvPTx
         jW3JhhaHygufE3OVMfEVKT5Ea7T56sQER5VU7dw9223wxra0AGQPJkBJ9H/+h37/7Y+L
         1u+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271884; x=1790876684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeegLINSUVfOlfX4/9rlXB2NUVxrFUlmYGkBGDGCAS8=;
        b=aPYjz8ZA355RfTP7WHiUQcYd6HDW3krb7tKapnlXiKDxV9D70+hqwFVVaJqVgBi9Fx
         Qb9Tdt97IQUDY2ZnQau/WABfTJ5ANe5solZqd59rgglqYb7wO9QQ5pPo1hpkEwV1pGSM
         bsMk9rp2QCfICeOscF/eZrhH+e5BVSuU3GF3yD63GHeW+TnyxD/xqTl8Ze3rFDKR3uyz
         zWwdQfbKk4ChR1LnEMoSN0i2Pm4OLMHGHdYb7c9O3U8vZM5HiQ64yUn6lPRCZ/j/KuOE
         VGiMjPFK/0hpFIvsNhEAx8h1LWFNvjBUMQywUCmxYa48msPE3lztea+8duwrJL2K7m9f
         xOrQ==
X-Forwarded-Encrypted: i=1; AKwUvBytfNXBI8C6vYqQ1nSHvYdqo71vcY4m0zfMuNh5mOybtPowvnS4qKvP+8U9jpi+wOnwRfP5JM6D3te7DEm0gQqC@lists.infradead.org
X-Gm-Message-State: AFuF++m36PJJA+fpsoJD1UiZGObKONsdQgdUBMuZFHy5mMnfQZsUTiTS
	g6b/F1dSS6bPG7cNMx8yDQYqW6y1aHFTrGCpvF+VjK8h12mZlrM/QHko
X-Gm-Gg: AYBFou1ffuLpoo96/qoDqecOlJflA89HmvJZ2Ie/nOhi6S2SwYGWU5+U+J4V9m0kxlE
	UagNB5hqn3jMXatrrBipz0xvlZhOaIPlIyiYAdWUbKjY/QpepKPIj+5aNnvIo3qmBWNNjJk5quM
	wGn4W4l2hl1386DYaigx1nrTiato4xL+D0qjJ9mVs2NwVjurSuzIjHcjNrQYIdLD75TQU3biFFc
	fJtQ9PQNoMXUkGXomssGCOcVDnHnZIUl9l9eAPhOzvCsYo/a/6+7RpQJGlNbqeeeCFv9X3Bwx/Q
	HJT2prJYuS4Dp6sLIlPWMDSkpNfyZxX0W0Pexh/nTJ7tBFhPa5vYglxi1I6peMfC1KzjquVGfXZ
	KLQEY0IgIyl+0IFd6R85JkCFWIAje0M6oCqZz6bR28zSDxLXYyopphtOfpztgb9bg6kMDlmDmgl
	v2lZ3FqJyhMqh2AYKiKP3bkDw3xnAk8sGaGEzEfDlboS+axW4gZja/DNPw6gkEvZjJBR51cEY+Z
	nU2EAxA2052eywcmIU0Y1SCgGrq5f/ZDGIx90t06lqU1+5JQLgAUWRtq0JmJBN3V3uEybcUCNNe
	wXlsEWn1AZB7lgapQblncI168ycWi72E1TLDCG98T/NT6dp4w2EkkVVbfa9GUFs686k1dFyy+6U
	LV2TEjY4U3EfqO8wlZKNQ/Q==
X-Received: by 2002:a05:6871:3325:b0:467:2b0b:d07d with SMTP id 586e51a60fabf-491e9629ecbmr2582163fac.1.1790271884027;
        Thu, 24 Sep 2026 10:44:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491e8f8d14asm3027802fac.0.2026.09.24.10.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:44:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Sep 2026 11:44:35 -0600
Subject: [PATCH net v3 05/10] net: stmmac: unwind partially allocated DMA
 configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-submit-stmmac-reset-fixes-v1-v3-5-c031e3f3a282@gmail.com>
References: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
In-Reply-To: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_104444_896670_7A6C759B 
X-CRM114-Status: GOOD (  16.54  )
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

RX and TX allocation failure paths release all configured queues, even
when the failing queue has not allocated its buffer array or descriptors.
Only walk buffer arrays and free coherent memory when those allocations
exist. If TX allocation fails after RX allocation succeeds, release the
RX resources too.

Propagate RXQ memory-model registration errors instead of continuing
with an unusable RXQ. Clear XSK RXQ bindings before the RXQ goes away,
release any saved partial packet, and clear released resource pointers.
This also leaves configurations which are reused after close or XDP
reconfiguration with a consistent empty state.

The MTU transaction added later relies on preparation failures being
fully unwound without touching the currently active configuration.

Fixes: 71fedb0198cb ("net: stmmac: break some functions into RX and TX scopes")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 49 ++++++++++++++++++-----
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f7e91ae21448..3b918cf89806 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1761,6 +1761,9 @@ static void dma_free_rx_skbufs(struct stmmac_priv *priv,
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	int i;
 
+	if (!rx_q->buf_pool)
+		return;
+
 	for (i = 0; i < dma_conf->dma_rx_size; i++)
 		stmmac_free_rx_buffer(priv, rx_q, i);
 }
@@ -1884,17 +1887,19 @@ static int __init_dma_rx_desc_rings(struct stmmac_priv *priv,
 	rx_q->xsk_pool = stmmac_get_xsk_pool(priv, queue);
 
 	if (rx_q->xsk_pool) {
-		WARN_ON(xdp_rxq_info_reg_mem_model(&rx_q->xdp_rxq,
-						   MEM_TYPE_XSK_BUFF_POOL,
-						   NULL));
+		ret = xdp_rxq_info_reg_mem_model(&rx_q->xdp_rxq,
+						 MEM_TYPE_XSK_BUFF_POOL, NULL);
+		if (ret)
+			return ret;
 		netdev_info(priv->dev,
 			    "Register MEM_TYPE_XSK_BUFF_POOL RxQ-%d\n",
 			    queue);
 		xsk_pool_set_rxq_info(rx_q->xsk_pool, &rx_q->xdp_rxq);
 	} else {
-		WARN_ON(xdp_rxq_info_reg_mem_model(&rx_q->xdp_rxq,
-						   MEM_TYPE_PAGE_POOL,
-						   rx_q->page_pool));
+		ret = xdp_rxq_info_reg_mem_model(&rx_q->xdp_rxq,
+						 MEM_TYPE_PAGE_POOL, rx_q->page_pool);
+		if (ret)
+			return ret;
 		netdev_info(priv->dev,
 			    "Register MEM_TYPE_PAGE_POOL RxQ-%d\n",
 			    queue);
@@ -1956,6 +1961,8 @@ static int init_dma_rx_desc_rings(struct net_device *dev,
 			dma_free_rx_skbufs(priv, dma_conf, queue);
 
 		rx_q->buf_alloc_num = 0;
+		if (rx_q->xsk_pool)
+			xsk_pool_set_rxq_info(rx_q->xsk_pool, NULL);
 		rx_q->xsk_pool = NULL;
 
 		queue--;
@@ -2099,6 +2106,9 @@ static void dma_free_tx_skbufs(struct stmmac_priv *priv,
 
 	tx_q->xsk_frames_done = 0;
 
+	if (!tx_q->tx_skbuff_dma || !tx_q->tx_skbuff)
+		return;
+
 	for (i = 0; i < dma_conf->dma_tx_size; i++)
 		stmmac_free_tx_buffer(priv, dma_conf, queue, i);
 
@@ -2137,10 +2147,16 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	void *addr;
 
 	/* Release the DMA RX socket buffers */
-	if (rx_q->xsk_pool)
+	if (rx_q->xsk_pool) {
 		dma_free_rx_xskbufs(priv, dma_conf, queue);
-	else
+		xsk_pool_set_rxq_info(rx_q->xsk_pool, NULL);
+	} else {
 		dma_free_rx_skbufs(priv, dma_conf, queue);
+	}
+	if (rx_q->state_saved)
+		dev_kfree_skb_any(rx_q->state.skb);
+	rx_q->state.skb = NULL;
+	rx_q->state_saved = 0;
 
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
@@ -2153,7 +2169,8 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	if (addr)
+		dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
@@ -2161,6 +2178,10 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	kfree(rx_q->buf_pool);
 	if (rx_q->page_pool)
 		page_pool_destroy(rx_q->page_pool);
+	rx_q->buf_pool = NULL;
+	rx_q->page_pool = NULL;
+	rx_q->dma_erx = NULL;
+	rx_q->dma_rx = NULL;
 }
 
 static void free_dma_rx_desc_resources(struct stmmac_priv *priv,
@@ -2201,10 +2222,16 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
-	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	if (addr)
+		dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
 
 	kfree(tx_q->tx_skbuff_dma);
 	kfree(tx_q->tx_skbuff);
+	tx_q->tx_skbuff_dma = NULL;
+	tx_q->tx_skbuff = NULL;
+	tx_q->dma_etx = NULL;
+	tx_q->dma_entx = NULL;
+	tx_q->dma_tx = NULL;
 }
 
 static void free_dma_tx_desc_resources(struct stmmac_priv *priv,
@@ -2411,6 +2438,8 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
 		return ret;
 
 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
+	if (ret)
+		free_dma_rx_desc_resources(priv, dma_conf);
 
 	return ret;
 }

-- 
2.53.0


