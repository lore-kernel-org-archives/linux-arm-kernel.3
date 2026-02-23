Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07B9EA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IufH6xxgb1T2abgP2fe3pCeb98HRqe1cuqUGzXqJIGI=; b=i2DZMOsqHb49mdv+aq/24C75nb
	w49Rs3y15nvPMZCPqBQ01jgL2+eq2ifiQHRjZMjq6DUrHvwzunYpS1hHVnIiFbtwxY7EId+7uDXFR
	foQ4QnYsHtKfS4AmbJz+NMXbCNwCjIrTb0hKUP6KwqszbHHDTr8PWOpsFPit5P2fqFPHVjAmRRdA+
	KoUE3JuyuuVsmvrJN6W+YsoEJlDO4+3NG4WuzJozZhNpzuwn4DZQNynLWjRCDYk4k5K1lzpCL9ARf
	ehKgGayr5z/KmcB3RXHfHYlvfhL8nzgBJMvXloczOkEknGFx5T4eEbcjsdmB52yHd+82AOK1aY/5A
	T/6Zl+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVFg-00000000IMr-2j8g;
	Mon, 23 Feb 2026 12:41:28 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVFe-00000000ILs-3T8T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:41:27 +0000
X-CSE-ConnectionGUID: 73CCg/46RoWhw5x0yhoOvw==
X-CSE-MsgGUID: Wv1cVRZARwmnx9IONG74hA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Feb 2026 21:41:25 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.12])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1AB1F41AB637;
	Mon, 23 Feb 2026 21:41:18 +0900 (JST)
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
Subject: [PATCH net-next 2/4] net: stmmac: Improve double VLAN handling
Date: Mon, 23 Feb 2026 12:41:00 +0000
Message-ID: <20260223124102.120432-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223124102.120432-1-ovidiu.panait.rb@renesas.com>
References: <20260223124102.120432-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_044126_986240_0816065D 
X-CRM114-Status: GOOD (  12.33  )
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

The double VLAN bits (EDVLP, ESVL, DOVLTC) are handled inconsistently
between the two vlan_update_hash() implementations:

- dwxgmac2_update_vlan_hash() explicitly clears the double VLAN bits when
is_double is false, meaning that adding a 802.1Q VLAN will disable
double VLAN mode:

  $ ip link add link eth0 name eth0.200 type vlan id 200 protocol 802.1ad
  $ ip link add link eth0 name eth0.100 type vlan id 100
  # Double VLAN bits no longer set

- vlan_update_hash() sets these bits and only clears them when the last
VLAN has been removed, so double VLAN mode remains enabled even after all
802.1AD VLANs are removed.

Address both issues by tracking the number of active 802.1AD VLANs in
priv->num_double_vlans. Pass this count to stmmac_vlan_update() so both
implementations correctly set the double VLAN bits when any 802.1AD
VLAN is active, and clear them only when none remain.

Also update vlan_update_hash() to explicitly clear the double VLAN bits
when is_double is false, matching the dwxgmac2 behavior.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h     |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c    |  8 ++++++++
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 51c96a738151..33667a26708c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -323,6 +323,7 @@ struct stmmac_priv {
 	void __iomem *ptpaddr;
 	void __iomem *estaddr;
 	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];
+	unsigned int num_double_vlans;
 	int sfty_irq;
 	int sfty_ce_irq;
 	int sfty_ue_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f2f120ddba46..45f2f3492dbd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6779,6 +6779,7 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	unsigned int num_double_vlans;
 	bool is_double = false;
 	int ret;
 
@@ -6790,7 +6791,8 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 		is_double = true;
 
 	set_bit(vid, priv->active_vlans);
-	ret = stmmac_vlan_update(priv, is_double);
+	num_double_vlans = priv->num_double_vlans + is_double;
+	ret = stmmac_vlan_update(priv, num_double_vlans);
 	if (ret) {
 		clear_bit(vid, priv->active_vlans);
 		goto err_pm_put;
@@ -6800,11 +6802,13 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 		ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
 		if (ret) {
 			clear_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, is_double);
+			stmmac_vlan_update(priv, priv->num_double_vlans);
 			goto err_pm_put;
 		}
 	}
 
+	priv->num_double_vlans = num_double_vlans;
+
 err_pm_put:
 	pm_runtime_put(priv->device);
 
@@ -6817,6 +6821,7 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vid)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	unsigned int num_double_vlans;
 	bool is_double = false;
 	int ret;
 
@@ -6828,7 +6833,8 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 		is_double = true;
 
 	clear_bit(vid, priv->active_vlans);
-	ret = stmmac_vlan_update(priv, is_double);
+	num_double_vlans = priv->num_double_vlans - is_double;
+	ret = stmmac_vlan_update(priv, num_double_vlans);
 	if (ret) {
 		set_bit(vid, priv->active_vlans);
 		goto del_vlan_error;
@@ -6838,11 +6844,13 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 		ret = stmmac_del_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
 		if (ret) {
 			set_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, is_double);
+			stmmac_vlan_update(priv, priv->num_double_vlans);
 			goto del_vlan_error;
 		}
 	}
 
+	priv->num_double_vlans = num_double_vlans;
+
 del_vlan_error:
 	pm_runtime_put(priv->device);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index b18404dd5a8b..de1a70e1c86e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -183,6 +183,10 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 			value |= VLAN_EDVLP;
 			value |= VLAN_ESVL;
 			value |= VLAN_DOVLTC;
+		} else {
+			value &= ~VLAN_EDVLP;
+			value &= ~VLAN_ESVL;
+			value &= ~VLAN_DOVLTC;
 		}
 
 		writel(value, ioaddr + VLAN_TAG);
@@ -193,6 +197,10 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 			value |= VLAN_EDVLP;
 			value |= VLAN_ESVL;
 			value |= VLAN_DOVLTC;
+		} else {
+			value &= ~VLAN_EDVLP;
+			value &= ~VLAN_ESVL;
+			value &= ~VLAN_DOVLTC;
 		}
 
 		writel(value | perfect_match, ioaddr + VLAN_TAG);
-- 
2.34.1


