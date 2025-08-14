Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EB7CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wf2DiOscjTwecEowFKMalhlENHRbNfB+Btro8SOfIE8=; b=wRtfL/XuMcJkJghfoxVKUmlHbO
	9JoSdOpsmAohQRcwNrPDa1yrc7kHiSZJLdNFly/RgRI6by8TwD7S4T8DGnO2N9hA2IK1BVWN9tdz5
	VJb7pYPyySZ+cM1WnnFyPKHx0hBjYMD/fCe+NPKwaasQ7x2+aLNsEM0lVGh1Zzm3Ba3W7JWTfFBdk
	C9H8oAfJFsQWxnmfn7fypHQI8gqn/mrCkaezCNBCpMI6AFGI0o/TZpPAxHT0lOjmPn2REGn9eaLEr
	R8s6ON6No43ONAtySNZlpnFgAWQbeFOY/BDCmdxhNvVp1snH1aIhi3xIgDOm0On06DzDPN9DCZS3r
	Xol838Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXoM-0000000H01e-2aeh;
	Thu, 14 Aug 2025 13:16:06 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYI-0000000Gf6z-3kGb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:51:24 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EApAb91916358;
	Thu, 14 Aug 2025 05:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755168670;
	bh=Wf2DiOscjTwecEowFKMalhlENHRbNfB+Btro8SOfIE8=;
	h=From:To:CC:Subject:Date;
	b=aIJnRyv2TUEiX7xyia+B8qmT2awyAbCkiWOqB836m4S/XO5vuXZED7oSLe17EHcqz
	 +BVVBP35bxSHob5vec6QRXpCoHmpstfwHNf5hWPCFrQQOJgrSxadJHyRzTer8HMkZV
	 mzZYQN2OnAeq668E3ynk3/T2tpxMzYFXZPOpPnzs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EApArw1661623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 05:51:10 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 05:51:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 05:51:10 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EApAl53495350;
	Thu, 14 Aug 2025 05:51:10 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 57EAp9VZ026297;
	Thu, 14 Aug 2025 05:51:09 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Meghana Malladi
	<m-malladi@ti.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net] net: ti: icssg-prueth: Fix HSR and switch offload Enablement during firwmare reload.
Date: Thu, 14 Aug 2025 16:21:06 +0530
Message-ID: <20250814105106.1491871-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_035123_064092_FAA26495 
X-CRM114-Status: GOOD (  15.46  )
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

To enable HSR / Switch offload, certain configurations are needed.
Currently they are done inside icssg_change_mode(). This function only
gets called if we move from one mode to another without bringing the
links up / down.

Once in HSR / Switch mode, if we bring the links down and bring it back
up again. The callback sequence is,

- emac_ndo_stop()
	Firmwares are stopped
- emac_ndo_open()
	Firmwares are loaded

In this path icssg_change_mode() doesn't get called and as a result the
configurations needed for HSR / Switch is not done.

To fix this, put all these configurations in a separate function
icssg_enable_fw_offload() and call this from both icssg_change_mode()
and emac_ndo_open()

Fixes: 56375086d093 ("net: ti: icssg-prueth: Enable HSR Tx duplication, Tx Tag and Rx Tag offload")
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 72 +++++++++++---------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 6c7d776ae4ee..dadce6009791 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -203,6 +203,44 @@ static void prueth_emac_stop(struct prueth *prueth)
 	}
 }
 
+static void icssg_enable_fw_offload(struct prueth *prueth)
+{
+	struct prueth_emac *emac;
+	int mac;
+
+	for (mac = PRUETH_MAC0; mac < PRUETH_NUM_MACS; mac++) {
+		emac = prueth->emac[mac];
+		if (prueth->is_hsr_offload_mode) {
+			if (emac->ndev->features & NETIF_F_HW_HSR_TAG_RM)
+				icssg_set_port_state(emac, ICSSG_EMAC_HSR_RX_OFFLOAD_ENABLE);
+			else
+				icssg_set_port_state(emac, ICSSG_EMAC_HSR_RX_OFFLOAD_DISABLE);
+		}
+
+		if (prueth->is_switch_mode || prueth->is_hsr_offload_mode) {
+			if (netif_running(emac->ndev)) {
+				icssg_fdb_add_del(emac, eth_stp_addr, prueth->default_vlan,
+						  ICSSG_FDB_ENTRY_P0_MEMBERSHIP |
+						  ICSSG_FDB_ENTRY_P1_MEMBERSHIP |
+						  ICSSG_FDB_ENTRY_P2_MEMBERSHIP |
+						  ICSSG_FDB_ENTRY_BLOCK,
+						  true);
+				icssg_vtbl_modify(emac, emac->port_vlan | DEFAULT_VID,
+						  BIT(emac->port_id) | DEFAULT_PORT_MASK,
+						  BIT(emac->port_id) | DEFAULT_UNTAG_MASK,
+						  true);
+				if (prueth->is_hsr_offload_mode)
+					icssg_vtbl_modify(emac, DEFAULT_VID,
+							  DEFAULT_PORT_MASK,
+							  DEFAULT_UNTAG_MASK, true);
+				icssg_set_pvid(prueth, emac->port_vlan, emac->port_id);
+				if (prueth->is_switch_mode)
+					icssg_set_port_state(emac, ICSSG_EMAC_PORT_VLAN_AWARE_ENABLE);
+			}
+		}
+	}
+}
+
 static int prueth_emac_common_start(struct prueth *prueth)
 {
 	struct prueth_emac *emac;
@@ -753,6 +791,7 @@ static int emac_ndo_open(struct net_device *ndev)
 		ret = prueth_emac_common_start(prueth);
 		if (ret)
 			goto free_rx_irq;
+		icssg_enable_fw_offload(prueth);
 	}
 
 	flow_cfg = emac->dram.va + ICSSG_CONFIG_OFFSET + PSI_L_REGULAR_FLOW_ID_BASE_OFFSET;
@@ -1360,8 +1399,7 @@ static int prueth_emac_restart(struct prueth *prueth)
 
 static void icssg_change_mode(struct prueth *prueth)
 {
-	struct prueth_emac *emac;
-	int mac, ret;
+	int ret;
 
 	ret = prueth_emac_restart(prueth);
 	if (ret) {
@@ -1369,35 +1407,7 @@ static void icssg_change_mode(struct prueth *prueth)
 		return;
 	}
 
-	for (mac = PRUETH_MAC0; mac < PRUETH_NUM_MACS; mac++) {
-		emac = prueth->emac[mac];
-		if (prueth->is_hsr_offload_mode) {
-			if (emac->ndev->features & NETIF_F_HW_HSR_TAG_RM)
-				icssg_set_port_state(emac, ICSSG_EMAC_HSR_RX_OFFLOAD_ENABLE);
-			else
-				icssg_set_port_state(emac, ICSSG_EMAC_HSR_RX_OFFLOAD_DISABLE);
-		}
-
-		if (netif_running(emac->ndev)) {
-			icssg_fdb_add_del(emac, eth_stp_addr, prueth->default_vlan,
-					  ICSSG_FDB_ENTRY_P0_MEMBERSHIP |
-					  ICSSG_FDB_ENTRY_P1_MEMBERSHIP |
-					  ICSSG_FDB_ENTRY_P2_MEMBERSHIP |
-					  ICSSG_FDB_ENTRY_BLOCK,
-					  true);
-			icssg_vtbl_modify(emac, emac->port_vlan | DEFAULT_VID,
-					  BIT(emac->port_id) | DEFAULT_PORT_MASK,
-					  BIT(emac->port_id) | DEFAULT_UNTAG_MASK,
-					  true);
-			if (prueth->is_hsr_offload_mode)
-				icssg_vtbl_modify(emac, DEFAULT_VID,
-						  DEFAULT_PORT_MASK,
-						  DEFAULT_UNTAG_MASK, true);
-			icssg_set_pvid(prueth, emac->port_vlan, emac->port_id);
-			if (prueth->is_switch_mode)
-				icssg_set_port_state(emac, ICSSG_EMAC_PORT_VLAN_AWARE_ENABLE);
-		}
-	}
+	icssg_enable_fw_offload(prueth);
 }
 
 static int prueth_netdevice_port_link(struct net_device *ndev,

base-commit: 52565a935213cd6a8662ddb8efe5b4219343a25d
-- 
2.34.1


