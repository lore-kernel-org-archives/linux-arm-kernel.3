Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AB9CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 06:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWOIGUvWc5/k8eqvv4F+PPBIK5hQj4XaARgH4NqpC/Q=; b=sGHPkO2zwG184f/q1pqWwqXUt3
	BxAuThRH0oDCICXANeXjQhoGd+kwl9SU1KBWUdAK1kCvc3cfuEvcUl9fnRJ1Ghm28aniGbqMvsWdz
	XzPmx8uRWNZRGr18+oJ64w/ZoahJI/9eaJDjtYMDxz4kYfXhfa/DeJIdGPBS+P1JU7SorfKqemWnh
	4NUJEYUjlw+B1pkGBwWUEynt3f2PeFtB2YrK+Anv0QinCOsQmEjZiWV18fwmAxZf4H0LbHS9FdARD
	+dmg1xfbS9N4ThuodQIAKyabFKys2Mak2ElFjDAJOLa/Ytg9seaCtk0PJvbgXFaY/PPqkb7Ae+GgP
	lrMkVUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUefC-0000000EM0I-3IyA;
	Wed, 03 Jun 2026 06:01:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUef9-0000000ELwi-2yOc;
	Wed, 03 Jun 2026 06:01:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E9464411D;
	Wed,  3 Jun 2026 06:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87471F0089A;
	Wed,  3 Jun 2026 06:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780466471;
	bh=pWOIGUvWc5/k8eqvv4F+PPBIK5hQj4XaARgH4NqpC/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gvTEvzcmBNfVTOyaETmejIINtm4EGF762Bh1QI2CgvMqXoZZiY2AyVuC8WM9nm55w
	 QAU/YHHEhfYCSLrRhPi7mWZkrKc9FRtue6vRXfhxGebO7ezqJrsWUVghGTMilGcSSp
	 0/Y4Y91L3v8Vmy1SFjnGBFCZrdwpPf6AQD6W+PYm5Aa4opTF+Am9oyjWc4QOyBi+yu
	 Z/2dXqCqtqudLg8DV4ufDcBl4VrCELP+6lrQABo2GLPSacPVoR0k3I5sM7GOCTwjL0
	 TYCCdDqvnlOdOUSUQEuvcqaQKFZ0hFMDUJO61Q2JFN78TzgJiULE+x2uzw+flzfMUb
	 9DbQXhYtXN5Fw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 03 Jun 2026 08:00:18 +0200
Subject: [PATCH net-next v9 4/6] net: airoha: Do not stop GDM port if it is
 shared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-airoha-eth-multi-serdes-v9-4-5d476bc2f426@kernel.org>
References: <20260603-airoha-eth-multi-serdes-v9-0-5d476bc2f426@kernel.org>
In-Reply-To: <20260603-airoha-eth-multi-serdes-v9-0-5d476bc2f426@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_230111_797496_8BB31F6D 
X-CRM114-Status: GOOD (  19.02  )
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

Theoretically, in the current codebase, two independent net_devices can
be connected to the same GDM port so we need to check the GDM port is not
used by any other running net_device before setting the forward
configuration to FE_PSE_PORT_DROP.
Moreover, always set in GDM_LONG_LEN_MASK field of REG_GDM_LEN_CFG
register the maximum MTU of all running net_devices connected to the same
GDM port.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 59 +++++++++++++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_eth.h |  1 +
 2 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 1d088d95d5fb..44b77a5cc4c5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1720,8 +1720,8 @@ static int airoha_dev_open(struct net_device *netdev)
 	int err, len = ETH_HLEN + netdev->mtu + ETH_FCS_LEN;
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
+	u32 cur_len, pse_port = FE_PSE_PORT_PPE1;
 	struct airoha_qdma *qdma = dev->qdma;
-	u32 pse_port = FE_PSE_PORT_PPE1;
 
 	netif_tx_start_all_queues(netdev);
 	err = airoha_set_vip_for_gdm_port(dev, true);
@@ -1735,10 +1735,20 @@ static int airoha_dev_open(struct net_device *netdev)
 		airoha_fe_clear(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
 				GDM_STAG_EN_MASK);
 
-	airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
-		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
-		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
-		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
+	cur_len = airoha_fe_get(qdma->eth, REG_GDM_LEN_CFG(port->id),
+				GDM_LONG_LEN_MASK);
+	if (!port->users || len > cur_len) {
+		/* Opening a sibling net_device with a larger MTU updates the
+		 * MTU of already running devices. This is required to allow
+		 * multiple net_devices with different MTUs to share the same
+		 * GDM port.
+		 */
+		airoha_fe_rmw(qdma->eth, REG_GDM_LEN_CFG(port->id),
+			      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
+			      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
+			      FIELD_PREP(GDM_LONG_LEN_MASK, len));
+	}
+	port->users++;
 
 	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
 			GLOBAL_CFG_TX_DMA_EN_MASK |
@@ -1754,6 +1764,30 @@ static int airoha_dev_open(struct net_device *netdev)
 	return 0;
 }
 
+static void airoha_set_port_mtu(struct airoha_eth *eth,
+				struct airoha_gdm_port *port)
+{
+	u32 len = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(port->devs); i++) {
+		struct airoha_gdm_dev *dev = port->devs[i];
+		struct net_device *netdev;
+
+		if (!dev)
+			continue;
+
+		netdev = netdev_from_priv(dev);
+		if (netif_running(netdev))
+			len = max_t(u32, len, netdev->mtu);
+	}
+	len += ETH_HLEN + ETH_FCS_LEN;
+
+	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
+		      GDM_LONG_LEN_MASK,
+		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
+}
+
 static int airoha_dev_stop(struct net_device *netdev)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
@@ -1766,8 +1800,12 @@ static int airoha_dev_stop(struct net_device *netdev)
 	for (i = 0; i < netdev->num_tx_queues; i++)
 		netdev_tx_reset_subqueue(netdev, i);
 
-	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
-				    FE_PSE_PORT_DROP);
+	if (--port->users)
+		airoha_set_port_mtu(dev->eth, port);
+	else
+		airoha_set_gdm_port_fwd_cfg(qdma->eth,
+					    REG_GDM_FWD_CFG(port->id),
+					    FE_PSE_PORT_DROP);
 
 	if (atomic_dec_and_test(&qdma->users)) {
 		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
@@ -1922,13 +1960,10 @@ static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
-	u32 len = ETH_HLEN + mtu + ETH_FCS_LEN;
-	struct airoha_eth *eth = dev->eth;
 
-	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
-		      GDM_LONG_LEN_MASK,
-		      FIELD_PREP(GDM_LONG_LEN_MASK, len));
 	WRITE_ONCE(netdev->mtu, mtu);
+	if (port->users)
+		airoha_set_port_mtu(dev->eth, port);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 92fd81bb9269..666e9246e70e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -554,6 +554,7 @@ struct airoha_gdm_dev {
 struct airoha_gdm_port {
 	struct airoha_gdm_dev *devs[AIROHA_MAX_NUM_GDM_DEVS];
 	int id;
+	int users;
 
 	struct airoha_hw_stats stats;
 

-- 
2.54.0


