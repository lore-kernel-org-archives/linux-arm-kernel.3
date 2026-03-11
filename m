Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150771049524
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImtxcwWXXJt6qxVXIbd5mh51lvJgGcYRDTbE+CXfQNQ=; b=v1rSFeaSYlqW+MpuRGxEDO8jdz
	aEDPf3bgC9sM4Kw9b6UISgs6nXBgxEzBxUezSsESkqxkfvEOX0bzfUNpD4QZ9OQGr7cK/Zfy7oDfd
	2yog7dGpcm0/FhmI7++c4H7bPmM7qKMoumsGxiZSPHydc3e+MWnU9qiNJUKYT5mI4Z+NdojSwFlmD
	mWvqQmopBhDESAa3kahH0mSrMpMWVkBaHNfcmh00pJTDQdtjn48hm/fRu3MdW86GAcqccbnAPbCCu
	VPvOdRyI1B1NKweLfSKxOF1Ueh9KXRas0tCEipX1eS8n+6ntFkacjQuG5aHdAbIUiZQbSqS9QVLqg
	YoRqNhog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFB-0000000BKdF-05a2;
	Wed, 11 Mar 2026 09:52:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GF8-0000000BKbF-40oZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ImtxcwWXXJt6qxVXIbd5mh51lvJgGcYRDTbE+CXfQNQ=; b=v70tf9s/DvNW5QJElpAsWvi/3O
	zu2/LM2uCToHZHGv565gxAXXVHd+jHrNDrTIm26ufK3HoEWDw9Lj9uPI5vgfp6moFoUA70I1++hiE
	rOlUF1xUSDEIl3hlFQYsS0cTjA7vuVvB4YCtWZCtX2TIlYSc3SOscFNwfGlN3HIkBF1i5COJXxWpo
	AejW6X051amL1Aq0PfMnj3cHWOs99CzaUtq0gZCz56uOVgmzwH7NFqLR57AVdpd/boFyazT0WtoIf
	0Iw1GrOug0TfZk6xnqPUwvggxlvs7VkX/ke0NN9cmdwSZXtjdgp7Y3dKYWOA69Me8dBPWY7ee8lci
	7AWc7B9g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48154 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0GEx-0000000067Z-2DLR;
	Wed, 11 Mar 2026 09:52:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0GEv-0000000CiT1-3c8e;
	Wed, 11 Mar 2026 09:52:29 +0000
In-Reply-To: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
References: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 05/15] net: stmmac: add helper to get size of a
 receive descriptor
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0GEv-0000000CiT1-3c8e@rmk-PC.armlinux.org.uk>
Date: Wed, 11 Mar 2026 09:52:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_025242_998615_E676206D 
X-CRM114-Status: GOOD (  11.61  )
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

Add and use a helper to get the size of the hardware receive
descriptor.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a3dfd3501604..dca62e7b259a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -362,6 +362,14 @@ static inline u32 stmmac_tx_avail(struct stmmac_priv *priv, u32 queue)
 			  priv->dma_conf.dma_tx_size);
 }
 
+static size_t stmmac_get_rx_desc_size(struct stmmac_priv *priv)
+{
+	if (priv->extend_desc)
+		return sizeof(struct dma_extended_desc);
+	else
+		return sizeof(struct dma_desc);
+}
+
 static struct dma_desc *stmmac_get_rx_desc(struct stmmac_priv *priv,
 					   struct stmmac_rx_queue *rx_q,
 					   unsigned int index)
@@ -1432,10 +1440,7 @@ static void stmmac_display_rx_rings(struct stmmac_priv *priv,
 		pr_info("\tRX Queue %u rings\n", queue);
 
 		head_rx = stmmac_get_rx_desc(priv, rx_q, 0);
-		if (priv->extend_desc)
-			desc_size = sizeof(struct dma_extended_desc);
-		else
-			desc_size = sizeof(struct dma_desc);
+		desc_size = stmmac_get_rx_desc_size(priv);
 
 		/* Display RX ring */
 		stmmac_display_ring(priv, head_rx, dma_conf->dma_rx_size, true,
@@ -5412,11 +5417,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
 
 		netdev_dbg(priv->dev, "%s: descriptor ring:\n", __func__);
-		if (priv->extend_desc) {
-			desc_size = sizeof(struct dma_extended_desc);
-		} else {
-			desc_size = sizeof(struct dma_desc);
-		}
+		desc_size = stmmac_get_rx_desc_size(priv);
 
 		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
 				    rx_q->dma_rx_phy, desc_size);
@@ -5604,10 +5605,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
 
 		netdev_dbg(priv->dev, "%s: descriptor ring:\n", __func__);
-		if (priv->extend_desc)
-			desc_size = sizeof(struct dma_extended_desc);
-		else
-			desc_size = sizeof(struct dma_desc);
+		desc_size = stmmac_get_rx_desc_size(priv);
 
 		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
 				    rx_q->dma_rx_phy, desc_size);
-- 
2.47.3


