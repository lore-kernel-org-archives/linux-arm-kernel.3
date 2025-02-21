Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB299C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kJky53O1BNSrKuVwtvgegZZH840bmuuggpyY2a/1mY=; b=sIm8MgmlXoujFvfa7sgVKUHEeN
	PLtfM76JJ7qZ7pmoGP8hT+PJlg9tfxZy1h2+R7Hfy03weNvWFHoiBQK0XJmarGnk8SiB/Vuw5BHui
	5wvp0GXDSEAN0rkzxrPJt/0djzqMkKEwCuPEABXCWWk8LxKDYpu4nLpjyUQ3+0XnNOBujl64ors/u
	Ql1YDpEhEtvyjTeF93UZrdXCikuyQ8OnO6bxW5S7Zw/aFaVhYhl/1jLTGVTpZQXIrs6WLruGWqNMQ
	NGOPx8e/f8X7LYyhMy8tZhe8lZ8XwuJhyviIJoaJoPzyV4ekQXMVzTs06hoE6ok1hEi8qeIBsfB1w
	i20hes1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQX1-00000005EIS-1pSU;
	Fri, 21 Feb 2025 10:45:19 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQGp-00000005BCM-1PdO;
	Fri, 21 Feb 2025 10:28:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 934E861190;
	Fri, 21 Feb 2025 10:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1420DC4CED6;
	Fri, 21 Feb 2025 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740133714;
	bh=LYtv9hkmflZk9C5liopfd0s1ChdnvNXvY0QApzYcDPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VOrY6vict6nJ+9oGsiOzNtB7bF4sD7srsLas7V6VrioEZwG1zSkPQlES/rQUDXf73
	 7F8ErigZDu1ff9fj4X23hQ2SdckwfF/1Ys/XqzE5fYA7x0EncqPOtcp4nG1M5cMjAF
	 igzAkVa4baCSpr6Efq+du/oxZi10e9d7W1qWinfEYeToKOv5m6pOkVNt5d/xpOqo1p
	 GB24P4ZHHQdG+sfTH3AdnwdFupBRQnIuelym/hrHKcz7rJDq20a8zPcvAU5g3hnIzC
	 jsVCYYQzQFFEeEK1qPGuZkrMIt1HiKH78cFq8gMZzzcbdkngOYtLMkZqYx9Ht6TMKB
	 Zh1CKirpzcb5w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 21 Feb 2025 11:28:04 +0100
Subject: [PATCH net-next v6 03/15] net: airoha: Move reg/write utility
 routines in airoha_eth.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-airoha-en7581-flowtable-offload-v6-3-d593af0e9487@kernel.org>
References: <20250221-airoha-en7581-flowtable-offload-v6-0-d593af0e9487@kernel.org>
In-Reply-To: <20250221-airoha-en7581-flowtable-offload-v6-0-d593af0e9487@kernel.org>
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


