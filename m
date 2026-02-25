Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EF4FD3760
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fUXR1lGVBYXqfOxIR2/wIGnwl6OzcFCRofswCwPMsw=; b=GM8BS0IwCQsJ17v0gbpa+cDHqS
	8xXj2Qn7ndHV1cXd1Xq87S5CVCUDBzjsHztHkd0cwDQpOj2K9ZoVydYF1/oGlRXk6T13+r1XT10Gg
	nldSto5UMjVFVjr5IJsJ7/cAXLqOahLaWqj+W6z6mV0Q2SSZij6bbA6fV3cdDX4KKL7xkIWZYavmB
	aW/uSc6DHlGL/kPle3sNcO63irUu/oXttapRiqhUyZKJ5rRxmWUHL5xpEhwhUS5MxPXgcXuhmtvEX
	i6xEyHB0Tmd+LEBto3kKii9nrg5YdMp8ZXs2UmnxU1CY0cwmPOjgxVOylnmHKJXeCBkWPP5s4Ze57
	7uP5RVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFoq-00000004C6W-09js;
	Wed, 25 Feb 2026 14:24:52 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFoo-00000004C5D-0HSw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:24:51 +0000
X-CSE-ConnectionGUID: L+IALaWDRBO0q4YalVUyWw==
X-CSE-MsgGUID: cCWN2MKST6q+m7KfE0ELWQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Feb 2026 23:24:49 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.192])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D25B14017D8D;
	Wed, 25 Feb 2026 23:24:42 +0900 (JST)
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
Subject: [PATCH net-next v2 4/5] net: stmmac: Add write_hw parameter to VLAN filter operations
Date: Wed, 25 Feb 2026 14:24:13 +0000
Message-ID: <20260225142414.130144-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
References: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_062450_233759_C5F22509 
X-CRM114-Status: GOOD (  15.48  )
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

Add a write_hw parameter to the VLAN add/delete HW filter functions and
to stmmac_vlan_update(). This flag controls whether the actual hardware
register accesses are performed. When set to false, only the software
state is updated.

The next commit will use this to defer hardware writes when the
interface is down.

No functional change.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes: none.

 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  6 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 25 +++++++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 34 ++++++++++++-------
 3 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 0db96a387259..d7598c76251f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -647,10 +647,12 @@ struct stmmac_vlan_ops {
 	void (*set_hw_vlan_mode)(struct mac_device_info *hw);
 	int (*add_hw_vlan_rx_fltr)(struct net_device *dev,
 				   struct mac_device_info *hw,
-				   __be16 proto, u16 vid);
+				   __be16 proto, u16 vid,
+				   bool write_hw);
 	int (*del_hw_vlan_rx_fltr)(struct net_device *dev,
 				   struct mac_device_info *hw,
-				   __be16 proto, u16 vid);
+				   __be16 proto, u16 vid,
+				   bool write_hw);
 	void (*restore_hw_vlan_rx_fltr)(struct net_device *dev,
 					struct mac_device_info *hw);
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a02575f67057..19c86e3b42cc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6751,7 +6751,8 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
 	return crc;
 }
 
-static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
+static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double,
+			      bool write_hw)
 {
 	u32 crc, hash = 0;
 	u16 pmatch = 0;
@@ -6773,7 +6774,11 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 		hash = 0;
 	}
 
-	return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch, is_double);
+	if (write_hw)
+		return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch,
+					       is_double);
+
+	return 0;
 }
 
 /* FIXME: This may need RXC to be running, but it may be called with BH
@@ -6795,17 +6800,18 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 
 	set_bit(vid, priv->active_vlans);
 	num_double_vlans = priv->num_double_vlans + is_double;
-	ret = stmmac_vlan_update(priv, num_double_vlans);
+	ret = stmmac_vlan_update(priv, num_double_vlans, true);
 	if (ret) {
 		clear_bit(vid, priv->active_vlans);
 		goto err_pm_put;
 	}
 
 	if (priv->hw->num_vlan) {
-		ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
+		ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto,
+						 vid, true);
 		if (ret) {
 			clear_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, priv->num_double_vlans);
+			stmmac_vlan_update(priv, priv->num_double_vlans, true);
 			goto err_pm_put;
 		}
 	}
@@ -6837,17 +6843,18 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 
 	clear_bit(vid, priv->active_vlans);
 	num_double_vlans = priv->num_double_vlans - is_double;
-	ret = stmmac_vlan_update(priv, num_double_vlans);
+	ret = stmmac_vlan_update(priv, num_double_vlans, true);
 	if (ret) {
 		set_bit(vid, priv->active_vlans);
 		goto del_vlan_error;
 	}
 
 	if (priv->hw->num_vlan) {
-		ret = stmmac_del_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
+		ret = stmmac_del_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto,
+						 vid, true);
 		if (ret) {
 			set_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, priv->num_double_vlans);
+			stmmac_vlan_update(priv, priv->num_double_vlans, true);
 			goto del_vlan_error;
 		}
 	}
@@ -6870,7 +6877,7 @@ static int stmmac_vlan_restore(struct stmmac_priv *priv)
 	if (priv->hw->num_vlan)
 		stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
 
-	ret = stmmac_vlan_update(priv, priv->num_double_vlans);
+	ret = stmmac_vlan_update(priv, priv->num_double_vlans, true);
 	if (ret)
 		netdev_err(priv->dev, "Failed to restore VLANs\n");
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index fcc34867405e..f81015179d04 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -53,7 +53,8 @@ static int vlan_write_filter(struct net_device *dev,
 
 static int vlan_add_hw_rx_fltr(struct net_device *dev,
 			       struct mac_device_info *hw,
-			       __be16 proto, u16 vid)
+			       __be16 proto, u16 vid,
+			       bool write_hw)
 {
 	int index = -1;
 	u32 val = 0;
@@ -76,7 +77,8 @@ static int vlan_add_hw_rx_fltr(struct net_device *dev,
 		}
 
 		hw->vlan_filter[0] = vid;
-		vlan_write_single(dev, vid);
+		if (write_hw)
+			vlan_write_single(dev, vid);
 
 		return 0;
 	}
@@ -97,17 +99,21 @@ static int vlan_add_hw_rx_fltr(struct net_device *dev,
 		return -EPERM;
 	}
 
-	ret = vlan_write_filter(dev, hw, index, val);
+	if (write_hw) {
+		ret = vlan_write_filter(dev, hw, index, val);
+		if (ret)
+			return ret;
+	}
 
-	if (!ret)
-		hw->vlan_filter[index] = val;
+	hw->vlan_filter[index] = val;
 
-	return ret;
+	return 0;
 }
 
 static int vlan_del_hw_rx_fltr(struct net_device *dev,
 			       struct mac_device_info *hw,
-			       __be16 proto, u16 vid)
+			       __be16 proto, u16 vid,
+			       bool write_hw)
 {
 	int i, ret = 0;
 
@@ -115,7 +121,8 @@ static int vlan_del_hw_rx_fltr(struct net_device *dev,
 	if (hw->num_vlan == 1) {
 		if ((hw->vlan_filter[0] & VLAN_TAG_VID) == vid) {
 			hw->vlan_filter[0] = 0;
-			vlan_write_single(dev, 0);
+			if (write_hw)
+				vlan_write_single(dev, 0);
 		}
 		return 0;
 	}
@@ -124,12 +131,13 @@ static int vlan_del_hw_rx_fltr(struct net_device *dev,
 	for (i = 0; i < hw->num_vlan; i++) {
 		if ((hw->vlan_filter[i] & VLAN_TAG_DATA_VEN) &&
 		    ((hw->vlan_filter[i] & VLAN_TAG_DATA_VID) == vid)) {
-			ret = vlan_write_filter(dev, hw, i, 0);
+			if (write_hw) {
+				ret = vlan_write_filter(dev, hw, i, 0);
+				if (ret)
+					return ret;
+			}
 
-			if (!ret)
-				hw->vlan_filter[i] = 0;
-			else
-				return ret;
+			hw->vlan_filter[i] = 0;
 		}
 	}
 
-- 
2.51.0


