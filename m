Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD2FFC5910
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N00DrG/8Wkhoc2JsXgUgGdCKtmOp43QPxZbl+PdaFhM=; b=ijlNdPwh033pEAaFDRxPuEj7x0
	MH9TTGtTSFF0ogzsNMgfPuv7vuSuU1dnGkM7OGXpBs22SriQLs6Ai1JHkcJldnpQF3gSAqojB+3ny
	4pqQ4OrlQu5Fu3zZS8i5HdXqI1v7Q8FBu8SgfZullPHWdv0vv4m5rDrqiRccJsD8+bKitLM26iU3I
	Dzjb7dVBfXx6jIbzlanxt49F16PPDYnEU4esltOSYT6DS1ow+d0aHqPFYQZP3JOIHtrSjqlFPqNJW
	duEjyxPPYQ9lYKHWM8wg6W5aiksCP8UgXrrMwD1XbqIKmo3NE0eFCOUL0xp7Qr5xd3NWSXDtEKh7v
	3KH8/lcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWwX-00000005fyL-20hV;
	Thu, 26 Feb 2026 08:41:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWwV-00000005fva-1ztZ;
	Thu, 26 Feb 2026 08:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N00DrG/8Wkhoc2JsXgUgGdCKtmOp43QPxZbl+PdaFhM=; b=TKeTWMAGT1nNSGZzbwD4/sKn9/
	h16t2uwOavFqU4wQFaQWox1VAAaifSikP4u6XEW4a7k8EM1pFGo+Lehr+Xef7QEAEqNAWbDkUf1T9
	Av4ABI7mAc6Ga3F22jXVVHv+jCgNRVrCKPCKRVi/RugOFebX2zQH0MFSHYTIPlZ4klOt/MqiQ3BKQ
	vg2wixVdGnhv04hHWQzxtZ0XtznRxbcN3BS+MvRgkAKCNiiVLxf2T7iwoxrtzXO/0L75uz8Xy7LVy
	au+HiPmtgRteJ62UgCENBhJZtHHfDiKWRm/Ek24qy5IsVeGVd6O+GaZwdjjL9wCzuIdQG2H+lR+bx
	cRVtH2Dg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39688 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvWwN-000000007dJ-2HLI;
	Thu, 26 Feb 2026 08:41:47 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvWwL-0000000AtKO-3Qix;
	Thu, 26 Feb 2026 08:41:45 +0000
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
Subject: [PATCH RESEND net-next 5/8] phy: qcom-sgmii-eth: use PHY interface
 mode for SerDes settings
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvWwL-0000000AtKO-3Qix@rmk-PC.armlinux.org.uk>
Date: Thu, 26 Feb 2026 08:41:45 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_004155_513025_E307D391 
X-CRM114-Status: GOOD (  18.00  )
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

As established in the previous commit, using SPEED_1000 and SPEED_2500
does not make sense for a SerDes due to the PCS encoding that is used
over the SerDes link, which inflates the data rate at the SerDes. Thus,
the use of these constants in a SerDes driver is incorrect.

Since qcom-sgmii-eth no longer implements phy_set_speed(), but instead
uses the PHY interface mode passed via the .set_mode() method, convert
the driver to use the PHY interface mode internally to decide whether
to configure the SerDes for 1.25Gbps or 3.125Gbps mode.

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 41 ++++++++++++-----------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index dcfdb7d0e8ea..58ff15601206 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -29,7 +29,7 @@
 struct qcom_dwmac_sgmii_phy_data {
 	struct regmap *regmap;
 	struct clk *refclk;
-	int speed;
+	phy_interface_t interface;
 };
 
 static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
@@ -223,15 +223,18 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
 	struct device *dev = phy->dev.parent;
 
-	switch (data->speed) {
-	case SPEED_10:
-	case SPEED_100:
-	case SPEED_1000:
+	switch (data->interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+		/* 1.25Gbps mode */
 		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
 		break;
-	case SPEED_2500:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		/* 3.125Gbps mode */
 		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
 		break;
+	default:
+		return -EINVAL;
 	}
 
 	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
@@ -287,17 +290,15 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qcom_dwmac_sgmii_phy_speed(enum phy_mode mode, int submode)
+static int qcom_dwmac_sgmii_phy_interface(enum phy_mode mode, int submode)
 {
 	if (mode != PHY_MODE_ETHERNET)
 		return -EINVAL;
 
 	if (submode == PHY_INTERFACE_MODE_SGMII ||
-	    submode == PHY_INTERFACE_MODE_1000BASEX)
-		return SPEED_1000;
-
-	if (submode == PHY_INTERFACE_MODE_2500BASEX)
-		return SPEED_2500;
+	    submode == PHY_INTERFACE_MODE_1000BASEX ||
+	    submode == PHY_INTERFACE_MODE_2500BASEX)
+		return submode;
 
 	return -EINVAL;
 }
@@ -306,14 +307,14 @@ static int qcom_dwmac_sgmii_phy_set_mode(struct phy *phy, enum phy_mode mode,
 					 int submode)
 {
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
-	int speed;
+	int interface;
 
-	speed = qcom_dwmac_sgmii_phy_speed(mode, submode);
-	if (speed < 0)
-		return speed;
+	interface = qcom_dwmac_sgmii_phy_interface(mode, submode);
+	if (interface < 0)
+		return interface;
 
-	if (speed != data->speed)
-		data->speed = speed;
+	if (interface != data->interface)
+		data->interface = interface;
 
 	return qcom_dwmac_sgmii_phy_calibrate(phy);
 }
@@ -322,7 +323,7 @@ static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
 					 int submode,
 					 union phy_configure_opts *opts)
 {
-	int ret = qcom_dwmac_sgmii_phy_speed(mode, submode);
+	int ret = qcom_dwmac_sgmii_phy_interface(mode, submode);
 
 	return ret < 0 ? ret : 0;
 }
@@ -356,7 +357,7 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	data->speed = SPEED_10;
+	data->interface = PHY_INTERFACE_MODE_SGMII;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
-- 
2.47.3


