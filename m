Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332D7EB26E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RZd2m1rYBzhb6+CUkIcXbLtyHMbbg4kS3QJRa4t3tA=; b=QrgZ0SE4pLANnUbEVUs92ugile
	qh+etomvO9aNpr9a5hqK1KwBzqYUVb1q5s6AbDLLgJ30UgSVvvlPBJ+GymN/YlyWwerpSrPy+yxxI
	rSgm6oGrJkVzrYAnlD8PMHz0+TKEnZdk7i7AKehq709uoZMW8OysC5WD8PXgjQ1fVDq+S+LCsLs0K
	JxjSpQdvmmzblGe3W5Kp6dzWrtjYi4+kC/fQr1PsqXH4wOYhmIh+M0FDL1Azt5I101ETnE5evOKFf
	30IUkFXru5M2xCWWmOuh99ll8/8MFtaL2IAjDMnhJLz6V4Cf1nw6rSGso4G1wjHGiPgWoJXohN/pg
	B3sETM4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqbG-0000000HEgk-2WhO;
	Tue, 10 Feb 2026 16:28:30 +0000
Received: from mta-64-225.siemens.flowmailer.net ([185.136.64.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqbB-0000000HEd8-1mC3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 16:28:28 +0000
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260210162820ca0a966ff000020780
        for <linux-arm-kernel@lists.infradead.org>;
        Tue, 10 Feb 2026 17:28:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2RZd2m1rYBzhb6+CUkIcXbLtyHMbbg4kS3QJRa4t3tA=;
 b=iMabUuweSHnhFWaYI+3wNaaJ+BRwEI/KPAbztyzS8JD3v4ZYDbtjHJb/7NlKj3SleKSbmm
 Y1O23MoVjO5K4hU1Z8vfYIB3RMGHDf5bZfRw3hU6um2BPgwzTJAnBBAuLyx2vHy/bwIXXB90
 qEtq4I6mHYhiDlrPOtMMxhpRNsRSXW01A+pI7dvHtsQJH0gjGRZp3b/Bz1ItDd+MU5OL0BX3
 v11jJpgJXquLKC/JCLqvF6DMik9kIL126+fTQrtOzUHe0qO0mTpyVjomldQQPGbgGQP93jf2
 3AlMJ08R1RDQJGTuNWSQAohxPS6rFZ0dGyGyPB1yMC6dbUUywXlzLQfQ==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Date: Tue, 10 Feb 2026 17:28:15 +0100
Subject: [PATCH net-next 2/2] net: stmmac: Use cpumask_local_spread() for
 IRQ spreading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-flo-net-stmmac-default-affinity-core-v1-2-4e76612444e1@siemens.com>
References: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
In-Reply-To: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_082826_080016_ABD562E2 
X-CRM114-Status: GOOD (  14.20  )
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

The stmmac driver was previously implementing a self-made IRQ
spreading mechanism based on num_online_cpus(). By migrating to
cpumask_local_spread() the spreading gets NUMA aware.

In addition, most drivers seem to use cpumask_local_spread(),
aligning / harmonizing a bit more.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 41 +++++++++++++++++++----
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 012b0a477255df73b2e145b62e09eeb2133e827a..52b75df2b71239aab5b1d5138b78d6c5310b9c5b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -329,6 +329,8 @@ struct stmmac_priv {
 	int sfty_ue_irq;
 	int rx_irq[MTL_MAX_RX_QUEUES];
 	int tx_irq[MTL_MAX_TX_QUEUES];
+	cpumask_var_t rx_affinity[MTL_MAX_RX_QUEUES];
+	cpumask_var_t tx_affinity[MTL_MAX_TX_QUEUES];
 	/*irq name */
 	char int_name_mac[IFNAMSIZ + 9];
 	char int_name_wol[IFNAMSIZ + 9];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a379221b96a348e20f2afb0f44540cfba2f2477a..ddbfc0774143d0353c83988b2dfffa75132bd0ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3739,6 +3739,8 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	enum request_irq_err irq_err;
 	int irq_idx = 0;
 	char *int_name;
+	int numa_node;
+	int cpu;
 	int ret;
 	int i;
 
@@ -3845,6 +3847,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	}
 
 	/* Request Rx MSI irq */
+	numa_node = dev_to_node(&priv->dev->dev);
 	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
 		if (i >= MTL_MAX_RX_QUEUES)
 			break;
@@ -3864,8 +3867,10 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
-		irq_set_affinity_hint(priv->rx_irq[i],
-				      cpumask_of(i % num_online_cpus()));
+
+		cpu = cpumask_local_spread(i, numa_node);
+		cpumask_set_cpu(cpu, priv->rx_affinity[i]);
+		irq_set_affinity_hint(priv->rx_irq[i], priv->rx_affinity[i]);
 	}
 
 	/* Request Tx MSI irq */
@@ -3888,8 +3893,10 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
-		irq_set_affinity_hint(priv->tx_irq[i],
-				      cpumask_of(i % num_online_cpus()));
+
+		cpu = cpumask_local_spread(i, numa_node);
+		cpumask_set_cpu(cpu, priv->tx_affinity[i]);
+		irq_set_affinity_hint(priv->tx_irq[i], priv->tx_affinity[i]);
 	}
 
 	return 0;
@@ -7653,6 +7660,14 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
 
+static void stmmac_free_affinity(cpumask_var_t *m, unsigned int n)
+{
+	unsigned int i;
+
+	for (i = 0; i < n; i++)
+		free_cpumask_var(m[i]);
+}
+
 static int __stmmac_dvr_probe(struct device *device,
 			      struct plat_stmmacenet_data *plat_dat,
 			      struct stmmac_resources *res)
@@ -7699,10 +7714,21 @@ static int __stmmac_dvr_probe(struct device *device,
 	priv->sfty_irq = res->sfty_irq;
 	priv->sfty_ce_irq = res->sfty_ce_irq;
 	priv->sfty_ue_irq = res->sfty_ue_irq;
-	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
 		priv->rx_irq[i] = res->rx_irq[i];
-	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
+		if (!zalloc_cpumask_var(&priv->rx_affinity[i], GFP_KERNEL)) {
+			stmmac_free_affinity(priv->rx_affinity, i);
+			return -ENOMEM;
+		}
+	}
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
 		priv->tx_irq[i] = res->tx_irq[i];
+		if (!zalloc_cpumask_var(&priv->tx_affinity[i], GFP_KERNEL)) {
+			stmmac_free_affinity(priv->rx_affinity, MTL_MAX_RX_QUEUES);
+			stmmac_free_affinity(priv->tx_affinity, i);
+			return -ENOMEM;
+		}
+	}
 
 	if (!is_zero_ether_addr(res->mac))
 		eth_hw_addr_set(priv->dev, res->mac);
@@ -8023,6 +8049,9 @@ void stmmac_dvr_remove(struct device *dev)
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 
+	stmmac_free_affinity(priv->rx_affinity, MTL_MAX_RX_QUEUES);
+	stmmac_free_affinity(priv->tx_affinity, MTL_MAX_TX_QUEUES);
+
 	if (priv->plat->exit)
 		priv->plat->exit(dev, priv->plat->bsp_priv);
 }

-- 
2.53.0


