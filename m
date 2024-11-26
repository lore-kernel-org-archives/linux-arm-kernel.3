Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B56D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KZ6f++/6LKrIDy4/i3vTw30la5tSDaEUV/ViQihMrc=; b=ID7CABzadQl36UzWNTDBBmp1vs
	d86lUWMsRfL+s7CuO6UHfGgosZtbBy8k4qkv1y8EnqbQVYZxwzUWb3s0fqcxbz/7pWJ9vxJ8CpK3G
	m40e2RRJ0k5A/qLW3OvOBgYd+RoW4rcF6lvYk9/MsoYizk39NHnvuELnhO4n7DJGJ4LDeud9sra7O
	9zj/Eelu8wpCydEXBcQE1BrTWtl0MmYv9wvIgPQXBsOAOtFbaSwjN+8Zw+ZwNDhL8gj7N24jl0xf9
	QE7mjv4uxbHc0oh92g6/bO10TVmfrVNDWLJ1ferAs9ln1YiOMaE6430YGwhomuGTmO7tCnIdmGdiW
	sivQI7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrxG-0000000AAYG-2x29;
	Tue, 26 Nov 2024 09:33:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrod-0000000A8VP-1iew;
	Tue, 26 Nov 2024 09:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2KZ6f++/6LKrIDy4/i3vTw30la5tSDaEUV/ViQihMrc=; b=v8gPgoriwZLQykLvUKiI3BwrsT
	EPE4feuotr/8Ox3K/+H/BMUcSgX3OMODwmj+vaGltv4rLq63lKV+yi6Jl0oCIoYRfwEXVY7c7NW8w
	h0REeUjaSjMFNq7Qmc8z7CBOmjctom++YKuzVHYzpQ4dD03QuFKIzGnaKoeOOtaEvu60OLEWYuVK/
	Ois3DfEEn7LTPL7cxR+p9dP/ZxPTGIiQnNrQJhS6yPe9wWvI8cFY/wePe4cZtsPpafdiWzRR6SELQ
	gSyuitI4CAHxDrsgDEze0n+64VgCgEL2dveL8IpAd13XueJZPGb3s7cvHMNQbB0xlx82pEXc0iRK2
	QQJaxZGQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60742 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFroS-0006Tf-1c;
	Tue, 26 Nov 2024 09:24:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFroR-005xQE-Ab; Tue, 26 Nov 2024 09:24:51 +0000
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
Subject: [PATCH RFC net-next 07/16] net: phy: add phy_config_inband()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFroR-005xQE-Ab@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:24:51 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012503_445725_7DE7A1E2 
X-CRM114-Status: GOOD (  13.24  )
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

Add a method to configure the PHY's in-band mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phy.c | 31 +++++++++++++++++++++++++++++++
 include/linux/phy.h   |  6 ++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index d7b34f8ae415..3e4922839895 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1026,6 +1026,37 @@ unsigned int phy_inband_caps(struct phy_device *phydev,
 }
 EXPORT_SYMBOL_GPL(phy_inband_caps);
 
+/**
+ * phy_config_inband - configure the desired PHY in-band mode
+ * @phydev: the phy_device struct
+ * @modes: in-band modes to configure
+ *
+ * Description: disables, enables or enables-with-bypass in-band signalling
+ *   between the PHY and host system.
+ *
+ * Returns: zero on success, or negative errno value.
+ */
+int phy_config_inband(struct phy_device *phydev, unsigned int modes)
+{
+	int err;
+
+	if (!!(modes & LINK_INBAND_DISABLE) +
+	    !!(modes & LINK_INBAND_ENABLE) +
+	    !!(modes & LINK_INBAND_BYPASS) != 1)
+		return -EINVAL;
+
+	mutex_lock(&phydev->lock);
+	if (!phydev->drv)
+		err = -EIO;
+	else if (!phydev->drv->config_inband)
+		err = -EOPNOTSUPP;
+	else
+		err = phydev->drv->config_inband(phydev, modes);
+	mutex_unlock(&phydev->lock);
+
+	return err;
+}
+
 /**
  * _phy_start_aneg - start auto-negotiation for this PHY device
  * @phydev: the phy_device struct
diff --git a/include/linux/phy.h b/include/linux/phy.h
index ff60c4785e11..6c1887d1edbf 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -980,6 +980,11 @@ struct phy_driver {
 	unsigned int (*inband_caps)(struct phy_device *phydev,
 				    phy_interface_t interface);
 
+	/**
+	 * @config_inband: configure in-band mode for the PHY
+	 */
+	int (*config_inband)(struct phy_device *phydev, unsigned int modes);
+
 	/**
 	 * @get_rate_matching: Get the supported type of rate matching for a
 	 * particular phy interface. This is used by phy consumers to determine
@@ -1844,6 +1849,7 @@ int phy_start_aneg(struct phy_device *phydev);
 int phy_aneg_done(struct phy_device *phydev);
 unsigned int phy_inband_caps(struct phy_device *phydev,
 			     phy_interface_t interface);
+int phy_config_inband(struct phy_device *phydev, unsigned int modes);
 int phy_speed_down(struct phy_device *phydev, bool sync);
 int phy_speed_up(struct phy_device *phydev);
 bool phy_check_valid(int speed, int duplex, unsigned long *features);
-- 
2.30.2


