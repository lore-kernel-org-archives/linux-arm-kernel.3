Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6CFCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+N8M7kEn6F3G4z7ZbzHSA8YljJdhFkvUtWS5brKVaY=; b=lSSPNtzs6yh3AfWNf9OAr9djmV
	8ODmTqlj7Yiy93TGbN1b7VRh5jRFYi+sUbpQwD9trgCWM20Sl0ZlD0janrY/hSSZuJDUZoJ8TaULS
	dGyWxKpcZB6y2vZ8UPwGVBsmeJS0BFuFodvtpFkvLCU1dQdXm1q6dwJE3wiNP7d5WLl6aPcmU4w04
	snbY1u7nbfsfqGdT7MfVcGS/UDXmCzZ28wRro6zVUUl0yDkRxNsNJ5AG6JBK2FJcS+cO7VguU2B61
	gC7dLO9u4HvgQGhdyM9FTNPuqVSemN0LciZc+Klsj5GLFeL8DG9Sws1PbHObf9bZM8tG3HXtsXbi4
	ZCbS7nFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYKT-0000000CNwR-3s09;
	Tue, 13 Oct 2026 08:57:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYKS-0000000CNw6-3C0q
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 08:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8+N8M7kEn6F3G4z7ZbzHSA8YljJdhFkvUtWS5brKVaY=; b=eZKfJlCTJxLFCzUCci3xxTIkBo
	Cm1wnA1ZoyAgvUMPxyC0W4awT3Y39K8+pec6J6TViSJGuX/NzPVq3NbLEIY9L5fjnBkuHwXWvOtaO
	7/a3VDf30qOMsvZkYJC6VMr0jfbhNt2x7SA2N9Myn6RoLq76DBs2jQrXN0cCH15E3ntsGxH3DcLGL
	nCmptPAYpFuxcw45V7+hIbxAz3v5O7rqOW2NwUoOB1/RWguzeBLY0YPRcKPfj/i03YHDJL0r3romM
	hMPORQ2jSVmPCcpIE1eJkWVg2xLH73QaxidiV+zbPxNUAZibo6qrfGxgKRACLm8rOXweNGm6IeHOT
	GPNOmmOg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGYKJ-0000000FJEh-10MI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 08:57:44 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791881854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+N8M7kEn6F3G4z7ZbzHSA8YljJdhFkvUtWS5brKVaY=;
	b=JoAksINWoZe5TOWWX9vCsNHGbKiCPpYnG4S28r6EXAl1Ls8Mmgn3gXcPAlAq/zK0dgktD7
	UIBujPxngGWcZwoGgcThkbga22Vj1iO9uwIqPGhpuZOv0yGE5dXG2ixaywRWErIul7GXXt
	UwQ73Vq+pFoOo4UAsmqBmjpAVilT0EVYGdp5BmvnfL3dfdZM4KRfApyMMM9yqAgngMiJuG
	7UJA4LoSkSG2r/BsUalUYnMX3JhRjAZfpxzjrPUqMXQbghN4897JauUMjNIkedKIVpkV2r
	t7+7vyp1Hf0cPi9bxVkj/8EXImubvsXHlYysIgjq2VyMQJd3oZSDVPf2x3j9Ew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791881854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+N8M7kEn6F3G4z7ZbzHSA8YljJdhFkvUtWS5brKVaY=;
	b=7XjJK/w0jQuXmdORqap74Aw2zpM7qO2T7ylFqifGQQXJh4ZD0j6dNRxIAXjfuLsgPSLCJY
	902S/AKeorpg2WAA==
Date: Tue, 13 Oct 2026 10:57:22 +0200
Subject: [PATCH net v3 2/2] net: stmmac: Stop Tx queue when (en|dis)abling
 XSK pools
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-stmmac_xsk_crashes-v3-2-50fca7790af2@linutronix.de>
References: <20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de>
In-Reply-To: <20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Song Yoong Siang <yoong.siang.song@intel.com>, 
 Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 Kurt Kanzenbach <kurt@linutronix.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3809; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=tqeZpF0+kX388qtDypgR86tYkq7mnrzqbIh+t1fgVhE=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBqzfJ8J3Cw6jzwouW+catBSXVV2d1GJtbH6UsMW
 xO6ssxHAbCJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCas3yfAAKCRDBk9HyqkZz
 gmWOD/9/CoHEdB/IGqJs/T623x0EkFCvbhbpKNT7m2NY05AfcuXO7xcJb1+sQM0Sj9nva/1j0Bh
 i+Q7dywtaX1jST2eFSsv43EEzOvOD/T9TopiDr+pMJymVEPXvzRPnkjqrDzPwuf3a76T3jBVCsM
 ZPBn2e5y4Ot7ZGEYMnxkMFo6jatDXmDfQCEDFg6lHtdw7zNymvG8jkZsCgDfEyVdl5Tpc8ZWU9s
 Q7w67bdIJbVPPr32TuM+qJtveU+ee7NkyONWuIXzyl3zvH7KkIPJewyuohmkj+679H+jj/Xph/X
 TTpktyeQKI6dK5IsinuAL3RmQP30hIvk+q3dgtYuqZrvunfORd/rX1zUW4J37LU3hWCMdK67Yb+
 1nwX1dqqyXZEZOjGtUIIacN5P/n9D90g9PM0n9jaY8+SZK0dlwIMHZwHBjPXflTV6Vy7In2/UiY
 eTvtBMNnTBCJYjIUinXbD3UJ+eMx4lKyNoY/Fj4WdYCqcS7G9VC8DFU7VCMVJ9dv5gmjR0beMqm
 MYVLmn5UVjgIJq2hyRjpshPR8xkG/zcQmSEc3qMBkX3MQV136iBuklavk5EzIeTCwaLIc+6mKJx
 xpOM+QWZh/dg0zTi7u5BkP974gzFnWpNmU79q49k9176ErdP/RfeR5LucjUHyd4pHrMZ2usnMfc
 tSbZhnw0c2/llzg==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_095742_326865_C04ABD69 
X-CRM114-Status: GOOD (  12.27  )
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

When enabling or disabling XSK pools in parallel to Tx traffic, kernel
crashes occur. For VLAN tagged frames that happens in stmmac_xmit() ->
dwmac4_set_vlan_tag() and for normal frames in stmmac_xmit() ->
dwmac4_set_addr(). Both of these functions access the Tx DMA descriptors.

The XDP pool (en|dis)ablement frees and reallocates the Tx DMA resources:

 stmmac_disable_tx_queue:
   __free_dma_tx_desc_resources

 stmmac_enable_tx_queue:
   __alloc_dma_tx_desc_resources
   __init_dma_tx_desc_rings

NAPI is disabled during that allocation window, but the Tx queue is not
stopped. Therefore, add the stopping of the Tx queue during the enabling
and disabling of XSK pools.

The issue can be easily reproduced by:

 1. Run iperf
 2. Run application which opens an AF_XDP/ZC socket

Also add a dedicated queue check for the XDP Tx paths.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Suggested-by: Nicolai Buchwitz <nb@tipi-net.de> # XDP Tx checks
Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2aa5a2695473..0e8ab2bd8f3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5216,6 +5216,10 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 	dma_addr_t dma_addr;
 	bool set_ic;
 
+	/* Ring may be torn down for an XSK pool switch */
+	if (netif_tx_queue_stopped(netdev_get_tx_queue(priv->dev, queue)))
+		return STMMAC_XDP_CONSUMED;
+
 	if (stmmac_tx_avail(priv, queue) < STMMAC_TX_THRESH(priv))
 		return STMMAC_XDP_CONSUMED;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index d7e4db7224b0..a75ab93aef53 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -6,6 +6,15 @@
 #include "stmmac.h"
 #include "stmmac_xdp.h"
 
+static void stmmac_xdp_stop_tx_queue(struct stmmac_priv *priv, u16 queue)
+{
+	struct netdev_queue *nq = netdev_get_tx_queue(priv->dev, queue);
+
+	__netif_tx_lock_bh(nq);
+	netif_tx_stop_queue(nq);
+	__netif_tx_unlock_bh(nq);
+}
+
 static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 				  struct xsk_buff_pool *pool, u16 queue)
 {
@@ -36,6 +45,7 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 	if (need_update) {
 		napi_disable(&ch->rx_napi);
 		napi_disable(&ch->tx_napi);
+		stmmac_xdp_stop_tx_queue(priv, queue);
 		stmmac_disable_rx_queue(priv, queue);
 		stmmac_disable_tx_queue(priv, queue);
 	}
@@ -46,6 +56,7 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 		stmmac_enable_rx_queue(priv, queue);
 		stmmac_enable_tx_queue(priv, queue);
 		napi_enable(&ch->rxtx_napi);
+		netif_tx_wake_queue(netdev_get_tx_queue(priv->dev, queue));
 
 		err = stmmac_xsk_wakeup(priv->dev, queue, XDP_WAKEUP_RX);
 		if (err)
@@ -73,6 +84,7 @@ static int stmmac_xdp_disable_pool(struct stmmac_priv *priv, u16 queue)
 
 	if (need_update) {
 		napi_disable(&ch->rxtx_napi);
+		stmmac_xdp_stop_tx_queue(priv, queue);
 		stmmac_disable_rx_queue(priv, queue);
 		stmmac_disable_tx_queue(priv, queue);
 		synchronize_rcu();
@@ -87,6 +99,7 @@ static int stmmac_xdp_disable_pool(struct stmmac_priv *priv, u16 queue)
 		stmmac_enable_tx_queue(priv, queue);
 		napi_enable(&ch->rx_napi);
 		napi_enable(&ch->tx_napi);
+		netif_tx_wake_queue(netdev_get_tx_queue(priv->dev, queue));
 	}
 
 	return 0;

-- 
2.47.3


