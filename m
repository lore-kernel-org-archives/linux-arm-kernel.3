Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93FBFC5910
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htvj62EzmrJgiWmmgeO4BMvKDLm4STF+WzVVUyzOJaU=; b=nlAytzDrGhIhSDpetI1G4b2WS1
	dthlPcN66ypjmYZVkI3+JjZSswX+4F6fGYrB2bV3p5sgxBvzz/gIeNOi6ns/pBsbrK1INBGr9PuFE
	ytcgJ8vfnsMqIfiEJAuce3kAS1eUYhPZh1hKqno12EMoLv/ux2JR84fmjScuC2H757/jHonHiQtFz
	gfNMeaubOjP/9ckhq5UE0YUlK8a4sF2c3IvU96J95YOomAlk23ATvvc9zRBuLLpmRnsC9ouXgjS6c
	CmtlLuCiox+Tyb5t+EY5OjdmEQo5HAGjsaafCB8MagCHSeNa+hmkP1xrBrVXQAfb9H55ma4SpvZ2c
	chcaG7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWwh-00000005g5M-43YP;
	Thu, 26 Feb 2026 08:42:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWwf-00000005g1x-2ntG;
	Thu, 26 Feb 2026 08:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=htvj62EzmrJgiWmmgeO4BMvKDLm4STF+WzVVUyzOJaU=; b=HigRikSNuyFnh2xNX8S9ILEGU4
	Q4OxvsGzcW4WPiPcmzZ+vOEzlneCq8YCwmuXyvdWDruATN44hitRaVqt12CXd5K6VUrz529wOuN1f
	4twtLjb6wMEmDR5O+gp+cQJ4GDY4mhSM9t+LjXgoGHL16DItePwSkQXAxsgJK5UiTjQdm+acDubEX
	JPsShOTteTWjXUXuDYrYRQ2eH6cWp9dMGifBcz5ylhqQ2QJXE0GyGU5+g9Twhx+YnsQLIgT11Haja
	QnwDt8oIW46+70hHu7xDX90rJ+BJL7QjHlzbtr5y5vUAJXSYitwucte/a1ne7wQbe/gIoF03YUz4t
	FjW5o4uA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53004 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvWwS-000000007de-3vHz;
	Thu, 26 Feb 2026 08:41:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvWwQ-0000000AtKU-3sMG;
	Thu, 26 Feb 2026 08:41:50 +0000
In-Reply-To: <aaAHD_wWv2xCKntW@shell.armlinux.org.uk>
References: <aaAHD_wWv2xCKntW@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RESEND net-next 6/8] phy: qcom-sgmii-eth: remove
 qcom_dwmac_sgmii_phy_interface()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvWwQ-0000000AtKU-3sMG@rmk-PC.armlinux.org.uk>
Date: Thu, 26 Feb 2026 08:41:50 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_004205_705864_12E92DE2 
X-CRM114-Status: GOOD (  10.91  )
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

Now that qcom_dwmac_sgmii_phy_interface() only serves to validate the
passed interface mode, combine it with qcom_dwmac_sgmii_phy_validate(),
and use qcom_dwmac_sgmii_phy_validate() to validate the mode in
qcom_dwmac_sgmii_phy_set_mode().

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 27 +++++++++--------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 58ff15601206..6332ff291fdf 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -290,7 +290,9 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qcom_dwmac_sgmii_phy_interface(enum phy_mode mode, int submode)
+static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
+					 int submode,
+					 union phy_configure_opts *opts)
 {
 	if (mode != PHY_MODE_ETHERNET)
 		return -EINVAL;
@@ -298,7 +300,7 @@ static int qcom_dwmac_sgmii_phy_interface(enum phy_mode mode, int submode)
 	if (submode == PHY_INTERFACE_MODE_SGMII ||
 	    submode == PHY_INTERFACE_MODE_1000BASEX ||
 	    submode == PHY_INTERFACE_MODE_2500BASEX)
-		return submode;
+		return 0;
 
 	return -EINVAL;
 }
@@ -307,27 +309,18 @@ static int qcom_dwmac_sgmii_phy_set_mode(struct phy *phy, enum phy_mode mode,
 					 int submode)
 {
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
-	int interface;
+	int ret;
 
-	interface = qcom_dwmac_sgmii_phy_interface(mode, submode);
-	if (interface < 0)
-		return interface;
+	ret = qcom_dwmac_sgmii_phy_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
 
-	if (interface != data->interface)
-		data->interface = interface;
+	if (submode != data->interface)
+		data->interface = submode;
 
 	return qcom_dwmac_sgmii_phy_calibrate(phy);
 }
 
-static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
-					 int submode,
-					 union phy_configure_opts *opts)
-{
-	int ret = qcom_dwmac_sgmii_phy_interface(mode, submode);
-
-	return ret < 0 ? ret : 0;
-}
-
 static const struct phy_ops qcom_dwmac_sgmii_phy_ops = {
 	.power_on	= qcom_dwmac_sgmii_phy_power_on,
 	.power_off	= qcom_dwmac_sgmii_phy_power_off,
-- 
2.47.3


