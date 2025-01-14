Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCA7C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSpEFY7EzrjMbPzAvp+SMli9ZoKwwgJN9BbiOeWW6CY=; b=WgyBfV3hmnhm+CuLW6FpKVTjUH
	A+wm4uVgSD7ellmMZ79A2oztiPmwxuWB0RADgsVL3v0ENP70Ws6/+wvxhdMn48cb6EckgS41Og85J
	qgSAMa53q2h4IxS0deeqlauGbBfT9bGHRxmuzPMCgxnlNQWgxux4v4cFacpnKyCfqyQCnwcExZA+L
	HWWWpBqWvGql5qiJez5l+jh4kDPjJ/chjAvVRxMNCJ1PBUy6r2ZxcQdmSjkaiUfFlcBnTdPyliSW/
	4yOygOrCMt1YO0EpdM1y8w1xgldBlvlRs43UfDYbLcUVb1Y9UWr3XeIXDRHo3Q/ABfi/FxRXKt/Dn
	574wZh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhhA-00000008dNT-0jxB;
	Tue, 14 Jan 2025 14:15:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhVk-00000008akM-2rZ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 14:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bSpEFY7EzrjMbPzAvp+SMli9ZoKwwgJN9BbiOeWW6CY=; b=znlQ3enAOM8n0X/HgNA9XpNIai
	vXHqjdRRV+WwS0OY/lDVrWGROTwSRAEIKdjbeybiZYZ278+ckMm1JcBbJfZTcym6DpeLQg3XJ5Ggf
	pWJsYihDy7Wfk+/jSVqVZl+qMIb3H2B71U8jxZehL4rmXNBWAGqS61sdO4HFmDEk2UM26XBu024Bh
	NiU6gXvBvXkuiaMsqmRAaHXGz3WwlGr8/2mdWMz6C3U3IRay2su8MaYflCHiblpZwrzT0UNFh+LJa
	yLYekRAyZH7Tue1KjM/8km096fGd/j5ZjMlcOZrkV89j2ZZMl1qaPeuXhmvKWZ09jwjAHWt36QTqy
	ED9sHvCw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54652 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXhVd-0008BT-1m;
	Tue, 14 Jan 2025 14:03:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXhVK-000n18-3C; Tue, 14 Jan 2025 14:02:50 +0000
In-Reply-To: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH RFC net-next 10/10] net: dsa: allow use of phylink managed EEE
 support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXhVK-000n18-3C@rmk-PC.armlinux.org.uk>
Date: Tue, 14 Jan 2025 14:02:50 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_060316_718493_51B38438 
X-CRM114-Status: GOOD (  12.86  )
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

In order to allow DSA drivers to use phylink managed EEE, changes are
necessary to the DSA .set_eee() and .get_eee() methods. Where drivers
make use of phylink managed EEE, these should just pass the method on
to their phylink implementation without calling the DSA specific
operations.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 net/dsa/user.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/net/dsa/user.c b/net/dsa/user.c
index c74f2b2b92de..6912d2d57486 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -1233,16 +1233,23 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
 	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
 		return -EOPNOTSUPP;
 
-	/* Port's PHY and MAC both need to be EEE capable */
-	if (!dev->phydev)
-		return -ENODEV;
-
-	if (!ds->ops->set_mac_eee)
-		return -EOPNOTSUPP;
+	/* If the port is using phylink managed EEE, then get_mac_eee is
+	 * unnecessary.
+	 */
+	if (!ds->phylink_mac_ops ||
+	    !ds->phylink_mac_ops->mac_disable_tx_lpi ||
+	    !ds->phylink_mac_ops->mac_enable_tx_lpi) {
+		/* Port's PHY and MAC both need to be EEE capable */
+		if (!dev->phydev)
+			return -ENODEV;
+
+		if (!ds->ops->set_mac_eee)
+			return -EOPNOTSUPP;
 
-	ret = ds->ops->set_mac_eee(ds, dp->index, e);
-	if (ret)
-		return ret;
+		ret = ds->ops->set_mac_eee(ds, dp->index, e);
+		if (ret)
+			return ret;
+	}
 
 	return phylink_ethtool_set_eee(dp->pl, e);
 }
-- 
2.30.2


