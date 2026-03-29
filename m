Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076F8F3D603
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyfnTshDipc1c7vdpyYHw3RLbpxuvsedM9KqMGzKnmI=; b=zIdzc09WwbRHTassAPHmqc/XfJ
	VwVa9f+Xf17AUYus1nvHe8fGyGj1aA/AlSS7A9qH4H3gdijyf35u/Azz/5bY47R9Rkn/lUWabkU2G
	x3uqnj/TWL5vZEBfkuxLL4TzBgA6Asunncvm96h0AiS4mnpnM2JXKXsi+Ce51KPFLGIMj+IOSUcLK
	ggzMdYp9cJCccyb3xFepQz9fMk8H3zmy2UY7FHUcFDdXgyax6Ru2YP+G4TbcqgULuYdB6jBCV9SsH
	YRCzZQwpwkQWtmNPSdiWr8QqEear5hJm4tlvPid0mmmS4n9aTlfHEDWgVnJdQlraVLIrMhLgqBTf1
	Du76GcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psa-00000009wsA-0SZl;
	Sun, 29 Mar 2026 13:08:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psR-00000009wlp-04qR;
	Sun, 29 Mar 2026 13:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A11760121;
	Sun, 29 Mar 2026 13:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755BCC116C6;
	Sun, 29 Mar 2026 13:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774789705;
	bh=ACQcacUePE5S67qqD3SLcwlGnkM9v4osN3mBW3teRh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lfjpCyUpfeLzDpums623UYqRkJhP50k9LcISecXMAcn/MOVlDNTUgPtT1KxOq+PcO
	 ID0s754H/64DAZYL1WVxizyg+Y3rXyUk2zhRGb3i71jVPKoJrQVz2UY8cugUdbeHBr
	 gtWxXxdNFxvezahPb9OFaWZliL+KrR+sgDEXQn2qk04IP+uUp4gBtG03HBvWI1KjQ8
	 zFmDvGUMTWL4yVqEWPhSzjy1g242L6v937WdrT2Sm9Tz4cHodtbEjQGLT/Nty9tSK/
	 yPToNSAVrWjNNjtvt6Vrf+m+MWj1Guacqp443m1JdTKHUpj5VWf0+HmYD1mOA91yS5
	 Xlyh3dxDx0zcA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 29 Mar 2026 15:07:54 +0200
Subject: [PATCH net-next 04/10] net: airoha: Rely on net_device pointer in
 ETS callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-airoha-eth-multi-serdes-v1-4-00f52dc360ca@kernel.org>
References: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
In-Reply-To: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
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

Remove airoha_gdm_port dependency in ETS tc callback signatures and rely
on net_device pointer instead. Please note this patch does not introduce
any logical change and it is a preliminary patch in order to support
multiple net_devices connected to the same GDM3 or GDM4 port via an
external hw multiplexer.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index e8d4fdbc990195e4b0121ae591066e4fc11ab647..cefe251234989f05c7a2b36161eb63ba861d8b34 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2122,10 +2122,11 @@ airoha_ethtool_get_rmon_stats(struct net_device *dev,
 	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
 }
 
-static int airoha_qdma_set_chan_tx_sched(struct airoha_gdm_port *port,
+static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
 					 int channel, enum tx_sched_mode mode,
 					 const u16 *weights, u8 n_weights)
 {
+	struct airoha_gdm_port *port = netdev_priv(netdev);
 	int i;
 
 	for (i = 0; i < AIROHA_NUM_TX_RING; i++)
@@ -2157,17 +2158,15 @@ static int airoha_qdma_set_chan_tx_sched(struct airoha_gdm_port *port,
 	return 0;
 }
 
-static int airoha_qdma_set_tx_prio_sched(struct airoha_gdm_port *port,
-					 int channel)
+static int airoha_qdma_set_tx_prio_sched(struct net_device *dev, int channel)
 {
 	static const u16 w[AIROHA_NUM_QOS_QUEUES] = {};
 
-	return airoha_qdma_set_chan_tx_sched(port, channel, TC_SCH_SP, w,
+	return airoha_qdma_set_chan_tx_sched(dev, channel, TC_SCH_SP, w,
 					     ARRAY_SIZE(w));
 }
 
-static int airoha_qdma_set_tx_ets_sched(struct airoha_gdm_port *port,
-					int channel,
+static int airoha_qdma_set_tx_ets_sched(struct net_device *dev, int channel,
 					struct tc_ets_qopt_offload *opt)
 {
 	struct tc_ets_qopt_offload_replace_params *p = &opt->replace_params;
@@ -2208,14 +2207,15 @@ static int airoha_qdma_set_tx_ets_sched(struct airoha_gdm_port *port,
 	else if (nstrict < AIROHA_NUM_QOS_QUEUES - 1)
 		mode = nstrict + 1;
 
-	return airoha_qdma_set_chan_tx_sched(port, channel, mode, w,
+	return airoha_qdma_set_chan_tx_sched(dev, channel, mode, w,
 					     ARRAY_SIZE(w));
 }
 
-static int airoha_qdma_get_tx_ets_stats(struct airoha_gdm_port *port,
-					int channel,
+static int airoha_qdma_get_tx_ets_stats(struct net_device *netdev, int channel,
 					struct tc_ets_qopt_offload *opt)
 {
+	struct airoha_gdm_port *port = netdev_priv(netdev);
+
 	u64 cpu_tx_packets = airoha_qdma_rr(port->qdma,
 					    REG_CNTR_VAL(channel << 1));
 	u64 fwd_tx_packets = airoha_qdma_rr(port->qdma,
@@ -2230,7 +2230,7 @@ static int airoha_qdma_get_tx_ets_stats(struct airoha_gdm_port *port,
 	return 0;
 }
 
-static int airoha_tc_setup_qdisc_ets(struct airoha_gdm_port *port,
+static int airoha_tc_setup_qdisc_ets(struct net_device *dev,
 				     struct tc_ets_qopt_offload *opt)
 {
 	int channel;
@@ -2243,12 +2243,12 @@ static int airoha_tc_setup_qdisc_ets(struct airoha_gdm_port *port,
 
 	switch (opt->command) {
 	case TC_ETS_REPLACE:
-		return airoha_qdma_set_tx_ets_sched(port, channel, opt);
+		return airoha_qdma_set_tx_ets_sched(dev, channel, opt);
 	case TC_ETS_DESTROY:
 		/* PRIO is default qdisc scheduler */
-		return airoha_qdma_set_tx_prio_sched(port, channel);
+		return airoha_qdma_set_tx_prio_sched(dev, channel);
 	case TC_ETS_STATS:
-		return airoha_qdma_get_tx_ets_stats(port, channel, opt);
+		return airoha_qdma_get_tx_ets_stats(dev, channel, opt);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -2793,11 +2793,9 @@ static int airoha_tc_setup_qdisc_htb(struct net_device *dev,
 static int airoha_dev_tc_setup(struct net_device *dev, enum tc_setup_type type,
 			       void *type_data)
 {
-	struct airoha_gdm_port *port = netdev_priv(dev);
-
 	switch (type) {
 	case TC_SETUP_QDISC_ETS:
-		return airoha_tc_setup_qdisc_ets(port, type_data);
+		return airoha_tc_setup_qdisc_ets(dev, type_data);
 	case TC_SETUP_QDISC_HTB:
 		return airoha_tc_setup_qdisc_htb(dev, type_data);
 	case TC_SETUP_BLOCK:

-- 
2.53.0


