Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CE6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csO8Xa/AKFDOquuaniBbxWb0OFjh+/mPUotl4drJc8c=; b=Y+K8jd1KwDBVhF0d5o9uHFqsaU
	YAdPamsEOabibSubMNHXHNwbl67I3jRMfLiqnezuDrCdFj/6IA4X0pOA4HDiHs2mb7zGPef29BrVu
	A/Y7gQl7KzI7eiDXcjVBstmsWygmAJJhpfysE+e1RO0k25O2zYH94UQp4jLPGtdUMBpBmIQyU6jFC
	ToHTsabzpUWa0JaiB5PIDoEGo87a3GiXy+5X/fzIbbC5a/Kesz3/22A8XbYOjtBj/DN1jpTzUg1Gf
	MQOy/BfM+zjXoBb97kz0ZTrm+PDGzK+Th35EzRjHIbTBU7E+1xPGnuyW8j041mykL/DDAGSqSVGTM
	KgiWYEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7wm-00000009crQ-2A7j;
	Mon, 16 Dec 2024 10:03:28 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7ud-00000009cNG-2ACP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:01:16 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGA0xiO3459903
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 04:01:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734343260;
	bh=csO8Xa/AKFDOquuaniBbxWb0OFjh+/mPUotl4drJc8c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tqcz6peye7QXu13VTR0TCU72KHeZeXk0Xd/8Gt7H7fJCP0MYYX4Tpk4PejXvVQ3jY
	 aVKOExwhBkNB3D35r4ftuIBfRIkNCBwMq8G7d6HqJpVS8cJ4PxI0inm9pSKKmddeGD
	 EhNt7omr1LB17E1KSQb49NwAUVLrmqoXNF5CmRH4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGA0x4o058784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Dec 2024 04:00:59 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Dec 2024 04:00:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Dec 2024 04:00:59 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGA0xc7081728;
	Mon, 16 Dec 2024 04:00:59 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BGA0wNT000627;
	Mon, 16 Dec 2024 04:00:58 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <aleksander.lobakin@intel.com>, <lukma@denx.de>, <m-malladi@ti.com>,
        <diogo.ivo@siemens.com>, <rdunlap@infradead.org>,
        <schnelle@linux.ibm.com>, <vladimir.oltean@nxp.com>,
        <horms@kernel.org>, <rogerq@kernel.org>, <danishanwar@ti.com>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH net-next 2/4] net: ti: icssg-prueth: Add VLAN support in EMAC mode
Date: Mon, 16 Dec 2024 15:30:42 +0530
Message-ID: <20241216100044.577489-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216100044.577489-1-danishanwar@ti.com>
References: <20241216100044.577489-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_020115_637889_91A980FF 
X-CRM114-Status: GOOD (  11.53  )
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

Add support for vlan filtering in dual EMAC mode.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 29 +++++++++-----------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index c568c84a032b..e031bccf31dc 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -822,19 +822,18 @@ static int emac_ndo_vlan_rx_add_vid(struct net_device *ndev,
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
 	struct prueth *prueth = emac->prueth;
+	int port_mask = BIT(emac->port_id);
 	int untag_mask = 0;
-	int port_mask;
 
-	if (prueth->is_hsr_offload_mode) {
-		port_mask = BIT(PRUETH_PORT_HOST) | BIT(emac->port_id);
-		untag_mask = 0;
+	if (prueth->is_hsr_offload_mode)
+		port_mask |= BIT(PRUETH_PORT_HOST);
 
-		netdev_dbg(emac->ndev, "VID add vid:%u port_mask:%X untag_mask %X\n",
-			   vid, port_mask, untag_mask);
+	netdev_err(emac->ndev, "VID add vid:%u port_mask:%X untag_mask %X\n",
+		   vid, port_mask, untag_mask);
+
+	icssg_vtbl_modify(emac, vid, port_mask, untag_mask, true);
+	icssg_set_pvid(emac->prueth, vid, emac->port_id);
 
-		icssg_vtbl_modify(emac, vid, port_mask, untag_mask, true);
-		icssg_set_pvid(emac->prueth, vid, emac->port_id);
-	}
 	return 0;
 }
 
@@ -843,18 +842,16 @@ static int emac_ndo_vlan_rx_del_vid(struct net_device *ndev,
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
 	struct prueth *prueth = emac->prueth;
+	int port_mask = BIT(emac->port_id);
 	int untag_mask = 0;
-	int port_mask;
 
-	if (prueth->is_hsr_offload_mode) {
+	if (prueth->is_hsr_offload_mode)
 		port_mask = BIT(PRUETH_PORT_HOST);
-		untag_mask = 0;
 
-		netdev_dbg(emac->ndev, "VID del vid:%u port_mask:%X untag_mask  %X\n",
-			   vid, port_mask, untag_mask);
+	netdev_err(emac->ndev, "VID del vid:%u port_mask:%X untag_mask  %X\n",
+		   vid, port_mask, untag_mask);
+	icssg_vtbl_modify(emac, vid, port_mask, untag_mask, false);
 
-		icssg_vtbl_modify(emac, vid, port_mask, untag_mask, false);
-	}
 	return 0;
 }
 
-- 
2.34.1


