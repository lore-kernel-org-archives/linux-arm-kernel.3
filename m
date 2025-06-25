Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFB9C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 02:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hDlURuexh0gNzmRq6XYtx1yKXYYyrlNPo56JmPLO2KA=; b=eC0es2ZuQIyzMjpJYdl70UNtPU
	eLMw2CB7yZxs45UmgSL7sRhkeWxKBRXGwFFTpu16rE4wQ2X7cv3gCHl3JTjiFgwyuYh7x8PEGzGXS
	kkzbV/0/VvfRyNbyVTMcOHaKgw5Nn2+f0Z6h5GqvvcDH4JnYrVcUaX0zVK++NwVnf9LHqaULJ8WUZ
	xadKIj+/knuAbRsKmfb7T6xP8nwzR51OvZE8DF9vQfYysrFlNj2cLnDfMgNy9BO+ntmSWQtpSrNNj
	kFFooIquNnlqJLrxWEaeGyC8wOIf1GYDpWpL/TsbyfnLbXc4OUN+dF2ZlrTyaki3P+q9evOUJvqAH
	5PagKshg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGHF-00000007MSA-0x43;
	Wed, 25 Jun 2025 02:54:21 +0000
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.123])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGEs-00000007MIH-3sbq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 02:51:56 +0000
X-CSE-ConnectionGUID: RQz7XIEZRfSD6zQw4klrkw==
X-CSE-MsgGUID: W3l9fVWGSZu3x6laMDNs5w==
X-IronPort-AV: E=Sophos;i="6.16,263,1744041600"; 
   d="scan'208";a="144173493"
From: EricChan <chenchuangyu@xiaomi.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>
CC: Feiyang Chen <chenfeiyang@loongson.cn>, Serge Semin
	<fancer.lancer@gmail.com>, Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen
	<chenhuacai@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	<netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, xiaojianfeng
	<xiaojianfeng1@xiaomi.com>, EricChan <chenchuangyu@xiaomi.com>, xiongliang
	<xiongliang@xiaomi.com>
Subject: [PATCH] net: stmmac: Fix interrupt handling for level-triggered mode in DWC_XGMAC2
Date: Wed, 25 Jun 2025 10:51:34 +0800
Message-ID: <20250625025134.97056-1-chenchuangyu@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.237.8.166]
X-ClientProxiedBy: BJ-MBX08.mioffice.cn (10.237.8.128) To BJ-MBX15.mioffice.cn
 (10.237.8.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_195155_140749_1D0B598D 
X-CRM114-Status: GOOD (  10.32  )
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

According to the Synopsys Controller IP XGMAC-10G Ethernet MAC Databook
v3.30a (section 2.7.2), when the INTM bit in the DMA_Mode register is set
to 2, the sbd_perch_tx_intr_o[] and sbd_perch_rx_intr_o[] signals operate
in level-triggered mode. However, in this configuration, the DMA does not
assert the XGMAC_NIS status bit for Rx or Tx interrupt events.

This creates a functional regression where the condition
if (likely(intr_status & XGMAC_NIS)) in dwxgmac2_dma_interrupt() will
never evaluate to true, preventing proper interrupt handling for
level-triggered mode. The hardware specification explicitly states that
"The DMA does not assert the NIS status bit for the Rx or Tx interrupt
events" (Synopsys DWC_XGMAC2 Databook v3.30a, sec. 2.7.2).

The fix ensures correct handling of both edge and level-triggered
interrupts while maintaining backward compatibility with existing
configurations.

Signed-off-by: EricChan <chenchuangyu@xiaomi.com>
---
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 7840bc403788..5dcc95bc0ad2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -364,19 +364,17 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
 	}
 
 	/* TX/RX NORMAL interrupts */
-	if (likely(intr_status & XGMAC_NIS)) {
-		if (likely(intr_status & XGMAC_RI)) {
-			u64_stats_update_begin(&stats->syncp);
-			u64_stats_inc(&stats->rx_normal_irq_n[chan]);
-			u64_stats_update_end(&stats->syncp);
-			ret |= handle_rx;
-		}
-		if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
-			u64_stats_update_begin(&stats->syncp);
-			u64_stats_inc(&stats->tx_normal_irq_n[chan]);
-			u64_stats_update_end(&stats->syncp);
-			ret |= handle_tx;
-		}
+	if (likely(intr_status & XGMAC_RI)) {
+		u64_stats_update_begin(&stats->syncp);
+		u64_stats_inc(&stats->rx_normal_irq_n[chan]);
+		u64_stats_update_end(&stats->syncp);
+		ret |= handle_rx;
+	}
+	if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
+		u64_stats_update_begin(&stats->syncp);
+		u64_stats_inc(&stats->tx_normal_irq_n[chan]);
+		u64_stats_update_end(&stats->syncp);
+		ret |= handle_tx;
 	}
 
 	/* Clear interrupts */
-- 
2.34.1


