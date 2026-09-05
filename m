Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8986C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82GkuRC0jvPSnLbcrGMk1PpHmAiK9Vi2rhDnE52pglc=; b=GwTJ6waJ7+TPfr81hulPy0GTKs
	+tLA6B74J9SCDRVlTNvCY50ZYybndkrXfMG4cbgbipAZwRfITm8g8tK5bvR3lBFtjv8bdVWTadYeT
	K2DCRNBhxkOI51Ao/lmRtrIrEeIzpkamWmDL6kGGjTaRHBCvJCTmxtcfNI3tZnn7+Gc6e/gnD6XPG
	ts2ujKVf8jLUFEwkWQdYhxWsOcuvPN3bmZl26J7Z4gH9VVuZOWStYnH+USd7o/GVCk9Q7+K1OOJoe
	TRXu6hxAZ+xI08uz9oe3KUr840j6VkRO8z+34Dv7JVdqkPywXtEl1fy8RwUfnN2AhC6OCuLXvaNWy
	K/3otj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kpY-00000003nJ5-1LS7;
	Sat, 05 Sep 2026 07:28:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kpV-00000003nHL-3fUO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:28:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5C30F4E41530;
	Sat,  5 Sep 2026 07:28:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A3CD60580;
	Sat,  5 Sep 2026 07:28:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66C7B11C79AE2;
	Sat,  5 Sep 2026 09:28:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788593323; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=82GkuRC0jvPSnLbcrGMk1PpHmAiK9Vi2rhDnE52pglc=;
	b=WEsPlZIRN2lGjDk1xqUxV+RmW2U0hFhGkNDdp9wkJifcd58CtNZnxunxDKRbewYkXI9628
	OUMl47hgVdhPIPwfMS2lFk/O68YyFP29ZWGqPdmfDa3mXf8aCKoYhD4uDPXla1BLBI6+ef
	c0cCWh4+eb3EL1+d4QFINfVHyuPtRA9f2CJQsgSeOsvHxevjV0l1oSPMdRr9iz/AZeFWBr
	7w+7et8hjFwToI5XV2ZP0rDvi8GiOEHa5WOmd+rOQBbv80/C6Wsz5AclK0ry6CrXqEJaUD
	NNZ5WJm7bn1kbmcdxCjf5UvuD9LvDx/StirrsmLVmaBcw5djGSq+zTy6O60zag==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Yao Zi <me@ziyao.cc>,
	Frank <Frank.Sae@motor-comm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next v2 1/3] net: phy: motorcomm: Split yt8521_config_init() page management
Date: Sat,  5 Sep 2026 09:28:26 +0200
Message-ID: <20260905072830.28986-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905072830.28986-1-maxime.chevallier@bootlin.com>
References: <20260905072830.28986-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_002850_052687_1FEBF159 
X-CRM114-Status: GOOD (  13.17  )
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

In preparation for separate .config_init() implementations for YT8521
and YT8531S, let's split the yt8521_config_init() into a high-level
helper that deals with page handling, and another one that implements
the logic. This will ease splitting the YT8531S-specific logic out.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: no changes

 drivers/net/phy/motorcomm.c | 38 ++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index c5a2cda8d31b..58e4d67b945f 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -1680,27 +1680,16 @@ static int yt8521_resume(struct phy_device *phydev)
 	return yt8521_modify_utp_fiber_bmcr(phydev, BMCR_PDOWN, 0);
 }
 
-/**
- * yt8521_config_init() - called to initialize the PHY
- * @phydev: a pointer to a &struct phy_device
- *
- * returns 0 or negative errno code
- */
-static int yt8521_config_init(struct phy_device *phydev)
+static int __yt8521_config_init(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
-	int old_page;
 	int ret = 0;
 
-	old_page = phy_select_page(phydev, YT8521_RSSR_UTP_SPACE);
-	if (old_page < 0)
-		goto err_restore_page;
-
 	/* set rgmii delay mode */
 	if (phydev->interface != PHY_INTERFACE_MODE_SGMII) {
 		ret = ytphy_rgmii_clk_delay_config(phydev);
 		if (ret < 0)
-			goto err_restore_page;
+			return ret;
 	}
 
 	if (device_property_read_bool(dev, "motorcomm,auto-sleep-disabled")) {
@@ -1708,7 +1697,7 @@ static int yt8521_config_init(struct phy_device *phydev)
 		ret = ytphy_modify_ext(phydev, YT8521_EXTREG_SLEEP_CONTROL1_REG,
 				       YT8521_ESC1R_SLEEP_SW, 0);
 		if (ret < 0)
-			goto err_restore_page;
+			return ret;
 	}
 
 	if (device_property_read_bool(dev, "motorcomm,keep-pll-enabled")) {
@@ -1716,13 +1705,32 @@ static int yt8521_config_init(struct phy_device *phydev)
 		ret = ytphy_modify_ext(phydev, YT8521_CLOCK_GATING_REG,
 				       YT8521_CGR_RX_CLK_EN, 0);
 		if (ret < 0)
-			goto err_restore_page;
+			return ret;
 	}
 
 	if (phy_interface_is_rgmii(phydev) &&
 	    phydev_id_compare(phydev, PHY_ID_YT8531S))
 		ret = yt8531_set_ds(phydev);
 
+	return ret;
+}
+
+/**
+ * yt8521_config_init() - called to initialize the PHY
+ * @phydev: a pointer to a &struct phy_device
+ *
+ * returns 0 or negative errno code
+ */
+static int yt8521_config_init(struct phy_device *phydev)
+{
+	int old_page, ret = 0;
+
+	old_page = phy_select_page(phydev, YT8521_RSSR_UTP_SPACE);
+	if (old_page < 0)
+		goto err_restore_page;
+
+	ret = __yt8521_config_init(phydev);
+
 err_restore_page:
 	return phy_restore_page(phydev, old_page, ret);
 }
-- 
2.55.0


