Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BB910987A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77qBooPHVxdAB3nzVkpVFiDsWi/YaVfDJ7kiuL9ABMc=; b=KGNqqaQXLeJ3LpNi3nOR35fZHJ
	p8WUWfoNgng/7v/OmFTX1DkYI96S/lHC5K2wAEP3XD4pfB49B5E4LioBKh88vb2MpuDyumt61+RJ7
	xkTXJQMj5eo8t06M8YSGqntyyp9oANtTeITu3geekKckkV26otVA0P3kdlrjRZfBd2LYhIHVcr/Yb
	KRhp4bJjeV2X5tut3c2Ynv/SXUWtttutTZjPwZCWW0xwlxmRIvn1XiPnHU9pH8j0Eo2MnA1qoH+Zg
	DJhCXi3R+W7w+sK9UUam/LmvIv683z+jB+FyGFjTcQucdjTeplAGU0xgDQehtjDEENcZS7HpX0JaS
	JLQcqJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0W-0000000DBSX-0DQb;
	Fri, 20 Mar 2026 16:47:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0R-0000000DBQK-4BLG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=77qBooPHVxdAB3nzVkpVFiDsWi/YaVfDJ7kiuL9ABMc=; b=qD9K7P4SzvWc3gu0tzMB7VTkua
	MnBjliKqdpdZD7F/EPIxDiIDVHZkTHRd0c0B93dkg8kysxH6fIUVbzIP0W2TRYTMCK9rebo1B9+T7
	egHx7JRSOtphauZRr67OuFrdnsDLtO0fH/l/mQKRoOhJpRGy84H+t+Tm3wcZIwI52lSYOsakQJ1KI
	qGooNedosxDN24j15h//bowMJJPo5kmA5vEauWRFrDezjq4rlC9b4LRCAcQKj1YfPyl0I1t5aedOq
	0AqOSwlO0h4b9lNLtnPXSLFWCbWfgiogFSpGhvkEDRkAS2qoW+Pr2s1gvZRLubf+QRMS6UZwFYAk0
	CwvvtrAA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34044 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w3d0N-000000006Lg-0NJp;
	Fri, 20 Mar 2026 16:47:23 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w3d0M-0000000DfLv-1C6S;
	Fri, 20 Mar 2026 16:47:22 +0000
In-Reply-To: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
References: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 3/6] net: stmmac: move stmmac_xmit() first entry
 index code
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w3d0M-0000000DfLv-1C6S@rmk-PC.armlinux.org.uk>
Date: Fri, 20 Mar 2026 16:47:22 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094728_045101_8B79C5B8 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

The handling of the first descriptor index/pointer is split around
the checksum handling which makes no sense. Group this code together.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3d94f632fca6..d5e28ecf9fb4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4735,10 +4735,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Check if VLAN can be inserted by HW */
 	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
 
-	entry = tx_q->cur_tx;
-	first_entry = entry;
-	WARN_ON(tx_q->tx_skbuff[first_entry]);
-
 	csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
 	/* DWMAC IPs can be synthesized to support tx coe only for a few tx
 	 * queues. In that case, checksum offloading for those queues that don't
@@ -4755,6 +4751,10 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		csum_insertion = !csum_insertion;
 	}
 
+	entry = tx_q->cur_tx;
+	first_entry = entry;
+	WARN_ON(tx_q->tx_skbuff[first_entry]);
+
 	desc = stmmac_get_tx_desc(priv, tx_q, entry);
 	first_desc = desc;
 
-- 
2.47.3


