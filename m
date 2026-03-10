Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0FEEB105A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vAuXFE6SQ6ahZ8jbVQg2624wAFWJM5XMUjKARgfeT7I=; b=yxb2hMihjgOkr8BY17radhmVjS
	u+yoKBsMgh/9qLyZThLVoiWBznq9bJHtRTKZb/hx0AxUy6Y5gjdAuYmPfVquF6Gtwdvx8RztL/eq8
	QxRuBstwpQUrWbEkXAn/50941mnm89RnXSzhF9bsoik5QEhl6MVIGvsfyPnWMZ/qfzByGJZ1RvJc6
	OLQLhErMQb/bzLfehI6JkrGHabZ1dB+rm0HGzEbPJeHEuHNOXokDmetNe2wgnZ++u/bmeRBLIqye0
	NxO4wYGnaVDz3S1La7RCqPdAqd+Iu4umWddjU4ryWH8Q7GZ8egA/XGSLwhWXaAUJZCxX3qL2NGrIx
	yELWG2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyMh-00000009j7E-41l7;
	Tue, 10 Mar 2026 14:47:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyMg-00000009j75-1vBQ;
	Tue, 10 Mar 2026 14:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8992160126;
	Tue, 10 Mar 2026 14:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CFDC19423;
	Tue, 10 Mar 2026 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773154037;
	bh=BfbSFgreWiIQp6vhNWoyJ3zBM1Hl+T/lGWmkHzyJQyM=;
	h=From:Date:Subject:To:Cc:From;
	b=Dx24Uj8hsLn46ThSQMA2cMAwMvcFgW5G41kDLuikgo5F+QsEFhhHVscq6NeVDMHvp
	 GGBcIhYHAhdDdMkKRA0zL7abaq/VYSAV1gBBsCH6PwMb0evo/CPo/Opu+E8LGGpIB1
	 wist/aS+MXSMsSTU+AVDZAtINkF1C9cDWRPObFv6atdC6tiRoTsA+cmjxH6lz2eiyh
	 jlZGfnd9sGePZoDs7JwJOqry1PnFkMr2VvlC/HpI4dskFBRZiXIi+WTN2sAw6DWr+Y
	 xH7jzhefqrZTaFluiQbqjGkd9LpQ4DX3lbBQKTMKnY29428YOJqaM96ljIS2K+mhWt
	 ulM2UB5hHdSCw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 10 Mar 2026 15:46:53 +0100
Subject: [PATCH net-next] net: airoha: select QDMA block according LAN/WAN
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-airoha-qdma-lan-wan-mode-v1-1-64ec74dea872@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MsQqEMBAFf0W2diEmYOGviMViXnRBEy+BU5D8+
 4Urpphi5qWCrCg0dS9lfLVoik2GvqN1l7iB1Tcna+xo3GBYNKdd+ONP4UMi340zefDovLMWCAi
 OWn5lBH3+63mp9Qdg8uBtagAAAA==
X-Change-ID: 20260310-airoha-qdma-lan-wan-mode-63d322eefef3
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Select the QDMA block used to send the traffic to host cpu according to
LAN/WAN port confiugration:
- QDMA0 is used for LAN devices
- QDMA1 is used for WAN devices

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 18 ++++++++----------
 drivers/net/ethernet/airoha/airoha_eth.h |  1 +
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 3e9ec5c178f86fdd055e079078a23461edf97951..b4563b5d53bbf174d45548a5efc6fdfb79d33c19 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1754,11 +1754,13 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 static int airoha_dev_init(struct net_device *dev)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
-	struct airoha_qdma *qdma = port->qdma;
-	struct airoha_eth *eth = qdma->eth;
+	struct airoha_eth *eth = port->eth;
 	u32 fe_cpu_port;
 	u8 ppe_id;
 
+	/* QDMA0 is used for lan ports while QDMA1 is used for WAN ports */
+	port->qdma = &eth->qdma[!airoha_is_lan_gdm_port(port)];
+	port->dev->irq = port->qdma->irq_banks[0].irq;
 	airoha_set_macaddr(port, dev->dev_addr);
 
 	switch (port->id) {
@@ -1782,7 +1784,7 @@ static int airoha_dev_init(struct net_device *dev)
 		}
 		fallthrough;
 	default: {
-		u8 qdma_id = qdma - &eth->qdma[0];
+		u8 qdma_id = port->qdma - &eth->qdma[0];
 
 		/* For PPE1 select cpu port according to the running QDMA. */
 		fe_cpu_port = qdma_id ? FE_PSE_PORT_CDM2 : FE_PSE_PORT_CDM1;
@@ -2866,11 +2868,10 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 }
 
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
-				 struct device_node *np, int index)
+				 struct device_node *np)
 {
 	const __be32 *id_ptr = of_get_property(np, "reg", NULL);
 	struct airoha_gdm_port *port;
-	struct airoha_qdma *qdma;
 	struct net_device *dev;
 	int err, p;
 	u32 id;
@@ -2901,7 +2902,6 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 		return -ENOMEM;
 	}
 
-	qdma = &eth->qdma[index % AIROHA_MAX_NUM_QDMA];
 	dev->netdev_ops = &airoha_netdev_ops;
 	dev->ethtool_ops = &airoha_ethtool_ops;
 	dev->max_mtu = AIROHA_MAX_MTU;
@@ -2913,7 +2913,6 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	dev->features |= dev->hw_features;
 	dev->vlan_features = dev->hw_features;
 	dev->dev.of_node = np;
-	dev->irq = qdma->irq_banks[0].irq;
 	SET_NETDEV_DEV(dev, eth->dev);
 
 	/* reserve hw queues for HTB offloading */
@@ -2934,7 +2933,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	port = netdev_priv(dev);
 	u64_stats_init(&port->stats.syncp);
 	spin_lock_init(&port->stats.lock);
-	port->qdma = qdma;
+	port->eth = eth;
 	port->dev = dev;
 	port->id = id;
 	eth->ports[p] = port;
@@ -3034,7 +3033,6 @@ static int airoha_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_start_napi(&eth->qdma[i]);
 
-	i = 0;
 	for_each_child_of_node(pdev->dev.of_node, np) {
 		if (!of_device_is_compatible(np, "airoha,eth-mac"))
 			continue;
@@ -3042,7 +3040,7 @@ static int airoha_probe(struct platform_device *pdev)
 		if (!of_device_is_available(np))
 			continue;
 
-		err = airoha_alloc_gdm_port(eth, np, i++);
+		err = airoha_alloc_gdm_port(eth, np);
 		if (err) {
 			of_node_put(np);
 			goto error_napi_stop;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 59ed7569f7c33620ea694ec52384a37e1917eaf8..8cfa94ec084a16d6b2d3c94c404f25904c1150e3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -533,6 +533,7 @@ struct airoha_qdma {
 
 struct airoha_gdm_port {
 	struct airoha_qdma *qdma;
+	struct airoha_eth *eth;
 	struct net_device *dev;
 	int id;
 

---
base-commit: 89fe91c65992a37863241e35aec151210efc53ce
change-id: 20260310-airoha-qdma-lan-wan-mode-63d322eefef3

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


