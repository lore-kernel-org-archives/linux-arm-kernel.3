Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C98E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JA4lvWOndmxwFyLaAvkzqzwziZX2VmqPOzntwYUPmb0=; b=sw59FbooWHMmWSqj2cHXWlH4fi
	FScMgYJaa+UK281Q7R94newI72FVVWZV30t8vxxsUzFuYmCMGZzBRrbtdXgm/bO6hirT+aIA64WS5
	mBwMdvMM8HjWio8S4dBKGNFY+RfgZbERJUmBZ5Yrn4lcyD3VQNmyFzmJL+D4QTzWCkHPK+Cz99kHN
	e/6gUEqhGOosmMo0SnhkQozfB54c6zs18Gt1jcvpHhJFQYb2mg73ctbQ0D5XHF6nt0XXZVW6liGP4
	M4bQ5NWYB/aN4b509BYRb+1wFVMfePiLYkojUkLW5zC5nm8d5VIY4EPXYzeTP1Rl44ZhkRiNYYfdg
	Sd/Lct+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAUK-0000000EYIz-0ULZ;
	Fri, 10 Jan 2025 08:35:28 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAOS-0000000EWup-1ZAL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 08:29:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50A8T7Qr074310;
	Fri, 10 Jan 2025 02:29:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736497747;
	bh=JA4lvWOndmxwFyLaAvkzqzwziZX2VmqPOzntwYUPmb0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=n4qL4eW0Sn7DRTBOgs3hFTP991C0bQ5jir8vwytSumtxxpP6Tdi1u3OzOagmLyLec
	 g78Qq026LH5fnNbRq7NDMhxoyrh8UXrZHnnbUMax2P9SBt/bbBPgxL206GXZckp68h
	 InYp/Fn+Mu4hRn58MqdAMWj4gRFvgvLBvOWUuuV0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50A8T79x022759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 02:29:07 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 02:29:07 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 02:29:07 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50A8T7o4007234;
	Fri, 10 Jan 2025 02:29:07 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 50A8T6ga021293;
	Fri, 10 Jan 2025 02:29:06 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: Jeongjun Park <aha310510@gmail.com>,
        Alexander Lobakin
	<aleksander.lobakin@intel.com>,
        Lukasz Majewski <lukma@denx.de>, Meghana
 Malladi <m-malladi@ti.com>,
        Diogo Ivo <diogo.ivo@siemens.com>, Simon Horman
	<horms@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Roger Quadros
	<rogerq@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>, <danishanwar@ti.com>,
        Michal Swiatkowski
	<michal.swiatkowski@linux.intel.com>,
        Larysa Zaremba
	<larysa.zaremba@intel.com>
Subject: [PATCH net-next v4 4/4] net: ti: icssg-prueth: Add Support for Multicast filtering with VLAN in HSR mode
Date: Fri, 10 Jan 2025 13:58:52 +0530
Message-ID: <20250110082852.3899027-5-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110082852.3899027-1-danishanwar@ti.com>
References: <20250110082852.3899027-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_002924_504850_8E9919D8 
X-CRM114-Status: GOOD (  19.17  )
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

Add multicast filtering support for VLAN interfaces in HSR offload mode
for ICSSG driver.

The driver calls vlan_for_each() API on the hsr device's ndev to get the
list of available vlans for the hsr device. The driver then sync mc addr of
vlan interface with a locally mainatined list emac->vlan_mcast_list[vid]
using __hw_addr_sync_multiple() API.

The driver then calls the sync / unsync callbacks.

In the sync / unsync call back, driver checks if the vdev's real dev is
hsr device or not. If the real dev is hsr device, driver gets the per
port device using hsr_get_port_ndev() and then driver passes appropriate
vid to FDB helper functions.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 83 +++++++++++++++-----
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  2 +
 2 files changed, 66 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index b2d0d7b7b6d9..00ed97860547 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -604,32 +604,66 @@ static int icssg_prueth_del_mcast(struct net_device *ndev, const u8 *addr)
 	return 0;
 }
 
-static int icssg_prueth_hsr_add_mcast(struct net_device *ndev, const u8 *addr)
+static void icssg_prueth_hsr_fdb_add_del(struct prueth_emac *emac,
+					 const u8 *addr, u8 vid, bool add)
 {
-	struct prueth_emac *emac = netdev_priv(ndev);
-	struct prueth *prueth = emac->prueth;
-
-	icssg_fdb_add_del(emac, addr, prueth->default_vlan,
+	icssg_fdb_add_del(emac, addr, vid,
 			  ICSSG_FDB_ENTRY_P0_MEMBERSHIP |
 			  ICSSG_FDB_ENTRY_P1_MEMBERSHIP |
 			  ICSSG_FDB_ENTRY_P2_MEMBERSHIP |
-			  ICSSG_FDB_ENTRY_BLOCK, true);
+			  ICSSG_FDB_ENTRY_BLOCK, add);
+
+	if (add)
+		icssg_vtbl_modify(emac, vid, BIT(emac->port_id),
+				  BIT(emac->port_id), add);
+}
+
+static int icssg_prueth_hsr_add_mcast(struct net_device *ndev, const u8 *addr)
+{
+	struct net_device *real_dev;
+	struct prueth_emac *emac;
+	u8 vlan_id, i;
+
+	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_HSR;
+	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
+
+	if (is_hsr_master(real_dev)) {
+		for (i = HSR_PT_SLAVE_A; i < HSR_PT_INTERLINK; i++) {
+			emac = netdev_priv(hsr_get_port_ndev(real_dev, i));
+			if (!emac)
+				return -EINVAL;
+			icssg_prueth_hsr_fdb_add_del(emac, addr, vlan_id,
+						     true);
+		}
+	} else {
+		emac = netdev_priv(real_dev);
+		icssg_prueth_hsr_fdb_add_del(emac, addr, vlan_id, true);
+	}
 
-	icssg_vtbl_modify(emac, emac->port_vlan, BIT(emac->port_id),
-			  BIT(emac->port_id), true);
 	return 0;
 }
 
 static int icssg_prueth_hsr_del_mcast(struct net_device *ndev, const u8 *addr)
 {
-	struct prueth_emac *emac = netdev_priv(ndev);
-	struct prueth *prueth = emac->prueth;
+	struct net_device *real_dev;
+	struct prueth_emac *emac;
+	u8 vlan_id, i;
 
-	icssg_fdb_add_del(emac, addr, prueth->default_vlan,
-			  ICSSG_FDB_ENTRY_P0_MEMBERSHIP |
-			  ICSSG_FDB_ENTRY_P1_MEMBERSHIP |
-			  ICSSG_FDB_ENTRY_P2_MEMBERSHIP |
-			  ICSSG_FDB_ENTRY_BLOCK, false);
+	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_HSR;
+	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
+
+	if (is_hsr_master(real_dev)) {
+		for (i = HSR_PT_SLAVE_A; i < HSR_PT_INTERLINK; i++) {
+			emac = netdev_priv(hsr_get_port_ndev(real_dev, i));
+			if (!emac)
+				return -EINVAL;
+			icssg_prueth_hsr_fdb_add_del(emac, addr, vlan_id,
+						     false);
+		}
+	} else {
+		emac = netdev_priv(real_dev);
+		icssg_prueth_hsr_fdb_add_del(emac, addr, vlan_id, false);
+	}
 
 	return 0;
 }
@@ -647,8 +681,14 @@ static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
 				vdev->addr_len);
 	netif_addr_unlock_bh(vdev);
 
-	__hw_addr_sync_dev(&emac->vlan_mcast_list[vid], vdev,
-			   icssg_prueth_add_mcast, icssg_prueth_del_mcast);
+	if (emac->prueth->is_hsr_offload_mode)
+		__hw_addr_sync_dev(&emac->vlan_mcast_list[vid], vdev,
+				   icssg_prueth_hsr_add_mcast,
+				   icssg_prueth_hsr_del_mcast);
+	else
+		__hw_addr_sync_dev(&emac->vlan_mcast_list[vid], vdev,
+				   icssg_prueth_add_mcast,
+				   icssg_prueth_del_mcast);
 
 	return 0;
 }
@@ -893,6 +933,11 @@ static void emac_ndo_set_rx_mode_work(struct work_struct *work)
 	if (emac->prueth->is_hsr_offload_mode) {
 		__dev_mc_sync(ndev, icssg_prueth_hsr_add_mcast,
 			      icssg_prueth_hsr_del_mcast);
+		if (rtnl_trylock()) {
+			vlan_for_each(emac->prueth->hsr_dev,
+				      icssg_update_vlan_mcast, emac);
+			rtnl_unlock();
+		}
 	} else {
 		__dev_mc_sync(ndev, icssg_prueth_add_mcast,
 			      icssg_prueth_del_mcast);
@@ -1290,7 +1335,7 @@ static int prueth_netdevice_port_link(struct net_device *ndev,
 		if (prueth->br_members & BIT(PRUETH_PORT_MII0) &&
 		    prueth->br_members & BIT(PRUETH_PORT_MII1)) {
 			prueth->is_switch_mode = true;
-			prueth->default_vlan = 1;
+			prueth->default_vlan = PRUETH_DFLT_VLAN_SW;
 			emac->port_vlan = prueth->default_vlan;
 			icssg_change_mode(prueth);
 		}
@@ -1348,7 +1393,7 @@ static int prueth_hsr_port_link(struct net_device *ndev)
 			      NETIF_PRUETH_HSR_OFFLOAD_FEATURES))
 				return -EOPNOTSUPP;
 			prueth->is_hsr_offload_mode = true;
-			prueth->default_vlan = 1;
+			prueth->default_vlan = PRUETH_DFLT_VLAN_HSR;
 			emac0->port_vlan = prueth->default_vlan;
 			emac1->port_vlan = prueth->default_vlan;
 			icssg_change_mode(prueth);
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index c8f7a22cb253..329b46e9ee53 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -84,6 +84,8 @@
 #define ICSS_CMD_ADD_MAC 0x8
 
 /* VLAN Filtering Related MACROs */
+#define PRUETH_DFLT_VLAN_HSR	1
+#define PRUETH_DFLT_VLAN_SW	1
 #define PRUETH_DFLT_VLAN_MAC	0
 #define MAX_VLAN_ID		256
 
-- 
2.34.1


