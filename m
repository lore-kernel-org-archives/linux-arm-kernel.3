Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91903F327C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h5qgamQh+jPgJ1Emn+TKK5MC4m+XUZLyTR/uBaXk5LU=; b=iefCQ7dWrcvgSY68DYqHv3mReZ
	4JxlhpJvFL0JA97hXjlT5Ujm3PUxU5wOCpWXtbA+pAOGaYP3PvXsC9WVOVIt3cesvkQap/PlArOL4
	E+abZ0AjC9pSAXNOVh99Xyj/znxD+o+CTVYE0nYyJyGbk69wfSe7LW+lBLRyCxITtuV7mfa1K6rMS
	ZDrttY+4j39nXmg4uJbpMs2zoZ6CVEVT66rHqYeJWWvIwaKM/45rqCx2ZHxF2fyTygb5EcIlM4x9p
	ta6md4BCzLq8xDWzSPB8AaG49pjVEDwUEzPDRyQvyDMXpIntnLDJax9vO6AOi+c4vFAA/VQ/Nx9SD
	zeTe2edQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6rZ-00000008HZt-176D;
	Tue, 21 Apr 2026 08:53:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6rX-00000008HZS-2xMK;
	Tue, 21 Apr 2026 08:53:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D253E600AE;
	Tue, 21 Apr 2026 08:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1DFC2BCB5;
	Tue, 21 Apr 2026 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776761622;
	bh=aZT8+RjuUD+glDzBq4Jw2xxfNL/4kIryQSIGXkNI1xI=;
	h=From:Date:Subject:To:Cc:From;
	b=gtgE3DSZmxbKHqvljeBTE4VkSpsaCQcfqK77jf8BpxOBJu2+QcK+1UCw8KZwAH7X1
	 cjWp8o/bVOL04vJtwowMv5M5XiXfPAt0n9G4JjcyapBl5LjFIaHsWpYldijXROhO5i
	 oRVDl9vQcd8p2yTh8rKvmElBh64sYRjdQohWHX1zBGJ3CVbJSKZlT9IgCIVVhQUZ/x
	 KtOXjgFFtg3ZcamjhkMvXuQES9je+AtuPqLrrtJpNLAv67310o9jhXVY9SzOkNgFPB
	 Mn7+HK9lXOMaLueRs4KZrp1wPFpI3L34+WlRUsqYLfhuTqlNmo3GNUax7uXlehTo5i
	 SyCAnt4583wwQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 21 Apr 2026 10:53:33 +0200
Subject: [PATCH net] net: airoha: Do not wake all netdev TX queues in
 airoha_qdma_wake_netdev_txqs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-airoha-wake_netdev_txqs-optmization-v1-1-e0be95115d53@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQrCMBAFf6Xs2YUm1Ar+ikhZm6ddxKQmoRZL/
 93F4xxmZqOCrCh0bjbKWLRoigbu0NA4SXyANRiTb33fdt6xaE6T8EeeGCJqwDLU9V04zfWlX6n
 mc390Jzeiw00CWWnOuOv6v1zIJLru+w8sfKiDegAAAA==
X-Change-ID: 20260421-airoha-wake_netdev_txqs-optmization-65171ce4ebad
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

Do not wake every netdev TX queue across all ports sharing the QDMA
running netif_tx_wake_all_queues routine in airoha_qdma_wake_netdev_txqs()
but only the ones that are mapped the specific QDMA stopped hw TX queue.
This patch can potentially avoid waking already stopped netdev TX queues
that are mapped to a different QDMA hw TX queue.
Introduce airoha_qdma_get_txq utility routine.

Fixes: b94769eb2f30 ("net: airoha: Fix possible TX queue stall in airoha_qdma_tx_napi_poll()")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 19 +++++++++++++++----
 drivers/net/ethernet/airoha/airoha_eth.h |  5 +++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 19f67c7dd8e1..2ca569501045 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -847,13 +847,24 @@ static void airoha_qdma_wake_netdev_txqs(struct airoha_queue *q)
 {
 	struct airoha_qdma *qdma = q->qdma;
 	struct airoha_eth *eth = qdma->eth;
-	int i;
+	int i, qid = q - &qdma->q_tx[0];
 
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
+		int j;
+
+		if (!port)
+			continue;
 
-		if (port && port->qdma == qdma)
-			netif_tx_wake_all_queues(port->dev);
+		if (port->qdma != qdma)
+			continue;
+
+		for (j = 0; j < port->dev->num_tx_queues; j++) {
+			if (airoha_qdma_get_txq(qdma, j) != qid)
+				continue;
+
+			netif_wake_subqueue(port->dev, j);
+		}
 	}
 	q->txq_stopped = false;
 }
@@ -1965,7 +1976,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	u16 index;
 	u8 fport;
 
-	qid = skb_get_queue_mapping(skb) % ARRAY_SIZE(qdma->q_tx);
+	qid = airoha_qdma_get_txq(qdma, skb_get_queue_mapping(skb));
 	tag = airoha_get_dsa_tag(skb, dev);
 
 	msg0 = FIELD_PREP(QDMA_ETH_TXMSG_CHAN_MASK,
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 87b328cfefb0..c3ea7aadbd82 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -631,6 +631,11 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val);
 #define airoha_qdma_clear(qdma, offset, val)			\
 	airoha_rmw((qdma)->regs, (offset), (val), 0)
 
+static inline u16 airoha_qdma_get_txq(struct airoha_qdma *qdma, u16 qid)
+{
+	return qid % ARRAY_SIZE(qdma->q_tx);
+}
+
 static inline bool airoha_is_lan_gdm_port(struct airoha_gdm_port *port)
 {
 	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.

---
base-commit: a663bac71a2f0b3ac6c373168ca57b2a6e6381aa
change-id: 20260421-airoha-wake_netdev_txqs-optmization-65171ce4ebad

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


