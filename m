Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1094EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dbjvadws0kRCNhxtI35nxdB/KtxozDHnbrbbu+M7kRA=; b=Zgrx61rx/4mLi1RBAU1vqyAzm8
	uqYfydwOdy6WhhBk5eVR9E5Z0gkX4+5eLr1Ly/OmXfbIXFL3RkALbpjNUQPa7Qfc9kLJ9jTFm4X+O
	+4doD6Nd3VpvZRom170nDD5HB2CI0jjMGq2dDp4ol1rKtcrx2JOfV1xfUTcR67/NKwCNbQB/U2Igu
	+dpLGOBK0z+xN2qJLXlVUURkzgQeCRjhXXoDWjWG2Vb2xiMHndu07SPSjRGDAgaEU1cQzJd9xktu8
	Wpfl3R7slrhVOEBp89es0ihYFYvsJDCRqZBWgbkedoLN/r5eAu47ORklQ8M3IhaHvGloSysJHdSwN
	TgPkjkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5j-00000004YAA-1BEJ;
	Tue, 04 Mar 2025 12:09:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQLQ-00000004Nal-1QJq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dbjvadws0kRCNhxtI35nxdB/KtxozDHnbrbbu+M7kRA=; b=SkAybfOkr4oApk1guBPlQyrxVd
	HSuqX+0VFCNYPELvpBdZsDqVSw0tKAo8HkCGDMDkl7wPXXtb8Vscvz4At7CAS9ro7HsPrhTlEhWB7
	nNHlhafnMosLEA/pBOcjd6ngzyjiQUlFLP0Dpb1a90XFo7gVsCD7K3RJy5RazFT8JuKjpps7t4v6L
	u0+RaesHR4UmshqkRfEVW8c350bxz88rWMFi+99db9QN+UZv8FXPLFD/LaEyWf8KF1tx3Z4n2GBXO
	K6KkqATP+Gt5XrABSGgdGp+2fE3KVvFjCkPUREXhnEckO3sDebUzWoaTNWtujBmh7/e0WOEFLWqpd
	C7QYLKDg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42422 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tpQLL-0002YY-1v;
	Tue, 04 Mar 2025 11:21:47 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tpQL1-005St4-Hn; Tue, 04 Mar 2025 11:21:27 +0000
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
Subject: [PATCH net-next] net: stmmac: simplify phylink_suspend() and
 phylink_resume() calls
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tpQL1-005St4-Hn@rmk-PC.armlinux.org.uk>
Date: Tue, 04 Mar 2025 11:21:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_032152_374712_31172F6B 
X-CRM114-Status: GOOD (  10.23  )
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

Currently, the calls to phylink's suspend and resume functions are
inside overly complex tests, and boil down to:

	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
		call phylink
	} else {
		call phylink and
		if (device_may_wakeup(priv->device))
			do something else
	}

This results in phylink always being called, possibly with differing
arguments for phylink_suspend().

Simplify this code, noting that each site is slightly different due to
the order in which phylink is called and the "something else".

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index aec230353ac4..fbcba6c71f12 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7831,13 +7831,11 @@ int stmmac_suspend(struct device *dev)
 	mutex_unlock(&priv->lock);
 
 	rtnl_lock();
-	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
-		phylink_suspend(priv->phylink, true);
-	} else {
-		if (device_may_wakeup(priv->device))
-			phylink_speed_down(priv->phylink, false);
-		phylink_suspend(priv->phylink, false);
-	}
+	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+		phylink_speed_down(priv->phylink, false);
+
+	phylink_suspend(priv->phylink,
+			device_may_wakeup(priv->device) && priv->plat->pmt);
 	rtnl_unlock();
 
 	if (stmmac_fpe_supported(priv))
@@ -7927,13 +7925,9 @@ int stmmac_resume(struct device *dev)
 	}
 
 	rtnl_lock();
-	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
-		phylink_resume(priv->phylink);
-	} else {
-		phylink_resume(priv->phylink);
-		if (device_may_wakeup(priv->device))
-			phylink_speed_up(priv->phylink);
-	}
+	phylink_resume(priv->phylink);
+	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+		phylink_speed_up(priv->phylink);
 	rtnl_unlock();
 
 	rtnl_lock();
-- 
2.30.2


