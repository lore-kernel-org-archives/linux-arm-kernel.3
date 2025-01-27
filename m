Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACD4C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bn4zq+P7vxt+KbJ/wTEZezlcKaKqo61l4nvIpB5EGwQ=; b=CFoL90bMG81CJYfSRJRVUcyh4Q
	F9HMnBKzQGsPCNgKMDQem7eqaY/nnrL9ZBgRh13Woo/+n7KOwX3f0urz6PJuFUBrfhZgvbMiardGl
	L5f/4XyYQJJUuXwg0p6yc3IXj+zIj+n/q1t6nR1a2ffN9eR4YUcSwluZthH5IB8UU6vZx5kWvX1n4
	L2r5Msr56JfjPTCtJV1AVK9RJeMGb2cVmdtBa/kxWmeNbIGBGyCfJK53RB//6tXv13uSrqqbuTyEL
	1xATmNnci+xGQ+Z5U9jLJmVzc5EpCEFurqzPyPcpe6+6RSebTi1b3udYWd49VdZkPQnDNpgRLgXiy
	63dRlGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLRe-000000020U2-1BFg;
	Mon, 27 Jan 2025 09:30:14 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLMc-00000001zIo-1lvq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:25:03 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 27 Jan 2025 18:25:00 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 47147200B5D4;
	Mon, 27 Jan 2025 18:25:00 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Mon, 27 Jan 2025 18:25:00 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 996D8AB187;
	Mon, 27 Jan 2025 18:24:59 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net 3/3] net: stmmac: Fix use of queue max macros for irq statistics
Date: Mon, 27 Jan 2025 18:24:50 +0900
Message-Id: <20250127092450.2945611-4-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com>
References: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_012502_573015_C21BBF7A 
X-CRM114-Status: GOOD (  13.28  )
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

Fix macros for maximum queue number to keep consistency.

Fixes: 38cc3c6dcc09 ("net: stmmac: protect updates of 64-bit statistics counters")
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 684489156dce..b6966218cb77 100644
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
-- 
2.25.1


