Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFB7EA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OujM+5YOGBG7Jz4/7Ztk/MF5TTjI8tB7z3D1VsAINX4=; b=L7plz2zIKfVwpHldpYZLXfblCj
	r102HwEyCrJxokd4AuiD6CrmuEuPYuCfygQA9X0al832cZ3v67OIbt/PS0g4R4RLgUojZYOxlQFYB
	cEmTntyJmmtPWTqTaMTYxMDZPljyjg/yeL1C7jqRhWmWygfR6uy9cN2ailPAkivI+QDikzOV6XvEy
	HRSMssg+Ipr5MT0iMCZjdewjS0SnSQK1xQIj9JERsRRH24LQe337hc3GKG8NQdyOqoNWjCsekOc/C
	ostm2nbNpeCFV25HeKYE6AmRsEC1jvq7oijPXLe+pg8CSS0SCunOwCbUS59aCNYANpkLZwxAZnc6M
	f/YV2UyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUK9-00000000CsV-27Tl;
	Mon, 23 Feb 2026 11:42:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUK7-00000000Cr2-0WZD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OujM+5YOGBG7Jz4/7Ztk/MF5TTjI8tB7z3D1VsAINX4=; b=SH+SziQryOR3JDUMp/37fhcp0X
	rJtg+4yYW9ihIMqrach944yT4WHO5ONxDps4Hhpahx1skVGB2E0jLnjmXJKQ7P38B/Em9AfLA1ytz
	UQot/ab2B0W8fJnqm+3ZSY1B5In9Pfbj7xTiBmausLbxJROg34TjPSe3KGzTkqJUPbyX638nypcxW
	e8Xb7tavhg2EuTVc9M+euDc4hS++z7CXHgfbbmd807WRQS43CrrZZ5D9Z67WwILAqMG4vArcmdkH0
	6YHvRskuOtVxNHRbDGdj9GW01vh3y5cPYgx39tUF6WgYVRHeyPD2gdn1jkEeioRfoUATKU6/r5xRL
	xXGyYrLQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54558 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuUK0-000000003zg-2igo;
	Mon, 23 Feb 2026 11:41:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuUJz-0000000AfEU-3KIy;
	Mon, 23 Feb 2026 11:41:51 +0000
In-Reply-To: <aZw86hpjQ-3w3xqJ@shell.armlinux.org.uk>
References: <aZw86hpjQ-3w3xqJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/2] net: stmmac: fix transmit interrupt coalescing
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuUJz-0000000AfEU-3KIy@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 11:41:51 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_034159_164474_9D6B5CF7 
X-CRM114-Status: GOOD (  12.99  )
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

The accounting for transmit frames does not count the descriptors
correctly. It uses:

	tx_packets = (tx_q->cur_tx + 1) - first_tx;

however, these are indexes into a circular buffer, so cur_tx can be
less than first_tx, and when that happens, tx_packets becomes a very
large unsigned integer. When this is added to tx_q->tx_count_frames,
it has the effect of reducing the count of frames, possibly causing
it to also wrap to a very large unsigned integer.

Fix this by using CIRC_CNT() to calculate the number of descriptors
used.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3277aecc5454..baf2ff577f45 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4503,7 +4503,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
 
 	/* Manage tx mitigation */
-	tx_packets = (tx_q->cur_tx + 1) - first_tx;
+	tx_packets = CIRC_CNT(tx_q->cur_tx + 1, first_tx,
+			      priv->dma_conf.dma_tx_size);
 	tx_q->tx_count_frames += tx_packets;
 
 	if ((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) && priv->hwts_tx_en)
@@ -4562,7 +4563,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* If we only have one entry used, then the first entry is the last
 	 * segment.
 	 */
-	is_last_segment = CIRC_CNT(tx_q->cur_tx, first_entry,,
+	is_last_segment = CIRC_CNT(tx_q->cur_tx, first_entry,
 				   priv->dma_conf.dma_tx_size) == 1;
 
 	/* Complete the first descriptor before granting the DMA */
@@ -4781,7 +4782,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * This approach takes care about the fragments: desc is the first
 	 * element in case of no SG.
 	 */
-	tx_packets = (entry + 1) - first_tx;
+	tx_packets = CIRC_CNT(entry + 1, first_tx, priv->dma_conf.dma_tx_size);
 	tx_q->tx_count_frames += tx_packets;
 
 	if ((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) && priv->hwts_tx_en)
-- 
2.47.3


