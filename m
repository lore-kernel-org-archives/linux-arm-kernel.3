Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B9AC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 22:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwpE3NqmwPyDA0h15H/nP/GCU5bS7v38rIsHErC+BBc=; b=1xsk9ChGZlzju0LUh+tG61T2gl
	5gyHsdBXExHJd324OZFTqQZJXvOju+5cWUAoRPcsfUkj2EpDAnDiIYkdvFoi35DDa4W+/DLm3F+SB
	XoIxk4Cz1WJTJX5a78heXvOuXBSvO1MuT798e3OBu3YG+GRnBUITAlNUTGaziP17rk3uIjhpInrVf
	SIoXuXAKKNmxY/NkiyueQWuOWb5/iF/5Td9TLwOvr0OwJgYmFDIPZzPgRtdc1Ehak1u599jgPUQxi
	phoLP6SycLdwMDFczC+RynXBc0KLLEzi0tSQRVl2DBr9XTb1UrQhvInEtx43JAOll/+G2x09YxXvM
	uZhFSvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlw6E-000000080Bo-48Lr;
	Mon, 20 Jul 2026 22:04:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlw66-00000008071-0uHc;
	Mon, 20 Jul 2026 22:04:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B39F343786;
	Mon, 20 Jul 2026 22:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9781F00A3A;
	Mon, 20 Jul 2026 22:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784585065;
	bh=pwpE3NqmwPyDA0h15H/nP/GCU5bS7v38rIsHErC+BBc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PCjQ/C/SmPcmEd0eKScM/G43q9DjY7XngEeaHWStD5VnoW0zwXGikRcaL3xKi0r/u
	 35joYSP6T/ZXXWdgNADOE/XjQqGiKqfY1AUdv6vl5inEORsOyycdrNXDIl8dWBW1NJ
	 ylmzVDCq7aWR/8xeRTKeF1t+9E0T3ZKDgFlKGm9PukuGRbfEnVaNSPQlaeOmGb8Gyj
	 nS3TuRToZ7EzyDZyLO/v0biSV6ocx5shr7J/mL+2CYYo+qoxi6spjkS1s8uDo940to
	 DngrWUeOi0T7OSLXtFhbucVmyYgqeuFdHEeCHmt2HbzfvqMQYG4yO/6uvQU23XUqxz
	 4RiAQawM8nE9g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 21 Jul 2026 00:03:36 +0200
Subject: [PATCH net-next v9 2/3] net: airoha: fix ETS QoS stats counter
 underflow and cross-channel corruption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-airoha-ethtool-priv_flags-v9-2-9c15d8b71a56@kernel.org>
References: <20260721-airoha-ethtool-priv_flags-v9-0-9c15d8b71a56@kernel.org>
In-Reply-To: <20260721-airoha-ethtool-priv_flags-v9-0-9c15d8b71a56@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org
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

airoha_qdma_get_tx_ets_stats() has two bugs:
- The hardware counters read via airoha_qdma_rr() are 32-bit values
  but are stored in u64 locals and subtracted from u64 baselines. When
  a 32-bit hardware counter wraps around, the subtraction produces a
  large underflow value passed to _bstats_update().
- The baseline counters (cpu_tx_packets, fwd_tx_packets) are stored as
  single per-device fields, but airoha_qdma_get_tx_ets_stats() is
  called with different channel values (0-3). Each call reads a
  different channel's hardware counter but overwrites the same
  baseline, corrupting the delta computation for other channels.

Fix both by:
- Narrowing the counter locals and baselines to u32 so that 32-bit
  unsigned subtraction handles wrap-around naturally.
- Grouping the baselines into a per-channel qos_stats array so each
  channel tracks its own previous counter value independently.
- Splitting the delta addition into two statements so the first u32
  delta is widened to u64 on assignment and the second is added in
  u64 arithmetic, preventing overflow when both deltas are large.

Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 18 +++++++++++-------
 drivers/net/ethernet/airoha/airoha_eth.h |  7 ++++---
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 41c1a0ffbdd8..aaf2a4717d12 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2482,16 +2482,20 @@ static int airoha_qdma_get_tx_ets_stats(struct net_device *netdev, int channel,
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_qdma *qdma = dev->qdma;
+	u32 cpu_tx_packets, fwd_tx_packets;
+	u64 tx_packets;
 
-	u64 cpu_tx_packets = airoha_qdma_rr(qdma, REG_CNTR_VAL(channel << 1));
-	u64 fwd_tx_packets = airoha_qdma_rr(qdma,
-					    REG_CNTR_VAL((channel << 1) + 1));
-	u64 tx_packets = (cpu_tx_packets - dev->cpu_tx_packets) +
-			 (fwd_tx_packets - dev->fwd_tx_packets);
+	cpu_tx_packets = airoha_qdma_rr(qdma, REG_CNTR_VAL(channel << 1));
+	fwd_tx_packets = airoha_qdma_rr(qdma,
+					REG_CNTR_VAL((channel << 1) + 1));
+	tx_packets = (u32)(cpu_tx_packets -
+			   dev->qos_stats[channel].cpu_tx_packets);
+	tx_packets += (u32)(fwd_tx_packets -
+			    dev->qos_stats[channel].fwd_tx_packets);
 
 	_bstats_update(opt->stats.bstats, 0, tx_packets);
-	dev->cpu_tx_packets = cpu_tx_packets;
-	dev->fwd_tx_packets = fwd_tx_packets;
+	dev->qos_stats[channel].cpu_tx_packets = cpu_tx_packets;
+	dev->qos_stats[channel].fwd_tx_packets = fwd_tx_packets;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index bf1c249255bd..bf44be9f0954 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -553,9 +553,10 @@ struct airoha_gdm_dev {
 	struct airoha_eth *eth;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
-	/* qos stats counters */
-	u64 cpu_tx_packets;
-	u64 fwd_tx_packets;
+	struct {
+		u32 cpu_tx_packets;
+		u32 fwd_tx_packets;
+	} qos_stats[AIROHA_NUM_QOS_CHANNELS];
 
 	u32 flags;
 	int nbq;

-- 
2.55.0


