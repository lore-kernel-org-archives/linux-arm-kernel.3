Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF66EF4ECB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 10:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYmqSeO1KSVshB+ZeFm+TZoDgFiMv5apz0qj8kroaAA=; b=Vxy9GJGSUMBH3Bayg9gvgND0FL
	Zs/xcQ0EKM0Qn1/OGUjGxAB6+Pf70/R9cL5WN9/FZsTWuJYcajpqs1hUCXNzDy56fNq5Cr/NtQ+tT
	8W8muEztn6OHYVt1E9AfGq74zqIujk/iUCr/wpfBAeTZbuSsorLcktZQITwQSwSnNaVNupnWpMiyD
	C4PYhgYrWhjl5sMFMZAXTERU2JYcp1X2p9gU+wg6qeMzpO5bkr9/aw93/6zozTEaF91F918T4Kg0k
	dbdhWqmxFwnyfSft6sEQv8c4OVruS/cY+ptCDbCABJ60M35zhfxpE29FX0Jfixdp1PsL/hy97tY7l
	lTMk3xFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hIH-0000000515O-3qUN;
	Mon, 06 Apr 2026 10:34:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hIH-0000000514k-1cFp;
	Mon, 06 Apr 2026 10:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD5C460103;
	Mon,  6 Apr 2026 10:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FF2C4CEF7;
	Mon,  6 Apr 2026 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471696;
	bh=24QybONLSULPujbEyYxPmLfX9/i2FaVu9f7Sw/XmRpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XVJ9imZfjseY5hYJl/k7rGVmDibqUfi7NRNql+RUn4lqzo3zCmoOSMVDvvQxmXZsC
	 vvWmeD00rat6Culpxw9rUzBq3qQvf9rG5bhFOjf7FvNbCO98CQAop4ZydR7HQpeBa3
	 KCZHILWomCO3KIahICd7EH/iE49mzP+Cay0AahLmjOhtjndUv9QMjt1oQSfjC5sQou
	 xrzfL1F2RBnPYltdr3VXh1bhA+MetrkeQ5AmFaQjE6XH5Q+E7+H7XcinAUmRcAGtIG
	 BAhvktmWjMyliks1uXhycejaW3eAe8HI/U5gT3daqmqwYnWtJsfowOcA47p3u9bgai
	 TJUqfE/zjXajQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 06 Apr 2026 12:34:07 +0200
Subject: [PATCH net-next v3 02/12] net: airoha: Set PPE cpu port for GDM2
 if loopback is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-airoha-eth-multi-serdes-v3-2-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
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

Add missing PPE cpu port configuration for GDM2 if QoS loopback is enabled
for GDM3 or GDM4 ports. Similar to commit 'f44218cd5e6a ("net: airoha:
Reset PPE cpu port configuration in airoha_ppe_hw_init()"), this patch is
fixing an issue not visible to the user (so we do not need to backport it)
since airoha_eth driver currently supports just the internal phy available
via the MT7530 DSA switch and there are no WAN interfaces officially
supported since PCS/external phy is not merged mainline yet (it will be
posted with following patches).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 ++++++--
 drivers/net/ethernet/airoha/airoha_eth.h | 3 ++-
 drivers/net/ethernet/airoha/airoha_ppe.c | 6 +++---
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8b070dadca11..4b5581596043 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1730,7 +1730,7 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 {
 	struct airoha_eth *eth = port->qdma->eth;
 	u32 val, pse_port, chan, nbq;
-	int src_port;
+	int i, src_port;
 
 	/* Forward the traffic to the proper GDM port */
 	pse_port = port->id == AIROHA_GDM3_IDX ? FE_PSE_PORT_GDM3
@@ -1774,6 +1774,9 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 		      SP_CPORT_MASK(val),
 		      __field_prep(SP_CPORT_MASK(val), FE_PSE_PORT_CDM2));
 
+	for (i = 0; i < eth->soc->num_ppe; i++)
+		airoha_ppe_set_cpu_port(port, i, AIROHA_GDM2_IDX);
+
 	if (port->id == AIROHA_GDM4_IDX && airoha_is_7581(eth)) {
 		u32 mask = FC_ID_OF_SRC_PORT_MASK(nbq);
 
@@ -1812,7 +1815,8 @@ static int airoha_dev_init(struct net_device *dev)
 	}
 
 	for (i = 0; i < eth->soc->num_ppe; i++)
-		airoha_ppe_set_cpu_port(port, i);
+		airoha_ppe_set_cpu_port(port, i,
+					airoha_get_fe_port(port));
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index af29fc74165b..3088c24db26a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -651,7 +651,8 @@ int airoha_get_fe_port(struct airoha_gdm_port *port);
 bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 
-void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id);
+void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id,
+			     u8 fport);
 bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index);
 void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 			  u16 hash, bool rx_wlan);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index c057bb2d105d..2e6391f9f24b 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -85,10 +85,9 @@ static u32 airoha_ppe_get_timestamp(struct airoha_ppe *ppe)
 	return FIELD_GET(AIROHA_FOE_IB1_BIND_TIMESTAMP, timestamp);
 }
 
-void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id)
+void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id, u8 fport)
 {
 	struct airoha_qdma *qdma = port->qdma;
-	u8 fport = airoha_get_fe_port(port);
 	struct airoha_eth *eth = qdma->eth;
 	u8 qdma_id = qdma - &eth->qdma[0];
 	u32 fe_cpu_port;
@@ -174,7 +173,8 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 			if (!port)
 				continue;
 
-			airoha_ppe_set_cpu_port(port, i);
+			airoha_ppe_set_cpu_port(port, i,
+						airoha_get_fe_port(port));
 		}
 	}
 }

-- 
2.53.0


