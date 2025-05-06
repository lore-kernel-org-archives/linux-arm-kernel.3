Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE09C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwn/nB2s1mWnia5rEGt+fuy0yNLE//GziOUFT14kOpg=; b=lCdRSjDtODoKBjYgJ8SUUigCrU
	bpGa2uPR2cGOXeIyrikDbtwwcfxBcA9ZgZm6O9hq0pBOyZKN0MEuK5yt6z694M5uIUeHcck9WMGcf
	XHaZjdHEV5soekJ1nJ/CW9N2tzKGmVJVff5vDMchO9yXbHt4XAG38DsfuzXQGwPMAH6kqinGb7ysK
	vAiDYOqxhcgdhA8q/cs8J3wqSCR5icVVqryPL6gAa2LD82N7lsq5SU1GE0J0P26zgBMLy0PpacM3w
	09heQuazTRxZ4JMD7gOzCagpu+iz1T+wM7YjAHvFvT61WT04KByBvFFNfDsxdVr0EP8pIq4+ZwUTX
	+ZBRen+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIQY-0000000C8eD-0QgE;
	Tue, 06 May 2025 13:33:42 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCG7u-0000000BfQr-2rQ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:06:22 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546B5wX71035554
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 06:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746529558;
	bh=lwn/nB2s1mWnia5rEGt+fuy0yNLE//GziOUFT14kOpg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vGIG9+Frwej8VHGdVitTr95aGGSLopkiZxto4Kjg+/Cvi2NAZ6DSl8M/Xy08Xhb52
	 h7KjBWW/SKDImsybPWDkqYiHG0ShGK6cx25v/VXVQMPzm566aUxC9IVOBl82Kp28/y
	 OvdKr9IM1/2Uu925eEpxsF+pAvzRowgxS48nL1ug=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546B5wEe055864
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 06:05:58 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 06:05:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 06:05:57 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546B5vmb055972;
	Tue, 6 May 2025 06:05:57 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 546B5uUL010343;
	Tue, 6 May 2025 06:05:57 -0500
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
Subject: [PATCH net v2 2/3] net: ti: icssg-prueth: Fix kernel panic during concurrent Tx queue access
Date: Tue, 6 May 2025 16:35:45 +0530
Message-ID: <20250506110546.4065715-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506110546.4065715-1-m-malladi@ti.com>
References: <20250506110546.4065715-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_040618_848602_7A7759F2 
X-CRM114-Status: GOOD (  16.73  )
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

Changes from v1 (v2-v1):
- Move netif_tx_lock/unlock outside of the loop, reported by Jesper Dangaard Brouer <hawk@kernel.org>

 drivers/net/ethernet/ti/icssg/icssg_common.c | 7 ++++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 79f2d86acf21..36d5cb25c017 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -650,6 +650,8 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
 			struct page *page, u32 *len)
 {
 	struct net_device *ndev = emac->ndev;
+	struct netdev_queue *netif_txq;
+	int cpu = smp_processor_id();
 	struct bpf_prog *xdp_prog;
 	struct xdp_frame *xdpf;
 	u32 pkt_len = *len;
@@ -669,8 +671,11 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
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
index ee35fecf61e7..86fc1278127c 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1075,17 +1075,21 @@ static int emac_xdp_xmit(struct net_device *dev, int n, struct xdp_frame **frame
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
 
+	__netif_tx_lock(netif_txq, cpu);
 	for (i = 0; i < n; i++) {
 		xdpf = frames[i];
 		err = emac_xmit_xdp_frame(emac, xdpf, NULL, q_idx);
@@ -1095,6 +1099,7 @@ static int emac_xdp_xmit(struct net_device *dev, int n, struct xdp_frame **frame
 		}
 		nxmit++;
 	}
+	__netif_tx_unlock(netif_txq);
 
 	return nxmit;
 }
-- 
2.43.0


