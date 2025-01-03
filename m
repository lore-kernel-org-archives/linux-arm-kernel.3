Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13479E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBhfzVNPoQY702/fU5BRMtzSyvCNkOs9LmubC0XHVK4=; b=QMU8yJvUV9HuESYXU4eoOekTCt
	KxJbAAMTTnBWIv8uIR8FxTCIFVXE/mQ79VeY9LY+1vnVD9S09bMYbud1hC7/cOBU/Vq4++rLxW1x4
	QF/vyJ2I2xKd4dy24I8mijbhKkXyxAdZJe6qj0U8+DrAUxq7fcRgE1LDeoHtReBl4AVqB5pfSgLaV
	SkfUQI1bQxm1A3hrUgmNyeal8UZliOUWzxVDdKQfx8wvTgZ58LQL/PspwzwbCO2ulkLgD+eAgMjWo
	hK7nYyZB3DtnLNG0BoFSZnYjVlOsiDlBXJ9LV5+6IlRhLiQ2pqsth9Yj4IVl+gxRrVSFeXDFUzibI
	jnapVt5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdsh-0000000Capm-0jYe;
	Fri, 03 Jan 2025 09:22:11 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdrV-0000000CaYu-0Vjx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 09:20:58 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5039KeUG2377018
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 03:20:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735896040;
	bh=dBhfzVNPoQY702/fU5BRMtzSyvCNkOs9LmubC0XHVK4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KRPe9Up6qUjoXYQ8DN1QDFRBmuO7JOoGuybChUghGLZ9827FEe9zc/0y5rL38984Z
	 l+C128AbwFmGKJNaVlca3Y9wxt/2NKcJjifLlCewECXHDV4vJxbYea5GxBWCj6S2Mk
	 c91Hgo+lqXUuDuMlMvm+kf/tg9GaJBIjCMGGret4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5039Kep9003472;
	Fri, 3 Jan 2025 03:20:40 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 03:20:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 03:20:40 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5039Keb6055118;
	Fri, 3 Jan 2025 03:20:40 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5039KdY1016895;
	Fri, 3 Jan 2025 03:20:39 -0600
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
Subject: [PATCH net-next v3 1/3] net: ti: icssg-prueth: Add VLAN support in EMAC mode
Date: Fri, 3 Jan 2025 14:50:31 +0530
Message-ID: <20250103092033.1533374-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103092033.1533374-1-danishanwar@ti.com>
References: <20250103092033.1533374-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_012057_285382_FE718858 
X-CRM114-Status: GOOD (  12.52  )
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


