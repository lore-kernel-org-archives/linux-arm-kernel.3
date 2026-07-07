Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11540C44502
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rm9MRGSl4GczQZf6rw7zLloar1+rboEsZM2ZEp7jaAk=; b=cu7xSz5A5UQJthVN30vGx5+G95
	o6cAiD0VXvzyGaeZcX9Q01W3FF9N90YhGh0bJUaHagrPS6TjxRSfRoUXjMqi+FavBmQqqTEdfd4Cv
	cN2+A3HMWa1HupXx1m7tj+VEvwndkp6Ra7UejgeAD+Ap7PzcZbzg4RyMVx670StfXNjmbB9cqDI+d
	jHnl5DIJmghfYJqUNAu/X9EkWLYvV07EoIvcz09O/yPViPV3zAZ4NQ5sHOn57Rlalm+YLMcfAJ8gX
	mJWQoVCGnU4l8BeNnd3OzZGv1vqEdzN3yDBb5hnbe7tdp1mNPloDKKy08jdy081ciykEysIRUF5Fc
	B3d9RDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9rw-0000000Faba-2GaU;
	Tue, 07 Jul 2026 17:46:04 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9rq-0000000FaYg-3xpo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:46:01 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260707174557euoutp01af6860c7c5dbbd43a470027e8b881538~AEwNV0SJ00163301633euoutp015
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 17:45:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260707174557euoutp01af6860c7c5dbbd43a470027e8b881538~AEwNV0SJ00163301633euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783446357;
	bh=Rm9MRGSl4GczQZf6rw7zLloar1+rboEsZM2ZEp7jaAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQEN2kXJq8lzQPqaPbvmZBWkvIBAa9Jqf60VpiuIhk1mgwV9VaZsUqoU77z+//Wx9
	 H/yhb1wNSBcUe+yNsRdl+30Y256Ig4TtZLXuJ4Y4hFR2Lcnyhdng2e5VR4H0G0Ljk/
	 W4AL0CTrNYrIpgv9XLPPS2a9kogB56QNeyYALzYY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174556eucas1p2fd039c22df294462f75715f490d6559c~AEwM34DsU2928629286eucas1p29;
	Tue,  7 Jul 2026 17:45:56 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174556eusmtip26f81bf233f44fb324944fb9100858ea6~AEwMN8hge2398923989eusmtip2Z;
	Tue,  7 Jul 2026 17:45:56 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub
	Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net v3 2/2] net/stmmac: Fix free-after-use panic when
 interface goes does with XDP
Date: Tue,  7 Jul 2026 19:45:51 +0200
Message-Id: <20260707174551.1264558-3-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707174551.1264558-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260707174556eucas1p2fd039c22df294462f75715f490d6559c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707174556eucas1p2fd039c22df294462f75715f490d6559c
X-EPHeader: CA
X-CMS-RootMailID: 20260707174556eucas1p2fd039c22df294462f75715f490d6559c
References: <20260707174551.1264558-1-j.raczynski@samsung.com>
	<CGME20260707174556eucas1p2fd039c22df294462f75715f490d6559c@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_104559_253804_FA094694 
X-CRM114-Status: GOOD (  20.75  )
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

When running XDP forwarding and interface gets shut down, kernel might panic
or show SLUB "poison overwritten" errors due to a race condition between
NAPI polling and resource freeing.

Observed error is one of following:
- Poison overwrriten
[ 1889.547746] eth1: Link is Down
[ 1889.549940] =============================================================================
[ 1889.549954] BUG kmalloc-4k (Tainted: G    B             ): Poison overwritten
[ 1889.549959] -----------------------------------------------------------------------------
[ 1889.549963] 0xffffff882dcc4d80-0xffffff882dcc4da7 @offset=19840. First byte 0x0 instead of 0x6b
[ 1889.549969] Allocated in __alloc_dma_tx_desc_resources+0x60/0x10c [stmmac] age=169 cpu=7 pid=27759
[ 1889.550020]  __kmem_cache_alloc_node+0x100/0x2e8
[ 1889.550032]  __kmalloc+0x58/0x1a0
[ 1889.550039]  __alloc_dma_tx_desc_resources+0x60/0x10c [stmmac]
[ 1889.550052]  alloc_dma_desc_resources+0xec/0x164 [stmmac]
[ 1889.550064]  stmmac_setup_dma_desc+0xec/0x1e4 [stmmac]
[ 1889.550076]  stmmac_open+0x28/0x94 [stmmac]
[...]

- Wrong memory address
[ 1901.546692] Unable to handle kernel paging request at virtual address dead000000000122
[...]
[ 1902.964068] Call trace:
[ 1902.967193]  free_to_partial_list+0x560/0x600
[ 1902.972227]  __slab_free+0x1a8/0x420
[ 1902.976480]  __kmem_cache_free+0x204/0x218
[ 1902.981254]  kfree+0x6c/0x128
[ 1902.984900]  kvfree+0x3c/0x4c
[ 1902.988545]  page_pool_release+0x234/0x27c
[ 1902.993320]  page_pool_destroy+0xcc/0x190
[ 1902.998006]  __free_dma_rx_desc_resources+0x100/0x360 [stmmac]
[ 1903.004516]  free_dma_desc_resources+0x8c/0xac [stmmac]
[ 1903.010419]  stmmac_release+0x1c0/0x2b4 [stmmac]
[...]

Root cause is stmmac_release() stops DMA and frees TX/RX ring buffers and
page pools while XDP could still be accessing these resources in the
background, because napi_synchronize() from napi_disable() does not ensure
XDP is done.

This makes small window where IRQ is still possible after NAPI has finished.
Problem is that stmmac_release() handles closing XDP in different order than
stmmac_xdp_disable_pool(), which is not affected by this issue, where
synchronize_rcu() is executed after napi_disable() and disable_rx/tx_queue().

Fix this by following:
- Set STMMAC_DOWN flag before stopping DMA to signal XDP to stop and discard
- Call synchronize_rcu() after stopping DMA but before freeing resources to
  ensure all ongoing NAPI operations complete, in similar order to
  stmmac_xdp_disable_pool()
- Clear STMMAC_DOWN flag in __stmmac_open() to restore normal operation.
  This was only done for stmmac_reset_subtask() during abnormal operation,
  which is not enough. This flag does not affect normal operation as it is
  used only for XDP apps. Usage of such flags is far from optimal and would
  be good to rewrite, but it would be quite an effort

Also replace stmmac_disable_all_queues() with __stmmac_disable_all_queues(),
as it is barren after this change.

Fixes: bba2556efad66 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++++++++++++++-----
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b9ffff001baf..9d971ae35d48 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -262,7 +262,11 @@ static void stmmac_verify_args(void)
 		pr_warn("stmmac: module parameter 'flow_ctrl' is obsolete - please remove from your module configuration\n");
 }
 
-static void __stmmac_disable_all_queues(struct stmmac_priv *priv)
+/**
+ * stmmac_disable_all_queues - Disable all queues
+ * @priv: driver private structure
+ */
+static void stmmac_disable_all_queues(struct stmmac_priv *priv)
 {
 	u8 rx_queues_cnt = priv->plat->rx_queues_to_use;
 	u8 tx_queues_cnt = priv->plat->tx_queues_to_use;
@@ -286,16 +290,15 @@ static void __stmmac_disable_all_queues(struct stmmac_priv *priv)
 }
 
 /**
- * stmmac_disable_all_queues - Disable all queues
+ * stmmac_drain_xdp - Cleanup for XDP apps
  * @priv: driver private structure
  */
-static void stmmac_disable_all_queues(struct stmmac_priv *priv)
+static void stmmac_drain_xdp(struct stmmac_priv *priv)
 {
 	u8 rx_queues_cnt = priv->plat->rx_queues_to_use;
 	struct stmmac_rx_queue *rx_q;
 	u8 queue;
 
-	/* synchronize_rcu() needed for pending XDP buffers to drain */
 	for (queue = 0; queue < rx_queues_cnt; queue++) {
 		rx_q = &priv->dma_conf.rx_queue[queue];
 		if (rx_q->xsk_pool) {
@@ -303,8 +306,6 @@ static void stmmac_disable_all_queues(struct stmmac_priv *priv)
 			break;
 		}
 	}
-
-	__stmmac_disable_all_queues(priv);
 }
 
 /**
@@ -4149,6 +4150,9 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_reset_queues_param(priv);
 
+	/* Clear DOWN flag when opening the interface */
+	clear_bit(STMMAC_DOWN, &priv->state);
+
 	ret = stmmac_hw_setup(dev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
@@ -4243,6 +4247,9 @@ static void __stmmac_release(struct net_device *dev)
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
+	/* Set DOWN flag to prevent XDP from processing new packets */
+	set_bit(STMMAC_DOWN, &priv->state);
+
 	stmmac_disable_all_queues(priv);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
@@ -4256,6 +4263,8 @@ static void __stmmac_release(struct net_device *dev)
 	/* Stop TX/RX DMA and clear the descriptors */
 	stmmac_stop_all_dma(priv);
 
+	stmmac_drain_xdp(priv);
+
 	/* Release and free the Rx/Tx resources */
 	free_dma_desc_resources(priv, &priv->dma_conf);
 
@@ -6412,7 +6421,7 @@ static int stmmac_setup_tc_block_cb(enum tc_setup_type type, void *type_data,
 	if (!tc_cls_can_offload_and_chain0(priv->dev, type_data))
 		return ret;
 
-	__stmmac_disable_all_queues(priv);
+	stmmac_disable_all_queues(priv);
 
 	switch (type) {
 	case TC_SETUP_CLSU32:
@@ -7122,6 +7131,9 @@ void stmmac_xdp_release(struct net_device *dev)
 	/* Stop TX/RX DMA channels */
 	stmmac_stop_all_dma(priv);
 
+	/* Drain leftover XDP buffers */
+	stmmac_drain_xdp(priv);
+
 	/* Release and free the Rx/Tx resources */
 	free_dma_desc_resources(priv, &priv->dma_conf);
 
@@ -8208,6 +8220,8 @@ int stmmac_suspend(struct device *dev)
 	/* Stop TX/RX DMA */
 	stmmac_stop_all_dma(priv);
 
+	stmmac_drain_xdp(priv);
+
 	stmmac_legacy_serdes_power_down(priv);
 
 	/* Enable Power down mode by programming the PMT regs */
-- 
2.34.1


