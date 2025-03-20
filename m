Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E009C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 22:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkKG+1uig/gv8dqFUSDCg+KHZ2PnbqdRy0w1E0ZwBhU=; b=eiBBwr5+Rd0Jo2GB2x9hVVOLw5
	emc6Jxzo072SHlE/sDnw+Gxm+pQ8lgT6a3iti+Sku3eo0N8lVo7X6tVZxkfiqmUOOzC28F46O/OWD
	xbgps52+rPqb9fwFbHEljYBW082GHBagvAWZiUqWNibyGw7AqXjBSjbsOlJgmOK8gnRLDu/jYRraf
	1gCti+hrvPRHSdvJV5KOutYtljdmD6LoYNJzMLUFRh9wgqAAF3XL2DSf7dhVOAT6X7LVoVMdhbNXs
	c0MOwWSTm/yj5BwB3wWpbkmBje6vmJFbBQAK0nadcY9KwXRmCmDPiKXGoEAga3VAKcjz4HzouFzBl
	u12O+/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOAw-0000000DLA8-264K;
	Thu, 20 Mar 2025 22:15:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvO6v-0000000DKGl-1aqo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 22:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fkKG+1uig/gv8dqFUSDCg+KHZ2PnbqdRy0w1E0ZwBhU=; b=wbVA+7oy5foIOmkAEoQU0k7PzL
	zKqNHoIrLmQkBIGbnASdMm1JUjTr9ZFRq1KOcvZeOoaNjHRNJ4z9yZwp0Uhaqu0cSbxI64OQFWwt2
	Zl0SjXkb6YRsinD3AQsEk+pvvNBXfxtaNGjsPYLC9WnHg/UjcPm1wcNcU/UMCYKEclLEgW/uHiDxa
	jVoVI5o1p9uK7g766JAf5+uIKfCWIaxQ6bRYZsaEKr39BjUUhk0ybUpecPSsdskVaCzzj5EeiuBVI
	f0AqWace3lwN/F3RFIA4TIDkhhjWwWsd0O9hmKk5h4Os5mrM+4jxsKF05yKEgYoTG/HeroMu5y5/p
	5nxMpz9w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56714 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tvO6p-0008Db-2p;
	Thu, 20 Mar 2025 22:11:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tvO6V-008Vjb-AP; Thu, 20 Mar 2025 22:11:07 +0000
In-Reply-To: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
References: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/5] net: phylink: add phylink_prepare_resume()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tvO6V-008Vjb-AP@rmk-PC.armlinux.org.uk>
Date: Thu, 20 Mar 2025 22:11:07 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_151133_417131_A60AB9B6 
X-CRM114-Status: GOOD (  14.90  )
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

When the system is suspended, the PHY may be placed in low-power mode
by setting the BMCR 0.11 Power down bit. IEEE 802.3 states that the
behaviour of the PHY in this state is implementation specific, and
the PHY is not required to meet the RX_CLK and TX_CLK requirements.
Essentially, this means that a PHY may stop the clocks that it is
generating while in power down state.

However, MACs exist which require the clocks from the PHY to be running
in order to properly resume. phylink_prepare_resume() provides them
with a way to clear the Power down bit early.

Note, however, that IEEE 802.3 gives PHYs up to 500ms grace before the
transmit and receive clocks meet the requirements after clearing the
power down bit.

Add a resume preparation function, which will ensure that the receive
clock from the PHY is appropriately configured while resuming.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 25 +++++++++++++++++++++++++
 include/linux/phylink.h   |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0f70a7f3dfcc..1b76ddc286fe 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2481,6 +2481,31 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
+/**
+ * phylink_prepare_resume() - prepare to resume a network device
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * Optional, but if called must be called prior to phylink_resume().
+ *
+ * Prepare to resume a network device, preparing the PHY as necessary.
+ */
+void phylink_prepare_resume(struct phylink *pl)
+{
+	struct phy_device *phydev = pl->phydev;
+
+	ASSERT_RTNL();
+
+	/* IEEE 802.3 22.2.4.1.5 allows PHYs to stop their receive clock
+	 * when PDOWN is set. However, some MACs require RXC to be running
+	 * in order to resume. If the MAC requires RXC, and we have a PHY,
+	 * then resume the PHY. Note that 802.3 allows PHYs 500ms before
+	 * the clock meets requirements. We do not implement this delay.
+	 */
+	if (pl->config->mac_requires_rxc && phydev && phydev->suspended)
+		phy_resume(phydev);
+}
+EXPORT_SYMBOL_GPL(phylink_prepare_resume);
+
 /**
  * phylink_resume() - handle a network device resume event
  * @pl: a pointer to a &struct phylink returned from phylink_create()
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 79876c84ae81..06f1b649f173 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -707,6 +707,7 @@ void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 
 void phylink_suspend(struct phylink *pl, bool mac_wol);
+void phylink_prepare_resume(struct phylink *pl);
 void phylink_resume(struct phylink *pl);
 
 void phylink_ethtool_get_wol(struct phylink *, struct ethtool_wolinfo *);
-- 
2.30.2


