Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E22C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpHmsXnTE8Ah4aeveKhPrmGpWgl0nHpMPDu8HAWcLjI=; b=wwxsWQfrWxw4vCJkJlrYbH9eFc
	LE6Lk3qH74tpwSF85U6fPif87cWy0tPrUbb3rkAkK+3ks3sPEHVn7nitIwT25VW7UOVcYknVriuRw
	WAtdoxFA6/ieYtkKYW/fZ1ohdHtvhzgOwCc1+QCrxGJ4h9AF4nU+XOSiMCPt3KPBCBXqX4I45w+dr
	8+07QNIQG6bxg0+JLBifPjAAcoeNkHeZ88891k5Sm7lxQIx34SACHna1UHvu9TEjr/Gbgjt1ZzFF4
	zuiwpWyquYSTTKI+nTtNC2wLdnTUnav9ABf9nulgqVQXCQP0zraUxa0yGqNgo96ypTUY9VJstUapL
	vzPDqjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIWJ-0000000CABB-1fCa;
	Tue, 06 May 2025 13:39:39 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCG85-0000000BfU3-13Ah
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:06:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546B61Z8485503
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 06:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746529561;
	bh=RpHmsXnTE8Ah4aeveKhPrmGpWgl0nHpMPDu8HAWcLjI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mtGajJ+2ocilvtKLbYDb2fA4eaC6yhkid+AANZKiHs/wo99xmiAUbXhyqIAZ/9EeG
	 9FxgLhpalUm3bdpHxcsZZJLsGioZ7tXeIS9RTsLNNvYU0Nf9ESwUdxOvkwITi+omZc
	 Xhn77h3nhSEZV3fStZNG8j4T61STZj8Dveqp86HU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546B61Dw003211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 06:06:01 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 06:06:01 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 06:06:00 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546B60II102224;
	Tue, 6 May 2025 06:06:00 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 546B5xXU010352;
	Tue, 6 May 2025 06:06:00 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <namcao@linutronix.de>, <horms@kernel.org>, <m-malladi@ti.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v2 3/3] net: ti: icssg-prueth: Report BQL before sending XDP packets
Date: Tue, 6 May 2025 16:35:46 +0530
Message-ID: <20250506110546.4065715-4-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506110546.4065715-1-m-malladi@ti.com>
References: <20250506110546.4065715-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_040629_378568_6EAF949D 
X-CRM114-Status: GOOD (  13.54  )
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

When sending out any kind of traffic, it is essential that the driver
keeps reporting BQL of the number of bytes that have been sent so that
BQL can track the amount of data in the queue and prevents it from
overflowing. If BQL is not reported, the driver may continue sending
packets even when the queue is full, leading to packet loss, congestion
and decreased network performance. Currently this is missing in
emac_xmit_xdp_frame() and this patch fixes it.

Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

Changes from v1 (v2-v1):
- reordered the patches in the series as suggested by Jakub Kicinski <kuba@kernel.org>
- Dropped patch 3/4 from v1 as suggested by Jakub Kicinski <kuba@kernel.org>

 drivers/net/ethernet/ti/icssg/icssg_common.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 36d5cb25c017..5b8fdb882172 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -187,7 +187,6 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 			xdp_return_frame(xdpf);
 			break;
 		default:
-			netdev_err(ndev, "tx_complete: invalid swdata type %d\n", swdata->type);
 			prueth_xmit_free(tx_chn, desc_tx);
 			ndev->stats.tx_dropped++;
 			continue;
@@ -567,6 +566,7 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 {
 	struct cppi5_host_desc_t *first_desc;
 	struct net_device *ndev = emac->ndev;
+	struct netdev_queue *netif_txq;
 	struct prueth_tx_chn *tx_chn;
 	dma_addr_t desc_dma, buf_dma;
 	struct prueth_swdata *swdata;
@@ -620,12 +620,17 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 		swdata->data.xdpf = xdpf;
 	}
 
+	/* Report BQL before sending the packet */
+	netif_txq = netdev_get_tx_queue(ndev, tx_chn->id);
+	netdev_tx_sent_queue(netif_txq, xdpf->len);
+
 	cppi5_hdesc_set_pktlen(first_desc, xdpf->len);
 	desc_dma = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool, first_desc);
 
 	ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn, first_desc, desc_dma);
 	if (ret) {
 		netdev_err(ndev, "xdp tx: push failed: %d\n", ret);
+		netdev_tx_completed_queue(netif_txq, 1, xdpf->len);
 		goto drop_free_descs;
 	}
 
@@ -984,6 +989,7 @@ enum netdev_tx icssg_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev
 	ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn, first_desc, desc_dma);
 	if (ret) {
 		netdev_err(ndev, "tx: push failed: %d\n", ret);
+		netdev_tx_completed_queue(netif_txq, 1, pkt_len);
 		goto drop_free_descs;
 	}
 
-- 
2.43.0


