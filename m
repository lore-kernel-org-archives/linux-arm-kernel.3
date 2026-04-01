Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E85D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5d+H2rXx1nuwhXiwShueydgaYgP8xz5FGnuXucGTjWc=; b=YMbEtpoHF2YoXfm90Z1OXuVEKF
	PODEccoPMOuUOFAj7ZAQu7yNLObTGQi15qy8PSPdypaHF5t99EOlzXDkIXeEGaVIZnfiN5zwpaGOW
	42o9GvM7HtG01vzxfHGAVWyvtwQq93nlIwnrD2PimcUfLXQKyzRWTReTo+Fl7d0WcV1PaAKhrVLiq
	VaaKemGeKxIe/d/AqEu/gldwipz3Sed8AgcDqHue05kr+kVp+oHwhyXSqGwZQEpB6g0RXgXwMFhX+
	s76G5wbZnmP08yLsuMhTbfoVe/Gbyty5IbRsQ4JkuJbddfvBdJV181s91qpwUfZXOm32EWDRZYyfw
	iVFvPEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptE-0000000EC9h-3PYK;
	Wed, 01 Apr 2026 07:21:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptB-0000000EC8P-2Ci0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5d+H2rXx1nuwhXiwShueydgaYgP8xz5FGnuXucGTjWc=; b=LL7CK2b9z5VgF+YxGgsY226KOw
	XnQah7NwA6TxACg/Y8SQzXuOeV4yp/ylUO8DgH3kEiW0pPI7XG8bP1Do7LM9NCaeTFA+1C47+itmW
	0RT6sVjlrmzxJKpYyCf8463bycYWBLIPb+eDUhLfOBciVadH9MF3jxkS6bl+OHHP1oMwWiEC/XX09
	nTXZ/tgSvdw9P4sl1ccKw47yU2ACSSdzyeSbdnpfk8czIzvjcHzkzXzWhENtsRvQge7K2gazrJHIE
	/T6Im96gMVndcIl7ufsKSFfdbh3NVb2XsUl/O40Ga2OjeEPiWgS6eW4aUuPwT09RLt9P7Tv+2u83J
	fRxjN0TA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56388 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7pt4-000000002fW-4BaQ;
	Wed, 01 Apr 2026 08:21:15 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7pt4-0000000Easn-14WL;
	Wed, 01 Apr 2026 08:21:14 +0100
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
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
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 01/14] net: stmmac: fix channel TSO enable on
 resume
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7pt4-0000000Easn-14WL@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:14 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002122_169968_6BC6C280 
X-CRM114-Status: GOOD (  14.27  )
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

Rather than configuring the channels depending on whether GSO/TSO is
currently enabled by the user, always enable if the hardware has TSO
support and the platform wants TSO to be enabled.

This avoids the channel TSO enable bit being disabled after a resume
when the user has disabled TSO features. This will cause problems when
the user re-enables TSO.

This bug goes back to commit f748be531d70 ("stmmac: support new GMAC4")

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ce51b9c22129..cd76f62e1b6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3705,7 +3705,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	stmmac_set_rings_length(priv);
 
 	/* Enable TSO */
-	if (priv->tso) {
+	if (priv->dma_cap.tsoen && priv->plat->flags & STMMAC_FLAG_TSO_EN) {
 		for (chan = 0; chan < tx_cnt; chan++) {
 			struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[chan];
 
-- 
2.47.3


