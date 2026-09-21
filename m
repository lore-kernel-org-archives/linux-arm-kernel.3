Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2A1C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EzyjvcjHnU8bsyuDFh4e4QIqzX8lLzZewGB28BdVIsQ=; b=CY2TtJD/kzJ7w0N1X/xFIJCuJv
	fwTt51wZjoYnDcF28WOs+bpBUS1UdZKXFQ/YWgjqaafqi5meRD97AxObi4inEIG38gDB1PheWNfBr
	A3TOzQHBzXoAgV22icqznZy/taPImOX6rEblw3Q3uUyiXhBGPCDZKuFHavKI6D0gyv2Rhaq1LnWlj
	8xxsMXpIr2mHehkoIgxI+xHkvFiK2EMekE3B/wTvwl1MWuuLv8g5WPtU/uxQKeB0zIpgcRapw+QMf
	kmz+z3iFVVFMzicOE/63/D15I/Plk35eKJXy5OPJzpgY8yMFbvm1197bp/8dce7SRq3eMOb9R2eWJ
	Mpgy+Uug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eXI-00000002JQ7-27rW;
	Mon, 21 Sep 2026 13:58:24 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eX7-00000002JNm-0LRS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 13:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ez
	yjvcjHnU8bsyuDFh4e4QIqzX8lLzZewGB28BdVIsQ=; b=ZJ4A9DHyVWeOVgvWbX
	SQ9fRseiZitjjvZsJRy0vgOPvPYK4I4A2fSw7+Isykg0xhImtaQWk6orSkYK66wu
	PxNG9vEiBNQoqNSf6yBUF3YXTamAJDNvhfhfcrFh5fkANSSVg0y197cqefnaoe+Y
	WmsS7GG7L1lk796eI84fvtd94=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD33wG+N7FqH9M7Bw--.62914S2;
	Mon, 21 Sep 2026 21:57:18 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH net v3 1/2] net: stmmac: ethtool: ignore inapplicable per-queue coalesce fields
Date: Mon, 21 Sep 2026 21:57:15 +0800
Message-Id: <20260921135716.218420-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD33wG+N7FqH9M7Bw--.62914S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4DtFyxZF4Dury7Kry5twb_yoW7Jw47p3
	yUCFZavw1kJrW2yw1kAF40kFy5trs3tFZ7XFyxt34Fka1fCry5Xry5tryUKFnFkrWkZrWY
	gFWjq39ru398XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UnmRUUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqR8E2mqxN7-cjgAA3p
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_065815_149637_AA76A79F 
X-CRM114-Status: GOOD (  17.71  )
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

From: Linkui Xiao <xiaolinkui@kylinos.cn>

rx_queues_to_use and tx_queues_to_use are independent: dwmac-intel uses
6 RX and 4 TX channels on TGL and EHL, and snps,rx-queues-to-use and
snps,tx-queues-to-use are parsed separately, so a queue index can exist
in one direction only. include/linux/ethtool.h documents the parameters
of the missing side as inapplicable and asks set_per_queue_coalesce() to
ignore them, but __stmmac_set_coalesce() validates both directions for
every index while __stmmac_get_coalesce() reports the inapplicable ones
as zero.

ethtool implements --per-queue by reading the current settings of every
queue in the mask and sending them back with only the requested fields
overwritten, so the zeroed fields are fed straight back into the setter:

  - on an RX-only index the test for both TX fields being zero rejects
    the request, so per-queue RX coalescing cannot be changed at all;
  - on a TX-only index rx_coalesce_usecs is zero, stmmac_usec2riwt()
    returns zero and the MIN_DMA_RIWT test rejects the request, so
    per-queue TX coalescing cannot be changed at all.

On an RX-only index the TX test rejects the request after the RX block
has already called stmmac_rx_watchdog() and stored rx_riwt[] and
rx_coal_frames[], so the driver reports -EINVAL with the hardware half
reprogrammed.  The roll-back that ethtool_set_per_queue_coalesce() runs
for the queues it has already changed then trips over the same test and
cannot restore them.  On a TX-only index the rx_riwt range check fails
before anything is written, but the request is still rejected and the
TX settings are never stored.

Validate and apply only the side that the queue index actually has, and
move the TX checks in front of the RX block so that a request is either
applied completely or rejected without touching the device.

Fixes: db2f2842e6f5 ("net: stmmac: add per-queue TX & RX coalesce ethtool support")
Cc: stable@vger.kernel.org
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
Changes in v2:
- Trim the comment in front of the TX checks to one line; the reasoning
  belongs in the changelog. (Andrew Lunn)
- Link: https://lore.kernel.org/all/20260920015647.1783574-1-xiaolinkui@126.com/

Changes in v3:
- Only run the TX checks when the index carries a TX ring, and the rx_riwt
  range check only when it carries an RX ring. Moving the checks alone
  rejected per-queue RX coalescing on an RX-only index and broke the
  ethtool core rollback for it. (Sashiko review)
- Reword the subject and changelog to describe the direction-aware
  validation.

 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 35 +++++++++++++------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 154cc0c7623d..fed648a9f784 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -837,6 +837,8 @@ static int __stmmac_set_coalesce(struct net_device *dev,
 	struct stmmac_priv *priv = netdev_priv(dev);
 	bool all_queues = false;
 	unsigned int rx_riwt;
+	bool has_rx;
+	bool has_tx;
 	u32 max_cnt;
 	u32 rx_cnt;
 	u32 tx_cnt;
@@ -850,7 +852,20 @@ static int __stmmac_set_coalesce(struct net_device *dev,
 	else if (queue >= max_cnt)
 		return -EINVAL;
 
-	if (priv->use_riwt) {
+	has_rx = all_queues || queue < rx_cnt;
+	has_tx = all_queues || queue < tx_cnt;
+
+	/* An index can be RX-only or TX-only; ignore the missing side. */
+	if (has_tx &&
+	    ec->tx_coalesce_usecs == 0 && ec->tx_max_coalesced_frames == 0)
+		return -EINVAL;
+
+	if (has_tx &&
+	    (ec->tx_coalesce_usecs > STMMAC_MAX_COAL_TX_TICK ||
+	     ec->tx_max_coalesced_frames > STMMAC_TX_MAX_FRAMES))
+		return -EINVAL;
+
+	if (has_rx && priv->use_riwt) {
 		rx_riwt = stmmac_usec2riwt(ec->rx_coalesce_usecs, priv);
 
 		if ((rx_riwt > MAX_DMA_RIWT) || (rx_riwt < MIN_DMA_RIWT))
@@ -866,7 +881,7 @@ static int __stmmac_set_coalesce(struct net_device *dev,
 				priv->rx_coal_frames[i] =
 					ec->rx_max_coalesced_frames;
 			}
-		} else if (queue < rx_cnt) {
+		} else {
 			priv->rx_riwt[queue] = rx_riwt;
 			stmmac_rx_watchdog(priv, priv->ioaddr,
 					   rx_riwt, queue);
@@ -875,14 +890,6 @@ static int __stmmac_set_coalesce(struct net_device *dev,
 		}
 	}
 
-	if ((ec->tx_coalesce_usecs == 0) &&
-	    (ec->tx_max_coalesced_frames == 0))
-		return -EINVAL;
-
-	if ((ec->tx_coalesce_usecs > STMMAC_MAX_COAL_TX_TICK) ||
-	    (ec->tx_max_coalesced_frames > STMMAC_TX_MAX_FRAMES))
-		return -EINVAL;
-
 	if (all_queues) {
 		int i;
 
@@ -892,7 +899,7 @@ static int __stmmac_set_coalesce(struct net_device *dev,
 			priv->tx_coal_timer[i] =
 				ec->tx_coalesce_usecs;
 		}
-	} else if (queue < tx_cnt) {
+	} else if (has_tx) {
 		priv->tx_coal_frames[queue] =
 			ec->tx_max_coalesced_frames;
 		priv->tx_coal_timer[queue] =
-- 
2.25.1


