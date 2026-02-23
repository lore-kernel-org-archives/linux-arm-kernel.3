Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B141AEA4FB8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jr7MNtU7N9xpvC5T2ALgqtIEnqHEi0hDg2bwf/R1h3g=; b=sSlg6EMRuyvs5dSRm21fvc0Er9
	x1PPtyiY8APTMmEBd9lb8vzbkLIO35zm5JZMu/qWwb8AxkwPPsAD3kOs+S09B6+KdDjKHhVK8SEQL
	V/LPnBj9NDlg/vs6h1wJwtYqciQCMxgLnF3oVkZUD5qQ42JGzJ/wsaRlzzn0F2T02sAbLGTdkJYX+
	oqedXnAGISorHEYXPyUmyEMgfhqtCgDAugk73Rm8tZ/cgkQBQ8crrTnWb3F2H0aUcSrZjVG1zFOTW
	9XklWHvhFvLqb3YX7Af8HnrXmTmPke7CSlgz+CUpbWfY0/QJ3Al33a97vbZclnkabk2RxZrV2ibCT
	zKIng6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVFn-00000000IPs-3ym3;
	Mon, 23 Feb 2026 12:41:35 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVFm-00000000IOh-0NG2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:41:35 +0000
X-CSE-ConnectionGUID: ek5THAtjQOeU0ucxkRYSnw==
X-CSE-MsgGUID: jXeiQHxYQZ+5ur3JJSJJIg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Feb 2026 21:41:33 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.12])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7933A41AB637;
	Mon, 23 Feb 2026 21:41:26 +0900 (JST)
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
	matthew.gerlach@altera.com,
	vee.khee.wong@intel.com,
	boon.leong.ong@intel.com,
	kim.tatt.chuah@intel.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/4] net: stmmac: Add write_hw parameter to VLAN filter operations
Date: Mon, 23 Feb 2026 12:41:01 +0000
Message-ID: <20260223124102.120432-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223124102.120432-1-ovidiu.panait.rb@renesas.com>
References: <20260223124102.120432-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_044134_246408_E7641FB3 
X-CRM114-Status: GOOD (  14.64  )
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
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  6 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 ++++++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 34 ++++++++++++-------
 3 files changed, 40 insertions(+), 23 deletions(-)

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
index 45f2f3492dbd..536668a0d6dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6748,7 +6748,8 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
 	return crc;
 }
 
-static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
+static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double,
+			      bool write_hw)
 {
 	u32 crc, hash = 0;
 	u16 pmatch = 0;
@@ -6770,7 +6771,11 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
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
@@ -6792,17 +6797,18 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 
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
@@ -6834,17 +6840,18 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 
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
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index de1a70e1c86e..b74c173da1b5 100644
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
2.34.1


