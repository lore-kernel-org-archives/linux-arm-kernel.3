Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729B9C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 05:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XXLD865rjeG9cSENWhdUVc+OpBinPzfDE6dOi5MR3Hk=; b=gD4IbWPUM6+vWEQYDWHWNnTpOr
	zjKn2ukPBGCJu79GPfCFrHKMop/VbqRW8ILU9CH+TkS/BNansVQllMFSoewuYbHO79KJZJ7OCmNAC
	MH4T0ZeKVfalgorhvM80YiV0jpVwno/DBjWS6fb8dLKa4QjMpGSw/QptRL/ZoKkwMPEToUD7z0je8
	a+koxsKNbFBLxajrWJF6ITj9F8zQnU6ZIRr3oVyTpz78mpYRlzd8ro+UWT6J0nXkmBzPF13ahZUWz
	bsLPExAfHTajsklaA9XTM02mDJVU8E9FGy5hChjJqUuEHukgdj4sILod2/BWzhR2KQP/VFtHoIU7W
	ort0lxtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLSF-00000004DVN-3DLL;
	Fri, 21 Feb 2025 05:20:03 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLQm-00000004DA9-1LpF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 05:18:34 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 21 Feb 2025 14:18:27 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 21B6E20AE29A;
	Fri, 21 Feb 2025 14:18:27 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Fri, 21 Feb 2025 14:18:27 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id CAB493732;
	Fri, 21 Feb 2025 14:18:26 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net-next v2] net: stmmac: Correct usage of maximum queue number macros
Date: Fri, 21 Feb 2025 14:18:18 +0900
Message-Id: <20250221051818.4163678-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_211832_481712_EF2EDE55 
X-CRM114-Status: GOOD (  14.57  )
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

The maximum numbers of each Rx and Tx queues are defined by
MTL_MAX_RX_QUEUES and MTL_MAX_TX_QUEUES respectively.

There are some places where Rx and Tx are used in reverse. There is no
issue when the Tx and Rx macros have the same value, but should correct
usage of macros for maximum queue number to keep consistency and prevent
unexpected mistakes.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 55053528e498..412b07e77945 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -101,8 +101,8 @@ struct stmmac_rxq_stats {
 /* Updates on each CPU protected by not allowing nested irqs. */
 struct stmmac_pcpu_stats {
 	struct u64_stats_sync syncp;
-	u64_stats_t rx_normal_irq_n[MTL_MAX_TX_QUEUES];
-	u64_stats_t tx_normal_irq_n[MTL_MAX_RX_QUEUES];
+	u64_stats_t rx_normal_irq_n[MTL_MAX_RX_QUEUES];
+	u64_stats_t tx_normal_irq_n[MTL_MAX_TX_QUEUES];
 };
 
 /* Extra statistic and debug information exposed by ethtool */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index f05cae103d83..dae279ee2c28 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -257,7 +257,7 @@ struct stmmac_priv {
 	/* Frequently used values are kept adjacent for cache effect */
 	u32 tx_coal_frames[MTL_MAX_TX_QUEUES];
 	u32 tx_coal_timer[MTL_MAX_TX_QUEUES];
-	u32 rx_coal_frames[MTL_MAX_TX_QUEUES];
+	u32 rx_coal_frames[MTL_MAX_RX_QUEUES];
 
 	int hwts_tx_en;
 	bool tx_path_in_lpi_mode;
@@ -265,8 +265,7 @@ struct stmmac_priv {
 	int sph;
 	int sph_cap;
 	u32 sarc_type;
-
-	u32 rx_riwt[MTL_MAX_TX_QUEUES];
+	u32 rx_riwt[MTL_MAX_RX_QUEUES];
 	int hwts_rx_en;
 
 	void __iomem *ioaddr;
@@ -343,7 +342,7 @@ struct stmmac_priv {
 	char int_name_sfty[IFNAMSIZ + 10];
 	char int_name_sfty_ce[IFNAMSIZ + 10];
 	char int_name_sfty_ue[IFNAMSIZ + 10];
-	char int_name_rx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 14];
+	char int_name_rx_irq[MTL_MAX_RX_QUEUES][IFNAMSIZ + 14];
 	char int_name_tx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 18];
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.25.1


