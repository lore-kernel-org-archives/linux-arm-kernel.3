Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F80F4BB9E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga10eSgFE90ZtSvOsQUcopfNpkOfowVKw1XZ4wXDdCM=; b=wqkow+OgMAn9b3cH/V6W0FGRj1
	Kc/5LRux2qBr8uETWPyaGDhsRHJ4l3R/A9iOJUwckPciIkTPMaIw5vV7a2sT0ddduqTuW0QucQ86y
	npxLLLOhEiS9I750b+YbAy/LtuImFdbFWafngZCrYK/lFK+ElMuDdhNAl0Au3cbwFeMS3HcJZHlwj
	BO1ViVieqjmSA2Kr/HALUvCJz73Dg1N8eC5fOerbJcfIE5coP4zaSr4dDt4JugPAKzyXGvkIxA+qh
	gwnWWSh8hgX1ExYSVp4iGouoRjXQnlgJq8ImablPMJT/rpscpIsDGy7lUQKr+1GwFPICwFn0Lqq9P
	dwaTJNcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCc4-00000003ryy-3aY9;
	Wed, 25 Feb 2026 10:59:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCc2-00000003ryN-1L3A;
	Wed, 25 Feb 2026 10:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ga10eSgFE90ZtSvOsQUcopfNpkOfowVKw1XZ4wXDdCM=; b=bZQfow/vi7pdFWOl/ITz9NlKxT
	aPIQ4Nc+zafMdUFWqbqwe7vzDE/yfiDweu0EQjca7ABawF104R0HybfM2KBqI05evdZYCRb98uDJm
	UEk+d33k3k2znQRRIOpgyXXUWEVgbacqv4YBeJb4/kzo5TUdimo0TeIWXu3ikIQyBDg21zQ64Iiiz
	K8ymEyol/Th1oW1AIpDgAaG89RKOeEXGtngt1pl4BLRbvZaaXmQELfq4we3jY8VaUWoVcUAur+S1N
	Rok8C9bRzDmA92JbnokqNDD4BX85Ywfnp5dY39JFJdv7S7p2dQsIySYk+4mkaHp5B/NMN7HczYjpm
	ElOUlZEg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44156 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvCbu-000000006Uw-39e5;
	Wed, 25 Feb 2026 10:59:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvCbt-0000000ArKy-3Wog;
	Wed, 25 Feb 2026 10:59:17 +0000
In-Reply-To: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 2/8] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvCbt-0000000ArKy-3Wog@rmk-PC.armlinux.org.uk>
Date: Wed, 25 Feb 2026 10:59:17 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_025926_356127_6217DF75 
X-CRM114-Status: GOOD (  13.79  )
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

qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
using SGMII, 1000BASE-X and 2500BASE-X.

Add an implementation of the .set_mode() method, which can be used
instead of or as well as the .set_speed() method. The Ethernet
interface modes mentioned above all have a fixed data rate, so
setting the mode is sufficient to fully specify the operating
parameters.

Add an implementation of the .validate() method, which will be
necessary to allow discovery of the SerDes capabilities for platform
independent SerDes support in the stmmac network driver.

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

Resending as netdev (and others) were missing.

 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 43 +++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 5b1c82459c12..4ea3dce7719f 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -7,6 +7,7 @@
 #include <linux/ethtool.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -286,6 +287,37 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qcom_dwmac_sgmii_phy_speed(enum phy_mode mode, int submode)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	if (submode == PHY_INTERFACE_MODE_SGMII ||
+	    submode == PHY_INTERFACE_MODE_1000BASEX)
+		return SPEED_1000;
+
+	if (submode == PHY_INTERFACE_MODE_2500BASEX)
+		return SPEED_2500;
+
+	return -EINVAL;
+}
+
+static int qcom_dwmac_sgmii_phy_set_mode(struct phy *phy, enum phy_mode mode,
+					 int submode)
+{
+	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
+	int speed;
+
+	speed = qcom_dwmac_sgmii_phy_speed(mode, submode);
+	if (speed < 0)
+		return speed;
+
+	if (speed != data->speed)
+		data->speed = speed;
+
+	return qcom_dwmac_sgmii_phy_calibrate(phy);
+}
+
 static int qcom_dwmac_sgmii_phy_set_speed(struct phy *phy, int speed)
 {
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
@@ -296,10 +328,21 @@ static int qcom_dwmac_sgmii_phy_set_speed(struct phy *phy, int speed)
 	return qcom_dwmac_sgmii_phy_calibrate(phy);
 }
 
+static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
+					 int submode,
+					 union phy_configure_opts *opts)
+{
+	int ret = qcom_dwmac_sgmii_phy_speed(mode, submode);
+
+	return ret < 0 ? ret : 0;
+}
+
 static const struct phy_ops qcom_dwmac_sgmii_phy_ops = {
 	.power_on	= qcom_dwmac_sgmii_phy_power_on,
 	.power_off	= qcom_dwmac_sgmii_phy_power_off,
+	.set_mode	= qcom_dwmac_sgmii_phy_set_mode,
 	.set_speed	= qcom_dwmac_sgmii_phy_set_speed,
+	.validate	= qcom_dwmac_sgmii_phy_validate,
 	.calibrate	= qcom_dwmac_sgmii_phy_calibrate,
 	.owner		= THIS_MODULE,
 };
-- 
2.47.3


