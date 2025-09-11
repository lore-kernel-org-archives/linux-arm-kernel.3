Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B535CCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM6nhXTaXN2xjQ81ddeyk5Wyn11ya+RpHkNOP56tyvY=; b=1WwdFTHt/KPFLNofiRobSFO0EI
	+IRDIcyaaSicYHvUtAwF/BkTEcw/EGXxRZqydYScs7zPUwLut7wUq/Hjz8moRcUKinBuOVsvOmn5S
	dtQdeI5YPPyyVHRVxNLO7gb8lbrYbg61K+00/N0VNqX8TDKyrKtTo5ztrGoYzxtQjzOaybvVqK4d3
	zSUOsR6GboS6q7S9r21nqcwgGvwKwE28dClLV0N3NNtQ3gZJMkBngXmITC4i0dy2wtWCObAd8HDC1
	IJ+ahwqSHubqA+Hz7cWH0kFlovHO0uEAKOVTtPw9uvYg9o20XPg09zj2pDeDOjXgvtDsY8ljBlO3m
	6sAyZC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfBn-00000002Z0i-37A5;
	Thu, 11 Sep 2025 11:10:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfBl-00000002Yxy-2N5g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eM6nhXTaXN2xjQ81ddeyk5Wyn11ya+RpHkNOP56tyvY=; b=B83D32PmuvNPb1F1iVO+0cb+8D
	c41ijOgzXjjWb7B8IuJnc18G/Z7xbXIF/g6WkW5YhGIm6VebZT8ZwxoElE34ky00ndapp21rPUEgp
	bTI8XP32Z91RGQ31EIlzB0ZnVDqGxBxlkmrRAli5oumumMeDnFSuzBOJI+dlSVSI5YlA3KFvoTB7p
	jfcTLYFixIn1Ik/Fgw83Z/e/C5U+PLB0DuXSubcZCX4DI+FLm9NXPCBGt/2rEim9ZS7rZfH7vlLh7
	Q7hw8ZsUpwvVlS7/AfIe2cSYjbyZurZTttu3PP8A3b951SlJrAveJ8R4/E3cupTUqU8qK8FMk3Dho
	qV9H+yXQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40152 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uwfBZ-000000002sZ-24qj;
	Thu, 11 Sep 2025 12:09:53 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uwfBY-00000004j8j-2FtN;
	Thu, 11 Sep 2025 12:09:52 +0100
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v2 04/11] net: stmmac: fix stmmac_xdp_open()
 clk_ptp_ref error cleanup
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uwfBY-00000004j8j-2FtN@rmk-PC.armlinux.org.uk>
Date: Thu, 11 Sep 2025 12:09:52 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_041005_604259_C399B034 
X-CRM114-Status: GOOD (  10.36  )
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

Neither stmmac_xdp_release() nor the normal paths of stmmac_xdp_open()
touch clk_ptp_ref, so stmmac_xdp_open() should not be doing anything
with this clock. However, in its error path, it calls
stmmac_hw_teardown() which disables and unprepares this clock, which
can lead to the clock state becoming unbalanced when the netdev is
taken administratively down.

Remove this call to stmmac_hw_teardown(), and as this is the last user
of this function, remove the function as well.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 167405aac5b8..8cb1a97e18af 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3568,13 +3568,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 	return 0;
 }
 
-static void stmmac_hw_teardown(struct net_device *dev)
-{
-	struct stmmac_priv *priv = netdev_priv(dev);
-
-	clk_disable_unprepare(priv->plat->clk_ptp_ref);
-}
-
 static void stmmac_free_irq(struct net_device *dev,
 			    enum request_irq_err irq_err, int irq_idx)
 {
@@ -6992,7 +6985,6 @@ int stmmac_xdp_open(struct net_device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
-	stmmac_hw_teardown(dev);
 init_error:
 	free_dma_desc_resources(priv, &priv->dma_conf);
 dma_desc_error:
-- 
2.47.3


