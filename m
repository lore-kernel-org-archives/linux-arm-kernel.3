Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB3C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iP0T5oXi3Q3oEEAfrVPN8VR/ZE2JZKWe+VnJKpQR35M=; b=GC6Co4abbmTX8cg8gAExO5NhOF
	yvvEf+CgG8c2pplmU4T6yHrkjx7v6bDq6rJ2L3Q1uFDeSOXyxZW1Zj1I/sUEVijxZA+4wUB+keDDb
	JbQtFYlR3+Uu72hJuQbO3ROP8j1TgGyEWlZ1BRSenRt3tWc2ELqBlH6aWy5AK77alIPht23Td5kHU
	gAghk+6KSYA34uYiU72/dUy64O51wW+4BNBG+5T517BxgmQZPjdHZnwXxOqi/Sr/F35LRWCihQDMb
	El0tGnc02ONpEwluJzZ1trK0Mt8aApUwl4wn+O8xl+qLfcYI1NARUdZu80qNc6JFP+DwV2RW6r+77
	Picn46bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU82-00000004jM3-2wd5;
	Fri, 09 May 2025 20:15:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP4v-00000003zmE-31Au;
	Fri, 09 May 2025 14:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA0565C6BA1;
	Fri,  9 May 2025 14:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49774C4CEE4;
	Fri,  9 May 2025 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746802316;
	bh=IHVpr0VzHpVvxO4VqdjE7KLzqR7krK7RWlRO2jMDmmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dhdr1I3/X6OyrTnlfJX49BUp1txYFHi5OMGTszsS1NyuvuV82tW31+qliuH3aRMWu
	 hbLRoOsrvTJz9tdidHteM1P9GTUO3vp+ar2Zlec4H3muV3Gw9+Ik3m9vjU+ZrG2+fQ
	 /WNSwb9EcXVxQIfEBFG9dGSTSeG1fubOre0P9mgdDqs4/+R3EmkoD6K1ZbodUN2Vmh
	 zmtTzB8FasL6nKsXrEfpZm0i+6ztyAdMSd3rv8Bk2vPgxnOApPJMbLb2WZdMyztqVo
	 hgwFSena5xa14lvhcqqgWbXOVXjepj8EPaK05zGqn2x0NZe3ineL5MT5NAx159ZjuB
	 cfEMiEGBo8kYg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 09 May 2025 16:51:34 +0200
Subject: [PATCH net-next v2 2/2] net: airoha: Add the capability to
 allocate hw buffers in SRAM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-airopha-desc-sram-v2-2-9dc3d8076dfb@kernel.org>
References: <20250509-airopha-desc-sram-v2-0-9dc3d8076dfb@kernel.org>
In-Reply-To: <20250509-airopha-desc-sram-v2-0-9dc3d8076dfb@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_075157_847447_A7FB18A5 
X-CRM114-Status: GOOD (  15.99  )
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

In order to improve packet processing and packet forwarding
performances, EN7581 SoC supports allocating buffers for hw forwarding
queues in SRAM instead of DRAM if available on the system.
Rely on SRAM for buffers allocation if available on the system and use
DRAM as fallback.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 57 +++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 16c7896f931fd9532aa3b8cc78f41afc676aa117..b11c25442eb8c8c2b5aa45ded7a9d61e24aa2e4a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -5,6 +5,7 @@
  */
 #include <linux/of.h>
 #include <linux/of_net.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
 #include <linux/u64_stats_sync.h>
@@ -1076,9 +1077,11 @@ static void airoha_qdma_cleanup_tx_queue(struct airoha_queue *q)
 static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 {
 	struct airoha_eth *eth = qdma->eth;
+	int id = qdma - &eth->qdma[0];
 	dma_addr_t dma_addr;
-	u32 status;
-	int size;
+	const char *name;
+	int size, index;
+	u32 status, val;
 
 	size = HW_DSCP_NUM * sizeof(struct airoha_qdma_fwd_desc);
 	qdma->hfwd.desc = dmam_alloc_coherent(eth->dev, size, &dma_addr,
@@ -1088,12 +1091,45 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 
 	airoha_qdma_wr(qdma, REG_FWD_DSCP_BASE, dma_addr);
 
-	size = AIROHA_MAX_PACKET_SIZE * HW_DSCP_NUM;
-	qdma->hfwd.q = dmam_alloc_coherent(eth->dev, size, &dma_addr,
-					   GFP_KERNEL);
-	if (!qdma->hfwd.q)
+	name = devm_kasprintf(eth->dev, GFP_KERNEL, "qdma%d-buf", id);
+	if (!name)
 		return -ENOMEM;
 
+	index = of_property_match_string(eth->dev->of_node,
+					 "memory-region-names", name);
+	if (index >= 0) { /* buffers in sram */
+		struct reserved_mem *rmem;
+		struct device_node *np;
+		void *q;
+
+		np = of_parse_phandle(eth->dev->of_node, "memory-region",
+				      index);
+		if (!np)
+			return -ENODEV;
+
+		rmem = of_reserved_mem_lookup(np);
+		of_node_put(np);
+
+		/* SRAM is actual memory and supports transparent access just
+		 * like DRAM. Hence we don't require __iomem being set and
+		 * we don't need to use accessor routines to read from or write
+		 * to SRAM.
+		 */
+		q = (void __force *)devm_ioremap(eth->dev, rmem->base,
+						 rmem->size);
+		if (!q)
+			return -ENOMEM;
+
+		qdma->hfwd.q = q;
+		dma_addr = rmem->base;
+	} else {
+		size = AIROHA_MAX_PACKET_SIZE * HW_DSCP_NUM;
+		qdma->hfwd.q = dmam_alloc_coherent(eth->dev, size, &dma_addr,
+						   GFP_KERNEL);
+		if (!qdma->hfwd.q)
+			return -ENOMEM;
+	}
+
 	airoha_qdma_wr(qdma, REG_FWD_BUF_BASE, dma_addr);
 
 	airoha_qdma_rmw(qdma, REG_HW_FWD_DSCP_CFG,
@@ -1101,11 +1137,14 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 			FIELD_PREP(HW_FWD_DSCP_PAYLOAD_SIZE_MASK, 0));
 	airoha_qdma_rmw(qdma, REG_FWD_DSCP_LOW_THR, FWD_DSCP_LOW_THR_MASK,
 			FIELD_PREP(FWD_DSCP_LOW_THR_MASK, 128));
+
+	val = FIELD_PREP(HW_FWD_DESC_NUM_MASK, HW_DSCP_NUM) |
+	      LMGR_INIT_START;
+	if (index >= 0)
+		val |= LMGR_SRAM_MODE_MASK;
 	airoha_qdma_rmw(qdma, REG_LMGR_INIT_CFG,
 			LMGR_INIT_START | LMGR_SRAM_MODE_MASK |
-			HW_FWD_DESC_NUM_MASK,
-			FIELD_PREP(HW_FWD_DESC_NUM_MASK, HW_DSCP_NUM) |
-			LMGR_INIT_START);
+			HW_FWD_DESC_NUM_MASK, val);
 
 	return read_poll_timeout(airoha_qdma_rr, status,
 				 !(status & LMGR_INIT_START), USEC_PER_MSEC,

-- 
2.49.0


