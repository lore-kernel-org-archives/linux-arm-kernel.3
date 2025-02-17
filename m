Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A94CC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kJky53O1BNSrKuVwtvgegZZH840bmuuggpyY2a/1mY=; b=OxAdfpsNBaiqXfwQ5y6l1jbIUL
	K/MspW94kOzYbGl5lzzWhJSUU1CxRlqVH7drRaQ487W1ezjUZQ9avNNfZcty/WRQECkAVjBXd4+5O
	ahNH4yDSrBlutKFOshCEjmGoqCnhMGvzTxD7tvTrM/DvVlU4Gxx4hVto3657wVoT7rDC3o4GCsZj6
	2JLZZx8qxhCpxjecQntkX60hZnpvjqgXt9gpPbPbQ6CyQbd/nVZK6KVvY7VuYa/HE7idv0VZE2ltP
	R8JCjgsjFv1/yYeUf9b0Xo551+phwi/sTB8CCl8Qrx9n4OqY6cmQ+c69EjutwDQ5D9X+uVmI4zJKY
	Fhk/4isA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0qj-00000004aE6-03Xa;
	Mon, 17 Feb 2025 13:07:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0ky-00000004Yv2-0bie;
	Mon, 17 Feb 2025 13:01:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2108C5C5459;
	Mon, 17 Feb 2025 13:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6650C4CEE4;
	Mon, 17 Feb 2025 13:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739797311;
	bh=LYtv9hkmflZk9C5liopfd0s1ChdnvNXvY0QApzYcDPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GgDjF4wbherwy4R4WrwZlitcSVLiqi+eOQlh9Td/ii1/r6+x+jVGxXdwX00Iwl/In
	 JGLj42XVrfcT8sMngIhSBya8WW4rKvZZ2KXoj16gHdNruzgm15TydHJiRhuznkJujw
	 zb5HJWCnNGLjt8VocalLhvC9HIp8hc+NDoTgwO9/DgiNBqQZeZJpMUppJPZB5EUTK5
	 nlhAOgXiViwtHC6AQMnOZ1vVALX57BXQR9yfkaVt7sRPKlTIlyVbILdPWtlyCic3/G
	 bZ7kCBrunQtTMQtgTfXeg07YUEFMQIDxpJnwJQgzUcSqXLFOae0dO/DWIzxOvQG68q
	 vnHYihLCm8MYA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 17 Feb 2025 14:01:07 +0100
Subject: [PATCH net-next v5 03/15] net: airoha: Move reg/write utility
 routines in airoha_eth.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-airoha-en7581-flowtable-offload-v5-3-28be901cb735@kernel.org>
References: <20250217-airoha-en7581-flowtable-offload-v5-0-28be901cb735@kernel.org>
In-Reply-To: <20250217-airoha-en7581-flowtable-offload-v5-0-28be901cb735@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_050152_298610_ABB1EFC1 
X-CRM114-Status: GOOD (  10.47  )
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

This is a preliminary patch to introduce flowtable hw offloading
support for airoha_eth driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 28 +++-------------------------
 drivers/net/ethernet/airoha/airoha_eth.h | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 0048a5665576afaf532778f0bd96be8b07d29703..1c6fb7b9ccbbaec846643343e0347a1e948a575f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -673,17 +673,17 @@ struct airoha_qdma_fwd_desc {
 	__le32 rsv1;
 };
 
-static u32 airoha_rr(void __iomem *base, u32 offset)
+u32 airoha_rr(void __iomem *base, u32 offset)
 {
 	return readl(base + offset);
 }
 
-static void airoha_wr(void __iomem *base, u32 offset, u32 val)
+void airoha_wr(void __iomem *base, u32 offset, u32 val)
 {
 	writel(val, base + offset);
 }
 
-static u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val)
+u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val)
 {
 	val |= (airoha_rr(base, offset) & ~mask);
 	airoha_wr(base, offset, val);
@@ -691,28 +691,6 @@ static u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val)
 	return val;
 }
 
-#define airoha_fe_rr(eth, offset)				\
-	airoha_rr((eth)->fe_regs, (offset))
-#define airoha_fe_wr(eth, offset, val)				\
-	airoha_wr((eth)->fe_regs, (offset), (val))
-#define airoha_fe_rmw(eth, offset, mask, val)			\
-	airoha_rmw((eth)->fe_regs, (offset), (mask), (val))
-#define airoha_fe_set(eth, offset, val)				\
-	airoha_rmw((eth)->fe_regs, (offset), 0, (val))
-#define airoha_fe_clear(eth, offset, val)			\
-	airoha_rmw((eth)->fe_regs, (offset), (val), 0)
-
-#define airoha_qdma_rr(qdma, offset)				\
-	airoha_rr((qdma)->regs, (offset))
-#define airoha_qdma_wr(qdma, offset, val)			\
-	airoha_wr((qdma)->regs, (offset), (val))
-#define airoha_qdma_rmw(qdma, offset, mask, val)		\
-	airoha_rmw((qdma)->regs, (offset), (mask), (val))
-#define airoha_qdma_set(qdma, offset, val)			\
-	airoha_rmw((qdma)->regs, (offset), 0, (val))
-#define airoha_qdma_clear(qdma, offset, val)			\
-	airoha_rmw((qdma)->regs, (offset), (val), 0)
-
 static void airoha_qdma_set_irqmask(struct airoha_qdma *qdma, int index,
 				    u32 clear, u32 set)
 {
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 3310e0cf85f1d240e95404a0c15703e5f6be26bc..743aaf10235fe09fb2a91b491f4b25064ed8319b 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -248,4 +248,30 @@ struct airoha_eth {
 	struct airoha_gdm_port *ports[AIROHA_MAX_NUM_GDM_PORTS];
 };
 
+u32 airoha_rr(void __iomem *base, u32 offset);
+void airoha_wr(void __iomem *base, u32 offset, u32 val);
+u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val);
+
+#define airoha_fe_rr(eth, offset)				\
+	airoha_rr((eth)->fe_regs, (offset))
+#define airoha_fe_wr(eth, offset, val)				\
+	airoha_wr((eth)->fe_regs, (offset), (val))
+#define airoha_fe_rmw(eth, offset, mask, val)			\
+	airoha_rmw((eth)->fe_regs, (offset), (mask), (val))
+#define airoha_fe_set(eth, offset, val)				\
+	airoha_rmw((eth)->fe_regs, (offset), 0, (val))
+#define airoha_fe_clear(eth, offset, val)			\
+	airoha_rmw((eth)->fe_regs, (offset), (val), 0)
+
+#define airoha_qdma_rr(qdma, offset)				\
+	airoha_rr((qdma)->regs, (offset))
+#define airoha_qdma_wr(qdma, offset, val)			\
+	airoha_wr((qdma)->regs, (offset), (val))
+#define airoha_qdma_rmw(qdma, offset, mask, val)		\
+	airoha_rmw((qdma)->regs, (offset), (mask), (val))
+#define airoha_qdma_set(qdma, offset, val)			\
+	airoha_rmw((qdma)->regs, (offset), 0, (val))
+#define airoha_qdma_clear(qdma, offset, val)			\
+	airoha_rmw((qdma)->regs, (offset), (val), 0)
+
 #endif /* AIROHA_ETH_H */

-- 
2.48.1


