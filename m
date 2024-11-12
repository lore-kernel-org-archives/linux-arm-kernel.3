Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2D7D41D61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6r8hH0FPdgEHTCt1cWrHRridoAt19MyEN1wa7rJu57g=; b=2UnP3e6hcI80QzIe2kjMslyi1L
	dbuUaGbO5UeN2N5giXWE01NZoj59GdA2F7BwPxONloBKeQ0iNlmZgMQ7WCJ9JxkiM7nOEFS4tBvkX
	9iI1m5zSJeyTpQkmcF+hTnR12oaSy2Upx5IM4nV2dRP1t11ADXvmCLs7aORG2CGdngCMUNMOkQGU0
	hTUsLumMt3vCgbSSPo/AY4rRtrOqmYwugSgFEBaeYWGP169HGaBEMt0xRNB7D45lyH/LsqQvg9wgh
	BjBbzcasswXRnn2qUyGlJ5bNNlC4TOvnXOemX2O2Bx1i3O4sgymZMbkb9pKdmZDwRd2bqN+eWeZU4
	/LKC7x5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlKi-00000002TDU-1bjX;
	Tue, 12 Nov 2024 07:29:04 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlHA-00000002Sfc-0GX2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731396324; x=1762932324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=56zf3pdeCoar/wx2RuHyLAS0nUbRU/jxT75R9EzS8qE=;
  b=DoXfzsuHeAu9AjYSrFxNFt0J9f1D3SyMFPabkQmK4JgK2MDjp6UJ7G3x
   AJk1pa7bzfSIg5LlUGMDjAwlijfseWZ0OJJlYr+wZb0/YBT3zk2N40dBe
   OTdGDJ9Mxv0GdCqZw0BcAAMsq2je4lDZ1qAactzZ15jxf+AL16Q/k4iUh
   zuN4AS5nsXisg9GZL/pkWCIvQopvsL5MWaT/orwvFRyG40PxVtTr5meEw
   gp1CUvXiu89B0OTmy3OOIYjU1IvSByKyfEtOfAvsqxf6LsLdSSbHczXxV
   f/xPrnE7fghmhXeR/qoN8Atv3gNAtlFStAGz8+pDrNRkLYJ7nQhRLKbRA
   w==;
X-CSE-ConnectionGUID: 0Ld2RgPbQAOm6rB/obGWmQ==
X-CSE-MsgGUID: Pi0+N19kQGW0J6VsHH1rJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31387802"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31387802"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 23:25:23 -0800
X-CSE-ConnectionGUID: 91fhFG1uRTKNRrYsEhwh5Q==
X-CSE-MsgGUID: ig6CV1xeS4qYl8WbXmtpAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87074232"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com) ([10.88.229.33])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2024 23:25:20 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net v1 1/2] net: phy: Introduce phy_update_eee() to update eee_cfg values
Date: Tue, 12 Nov 2024 15:24:46 +0800
Message-Id: <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_232524_166559_A32303ED 
X-CRM114-Status: GOOD (  13.61  )
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

The commit fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
introduced eee_cfg, which is used to check the existing settings against
the requested changes. When the 'ethtool --show-eee' command is issued,
it reads the values from eee_cfg. However, the 'show-eee' command does
not show the correct result after system boot-up, link up, and link down.

For system boot-up, the commit 49168d1980e2
("net: phy: Add phy_support_eee() indicating MAC support EEE") introduced
phy_support_eee to set eee_cfg as the default value. However, the values
set were not always correct, as after autonegotiation or speed changes,
the selected speed might not be supported by EEE.

phy_update_eee() was introduced to update the correct values for eee_cfg
during link up and down, ensuring that 'ethtool --show-eee' shows
the correct status.

Fixes: fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
Cc: <stable@vger.kernel.org>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phy_device.c | 24 ++++++++++++++++++++++++
 include/linux/phy.h          |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 499797646580..94dadf011ca6 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3016,6 +3016,30 @@ void phy_support_eee(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_support_eee);
 
+/**
+ * phy_update_eee - Update the Energy Efficient Ethernet (EEE) settings
+ * @phydev: target phy_device struct
+ * @tx_lpi_enabled: boolean indicating if Low Power Idle (LPI) for
+ * transmission is enabled.
+ * @eee_enabled: boolean indicating if Energy Efficient Ethernet (EEE) is
+ * enabled.
+ * @tx_lpi_timer: the Low Power Idle (LPI) timer value (in microseconds) for
+ * transmission.
+ *
+ * Description:
+ * This function updates the Energy Efficient Ethernet (EEE) settings for the
+ * specified PHY device. It is typically called during link up and down events
+ * to configure the EEE parameters according to the current link state.
+ */
+void phy_update_eee(struct phy_device *phydev, bool tx_lpi_enabled,
+		    bool eee_enabled, u32 tx_lpi_timer)
+{
+	phydev->eee_cfg.tx_lpi_enabled = tx_lpi_enabled;
+	phydev->eee_cfg.eee_enabled = eee_enabled;
+	phydev->eee_cfg.tx_lpi_timer = tx_lpi_timer;
+}
+EXPORT_SYMBOL(phy_update_eee);
+
 /**
  * phy_support_sym_pause - Enable support of symmetrical pause
  * @phydev: target phy_device struct
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a98bc91a0cde..6c300ba47a2d 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2004,6 +2004,8 @@ void phy_advertise_eee_all(struct phy_device *phydev);
 void phy_support_sym_pause(struct phy_device *phydev);
 void phy_support_asym_pause(struct phy_device *phydev);
 void phy_support_eee(struct phy_device *phydev);
+void phy_update_eee(struct phy_device *phydev, bool tx_lpi_enabled,
+		    bool eee_enabled, u32 tx_lpi_timer);
 void phy_set_sym_pause(struct phy_device *phydev, bool rx, bool tx,
 		       bool autoneg);
 void phy_set_asym_pause(struct phy_device *phydev, bool rx, bool tx);
-- 
2.34.1


