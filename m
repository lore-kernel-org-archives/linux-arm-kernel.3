Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228D0C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N9FotERGZ2lP2bVikDRA8ACC8o9IjXehs1SgZCuBjA=; b=qvIpdIlmnnxh0ya1fDlypgnplJ
	mg6kv4oMAGipscRS9+/OP2+GFm417sJTEKw2gvF/lqSg3g1T3zIl/xFlDHx2qgHqcVnZzhxAIBBDY
	Tv+izAMHFmq3JYHDxDxYW/vvMypN0SCjFSs96BA3bRKaeusXQfOwVNK8Ftz6jqoBsQUS9g4HS0iti
	WGONJXy1KhE5gUUBE3zYx7dxzTO013v9E2c0nS02QoU5RP57ZmRs42EE1xs6/IoMo4MI7kx7WDkac
	LlTDhWGShAdTTeH9soCK87xzgH9DfOO9qH7XAP8qPWjEk4P9WMBqOb2GTn004iwFX9S7nsYXsjPKF
	FGNLcb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhJW-00000009z1n-2HYA;
	Wed, 19 Aug 2026 14:30:46 +0000
Received: from mta-65-226.siemens.flowmailer.net ([185.136.65.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhJQ-00000009yyi-0niz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:30:42 +0000
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260819143033d3b167040700020766
        for <linux-arm-kernel@lists.infradead.org>;
        Wed, 19 Aug 2026 16:30:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0N9FotERGZ2lP2bVikDRA8ACC8o9IjXehs1SgZCuBjA=;
 b=bU551jOPa15ZRd5Mh4WqHDNawdcmCuNzOmevR9LSg4HtaKLsiC/ge2AHvfsT9g0oAVOgcb
 mmspCU9JWhIFcORYKWAy1IbD0jP5VIi56LP+CUzJ4MDCAUV3w5ksOyPxN8t2bc6TfEAULMKw
 BUMO+ZzMYNF7hRH+v/D9vpml07Woh4+/BJyoC5yPYrNCfKFnoh2zbfOBvhi8bFDSDhnDAFLz
 kpGZ6D5kWqoe5TkaVi8jKYE8UvrOJo4scovH11cVqgxLVUkwQsSl9Oym0l7h2ksrgQ7SrIGi
 T5kGgrgcVkj1tB5n1aDVDPu7jhNs7uZ9zAuTdYiTLvV4+UNR0gvPo79g==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Date: Wed, 19 Aug 2026 16:30:32 +0200
Subject: [PATCH RFC 3/3] net: stmmac: Migrate IRQ balancing to
 cpumask_local_spread()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-3-3f79a99cadaf@siemens.com>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
In-Reply-To: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_073040_488872_A637CC94 
X-CRM114-Status: GOOD (  13.88  )
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

The previous balancing mechanism was based on num_online_cpus(), which
is a problem for systems cpu-isolating workloads. IRQs were targeting
CPUs that were isolated for those sensitive workloads.

With a migration to cpumask_local_spread() we
    - get NUMA locality
    - honor the default SMP affinity mask, which avoids targeting
      isolated CPUs.

This also aligns with the pattern used by most network drivers dealing
with IRQ affinities / affinity hints.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a71f0df263785dd8badc45292ca3067ab33bda05..949ced7e46d2814b57c6bd86b4886ac3bf33996c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3826,11 +3826,16 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	struct stmmac_msi *msi = priv->msi;
 	enum request_irq_err irq_err;
+	cpumask_var_t affinity;
 	int irq_idx = 0;
 	char *int_name;
+	int node;
 	int ret;
 	int i;
 
+	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
+		return -ENOMEM;
+
 	/* For common interrupt */
 	int_name = msi->int_name_mac;
 	sprintf(int_name, "%s:%s", dev->name, "mac");
@@ -3916,6 +3921,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	}
 
 	/* Request Rx MSI irq */
+	node = dev_to_node(&priv->dev->dev);
 	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
 		if (i >= MTL_MAX_RX_QUEUES)
 			break;
@@ -3935,8 +3941,10 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
-		irq_set_affinity_hint(msi->rx_irq[i],
-				      cpumask_of(i % num_online_cpus()));
+
+		cpumask_clear(affinity);
+		cpumask_set_cpu(cpumask_local_spread(i, node), affinity);
+		irq_set_affinity_and_hint(msi->rx_irq[i], affinity);
 	}
 
 	/* Request Tx MSI irq */
@@ -3959,13 +3967,18 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
-		irq_set_affinity_hint(msi->tx_irq[i],
-				      cpumask_of(i % num_online_cpus()));
+
+		cpumask_clear(affinity);
+		cpumask_set_cpu(cpumask_local_spread(i, node), affinity);
+		irq_set_affinity_and_hint(msi->tx_irq[i], affinity);
 	}
 
+	free_cpumask_var(affinity);
+
 	return 0;
 
 irq_error:
+	free_cpumask_var(affinity);
 	stmmac_free_irq(dev, irq_err, irq_idx);
 	return ret;
 }

-- 
2.55.0


