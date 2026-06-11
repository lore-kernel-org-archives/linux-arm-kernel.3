Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9EDCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 21:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTEwU+X4CO3t0uj+sa+dX/WlP4z2O2FfvpMB35ZZWFs=; b=gKekNKPS3bzpcz/kW2l+Tb6+xg
	HGobyK0hwt15r/TKinCanStFyMSHkM4+N6rCelLv17ScvBYk7bCQm4ODUGqBgxz6Cr3m9v3VFuCW1
	Y09gdtqMH4FpjZ+LjeV/IpAW9NfS3J8w/t/VfWH/N43mhdhXovy18x69fVUrTxCC6s4cguQDlGUby
	CR4BisLBO+gziDfYv+0+Wo1iGp+eEjivkhk2O98Mj0iJ2zkaOY1O/fbutvFJvGIUkfXgTRM9rsb4B
	R1bw0xnB4IAOWopV2S+JlZEYnogi4mcv3y+8xA5HQ7291p7S7uy/9xB11Gh7aPtSgbaXzYPtc8aGD
	a0ra/Jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnNy-0000000A76n-1ztb;
	Thu, 11 Jun 2026 21:56:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnNu-0000000A73I-0htj;
	Thu, 11 Jun 2026 21:56:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E853741531;
	Thu, 11 Jun 2026 21:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DEE1F00A3D;
	Thu, 11 Jun 2026 21:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781214981;
	bh=rTEwU+X4CO3t0uj+sa+dX/WlP4z2O2FfvpMB35ZZWFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lTMU/tP7ZM3u0j1bz4PFkWVibbRMYRL6JZAO8qnsfCunB7MI/mhfsV+ztCqR7LW0Z
	 XPGG3+LAnol7R+ek97CvGa7zeBxd45Obckt3m2hUWZDNWIz51/4DW3RckTMCTNQDvv
	 UNFqOnI51MurIwMwt7XeFzyxjjmyrfPXflEAjDGeecGVuxMNBTBphHq7iM+sb0UZVE
	 rr7jbq1YVIO8iXVvo2NoQ2Jvv6Kc3pJbNT1QP/7bt5bh82Z3RkP9pby+woN0B6LVbE
	 eY0FEFCKp0mx5oteFxOBSg2yJBpk8Tk7UqcIGUdlAqFUug1hIm9dqPtbIkpuQB0lZY
	 bGdVhsOjzk+ig==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 11 Jun 2026 23:55:52 +0200
Subject: [PATCH net-next v5 2/3] net: airoha: refactor QDMA start/stop into
 reusable helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-airoha-ethtool-priv_flags-v5-2-c11de08486d1@kernel.org>
References: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
In-Reply-To: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Madhur Agrawal <madhur.agrawal@airoha.com>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>
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
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 53 ++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 9eb9b6a139b3..72ec6c888948 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1774,6 +1774,40 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 	spin_unlock(&port->stats.lock);
 }
 
+static void airoha_qdma_start(struct airoha_qdma *qdma)
+{
+	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
+			GLOBAL_CFG_TX_DMA_EN_MASK |
+			GLOBAL_CFG_RX_DMA_EN_MASK);
+	qdma->users++;
+}
+
+static void airoha_qdma_stop(struct airoha_qdma *qdma)
+{
+	u32 status;
+
+	if (--qdma->users)
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
@@ -1809,10 +1843,7 @@ static int airoha_dev_open(struct net_device *netdev)
 	}
 	port->users++;
 
-	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
-			GLOBAL_CFG_TX_DMA_EN_MASK |
-			GLOBAL_CFG_RX_DMA_EN_MASK);
-	qdma->users++;
+	airoha_qdma_start(qdma);
 
 	if (!airoha_is_lan_gdm_dev(dev) &&
 	    airoha_ppe_is_enabled(qdma->eth, 1))
@@ -1865,19 +1896,7 @@ static int airoha_dev_stop(struct net_device *netdev)
 		airoha_set_gdm_port_fwd_cfg(qdma->eth,
 					    REG_GDM_FWD_CFG(port->id),
 					    FE_PSE_PORT_DROP);
-
-	if (!--qdma->users) {
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


