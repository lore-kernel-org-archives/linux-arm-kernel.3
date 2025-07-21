Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB1AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vvxFkwi2T8eGOtFKxrwUzKBICi5aNoTqQdzLMsYlNM=; b=Hbj+34gFa9KLeG3qP/JMMQrem8
	4SMtQ3UUL3qwHHnUz6FezIEzigxAui913DUeQCxtD2FlLkPbLmN/XzVUqMlEpEQKJ4pSrLGLB2LZ6
	sTCAC2pqDJDoDfOCB3YPQlv13ZcmQ0PlPfVlWl1CEGFkcUm3eypNDv6+uKo/zbkaNYrKYh50+H+zL
	exDDStiWJdRRX5oLiSnVb0YK1/6YXz3/9uUEF+E5D6JBBe7oDLK32t2PDrGCwE+sLC7baTXRjx+Os
	dCEekPCjICXbCiJijGhmUgNBhC7QUfMleUx1XP8i3IPL5Zc8AB30xFlcv9vspXXqsp3xrRLrR2BF5
	T4NZn0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqJo-0000000HMJB-25pp;
	Mon, 21 Jul 2025 13:12:36 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoZn-0000000H4WS-2nHT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:21:01 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L96UQA017909;
	Mon, 21 Jul 2025 13:20:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1vvxFkwi2T8eGOtFKxrwUzKBICi5aNoTqQdzLMsYlNM=; b=EFNzWCqHZxTWVK2U
	U28uJnsMvOyw4Lkv1B0V4oEhNvM3FlxxCUQtks6GTk+nQIkZOhO7NU+BxBni+1lh
	/13fybd7OMBHmHmpacwzfukkM1RGln8xl6Gppax0VD31KMBIe8A7j2ETs5muc39a
	bJwiPpZ2nfjRNeU5rX3t7QDFqcUZcZir8g8RAwzYhF1fP8Myq283TMxcPsp6NLmu
	3h9VnrMtrwoR0szVNYRr2VdyrPbL2dg3+9+t5Pl0w8CPGqZhrUQUsaArN+lzNvkn
	G4nf7BMHzlGE1b6cdEWwW2DDit6sIJthez8K02dVCvAE4dn2sAmyzxrCl9pDY2CI
	xK1mpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4dmgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 13:20:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D222240050;
	Mon, 21 Jul 2025 13:19:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E2187A321C;
	Mon, 21 Jul 2025 13:17:48 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 13:17:48 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 21 Jul 2025 13:14:45 +0200
Subject: [PATCH net-next 3/4] net: phy: smsc: fix and improve WoL support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
In-Reply-To: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simon
 Horman <horms@kernel.org>,
        Tristram Ha <Tristram.Ha@microchip.com>,
        Florian
 Fainelli <florian.fainelli@broadcom.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3389;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=QlqcErhvXJnFXPQ6XDMHIJxmEdcRJXdlyYXZuJiJYik=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBofiHY6FFiv0Vu9Wazl1iqrvA9PHA7unw5zT+CV
 7ygpezNYiOJAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaH4h2AAKCRCq90auhvHD
 KNblC/9bbwmxJ5fRSONlv9Nq7MEeAaauC/7WrpgBpvZJNxIVhwyv+9J8U7wMNGcJurjdDt5aIN5
 d5DR3LnY4VOs4UyTUjbIsOBkSRvWg5nmgAV8A1hSqrSmVkUcFXlnj351S5seNk1owR0nq9ESc6G
 IRCdlKiU6s8+k7WN1Tf+s2puKsBkbf5SU+t/7ixwEquY2LBqT/UKL9H1NKrp8L0HM491D3OndUG
 mGVPF/5UBrE+2MIK9s0yoRpJwLA9duHs+Qp2hnJGneIYbZu03CqobPf9n573T2aAUDx8cZ7Bq2Z
 x4jfglXMwTT2F1RnFYX7Gb43l6iOSoiQRGwPoHSXSHWd8INfUQ0Oc3lLV7KUPWS+ArzfKq/6mif
 OdrtT5TbxUG7G1ZCoOa9rJQ66wPPVZP4CWh6UmPGKfV3X3MDsade9+CzLTMbQ3WFcDmXH92Hj5X
 2cqas/ExKtoCoI3mYA2OOzMDsDBRqvPVdumuXBO3zSSJCEWNkDqEybmRUDndd7kVO1neU=
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_042059_998395_964CD9E4 
X-CRM114-Status: GOOD (  17.56  )
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

Add suspend()/resume() callbacks that do not shut down the PHY if the
WoL is supported and handle the WoL status flags.

If the WoL is supported by the PHY, indicate that the PHY device can
be a source of wake up for the platform. When setting the WoL
configuration, enable this capability.

Fixes: 8b305ee2a91c ("net: phy: smsc: add WoL support to LAN8740/LAN8742 PHYs")
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/net/phy/smsc.c  | 42 ++++++++++++++++++++++++++++++++++++++----
 include/linux/smscphy.h |  2 ++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
index b6489da5cfcdfb405457058dc88575c0d84d259d..cf4e763907aefd2d725c734d3e0f2926128f770e 100644
--- a/drivers/net/phy/smsc.c
+++ b/drivers/net/phy/smsc.c
@@ -537,14 +537,45 @@ static int lan874x_set_wol(struct phy_device *phydev,
 		}
 	}
 
-	rc = phy_write_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR,
-			   val_wucsr);
+	/* Enable wakeup on PHY device if at least one WoL feature is configured */
+	device_set_wakeup_enable(&phydev->mdio.dev, !!(val_wucsr & MII_LAN874X_PHY_WOL_MASK));
+
+	rc = phy_write_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR, val_wucsr);
 	if (rc < 0)
 		return rc;
 
 	return 0;
 }
 
+static int smsc_phy_suspend(struct phy_device *phydev)
+{
+	if (!phydev->wol_enabled)
+		return genphy_suspend(phydev);
+
+	return 0;
+}
+
+static int smsc_phy_resume(struct phy_device *phydev)
+{
+	int rc;
+
+	if (!phydev->wol_enabled)
+		return genphy_resume(phydev);
+
+	rc = phy_read_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR);
+	if (rc < 0)
+		return rc;
+
+	if (!(rc & MII_LAN874X_PHY_WOL_STATUS_MASK))
+		return 0;
+
+	dev_info(&phydev->mdio.dev, "Woke up from LAN event.\n");
+	rc = phy_write_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR,
+			   rc | MII_LAN874X_PHY_WOL_STATUS_MASK);
+
+	return rc;
+}
+
 static int smsc_get_sset_count(struct phy_device *phydev)
 {
 	return ARRAY_SIZE(smsc_hw_stats);
@@ -673,6 +704,9 @@ int smsc_phy_probe(struct phy_device *phydev)
 
 	phydev->priv = priv;
 
+	if (phydev->drv->set_wol)
+		device_set_wakeup_capable(&phydev->mdio.dev, true);
+
 	/* Make clk optional to keep DTB backward compatibility. */
 	refclk = devm_clk_get_optional_enabled_with_rate(dev, NULL,
 							 50 * 1000 * 1000);
@@ -875,8 +909,8 @@ static struct phy_driver smsc_phy_driver[] = {
 	.set_wol	= lan874x_set_wol,
 	.get_wol	= lan874x_get_wol,
 
-	.suspend	= genphy_suspend,
-	.resume		= genphy_resume,
+	.suspend	= smsc_phy_suspend,
+	.resume		= smsc_phy_resume,
 } };
 
 module_phy_driver(smsc_phy_driver);
diff --git a/include/linux/smscphy.h b/include/linux/smscphy.h
index 1a6a851d2cf80d225bada7adeb79969e625964bd..cdf266960032609241afc8316da23f1c4834bfee 100644
--- a/include/linux/smscphy.h
+++ b/include/linux/smscphy.h
@@ -65,6 +65,8 @@ int smsc_phy_probe(struct phy_device *phydev);
 #define MII_LAN874X_PHY_WOL_WUEN		BIT(2)
 #define MII_LAN874X_PHY_WOL_MPEN		BIT(1)
 #define MII_LAN874X_PHY_WOL_BCSTEN		BIT(0)
+#define MII_LAN874X_PHY_WOL_MASK		GENMASK(4, 0)
+#define MII_LAN874X_PHY_WOL_STATUS_MASK		GENMASK(7, 4)
 
 #define MII_LAN874X_PHY_WOL_FILTER_EN		BIT(15)
 #define MII_LAN874X_PHY_WOL_FILTER_MCASTTEN	BIT(9)

-- 
2.35.3


