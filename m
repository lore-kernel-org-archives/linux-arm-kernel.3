Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F76CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBhfzVNPoQY702/fU5BRMtzSyvCNkOs9LmubC0XHVK4=; b=PFgFHn3ir8vtRM2/+HcV5qSXk2
	yZPOgxtL72nIanf6bMV1NMq7kHiXNtoDLO+imKeaOb2bs7qyG1JtKMxC8LjQMN/wQmobtGqHwE6Wa
	ZLAPIPCMwQ/lA8yATTdkPWlYqFBETH6pDbrUOf8IyysriNSx+3E4R+s1MhZMNwHPYqaGyYdKre4gW
	Walfb+nF3zKP4jpkjeQEioa+Hjd6u40dQH4NueWYABa1QslTqGPITpJRQv8aBqG6G6WCjOh4Zg3rO
	athDyZLDt6uwPUAzDy6My8cTXzw9P4HhmQkGxRRRlobhzkfpwDscMjKrQglhfCuqP3OubjgwFL55+
	ns1zu7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPemU-00000009ecv-2zqG;
	Mon, 23 Dec 2024 09:31:18 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPehj-00000009e7f-0BAF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 09:26:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BN9Q3JU856692
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Dec 2024 03:26:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734945963;
	bh=dBhfzVNPoQY702/fU5BRMtzSyvCNkOs9LmubC0XHVK4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ggFw+YUHA4/1UqxcqEz4De3AINXPz9ThEZQiJIZ10a7RgZ47cebK/S+YX/718L32V
	 BXrrKpzEhVwSk39NjfS2299vZvC4Xi7YhyKXKFZ969X7QjoRy97x7LU2WcIZ3i/C8c
	 r22MA//4mTmY3LdzmzEzQ0BZ9CQM4Ccge1fE2A54=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BN9Q3Yn013531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Dec 2024 03:26:03 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Dec 2024 03:26:02 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Dec 2024 03:26:02 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BN9Q2vB127941;
	Mon, 23 Dec 2024 03:26:02 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BN9Q1Jq006694;
	Mon, 23 Dec 2024 03:26:02 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <wojciech.drewek@intel.com>, <n.zhandarovich@fintech.ru>,
        <aleksander.lobakin@intel.com>, <lukma@denx.de>, <m-malladi@ti.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>,
        Larysa Zaremba <larysa.zaremba@intel.com>,
        Michal Swiatkowski
	<michal.swiatkowski@linux.intel.com>
Subject: [PATCH net-next v2 1/3] net: ti: icssg-prueth: Add VLAN support in EMAC mode
Date: Mon, 23 Dec 2024 14:55:55 +0530
Message-ID: <20241223092557.2077526-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223092557.2077526-1-danishanwar@ti.com>
References: <20241223092557.2077526-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_012623_194284_24CA3351 
X-CRM114-Status: GOOD (  11.80  )
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
index c568c84a032b..1663941e59e3 100644
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
+	netdev_dbg(emac->ndev, "VID add vid:%u port_mask:%X untag_mask %X\n",
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
+	netdev_dbg(emac->ndev, "VID del vid:%u port_mask:%X untag_mask  %X\n",
+		   vid, port_mask, untag_mask);
+	icssg_vtbl_modify(emac, vid, port_mask, untag_mask, false);
 
-		icssg_vtbl_modify(emac, vid, port_mask, untag_mask, false);
-	}
 	return 0;
 }
 
-- 
2.34.1


