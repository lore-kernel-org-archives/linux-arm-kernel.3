Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE45CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2swTuD8KfvTTLbEuvUbdA4Gtz8qC+3kctJH8isA5Ig=; b=hop5qB8e0xf8vNKvdlHF+YD7XX
	B6quVIYlcXvkPpIRuPlgoT9jhbNoWnMRYqBMzj+I0y0JAI/cMw5HmG7Ni6JKafqacrqoyUOlhaJi6
	mv+vQKuxBs/w9TYGXW7mykQ1AB2pxNMB3RxWww9eajs232pnuiaMsVftHe9VRCMamL9imrWmbixWy
	EpducnJac1WKb7pfzp+LfRL9XZd0hOAiBD7qDn2VCiVN4WIbnO2JL81zt/shdneomTh3YhsfpHuUa
	zlH2svu6jWTWfiW+MmrP9yY9soLowi7jxfCpvSGY7OB5ptMB5WDdEM1HQ2UwPAG4yMD2k6BprFhEs
	1jNWpuvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJ4U-00000007mnS-1XDH;
	Wed, 10 Jun 2026 13:34:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJ4S-00000007mlo-1CKa;
	Wed, 10 Jun 2026 13:34:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B75456008A;
	Wed, 10 Jun 2026 13:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E681F00899;
	Wed, 10 Jun 2026 13:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781098455;
	bh=c2swTuD8KfvTTLbEuvUbdA4Gtz8qC+3kctJH8isA5Ig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dkAkY5IBJa0H60g+Dd5GekRjIxrLf2l390iTQAc1+DEsmDoZluqAPB3fJPOuYK1+n
	 k+Ia2baEqc0XMPhPWYaENYejP+E+0RYFpfOHTUNokeigulc2FY5i7SncIln5tP+4c4
	 wGfgar0/yV8K3YJevIEkXx8Nm3plf4flN65JXgu7UP9tvg+5Mj2DBxMXw0v9IG7q4w
	 ag+3FjABlKQkjCkJL4mBooTHVxmExwWb5CzcZlbMiwtmNazW7cXzWc9qwcCd09XKn0
	 uZRWLzr44rIaKo/nW9DkSLZYQz5y8952SBv5pWtvry1g9toLPVMXtsN2iRDhFbIywa
	 qYW8QOWobCF/g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 10 Jun 2026 15:33:36 +0200
Subject: [PATCH net-next v4 1/2] net: airoha: refactor QDMA start/stop into
 reusable helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-airoha-ethtool-priv_flags-v4-1-60e89cf28fea@kernel.org>
References: <20260610-airoha-ethtool-priv_flags-v4-0-60e89cf28fea@kernel.org>
In-Reply-To: <20260610-airoha-ethtool-priv_flags-v4-0-60e89cf28fea@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Madhur Agrawal <madhur.agrawal@airoha.com>
X-Mailer: b4 0.14.3
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

Factor out airoha_qdma_start() and airoha_qdma_stop() from
airoha_dev_open() and airoha_dev_stop(). These helpers will be reused
by the QDMA hot-migration logic introduced in the next patch to
dynamically switch GDM3/GDM4 ports between LAN and WAN QDMA blocks.
Add a DMA engine busy poll in airoha_qdma_stop() to wait for in-flight
DMA transfers to complete before cleaning up TX queues.

Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 53 ++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5a8e84fa9918..aeac66df5f3b 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1771,6 +1771,40 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 	spin_unlock(&port->stats.lock);
 }
 
+static void airoha_qdma_start(struct airoha_qdma *qdma)
+{
+	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
+			GLOBAL_CFG_TX_DMA_EN_MASK |
+			GLOBAL_CFG_RX_DMA_EN_MASK);
+	atomic_inc(&qdma->users);
+}
+
+static void airoha_qdma_stop(struct airoha_qdma *qdma)
+{
+	u32 status;
+
+	if (!atomic_dec_and_test(&qdma->users))
+		return;
+
+	airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
+			  GLOBAL_CFG_TX_DMA_EN_MASK |
+			  GLOBAL_CFG_RX_DMA_EN_MASK);
+
+	if (read_poll_timeout(airoha_qdma_rr, status,
+			      !(status & (GLOBAL_CFG_TX_DMA_BUSY_MASK |
+					  GLOBAL_CFG_RX_DMA_BUSY_MASK)),
+			      USEC_PER_MSEC, 50 * USEC_PER_MSEC, true,
+			      qdma, REG_QDMA_GLOBAL_CFG))
+		dev_warn(qdma->eth->dev, "QDMA DMA engine busy timeout\n");
+
+	for (int i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
+		if (!qdma->q_tx[i].ndesc)
+			continue;
+
+		airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
+	}
+}
+
 static int airoha_dev_open(struct net_device *netdev)
 {
 	int err, len = ETH_HLEN + netdev->mtu + ETH_FCS_LEN;
@@ -1806,10 +1840,7 @@ static int airoha_dev_open(struct net_device *netdev)
 	}
 	port->users++;
 
-	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
-			GLOBAL_CFG_TX_DMA_EN_MASK |
-			GLOBAL_CFG_RX_DMA_EN_MASK);
-	atomic_inc(&qdma->users);
+	airoha_qdma_start(qdma);
 
 	if (!airoha_is_lan_gdm_dev(dev) &&
 	    airoha_ppe_is_enabled(qdma->eth, 1))
@@ -1862,19 +1893,7 @@ static int airoha_dev_stop(struct net_device *netdev)
 		airoha_set_gdm_port_fwd_cfg(qdma->eth,
 					    REG_GDM_FWD_CFG(port->id),
 					    FE_PSE_PORT_DROP);
-
-	if (atomic_dec_and_test(&qdma->users)) {
-		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
-				  GLOBAL_CFG_TX_DMA_EN_MASK |
-				  GLOBAL_CFG_RX_DMA_EN_MASK);
-
-		for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
-			if (!qdma->q_tx[i].ndesc)
-				continue;
-
-			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
-		}
-	}
+	airoha_qdma_stop(qdma);
 
 	return 0;
 }

-- 
2.54.0


