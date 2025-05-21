Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0286CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2l8uj41bIp4dl5scQnFE9HU09C1Sd9pGw1KZx1AdHU4=; b=V4pA5ANA2zzQUTJZqg6w1N3Sdd
	hLQ5fgplSjsNrRqe+wNDOKyjNirCZ2MX6eCDbY5oef3r/ucU8bTo6QKnXh8cleSEkZSQ+EMenq6v9
	Epvyi+rqDbxZ/z6V4GjFCSXtfeHZMPui/futLSQFp3SXYkJK0q9suZw7kFqN0nDn6EwlsOzRgc7x1
	INID5uH8SOszInQZJKphVLHv72e1yq39xiH42hHPK/1CMShlwDDV212SQndGz3N8P3FnjYkwUF22k
	gXo4RKoIjgzdbyuXRPXxUh2AhxGrf5tI4eY7KDlI56ti3wM7lmR2Ww9sSQJQTRx4Y5jUkHwDsbJOR
	ATniAimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdwg-0000000F4KR-1XVN;
	Wed, 21 May 2025 07:32:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdhJ-0000000F2b6-1Huz;
	Wed, 21 May 2025 07:17:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE53A629D5;
	Wed, 21 May 2025 07:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9C5C4CEE4;
	Wed, 21 May 2025 07:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811824;
	bh=HtIvyLnzoLGjuDqzE4ebbNLd1tqZk4KAODJR9iSVbWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C2Ui8NHhPFH6M03XcKi2a+9CZJPEWCFLkQV7SEWIlOLD99SP4cIR4gfZDyV7i1X2W
	 vafLSzqRSCrRYQDRvJhseBIe+kFRYtPLXrFXoXCG4cgtItqbo63c5VQg1hQ+WQMQbo
	 41R+Ym1v7VfnKx8xRozWrrEB3h65YJYycIt1x8rqMU45pl6tq8GnHHfuQ6NZxyBBDf
	 bcAvRbZaK2Eju2JfvoBuqqoGltcJc/mk5fXCSlE5I0NpaQDFfcNDKpNUdFGA2h1b3s
	 VkCm0IIWMvj0C4ygK60N81EKuH7n7VlO5JJcL83WhHxUyLl3xEv7Pw2gyC1SfRiR71
	 xhmvinhcVzYng==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 21 May 2025 09:16:38 +0200
Subject: [PATCH net-next v3 3/4] net: airoha: Add the capability to
 allocate hwfd buffers via reserved-memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-airopha-desc-sram-v3-3-a6e9b085b4f0@kernel.org>
References: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
In-Reply-To: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

In some configurations QDMA blocks require a contiguous block of
system memory for hwfd buffers queue. Introduce the capability to allocate
hw buffers forwarding queue via the reserved-memory DTS property instead of
running dmam_alloc_coherent().

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 33 +++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5f7cbbcbb1d469836dfcea95137c960bfd076744..20e590d76735e72a1a538a42d2a1f49b882deccc 100644
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
+	const char *name;
+	int size, index;
 	u32 status;
-	int size;
 
 	size = HW_DSCP_NUM * sizeof(struct airoha_qdma_fwd_desc);
 	if (!dmam_alloc_coherent(eth->dev, size, &dma_addr, GFP_KERNEL))
@@ -1086,10 +1089,34 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 
 	airoha_qdma_wr(qdma, REG_FWD_DSCP_BASE, dma_addr);
 
-	size = AIROHA_MAX_PACKET_SIZE * HW_DSCP_NUM;
-	if (!dmam_alloc_coherent(eth->dev, size, &dma_addr, GFP_KERNEL))
+	name = devm_kasprintf(eth->dev, GFP_KERNEL, "qdma%d-buf", id);
+	if (!name)
 		return -ENOMEM;
 
+	index = of_property_match_string(eth->dev->of_node,
+					 "memory-region-names", name);
+	if (index >= 0) {
+		struct reserved_mem *rmem;
+		struct device_node *np;
+
+		/* Consume reserved memory for hw forwarding buffers queue if
+		 * available in the DTS
+		 */
+		np = of_parse_phandle(eth->dev->of_node, "memory-region",
+				      index);
+		if (!np)
+			return -ENODEV;
+
+		rmem = of_reserved_mem_lookup(np);
+		of_node_put(np);
+		dma_addr = rmem->base;
+	} else {
+		size = AIROHA_MAX_PACKET_SIZE * HW_DSCP_NUM;
+		if (!dmam_alloc_coherent(eth->dev, size, &dma_addr,
+					 GFP_KERNEL))
+			return -ENOMEM;
+	}
+
 	airoha_qdma_wr(qdma, REG_FWD_BUF_BASE, dma_addr);
 
 	airoha_qdma_rmw(qdma, REG_HW_FWD_DSCP_CFG,

-- 
2.49.0


