Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6279CC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHgvdymIKYdf2pjmBIG1a+MPKx6FLIuz+bwHkfDHU74=; b=A+9WTUcrkUE8G7QWQowG/LqTA7
	6j7ObN3Jx7KqgdhW8SvbNCY48sLanBloGQRiZc4AbW7j2lCa0sL4ykoS92WJK5xM7xseNlfc9bSaG
	I2nRXBWtg+o3gkBc0wF4Wmww2tWt+a+WAEjnR0qnII00uPnIraTeOx/SopL+ON3XzZz0Kmm/h8mtx
	iBNKNNcxiCo0KhD4VAdsPzQK2FflpNnlgQY+DxEqNly0zC7yd1MF76sFzmhX/PfMBPoQvS07DJN/E
	QAPTZu4gzq04VloQ0zvdXesuxcQJNrJVbF2lwbQfvk8jINNr2Ai5E2PqOFV969rofWGjgwR8vh+iV
	AE18YBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6PD-0000000EqS0-2eIx;
	Sun, 09 Feb 2025 12:27:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th687-0000000Ener-2Uer;
	Sun, 09 Feb 2025 12:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0BA5EA40078;
	Sun,  9 Feb 2025 12:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB024C4CEDD;
	Sun,  9 Feb 2025 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739102982;
	bh=6PWC818ZtuH6Oyc32LpcXRRNu0olUP6Lyo19SqxkH1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CHhGyrskQ+5DzdVL8p6hC3bwOpmMwW4m+9xIhm9EWWHHujAuxHfjUR3xWj3DRlNZ3
	 kkH5YdssRc46VaczGYgKXOTsP+5fVm5K+z2tq+sif8g4SpFVMwC6Rtg1zGyTm9BTp8
	 MNRsBOAxR8CNE3MeOIsKq1CNaumei9TjiqlYKiExGqSyGpajA0OjYJNKNJ/eNp6g9j
	 4UvFaJaVCW5q0d55p+dXrSpMmKHz/Fy2omoC4M2XqYcycWeE0Qr7/0PaZGgHnCv05j
	 b22qBO4T/hscMX3MVm4CEFOeQmeuNFLN9zJRm49jAVfvrR87JY7LN9Wi/pfhrpraFJ
	 6lbqDnn8kPD7Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 09 Feb 2025 13:09:01 +0100
Subject: [PATCH net-next v3 08/16] net: airoha: Enable support for multiple
 net_devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-airoha-en7581-flowtable-offload-v3-8-dba60e755563@kernel.org>
References: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
In-Reply-To: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
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
 upstream@airoha.com, Christian Marangi <ansuelsmth@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_040943_775031_5D40254B 
X-CRM114-Status: GOOD (  19.35  )
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

In the current codebase airoha_eth driver supports just a single
net_device connected to the Packet Switch Engine (PSE) lan port (GDM1).
As shown in commit 23020f049327 ("net: airoha: Introduce ethernet
support for EN7581 SoC"), PSE can switch packets between four GDM ports.
Enable the capability to create a net_device for each GDM port of the
PSE module. Moreover, since the QDMA blocks can be shared between
net_devices, do not stop TX/RX DMA in airoha_dev_stop() if there are
active net_devices for this QDMA block.
This is a preliminary patch to enable flowtable hw offloading for EN7581
SoC.

Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 35 +++++++++++++++++++-------------
 drivers/net/ethernet/airoha/airoha_eth.h |  4 +++-
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 4f45db86d8d8d6b7a13d56a9315773f8685a09f6..513914da8503c1162b0f1b4fcca57434385fa4d1 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1562,6 +1562,7 @@ static int airoha_dev_open(struct net_device *dev)
 	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
 			GLOBAL_CFG_TX_DMA_EN_MASK |
 			GLOBAL_CFG_RX_DMA_EN_MASK);
+	atomic_inc(&qdma->users);
 
 	return 0;
 }
@@ -1577,16 +1578,20 @@ static int airoha_dev_stop(struct net_device *dev)
 	if (err)
 		return err;
 
-	airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
-			  GLOBAL_CFG_TX_DMA_EN_MASK |
-			  GLOBAL_CFG_RX_DMA_EN_MASK);
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++)
+		netdev_tx_reset_subqueue(dev, i);
 
-	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
-		if (!qdma->q_tx[i].ndesc)
-			continue;
+	if (atomic_dec_and_test(&qdma->users)) {
+		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
+				  GLOBAL_CFG_TX_DMA_EN_MASK |
+				  GLOBAL_CFG_RX_DMA_EN_MASK);
 
-		airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
-		netdev_tx_reset_subqueue(dev, i);
+		for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
+			if (!qdma->q_tx[i].ndesc)
+				continue;
+
+			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
+		}
 	}
 
 	return 0;
@@ -2330,13 +2335,14 @@ static void airoha_metadata_dst_free(struct airoha_gdm_port *port)
 	}
 }
 
-static int airoha_alloc_gdm_port(struct airoha_eth *eth, struct device_node *np)
+static int airoha_alloc_gdm_port(struct airoha_eth *eth,
+				 struct device_node *np, int index)
 {
 	const __be32 *id_ptr = of_get_property(np, "reg", NULL);
 	struct airoha_gdm_port *port;
 	struct airoha_qdma *qdma;
 	struct net_device *dev;
-	int err, index;
+	int err, p;
 	u32 id;
 
 	if (!id_ptr) {
@@ -2345,14 +2351,14 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth, struct device_node *np)
 	}
 
 	id = be32_to_cpup(id_ptr);
-	index = id - 1;
+	p = id - 1;
 
 	if (!id || id > ARRAY_SIZE(eth->ports)) {
 		dev_err(eth->dev, "invalid gdm port id: %d\n", id);
 		return -EINVAL;
 	}
 
-	if (eth->ports[index]) {
+	if (eth->ports[p]) {
 		dev_err(eth->dev, "duplicate gdm port id: %d\n", id);
 		return -EINVAL;
 	}
@@ -2400,7 +2406,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth, struct device_node *np)
 	port->qdma = qdma;
 	port->dev = dev;
 	port->id = id;
-	eth->ports[index] = port;
+	eth->ports[p] = port;
 
 	err = airoha_metadata_dst_alloc(port);
 	if (err)
@@ -2472,6 +2478,7 @@ static int airoha_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_start_napi(&eth->qdma[i]);
 
+	i = 0;
 	for_each_child_of_node(pdev->dev.of_node, np) {
 		if (!of_device_is_compatible(np, "airoha,eth-mac"))
 			continue;
@@ -2479,7 +2486,7 @@ static int airoha_probe(struct platform_device *pdev)
 		if (!of_device_is_available(np))
 			continue;
 
-		err = airoha_alloc_gdm_port(eth, np);
+		err = airoha_alloc_gdm_port(eth, np, i++);
 		if (err) {
 			of_node_put(np);
 			goto error_napi_stop;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fee6c10eaedfd30207205b6557e856091fd45d7e..74bdfd9e8d2fb3706f5ec6a4e17fe07fbcb38c3d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -13,7 +13,7 @@
 #include <linux/netdevice.h>
 #include <linux/reset.h>
 
-#define AIROHA_MAX_NUM_GDM_PORTS	1
+#define AIROHA_MAX_NUM_GDM_PORTS	4
 #define AIROHA_MAX_NUM_QDMA		2
 #define AIROHA_MAX_DSA_PORTS		7
 #define AIROHA_MAX_NUM_RSTS		3
@@ -212,6 +212,8 @@ struct airoha_qdma {
 	u32 irqmask[QDMA_INT_REG_MAX];
 	int irq;
 
+	atomic_t users;
+
 	struct airoha_tx_irq_queue q_tx_irq[AIROHA_NUM_TX_IRQ];
 
 	struct airoha_queue q_tx[AIROHA_NUM_TX_RING];

-- 
2.48.1


