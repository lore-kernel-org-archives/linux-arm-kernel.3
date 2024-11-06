Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE17D29FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tJVmNlnjHGZjwH5ydtaGAqdg+C08rv7W0UGeEWTYAI=; b=zjlt1QyuBlVlC981yS6ABWqyw0
	oa1I5OmGOrpBVGahwtprF4kAr1KPLlUVAH7ixZZ69rDF8HUsgFj+byO7TVug7u/gOrBnpbILcraVW
	uWtyCsUrzac0yRmSv+KWpcEH7L9ynVZH6kekbIpvVjKIVh+pp6scFLCiw9WQ7wiLsC35apWU7GrcG
	Z/XAXsW9jHqQX2dg8FfGmOQHlaPkG4lNupuuZPKQW9svAaSAvcrS4PCRzDStdosrQyVFIYNBDJA7+
	cawlKcjfwf2kqBNjuCdeKAWmVsqilbgXlDd+iGvKhLwz7VlNmm8jSr64ZNJ7TwnDuMbcWyNo6jkEt
	JgxkhDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ak9-00000002AEh-0iLY;
	Wed, 06 Nov 2024 07:46:21 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8afT-000000029BW-0uQ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:41:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A67fN4a012204;
	Wed, 6 Nov 2024 01:41:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730878883;
	bh=9tJVmNlnjHGZjwH5ydtaGAqdg+C08rv7W0UGeEWTYAI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JqVx6n244XpaD5KX2QAR1nSFQTYaScB9/zXmrQTIAgNsRcd8ueR1F5ZZZDvFku8Yg
	 s5F8JMfROFv9kS6t+Xp7GB05dgiFBGucIHdHbrXQvBGkrY0DDOMFztLxhVM7nHx6BK
	 XKFcDyrNT2BqMi8jNCD/QtuCf9kLjoBpL02puLTI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A67fMHp111557;
	Wed, 6 Nov 2024 01:41:22 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 01:41:22 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 01:41:22 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A67fM19024950;
	Wed, 6 Nov 2024 01:41:22 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A67fL6t014462;
	Wed, 6 Nov 2024 01:41:22 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <vigneshr@ti.com>, <m-karicheri2@ti.com>, <m-malladi@ti.com>,
        <jan.kiszka@siemens.com>, <javier.carrasco.cruz@gmail.com>,
        <jacob.e.keller@intel.com>, <horms@kernel.org>,
        <diogo.ivo@siemens.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net 1/2] net: ti: icssg-prueth: Fix firmware load sequence.
Date: Wed, 6 Nov 2024 13:10:39 +0530
Message-ID: <20241106074040.3361730-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106074040.3361730-1-m-malladi@ti.com>
References: <20241106074040.3361730-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_234131_472476_B56E3688 
X-CRM114-Status: GOOD (  19.72  )
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

From: MD Danish Anwar <danishanwar@ti.com>

Timesync related operations are ran in PRU0 cores for both ICSSG SLICE0
and SLICE1. Currently whenever any ICSSG interface comes up we load the
respective firmwares to PRU cores and whenever interface goes down, we
stop the respective cores. Due to this, when SLICE0 goes down while
SLICE1 is still active, PRU0 firmwares are unloaded and PRU0 core is
stopped. This results in clock jump for SLICE1 interface as the timesync
related operations are no longer running.

Fix this by running both PRU0 and PRU1 firmwares as long as at least 1
ICSSG interface is up.

rx_flow_id is updated before firmware is loaded. Once firmware is loaded,
it reads the flow_id and uses it for rx. emac_fdb_flow_id_updated() is
used to let firmware know that the flow_id has been updated and to use the
latest rx_flow_id.

Fixes: c1e0230eeaab ("net: ti: icss-iep: Add IEP driver")
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_config.c | 28 ++++++++++
 drivers/net/ethernet/ti/icssg/icssg_config.h |  1 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 58 ++++++++++++++++----
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  1 +
 4 files changed, 77 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.c b/drivers/net/ethernet/ti/icssg/icssg_config.c
index 5d2491c2943a..f1f0c8659e2d 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_config.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_config.c
@@ -786,3 +786,31 @@ void icssg_set_pvid(struct prueth *prueth, u8 vid, u8 port)
 		writel(pvid, prueth->shram.va + EMAC_ICSSG_SWITCH_PORT0_DEFAULT_VLAN_OFFSET);
 }
 EXPORT_SYMBOL_GPL(icssg_set_pvid);
+
+int emac_fdb_flow_id_updated(struct prueth_emac *emac)
+{
+	struct mgmt_cmd_rsp fdb_cmd_rsp = { 0 };
+	int slice = prueth_emac_slice(emac);
+	struct mgmt_cmd fdb_cmd = { 0 };
+	int ret = 0;
+
+	fdb_cmd.header = ICSSG_FW_MGMT_CMD_HEADER;
+	fdb_cmd.type   = ICSSG_FW_MGMT_FDB_CMD_TYPE_RX_FLOW;
+	fdb_cmd.seqnum = ++(emac->prueth->icssg_hwcmdseq);
+	fdb_cmd.param  = 0;
+
+	fdb_cmd.param |= (slice << 4);
+	fdb_cmd.cmd_args[0] = 0;
+
+	ret = icssg_send_fdb_msg(emac, &fdb_cmd, &fdb_cmd_rsp);
+
+	if (ret)
+		return ret;
+
+	WARN_ON(fdb_cmd.seqnum != fdb_cmd_rsp.seqnum);
+	if (fdb_cmd_rsp.status == 1)
+		return 0;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(emac_fdb_flow_id_updated);
diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.h b/drivers/net/ethernet/ti/icssg/icssg_config.h
index 92c2deaa3068..c884e9fa099e 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_config.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_config.h
@@ -55,6 +55,7 @@ struct icssg_rxq_ctx {
 #define ICSSG_FW_MGMT_FDB_CMD_TYPE	0x03
 #define ICSSG_FW_MGMT_CMD_TYPE		0x04
 #define ICSSG_FW_MGMT_PKT		0x80000000
+#define ICSSG_FW_MGMT_FDB_CMD_TYPE_RX_FLOW	0x05
 
 struct icssg_r30_cmd {
 	u32 cmd[4];
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 0556910938fa..9df67539285b 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -534,6 +534,7 @@ static int emac_ndo_open(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
 	int ret, i, num_data_chn = emac->tx_ch_num;
+	struct icssg_flow_cfg __iomem *flow_cfg;
 	struct prueth *prueth = emac->prueth;
 	int slice = prueth_emac_slice(emac);
 	struct device *dev = prueth->dev;
@@ -549,8 +550,12 @@ static int emac_ndo_open(struct net_device *ndev)
 	/* set h/w MAC as user might have re-configured */
 	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
 
+	if (!prueth->emacs_initialized) {
+		icssg_class_default(prueth->miig_rt, ICSS_SLICE0, 0, false);
+		icssg_class_default(prueth->miig_rt, ICSS_SLICE1, 0, false);
+	}
+
 	icssg_class_set_mac_addr(prueth->miig_rt, slice, emac->mac_addr);
-	icssg_class_default(prueth->miig_rt, slice, 0, false);
 	icssg_ft1_set_mac_addr(prueth->miig_rt, slice, emac->mac_addr);
 
 	/* Notify the stack of the actual queue counts. */
@@ -588,10 +593,31 @@ static int emac_ndo_open(struct net_device *ndev)
 		goto cleanup_napi;
 	}
 
-	/* reset and start PRU firmware */
-	ret = prueth_emac_start(prueth, emac);
-	if (ret)
-		goto free_rx_irq;
+	if (!prueth->emacs_initialized) {
+		if (prueth->emac[ICSS_SLICE0]) {
+			ret = prueth_emac_start(prueth, prueth->emac[ICSS_SLICE0]);
+			if (ret) {
+				netdev_err(ndev, "unable to start fw for slice %d", ICSS_SLICE0);
+				goto free_rx_irq;
+			}
+		}
+		if (prueth->emac[ICSS_SLICE1]) {
+			ret = prueth_emac_start(prueth, prueth->emac[ICSS_SLICE1]);
+			if (ret) {
+				netdev_err(ndev, "unable to start fw for slice %d", ICSS_SLICE1);
+				goto halt_slice0_prus;
+			}
+		}
+	}
+
+	flow_cfg = emac->dram.va + ICSSG_CONFIG_OFFSET + PSI_L_REGULAR_FLOW_ID_BASE_OFFSET;
+	writew(emac->rx_flow_id_base, &flow_cfg->rx_base_flow);
+	ret = emac_fdb_flow_id_updated(emac);
+
+	if (ret) {
+		netdev_err(ndev, "Failed to update Rx Flow ID %d", ret);
+		goto stop;
+	}
 
 	icssg_mii_update_mtu(prueth->mii_rt, slice, ndev->max_mtu);
 
@@ -644,7 +670,11 @@ static int emac_ndo_open(struct net_device *ndev)
 free_tx_ts_irq:
 	free_irq(emac->tx_ts_irq, emac);
 stop:
-	prueth_emac_stop(emac);
+	if (prueth->emac[ICSS_SLICE1])
+		prueth_emac_stop(prueth->emac[ICSS_SLICE1]);
+halt_slice0_prus:
+	if (prueth->emac[ICSS_SLICE0])
+		prueth_emac_stop(prueth->emac[ICSS_SLICE0]);
 free_rx_irq:
 	free_irq(emac->rx_chns.irq[rx_flow], emac);
 cleanup_napi:
@@ -680,7 +710,10 @@ static int emac_ndo_stop(struct net_device *ndev)
 	if (ndev->phydev)
 		phy_stop(ndev->phydev);
 
-	icssg_class_disable(prueth->miig_rt, prueth_emac_slice(emac));
+	if (prueth->emacs_initialized == 1) {
+		icssg_class_disable(prueth->miig_rt, ICSS_SLICE0);
+		icssg_class_disable(prueth->miig_rt, ICSS_SLICE1);
+	}
 
 	if (emac->prueth->is_hsr_offload_mode)
 		__dev_mc_unsync(ndev, icssg_prueth_hsr_del_mcast);
@@ -719,11 +752,14 @@ static int emac_ndo_stop(struct net_device *ndev)
 	/* Destroying the queued work in ndo_stop() */
 	cancel_delayed_work_sync(&emac->stats_work);
 
-	if (prueth->emacs_initialized == 1)
+	if (prueth->emacs_initialized == 1) {
 		icss_iep_exit(emac->iep);
-
-	/* stop PRUs */
-	prueth_emac_stop(emac);
+		/* stop PRUs */
+		if (prueth->emac[ICSS_SLICE0])
+			prueth_emac_stop(prueth->emac[ICSS_SLICE0]);
+		if (prueth->emac[ICSS_SLICE1])
+			prueth_emac_stop(prueth->emac[ICSS_SLICE1]);
+	}
 
 	free_irq(emac->tx_ts_irq, emac);
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index 8722bb4a268a..c4f5f0349ae7 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -365,6 +365,7 @@ void icssg_vtbl_modify(struct prueth_emac *emac, u8 vid, u8 port_mask,
 		       u8 untag_mask, bool add);
 u16 icssg_get_pvid(struct prueth_emac *emac);
 void icssg_set_pvid(struct prueth *prueth, u8 vid, u8 port);
+int emac_fdb_flow_id_updated(struct prueth_emac *emac);
 #define prueth_napi_to_tx_chn(pnapi) \
 	container_of(pnapi, struct prueth_tx_chn, napi_tx)
 
-- 
2.25.1


