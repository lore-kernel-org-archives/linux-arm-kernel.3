Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A01ECAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qPY46ZDxndv9nULS0qPuByMKBB8vd7a9OQQz/l36G/I=; b=K3RRdZ+cY3bz0gjTHRlj9Pz5TB
	6tvOdCOT8gEnnidoDQ45Z5e4CPj3u0HdTHFy4XghoJVdJC+gTAOfrc5oSLF0tFDhlFbUS28yCgU+F
	MCw/ukpOB1OWo2rGnP+uzy0zg9wLkcIvRl/8qwPOldWVmzJsoEjycvwwY6F4YtMuf5TyBqwdehFpp
	3YUVSmVlbhM6CE6shM8c9ELWCgqXeakG24pLnsboekWJpyEcEE+MTStp9s9JoYBLIMQVWbI6qrm9T
	J1qk2NuRlLF7Cdik4wr561ngoqRr+x2QIFPiHX4OPlgL1Lz86NfFWIiAqUsBZQHgbDL2dTbtYMSiL
	rTnosXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4Tb-00000003BOw-31RI;
	Mon, 15 Sep 2025 08:22:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4TZ-00000003BOC-2NWm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0EE443B82;
	Mon, 15 Sep 2025 08:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8F26C4CEFA;
	Mon, 15 Sep 2025 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757924536;
	bh=mo4HPuFIxILu1fSJb80bB4lgwGqWuG93OPcqvnD64Pc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JTi177P/uBOLY62ASimFn1X5aACZldEUqQP2h1qOfZVarSFyT83Qs762HpRoUZRsy
	 IAe3Ks9JKMIHq55nWZ9F8Vma/vJEdPHS2fMZ/vz46aMOKnN4TXRv9Tb5HkuPFVmGSQ
	 fpsjQrVP4D4BPR8US21f6BGYmy+cLsvgfKH78pbENfYvTtGpz9P2CbUU4GAnNVKBhn
	 9Ml1rsXJh/fD8I3JCPxP9mvaqU/qgrJujyV3Z445LmIhWjRPJ6zjqVoE29JyDQOU/g
	 BMxsnXsms6AmbJfIuSc3E9BJWfL/+wCBrhwUhVmIf+v/ZZhRKt3FIAw4yqJ0LR/Arj
	 KdpMnPPzOSAAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F5ACAC599;
	Mon, 15 Sep 2025 08:22:16 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Mon, 15 Sep 2025 16:22:14 +0800
Subject: [PATCH net-next v2] net: stmmac: est: Drop frames causing HLBS
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-hlbs_2-v2-1-27266b2afdd9@altera.com>
X-B4-Tracking: v=1; b=H4sIALXMx2gC/12NywrCMBBFf6XM2pEkOtq68j+kSB9TM1ATSUKpl
 Py7oUuXh3M5d4PIQTjCrdog8CJRvCtgDhUMtnMvRhkLg1GGVKM12rmPT4M0jSPxuT5NykAZfwJ
 Psu6hBzhO6HhN0BZjJSYfvvvDonf/H1s0ahz6CxHXTUP99d7NiUN3HPwb2pzzD68txvunAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757924535; l=4857;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=hFASYJ89I2m+eMFKEU8Vw8nda9ry4NXxOx/oENtYScc=;
 b=JZPA6bBDBbmw1kmGvVEjSVf2f5+gWw40697/4dlWcC1R3xyZcnqCR2GZQqK2kNwiiDUisLXIO
 v/YYi0W9bpmAn6u75g6queSx6QKhCUO9XrUq7Jh19vBgWWamXQIgAm/
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_012217_656446_5CFA51AC 
X-CRM114-Status: GOOD (  15.04  )
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
Changes in v2:
- Removed unnecessary parantheses
- Link to v1: https://lore.kernel.org/r/20250911-hlbs_2-v1-1-cb655e8995b7@altera.com
---
 drivers/net/ethernet/stmicro/stmmac/common.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 9 ++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c  | 7 +++++--
 4 files changed, 13 insertions(+), 5 deletions(-)

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
index ac6f2e3a3fcd2f9ae21913845282ff015cd2f7ec..4b513d27a9889046e8b5e404adfd917f469c3f05 100644
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
 
@@ -109,6 +109,10 @@ static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 
 		x->mtl_est_hlbs++;
 
+		for (i = 0; i < txqcnt; i++)
+			if (value & BIT(i))
+				x->mtl_est_txq_hlbs[i]++;
+
 		/* Clear Interrupt */
 		writel(value, est_addr + EST_SCH_ERR);
 
@@ -131,10 +135,9 @@ static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 
 		x->mtl_est_hlbf++;
 
-		for (i = 0; i < txqcnt; i++) {
+		for (i = 0; i < txqcnt; i++)
 			if (feqn & BIT(i))
 				x->mtl_est_txq_hlbf[i]++;
-		}
 
 		/* Clear Interrupt */
 		writel(feqn, est_addr + EST_FRM_SZ_ERR);
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
base-commit: 5b5ba63a54cc7cb050fa734dbf495ffd63f9cbf7
change-id: 20250911-hlbs_2-5fdd5e483f02

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



