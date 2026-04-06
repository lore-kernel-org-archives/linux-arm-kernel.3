Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED54EF4ECC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 10:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJBSwEH6evIC3CkMmHL+nZak2btj6clkAu9DB9kVfpA=; b=PXSCe+nXlFG5ur9OYh5kXeAYDg
	qNtw2Un3cESNWCg/xrNmzX3kN+Hkv8gXwYGZqFjqIre64CR7xSoE8iueGxwHqoxMQwSBYAaKJYgcL
	3JiIodvnN/ihsKK9F9GAUPMoFurF042jg+uQQ6oOGA1P0rOCIYaQKkX0xzcm3AmPLq++fv9eK4kkM
	NJzDikpuuzNZyxSLHEhFFlNG+4LXCIbuiWTHLwPV02MBPowt0XUuvIO6HTjFgWroKxC6KELt3VTYy
	ckVL40lTJTHplaXEzqEeNTe/UrOIJ5hQ0Dgl360HWCK9KGe0GzQnVs5Yo7yZdhlyQ6+kfe4qJaIg/
	gcgej7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hIQ-000000051BP-2aUg;
	Mon, 06 Apr 2026 10:35:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hIM-0000000518L-1v7V;
	Mon, 06 Apr 2026 10:35:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E063B600AC;
	Mon,  6 Apr 2026 10:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43811C19425;
	Mon,  6 Apr 2026 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471701;
	bh=7tdbmMyyemQhDrB5zxY6X1u58OSzm7oOpI/1zW/UIl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RZ9w36XFsnBxFpyRlKbwZTIGCJ0rea4bDHb3dQOQ7Vobb69BdlrhYnyRmK/tG3JhE
	 dNk6ZXDYYtt3qSTXrM2u4Jaa1Ye7G224z7M3mO3fdXlVRo6aXtUZTaHqIOcJCqxFHm
	 wYo9kmxcGpPJ6P2ON93V7D0YBTrvGihdRN7FILLG2o1g7dHHg8cbsToJNzt43Vjx5K
	 AJF38R0ZXLIA5racKzA6Kz7461qa6iCj4mpfeZhqsy4fCf7LO2yRvYdjxOG3rMZvAc
	 fpRAZ8DiWPNmqIBVlb2Lr7mCrGf4pyVV7QaHLOsUGOREXW5fBPNsD27Dq0WTnBwmZc
	 Re67jVnuFiY9g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 06 Apr 2026 12:34:09 +0200
Subject: [PATCH net-next v3 04/12] net: airoha: Rely on net_device pointer
 in HTB callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-airoha-eth-multi-serdes-v3-4-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
X-Mailer: b4 0.14.3
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

Remove airoha_gdm_port dependency in HTB tc callback signatures and rely
on net_device pointer instead. Please note this patch does not introduce
any logical change and it is a preliminary patch in order to support
multiple net_devices connected to the same GDM3 or GDM4 port via an
external hw arbiter.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 51 ++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index e2fc57cb5020..8dc50d60f136 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2497,10 +2497,11 @@ static int airoha_qdma_set_trtcm_token_bucket(struct airoha_qdma *qdma,
 					   mode, val);
 }
 
-static int airoha_qdma_set_tx_rate_limit(struct airoha_gdm_port *port,
+static int airoha_qdma_set_tx_rate_limit(struct net_device *netdev,
 					 int channel, u32 rate,
 					 u32 bucket_size)
 {
+	struct airoha_gdm_port *port = netdev_priv(netdev);
 	int i, err;
 
 	for (i = 0; i <= TRTCM_PEAK_MODE; i++) {
@@ -2520,21 +2521,21 @@ static int airoha_qdma_set_tx_rate_limit(struct airoha_gdm_port *port,
 	return 0;
 }
 
-static int airoha_tc_htb_alloc_leaf_queue(struct airoha_gdm_port *port,
+static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 					  struct tc_htb_qopt_offload *opt)
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
 	u32 rate = div_u64(opt->rate, 1000) << 3; /* kbps */
-	struct net_device *dev = port->dev;
-	int num_tx_queues = dev->real_num_tx_queues;
-	int err;
+	int err, num_tx_queues = netdev->real_num_tx_queues;
+	struct airoha_gdm_port *port = netdev_priv(netdev);
 
 	if (opt->parent_classid != TC_HTB_CLASSID_ROOT) {
 		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
 		return -EINVAL;
 	}
 
-	err = airoha_qdma_set_tx_rate_limit(port, channel, rate, opt->quantum);
+	err = airoha_qdma_set_tx_rate_limit(netdev, channel, rate,
+					    opt->quantum);
 	if (err) {
 		NL_SET_ERR_MSG_MOD(opt->extack,
 				   "failed configuring htb offload");
@@ -2544,9 +2545,10 @@ static int airoha_tc_htb_alloc_leaf_queue(struct airoha_gdm_port *port,
 	if (opt->command == TC_HTB_NODE_MODIFY)
 		return 0;
 
-	err = netif_set_real_num_tx_queues(dev, num_tx_queues + 1);
+	err = netif_set_real_num_tx_queues(netdev, num_tx_queues + 1);
 	if (err) {
-		airoha_qdma_set_tx_rate_limit(port, channel, 0, opt->quantum);
+		airoha_qdma_set_tx_rate_limit(netdev, channel, 0,
+					      opt->quantum);
 		NL_SET_ERR_MSG_MOD(opt->extack,
 				   "failed setting real_num_tx_queues");
 		return err;
@@ -2733,44 +2735,47 @@ static int airoha_dev_setup_tc_block(struct net_device *dev,
 	}
 }
 
-static void airoha_tc_remove_htb_queue(struct airoha_gdm_port *port, int queue)
+static void airoha_tc_remove_htb_queue(struct net_device *netdev, int queue)
 {
-	struct net_device *dev = port->dev;
+	struct airoha_gdm_port *port = netdev_priv(netdev);
 
-	netif_set_real_num_tx_queues(dev, dev->real_num_tx_queues - 1);
-	airoha_qdma_set_tx_rate_limit(port, queue + 1, 0, 0);
+	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);
+	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);
 	clear_bit(queue, port->qos_sq_bmap);
 }
 
-static int airoha_tc_htb_delete_leaf_queue(struct airoha_gdm_port *port,
+static int airoha_tc_htb_delete_leaf_queue(struct net_device *netdev,
 					   struct tc_htb_qopt_offload *opt)
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
+	struct airoha_gdm_port *port = netdev_priv(netdev);
 
 	if (!test_bit(channel, port->qos_sq_bmap)) {
 		NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
 		return -EINVAL;
 	}
 
-	airoha_tc_remove_htb_queue(port, channel);
+	airoha_tc_remove_htb_queue(netdev, channel);
 
 	return 0;
 }
 
-static int airoha_tc_htb_destroy(struct airoha_gdm_port *port)
+static int airoha_tc_htb_destroy(struct net_device *netdev)
 {
+	struct airoha_gdm_port *port = netdev_priv(netdev);
 	int q;
 
 	for_each_set_bit(q, port->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS)
-		airoha_tc_remove_htb_queue(port, q);
+		airoha_tc_remove_htb_queue(netdev, q);
 
 	return 0;
 }
 
-static int airoha_tc_get_htb_get_leaf_queue(struct airoha_gdm_port *port,
+static int airoha_tc_get_htb_get_leaf_queue(struct net_device *netdev,
 					    struct tc_htb_qopt_offload *opt)
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
+	struct airoha_gdm_port *port = netdev_priv(netdev);
 
 	if (!test_bit(channel, port->qos_sq_bmap)) {
 		NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
@@ -2782,23 +2787,23 @@ static int airoha_tc_get_htb_get_leaf_queue(struct airoha_gdm_port *port,
 	return 0;
 }
 
-static int airoha_tc_setup_qdisc_htb(struct airoha_gdm_port *port,
+static int airoha_tc_setup_qdisc_htb(struct net_device *dev,
 				     struct tc_htb_qopt_offload *opt)
 {
 	switch (opt->command) {
 	case TC_HTB_CREATE:
 		break;
 	case TC_HTB_DESTROY:
-		return airoha_tc_htb_destroy(port);
+		return airoha_tc_htb_destroy(dev);
 	case TC_HTB_NODE_MODIFY:
 	case TC_HTB_LEAF_ALLOC_QUEUE:
-		return airoha_tc_htb_alloc_leaf_queue(port, opt);
+		return airoha_tc_htb_alloc_leaf_queue(dev, opt);
 	case TC_HTB_LEAF_DEL:
 	case TC_HTB_LEAF_DEL_LAST:
 	case TC_HTB_LEAF_DEL_LAST_FORCE:
-		return airoha_tc_htb_delete_leaf_queue(port, opt);
+		return airoha_tc_htb_delete_leaf_queue(dev, opt);
 	case TC_HTB_LEAF_QUERY_QUEUE:
-		return airoha_tc_get_htb_get_leaf_queue(port, opt);
+		return airoha_tc_get_htb_get_leaf_queue(dev, opt);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -2815,7 +2820,7 @@ static int airoha_dev_tc_setup(struct net_device *dev, enum tc_setup_type type,
 	case TC_SETUP_QDISC_ETS:
 		return airoha_tc_setup_qdisc_ets(port, type_data);
 	case TC_SETUP_QDISC_HTB:
-		return airoha_tc_setup_qdisc_htb(port, type_data);
+		return airoha_tc_setup_qdisc_htb(dev, type_data);
 	case TC_SETUP_BLOCK:
 	case TC_SETUP_FT:
 		return airoha_dev_setup_tc_block(dev, type_data);

-- 
2.53.0


