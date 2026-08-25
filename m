Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C483C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FiZYyse+CrN3tymCYgowEJem9KKsKbBXowTpsHQ8wY=; b=MpkdAFqP2Su2IETYBDaZ7aTsnm
	pPGquOiFXgtSDsCg7sFESHVPLguzx9SrkIsXnPA1Cq0I6ZZ5WTvyaFZskKlMC1j4Hh/1Fw35aYZXm
	ibUGlRm5HNob3OONmsl6feA65hbR4GvOk5fjOAM8InwnS3ZIYsvVPUCpmseXuUtU+5OEZbR5yhB3N
	nJ2DY9syX7VEIhSF0FdDmesXZhv7f+D/YrP8Bub6ZJdmAnrbuURY2a6pZvbd60SVvGT+mY7XywUUe
	CG97GEUAJA4uzu7o989bnBL9XrErFdKCEG20mic3rMGn5/s0nSmSvTj9i8fILLVDC865ViRp/KP4d
	1j9BUBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywvj-00000001OaF-0DS4;
	Tue, 25 Aug 2026 19:35:31 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywvf-00000001OX2-3jOq;
	Tue, 25 Aug 2026 19:35:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0843A1BFDEC;
	Tue, 25 Aug 2026 21:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787686521; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6FiZYyse+CrN3tymCYgowEJem9KKsKbBXowTpsHQ8wY=;
	b=Xj03XAPj+XWm6PN9OHeHiUdA7MZ7gLNOcrX0/p9WCeirILqG6MketVAWXnSsmtu4c15Y96
	dcvLcPxmenSuaMZ7yLXt4RLTvt37w3UFal454MNO0Ae1lEvTDu6F2yxdH13WrJME0dIYyp
	CmOv7xhsKCcAU2gBdC9/Gsl9bi70UtfXEnjgU14TYwCnmp98Iq159+8vqZO19/3714ZGwA
	jPNPOlGAe0dCg0g2SzhtFXwqHsn7FcOXvvY94imY+2B2Geqrr3HCrxXfXYTpUOB+v+01iK
	cBJ9HmdWNaieRX/dQZviJi6rhnoEIUzClokRWarsFU6TH3qu71q/Z5yope2AqQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org,
	ansuelsmth@gmail.com
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	SkyLake.Huang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	cjd@cjdns.fr,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 2/3] net: phy: mediatek: bug fixes to airoha-ge-soc.c
Date: Tue, 25 Aug 2026 19:34:55 +0000
Message-Id: <20260825193456.1823985-3-cjd@cjdns.fr>
In-Reply-To: <20260825193456.1823985-1-cjd@cjdns.fr>
References: <20260825193456.1823985-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_123529_269617_28CC4B46 
X-CRM114-Status: UNSURE (   9.96  )
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

Fix crash bug from unconfigured shared, potential namespace collision
in devm_phy_package_join() and typo in Kconfig.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/phy/mediatek/Kconfig         | 2 +-
 drivers/net/phy/mediatek/airoha-ge-soc.c | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index fe51f4616c54..b8df1a8016c6 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -9,7 +9,7 @@ config AIROHA_GE_SOC_PHY
 	  Supports Airoha SoC built-in Gigabit Ethernet PHYs.
 
 	  Include support for built-in Ethernet PHYs which are present in
-	  the AN7581 and AN7583 SoCs. These PHYs d will dynamically
+	  the AN7581 and AN7583 SoCs. These PHYs will dynamically
 	  calibrate during startup.
 
 config MEDIATEK_2P5GE_PHY
diff --git a/drivers/net/phy/mediatek/airoha-ge-soc.c b/drivers/net/phy/mediatek/airoha-ge-soc.c
index 601a64d83365..ab183779ee84 100644
--- a/drivers/net/phy/mediatek/airoha-ge-soc.c
+++ b/drivers/net/phy/mediatek/airoha-ge-soc.c
@@ -1596,11 +1596,14 @@ static int an7581_phy_probe(struct phy_device *phydev)
 		dev_err(&phydev->mdio.bus->dev,
 			"Failed to setup PHY LED pinctrl\n");
 
-	ret = devm_phy_package_join(&phydev->mdio.dev, phydev, 0,
+	ret = devm_phy_package_join(&phydev->mdio.dev, phydev,
+				    AIROHA_DEFAULT_PORT0_ADDR,
 				    sizeof(struct airoha_socphy_shared));
 	if (ret)
 		return ret;
 
+	shared = phy_package_get_priv(phydev);
+
 	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.39.5


