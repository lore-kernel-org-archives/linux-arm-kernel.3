Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0825AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 02:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sguOp4nD5Sy6W4yz6nV2EPHGwRcagxBNPPIucRoHf3o=; b=MoCKh7JaH3FyWt2M/A/bYNggEQ
	K/wFM4ACo/uFDT5q8M2398UM1bhG2sWlwfrMYJ79Te85DEAv3zju7eD5WYpYjuFDkO4ZzKvdJT2+q
	nvlTG8LJmBlBbI1iBOhdDuJLxo8MLDLGo+MyPcvVXX8I3vw5mDhL3WguotrjrX14eR4X3y05iUW48
	SV00JXIJW3ibf0iYDNZ0bdaljyRbPvyMvvShUvm2mcXC0kkHVrtAk+KcRMUD1dPjxbfR+GzDIeLda
	+rmtBWuMPSfQRZ47mco4U4lbjaZmsjn9TXLbvUB1VY6rDxtLeR1hOG/0faqn3nO4uzMo635vn9cV4
	HASnKpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFMB-0000000Dc2V-23LH;
	Thu, 16 Jan 2025 02:11:39 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFJj-0000000DbhV-1Cq2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 02:09:08 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Jan 2025 11:09:00 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id CF9BA200C4F1;
	Thu, 16 Jan 2025 11:09:00 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Thu, 16 Jan 2025 11:09:00 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 1055EAB187;
	Thu, 16 Jan 2025 11:09:00 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net 2/2] net: stmmac: Limit the number of MTL queues to maximum value
Date: Thu, 16 Jan 2025 11:08:53 +0900
Message-Id: <20250116020853.2835521-2-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250116020853.2835521-1-hayashi.kunihiko@socionext.com>
References: <20250116020853.2835521-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_180907_434003_F2EF9AA3 
X-CRM114-Status: GOOD (  13.35  )
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

The number of MTL queues to use is specified by the parameter
"snps,{tx,rx}-queues-to-use" from the platform layer.

However, the maximum number of queues is determined by
the macro MTL_MAX_{TX,RX}_QUEUES. It's appropriate to limit the
values not to exceed the upper limit values.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index ad868e8d195d..471eb1a99d90 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -165,6 +165,8 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	if (of_property_read_u32(rx_node, "snps,rx-queues-to-use",
 				 &plat->rx_queues_to_use))
 		plat->rx_queues_to_use = 1;
+	if (plat->rx_queues_to_use > MTL_MAX_RX_QUEUES)
+		plat->rx_queues_to_use = MTL_MAX_RX_QUEUES;
 
 	if (of_property_read_bool(rx_node, "snps,rx-sched-sp"))
 		plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
@@ -224,6 +226,8 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	if (of_property_read_u32(tx_node, "snps,tx-queues-to-use",
 				 &plat->tx_queues_to_use))
 		plat->tx_queues_to_use = 1;
+	if (plat->tx_queues_to_use > MTL_MAX_TX_QUEUES)
+		plat->tx_queues_to_use = MTL_MAX_TX_QUEUES;
 
 	if (of_property_read_bool(tx_node, "snps,tx-sched-wrr"))
 		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
-- 
2.25.1


