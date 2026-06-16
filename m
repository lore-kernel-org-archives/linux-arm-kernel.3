Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28969CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L4HUsPuZdj6LV3uNElVOC/aB6ZtKXn8837uRKeGnUl0=; b=0bIVsmL5IVTN4+5BjUJqNnuzaW
	YuMSAkMolpviWsT02LVhvLuEIIaJLvM7aHrKQmtMvdHXWJAYOIiIKxPjHuytbJCkjq37e9hRfxq9u
	hm6YD2znSGTjrGFq5hKKimvwickGFB2IFnUaoNPTSjACxPS/23EyPWbZSTofv4K4bBdAUfXTlXUOi
	egJEbW/HUADU75bvSrnTLl4inK7uHCXRXpTdA49wCT/OtU0WRKq77hYBd87tiTkcmPGI85Neg3/Xn
	COB//7N+82gU9Gf/ycOwqwm/sn6xAk/vbmYCZOsbdZMeClae3VFLXlymm1wctns0zf77FRfGkkZ8t
	czWCwB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUve-0000000FvqY-3AMw;
	Tue, 16 Jun 2026 14:38:14 +0000
Received: from smtp-bc0a.mail.infomaniak.ch ([45.157.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUvb-0000000Fvpj-0f3N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 14:38:13 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gfqND4ClszC3W;
	Tue, 16 Jun 2026 16:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pschenker.ch;
	s=20220412; t=1781620684;
	bh=L4HUsPuZdj6LV3uNElVOC/aB6ZtKXn8837uRKeGnUl0=;
	h=From:To:Cc:Subject:Date:From;
	b=tAi96LJXCg+fKOs6D1B1q64Pr4G70CxNuWQUFaWA9A+WDqf4Gc6eAM0ZBvGatjXId
	 /Fi1Xe8/4Riq0LXduefg3SJpl59vwyHZyJgfUd+f+gyQkrSU0unGCXKTy8Ux6MaaVL
	 nVEwf9VC6Ww+wNNTk90YNVNIVLor7B5oLju+kPPo=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gfqN93F77zy0m;
	Tue, 16 Jun 2026 16:38:01 +0200 (CEST)
From: Philippe Schenker <dev@pschenker.ch>
To: netdev@vger.kernel.org
Cc: Philippe Schenker <philippe.schenker@impulsing.ch>,
	danishanwar@ti.com,
	rogerq@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Carlier <devnexen@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kevin Hao <haokexin@gmail.com>,
	Meghana Malladi <m-malladi@ti.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ethernet: ti: icssg: guard PA stat lookups
Date: Tue, 16 Jun 2026 16:35:34 +0200
Message-ID: <20260616143642.1972071-1-dev@pschenker.ch>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_073811_720656_48411F4F 
X-CRM114-Status: GOOD (  11.20  )
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

From: Philippe Schenker <philippe.schenker@impulsing.ch>

icssg_ndo_get_stats64() unconditionally calls emac_get_stat_by_name()
with FW PA stat names regardless of whether the PA stats block is
present on the hardware.  emac_get_stat_by_name() already guards the
PA stats lookup with `if (emac->prueth->pa_stats)`; when that pointer
is NULL the lookup falls through to netdev_err() and returns -EINVAL.
Because ndo_get_stats64 is polled regularly by the networking stack
this produces thousands of log entries of the form:

  icssg-prueth icssg1-eth end0: Invalid stats FW_RX_ERROR

A secondary consequence is that the int(-EINVAL) return value is
implicitly widened to a near-ULLONG_MAX unsigned value when accumulated
into the __u64 fields of rtnl_link_stats64, silently corrupting the
rx_errors, rx_dropped and tx_dropped counters reported by `ip -s link`.

Every other PA-aware code path in the driver is already guarded with
the same `if (emac->prueth->pa_stats)` check.  Apply the same guard
here.

Fixes: 0d15a26b247d ("net: ti: icssg-prueth: Add ICSSG FW Stats")

Signed-off-by: Philippe Schenker <philippe.schenker@impulsing.ch>

Cc: danishanwar@ti.com
Cc: rogerq@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
---

 drivers/net/ethernet/ti/icssg/icssg_common.c | 48 +++++++++++---------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index a28a608f9bf4..2dbb8f717de0 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -1628,28 +1628,34 @@ void icssg_ndo_get_stats64(struct net_device *ndev,
 	stats->rx_over_errors = emac_get_stat_by_name(emac, "rx_over_errors");
 	stats->multicast      = emac_get_stat_by_name(emac, "rx_multicast_frames");
 
-	stats->rx_errors  = ndev->stats.rx_errors +
-			    emac_get_stat_by_name(emac, "FW_RX_ERROR") +
-			    emac_get_stat_by_name(emac, "FW_RX_EOF_SHORT_FRMERR") +
-			    emac_get_stat_by_name(emac, "FW_RX_B0_DROP_EARLY_EOF") +
-			    emac_get_stat_by_name(emac, "FW_RX_EXP_FRAG_Q_DROP") +
-			    emac_get_stat_by_name(emac, "FW_RX_FIFO_OVERRUN");
-	stats->rx_dropped = ndev->stats.rx_dropped +
-			    emac_get_stat_by_name(emac, "FW_DROPPED_PKT") +
-			    emac_get_stat_by_name(emac, "FW_INF_PORT_DISABLED") +
-			    emac_get_stat_by_name(emac, "FW_INF_SAV") +
-			    emac_get_stat_by_name(emac, "FW_INF_SA_DL") +
-			    emac_get_stat_by_name(emac, "FW_INF_PORT_BLOCKED") +
-			    emac_get_stat_by_name(emac, "FW_INF_DROP_TAGGED") +
-			    emac_get_stat_by_name(emac, "FW_INF_DROP_PRIOTAGGED") +
-			    emac_get_stat_by_name(emac, "FW_INF_DROP_NOTAG") +
-			    emac_get_stat_by_name(emac, "FW_INF_DROP_NOTMEMBER");
+	stats->rx_errors  = ndev->stats.rx_errors;
+	stats->rx_dropped = ndev->stats.rx_dropped;
 	stats->tx_errors  = ndev->stats.tx_errors;
-	stats->tx_dropped = ndev->stats.tx_dropped +
-			    emac_get_stat_by_name(emac, "FW_RTU_PKT_DROP") +
-			    emac_get_stat_by_name(emac, "FW_TX_DROPPED_PACKET") +
-			    emac_get_stat_by_name(emac, "FW_TX_TS_DROPPED_PACKET") +
-			    emac_get_stat_by_name(emac, "FW_TX_JUMBO_FRM_CUTOFF");
+	stats->tx_dropped = ndev->stats.tx_dropped;
+
+	if (emac->prueth->pa_stats) {
+		stats->rx_errors  +=
+				emac_get_stat_by_name(emac, "FW_RX_ERROR") +
+				emac_get_stat_by_name(emac, "FW_RX_EOF_SHORT_FRMERR") +
+				emac_get_stat_by_name(emac, "FW_RX_B0_DROP_EARLY_EOF") +
+				emac_get_stat_by_name(emac, "FW_RX_EXP_FRAG_Q_DROP") +
+				emac_get_stat_by_name(emac, "FW_RX_FIFO_OVERRUN");
+		stats->rx_dropped +=
+				emac_get_stat_by_name(emac, "FW_DROPPED_PKT") +
+				emac_get_stat_by_name(emac, "FW_INF_PORT_DISABLED") +
+				emac_get_stat_by_name(emac, "FW_INF_SAV") +
+				emac_get_stat_by_name(emac, "FW_INF_SA_DL") +
+				emac_get_stat_by_name(emac, "FW_INF_PORT_BLOCKED") +
+				emac_get_stat_by_name(emac, "FW_INF_DROP_TAGGED") +
+				emac_get_stat_by_name(emac, "FW_INF_DROP_PRIOTAGGED") +
+				emac_get_stat_by_name(emac, "FW_INF_DROP_NOTAG") +
+				emac_get_stat_by_name(emac, "FW_INF_DROP_NOTMEMBER");
+		stats->tx_dropped +=
+				emac_get_stat_by_name(emac, "FW_RTU_PKT_DROP") +
+				emac_get_stat_by_name(emac, "FW_TX_DROPPED_PACKET") +
+				emac_get_stat_by_name(emac, "FW_TX_TS_DROPPED_PACKET") +
+				emac_get_stat_by_name(emac, "FW_TX_JUMBO_FRM_CUTOFF");
+	}
 }
 EXPORT_SYMBOL_GPL(icssg_ndo_get_stats64);
 
-- 
2.54.0

base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
branch: fix-icssg_common-pa-stats-errors__master-7-1

