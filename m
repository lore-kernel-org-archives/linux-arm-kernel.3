Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FFCCD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kHymj4XVbofHaF6YHWUVm5tKByluE1wMRzmAeLv90E=; b=lD0msfwgqO4k2SDGX2wwZ7RkUd
	9Osg2pjAwuS0Cb7UWba6Q1W+0324amsHRe1G7RoVKgu/RL+x3foFBqCfW31HyU+u1j8uyxv4dh+ia
	nDTN3Vy8H2VAMGV3msPoyG3/B+XArGQxbkIV9HL7wWqvhQopPZJjew3OCV26XBEIpjeocpDvYH/cm
	K9PMgd1PaGMzijdL0SvHOhYRyAWSG+xSQvt+z2AI1+G4qh0uVpUgsomwm8zXiu1pgeGVNJIxDbfVr
	7GyYe8ux4wMtTsV0LoBwlAA7LvpIC4SZdNsM4q/JV/7VR2piNmW2FiH1SiBnQSqnXHeHMs/NVg7Qq
	z8HDG+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhNn-00000008yaR-21xj;
	Sat, 09 May 2026 13:06:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhNk-00000008yVs-2X3U;
	Sat, 09 May 2026 13:06:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3556043E69;
	Sat,  9 May 2026 13:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E8BC2BCB4;
	Sat,  9 May 2026 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778331972;
	bh=s4TsbAEx7cvK8gmSjoVm9l46o2DpUZeN8lkEeMpXyfo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aXqc2hYG7zd5M4MRzVfpvuNC5Aq/01VDzfrULeEXBESyFr861dq/zuED/siL3emFm
	 e/roNk/padYAGRqxBIdHPq+MXL+Ikv328y1Zf0Hc6tDL09HSJRZlO6DyBW8wvKXb8A
	 VYmA5piMqabzWonS/QgR6M+RR0xO0+ME77tfqrZLkaf0YVNRWilLGBFkSec6oooLWY
	 3mYd7luKo/ojEXxzAzOlUrNOhwPQI2OULg39NMyNqyOiqr+j6u3kaA6xqLj8xjp+ER
	 ADg71zTxVsj3SmqnuAXwHP7SxobEPvIQoyOApHkpj2SlJa7YsuJx3u4iYFRqzFrHff
	 MSbEp+LmBROJg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 May 2026 15:05:32 +0200
Subject: [PATCH net-next v5 07/12] net: airoha: Move {cpu,fwd}_tx_packets
 in airoha_gdm_dev struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-airoha-eth-multi-serdes-v5-7-805e38edc2aa@kernel.org>
References: <20260509-airoha-eth-multi-serdes-v5-0-805e38edc2aa@kernel.org>
In-Reply-To: <20260509-airoha-eth-multi-serdes-v5-0-805e38edc2aa@kernel.org>
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
X-CRM114-CacheID: sfid-20260509_060612_692619_1787E969 
X-CRM114-Status: GOOD (  13.03  )
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
share the same GDM port, cpu_tx_packets and fwd_tx_packets fields can
be overwritten with the value from a different QDMA block. In order to
fix the issue move cpu_tx_packets and fwd_tx_packets fields from
airoha_gdm_port struct to airoha_gdm_dev one.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 16 +++++++---------
 drivers/net/ethernet/airoha/airoha_eth.h |  7 +++----
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 33a0f7b98d52..904f8da93600 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2312,19 +2312,17 @@ static int airoha_qdma_get_tx_ets_stats(struct net_device *netdev, int channel,
 					struct tc_ets_qopt_offload *opt)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
+	struct airoha_qdma *qdma = dev->qdma;
 
-	u64 cpu_tx_packets = airoha_qdma_rr(dev->qdma,
-					    REG_CNTR_VAL(channel << 1));
-	u64 fwd_tx_packets = airoha_qdma_rr(dev->qdma,
+	u64 cpu_tx_packets = airoha_qdma_rr(qdma, REG_CNTR_VAL(channel << 1));
+	u64 fwd_tx_packets = airoha_qdma_rr(qdma,
 					    REG_CNTR_VAL((channel << 1) + 1));
-	u64 tx_packets = (cpu_tx_packets - port->cpu_tx_packets) +
-			 (fwd_tx_packets - port->fwd_tx_packets);
+	u64 tx_packets = (cpu_tx_packets - dev->cpu_tx_packets) +
+			 (fwd_tx_packets - dev->fwd_tx_packets);
 
 	_bstats_update(opt->stats.bstats, 0, tx_packets);
-
-	port->cpu_tx_packets = cpu_tx_packets;
-	port->fwd_tx_packets = fwd_tx_packets;
+	dev->cpu_tx_packets = cpu_tx_packets;
+	dev->fwd_tx_packets = fwd_tx_packets;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 475f5c64bfcb..694e83bfd1e7 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -543,6 +543,9 @@ struct airoha_gdm_dev {
 	struct airoha_eth *eth;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
+	/* qos stats counters */
+	u64 cpu_tx_packets;
+	u64 fwd_tx_packets;
 };
 
 struct airoha_gdm_port {
@@ -552,10 +555,6 @@ struct airoha_gdm_port {
 
 	struct airoha_hw_stats stats;
 
-	/* qos stats counters */
-	u64 cpu_tx_packets;
-	u64 fwd_tx_packets;
-
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };
 

-- 
2.54.0


