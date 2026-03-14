Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EFB106FD9E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuiBWL9slWFfLdMK78HlbHZtxacsYxcx6jOQkgQ83JU=; b=K61505a765AgItaRs2ZDRUxIet
	pAhkcdUHB5OC3DtfwJ7oKBd4aZqOB9r5TprIbYUnaYY4rR79aHImI4jm/tg301Du89xVj5bwQHsA9
	Zpe8m3h0k/nO6veWbhNQgYbgd1wBwwBiDrGXq/b2ovc7+vLJpsKrJhcQhobRK8OTrvMjUmU/XgIzs
	3A/3+NMm2H6I+HY52cmHIJ3Rvi0KdzNnoBrWtaKSdAmcvyRb9JpnOsANDO0UCf+d31rzWkHJmwRim
	NOqMHlEaQ73bjpEgYRTfFWKN4/ONvEZJKxpwgAITl3G+jk9LhPxIYln7oKT2IzMI958+oUd8TftuN
	cRW/taxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LWw-00000001hUi-0gpa;
	Sat, 14 Mar 2026 09:43:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LWr-00000001hP0-2CsZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SuiBWL9slWFfLdMK78HlbHZtxacsYxcx6jOQkgQ83JU=; b=VGQA63qxU+S6XpMC38lRMN/gJr
	z+aAD2gwYXz2mUSHv2BPvplEv6mSb+W28jcgiV/PiQ252Z7DkB5CEetA+JVBpFTMVm/6z52sksLr/
	7fJYH7JKrbO7C3u05BtPF/D0d5C5Oh/+gr+rl/20rqIyc4hVPbyyBPDbxzUUE1Ji2mCN+m5F9QNzU
	MH14T/osiDROAfO649BzJ3qYS7q2CJfu4ZBIUve0BcCipL4Q0lQH2xXBIIWT2RJxQ456eQ37+JdsR
	yZD0gFb4bivsKQ+kli8825IzVABYFwyyNFgQMk/O7jQP9CqeH7liySKXoexWkoilZVFcuczDA4y9+
	tfwaPy1Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40028 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w1LWY-0000000021w-0yFP;
	Sat, 14 Mar 2026 09:43:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w1LWT-0000000DGSX-3fxc;
	Sat, 14 Mar 2026 09:43:05 +0000
In-Reply-To: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
References: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v4 09/15] net: stmmac: add helper to set receive
 buffer size
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w1LWT-0000000DGSX-3fxc@rmk-PC.armlinux.org.uk>
Date: Sat, 14 Mar 2026 09:43:05 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_024329_599511_C890DC17 
X-CRM114-Status: GOOD (  12.79  )
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

There are three sites that configure the hardware for the receive
buffer size using the same logic to determine the buffer size.
Add a helper so there is only one copy of this code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 54 ++++++++-----------
 1 file changed, 21 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 787b02c2607a..47b536c15c0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -393,6 +393,24 @@ static void stmmac_set_queue_rx_tail_ptr(struct stmmac_priv *priv,
 	stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_tail_addr, chan);
 }
 
+static void stmmac_set_queue_rx_buf_size(struct stmmac_priv *priv,
+					 struct stmmac_rx_queue *rx_q,
+					 unsigned int chan)
+{
+	u32 buf_size;
+
+	if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
+		buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
+		stmmac_set_dma_bfsize(priv, priv->ioaddr,
+				      buf_size,
+				      rx_q->queue_index);
+	} else {
+		stmmac_set_dma_bfsize(priv, priv->ioaddr,
+				      priv->dma_conf.dma_buf_sz,
+				      rx_q->queue_index);
+	}
+}
+
 /**
  * stmmac_rx_dirty - Get RX queue dirty
  * @priv: driver private structure
@@ -2605,23 +2623,13 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 	/* configure all channels */
 	for (chan = 0; chan < rx_channels_count; chan++) {
 		struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[chan];
-		u32 buf_size;
 
 		qmode = priv->plat->rx_queues_cfg[chan].mode_to_use;
 
 		stmmac_dma_rx_mode(priv, priv->ioaddr, rxmode, chan,
 				rxfifosz, qmode);
 
-		if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
-			buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
-			stmmac_set_dma_bfsize(priv, priv->ioaddr,
-					      buf_size,
-					      chan);
-		} else {
-			stmmac_set_dma_bfsize(priv, priv->ioaddr,
-					      priv->dma_conf.dma_buf_sz,
-					      chan);
-		}
+		stmmac_set_queue_rx_buf_size(priv, rx_q, chan);
 	}
 
 	for (chan = 0; chan < tx_channels_count; chan++) {
@@ -6935,7 +6943,6 @@ void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue)
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
 	unsigned long flags;
-	u32 buf_size;
 	int ret;
 
 	ret = __alloc_dma_rx_desc_resources(priv, &priv->dma_conf, queue);
@@ -6960,16 +6967,7 @@ void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue)
 	stmmac_set_queue_rx_tail_ptr(priv, rx_q, rx_q->queue_index,
 				     rx_q->buf_alloc_num);
 
-	if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
-		buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
-		stmmac_set_dma_bfsize(priv, priv->ioaddr,
-				      buf_size,
-				      rx_q->queue_index);
-	} else {
-		stmmac_set_dma_bfsize(priv, priv->ioaddr,
-				      priv->dma_conf.dma_buf_sz,
-				      rx_q->queue_index);
-	}
+	stmmac_set_queue_rx_buf_size(priv, rx_q, rx_q->queue_index);
 
 	stmmac_start_rx_dma(priv, queue);
 
@@ -7072,7 +7070,6 @@ int stmmac_xdp_open(struct net_device *dev)
 	u8 dma_csr_ch = max(rx_cnt, tx_cnt);
 	struct stmmac_rx_queue *rx_q;
 	struct stmmac_tx_queue *tx_q;
-	u32 buf_size;
 	bool sph_en;
 	u8 chan;
 	int ret;
@@ -7112,16 +7109,7 @@ int stmmac_xdp_open(struct net_device *dev)
 		stmmac_set_queue_rx_tail_ptr(priv, rx_q, chan,
 					     rx_q->buf_alloc_num);
 
-		if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
-			buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
-			stmmac_set_dma_bfsize(priv, priv->ioaddr,
-					      buf_size,
-					      rx_q->queue_index);
-		} else {
-			stmmac_set_dma_bfsize(priv, priv->ioaddr,
-					      priv->dma_conf.dma_buf_sz,
-					      rx_q->queue_index);
-		}
+		stmmac_set_queue_rx_buf_size(priv, rx_q, chan);
 
 		stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
-- 
2.47.3


