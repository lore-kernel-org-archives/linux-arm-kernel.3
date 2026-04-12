Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA955E937F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9bT1aZc+fZ47P5keOfyluoi5sTgS3zjLq9FMh9TGWM=; b=HpDekArVLgGiru26g7FAA/pOem
	SDoAURkp2ygadDsD9DmCCpHmez+LAbce18TJ8v0Y2Uy5GJPJiewOR0dJdHr+kDlFaiOszd157IWB+
	/PTtoeUhVrfg22hIAdRbnH/qamudeiXI7TjYKYVBq7aM7mUyI+YD4y9h5VCzPM/mj7woaQ5EGzhuU
	f7HNVjYAQL7J0W/Ic4fvQEpeJkPBwYihd6f8rxtxWKBfCh/WVVrEc/Rv7qLo7HHvDNiGnfuaAqjg0
	N0U5p7EIqxuo+gotjH17YyRrpaDXwe9MRbplufYBClB3Du2Xp2cgTNy/GQbEy3od6sgkj05Wo7PsZ
	FljeZuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByNW-0000000EWuS-2tDO;
	Sun, 12 Apr 2026 17:13:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByNV-0000000EWsh-10UL;
	Sun, 12 Apr 2026 17:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C2C960180;
	Sun, 12 Apr 2026 17:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8228C19424;
	Sun, 12 Apr 2026 17:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776014024;
	bh=BwXzSKo8O6XZ4uKlUSwMzQY2fTA/0n/oxvStx7Ka5oM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g7VwjRcKwFy7gc7X/oa6VeIRpU4Tk/HA1FXGoi5k9c4RH3PiLaA36raLAJw6wnO24
	 WgouBjti2v0hnGvVCwXQuMVwLf0nUvk/PsuZp8cPZVyEWhAtdeu6t/PqpoH3G0l51H
	 K/zt9lTBgho3rsapudLiFwFuAqFtvTkP8LNNwJh+LrA+9eCnAsXs4MTJ0YaI3M8ho3
	 pY/NT5vTdsnkgfRPY6C7X7Ap/0lU2DhItyRBXs07VlQwsEu/3X32ZU/6BGCjfhmB3v
	 Vx87RG4SMWw8uSfKJO/FqvhcDvZc6nnZKwkqVC+VCFIV8jq/S1npptrGx3jF0KksFF
	 y8AfL9AhvIOiQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 12 Apr 2026 19:13:14 +0200
Subject: [PATCH net-next 3/3] net: airoha: Rely on net_device pointer in
 ETS callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-airoha-multi-serdes-preliminary-patch-v1-3-08d5b670ca8f@kernel.org>
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

Remove airoha_gdm_port dependency in ETS tc callback signatures and rely
on net_device pointer instead. Please note this patch does not introduce
any logical change and it is a preliminary patch in order to support
multiple net_devices connected to the same GDM3 or GDM4 port via an
external hw arbiter.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index c2b5fcffce82..d426dc173d99 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2138,10 +2138,11 @@ airoha_ethtool_get_rmon_stats(struct net_device *dev,
 	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
 }
 
-static int airoha_qdma_set_chan_tx_sched(struct airoha_gdm_port *port,
+static int airoha_qdma_set_chan_tx_sched(struct net_device *dev,
 					 int channel, enum tx_sched_mode mode,
 					 const u16 *weights, u8 n_weights)
 {
+	struct airoha_gdm_port *port = netdev_priv(dev);
 	int i;
 
 	for (i = 0; i < AIROHA_NUM_TX_RING; i++)
@@ -2173,17 +2174,15 @@ static int airoha_qdma_set_chan_tx_sched(struct airoha_gdm_port *port,
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
@@ -2224,20 +2223,21 @@ static int airoha_qdma_set_tx_ets_sched(struct airoha_gdm_port *port,
 	else if (nstrict < AIROHA_NUM_QOS_QUEUES - 1)
 		mode = nstrict + 1;
 
-	return airoha_qdma_set_chan_tx_sched(port, channel, mode, w,
+	return airoha_qdma_set_chan_tx_sched(dev, channel, mode, w,
 					     ARRAY_SIZE(w));
 }
 
-static int airoha_qdma_get_tx_ets_stats(struct airoha_gdm_port *port,
-					int channel,
+static int airoha_qdma_get_tx_ets_stats(struct net_device *dev, int channel,
 					struct tc_ets_qopt_offload *opt)
 {
+	struct airoha_gdm_port *port = netdev_priv(dev);
 	u64 cpu_tx_packets = airoha_qdma_rr(port->qdma,
 					    REG_CNTR_VAL(channel << 1));
 	u64 fwd_tx_packets = airoha_qdma_rr(port->qdma,
 					    REG_CNTR_VAL((channel << 1) + 1));
 	u64 tx_packets = (cpu_tx_packets - port->cpu_tx_packets) +
 			 (fwd_tx_packets - port->fwd_tx_packets);
+
 	_bstats_update(opt->stats.bstats, 0, tx_packets);
 
 	port->cpu_tx_packets = cpu_tx_packets;
@@ -2246,7 +2246,7 @@ static int airoha_qdma_get_tx_ets_stats(struct airoha_gdm_port *port,
 	return 0;
 }
 
-static int airoha_tc_setup_qdisc_ets(struct airoha_gdm_port *port,
+static int airoha_tc_setup_qdisc_ets(struct net_device *dev,
 				     struct tc_ets_qopt_offload *opt)
 {
 	int channel;
@@ -2259,12 +2259,12 @@ static int airoha_tc_setup_qdisc_ets(struct airoha_gdm_port *port,
 
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
@@ -2807,11 +2807,9 @@ static int airoha_tc_setup_qdisc_htb(struct net_device *dev,
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


