Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F2CCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1pHHfLltzg/UHFRRnYuqRsjMVGKrPlNdMhRU2CJ2gQ=; b=hn/fJYECBw+7UaF5zryJBIMoQV
	0wIul7lg7/0HeUWaJjtpeB0zLDaWb6cKXAWz6lY/D2/vvpF+Q8s+DlLUfeeO8jgApSQ18XMKoTR+w
	E8pyZaioXPPGlhZGFoy02fK5vJbbUCNW8CrE22xTyIlRg7l2NTec9rPhuj9OrS9UNaOnoBqh5QhVk
	S7nPiumyp92fNj5t/wH1JADmVBaIulnU91VPUv2wII4L7FHSIVzaXKoHhN23PEeCVkZwZNtUNf2Hy
	nRE9tEG0wZpPI/zPmyNMym+yafFSdhduG05FfyTHY6gcpDr6LwNH4Ur1W1ZQB4SL9R9+nI902w+Kl
	bA2EFoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upScR-00000002mJ6-0GN1;
	Fri, 22 Aug 2025 14:19:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLzX-00000001n6H-1RIG;
	Fri, 22 Aug 2025 07:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A0D140642;
	Fri, 22 Aug 2025 07:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BA1C4CEF1;
	Fri, 22 Aug 2025 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755846914;
	bh=BNlQxuSAhPjRJrRi4WzjobkHZ2vrIrehRCDMMMdDoQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hy7sZswW8PhkDnu2p+3K3qi/9hIzGTY5LbEYHigjajL4sr+NOQ8GldJoMUtSjhjps
	 1DJxa1TyP4V2bU4qazJX70vXs2Z9YEHKhLTnu1kqqlO7UrzFhxxgst0qtcBHPOJkxz
	 I0Tbak+PbZ1A+BYfekvOxs6NhVpQ6jVn7M9jv3YeI8SY0S655dAKMD2IPHj9yW2L18
	 I36LQkgWMIs95gO+8jBN13CoT7QJrDPjvIAFnzs5LLLbBRg3LNVcY8AT1LOjEV5Uhl
	 t4UBQsEdSuYY95C3ZNPyFf1C1LaHfpe030hSXlJDwiM/rS7g+Qux6gd2B8LPI6/0kP
	 muY1b69POiL9w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 22 Aug 2025 09:14:49 +0200
Subject: [PATCH net-next v2 2/3] net: airoha: Add airoha_ppe_dev struct
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-airoha-en7581-wlan-rx-offload-v2-2-8a76e1d3fec2@kernel.org>
References: <20250822-airoha-en7581-wlan-rx-offload-v2-0-8a76e1d3fec2@kernel.org>
In-Reply-To: <20250822-airoha-en7581-wlan-rx-offload-v2-0-8a76e1d3fec2@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_001515_429165_824B6C70 
X-CRM114-Status: GOOD (  17.22  )
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

Introduce airoha_ppe_dev struct as container for PPE offload callbacks
consumed by the MT76 driver during flowtable offload for traffic
received by the wlan NIC and forwarded to the wired one.
Add airoha_ppe_setup_tc_block_cb routine to PPE offload ops for MT76
driver.
Rely on airoha_ppe_dev pointer in airoha_ppe_setup_tc_block_cb
signature.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c  |  4 +-
 drivers/net/ethernet/airoha/airoha_eth.h  |  4 +-
 drivers/net/ethernet/airoha/airoha_npu.c  |  1 -
 drivers/net/ethernet/airoha/airoha_ppe.c  | 68 +++++++++++++++++++++++++++++--
 include/linux/soc/airoha/airoha_offload.h | 35 ++++++++++++++++
 5 files changed, 105 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index e6b802e3d84493508d2dbd248fb1cbfa9ace468f..5a04f90dd3de47ae0ee8e90bfe221618076297e6 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2599,13 +2599,15 @@ static int airoha_dev_setup_tc_block_cb(enum tc_setup_type type,
 					void *type_data, void *cb_priv)
 {
 	struct net_device *dev = cb_priv;
+	struct airoha_gdm_port *port = netdev_priv(dev);
+	struct airoha_eth *eth = port->qdma->eth;
 
 	if (!tc_can_offload(dev))
 		return -EOPNOTSUPP;
 
 	switch (type) {
 	case TC_SETUP_CLSFLOWER:
-		return airoha_ppe_setup_tc_block_cb(dev, type_data);
+		return airoha_ppe_setup_tc_block_cb(&eth->ppe->dev, type_data);
 	case TC_SETUP_CLSMATCHALL:
 		return airoha_dev_tc_matchall(dev, type_data);
 	default:
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 9f721e2b972f0e547978419701caf532df664910..9060b1d2814e0e4023d42a05ecb5265212df588f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/netdevice.h>
 #include <linux/reset.h>
+#include <linux/soc/airoha/airoha_offload.h>
 #include <net/dsa.h>
 
 #define AIROHA_MAX_NUM_GDM_PORTS	4
@@ -546,6 +547,7 @@ struct airoha_gdm_port {
 #define AIROHA_RXD4_FOE_ENTRY		GENMASK(15, 0)
 
 struct airoha_ppe {
+	struct airoha_ppe_dev dev;
 	struct airoha_eth *eth;
 
 	void *foe;
@@ -622,7 +624,7 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 
 void airoha_ppe_check_skb(struct airoha_ppe *ppe, struct sk_buff *skb,
 			  u16 hash);
-int airoha_ppe_setup_tc_block_cb(struct net_device *dev, void *type_data);
+int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data);
 int airoha_ppe_init(struct airoha_eth *eth);
 void airoha_ppe_deinit(struct airoha_eth *eth);
 void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port);
diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 1a6b191ae0b0bba2dc0a011b9da4eb5f4686783e..e1d131d6115c10b40a56b63427eec59ea587d22a 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -11,7 +11,6 @@
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/regmap.h>
-#include <linux/soc/airoha/airoha_offload.h>
 
 #include "airoha_eth.h"
 
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 36b45e98279a1d18ef0c7e185d8fca7b32c70436..a73ce673fd37034dd62c6cb710cda6690bc5ca6a 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -6,8 +6,9 @@
 
 #include <linux/ip.h>
 #include <linux/ipv6.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/rhashtable.h>
-#include <linux/soc/airoha/airoha_offload.h>
 #include <net/ipv6.h>
 #include <net/pkt_cls.h>
 
@@ -1282,10 +1283,10 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 	return err;
 }
 
-int airoha_ppe_setup_tc_block_cb(struct net_device *dev, void *type_data)
+int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data)
 {
-	struct airoha_gdm_port *port = netdev_priv(dev);
-	struct airoha_eth *eth = port->qdma->eth;
+	struct airoha_ppe *ppe = dev->priv;
+	struct airoha_eth *eth = ppe->eth;
 	int err = 0;
 
 	mutex_lock(&flow_offload_mutex);
@@ -1338,6 +1339,62 @@ void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port)
 		     PPE_UPDMEM_WR_MASK | PPE_UPDMEM_REQ_MASK);
 }
 
+struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct airoha_eth *eth;
+
+	np = of_parse_phandle(dev->of_node, "airoha,eth", 0);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	pdev = of_find_device_by_node(np);
+
+	if (!pdev) {
+		dev_err(dev, "cannot find device node %s\n", np->name);
+		of_node_put(np);
+		return ERR_PTR(-ENODEV);
+	}
+	of_node_put(np);
+
+	if (!try_module_get(THIS_MODULE)) {
+		dev_err(dev, "failed to get the device driver module\n");
+		goto error_pdev_put;
+	}
+
+	eth = platform_get_drvdata(pdev);
+	if (!eth)
+		goto error_module_put;
+
+	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER)) {
+		dev_err(&pdev->dev,
+			"failed to create device link to consumer %s\n",
+			dev_name(dev));
+		goto error_module_put;
+	}
+
+	return &eth->ppe->dev;
+
+error_module_put:
+	module_put(THIS_MODULE);
+error_pdev_put:
+	platform_device_put(pdev);
+
+	return ERR_PTR(-ENODEV);
+}
+EXPORT_SYMBOL_GPL(airoha_ppe_get_dev);
+
+void airoha_ppe_put_dev(struct airoha_ppe_dev *dev)
+{
+	struct airoha_ppe *ppe = dev->priv;
+	struct airoha_eth *eth = ppe->eth;
+
+	module_put(THIS_MODULE);
+	put_device(eth->dev);
+}
+EXPORT_SYMBOL_GPL(airoha_ppe_put_dev);
+
 int airoha_ppe_init(struct airoha_eth *eth)
 {
 	struct airoha_ppe *ppe;
@@ -1347,6 +1404,9 @@ int airoha_ppe_init(struct airoha_eth *eth)
 	if (!ppe)
 		return -ENOMEM;
 
+	ppe->dev.ops.setup_tc_block_cb = airoha_ppe_setup_tc_block_cb;
+	ppe->dev.priv = ppe;
+
 	foe_size = PPE_NUM_ENTRIES * sizeof(struct airoha_foe_entry);
 	ppe->foe = dmam_alloc_coherent(eth->dev, foe_size, &ppe->foe_dma,
 				       GFP_KERNEL);
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 117c63c2448d2bd2a5c108c5baa56a39f6974d91..e05ded67c9e6fb89940e5b152f14c6ea0d7c6c49 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -9,6 +9,41 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
+struct airoha_ppe_dev {
+	struct {
+		int (*setup_tc_block_cb)(struct airoha_ppe_dev *dev,
+					 void *type_data);
+	} ops;
+
+	void *priv;
+};
+
+#if (IS_BUILTIN(CONFIG_NET_AIROHA) || IS_MODULE(CONFIG_NET_AIROHA))
+struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev);
+void airoha_ppe_put_dev(struct airoha_ppe_dev *dev);
+
+static inline int airoha_ppe_dev_setup_tc_block_cb(struct airoha_ppe_dev *dev,
+						   void *type_data)
+{
+	return dev->ops.setup_tc_block_cb(dev, type_data);
+}
+#else
+static inline airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)
+{
+	return NULL;
+}
+
+static inline void airoha_ppe_put_dev(struct airoha_ppe_dev *dev)
+{
+}
+
+static inline int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev,
+					       void *type_data)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #define NPU_NUM_CORES		8
 #define NPU_NUM_IRQ		6
 #define NPU_RX0_DESC_NUM	512

-- 
2.50.1


