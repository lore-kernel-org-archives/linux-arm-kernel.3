Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A55CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlxgOL4iHOhRq2rg3Bphni6vekg4JHIOiNC2UJ8koDs=; b=g4MbIY+sQvYaocNjD38m8Ta2tI
	kT0rwgyBRXvmgl32/o0VHULHRYm42/OhajUdpQVoH9v4zrm8ObahttF/rTBy3m/UBvHgOWrSSuAx2
	5OuNeXFvcTUK+00i+Saki+Zy/2OW/K6RfyxAn8QR4OR508OiQWLarkSifJyac7KSOLegyKshJSTbF
	Mj1azJzfEgxBg9hRkwF3ajPjXzbAJPjB2Ra2eiJtbTPtDE1yYb9UUb4ZFnzXnGd6j/hXEgELTSJ7l
	rpwWoHODu3TlP9hBeRJAVeUbKHi0Lm0ZFNC+Ds9k5sJHHt9doltYGBTiK2K7MO/mc2WCTAjw4GYIc
	tPg7tc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrR6-00000005fSe-491b;
	Thu, 23 Oct 2025 09:16:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrR4-00000005fQu-24b2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LlxgOL4iHOhRq2rg3Bphni6vekg4JHIOiNC2UJ8koDs=; b=BOjmGp7myOoyHmJURfM6X+Y6Pg
	KCRGtf92cVW6xC9FyDu4td6zv9dMlbvaTXyRqwsoJGlEaPf1K8JHf87g+TU8XVNNX97AsjCoTcBOn
	PaXL97A/Oy3+gu/EBHlp8XixgIAa0NkP0GQsdUWBTeHvkKuU7SsWCAfTRzMhArbczwcRBF/zS2C24
	ZQ94WOp3EovPAy0bZDe7CA2OUAb9JBZKqJ1v0PIyCeNQ3wrxHYM0RiZGrDRDsZTx8LkLbw4LhsS+Q
	JxPnt0ob6Q5X7ZU34JLJnm3ovkDvnAWfD+xaY/KC3bSFhwNcH/DoGzORYGK4pzB45DFmUv/BYHgUL
	WMcWWFzA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46440 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vBrQt-0000000060d-06iT;
	Thu, 23 Oct 2025 10:16:31 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vBrQs-0000000BLzI-0w3U;
	Thu, 23 Oct 2025 10:16:30 +0100
In-Reply-To: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
References: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>
Subject: [PATCH net-next v2 1/6] net: phy: add phy_can_wakeup()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vBrQs-0000000BLzI-0w3U@rmk-PC.armlinux.org.uk>
Date: Thu, 23 Oct 2025 10:16:30 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_021642_840364_877310E7 
X-CRM114-Status: UNSURE (   8.92  )
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

Add phy_can_wakeup() to report whether the PHY driver has marked the
PHY device as being wake-up capable as far as the driver model is
concerned.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/phy.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3c7634482356..3eeeaec52832 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1379,6 +1379,18 @@ static inline void phy_disable_eee_mode(struct phy_device *phydev, u32 link_mode
 	linkmode_clear_bit(link_mode, phydev->advertising_eee);
 }
 
+/**
+ * phy_can_wakeup() - indicate whether PHY has driver model wakeup capabilities
+ * @phydev: The phy_device struct
+ *
+ * Returns: true/false depending on the PHY driver's device_set_wakeup_capable()
+ * setting.
+ */
+static inline bool phy_can_wakeup(struct phy_device *phydev)
+{
+	return device_can_wakeup(&phydev->mdio.dev);
+}
+
 void phy_resolve_aneg_pause(struct phy_device *phydev);
 void phy_resolve_aneg_linkmode(struct phy_device *phydev);
 
-- 
2.47.3


