Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2FBD3E798
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n964dTNex7tpk0he9DOLYs/250I2jZHfL5mWxJ2ZSgM=; b=zw7Hba/etMf6Eei3FysLburv1m
	SwxqrEtB86ZyAHPT9VyGWm/728VT5K3Bw9dixYwCqGBUJvexZOhh5ainEtWpKPz5szPPWUaUvzkOD
	1V3rLvJ6BaC86RgrI7vp7rhmqkMzQt90dJgc0VII3mqEdF6h0N2bT5dU8bSFOBFgru/YB0WTz3F0w
	YkBR2HmoD4v/RFKf+E9xK/SXHhaWVvxkdftpwNV/ATy7E9+y5Vkk+t2OBRxWfiFkZtvCDw+dZQL0A
	s7E3xQzx+uInrF2AomdvSvlWUJjkjRQp0jbsIZGiUiu9GRdoZXWAFVLqe6NWbk+tyuWAbwB76ajpM
	B300SEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cfn-00000002cWU-02zg;
	Wed, 06 Nov 2024 09:49:59 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cAQ-00000002TIu-0KRc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:17:35 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A69HJrv035698;
	Wed, 6 Nov 2024 03:17:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730884639;
	bh=n964dTNex7tpk0he9DOLYs/250I2jZHfL5mWxJ2ZSgM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=frJ+21GN4k9d2q19iuYPBNNffn09Ba96IWHnT8nysNNserrsjJA/UY8StYaWncFL1
	 0Hdryk1IW+j2A2RIGZzDbrIslByhg7wybbBOgx6JOEO3p8VDIMQOGvIX//B2CiMfN9
	 Jz09wtpmXWYr2TPh30TYmQfjDsGO6EKjSW63BkXk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A69HJEk116871
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 03:17:19 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 03:17:18 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 03:17:18 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A69HInB081268;
	Wed, 6 Nov 2024 03:17:18 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A69HI80020792;
	Wed, 6 Nov 2024 03:17:18 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <geliang@kernel.org>, <liuhangbin@gmail.com>, <jiri@resnulli.us>,
        <w-kwok2@ti.com>, <aleksander.lobakin@intel.com>, <lukma@denx.de>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <shuah@kernel.org>,
        <horms@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v3 3/4] net: ti: icssg-prueth: Add VLAN support for HSR mode
Date: Wed, 6 Nov 2024 14:47:09 +0530
Message-ID: <20241106091710.3308519-4-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106091710.3308519-1-danishanwar@ti.com>
References: <20241106091710.3308519-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_011734_268471_720D9388 
X-CRM114-Status: GOOD (  15.26  )
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

From: Ravi Gunasekaran <r-gunasekaran@ti.com>

Add support for VLAN addition/deletion in HSR mode.
In HSR mode, even if the host port is not a member of
the VLAN domain, the slave ports should simply forward the
frames. So allow forwarding of all VLAN frames in HSR mode.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 45 +++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 0556910938fa..b4d70c6e0cff 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -808,6 +808,47 @@ static netdev_features_t emac_ndo_fix_features(struct net_device *ndev,
 	return features;
 }
 
+static int emac_ndo_vlan_rx_add_vid(struct net_device *ndev,
+				    __be16 proto, u16 vid)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth *prueth = emac->prueth;
+	int untag_mask = 0;
+	int port_mask;
+
+	if (prueth->is_hsr_offload_mode) {
+		port_mask = BIT(PRUETH_PORT_HOST) | BIT(emac->port_id);
+		untag_mask = 0;
+
+		netdev_dbg(emac->ndev, "VID add vid:%u port_mask:%X untag_mask %X\n",
+			   vid, port_mask, untag_mask);
+
+		icssg_vtbl_modify(emac, vid, port_mask, untag_mask, true);
+		icssg_set_pvid(emac->prueth, vid, emac->port_id);
+	}
+	return 0;
+}
+
+static int emac_ndo_vlan_rx_del_vid(struct net_device *ndev,
+				    __be16 proto, u16 vid)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth *prueth = emac->prueth;
+	int untag_mask = 0;
+	int port_mask;
+
+	if (prueth->is_hsr_offload_mode) {
+		port_mask = BIT(PRUETH_PORT_HOST);
+		untag_mask = 0;
+
+		netdev_dbg(emac->ndev, "VID del vid:%u port_mask:%X untag_mask  %X\n",
+			   vid, port_mask, untag_mask);
+
+		icssg_vtbl_modify(emac, vid, port_mask, untag_mask, false);
+	}
+	return 0;
+}
+
 static const struct net_device_ops emac_netdev_ops = {
 	.ndo_open = emac_ndo_open,
 	.ndo_stop = emac_ndo_stop,
@@ -820,6 +861,8 @@ static const struct net_device_ops emac_netdev_ops = {
 	.ndo_get_stats64 = icssg_ndo_get_stats64,
 	.ndo_get_phys_port_name = icssg_ndo_get_phys_port_name,
 	.ndo_fix_features = emac_ndo_fix_features,
+	.ndo_vlan_rx_add_vid = emac_ndo_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid = emac_ndo_vlan_rx_del_vid,
 };
 
 static int prueth_netdev_init(struct prueth *prueth,
@@ -947,7 +990,7 @@ static int prueth_netdev_init(struct prueth *prueth,
 	ndev->netdev_ops = &emac_netdev_ops;
 	ndev->ethtool_ops = &icssg_ethtool_ops;
 	ndev->hw_features = NETIF_F_SG;
-	ndev->features = ndev->hw_features;
+	ndev->features = ndev->hw_features | NETIF_F_HW_VLAN_CTAG_FILTER;
 	ndev->hw_features |= NETIF_PRUETH_HSR_OFFLOAD_FEATURES;
 
 	netif_napi_add(ndev, &emac->napi_rx, icssg_napi_rx_poll);
-- 
2.34.1


