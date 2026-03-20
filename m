Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4266E10987B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trtMh5tpUVzbQlNs5rAVXgjGUuISvp2FaLD2tKfE614=; b=nbr5GlqwakW62j+kHCJ5Q+jOwJ
	Oqwr5Am5QqDqErS+HYpGKAfKBlxSPCdW2x3vjbzxcVc+jrZe/M5kyouPa3ITnnPf9l9uxbXLZBwfZ
	0e488nB40oojJJU3fNe/CrbKNz6RT054acLNWMTNIXCstOn6OUAv0ME3hDfrObAtagfCdsPr8hPzV
	oijbYgFdk8idvL8PWj8oBCXDD0DegonWNLo9+xgzTK18/jwFrcAr5LwdHG2HOlVZX7nkm/qVtFP8o
	T4PPcKhuPeM3SEpDjoBDcOcvzlcAy3lqshHpmFDTsp6UzIIIQSHnbXzT/oodZxnWeTXrkXZwBNfP1
	kwvIc+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d12-0000000DBv3-2qMe;
	Fri, 20 Mar 2026 16:48:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0j-0000000DBcM-3qiF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=trtMh5tpUVzbQlNs5rAVXgjGUuISvp2FaLD2tKfE614=; b=X9IYAb1l3DHtrfU6q4Jf5Mccm+
	hUl50bp/AsB7tCOcikmul3bsRgwghUIrFrI3i5H0qcqWYwfpucvfgZ2SKe9XHkvNjOIAO/kllypUp
	W/vTcueRs3rm8XRc+h96OuPMmBthxzYQDwKYhnenb6gIxAsAzouV0ys9/6nDnkP34kwaBYtnuGH83
	5DX1HreGTnn/E4WN9rNdKft3TiOG+7/xI8fNAEgyJWmoXCNvNbMohPiJDKteumvvEyJI5mH4mlH1x
	ZkwOhizsLX7WzEOa3DOiNCgjzvd2yQqoGJ/k8VyzedCVnAuKs+wjlxFw/DgDbB7UjrEaSO0fRgEaq
	5Jk3q5bg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34184 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w3d0d-000000006Mh-0qBS;
	Fri, 20 Mar 2026 16:47:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w3d0b-0000000DfMD-2hrD;
	Fri, 20 Mar 2026 16:47:37 +0000
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
Subject: [PATCH net-next 6/6] net: stmmac: elminate tbs_desc in stmmac_xmit()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w3d0b-0000000DfMD-2hrD@rmk-PC.armlinux.org.uk>
Date: Fri, 20 Mar 2026 16:47:37 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094745_959282_F3EE37E3 
X-CRM114-Status: GOOD (  10.72  )
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

There is no need to have a local variable for tbs_desc, we can do the
conversion when calling stmmac_set_desc_tbs().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a733249c3f9b..c01a10e982b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4685,7 +4685,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	int gso = skb_shinfo(skb)->gso_type;
 	struct stmmac_txq_stats *txq_stats;
 	struct dma_desc *desc, *first_desc;
-	struct dma_edesc *tbs_desc = NULL;
 	struct stmmac_tx_queue *tx_q;
 	int i, csum_insertion = 0;
 	int entry, first_tx;
@@ -4809,8 +4808,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (tx_q->tbs & STMMAC_TBS_EN) {
 		struct timespec64 ts = ns_to_timespec64(skb->tstamp);
 
-		tbs_desc = dma_desc_to_edesc(first_desc);
-		stmmac_set_desc_tbs(priv, tbs_desc, ts.tv_sec, ts.tv_nsec);
+		stmmac_set_desc_tbs(priv, dma_desc_to_edesc(first_desc),
+				    ts.tv_sec, ts.tv_nsec);
 	}
 
 	for (i = 0; i < nfrags; i++) {
-- 
2.47.3


