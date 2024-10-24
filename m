Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EE7CFA457
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n964dTNex7tpk0he9DOLYs/250I2jZHfL5mWxJ2ZSgM=; b=YLu4HUiTY5A2mA9b0ndeSo+dou
	RdoFVmt57YJBC7KQPizog/Z5fDrV6Uf7ce/pGbF6IadyJ25M4LBUnJnC/3mOMjeJuFxuBXYOn6ksf
	9+iXctjr8o/nwJ+OtlclYHm3JvndEFjuGwq/1VsRZFmObfccL/f9GqvipwKIW+ZEx7vFm/5AmzeL/
	Fk3Vz/gtV8Lz3eeNkaf7EOUgSacUM7G9alONkiMre0BwsueOFuAFTzAxX/RfPHVFM9HIagAipIoP0
	3s7ThBV3cUV6PwccNEOMT9LGL0WTuG8+HRBaQem+Tz6Du6CDVy8X9HM5ThrSausXa21AmIinz9Z0N
	04FC8ZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vDk-000000005jU-3wp4;
	Thu, 24 Oct 2024 10:37:36 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3v7f-000000004TX-2zrZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:31:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49OAV4Rn053993;
	Thu, 24 Oct 2024 05:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729765864;
	bh=n964dTNex7tpk0he9DOLYs/250I2jZHfL5mWxJ2ZSgM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=I8u0GvhH6hH46g0figOoGcDm9W0dv/yg0KhLFHzlmXVTlyP/gI07AE+mF8N7xe5+l
	 KiU1yTUjwZ01XXY1l5Xe2sP3DrINvImcKeNVpg7EBhJ5ZRXFI2Qc+sfdi1di6T0Qw3
	 UxQiaK6A5tOYS/VLR6Evx2JottONV+lLZwatA3iU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49OAV4Qc023029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Oct 2024 05:31:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 05:31:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 05:31:03 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49OAV3PM081880;
	Thu, 24 Oct 2024 05:31:03 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 49OAV2lp024601;
	Thu, 24 Oct 2024 05:31:03 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: <geliang@kernel.org>, <liuhangbin@gmail.com>, <dan.carpenter@linaro.org>,
        <jiri@resnulli.us>, <n.zhandarovich@fintech.ru>,
        <aleksander.lobakin@intel.com>, <lukma@denx.de>, <horms@kernel.org>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <shuah@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>,
        <m-malladi@ti.com>
Subject: [PATCH net-next v2 3/4] net: ti: icssg-prueth: Add VLAN support for HSR mode
Date: Thu, 24 Oct 2024 16:00:55 +0530
Message-ID: <20241024103056.3201071-4-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024103056.3201071-1-danishanwar@ti.com>
References: <20241024103056.3201071-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_033119_878572_F60E4242 
X-CRM114-Status: GOOD (  14.80  )
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


