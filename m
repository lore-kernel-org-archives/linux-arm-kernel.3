Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF28FCD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLCXk0TQ7fVhK9/Q31nY4LQgxOa9Jfs1ePzS0PeoKnY=; b=Tg6Zr+ceFP+rsfyJe7okjbQHxN
	sZZoVujStlpq4jKguNsN3np1kPMKtwLVgPHRTYcZLJut2yAHLJ++wW6RpJhmeDZFmY2MuRvadyYzY
	DCk4CxKb4f4vEXcK8mRo/iV1Zti0VnIeFaHCOO9E6f5DP3EyRZUSObcG+aDE2weu+97Wb9PnKcHgd
	v5JqkG7dBsOxVxNG0E+B0XjwoPajxNa4xM+e4v6gPs2lCiiV2i66sJnFYQ43h2NkQVYueO6Fw7oaE
	fgFM+q5pSfPfy7T4jHuuXsvfAIjeR1X3o/Aj8XfuHR+Oi8URGSDjS7Oo2TnJZrIes7cQchGrbLgNq
	tQ3vaGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhO1-00000008yx8-1qSi;
	Sat, 09 May 2026 13:06:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhNv-00000008ynx-1pyS;
	Sat, 09 May 2026 13:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1690043C56;
	Sat,  9 May 2026 13:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89663C2BCF6;
	Sat,  9 May 2026 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778331982;
	bh=cK1fia3EzhBFu/WA70CWg7XNRfwVE9hiVkk4QccYxqw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uFlTs1p73qKBnEXopbVwx3lcPWzpB0qLMqvpuxalTGuKc97r49pYy3F+IpIt6x88A
	 F8an6cxexdQepK24mSNZ5t05Mq7J169ZhIy2LofsCZw2c4WUNEDMKorwuKN+qAPBIU
	 VNJMq+BTBs4D/U4ajLreuf7/F+svHPw4oXghKEUFdWhf41PMTusBvuHv3EAEV9esQb
	 Gi87T4FyhAFw5NP65n0NJKVSpIKdvtmAp9rScabH7lMPvI8tfepngQNQZ3m/TWzD3Y
	 86wDHJh/fkT9Yj/kI155UzybkVVE3wzddr4SAzKaOjo1muC+/UOC0VzlguMxcHjzk/
	 kuLK1Oj4qF37Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 May 2026 15:05:36 +0200
Subject: [PATCH net-next v5 11/12] net: airoha: Support multiple LAN/WAN
 interfaces for hw MAC address configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-airoha-eth-multi-serdes-v5-11-805e38edc2aa@kernel.org>
References: <20260509-airoha-eth-multi-serdes-v5-0-805e38edc2aa@kernel.org>
In-Reply-To: <20260509-airoha-eth-multi-serdes-v5-0-805e38edc2aa@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Madhur Agrawal <madhur.agrawal@airoha.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_060623_610239_80697656 
X-CRM114-Status: GOOD (  19.21  )
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

The EN7581 and AN7583 SoCs provide registers to configure hardware LAN/WAN
MAC addresses, used to determine whether received traffic is destined for
this host or should be forwarded to another device.
The SoC hardware design assumes all interfaces configured as LAN (or WAN)
share a common upper MAC address, which is programmed into the
REG_FE_{LAN,WAN}_MAC_H register. The lower bytes of 'local' addresses can
be expressed as a range via the REG_FE_MAC_LMIN and REG_FE_MAC_LMAX
registers.
Previously, only a single interface was considered when programming these
registers. Extend the logic to derive the correct minimum and maximum
values for REG_FE_MAC_LMIN/REG_FE_MAC_LMAX when two or more interfaces are
configured as LAN or WAN.

Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 75 +++++++++++++++++++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h |  2 +-
 drivers/net/ethernet/airoha/airoha_ppe.c |  4 +-
 3 files changed, 66 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index fa37dbd76d57..623cac42dfb7 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -71,20 +71,67 @@ static void airoha_qdma_irq_disable(struct airoha_irq_bank *irq_bank,
 	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
 }
 
-static void airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
+static int airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
 {
 	struct airoha_eth *eth = dev->eth;
-	u32 val, reg;
+	u8 ref_addr[ETH_ALEN] = {};
+	u32 reg, val, lmin, lmax;
+	int i;
+
+	lmin = (addr[3] << 16) | (addr[4] << 8) | addr[5];
+	lmax = lmin;
+
+	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
+		struct airoha_gdm_port *port = eth->ports[i];
+		int j;
+
+		if (!port)
+			continue;
+
+		for (j = 0; j < ARRAY_SIZE(port->devs); j++) {
+			struct airoha_gdm_dev *iter_dev;
+			struct net_device *netdev;
+
+			iter_dev = port->devs[j];
+			if (!iter_dev || iter_dev == dev)
+				continue;
+
+			if (airoha_is_lan_gdm_dev(iter_dev) !=
+			    airoha_is_lan_gdm_dev(dev))
+				continue;
+
+			netdev = iter_dev->dev;
+			if (netdev->reg_state != NETREG_REGISTERED)
+				continue;
+
+			ether_addr_copy(ref_addr, netdev->dev_addr);
+			val = (netdev->dev_addr[3] << 16) |
+			      (netdev->dev_addr[4] << 8) | netdev->dev_addr[5];
+			if (val < lmin)
+				lmin = val;
+			if (val > lmax)
+				lmax = val;
+		}
+	}
+
+	if (!is_zero_ether_addr(ref_addr) && memcmp(ref_addr, addr, 3)) {
+		/* According to the HW design, hw mac address MS bits
+		 * must be the same for each net_device with the same
+		 * LAN/WAN configuration.
+		 */
+		return -EINVAL;
+	}
 
 	reg = airoha_is_lan_gdm_dev(dev) ? REG_FE_LAN_MAC_H : REG_FE_WAN_MAC_H;
 	val = (addr[0] << 16) | (addr[1] << 8) | addr[2];
 	airoha_fe_wr(eth, reg, val);
 
-	val = (addr[3] << 16) | (addr[4] << 8) | addr[5];
-	airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), val);
-	airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), val);
+	airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), lmin);
+	airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), lmax);
 
-	airoha_ppe_init_upd_mem(dev);
+	airoha_ppe_init_upd_mem(dev, addr);
+
+	return 0;
 }
 
 static void airoha_set_gdm_port_fwd_cfg(struct airoha_eth *eth, u32 addr,
@@ -1800,13 +1847,18 @@ static int airoha_dev_stop(struct net_device *netdev)
 static int airoha_dev_set_macaddr(struct net_device *netdev, void *p)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct sockaddr *addr = p;
 	int err;
 
-	err = eth_mac_addr(netdev, p);
+	err = eth_prepare_mac_addr_change(netdev, p);
 	if (err)
 		return err;
 
-	airoha_set_macaddr(dev, netdev->dev_addr);
+	err = airoha_set_macaddr(dev, addr->sa_data);
+	if (err)
+		return err;
+
+	eth_commit_mac_addr_change(netdev, p);
 
 	return 0;
 }
@@ -1911,6 +1963,7 @@ static int airoha_dev_init(struct net_device *netdev)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
+	int err;
 
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -1935,12 +1988,12 @@ static int airoha_dev_init(struct net_device *netdev)
 	}
 
 	airoha_dev_set_qdma(dev);
-	airoha_set_macaddr(dev, netdev->dev_addr);
+	err = airoha_set_macaddr(dev, netdev->dev_addr);
+	if (err)
+		return err;
 
 	if (!airoha_is_lan_gdm_dev(dev) &&
 	    (port->id == AIROHA_GDM3_IDX || port->id == AIROHA_GDM4_IDX)) {
-		int err;
-
 		err = airoha_set_gdm2_loopback(dev);
 		if (err) {
 			dev->flags &= ~AIROHA_PRIV_F_WAN;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 4972dffc9c62..4564a581d138 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -683,7 +683,7 @@ void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data);
 int airoha_ppe_init(struct airoha_eth *eth);
 void airoha_ppe_deinit(struct airoha_eth *eth);
-void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev);
+void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, const u8 *addr);
 u32 airoha_ppe_get_total_num_entries(struct airoha_ppe *ppe);
 struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
 						  u32 hash);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 194cd50b2c74..531ce33528b9 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1482,12 +1482,10 @@ void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 	airoha_ppe_foe_insert_entry(ppe, skb, hash, rx_wlan);
 }
 
-void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev)
+void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, const u8 *addr)
 {
 	struct airoha_gdm_port *port = dev->port;
-	struct net_device *netdev = dev->dev;
 	struct airoha_eth *eth = dev->eth;
-	const u8 *addr = netdev->dev_addr;
 	u32 val;
 
 	val = (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8) | addr[5];

-- 
2.54.0


