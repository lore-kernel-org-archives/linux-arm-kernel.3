Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1F9CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 04:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xymX6DeEZ6ZUhZOIDhlp9qJ5m8FC5E0Icyu/pNplfgk=; b=I8V5XW7iphGU3Gbtko4vemT5Zr
	1C605SBkGZLdq9ZjiDXC9Xbi6DwgwW03azsv3Lbt/AQ4a98WCiATOpz6lAv6Ah3lCD+gIpLPZPz7u
	NzZn3yUfJaLg3x/Ax+kw/wnCG3N+7S7YoYNBJzeHQqueWwRkeOtrNTQbb4gQGKtzm2aGCk/Ic7sXl
	veaaCjRzh8O7iAM29WKPpZA+qDVOO33fNdxrenw896LMax12cTfj4bpAgFzGEqodmYJnj8G+fJiZQ
	XhIwhYJPg7XfpuSXQ5+59v38rD311CdKqnqxWNnEnX38F0B2CdHrYqi1GpV/FkjdCtwFX4BrowMbS
	KpALt0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqP34-00000006uVE-42jM;
	Mon, 25 Aug 2025 04:43:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOxC-00000006tDM-2QUa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 04:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEEF841AE4;
	Mon, 25 Aug 2025 04:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EA11C19421;
	Mon, 25 Aug 2025 04:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756096629;
	bh=wwBDo6blRSFBdQltLRz6YF2EM5a8biOLLNX0om5ESo8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ingqzI70i6HXHgnFLwoVGatOuF3KLFBApNL2jOz7nyXw3URUo7qLEAapFvxs7HezL
	 UobJM/jjX1HbxOwIZHqs9VoIPGy7RkNqUw8szQwDGBtXnDvP1ySSO1BQa7MymOSbfu
	 gasDZdY50aT3n951/cf2YTgfQq91vIev3QpgUKDoDSOrRezbE6TUC+dlvcorn0vmWM
	 CMYyzuyyNzSIFzHMmvtwnCUof8uveJPsvx7BzJuvCfr4cDddG7BsOMDrP6HPO3o7Dh
	 cCjH+0mjuOdCFsMOEzLWkWlpWWo3i57Nqb1nWCKpTzBJOxRVDsV/G0yngMRJW1e9Nd
	 q2ypFskKkk5pA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3E6CA0EED;
	Mon, 25 Aug 2025 04:37:09 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Mon, 25 Aug 2025 12:36:54 +0800
Subject: [PATCH net v3 3/3] net: stmmac: Set CIC bit only for TX queues
 with COE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-xgmac-minor-fixes-v3-3-c225fe4444c0@altera.com>
References: <20250825-xgmac-minor-fixes-v3-0-c225fe4444c0@altera.com>
In-Reply-To: <20250825-xgmac-minor-fixes-v3-0-c225fe4444c0@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756096627; l=2589;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=ufHiTveJv2qBm24xiMB0gFsw0pu0zMd7hgFCJ9lPQkI=;
 b=J9xTvnesrv2sisMNAGCxcdrQoTHV2SLh3+3iW7faARF6ra+9ADLML6lJxH36GguS6UndD/PB5
 eTShfFdRmoiBgCrCLRf6pVPz270nXnPUja344HDqgLcK5teGx39zsAD
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_213710_663903_5D59B887 
X-CRM114-Status: GOOD (  11.46  )
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Currently, in the AF_XDP transmit paths, the CIC bit of
TX Desc3 is set for all packets. Setting this bit for
packets transmitting through queues that don't support
checksum offloading causes the TX DMA to get stuck after
transmitting some packets. This patch ensures the CIC bit
of TX Desc3 is set only if the TX queue supports checksum
offloading.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fa3d26c285025d01c72cef51add534fc722552b8..143e68639548f390e97b5a8dd09f3f4af12cec43 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2585,6 +2585,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 	struct netdev_queue *nq = netdev_get_tx_queue(priv->dev, queue);
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
+	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
 	struct xsk_buff_pool *pool = tx_q->xsk_pool;
 	unsigned int entry = tx_q->cur_tx;
 	struct dma_desc *tx_desc = NULL;
@@ -2672,7 +2673,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		}
 
 		stmmac_prepare_tx_desc(priv, tx_desc, 1, xdp_desc.len,
-				       true, priv->mode, true, true,
+				       csum, priv->mode, true, true,
 				       xdp_desc.len);
 
 		stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
@@ -4987,6 +4988,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 {
 	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
+	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
 	unsigned int entry = tx_q->cur_tx;
 	struct dma_desc *tx_desc;
 	dma_addr_t dma_addr;
@@ -5038,7 +5040,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 	stmmac_set_desc_addr(priv, tx_desc, dma_addr);
 
 	stmmac_prepare_tx_desc(priv, tx_desc, 1, xdpf->len,
-			       true, priv->mode, true, true,
+			       csum, priv->mode, true, true,
 			       xdpf->len);
 
 	tx_q->tx_count_frames++;

-- 
2.25.1



