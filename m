Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D84E937F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0otieTSccZZzJEDd/E4ILO/D+pTeAxW+GlZP3yWj8o0=; b=YBIV/261D9qf2ZxlonafYxKw6L
	RKSRS8w9joSOFuRfpZJ3wjjLW/eH5+3kxUKEqTIjjjXzVaHWnEY9rbn25FfxeAiC+kVtlTPYh5Epj
	b5ObLN4RGhzTSxEJVIJ4aWhfI3VHiWUUKE0t9Wfh208Z8HJBGhz3kOTo4cKGDDiUd/wmHexCzXlhT
	rkuAN+tx+JkeuLN1C/cZ4QCK0qjYEnErj+tfKPpY+BLmyUiOlxXT6lDH2VQSHMUFbnsQ8yM/ku8qN
	NpT7waClbwQhsY4HH8pMHBcfQ/e0w+UVG2K8MkOLg+VHVG4oS5FW8dMgXsdZHh1WgqZTfd3VdGc0E
	T30FQkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByNU-0000000EWrK-0JvB;
	Sun, 12 Apr 2026 17:13:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByNT-0000000EWpa-02WM;
	Sun, 12 Apr 2026 17:13:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2644F60172;
	Sun, 12 Apr 2026 17:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D710C19424;
	Sun, 12 Apr 2026 17:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776014021;
	bh=hUh+M3O256Q+bQ8hOJtGw8bHZiknE0TXgnIBLy2b7LA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dLtGdfuQLenAZVV0tpDE5X/cJLrbK0FyV3d13pj4W+Ujw+QuhFv7w3e057t2zS8aJ
	 u8bSnBAQkdlZcda5OglKxDxqLcYllh/RIYj727fsHZnTiQScQhKWK34ydqRD8TnDyJ
	 6FgzvK2nTMT3GLOB6Hy5FjgYPStbx/3oTmeoCsWC1q2nVyTFYo9WdNHm0clBBbH+fc
	 OHxWC2zRUjYxF+EuLRgtvYUJONyjHBVoGMd3tvBuQLVz3ys9m5YvRhHNknj96luizv
	 4+v3bEN4Eywz79VmqtwZSaX+DQURTRrYTM7g9AtblGNrlBU8O1eEbl/fHZooKSkj1Q
	 SeWkc7Oeolfmw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 12 Apr 2026 19:13:13 +0200
Subject: [PATCH net-next 2/3] net: airoha: Rely on net_device pointer in
 HTB callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-airoha-multi-serdes-preliminary-patch-v1-2-08d5b670ca8f@kernel.org>
References: <20260412-airoha-multi-serdes-preliminary-patch-v1-0-08d5b670ca8f@kernel.org>
In-Reply-To: <20260412-airoha-multi-serdes-preliminary-patch-v1-0-08d5b670ca8f@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>, Lorenzo Bianconi <lorenzo@kernel.org>
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
 drivers/net/ethernet/airoha/airoha_eth.c | 45 +++++++++++++++++---------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index a98512e963b5..c2b5fcffce82 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2492,10 +2492,11 @@ static int airoha_qdma_set_trtcm_token_bucket(struct airoha_qdma *qdma,
 					   mode, val);
 }
 
-static int airoha_qdma_set_tx_rate_limit(struct airoha_gdm_port *port,
+static int airoha_qdma_set_tx_rate_limit(struct net_device *dev,
 					 int channel, u32 rate,
 					 u32 bucket_size)
 {
+	struct airoha_gdm_port *port = netdev_priv(dev);
 	int i, err;
 
 	for (i = 0; i <= TRTCM_PEAK_MODE; i++) {
@@ -2515,21 +2516,20 @@ static int airoha_qdma_set_tx_rate_limit(struct airoha_gdm_port *port,
 	return 0;
 }
 
-static int airoha_tc_htb_alloc_leaf_queue(struct airoha_gdm_port *port,
+static int airoha_tc_htb_alloc_leaf_queue(struct net_device *dev,
 					  struct tc_htb_qopt_offload *opt)
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
 	u32 rate = div_u64(opt->rate, 1000) << 3; /* kbps */
-	struct net_device *dev = port->dev;
-	int num_tx_queues = dev->real_num_tx_queues;
-	int err;
+	int err, num_tx_queues = dev->real_num_tx_queues;
+	struct airoha_gdm_port *port = netdev_priv(dev);
 
 	if (opt->parent_classid != TC_HTB_CLASSID_ROOT) {
 		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
 		return -EINVAL;
 	}
 
-	err = airoha_qdma_set_tx_rate_limit(port, channel, rate, opt->quantum);
+	err = airoha_qdma_set_tx_rate_limit(dev, channel, rate, opt->quantum);
 	if (err) {
 		NL_SET_ERR_MSG_MOD(opt->extack,
 				   "failed configuring htb offload");
@@ -2541,7 +2541,7 @@ static int airoha_tc_htb_alloc_leaf_queue(struct airoha_gdm_port *port,
 
 	err = netif_set_real_num_tx_queues(dev, num_tx_queues + 1);
 	if (err) {
-		airoha_qdma_set_tx_rate_limit(port, channel, 0, opt->quantum);
+		airoha_qdma_set_tx_rate_limit(dev, channel, 0, opt->quantum);
 		NL_SET_ERR_MSG_MOD(opt->extack,
 				   "failed setting real_num_tx_queues");
 		return err;
@@ -2728,44 +2728,47 @@ static int airoha_dev_setup_tc_block(struct net_device *dev,
 	}
 }
 
-static void airoha_tc_remove_htb_queue(struct airoha_gdm_port *port, int queue)
+static void airoha_tc_remove_htb_queue(struct net_device *dev, int queue)
 {
-	struct net_device *dev = port->dev;
+	struct airoha_gdm_port *port = netdev_priv(dev);
 
 	netif_set_real_num_tx_queues(dev, dev->real_num_tx_queues - 1);
-	airoha_qdma_set_tx_rate_limit(port, queue + 1, 0, 0);
+	airoha_qdma_set_tx_rate_limit(dev, queue + 1, 0, 0);
 	clear_bit(queue, port->qos_sq_bmap);
 }
 
-static int airoha_tc_htb_delete_leaf_queue(struct airoha_gdm_port *port,
+static int airoha_tc_htb_delete_leaf_queue(struct net_device *dev,
 					   struct tc_htb_qopt_offload *opt)
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
+	struct airoha_gdm_port *port = netdev_priv(dev);
 
 	if (!test_bit(channel, port->qos_sq_bmap)) {
 		NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
 		return -EINVAL;
 	}
 
-	airoha_tc_remove_htb_queue(port, channel);
+	airoha_tc_remove_htb_queue(dev, channel);
 
 	return 0;
 }
 
-static int airoha_tc_htb_destroy(struct airoha_gdm_port *port)
+static int airoha_tc_htb_destroy(struct net_device *dev)
 {
+	struct airoha_gdm_port *port = netdev_priv(dev);
 	int q;
 
 	for_each_set_bit(q, port->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS)
-		airoha_tc_remove_htb_queue(port, q);
+		airoha_tc_remove_htb_queue(dev, q);
 
 	return 0;
 }
 
-static int airoha_tc_get_htb_get_leaf_queue(struct airoha_gdm_port *port,
+static int airoha_tc_get_htb_get_leaf_queue(struct net_device *dev,
 					    struct tc_htb_qopt_offload *opt)
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
+	struct airoha_gdm_port *port = netdev_priv(dev);
 
 	if (!test_bit(channel, port->qos_sq_bmap)) {
 		NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
@@ -2777,23 +2780,23 @@ static int airoha_tc_get_htb_get_leaf_queue(struct airoha_gdm_port *port,
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
@@ -2810,7 +2813,7 @@ static int airoha_dev_tc_setup(struct net_device *dev, enum tc_setup_type type,
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


