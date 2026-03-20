Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C86310987B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFMbYLcQ88OLBsB+fu1da0z95QDjjdhj0Q3/2+x4dgQ=; b=JMStEAuGm2aVSiVYvkwkZVgTR8
	56hlAlRRqxk3sI3ZnWTj5BzFI5G/wEnoAVDLIQQUDqhgEUoMFT4PxHGUb/hEgot2C4uA1o88WzqIU
	IkfVlwIcyjxTY9ZBkA+KBIrSPGvDzv0kYez3SJuan1tuiTqIAG/o9XiPse3tCzMCfQrHp3STIc23r
	/+dg1Lm51xwS/Zalaa2uf2Skb3aCPIxZQv9LrzBab7tVusGC4niZA6q9PVNDUu9U4Mujbbxv+1QsR
	Df99J53qvV82HJXXfQBp460oSztxzFbJEAsVi8OBrG93Jbyv7Ke28T43zmKsX1UYdD53UNPpPBkVK
	lFVb6exA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0Q-0000000DBQL-38Z5;
	Fri, 20 Mar 2026 16:47:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0O-0000000DBOc-1Urz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aFMbYLcQ88OLBsB+fu1da0z95QDjjdhj0Q3/2+x4dgQ=; b=wPNEA45KAB8qFb0nJDQLWPYTc5
	ZrTF8jacEhT3/4fQCcECpP+bIlYDzSRgfYTJG6YnZm/sEJiWXoYpJZHtUIo9JlWGeMJVWRCoskEdQ
	9Ew4cLa/PtMtOahkL6R/+F2kd+HR7iKU7FKt228/Gf77f2Jjn3qMfzm6FOr/4u3GgSm1u28ccVUKz
	dfVUyJNO9sORQWrYbhr2BiTosoCbbbqhB1OSRZvQNv0TqyDDNerpjevnI+ja7mzyG943KcleCXba6
	84TpMNct+cgWixtwmzSaBus4Pqry46m6HsaGghpP3WncNtAI8LR/4QAVm36aZoNIqLRdZeH0OKUl/
	tw+vZO/g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36260 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w3d0H-000000006LT-40Ly;
	Fri, 20 Mar 2026 16:47:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w3d0H-0000000DfLp-0gIx;
	Fri, 20 Mar 2026 16:47:17 +0000
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
Subject: [PATCH net-next 2/6] net: stmmac: move first xmit descriptor SARC and
 TBS config
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w3d0H-0000000DfLp-0gIx@rmk-PC.armlinux.org.uk>
Date: Fri, 20 Mar 2026 16:47:17 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094724_421012_162C1CC2 
X-CRM114-Status: GOOD (  12.44  )
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

Move the first transmit descriptor's SARC and TBS configuration
alongside the code which populates the first descriptor, which helps
to keep all the code specific to that descriptor together.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0586ab13cc48..3d94f632fca6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4799,6 +4799,16 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 				       0, last_segment, skb->len);
 	}
 
+	if (priv->sarc_type)
+		stmmac_set_desc_sarc(priv, first_desc, priv->sarc_type);
+
+	if (tx_q->tbs & STMMAC_TBS_EN) {
+		struct timespec64 ts = ns_to_timespec64(skb->tstamp);
+
+		tbs_desc = &tx_q->dma_entx[first_entry];
+		stmmac_set_desc_tbs(priv, tbs_desc, ts.tv_sec, ts.tv_nsec);
+	}
+
 	for (i = 0; i < nfrags; i++) {
 		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
 		unsigned int frag_size = skb_frag_size(frag);
@@ -4885,16 +4895,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		u64_stats_inc(&txq_stats->q.tx_set_ic_bit);
 	u64_stats_update_end(&txq_stats->q_syncp);
 
-	if (priv->sarc_type)
-		stmmac_set_desc_sarc(priv, first_desc, priv->sarc_type);
-
-	if (tx_q->tbs & STMMAC_TBS_EN) {
-		struct timespec64 ts = ns_to_timespec64(skb->tstamp);
-
-		tbs_desc = &tx_q->dma_entx[first_entry];
-		stmmac_set_desc_tbs(priv, tbs_desc, ts.tv_sec, ts.tv_nsec);
-	}
-
 	/* Set the OWN bit on the first descriptor now that all descriptors
 	 * for this skb are populated.
 	 */
-- 
2.47.3


