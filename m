Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C325FC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 02:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+v6Ogc6DkBmfW9b1qTeS9HFa7GSrGEaaQ+ja18fLYqY=; b=PXds3Kl4nWDz7AfaskBKpV1DEe
	EVwen8tSmDHgE92NRdHOss4KeTbH0p+6PJBI9w+9z40FyNMn2FjOdl36xlwPDmRZR53hRJiQSpagd
	Tx4+UVyqrAJ1494jWYHYICHQhcIzhvalS8X4YQ6mchd4iLq/UhtNiLonluRgkUv9QD7/noJYrbM1J
	kz4wd5NzhyEzkEQsUXVi9vN0uhsR99JoDmeZNlcYst2JJnHk9KcEEE2tT8DDlXSReHm8DM9xbWSuW
	oRIXtU72bxERtxog3R1zfJtmQDsMhk/+DAqpM90qhfFH3E4aeydnNmaLa7OWpkk9u+NKAPeQVfZv3
	4dNacN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x86rt-0000000GkUy-1yOJ;
	Sun, 20 Sep 2026 02:01:25 +0000
Received: from mail-proxy49144.mail.163.com ([45.254.49.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x86rq-0000000GkUa-1HSw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 02:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+v
	6Ogc6DkBmfW9b1qTeS9HFa7GSrGEaaQ+ja18fLYqY=; b=nftXmSBUbsQJP8qUu0
	oq37b/Dpis8u4uo2xudKpK4XhffAim0/Kk3uY9a1xP1wpKsuoX1a/tAdoTzO1tdm
	zP9R31lLUdT5VifsnozTqp8dX1RZvejJlFkvawQQ4CW+opB5SS9KRfh6UT+f2cIy
	kNO3TNNMJfv5SIy9wVz4GpZuI=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgD3P_5hPa9qPX6OAA--.56399S2;
	Sun, 20 Sep 2026 09:56:50 +0800 (CST)
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
Subject: [PATCH net v2] net: stmmac: ethtool: validate TX coalesce before reprogramming RX
Date: Sun, 20 Sep 2026 09:56:47 +0800
Message-Id: <20260920015647.1783574-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCkvCgD3P_5hPa9qPX6OAA--.56399S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF4xXrW7XFW8uF1rtrWrZrb_yoW5GF4Dp3
	yrGFZavryDtr43Jw1kJw48WFy5t397tFZxXw18Jasa9F4rGFWYqr1aqryrWFnFkrWxZrW3
	Kr4qv39rua98A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYzuZUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlALtxGqvPWKglAAA3R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_190122_541944_BD1E5336 
X-CRM114-Status: GOOD (  12.74  )
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
v2:
- Trim the comment in front of the TX checks to one line; the reasoning
  belongs in the changelog. (Andrew Lunn)

 .../ethernet/stmicro/stmmac/stmmac_ethtool.c   | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 154cc0c7623d..e06d05c3b4c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -850,6 +850,16 @@ static int __stmmac_set_coalesce(struct net_device *dev,
 	else if (queue >= max_cnt)
 		return -EINVAL;
 
+	/* Check TX parameters before applying any RX setting */
+
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
 
@@ -875,14 +885,6 @@ static int __stmmac_set_coalesce(struct net_device *dev,
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


