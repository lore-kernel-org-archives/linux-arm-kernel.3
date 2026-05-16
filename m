Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47B2CD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 05:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P57xgmWPeltDT0zAfl2ACN/3rlM7sUsZEIbZgHjOlP8=; b=DmbMIwvqxsy5ySWVgKHcOVJ+un
	zJDg8vaMC/wt3kg0lQnGKpJy/wfQ0EV4khj4OgpU5PPSS0vZUrBc1v1xOE8KSIpiaVI7TL7VCcgeb
	wZZyLKYfszCBGkT+2+VA/t9IGM+86LUCJeFRkjK5/3969RlDTeVoauG4yXYY32W9Ml46mCKLcKS2f
	5dnoYib6gEx7zzHFXLZFMHk5A3bz8GrPA4/VwCSVgi/9cEZ8OANfW4Nnc53dQTvqedMmFL63mQly6
	moUh7JpuofXELsLnUToowMxnGXxsmHG3geYXgNjMOvc0T6EVpGqte0+ppop3OZVDZ8/BCGVjAlZLu
	VSniiC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO81z-0000000ADav-1wMX;
	Sat, 16 May 2026 05:57:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO81u-0000000ADV3-1uCW;
	Sat, 16 May 2026 05:57:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5030400D1;
	Sat, 16 May 2026 05:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B99C2BCF5;
	Sat, 16 May 2026 05:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778911061;
	bh=l5ZctBXIXE0vhL+XIKBr8CDPqdciEDJSatT5uW3FMHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PoR7+akep4uwWx4VnAjzFrRn9bhM8VTPY0pJJF14kRaqfmNwnDZkJFbwqciLIhF2X
	 36vzfZYsYG6vOrlm7J7bbe09AyCl2IDaoaKCYuFbkTLkSlkuT+Xsgq8k+QvkN0qoa+
	 3+K2Du/tV43nybBI4s0XFFde8UBA9dwx3hb0pJC4HlZEolT9fV9QpNeBbI0gsoRjmx
	 W8qs75nPAlcJhUZISAVnQ7sUSeOogTAwguN0IJ6erMOVqKtWuYAwiaCGUjZHsMJPEi
	 NjMuCkhY+3i2U5xcTem8qILN/ZdDTlAlTGfXAN3fJjhB5jywGPTiFe1LptIu+xYIJZ
	 XOxcitwzKEJZg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 16 May 2026 07:57:07 +0200
Subject: [PATCH net-next v7 05/10] net: airoha: Move qos_sq_bmap in
 airoha_gdm_dev struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-airoha-eth-multi-serdes-v7-5-99e0093303e2@kernel.org>
References: <20260516-airoha-eth-multi-serdes-v7-0-99e0093303e2@kernel.org>
In-Reply-To: <20260516-airoha-eth-multi-serdes-v7-0-99e0093303e2@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_225742_541913_F1681F84 
X-CRM114-Status: GOOD (  16.71  )
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

Since now multiple net_devices connected to different QDMA blocks can
share the same GDM port, qos_sq_bmap field can be overwritten with the
configuration obtained from a net_device connected to a different QDMA
block. In order to fix the issue move qos_sq_bmap field from
airoha_gdm_port struct to airoha_gdm_dev one.
Add qos_channel_map bitmap in airoha_qdma struct to track if a shared
QDMA channel is already in use by another net_device.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 59 ++++++++++++++++++++------------
 drivers/net/ethernet/airoha/airoha_eth.h |  6 ++--
 2 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index b90fc1cbfbc4..2a2a30dbad27 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2597,44 +2597,61 @@ static int airoha_qdma_set_tx_rate_limit(struct net_device *netdev,
 	return 0;
 }
 
-static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
-					  struct tc_htb_qopt_offload *opt)
+static int airoha_tc_htb_modify_queue(struct net_device *dev,
+				      struct tc_htb_qopt_offload *opt)
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
 	u32 rate = div_u64(opt->rate, 1000) << 3; /* kbps */
-	int err, num_tx_queues = netdev->real_num_tx_queues;
-	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
 
 	if (opt->parent_classid != TC_HTB_CLASSID_ROOT) {
 		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
 		return -EINVAL;
 	}
 
-	err = airoha_qdma_set_tx_rate_limit(netdev, channel, rate,
-					    opt->quantum);
+	return airoha_qdma_set_tx_rate_limit(dev, channel, rate, opt->quantum);
+}
+
+static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
+					  struct tc_htb_qopt_offload *opt)
+{
+	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
+	int err, num_tx_queues = netdev->real_num_tx_queues;
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct airoha_qdma *qdma = dev->qdma;
+
+	/* Here we need to check the requested QDMA channel is not already
+	 * in use by another net_device running on the same QDMA block.
+	 */
+	if (test_and_set_bit(channel, qdma->qos_channel_map)) {
+		NL_SET_ERR_MSG_MOD(opt->extack,
+				   "qdma qos channel already in use");
+		return -EBUSY;
+	}
+
+	err = airoha_tc_htb_modify_queue(netdev, opt);
 	if (err) {
 		NL_SET_ERR_MSG_MOD(opt->extack,
 				   "failed configuring htb offload");
-		return err;
+		goto error;
 	}
 
-	if (opt->command == TC_HTB_NODE_MODIFY)
-		return 0;
-
 	err = netif_set_real_num_tx_queues(netdev, num_tx_queues + 1);
 	if (err) {
 		airoha_qdma_set_tx_rate_limit(netdev, channel, 0,
 					      opt->quantum);
 		NL_SET_ERR_MSG_MOD(opt->extack,
 				   "failed setting real_num_tx_queues");
-		return err;
+		goto error;
 	}
 
-	set_bit(channel, port->qos_sq_bmap);
+	set_bit(channel, dev->qos_sq_bmap);
 	opt->qid = AIROHA_NUM_TX_RING + channel;
 
 	return 0;
+error:
+	clear_bit(channel, qdma->qos_channel_map);
+
+	return err;
 }
 
 static int airoha_qdma_set_rx_meter(struct airoha_gdm_dev *dev,
@@ -2815,11 +2832,13 @@ static int airoha_dev_setup_tc_block(struct net_device *dev,
 static void airoha_tc_remove_htb_queue(struct net_device *netdev, int queue)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
+	struct airoha_qdma *qdma = dev->qdma;
 
 	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);
 	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);
-	clear_bit(queue, port->qos_sq_bmap);
+
+	clear_bit(queue, qdma->qos_channel_map);
+	clear_bit(queue, dev->qos_sq_bmap);
 }
 
 static int airoha_tc_htb_delete_leaf_queue(struct net_device *netdev,
@@ -2827,9 +2846,8 @@ static int airoha_tc_htb_delete_leaf_queue(struct net_device *netdev,
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
 
-	if (!test_bit(channel, port->qos_sq_bmap)) {
+	if (!test_bit(channel, dev->qos_sq_bmap)) {
 		NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
 		return -EINVAL;
 	}
@@ -2842,10 +2860,9 @@ static int airoha_tc_htb_delete_leaf_queue(struct net_device *netdev,
 static int airoha_tc_htb_destroy(struct net_device *netdev)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
 	int q;
 
-	for_each_set_bit(q, port->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS)
+	for_each_set_bit(q, dev->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS)
 		airoha_tc_remove_htb_queue(netdev, q);
 
 	return 0;
@@ -2856,9 +2873,8 @@ static int airoha_tc_get_htb_get_leaf_queue(struct net_device *netdev,
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
 
-	if (!test_bit(channel, port->qos_sq_bmap)) {
+	if (!test_bit(channel, dev->qos_sq_bmap)) {
 		NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
 		return -EINVAL;
 	}
@@ -2877,6 +2893,7 @@ static int airoha_tc_setup_qdisc_htb(struct net_device *dev,
 	case TC_HTB_DESTROY:
 		return airoha_tc_htb_destroy(dev);
 	case TC_HTB_NODE_MODIFY:
+		return airoha_tc_htb_modify_queue(dev, opt);
 	case TC_HTB_LEAF_ALLOC_QUEUE:
 		return airoha_tc_htb_alloc_leaf_queue(dev, opt);
 	case TC_HTB_LEAF_DEL:
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index f6f59d25abd9..a308a770116b 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -533,6 +533,8 @@ struct airoha_qdma {
 
 	struct airoha_queue q_tx[AIROHA_NUM_TX_RING];
 	struct airoha_queue q_rx[AIROHA_NUM_RX_RING];
+
+	DECLARE_BITMAP(qos_channel_map, AIROHA_NUM_QOS_CHANNELS);
 };
 
 struct airoha_gdm_dev {
@@ -540,6 +542,8 @@ struct airoha_gdm_dev {
 	struct airoha_qdma *qdma;
 	struct net_device *dev;
 	struct airoha_eth *eth;
+
+	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
 };
 
 struct airoha_gdm_port {
@@ -549,8 +553,6 @@ struct airoha_gdm_port {
 
 	struct airoha_hw_stats stats;
 
-	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
-
 	/* qos stats counters */
 	u64 cpu_tx_packets;
 	u64 fwd_tx_packets;

-- 
2.54.0


