Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477C5FD3760
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrIx1Z6mUTw+ukR2dUMomSlUxAQXxQy3pcu5PyHazsM=; b=u9E/nbOv/Vfb6AGunT22RWczM0
	C6O3oTEK63OMKz/+mPxKlFYhbrF3fOXvh3J+qdH6X3QuFJqfttIUr3aOvjkwpJwA3ZouT31C/tF1g
	2sfng1Q3312/lIN/bmq4C+Qc6SvwFeERhRMTP2Kx9bQK+PvaX9+UN/lFV9b/Jvb4jp7B4A2breyvz
	fB25OQtKWtRVDqYxtJRM6fxCmQWHdPgpPJCxMm0phzAouvi+odrBjceGUF51yri9hM8Rd7BwD68Y8
	F4oqXzW5npx7p5MhHEfbaql5nspmkjjJ6jXWFExqnDnWv2ac1RJgkkm6VxR1JmWOUVAr3987vx8kJ
	YdxtaNdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFoj-00000004C3h-39GV;
	Wed, 25 Feb 2026 14:24:45 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFoh-00000004C21-05hV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:24:44 +0000
X-CSE-ConnectionGUID: 1F5aL7fnRvmwWTMmby5hJg==
X-CSE-MsgGUID: mbhJ6JdbQmaEysDv/2t5cw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Feb 2026 23:24:42 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.192])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 03E174017D8D;
	Wed, 25 Feb 2026 23:24:35 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux@armlinux.org.uk,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	boon.khai.ng@altera.com,
	rohan.g.thomas@altera.com,
	vladimir.oltean@nxp.com,
	hayashi.kunihiko@socionext.com,
	boon.leong.ong@intel.com,
	kim.tatt.chuah@intel.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 3/5] net: stmmac: Fix VLAN HW state restore
Date: Wed, 25 Feb 2026 14:24:12 +0000
Message-ID: <20260225142414.130144-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
References: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_062443_178746_9188237A 
X-CRM114-Status: GOOD (  15.11  )
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

When the network interface is opened or resumed, a DMA reset is performed,
which resets all hardware state, including VLAN state. Currently, only
the resume path is restoring the VLAN state via
stmmac_restore_hw_vlan_rx_fltr(), but that is incomplete: the VLAN hash
table and the VLAN_TAG control bits are not restored.

Therefore, add stmmac_vlan_restore(), which restores the full VLAN
state by updating both the HW filter entries and the hash table, and
call it from both the open and resume paths.

The VLAN restore is moved outside of phylink_rx_clk_stop_block/unblock
in the resume path because receive clock stop is already disabled when
stmmac supports VLAN.

Also, remove the hash readback code in vlan_restore_hw_rx_fltr() that
attempts to restore VTHM by reading VLAN_HASH_TABLE, as it always reads
zero after DMA reset, making it dead code.

Fixes: 3cd1cfcba26e ("net: stmmac: Implement VLAN Hash Filtering in XGMAC")
Fixes: ed64639bc1e0 ("net: stmmac: Add support for VLAN Rx filtering")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes: new patch.

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 +++++++++++++++++--
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 10 --------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 45f2f3492dbd..a02575f67057 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -156,6 +156,7 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue);
 static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue);
 static void stmmac_set_dma_operation_mode(struct stmmac_priv *priv, u32 txmode,
 					  u32 rxmode, u32 chan);
+static int stmmac_vlan_restore(struct stmmac_priv *priv);
 
 #ifdef CONFIG_DEBUG_FS
 static const struct net_device_ops stmmac_netdev_ops;
@@ -4111,6 +4112,8 @@ static int __stmmac_open(struct net_device *dev,
 
 	phylink_start(priv->phylink);
 
+	stmmac_vlan_restore(priv);
+
 	ret = stmmac_request_irq(dev);
 	if (ret)
 		goto irq_error;
@@ -6857,6 +6860,23 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 	return ret;
 }
 
+static int stmmac_vlan_restore(struct stmmac_priv *priv)
+{
+	int ret;
+
+	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
+		return 0;
+
+	if (priv->hw->num_vlan)
+		stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
+
+	ret = stmmac_vlan_update(priv, priv->num_double_vlans);
+	if (ret)
+		netdev_err(priv->dev, "Failed to restore VLANs\n");
+
+	return ret;
+}
+
 static int stmmac_bpf(struct net_device *dev, struct netdev_bpf *bpf)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -8281,10 +8301,10 @@ int stmmac_resume(struct device *dev)
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_rx_mode(ndev);
-
-	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
 	phylink_rx_clk_stop_unblock(priv->phylink);
 
+	stmmac_vlan_restore(priv);
+
 	stmmac_enable_all_queues(priv);
 	stmmac_enable_all_dma_irq(priv);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index de1a70e1c86e..fcc34867405e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -139,9 +139,6 @@ static int vlan_del_hw_rx_fltr(struct net_device *dev,
 static void vlan_restore_hw_rx_fltr(struct net_device *dev,
 				    struct mac_device_info *hw)
 {
-	void __iomem *ioaddr = hw->pcsr;
-	u32 value;
-	u32 hash;
 	u32 val;
 	int i;
 
@@ -158,13 +155,6 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
 			vlan_write_filter(dev, hw, i, val);
 		}
 	}
-
-	hash = readl(ioaddr + VLAN_HASH_TABLE);
-	if (hash & VLAN_VLHT) {
-		value = readl(ioaddr + VLAN_TAG);
-		value |= VLAN_VTHM;
-		writel(value, ioaddr + VLAN_TAG);
-	}
 }
 
 static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
-- 
2.51.0


