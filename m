Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E2310775FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 18:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6F5RbYjwrweXgBMfc/nBuLz5ZDj05fkoaWvuU8RxfYs=; b=0KJdrlH7DntHOE2n5NganHxR8F
	6OA5TMOCa7mRuN77U2miQmYkbhq/HFyjV6OFMwnKe55n571U4k2AKh67gYudPH+ud7cRqsFRZyQcf
	4iA8bD6KciSuDFUgdRcKPZuILRHGX9qDHT/mF9jjKQvc6WIpbnEzEzbI3q7ptaHdFVUA6zbaj/6Q6
	OJFguSyE+iGYUd6ZA4fOwKDyLP0gBeyLo+Pr2AWZFrbHKTVAgc7SQhWZuWrWCMP+Z0PbiVqSXxT4v
	99Hk6oIDY8S8J4n+qIr31y8v2QZ64o7eTQUfunUjdM86f3WJwNl8zuSRy1eGolBUbJ/+BMjDyXg0A
	4kx4bUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vbS-00000009AFO-2NoA;
	Wed, 18 Mar 2026 18:26:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vbO-00000009AEw-3Mf7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 18:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=6F5RbYjwrweXgBMfc/nBuLz5ZDj05fkoaWvuU8RxfYs=; b=MWZms4O12zCWy2liRa3WWJ9b3t
	UqsX6iI3Z3aAzRJs4XeWgp3niL0SYJUkTudH5gMIw1Rn8UECzQyJV0rKq/O/s14kR+tUqDsKoBnYK
	xGp6CufGRbyggZtrjxD/E4fMCMbp6e+zIyUd5cVCvableAKvzclklArDaqcX7ja+r5qn1brFUef1O
	EEKkQDkPqcnEbd/4IRCxvrsJoDrlS+14huhMPqgzYTjN5USVTGUcBLUA8+iJ2K8SV8Sfrg+Vq9KHq
	2ddBzFTOkL9kMkk5tSKVDEKvexzY9P7kTw7tlOsKzaLGjLcVzzXI1ucDfjUU+l+xVJ56hy2zveZT0
	mShrmQpQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vbK-0000000C1Wu-2egx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 18:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6F5RbYjwrweXgBMfc/nBuLz5ZDj05fkoaWvuU8RxfYs=; b=N7KHpjJ63v5uOrdTgBQ9CEaRLM
	mSLN3weBTgC9gkefZZnoPSk7We9TdYWp0S9ed3YTVRXtpddB8OSU0edDVrdNY46tPLdv8gZ0mwpZ+
	biQawgKjNf0+a1B+MbnBM+/zGjZIumDo0bzgkuhWVuF6OrmQ/4Djr2mFAXnKO1aSDTN5Sqe92vaHS
	04emqyua+Nfx1bGSj/EiwOWxqQCdD1dUoytoDi7OMqf1ZnXyi9QRpn9aDO+nqPajKbCQULH5R1nP3
	6HTnq5oixTJUKuKDliyscVecSlZ3e+bHJF09miDwLHa/K6QV2vnmvTg1g+dGyXmIj94lhMv3IwGS3
	JnSpcOcA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56022 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w2vbG-000000003p3-3H0v;
	Wed, 18 Mar 2026 18:26:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w2vbF-0000000DbWQ-4674;
	Wed, 18 Mar 2026 18:26:34 +0000
In-Reply-To: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
References: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/5] net: stmmac: rename "mode" to "descriptor_mode"
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w2vbF-0000000DbWQ-4674@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 18:26:33 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_182638_767293_D70C1D5B 
X-CRM114-Status: GOOD (  16.89  )
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

priv->mode doesn't describe what it refers to, it is whether we operate
the DMA descriptors as a ring or chain. It is also difficult to grep for
as there are several "mode" struct members. Add "descriptor_" prefix.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  5 +++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 ++++++++++---------
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 71dac8c1a3ca..511b0fd5e834 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -57,11 +57,11 @@ static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
 
 	if (priv->chain_mode) {
 		dev_info(priv->device, "Chain mode enabled\n");
-		priv->mode = STMMAC_CHAIN_MODE;
+		priv->descriptor_mode = STMMAC_CHAIN_MODE;
 		mac->mode = &chain_mode_ops;
 	} else {
 		dev_info(priv->device, "Ring mode enabled\n");
-		priv->mode = STMMAC_RING_MODE;
+		priv->descriptor_mode = STMMAC_RING_MODE;
 		mac->mode = &ring_mode_ops;
 	}
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b9d849a3f06e..919a93a52390 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -323,7 +323,10 @@ struct stmmac_priv {
 	bool extend_desc;
 	/* chain_mode: requested descriptor mode */
 	bool chain_mode;
-	unsigned int mode;
+	/* descriptor_mode: actual descriptor mode,
+	 * see STMMAC_CHAIN_MODE or STMMAC_RING_MODE
+	 */
+	u8 descriptor_mode;
 	struct kernel_hwtstamp_config tstamp_config;
 	struct ptp_clock *ptp_clock;
 	struct ptp_clock_info ptp_clock_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0a933aac3f03..567499e74917 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1589,7 +1589,8 @@ static void stmmac_clear_rx_descriptors(struct stmmac_priv *priv,
 	for (i = 0; i < dma_conf->dma_rx_size; i++) {
 		desc = stmmac_get_rx_desc(priv, rx_q, i);
 
-		stmmac_init_rx_desc(priv, desc, priv->use_riwt, priv->mode,
+		stmmac_init_rx_desc(priv, desc, priv->use_riwt,
+				    priv->descriptor_mode,
 				    (i == dma_conf->dma_rx_size - 1),
 				    dma_conf->dma_buf_sz);
 	}
@@ -1616,7 +1617,7 @@ static void stmmac_clear_tx_descriptors(struct stmmac_priv *priv,
 		struct dma_desc *p;
 
 		p = stmmac_get_tx_desc(priv, tx_q, i);
-		stmmac_init_tx_desc(priv, p, priv->mode, last);
+		stmmac_init_tx_desc(priv, p, priv->descriptor_mode, last);
 	}
 }
 
@@ -1925,7 +1926,7 @@ static int __init_dma_rx_desc_rings(struct stmmac_priv *priv,
 	}
 
 	/* Setup the chained descriptor addresses */
-	if (priv->mode == STMMAC_CHAIN_MODE) {
+	if (priv->descriptor_mode == STMMAC_CHAIN_MODE) {
 		if (priv->extend_desc)
 			stmmac_mode_init(priv, rx_q->dma_erx,
 					 rx_q->dma_rx_phy,
@@ -2027,7 +2028,7 @@ static int __init_dma_tx_desc_rings(struct stmmac_priv *priv,
 		  (u32)tx_q->dma_tx_phy);
 
 	/* Setup the chained descriptor addresses */
-	if (priv->mode == STMMAC_CHAIN_MODE) {
+	if (priv->descriptor_mode == STMMAC_CHAIN_MODE) {
 		if (priv->extend_desc)
 			stmmac_mode_init(priv, tx_q->dma_etx,
 					 tx_q->dma_tx_phy,
@@ -2774,7 +2775,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		}
 
 		stmmac_prepare_tx_desc(priv, tx_desc, 1, xdp_desc.len,
-				       csum, priv->mode, true, true,
+				       csum, priv->descriptor_mode, true, true,
 				       xdp_desc.len);
 
 		stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
@@ -2948,7 +2949,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 			}
 		}
 
-		stmmac_release_tx_desc(priv, p, priv->mode);
+		stmmac_release_tx_desc(priv, p, priv->descriptor_mode);
 
 		entry = STMMAC_GET_ENTRY(entry, priv->dma_conf.dma_tx_size);
 	}
@@ -4794,7 +4795,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		/* Prepare the descriptor and set the own bit too */
 		stmmac_prepare_tx_desc(priv, desc, 0, len, csum_insertion,
-				priv->mode, 1, last_segment, skb->len);
+				       priv->descriptor_mode, 1, last_segment,
+				       skb->len);
 	}
 
 	stmmac_set_tx_dma_last_segment(tx_q, entry);
@@ -4890,8 +4892,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		/* Prepare the first descriptor setting the OWN bit too */
 		stmmac_prepare_tx_desc(priv, first, 1, nopaged_len,
-				csum_insertion, priv->mode, 0, last_segment,
-				skb->len);
+				       csum_insertion, priv->descriptor_mode,
+				       0, last_segment, skb->len);
 	}
 
 	if (tx_q->tbs & STMMAC_TBS_EN) {
@@ -5119,7 +5121,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 	stmmac_set_desc_addr(priv, tx_desc, dma_addr);
 
 	stmmac_prepare_tx_desc(priv, tx_desc, 1, xdpf->len,
-			       csum, priv->mode, true, true,
+			       csum, priv->descriptor_mode, true, true,
 			       xdpf->len);
 
 	tx_q->tx_count_frames++;
@@ -7432,7 +7434,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	 * is not expected to change this.
 	 */
 	priv->plat->dma_cfg->atds = priv->extend_desc &&
-				    priv->mode == STMMAC_RING_MODE;
+				    priv->descriptor_mode == STMMAC_RING_MODE;
 
 	/* Rx Watchdog is available in the COREs newer than the 3.40.
 	 * In some case, for example on bugged HW this feature
-- 
2.47.3


