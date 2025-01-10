Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21173E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVxixcrdnty6NBRSBKc6Ls2j5DENQfIdeHD3xmsLfOY=; b=g63F1EST5UhIJlLdcuiuvxakjQ
	tAshPz5sx8TgpDeMgvD9j3d2Aojv7DRAUavvzOqyg6+Gx/TH1SapGdmHcsxCE0SYV14NTxW5TTfBL
	ey8Jj4Pfiph4h1ap+mnkRNDcX4JqSDRnj1vndNoj1wf0ZcabDp48UsA8ivPf/MCa68U5+C7UKKB9X
	w/VYrfSCNlDNyS9KVQEUrv4MYCIjQJV30Whauvpkhhl3ap9ehN5728lU1IZcEGO/nzZq0/K5CpWmW
	EXvnLrrSGKYd1FNwYl4/BoVkj2AcSi3UdPXV98Edh9pU8TBpbdGvUv9SR8FFMSfzHOMKSezcBS5uV
	7ak7+Xmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAT8-0000000EY2W-25Wc;
	Fri, 10 Jan 2025 08:34:14 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAOP-0000000EWte-2xuq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 08:29:22 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50A8T2dY3006571
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jan 2025 02:29:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736497742;
	bh=LVxixcrdnty6NBRSBKc6Ls2j5DENQfIdeHD3xmsLfOY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VNGjJ/6YCLcn0aQPWVJO0UarlQRostd3VfOOf8QYerc6QaQxKeI5gSkJz9tJFpWBE
	 orHbV0APu0kbDawjdjkv12qb4eii6pqH4g6p/Qmi2yDAqBa8YwGHVSi43Aqsq5eLK9
	 mUCr51FJfnNBmRPsVMg/ispdMPa8YpZIn7ZoCR+Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50A8T2Iw023460;
	Fri, 10 Jan 2025 02:29:02 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 02:29:01 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 02:29:01 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50A8T1o5057032;
	Fri, 10 Jan 2025 02:29:01 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 50A8T0J4021271;
	Fri, 10 Jan 2025 02:29:01 -0600
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
Subject: [PATCH net-next v4 1/4] net: ti: icssg-prueth: Add VLAN support in EMAC mode
Date: Fri, 10 Jan 2025 13:58:49 +0530
Message-ID: <20250110082852.3899027-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110082852.3899027-1-danishanwar@ti.com>
References: <20250110082852.3899027-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_002921_831501_BD66A8DA 
X-CRM114-Status: GOOD (  12.89  )
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

Add support for VLAN filtering in dual EMAC mode.

Reviewed-by: Roger Quadros <rogerq@kernel.org>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 29 +++++++++-----------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index d76fe6d05e10..1d510c9dabff 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -907,19 +907,18 @@ static int emac_ndo_vlan_rx_add_vid(struct net_device *ndev,
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
 
@@ -928,18 +927,16 @@ static int emac_ndo_vlan_rx_del_vid(struct net_device *ndev,
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


