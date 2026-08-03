Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A0FC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXDpGb2VelPNNr7r1QAGoNG/p9WL9bieoGQ8Iec7SuM=; b=zQaJoA9ZBJ5bKScC4x9OYVCg8J
	eXgf8ZeMiSIVJhRfmLMsD1PeyWakqMN7fBeZPTcwoqMv9VP0QH2m64QYGv1R0gngJxJe7D+S8iWJE
	UrnUtyTS1N2o8yU55J6zzRT1+qBTXBSGsx75taoUeyPeFhFG05408Z5dp2alUMhCm0oF7DcGBFB62
	rhxWZGQeCzYJGw/3tFRtIvgowos+vTSsTliCRMu8KTmPNw7a3Lam57LH+WMKPMe2l21BBVtK7fF1k
	LAO7V0aIgxi1z/KcaVGhM/rrrydyWOWJTwIdFt1nI9yphqLhjrDh23zqEYZtgO2JhYl7T6Tprgn6M
	tfRr66Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphZ-0000000Gp2P-1Gd6;
	Mon, 03 Aug 2026 10:15:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphX-0000000Gp0e-1512
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:15:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A2A115A1;
	Mon,  3 Aug 2026 03:15:14 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901A83F632;
	Mon,  3 Aug 2026 03:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785752118; bh=QOzvt9t/MIRWZBLs3wy9qmzt+LKR/lt21R4C8HB6byU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOmfoRQbY+zr8SjY5r3n9rMeI5Q7MMm+HUliKJZf5pZmLr4Si9fDOV/myP9Dvmiit
	 YmNcfVuGzl4znJ63ZvzGg+XzMuWnT7Vne6VZRhmWaUusehotNYa4ncOyfV2IUuqdXm
	 Bo/dsIJSuQq0t9nGHmFc8+7CJON0vCNpN8o5FUDE=
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Liu Changjie <liucj1228@outlook.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] net: phy: maxio: extend PHY ID matching
Date: Mon,  3 Aug 2026 12:14:50 +0200
Message-ID: <20260803101452.2993721-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803101452.2993721-1-andre.przywara@arm.com>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031519_344383_E30C1E39 
X-CRM114-Status: GOOD (  14.00  )
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

Currently the maxio Ethernet PHY driver expects a PHY matching exactly the
one ID provided: 0x7b744412. The Maxio MAE0621A-Q3C model used on
the Allwinner based X96QPro+ TV box uses a slightly different PHY ID:
0x7b744411.

Replace the "exact match" requirement with the more relaxed "model
match" version, which ignores the lowest 4 bits of the PHY ID. Both
PHYs should now be recognised by the driver.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/net/phy/maxio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/maxio.c b/drivers/net/phy/maxio.c
index 5fabf99fb90f..d97fb50cdbe1 100644
--- a/drivers/net/phy/maxio.c
+++ b/drivers/net/phy/maxio.c
@@ -87,7 +87,7 @@ static int maxio_mae0621a_config_init(struct phy_device *phydev)
 
 static struct phy_driver maxio_drivers[] = {
 	{
-		PHY_ID_MATCH_EXACT(MAXIO_MAE0621A_PHY_ID),
+		PHY_ID_MATCH_MODEL(MAXIO_MAE0621A_PHY_ID),
 		.name		= "Maxio MAE0621A",
 		.probe		= maxio_mae0621a_probe,
 		.config_init	= maxio_mae0621a_config_init,
@@ -100,7 +100,7 @@ static struct phy_driver maxio_drivers[] = {
 module_phy_driver(maxio_drivers);
 
 static const struct mdio_device_id __maybe_unused maxio_tbl[] = {
-	{ PHY_ID_MATCH_EXACT(MAXIO_MAE0621A_PHY_ID) },
+	{ PHY_ID_MATCH_MODEL(MAXIO_MAE0621A_PHY_ID) },
 	{ }
 };
 MODULE_DEVICE_TABLE(mdio, maxio_tbl);
-- 
2.43.0


