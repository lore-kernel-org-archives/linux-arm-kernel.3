Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDF1C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vFmSZbAWC85Uxj60g6mfKifSqB/Ze4xlZ9NaFEvvdM=; b=xnKjvAcWMX3laHCs7ZpVj01C8r
	ngikFXhEsQPLPkvUHnNbdhA/PbROPegxBD12nXM7pFAhuBTN/43V4MfkN2EJhHaoiQ0bA5JmuxZMG
	UhxgMW8pMUf1Ylr2NTnuB6wmA75QD/yZ3y5uppJ/nwd/3Obm8U6ss6i7MPv0q2LS2jjsPmOHtH1GO
	IqFBaiTclSJa7wWdHgwpRiKnVh00rnXPSDcjZUVBWipxrf9MmNU8BG/pGjlIJgznkFeYz/4p60w8p
	iHj3Fr0X4bC6GPgF9xVxUEc1CG5Zc3/fsuxDURgO6hJZmsC6RR3SuemwF80iW0/xhlIk4vAwtX8vn
	FNaWxMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFMU-0000000AE4H-0kJl;
	Tue, 21 Jul 2026 18:38:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFMS-0000000AE3V-0s6Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 18:38:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 72CB760A71;
	Tue, 21 Jul 2026 18:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8C81F00A3F;
	Tue, 21 Jul 2026 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784659115;
	bh=2vFmSZbAWC85Uxj60g6mfKifSqB/Ze4xlZ9NaFEvvdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i0RDhR/Q6wszNYwD5gYU9ZKnd49Z09CGuJBDHqc+DfdPLNZ6Zw3xVf1J2sWT9xzWM
	 FO5MXtgJdAlZBnk1YHkYrac7lJ8Go7eDe5XgBAMNC4bvg0/Q0o/tkMWGhI16z9TfRC
	 eC1libn4yHyiu2dxfrkd4nxYMBNNeQHi1Eqh6lqw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Philippe Schenker <philippe.schenker@impulsing.ch>,
	Simon Horman <horms@kernel.org>,
	danishanwar@ti.com,
	rogerq@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 6.18 1400/1611] net: ethernet: ti: icssg: guard PA stat lookups
Date: Tue, 21 Jul 2026 17:25:16 +0200
Message-ID: <20260721152546.933367723@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721152514.750365251@linuxfoundation.org>
References: <20260721152514.750365251@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

6.18-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Philippe Schenker <philippe.schenker@impulsing.ch>

commit 27b9daba50609335db6ca81e4cccf50ded21ec76 upstream.

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
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Cc: danishanwar@ti.com
Cc: rogerq@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Link: https://patch.msgid.link/20260618093037.3448858-1-dev@pschenker.ch
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c |   49 +++++++++++++++------------
 1 file changed, 28 insertions(+), 21 deletions(-)

--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -1315,28 +1315,35 @@ void icssg_ndo_get_stats64(struct net_de
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
+	if (!emac->prueth->pa_stats)
+		return;
+
+	stats->rx_errors  +=
+			emac_get_stat_by_name(emac, "FW_RX_ERROR") +
+			emac_get_stat_by_name(emac, "FW_RX_EOF_SHORT_FRMERR") +
+			emac_get_stat_by_name(emac, "FW_RX_B0_DROP_EARLY_EOF") +
+			emac_get_stat_by_name(emac, "FW_RX_EXP_FRAG_Q_DROP") +
+			emac_get_stat_by_name(emac, "FW_RX_FIFO_OVERRUN");
+	stats->rx_dropped +=
+			emac_get_stat_by_name(emac, "FW_DROPPED_PKT") +
+			emac_get_stat_by_name(emac, "FW_INF_PORT_DISABLED") +
+			emac_get_stat_by_name(emac, "FW_INF_SAV") +
+			emac_get_stat_by_name(emac, "FW_INF_SA_DL") +
+			emac_get_stat_by_name(emac, "FW_INF_PORT_BLOCKED") +
+			emac_get_stat_by_name(emac, "FW_INF_DROP_TAGGED") +
+			emac_get_stat_by_name(emac, "FW_INF_DROP_PRIOTAGGED") +
+			emac_get_stat_by_name(emac, "FW_INF_DROP_NOTAG") +
+			emac_get_stat_by_name(emac, "FW_INF_DROP_NOTMEMBER");
+	stats->tx_dropped +=
+			emac_get_stat_by_name(emac, "FW_RTU_PKT_DROP") +
+			emac_get_stat_by_name(emac, "FW_TX_DROPPED_PACKET") +
+			emac_get_stat_by_name(emac, "FW_TX_TS_DROPPED_PACKET") +
+			emac_get_stat_by_name(emac, "FW_TX_JUMBO_FRM_CUTOFF");
 }
 EXPORT_SYMBOL_GPL(icssg_ndo_get_stats64);
 



