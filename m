Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E608CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pk4GSSHk/dF+JbEBtRSDh6h8eFeqFi8ObkP3r/CXZcY=; b=GtvlJO//MWSZYpxbb2CrGOj61j
	WF+jZAWte0GwoP2cVFn62ifInKAEJCUO8vdb3QJ+rXWdk1Ikj+O/0K2BAHXzIBTQfaWK+/Y5Dr09B
	TcH69pUkUKBeVDNpbjXs8rnSjHWzPvTejHQSUGsSAbuv8pYSTWp5cjeldWAVDYTifFhzgc5UqwwKO
	XDUQZfmSXcfRFyW98u0SUu+DAAXh69Oow4aNFwPFX10BypbtiYPymBUfj5V3hKVu0Ng2rn9uCQZbE
	Gx5RZSOu8spdGAg36xMSRyKCIV/k7H+jOrr2JNu7GN0zdJzre09dUx/8EqJ52QCkmMMTminWcR3Dc
	Z4GfR/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcov-00000001s3R-0os1;
	Thu, 11 Sep 2025 08:38:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcos-00000001s1S-3wLH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A28664448D;
	Thu, 11 Sep 2025 08:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78EDEC4CEF7;
	Thu, 11 Sep 2025 08:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757579898;
	bh=3Ta+U8bDmn+TLd+5gSYW6szMLbfTk9DlYnED0UXkvx8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=HxB+5EauNEn0j+nE4dMAuReoUaw83Uxlh6GEV/G3pDSy8ueRVuWt32zgJ+3Hzykwm
	 sQDCUjkQ6mxmbINjejWClrBrDVh/uskw1GwFSd7Lwd0AKJqPGSmkbxZoEU3oKMtqgI
	 NI2aLkgJzZ5zT1mxS7d6omOjF4km0EiKJovYBoOvfcnwWXBIqaq/lAL11wu1/fm9Iy
	 jxgVoHsUHvh4eAhKsMcXlpKhAUFyCZz34r7PP9m3/pZUcZdRDT0WEhwWmCm+StS6+k
	 a8VisZ5k/kzbNPN1mDKgCCPYQx3EtrpY2jHDed4bzvvpVGOxEptCM3jXq0F5x2Y/yb
	 lvhiq6cp94B0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711A1CA1016;
	Thu, 11 Sep 2025 08:38:18 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Thu, 11 Sep 2025 16:38:16 +0800
Subject: [PATCH net-next] net: stmmac: est: Drop frames causing HLBS error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-hlbs_2-v1-1-cb655e8995b7@altera.com>
X-B4-Tracking: v=1; b=H4sIAHeKwmgC/x3MQQqAIBBA0avErBPUEqqrRETlmANhoRKCePek5
 YPPzxDQEwaYmgweXwp0uwrRNnDYzZ3ISFeD5FLxUQhmrz2skimjtcJ+6AyXUOPHo6H0j2ZwGJn
 DFGEp5QMVeEEKYgAAAA==
X-Change-ID: 20250911-hlbs_2-5fdd5e483f02
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757579897; l=4389;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=rzzc5ust1FUYLSTdUDlYDXeMTa9SqQgjaI1YarHG5WM=;
 b=ZMgyKAlpBN4cQqypdUTAVHzpXbtiOTB7N1s66ZtuclJIHZ6WivlbvTwuXWfz4CPtQUFdlXgez
 rlqVE8DCNOPDuKsQXxAs6WkTpax/SeJICQ6fbDQB53RbMNDHpToKHeL
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_013819_027258_5774702D 
X-CRM114-Status: GOOD (  14.11  )
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Drop those frames causing HLBS error to avoid HLBS interrupt
flooding and netdev watchdog timeouts due to blocked packets.
Also add HLBS frame drops to taprio stats.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 7 ++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c  | 7 +++++--
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index eaa1f2e1c5a53b297b014a8218bf8f3db5beb4de..8f34c9ad457f07553206841223fd38e55208d5ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -228,6 +228,7 @@ struct stmmac_extra_stats {
 	unsigned long mtl_est_btrlm;
 	unsigned long max_sdu_txq_drop[MTL_MAX_TX_QUEUES];
 	unsigned long mtl_est_txq_hlbf[MTL_MAX_TX_QUEUES];
+	unsigned long mtl_est_txq_hlbs[MTL_MAX_TX_QUEUES];
 	/* per queue statistics */
 	struct stmmac_txq_stats txq_stats[MTL_MAX_TX_QUEUES];
 	struct stmmac_rxq_stats rxq_stats[MTL_MAX_RX_QUEUES];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index ac6f2e3a3fcd2f9ae21913845282ff015cd2f7ec..385431a3336b731547df49621098586b741cae85 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -63,7 +63,7 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 			 EST_GMAC5_PTOV_SHIFT;
 	}
 	if (cfg->enable)
-		ctrl |= EST_EEST | EST_SSWL;
+		ctrl |= EST_EEST | EST_SSWL | EST_DFBS;
 	else
 		ctrl &= ~EST_EEST;
 
@@ -109,6 +109,11 @@ static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 
 		x->mtl_est_hlbs++;
 
+		for (i = 0; i < txqcnt; i++) {
+			if (value & BIT(i))
+				x->mtl_est_txq_hlbs[i]++;
+		}
+
 		/* Clear Interrupt */
 		writel(value, est_addr + EST_SCH_ERR);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
index d247fa383a6e44a5a8371dd491eab5b1c99cd1f2..f70221c9c84afe6bce62782c7847a8005e469dd7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
@@ -16,6 +16,7 @@
 #define EST_XGMAC_PTOV_MUL		9
 #define EST_SSWL			BIT(1)
 #define EST_EEST			BIT(0)
+#define EST_DFBS			BIT(5)
 
 #define EST_STATUS			0x00000008
 #define EST_GMAC5_BTRL			GENMASK(11, 8)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 694d6ee1438197bd4434af6e9b78f022e94ff98f..97e89a604abd7a01bb8e904c38f10716e0a911c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1080,6 +1080,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
 			priv->xstats.max_sdu_txq_drop[i] = 0;
 			priv->xstats.mtl_est_txq_hlbf[i] = 0;
+			priv->xstats.mtl_est_txq_hlbs[i] = 0;
 		}
 		mutex_unlock(&priv->est_lock);
 	}
@@ -1097,7 +1098,8 @@ static void tc_taprio_stats(struct stmmac_priv *priv,
 
 	for (i = 0; i < priv->plat->tx_queues_to_use; i++)
 		window_drops += priv->xstats.max_sdu_txq_drop[i] +
-				priv->xstats.mtl_est_txq_hlbf[i];
+				priv->xstats.mtl_est_txq_hlbf[i] +
+				priv->xstats.mtl_est_txq_hlbs[i];
 	qopt->stats.window_drops = window_drops;
 
 	/* Transmission overrun doesn't happen for stmmac, hence always 0 */
@@ -1111,7 +1113,8 @@ static void tc_taprio_queue_stats(struct stmmac_priv *priv,
 	int queue = qopt->queue_stats.queue;
 
 	q_stats->stats.window_drops = priv->xstats.max_sdu_txq_drop[queue] +
-				      priv->xstats.mtl_est_txq_hlbf[queue];
+				      priv->xstats.mtl_est_txq_hlbf[queue] +
+				      priv->xstats.mtl_est_txq_hlbs[queue];
 
 	/* Transmission overrun doesn't happen for stmmac, hence always 0 */
 	q_stats->stats.tx_overruns = 0;

---
base-commit: 1f24a240974589ce42f70502ccb3ff3f5189d69a
change-id: 20250911-hlbs_2-5fdd5e483f02

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



