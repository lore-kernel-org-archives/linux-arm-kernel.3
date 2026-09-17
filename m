Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B310DC982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0KczUTT4pZjvn6++/hJJmxB3shK0qpHFg6zLRVauhpc=; b=JYH5yih0INsLkCvfsHAxtiv19Y
	pzuWJhurywwbdhjhUtT/1nRBx3GIr30VpkYDRUBGfGtJiHGlj6H3IDV+2FZN24Uer7L9JaQ9pbQy6
	IMLXsPKmpcP9AWpSdJAiuheX9PglUc499cs9fN0rOiGst3ABLCi8h9EcBJ45zgap6YDigAK9N5TTi
	HgRerraR/LOhih/eAQm1reUGL7FjSlTjQf4q9xvGtlTBSXxyzJ3OcjKOduKTl8pxsLZYxwfwoZo06
	aWuxjHMy5d9f0xR2DrPZQ6nibBV1MNg83yDOuvZjgwUKdwP0OADx0zYTNjImw4Hz5ItaTXgToi3Nu
	PThUk35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BvX-0000000BNQG-0e6U;
	Thu, 17 Sep 2026 13:13:23 +0000
Received: from m16.mail.126.com ([220.197.31.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BvT-0000000BNPQ-3wZL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0K
	czUTT4pZjvn6++/hJJmxB3shK0qpHFg6zLRVauhpc=; b=QpfbabbTZkCwDzEnji
	P/YGDYIXN2PHrAgiAiifICcVq8iZQ9BQhbU62wexvvBsuAp19SfTzgsddgzyjcnU
	Plv5P7acDWSt/qMyUOXfn3FGFo7PU4qy1G+d/X+PHwbtLKIlZlNupp5WvWZR2x4p
	GbVMHykVRFKu6bV8TNr2m8SOo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgD3N1VF56tq0unFHw--.22915S2;
	Thu, 17 Sep 2026 21:12:39 +0800 (CST)
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
Subject: [PATCH net] net: stmmac: ethtool: validate TX coalesce before reprogramming RX
Date: Thu, 17 Sep 2026 21:12:35 +0800
Message-Id: <20260917131235.1360959-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PykvCgD3N1VF56tq0unFHw--.22915S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF4xXrW7XFW8uF1rtrWrZrb_yoW5XryDpr
	WkGFZavryDJr43Jw1DJw48uFy5t397tFZxX348J34fuF45GFyFqr1aqryrWFnFkrWxZrWa
	gr4qva4Dua98A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYzuZUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlQeQZ2qr50eIyQAA3F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_061320_365860_DFEF4D16 
X-CRM114-Status: GOOD (  14.68  )
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

__stmmac_set_coalesce() applies the RX part of the request first and
only afterwards checks the TX parameters. The RX path already calls
stmmac_rx_watchdog() and stores rx_riwt[] and rx_coal_frames[], so when
the TX check rejects the request the driver returns -EINVAL after having
silently changed the hardware. A following ethtool -c then reports the
new RX values even though the command failed.

This became easy to hit once the per-queue interface was added.
__stmmac_get_coalesce() reports tx-usecs and tx-frames as 0 for a queue
index that is RX-only, and ethtool applies per-queue coalesce by reading
the current values first and sending them straight back. The next set is
therefore guaranteed to trip the test for both TX fields being zero,
right after the RX watchdog has been reprogrammed.

Move both TX checks in front of the RX block so a request is either
applied completely or rejected without touching the device.

Fixes: db2f2842e6f5 ("net: stmmac: add per-queue TX & RX coalesce ethtool support")
Cc: stable@vger.kernel.org
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 154cc0c7623d..325db062f72a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -850,6 +850,19 @@ static int __stmmac_set_coalesce(struct net_device *dev,
 	else if (queue >= max_cnt)
 		return -EINVAL;
 
+	/* Check the TX parameters before anything is applied: the RX part
+	 * below already writes to the hardware, so rejecting the request
+	 * afterwards would leave the device with only half of the settings
+	 * the caller asked for while reporting a failure.
+	 */
+	if (ec->tx_coalesce_usecs == 0 &&
+	    ec->tx_max_coalesced_frames == 0)
+		return -EINVAL;
+
+	if (ec->tx_coalesce_usecs > STMMAC_MAX_COAL_TX_TICK ||
+	    ec->tx_max_coalesced_frames > STMMAC_TX_MAX_FRAMES)
+		return -EINVAL;
+
 	if (priv->use_riwt) {
 		rx_riwt = stmmac_usec2riwt(ec->rx_coalesce_usecs, priv);
 
@@ -875,14 +888,6 @@ static int __stmmac_set_coalesce(struct net_device *dev,
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
 
-- 
2.25.1


