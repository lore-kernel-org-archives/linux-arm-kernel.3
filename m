Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D92CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqLOBUY0xU3RN71ffCkfmJX1LRd55XNwi+h1nM0Q9Ps=; b=I+2V1v/PFwX+Z1rzFqPUPzhyOq
	lqwIk6o+sSf+YvcutjX/as1r2orzQAy2VlCi5FG7m/8017/IoNROwfuXuvoPGnAX+/df3Uz+d3OCQ
	BLiv8dzTbRLHh3JrTttZ6byRUzXJZtiiPGglgSg9Ejyoredd7jm+ggjH9pFZ7VJXRKfcB2AyYZcIE
	NOAaYaQMM3t22T6yC/xXO6sZ0zDnv54RPaUvLmyhT6ZPuo3in/3nefIqvyXMtkDpmMh+up/OU2ohN
	pwHqYsjbDP4H9aycnCv01Po1q+um0kC4gQIkyxLP44yuASIaxgfUQhtHQmZJXJ9qxcxokhNqiY6MS
	XDS21g3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v945m-00000002FLy-282V;
	Wed, 15 Oct 2025 16:11:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v945j-00000002FJK-2yDZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uqLOBUY0xU3RN71ffCkfmJX1LRd55XNwi+h1nM0Q9Ps=; b=awDYVu/9177C4j2gkxtgJtIgeK
	yiI0UZJ570OzDPY4bl2k1nEhy7+Oa6FFVznX4uC5U4g55kXg6NMWt3AklfN+mz1dzix2+Ol4yzChF
	IOix5BhyOK2a7QmKKwE6FvI6DA/eKSEjfWFLocZ56CQnupmB111bVc5PzUX2vv2PBxv0YgwC3BFb2
	USTUYWUKz9dWGLBm8WZVBRpzf6xDaG7d19xb9RukV9k8UhEzAnhzW0blKGMb/saL3b5wLkp2SJEpU
	0j8IR3htwwhR92S8nSOfIdbSzwrSRFhtDXa44/nF0TKlUB669pMhK/PiwEZn5LyqC0qBVPCcyATZX
	NRVdomjw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34182 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v945Z-000000005AZ-2lmk;
	Wed, 15 Oct 2025 17:10:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v945Y-0000000Ameb-2gDI;
	Wed, 15 Oct 2025 17:10:56 +0100
In-Reply-To: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 4/5] net: stmmac: rearrange tc_init()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v945Y-0000000Ameb-2gDI@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 17:10:56 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_091107_751510_F4B4D52A 
X-CRM114-Status: GOOD (  10.54  )
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

To make future changes easier, rearrange the use of dma_cap->l3l4fnum
vs priv->flow_entries_max.

Always initialise priv->flow_entries_max from dma_cap->l3l4fnum, then
use priv->flow_entries_max to determine whether we allocate
priv->flow_entries and set it up.

This change is safe because tc_init() is only called once from
stmmac_dvr_probe().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 97e89a604abd..ef65cf511f3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -262,10 +262,10 @@ static int tc_init(struct stmmac_priv *priv)
 	unsigned int count;
 	int ret, i;
 
-	if (dma_cap->l3l4fnum) {
-		priv->flow_entries_max = dma_cap->l3l4fnum;
+	priv->flow_entries_max = dma_cap->l3l4fnum;
+	if (priv->flow_entries_max) {
 		priv->flow_entries = devm_kcalloc(priv->device,
-						  dma_cap->l3l4fnum,
+						  priv->flow_entries_max,
 						  sizeof(*priv->flow_entries),
 						  GFP_KERNEL);
 		if (!priv->flow_entries)
-- 
2.47.3


