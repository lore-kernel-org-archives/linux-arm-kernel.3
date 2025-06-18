Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C427BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PTqXkeWdOJ01dOchQdWmJ3HLZ+mY40AHiSRqSHI6bU0=; b=yw34YGZHFVmbXJJVPjNn6HjfUJ
	UaZoRM/3j9AXkgp6/4m6hSy/7HI0vh/nH4IMf0B7ZqLUBN2wKb2wYLRe6+6AH/33YMxkl+PvLLDtD
	NS5UC0M5jBK8ScQwmcoO/Ir7jREm/gPi4YNpmWJDIbnSbTtNUSx7/9+medjYmVE02yX6998ivvr0D
	DwjnbmtHwAERjwIaxshHb0zmTEZkh4lqZhTntXwxmq9myv0hYI2zz8oStukLpeU6L4vBcPrGpCOEG
	M7pH9UHFXr98VsktFxPdEXoJ6k6/jx2FlC1sgkGbWm8L8+XRu6BqMC79cOO5jEIuSnGT+u6gUZLTR
	5k+KE0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyCa-0000000BAMn-0wSR;
	Wed, 18 Jun 2025 19:12:04 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRx0m-0000000AxlN-2cBt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 17:55:50 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55IHtdbj377578;
	Wed, 18 Jun 2025 12:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750269339;
	bh=PTqXkeWdOJ01dOchQdWmJ3HLZ+mY40AHiSRqSHI6bU0=;
	h=From:To:CC:Subject:Date;
	b=PPkJYQSWjbFPhgazjQrIQRkzaC1OjJ98bocYItjZV3UX6eLWosLsjPbOPuy0LQRnk
	 pZAYqvSjy2kvvTRiwXw5m7h/bOxoi6GX9Cq9WZZYCiIyuN8iFNYNNSnuznrZPx0llX
	 KyLSaCDF2FXhFto91xin+Mw5d1v6HI75evfAi7QI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55IHtdY6591755
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 12:55:39 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 12:55:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 12:55:38 -0500
Received: from localhost (akira.dhcp.ti.com [10.24.69.4])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55IHtbFZ4143062;
	Wed, 18 Jun 2025 12:55:38 -0500
From: Himanshu Mittal <h-mittal1@ti.com>
To: <h-mittal1@ti.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>,
        <m-malladi@ti.com>, <pratheesh@ti.com>, <prajith@ti.com>
Subject: [PATCH net-next v3] net: ti: icssg-prueth: Add prp offload support to ICSSG driver
Date: Wed, 18 Jun 2025 23:25:36 +0530
Message-ID: <20250618175536.430568-1-h-mittal1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_105548_843618_58641655 
X-CRM114-Status: GOOD (  16.79  )
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

Add support for ICSSG PRP mode which supports offloading of:
 - Packet duplication and PRP trailer insertion
 - Packet duplicate discard and PRP trailer removal

Signed-off-by: Himanshu Mittal <h-mittal1@ti.com>
---
v3-v2:
- Addresses comment to fix structure documentation

v2: https://lore.kernel.org/all/20250618102907.GA1699@horms.kernel.org/

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 12 +++++++++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  5 +++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index a1e013b0a0eb..2aa812cbab92 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -148,8 +148,10 @@ static int prueth_emac_start(struct prueth *prueth)
 
 	if (prueth->is_switch_mode)
 		firmwares = prueth->icssg_switch_firmwares;
-	else if (prueth->is_hsr_offload_mode)
+	else if (prueth->is_hsr_offload_mode && HSR_V1 == prueth->hsr_prp_version)
 		firmwares = prueth->icssg_hsr_firmwares;
+	else if (prueth->is_hsr_offload_mode && PRP_V1 == prueth->hsr_prp_version)
+		firmwares = prueth->icssg_prp_firmwares;
 	else
 		firmwares = prueth->icssg_emac_firmwares;
 
@@ -1527,6 +1529,7 @@ static int prueth_netdevice_event(struct notifier_block *unused,
 	struct netdev_notifier_changeupper_info *info;
 	struct prueth_emac *emac = netdev_priv(ndev);
 	struct prueth *prueth = emac->prueth;
+	enum hsr_version hsr_ndev_version;
 	int ret = NOTIFY_DONE;
 
 	if (ndev->netdev_ops != &emac_netdev_ops)
@@ -1538,6 +1541,11 @@ static int prueth_netdevice_event(struct notifier_block *unused,
 
 		if ((ndev->features & NETIF_PRUETH_HSR_OFFLOAD_FEATURES) &&
 		    is_hsr_master(info->upper_dev)) {
+			hsr_get_version(info->upper_dev, &hsr_ndev_version);
+			if (hsr_ndev_version != HSR_V1 && hsr_ndev_version != PRP_V1)
+				return -EOPNOTSUPP;
+			prueth->hsr_prp_version = hsr_ndev_version;
+
 			if (info->linking) {
 				if (!prueth->hsr_dev) {
 					prueth->hsr_dev = info->upper_dev;
@@ -1858,6 +1866,8 @@ static int prueth_probe(struct platform_device *pdev)
 				  prueth->icssg_switch_firmwares, "eth", "sw");
 	icssg_mode_firmware_names(dev, prueth->icssg_emac_firmwares,
 				  prueth->icssg_hsr_firmwares, "eth", "hsr");
+	icssg_mode_firmware_names(dev, prueth->icssg_emac_firmwares,
+				  prueth->icssg_prp_firmwares, "eth", "prp");
 
 	spin_lock_init(&prueth->vtbl_lock);
 	spin_lock_init(&prueth->stats_lock);
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index c03e3b3626c1..9ca2e7fdefbd 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -13,6 +13,7 @@
 #include <linux/etherdevice.h>
 #include <linux/genalloc.h>
 #include <linux/if_vlan.h>
+#include <linux/if_hsr.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -290,6 +291,7 @@ struct icssg_firmwares {
  * @vlan_tbl: VLAN-FID table pointer
  * @hw_bridge_dev: pointer to HW bridge net device
  * @hsr_dev: pointer to the HSR net device
+ * @hsr_prp_version: enum to store the protocol version of hsr master
  * @br_members: bitmask of bridge member ports
  * @hsr_members: bitmask of hsr member ports
  * @prueth_netdevice_nb: netdevice notifier block
@@ -303,6 +305,7 @@ struct icssg_firmwares {
  * @icssg_emac_firmwares: Firmware names for EMAC mode, indexed per MAC
  * @icssg_switch_firmwares: Firmware names for SWITCH mode, indexed per MAC
  * @icssg_hsr_firmwares: Firmware names for HSR mode, indexed per MAC
+ * @icssg_prp_firmwares: Firmware names for PRP mode, indexed per MAC
  */
 struct prueth {
 	struct device *dev;
@@ -332,6 +335,7 @@ struct prueth {
 
 	struct net_device *hw_bridge_dev;
 	struct net_device *hsr_dev;
+	enum hsr_version hsr_prp_version;
 	u8 br_members;
 	u8 hsr_members;
 	struct notifier_block prueth_netdevice_nb;
@@ -349,6 +353,7 @@ struct prueth {
 	struct icssg_firmwares icssg_emac_firmwares[PRUETH_NUM_MACS];
 	struct icssg_firmwares icssg_switch_firmwares[PRUETH_NUM_MACS];
 	struct icssg_firmwares icssg_hsr_firmwares[PRUETH_NUM_MACS];
+	struct icssg_firmwares icssg_prp_firmwares[PRUETH_NUM_MACS];
 };
 
 struct emac_tx_ts_response {
-- 
2.34.1


