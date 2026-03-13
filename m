Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1785105F781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSDqBN/DmAWeozPDEC8b1qloPDPE+0ZqAmxNNyAd8yY=; b=AlBYgk/7NwKxOwr5yJYtJWN29i
	GFkOewTrCtsCOQ/ufO1WX5ykkg7QJwab4aczsxeGe/kVXFNtUoDy2XrhDhGk+FVkXMcyymH8tnP0P
	xyOTtVnoP805t3nmeo8EfS6eLjnDZ/RbJWICpsboXBGXB05gD1y0k0tugFc4Xbc977sW4GP3/x5HV
	L5D625+gmmDyXZM/OO2ccnf5enJMz5I7FqqUklr+U12yeYVve3deCic7PdzQ3ZfjJ3+ahQoRfFJg/
	ilK8SSuNsoUJcnh00ilu6w0JFawx0nLk/Uu4Fq+Lb4ikfvHd9P/pqdP7vHqh40u3FfcUW88oLpfeB
	3g7zG6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zC0-0000000HRTC-3KBz;
	Fri, 13 Mar 2026 09:52:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zBw-0000000HRQU-1UYR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 09:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=QSDqBN/DmAWeozPDEC8b1qloPDPE+0ZqAmxNNyAd8yY=; b=mFbrdl14Zrjokx/KwEAKglxWnw
	mJopIOvhqq5erEP56oS9rxpenMj3NlOB/apNUzcxKciPfr/MyqleWlEIz5kkcDAZ92lTyarFpIgC0
	iuYuwZn4eNFl/uTySYwwS+DfZnyXzc9X2pmxDtmLCQ6l+4X8qbyM7hF+YflwgPv3pWKX+LgDPewEp
	xvje6TfSY0QvT5FCJoztJawCNAWjekfN6uuA5kvxWH4w0ITZ/h3Z7hlEcdxjh+cVCKdECfKtO3931
	yll5MuMLsEeQxrqbeVGL3vZuaCCaOiJsKS4boVdzD25pUdd0m98QSrdjYHzrlXwfNeu1xM7dxdyGD
	9Nypmejw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zBt-0000000CtOr-0Kde
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QSDqBN/DmAWeozPDEC8b1qloPDPE+0ZqAmxNNyAd8yY=; b=Ung/Rx7TOdQk+c+SUt7DBrQmi8
	XHKCOOsKVvOe/PCe/jco7hAtdC3pO7jJDLjr/Ee5e3Fs+JVqD9BEjhT1i8NRwyzO72LNTHpX+7Jd0
	/Z9bWb7h90A0pnmkFYgerboiSEiN0vy18DHoa91ZT6QSEN6JeKAI0lmAFdVrHky5/76Uy+9F2AgeC
	6b1CCyQwUO0TMfJMAnJK09d9r4cu5fi60Q0z2jkWrERoXRLske2GK0yS/DZBFm7qguX0I4cbvLMjU
	qaWmlmH/OWt2/xK0e6PqHim3AMM7IVmDRQiDq3GmejdR5qW9xyk9DjD6xRWArUZanivEf8c9KbuQ5
	GSLEYxBw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53618 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0zBb-000000000gB-20sn;
	Fri, 13 Mar 2026 09:52:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0zBX-0000000D4G4-0CY5;
	Fri, 13 Mar 2026 09:51:59 +0000
In-Reply-To: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
References: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v3 12/15] net: stmmac: add helper to get size of a
 transmit descriptor
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0zBX-0000000D4G4-0CY5@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 09:51:59 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095221_358194_C6AF13DE 
X-CRM114-Status: GOOD (  12.21  )
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

Add and use a helper to get the size of the hardware transmit
descriptor.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 76e4dcf8f697..da1726b887f3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -362,6 +362,17 @@ static inline u32 stmmac_tx_avail(struct stmmac_priv *priv, u32 queue)
 			  priv->dma_conf.dma_tx_size);
 }
 
+static size_t stmmac_get_tx_desc_size(struct stmmac_priv *priv,
+				      struct stmmac_tx_queue *tx_q)
+{
+	if (priv->extend_desc)
+		return sizeof(struct dma_extended_desc);
+	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
+		return sizeof(struct dma_edesc);
+	else
+		return sizeof(struct dma_desc);
+}
+
 static struct dma_desc *stmmac_get_tx_desc(struct stmmac_priv *priv,
 					   struct stmmac_tx_queue *tx_q,
 					   unsigned int index)
@@ -1501,14 +1512,8 @@ static void stmmac_display_tx_rings(struct stmmac_priv *priv,
 
 		pr_info("\tTX Queue %d rings\n", queue);
 
-		if (priv->extend_desc)
-			desc_size = sizeof(struct dma_extended_desc);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			desc_size = sizeof(struct dma_edesc);
-		else
-			desc_size = sizeof(struct dma_desc);
-
 		head_tx = stmmac_get_tx_desc(priv, tx_q, 0);
+		desc_size = stmmac_get_tx_desc_size(priv, tx_q);
 
 		stmmac_display_ring(priv, head_tx, dma_conf->dma_tx_size, false,
 				    tx_q->dma_tx_phy, desc_size);
@@ -2186,17 +2191,14 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 	dma_free_tx_skbufs(priv, dma_conf, queue);
 
 	if (priv->extend_desc) {
-		size = sizeof(struct dma_extended_desc);
 		addr = tx_q->dma_etx;
 	} else if (tx_q->tbs & STMMAC_TBS_AVAIL) {
-		size = sizeof(struct dma_edesc);
 		addr = tx_q->dma_entx;
 	} else {
-		size = sizeof(struct dma_desc);
 		addr = tx_q->dma_tx;
 	}
 
-	size *= dma_conf->dma_tx_size;
+	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
 	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
 
@@ -2358,14 +2360,7 @@ static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
 	if (!tx_q->tx_skbuff)
 		return -ENOMEM;
 
-	if (priv->extend_desc)
-		size = sizeof(struct dma_extended_desc);
-	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		size = sizeof(struct dma_edesc);
-	else
-		size = sizeof(struct dma_desc);
-
-	size *= dma_conf->dma_tx_size;
+	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
 	addr = dma_alloc_coherent(priv->device, size,
 				  &tx_q->dma_tx_phy, GFP_KERNEL);
@@ -4333,12 +4328,7 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	int desc_size;
 
-	if (likely(priv->extend_desc))
-		desc_size = sizeof(struct dma_extended_desc);
-	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		desc_size = sizeof(struct dma_edesc);
-	else
-		desc_size = sizeof(struct dma_desc);
+	desc_size = stmmac_get_tx_desc_size(priv, tx_q);
 
 	/* The own bit must be the latest setting done when prepare the
 	 * descriptor and then barrier is needed to make sure that
-- 
2.47.3


