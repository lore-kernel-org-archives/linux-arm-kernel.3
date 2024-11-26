Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D82D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViyBqZDRf9mxt/gnHL7aRAYMh2xDyHVj2nyl3rce0Ks=; b=gHtzzQOIVyO0eKy43CjBPMYxE+
	5M+isYSjZvhS5pXwMgap8jLfHruJYqYZRHv2slTGSKaqB+XjYRyuQFJKGSobUF+BIDmbIZnFbMro/
	qyUEaVYVArwDo08GmEs5h9U5XT7MZ1Rx6PPDd09MjSyZ2/RWP5LCH1J+3lddn0u8bEgKV02cGeyEP
	GFvPhdPoDFc/zUrhdbkcw4BuwBlQxQRXbrL80LAUFBfOV3mF7lBOCvLCO2gKUmMWuFEd53m7molhY
	xQV6/hVQJfwg4m0m5lFh2zjeK2P1bT7xHW78Ku4xzlIllhrNmYbUod0LJDHtUehxJW47dPAPbkf8u
	U0C2JDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFruR-0000000A9ul-2hw9;
	Tue, 26 Nov 2024 09:31:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFroO-0000000A8Qr-0wsS;
	Tue, 26 Nov 2024 09:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ViyBqZDRf9mxt/gnHL7aRAYMh2xDyHVj2nyl3rce0Ks=; b=GQJ/ulSkVWJHiIVfXGxvaQiiIj
	e9muwTR/cxOXIAFlBTPI4Mc+6RS6qIF/zLCfzvGFzIRL3d6A/AWYJWxxusgjvoHox/4N/6500KRJk
	A899l13IltA4KYkS4p7SrDRQ/mnlfSw4VT2+Hh86WSDYqAdLaY1S/76RyspCXQ5xAfh9kQsIY85vd
	5H+ZZaSkceXtpPZqSKRpyUBvZlcUlS8th9g8iLZL9IZXYRMwLxktXznf63ZEs5z9isRChZgZULFQH
	naHe6YPZiWwMMcopiwoVmwzH7cLtEcmFDo76q3OZYUBaqZayQQva4+7mCbdZerjWAbSU3n4rDx9vR
	c4v4HYKw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37314 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFroD-0006Sd-0l;
	Tue, 26 Nov 2024 09:24:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFroB-005xPw-Vd; Tue, 26 Nov 2024 09:24:36 +0000
In-Reply-To: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 04/16] net: phy: add phy_inband_caps()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFroB-005xPw-Vd@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:24:35 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012448_263296_04118AE8 
X-CRM114-Status: GOOD (  20.18  )
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

Add a method to query the PHY's in-band capabilities for a PHY
interface mode.

Where the interface mode does not have in-band capability, or the PHY
driver has not been updated to return this information, then
phy_inband_caps() should return zero. Otherwise, PHY drivers will
return a value consisting of the following flags:

LINK_INBAND_DISABLE indicates that the hardware does not support
in-band signalling, or can have in-band signalling configured via
software to be disabled.

LINK_INBAND_ENABLE indicates that the hardware will use in-band
signalling, or can have in-band signalling configured via software
to be enabled.

LINK_INBAND_BYPASS indicates that the hardware has the ability to
bypass in-band signalling when enabled after a timeout if the link
partner does not respond to its in-band signalling.

This reports the PHY capabilities for the particular interface mode,
not the current configuration.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phy.c | 21 +++++++++++++++++++++
 include/linux/phy.h   | 28 ++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 4f3e742907cb..d7b34f8ae415 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1005,6 +1005,27 @@ static int phy_check_link_status(struct phy_device *phydev)
 	return 0;
 }
 
+/**
+ * phy_inband_caps - query which in-band signalling modes are supported
+ * @phydev: a pointer to a &struct phy_device
+ * @interface: the interface mode for the PHY
+ *
+ * Returns zero if it is unknown what in-band signalling is supported by the
+ * PHY (e.g. because the PHY driver doesn't implement the method.) Otherwise,
+ * returns a bit mask of the LINK_INBAND_* values from
+ * &enum link_inband_signalling to describe which inband modes are supported
+ * by the PHY for this interface mode.
+ */
+unsigned int phy_inband_caps(struct phy_device *phydev,
+			     phy_interface_t interface)
+{
+	if (phydev->drv && phydev->drv->inband_caps)
+		return phydev->drv->inband_caps(phydev, interface);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phy_inband_caps);
+
 /**
  * _phy_start_aneg - start auto-negotiation for this PHY device
  * @phydev: the phy_device struct
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 77c6d6451638..ff60c4785e11 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -815,6 +815,24 @@ struct phy_tdr_config {
 };
 #define PHY_PAIR_ALL -1
 
+/**
+ * enum link_inband_signalling - in-band signalling modes that are supported
+ *
+ * @LINK_INBAND_DISABLE: in-band signalling can be disabled
+ * @LINK_INBAND_ENABLE: in-band signalling can be enabled without bypass
+ * @LINK_INBAND_BYPASS: in-band signalling can be enabled with bypass
+ *
+ * The possible and required bits can only be used if the valid bit is set.
+ * If possible is clear, that means inband signalling can not be used.
+ * Required is only valid when possible is set, and means that inband
+ * signalling must be used.
+ */
+enum link_inband_signalling {
+	LINK_INBAND_DISABLE		= BIT(0),
+	LINK_INBAND_ENABLE		= BIT(1),
+	LINK_INBAND_BYPASS		= BIT(2),
+};
+
 /**
  * struct phy_plca_cfg - Configuration of the PLCA (Physical Layer Collision
  * Avoidance) Reconciliation Sublayer.
@@ -954,6 +972,14 @@ struct phy_driver {
 	 */
 	int (*get_features)(struct phy_device *phydev);
 
+	/**
+	 * @inband_caps: query whether in-band is supported for the given PHY
+	 * interface mode. Returns a bitmask of bits defined by enum
+	 * link_inband_signalling.
+	 */
+	unsigned int (*inband_caps)(struct phy_device *phydev,
+				    phy_interface_t interface);
+
 	/**
 	 * @get_rate_matching: Get the supported type of rate matching for a
 	 * particular phy interface. This is used by phy consumers to determine
@@ -1816,6 +1842,8 @@ int phy_config_aneg(struct phy_device *phydev);
 int _phy_start_aneg(struct phy_device *phydev);
 int phy_start_aneg(struct phy_device *phydev);
 int phy_aneg_done(struct phy_device *phydev);
+unsigned int phy_inband_caps(struct phy_device *phydev,
+			     phy_interface_t interface);
 int phy_speed_down(struct phy_device *phydev, bool sync);
 int phy_speed_up(struct phy_device *phydev);
 bool phy_check_valid(int speed, int duplex, unsigned long *features);
-- 
2.30.2


