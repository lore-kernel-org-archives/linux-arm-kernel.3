Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400E2C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOnsX2khC4QQb5DzauQ7MTn2WKff96OYmxGALdbK5CM=; b=m4Um6HO9VWdz3QkGGYrKkriRPC
	uFG4gdYB86Yg0jpUxCFYoCFTvFcziOT18JApbxVCDVQgrqkMn1cqSHTrF/F2suK4sZdiCvSSaLUqv
	BwlG5RH296JIrMrYKRfX94PgTmlT3XzayvCImzHSen+8+b2WjoP+DALnw8vz2C5leSeBPzxbLBP60
	znBKHqulwxROXtWMbSqhJ84Eua968E8sGSvZHSl/7rCnfAUNtYIADszCT4uWxA1xqCcWO4fnB9njx
	j/RCWUVDrUixB55EyW/4dGZ7fhsNwNgAbFNfh18lN8V+fLUGXeLxFqmAQyfphN2zNdQI1NaVGclT+
	z2wAOa+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Nvt-00000006GUR-2UCs;
	Mon, 28 Apr 2025 12:50:01 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NEr-0000000662d-1eax
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:05:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SC5IvP3393357
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 07:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745841918;
	bh=UOnsX2khC4QQb5DzauQ7MTn2WKff96OYmxGALdbK5CM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DTiiK5OTcuPZ7OW1xtZa+Ig0wRwTCT/hRNr354wkAlhVPgAP62gLS0hDK/8/nz1RW
	 c/3LWpMjWGDhyAYtsZI6BQqEoJdSxJCqhEIoELehC21TSm6EAx3vHl2f712kebwXCB
	 4a1P8WSNmXQuuldUIpoQR7C/E/5SKsJcUgrTS1eY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SC5IpX038345
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 07:05:18 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 07:05:17 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 07:05:17 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SC5H95098287;
	Mon, 28 Apr 2025 07:05:17 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 53SC5G1B016903;
	Mon, 28 Apr 2025 07:05:17 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <dan.carpenter@linaro.org>, <m-malladi@ti.com>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net 4/4] net: ti: icssg-prueth: Fix kernel panic during concurrent Tx queue access
Date: Mon, 28 Apr 2025 17:34:59 +0530
Message-ID: <20250428120459.244525-5-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428120459.244525-1-m-malladi@ti.com>
References: <20250428120459.244525-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_050533_530601_5BC2BA95 
X-CRM114-Status: GOOD (  15.60  )
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

Add __netif_tx_lock() to ensure that only one packet is being
transmitted at a time to avoid race conditions in the netif_txq
struct and prevent packet data corruption. Failing to do so causes
kernel panic with the following error:

[ 2184.746764] ------------[ cut here ]------------
[ 2184.751412] kernel BUG at lib/dynamic_queue_limits.c:99!
[ 2184.756728] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP

logs: https://gist.github.com/MeghanaMalladiTI/9c7aa5fc3b7fb03f87c74aad487956e9

The lock is acquired before calling emac_xmit_xdp_frame() and released after the
call returns. This ensures that the TX queue is protected from concurrent access
during the transmission of XDP frames.

Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 7 ++++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index a120ff6fec8f..e509b6ff81e7 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -660,6 +660,8 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
 			struct page *page, u32 *len)
 {
 	struct net_device *ndev = emac->ndev;
+	struct netdev_queue *netif_txq;
+	int cpu = smp_processor_id();
 	struct bpf_prog *xdp_prog;
 	struct xdp_frame *xdpf;
 	u32 pkt_len = *len;
@@ -679,8 +681,11 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
 			goto drop;
 		}
 
-		q_idx = smp_processor_id() % emac->tx_ch_num;
+		q_idx = cpu % emac->tx_ch_num;
+		netif_txq = netdev_get_tx_queue(ndev, q_idx);
+		__netif_tx_lock(netif_txq, cpu);
 		result = emac_xmit_xdp_frame(emac, xdpf, page, q_idx);
+		__netif_tx_unlock(netif_txq);
 		if (result == ICSSG_XDP_CONSUMED) {
 			ndev->stats.tx_dropped++;
 			goto drop;
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index ee35fecf61e7..b31060e7f698 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1075,20 +1075,25 @@ static int emac_xdp_xmit(struct net_device *dev, int n, struct xdp_frame **frame
 {
 	struct prueth_emac *emac = netdev_priv(dev);
 	struct net_device *ndev = emac->ndev;
+	struct netdev_queue *netif_txq;
+	int cpu = smp_processor_id();
 	struct xdp_frame *xdpf;
 	unsigned int q_idx;
 	int nxmit = 0;
 	u32 err;
 	int i;
 
-	q_idx = smp_processor_id() % emac->tx_ch_num;
+	q_idx = cpu % emac->tx_ch_num;
+	netif_txq = netdev_get_tx_queue(ndev, q_idx);
 
 	if (unlikely(flags & ~XDP_XMIT_FLAGS_MASK))
 		return -EINVAL;
 
 	for (i = 0; i < n; i++) {
 		xdpf = frames[i];
+		__netif_tx_lock(netif_txq, cpu);
 		err = emac_xmit_xdp_frame(emac, xdpf, NULL, q_idx);
+		__netif_tx_unlock(netif_txq);
 		if (err != ICSSG_XDP_TX) {
 			ndev->stats.tx_dropped++;
 			break;
-- 
2.43.0


