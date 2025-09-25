Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38322CAC5B7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxSn/XKZJ8nGzJm46+gGlk+s96fi6vy5LIT8pPU1udE=; b=iqo96rTTkr5rA6965CpC5xZzyd
	ebO10GcvSmsl893SJfj8kzMUDk5ONCTeQoxAI99ofiHcMmtShPBxc7ROtCpilXlp/u+6GOrHgkbxG
	t8tCd6wqgYL3G0eEJsFacfzHqRuzwci9Z681ugWWR4EfmJGnnKkdF3ww3LVgUJwF7vTt886TMmV/y
	s8FxmdY119C9KU3sTiSH9Lzgbqfgjuda6Ui97I8xZZatk01nFbe45Enl5dkwGIkIbiXRbBzjdCcd1
	hfj062TlhORm6Tv/r5MMyPCnPnH2BWGK0A4ZGRoex/mb/nu17ld1sevEDfzUGGXwDzvKMdUTrtCf4
	4hig9jJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mcL-00000009n6V-0FKm;
	Thu, 25 Sep 2025 14:06:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mcE-00000009mxL-1OX4
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Sep 2025 14:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=nxSn/XKZJ8nGzJm46+gGlk+s96fi6vy5LIT8pPU1udE=; b=IIzu5O4qZYEDDT/YLbiv0hpvFL
	3qKup2SD7U7AS514dWH9XmUI0axgHEr4m5dryPSvslqAVDFmA/wpbLUd5afPhYExE5JkQXx6A7pUE
	ONKWktuYXSwEdJTHt9CiRr5fwW9ZnLNEcGON0pdlYnV1F7T9VHts5dbufuW2VImIixUEi/PtCNDNu
	zfWH+dTnyiNGtWetszFwltjtpyCleWTK5cjEcE7Uz0EY+qmTcbdfCKgcN7HZTTOJhI/vqSZ1ZLW2u
	8grzg1tjVqAG/aNZBS4obnq7kXLhmqnMGBLkaSq/vTbWKCQ/KyXhh9ZIo8fzbh5cUuazYFDSZdpWk
	GBtXVvZQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mcB-00000009D0G-0SSV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:06:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2D6E44FCB;
	Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBAC1C4CEF7;
	Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809187;
	bh=zSY/958KOCpOwFRxar6kTLevxJFIWpMxyuGHYhwxU7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tiPz4dJA953Eq7WiiXNtY8Da30yNCIhru9tzAm1DI+1ynLbFstBbJYfR4g8TDh58l
	 ZJgNm46swAELQTb96Kxq0JPV091OHhtfCAwTgOvM+/ChwjHqSKoDovJfeEgSvWHzSV
	 2qz7sXJL3Wu4MAk75vwKFfn+4tuVga3ZVXKbz2aVhg/YSiKZwCitg08YOdnpk5/cdK
	 SKoYBxqhXZVE4hW5LyQ7GHeFUMFkX6Nl7iyZd5dj+cxvJrcSI0i5wC8cTeIdpHPsbi
	 +krgt+kPpndBKfBywNyzG5GrqoxYUUQ3zMkAPLGwhaaeLaNkewW6qsr3Ygn09/860D
	 azuchr7Sxkk4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4FACAC5A7;
	Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Thu, 25 Sep 2025 22:06:13 +0800
Subject: [PATCH net-next v3 1/2] net: stmmac: est: Drop frames causing HLBS
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-hlbs_2-v3-1-3b39472776c2@altera.com>
References: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
In-Reply-To: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758809186; l=3161;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=U2GpYPDapoJb67AF7YZfXLYJz7u/9hkBR8xWCl+t188=;
 b=k7vpTLnNXsMkDiKz+37H6mNODT5JstRk2/Veg+ISYJlBI6kE6Em5cTVhPKrovC0m83vJYK9pg
 uymIw+ThuLqDYqtYTtCsxFuIMmr7jI34nwSYdAqkxGEOKIcAdq58ONL
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_150631_641798_2B577E3F 
X-CRM114-Status: GOOD (  15.03  )
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

Drop those frames causing Head-of-Line Blocking due to Scheduling
(HLBS) error to avoid HLBS interrupt flooding and netdev watchdog
timeouts due to blocked packets. Tx queues can be configured to drop
those blocked packets by setting Drop Frames causing Scheduling Error
(DFBS) bit of EST_CONTROL register.

Also, add per queue HLBS drop count.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 9 ++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h | 1 +
 3 files changed, 8 insertions(+), 3 deletions(-)

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

-- 
2.35.3



