Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF56FD3763
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uKCYZkhoGDaIwO3TuFZmm1EbNTsTxHguDWrJZ7YEWo=; b=dmXQbggCrceBAuGhrgfrHQeABv
	rw8+zox/dF//22J1WNfUSxU9I2h3nQysDx8YNaY2hAjpKQ6TudOWI6+KodIgfk5tG2p4i1m9K5Huy
	2qZJa/GMCACFpUJldAveuQzoki/UHW6ssbeAZu35fQfnMFTrTo7RKhYu0xSj1hFDBWYdtGdZFq/lX
	a8kYVjRCgRZwBYkxCvQuFPcKfks3WUzgaQFBL83MCFt5B4W62YDuf8ze0Vo0tqpGJ/TqCnrjhh3/3
	K4jrc4GHBZij03hZYfVM1rK482YC9a8PqJfiVZHTYzbEw4BDNk7azFkTdkCOK8lL/Ibhrbgn8jvFI
	HEF9V4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFox-00000004CBV-3xWB;
	Wed, 25 Feb 2026 14:24:59 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFou-00000004C5D-1IxE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:24:58 +0000
X-CSE-ConnectionGUID: wjXg1zDVTHaep9JmLwo6EA==
X-CSE-MsgGUID: pbnM9QIVQWudH1d9Ob5JRQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Feb 2026 23:24:55 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.192])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B10104017D8D;
	Wed, 25 Feb 2026 23:24:49 +0900 (JST)
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
Subject: [PATCH net-next v2 5/5] net: stmmac: Defer VLAN HW configuration when interface is down
Date: Wed, 25 Feb 2026 14:24:14 +0000
Message-ID: <20260225142414.130144-6-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
References: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_062457_624752_FC5432DF 
X-CRM114-Status: GOOD (  16.63  )
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

VLAN register accesses on the MAC side require the PHY RX clock to be
active. When the network interface is down, the PHY is suspended and
the RX clock is unavailable, causing VLAN operations to fail with
timeouts.

The VLAN core automatically removes VID 0 after the interface goes down
and re-adds it when it comes back up, so these timeouts happen during
normal interface down/up:

    # ip link set end1 down
    renesas-gbeth 15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
    renesas-gbeth 15c40000.ethernet end1: failed to kill vid 0081/0

Adding VLANs while the interface is down also fails:

    # ip link add link end1 name end1.10 type vlan id 10
    renesas-gbeth 15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
    RTNETLINK answers: Device or resource busy

Use the write_hw parameter introduced in the previous commit to skip
hardware register writes when the interface is down. The software state
is always kept up to date regardless of interface state.

When the interface is brought up, stmmac_vlan_restore() is called
to write the VLAN state to hardware.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes:
- Split this commit - added a new commit (3/5) which fixes VLAN
  restore on resume and open paths.
- Dropped phylink_rx_clk_stop_block()/unblock() calls around VLAN restore.

 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++------
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c    |  9 ++-------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 19c86e3b42cc..1098227272ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6787,6 +6787,7 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double,
 static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	bool write_hw = netif_running(ndev);
 	unsigned int num_double_vlans;
 	bool is_double = false;
 	int ret;
@@ -6800,7 +6801,7 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 
 	set_bit(vid, priv->active_vlans);
 	num_double_vlans = priv->num_double_vlans + is_double;
-	ret = stmmac_vlan_update(priv, num_double_vlans, true);
+	ret = stmmac_vlan_update(priv, num_double_vlans, write_hw);
 	if (ret) {
 		clear_bit(vid, priv->active_vlans);
 		goto err_pm_put;
@@ -6808,10 +6809,11 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 
 	if (priv->hw->num_vlan) {
 		ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto,
-						 vid, true);
+						 vid, write_hw);
 		if (ret) {
 			clear_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, priv->num_double_vlans, true);
+			stmmac_vlan_update(priv, priv->num_double_vlans,
+					   write_hw);
 			goto err_pm_put;
 		}
 	}
@@ -6830,6 +6832,7 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vid)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	bool write_hw = netif_running(ndev);
 	unsigned int num_double_vlans;
 	bool is_double = false;
 	int ret;
@@ -6843,7 +6846,7 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 
 	clear_bit(vid, priv->active_vlans);
 	num_double_vlans = priv->num_double_vlans - is_double;
-	ret = stmmac_vlan_update(priv, num_double_vlans, true);
+	ret = stmmac_vlan_update(priv, num_double_vlans, write_hw);
 	if (ret) {
 		set_bit(vid, priv->active_vlans);
 		goto del_vlan_error;
@@ -6851,10 +6854,11 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 
 	if (priv->hw->num_vlan) {
 		ret = stmmac_del_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto,
-						 vid, true);
+						 vid, write_hw);
 		if (ret) {
 			set_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, priv->num_double_vlans, true);
+			stmmac_vlan_update(priv, priv->num_double_vlans,
+					   write_hw);
 			goto del_vlan_error;
 		}
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index f81015179d04..261bc751ade2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -147,7 +147,6 @@ static int vlan_del_hw_rx_fltr(struct net_device *dev,
 static void vlan_restore_hw_rx_fltr(struct net_device *dev,
 				    struct mac_device_info *hw)
 {
-	u32 val;
 	int i;
 
 	/* Single Rx VLAN Filter */
@@ -157,12 +156,8 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
 	}
 
 	/* Extended Rx VLAN Filter Enable */
-	for (i = 0; i < hw->num_vlan; i++) {
-		if (hw->vlan_filter[i] & VLAN_TAG_DATA_VEN) {
-			val = hw->vlan_filter[i];
-			vlan_write_filter(dev, hw, i, val);
-		}
-	}
+	for (i = 0; i < hw->num_vlan; i++)
+		vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
 }
 
 static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
-- 
2.51.0


