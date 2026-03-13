Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923AA107BCCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r7kxCwfDRwI+tNs9J9TlgCVBRvf2s9ZxZyAXU4E5xVg=; b=KzkKZ1tkoiV84i/lWhjBNJM1WL
	NjduJCDWGksk2GLrmtbsKEiHUm3X5kHH4qMxnKAPgn8Ke5Cjkbn8f/q56whQQDlTju73JCyPNFBzQ
	7A0rzd+hrmcAvdC49+0HIFn6fKaeFkoMQb6qjs7i3FN8fGDokyZLDiLberh3Dc+zLkAwTFVpyduOa
	3yWWFI0AnrfZAbSQ/HTnzSMbq8d+KZ79VH2xyGsQVfjMfl3zzML7ihr5xdyh3ZThxQhkVnWLPN6m9
	UX4VKQmV9if+7QF785CwfXHFyX3n/a6LFIQqnrx9mykDCvvwMCYPBxVMjEfRUugFHqT4yGBtbuWEo
	6JMJS+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Na-00000000eE2-3n8p;
	Fri, 13 Mar 2026 16:28:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15NY-00000000eDM-1G5m;
	Fri, 13 Mar 2026 16:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01CCC44380;
	Fri, 13 Mar 2026 16:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A123C2BC86;
	Fri, 13 Mar 2026 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773419327;
	bh=xz7HYdb1hOl3DJa7Hqbhm8rgb1ssw/IvqbgQXX1MSR0=;
	h=From:Date:Subject:To:Cc:From;
	b=mPTb0cvQTn1Ic7HMQNrbdhW0F0J3mGvt9sPq0HU4KoFUVESW0gec6WNmKNGwbqNrG
	 Pc65+HAUvKC3l5t+ofY1hK1rrWJ8QCdl2rUICk/QaoEH1TEzvYubUcfDYB1UjkBdcJ
	 ug8twP4qhw87Y/gYxX5vQFOa74WP53kkp4FTazRDZSx2pchqGwyE7EFkw3UY5kT1lG
	 zXBqfdl7gpOEL5WkcchQbZgoIUaqs+f4p5NXZKoYB3NO/TKwk1QNWc+DHbWLsrFvwQ
	 3eqsOhSvzu4D/zwtlX0ZhWKuXT/XdguYwlG6bM/HFZ0L3RoiV0dBjtxCpSYOgKdgDY
	 fSwMeLXLdomAA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 13 Mar 2026 17:28:36 +0100
Subject: [PATCH net-next v2] net: airoha: select QDMA block according
 LAN/WAN configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-airoha-qdma-lan-wan-mode-v2-1-7d577db6e40c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBREr2L+2m9oS8C48h6GRUMH+BFabQliC
 He34QIuZvEymTcbJURBottpo4hFkgSfQZ9P1A7W92BxmUkXuiqMKthKDIPlt5ssj9bzJ2cKDlw
 ZZ7QGOnSG8vwV0cl6qB/kMbPHOlOTm0HSHOL3+FzU0f/XL4oVVyXaunSw11rfn4ge4yXEnpp93
 3/oxCE4ywAAAA==
X-Change-ID: 20260310-airoha-qdma-lan-wan-mode-63d322eefef3
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_092848_387198_DDD6F310 
X-CRM114-Status: GOOD (  19.10  )
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

Before this patch even GDM ports were assigned to QDMA0 while odd GDM
ports were using QDMA1, so, based on the DTS configuration, both QDMA0
and QDMA1 can theoretically receive traffic destinated to the host cpu
from LAN or WAN GDM ports.
Airoha folks reported the hw design assumes the LAN traffic destinated
to the host cpu is be forwarded to QDMA0 while traffic received on WAN
GDM port is managed by QDMA1. For this reason, select QDMA block according
to the GDM port LAN or WAN configuration:
- QDMA0 is used for GDM LAN devices
- QDMA1 is used for GDM WAN device

Assuming a device with three GDM ports, a typical configuration could be:
- MT7530 DSA switch -> GDM1 (eth0) -> QDMA0 (LAN traffic)
- External PHY      -> GDM2 (eth1) -> QDMA1 (WAN traffic)
- External PHY      -> GDM3 (eth2) -> QDMA0 (LAN traffic)

We can then bridge eth0 DSA port (lanX) with eth2 since they all tx/rx
LAN traffic.

Please note this patch introduces a change not visible to the user since
airoha_eth driver currently supports just the internal phy available via
the MT7530 DSA switch and there are no WAN interfaces officially supported
since PCS/external phy is not merged mainline yet (it will be posted with
following patches).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Update commit log.
- Link to v1: https://lore.kernel.org/r/20260310-airoha-qdma-lan-wan-mode-v1-1-64ec74dea872@kernel.org
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
base-commit: 8f921f61005450589c0bc1a941a5ddde21d9aed9
change-id: 20260310-airoha-qdma-lan-wan-mode-63d322eefef3

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


