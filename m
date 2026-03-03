Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF70FE67A9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvXTKeqVOgZ+sK5zQ1X9KsU/+o3InYgX5va6yVt0LaU=; b=mBnfb8/w1MJDbdp2beDq9jbtIp
	Z59/KzbEKmaObgbZaxATlZ5X5kr9INNrL4en+z2MO4zv7o+FYU5pAI6kl4YtX23oAgKUlSdxl2UYj
	5Uq8jN/a7ePOtHCz/LXzPPNQmcJ3kZE2GFzBtfJo9Lv3iLnrAphpzceeUt8bHJpPPMZqyrTIkK6eK
	z9KRwFFAsqK62Uv4rvIfY3kB5P3oTjQnOQDhcGZUSL34axxatupvDEV31iN7LqJ8IZXUEA8mwBRMZ
	Z9GdxwcwO8/7DzzxZSuidKSoXVypyJmkoTRzzDE9ieP8BxEUbSJs8T1qI9OG0KwWf/xf9bKN2kn+0
	ZAgcRdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRDG-0000000FMxB-13oK;
	Tue, 03 Mar 2026 14:59:06 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRDD-0000000FMvn-3dzH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 14:59:05 +0000
X-CSE-ConnectionGUID: u7EqF9WKTXKRYtkXA6aSNg==
X-CSE-MsgGUID: PBIVzJ5sQzuJRrMv6FCszg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Mar 2026 23:59:02 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.15])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id ABA92401006A;
	Tue,  3 Mar 2026 23:58:56 +0900 (JST)
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
Subject: [PATCH net v3 4/4] net: stmmac: Defer VLAN HW configuration when interface is down
Date: Tue,  3 Mar 2026 14:58:28 +0000
Message-ID: <20260303145828.7845-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303145828.7845-1-ovidiu.panait.rb@renesas.com>
References: <20260303145828.7845-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_065904_025076_434B2797 
X-CRM114-Status: GOOD (  17.50  )
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

To fix this, check if the interface is up before accessing VLAN registers.
The software state is always kept up to date regardless of interface state.

When the interface is brought up, stmmac_vlan_restore() is called
to write the VLAN state to hardware.

Fixes: ed64639bc1e0 ("net: stmmac: Add support for VLAN Rx filtering")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v3 changes:
- Dropped the 'write_hw' approach to avoid passing attributes around.
  Instead, netif_running() checks were added directly on the VLAN paths.

v2 changes:
- Split this commit - added a new commit (3/5) which fixes VLAN
  restore on resume and open paths.
- Dropped phylink_rx_clk_stop_block()/unblock() calls around VLAN restore.

 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  3 ++
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 42 ++++++++++---------
 2 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a8fb091d7b5d..536d513bdad5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6774,6 +6774,9 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 		hash = 0;
 	}
 
+	if (!netif_running(priv->dev))
+		return 0;
+
 	return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch, is_double);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index fcc34867405e..e24efe3bfedb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -76,7 +76,9 @@ static int vlan_add_hw_rx_fltr(struct net_device *dev,
 		}
 
 		hw->vlan_filter[0] = vid;
-		vlan_write_single(dev, vid);
+
+		if (netif_running(dev))
+			vlan_write_single(dev, vid);
 
 		return 0;
 	}
@@ -97,12 +99,15 @@ static int vlan_add_hw_rx_fltr(struct net_device *dev,
 		return -EPERM;
 	}
 
-	ret = vlan_write_filter(dev, hw, index, val);
+	if (netif_running(dev)) {
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
@@ -115,7 +120,9 @@ static int vlan_del_hw_rx_fltr(struct net_device *dev,
 	if (hw->num_vlan == 1) {
 		if ((hw->vlan_filter[0] & VLAN_TAG_VID) == vid) {
 			hw->vlan_filter[0] = 0;
-			vlan_write_single(dev, 0);
+
+			if (netif_running(dev))
+				vlan_write_single(dev, 0);
 		}
 		return 0;
 	}
@@ -124,22 +131,23 @@ static int vlan_del_hw_rx_fltr(struct net_device *dev,
 	for (i = 0; i < hw->num_vlan; i++) {
 		if ((hw->vlan_filter[i] & VLAN_TAG_DATA_VEN) &&
 		    ((hw->vlan_filter[i] & VLAN_TAG_DATA_VID) == vid)) {
-			ret = vlan_write_filter(dev, hw, i, 0);
 
-			if (!ret)
-				hw->vlan_filter[i] = 0;
-			else
-				return ret;
+			if (netif_running(dev)) {
+				ret = vlan_write_filter(dev, hw, i, 0);
+				if (ret)
+					return ret;
+			}
+
+			hw->vlan_filter[i] = 0;
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static void vlan_restore_hw_rx_fltr(struct net_device *dev,
 				    struct mac_device_info *hw)
 {
-	u32 val;
 	int i;
 
 	/* Single Rx VLAN Filter */
@@ -149,12 +157,8 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
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


