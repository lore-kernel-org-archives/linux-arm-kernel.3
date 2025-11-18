Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C204CED267
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xmjMUUvq7h5ZfP5IKPwY8giY0PGq3yEuGIgZGyJhEg=; b=KqIort7TUm7thSx5Q0BdrYfAjR
	W6mHfRMYo9PAjRzAicPMhF7md7mBJhQljkJJoWF29YYTd2UBckduxqyqsVnK95iOLcu1g1XKy/PX2
	BKzKvhit6XxlxNoFQXQI+NAlvbj4tvtNNXPy9qk0paystwq0dA1V3BtLQjQ8TQJbBK2rczMRt7gsj
	GL4jt5PEocxofeyfjpQzG2V+qNgpBtNukbmGteVxww/dx8EkGlmMtaVBJdohkh7hVSx1HJysskbDJ
	nwTfg2844cZzDuNRu3TSz/vYeUM7qW0w5c2Gg0/oCPNWj22+hFmetlwIQLsISRPCiqbQiNZuWtueE
	DGNUMXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIWg-00000000Cd0-1GdC;
	Tue, 18 Nov 2025 10:01:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIWc-00000000CaE-2cKM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3xmjMUUvq7h5ZfP5IKPwY8giY0PGq3yEuGIgZGyJhEg=; b=hJSUJUJ7Ojqo8dvGWetwdk7que
	tIGSqMPX3advWES945ykHI2DO5v85FlqDLjcJLx6lWUmUbb0p1lipRfyDJKBAB6OdZPNiXwuto32a
	ESAZtmOGTqG3p37+X9GMvj43w9qUlPNE3/OKzOqoJhN1q8dfqLfqeOPJVd8qr5bTUbRLCxdWdplrX
	yNttHyWEKbFw82rQsBuPk/qMiHsJ01GbJBZgjTPdZu+/V3smzH0/wqd9qM8DdRKf/Px0PLzVx4IHh
	zOJl/axL3nuEuMD6XlzomMtrkLHm5OXoPaTlIOcI9+IkVrOfv8YF58rzBvFfq9mKZ66ukdzM93O69
	ueA7a3MQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39174 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLIWX-00000000328-1HEy;
	Tue, 18 Nov 2025 10:01:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLIWW-0000000Ewkl-21Ia;
	Tue, 18 Nov 2025 10:01:20 +0000
In-Reply-To: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
References: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/2] net: stmmac: stmmac_is_jumbo_frm() returns
 boolean
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLIWW-0000000Ewkl-21Ia@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Nov 2025 10:01:20 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_020126_662724_2E8408FE 
X-CRM114-Status: GOOD (  14.72  )
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

stmmac_is_jumbo_frm() returns whether the driver considers the frame
size to be a jumbo frame, and thus returns 0/1 values. This is boolean,
so convert it to return a boolean and use false/true instead. Also
convert stmmac_xmit()'s is_jumbo to be bool, which causes several
variables to be repositioned to keep it in reverse Christmas-tree
order.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/chain_mode.c  | 9 ++++-----
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c   | 9 ++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 4 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index d14b56e5ed40..120a009c9992 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -83,14 +83,13 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	return entry;
 }
 
-static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
+static bool is_jumbo_frm(unsigned int len, bool enh_desc)
 {
-	unsigned int ret = 0;
+	bool ret = false;
 
 	if ((enh_desc && (len > BUF_SIZE_8KiB)) ||
-	    (!enh_desc && (len > BUF_SIZE_2KiB))) {
-		ret = 1;
-	}
+	    (!enh_desc && (len > BUF_SIZE_2KiB)))
+		ret = true;
 
 	return ret;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 4953e0fab547..f257ce4b6c66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -541,7 +541,7 @@ struct stmmac_rx_queue;
 struct stmmac_mode_ops {
 	void (*init) (void *des, dma_addr_t phy_addr, unsigned int size,
 		      unsigned int extend_desc);
-	unsigned int (*is_jumbo_frm)(unsigned int len, int ehn_desc);
+	bool (*is_jumbo_frm)(unsigned int len, bool enh_desc);
 	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 			 int csum);
 	int (*set_16kib_bfsize)(int mtu);
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index 039903c424df..382d94a3b972 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -91,14 +91,9 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	return entry;
 }
 
-static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
+static bool is_jumbo_frm(unsigned int len, bool enh_desc)
 {
-	unsigned int ret = 0;
-
-	if (len >= BUF_SIZE_4KiB)
-		ret = 1;
-
-	return ret;
+	return len >= BUF_SIZE_4KiB;
 }
 
 static void refill_desc3(struct stmmac_rx_queue *rx_q, struct dma_desc *p)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index db68c89316ec..12fc31c909c4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4579,18 +4579,18 @@ static bool stmmac_has_ip_ethertype(struct sk_buff *skb)
  */
 static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	unsigned int first_entry, tx_packets, enh_desc;
+	bool enh_desc, has_vlan, set_ic, is_jumbo = false;
 	struct stmmac_priv *priv = netdev_priv(dev);
 	unsigned int nopaged_len = skb_headlen(skb);
-	int i, csum_insertion = 0, is_jumbo = 0;
 	u32 queue = skb_get_queue_mapping(skb);
 	int nfrags = skb_shinfo(skb)->nr_frags;
+	unsigned int first_entry, tx_packets;
 	int gso = skb_shinfo(skb)->gso_type;
 	struct stmmac_txq_stats *txq_stats;
 	struct dma_edesc *tbs_desc = NULL;
 	struct dma_desc *desc, *first;
 	struct stmmac_tx_queue *tx_q;
-	bool has_vlan, set_ic;
+	int i, csum_insertion = 0;
 	int entry, first_tx;
 	dma_addr_t des;
 	u32 sdu_len;
-- 
2.47.3


