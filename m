Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35EAC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 18:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77ZybPD6gxC0PPIMAwwdSL1hyX9O5GrcbGwHDljN/Nk=; b=GDK4dFdNbnM2c5WtUO+yUwhg0h
	BhTNDXdPTXxyp9eqAeTrSmsG81voCWg+i6zMyvVvMEccu7G1ahZFAHU18kZ9IFpXl9EtPa6WHkbRM
	2ZVzJDd/Q2HTFgmmzovetZp2eTRfXkbsyc1QKowWEwQjKXVURwxGLo5jbqCh5f18609vOhbh8bp3l
	4zRyYazl+o2kDhH8MKPTDuxqxgFMfTLaMLW54RayqaE+FR5pPe5oLZKcvC4JJkF9BU/gMiGnFo02n
	R26Iix4VTv3C1w89tFMghjCBUBVcLjg8jovUzDWjpfkyMapI7cgUeUaRCy4YM5ogKI+mWVHmPYbOs
	eO5qmj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCj7O-0000000GQF4-05cp;
	Wed, 07 May 2025 18:03:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCitL-0000000GOUV-0rmd;
	Wed, 07 May 2025 17:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77E03A4DBEE;
	Wed,  7 May 2025 17:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A01CC4CEE9;
	Wed,  7 May 2025 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746640150;
	bh=W/kyXuWaZKDmPfwuyKSOYasAKozBMnO2KN/T9exj3sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OsfJCw0bX1SwuWBBEJPTzWSCCbWcoX4BENTXRUhzEAvjf5c6GjWZ9koqN6Afkbif0
	 T7zTVQFfaGq0px92bH8f/T6/nb7YyIkaicrSlVj+NfwySmS0kT9ag2IP287lOkVql8
	 RwKB9tBDCOMaR2DMdsfefg/Kv++yOmLA1ot6cDhUbyUfSBl0zUcp5yBk7BZI9JePF+
	 d5IZBsPnTq0FWYkktKW/RUuHYSdqbYt3HA/QPN2Ab2lejj9S4UA6HCzSVnmJk9rNJK
	 2o3RdK6e1kL6LiBTTUNok6aLb1qAj7c/KdiHuD9LT3XA1dx7eY+/7dOB0xtLF/OLjD
	 AIFdG3bC1J6aw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 07 May 2025 19:48:46 +0200
Subject: [PATCH net-next 2/2] net: airoha: Add the capability to allocate
 hw buffers in SRAM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-airopha-desc-sram-v1-2-d42037431bfa@kernel.org>
References: <20250507-airopha-desc-sram-v1-0-d42037431bfa@kernel.org>
In-Reply-To: <20250507-airopha-desc-sram-v1-0-d42037431bfa@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_104911_378910_B7F02EF8 
X-CRM114-Status: GOOD (  14.38  )
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
 drivers/net/ethernet/airoha/airoha_eth.c | 48 ++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 16c7896f931fd9532aa3b8cc78f41afc676aa117..b1ca8322d4eb34f48a6ed6a3b4596c128324cd50 100644
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
@@ -1088,12 +1091,36 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 
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
+
+		np = of_parse_phandle(eth->dev->of_node, "memory-region",
+				      index);
+		if (!np)
+			return -ENODEV;
+
+		rmem = of_reserved_mem_lookup(np);
+		of_node_put(np);
+
+		dma_addr = rmem->base;
+		qdma->hfwd.q = devm_ioremap(eth->dev, rmem->base, rmem->size);
+		if (!qdma->hfwd.q)
+			return -ENOMEM;
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
@@ -1101,11 +1128,14 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
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


