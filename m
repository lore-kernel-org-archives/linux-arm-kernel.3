Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073D1E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6w46sUlO/HwPRoKBSDtCvJLWeyuZyzCa6HUSy5lrDc=; b=IyUpxeA6P73tqURTwBarwXJp8A
	Jv7DM3lo3gE7+kXAl6z8DfkvYRjuwfBh85CNsOBM1rx1TyMx3sVZHPsVCCJdR6ogyPpXJKUYESqNt
	9uH0iFgcie4voxgGLmbsQpbWl+H5vYbKiNEe8HCI4MadxRcyt2UJM6Zq7eqBhOO18avHf7KzW8AgC
	XnVOyF0RU6/Hw7QslxR1s95Jf9kVyyEDsMWU6pQWWDER1pkv9PMlQFH+ODjNJGUhXvBLxycDwBe+i
	9N31b4zB7njl282bReJbboSyn6W/UpZzM03LjN9/zFaQHtfxG0haStEieXGwcN+7TL1bx7OLzYP5o
	4J3qbMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOB2H-000000016Q5-2iLz;
	Thu, 19 Dec 2024 07:33:29 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAuu-000000014pa-0uzO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 07:25:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAuc-00064Q-2D; Thu, 19 Dec 2024 08:25:34 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAua-004AOC-2u;
	Thu, 19 Dec 2024 08:25:33 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAub-00GenW-1g;
	Thu, 19 Dec 2024 08:25:33 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 19 Dec 2024 08:25:27 +0100
Subject: [PATCH 03/10] arm64: dts: imx8mp-skov: use I2C5 for DDC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-skov-dt-updates-v1-3-38bf80dc22df@pengutronix.de>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
In-Reply-To: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_232552_287871_17E9FFCD 
X-CRM114-Status: GOOD (  13.19  )
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

The HDMI DDC pads can be muxed either to an i.MX I2C controller or
to a limited I2C controller within the Designware HDMI bridge.

So far we muxed the pads to the HDMI bridge, but the i.MX I2C controller
is the better choice:

  - We use DDC/CI commands for display brightness configuration, but the
    Linux driver refuses[1] transfers to/from address 0x37, because the
    controller doesn't support multi-byte requests.

  - The driver doesn't support I2C bus recovery, but we need that,
    because some HDMI panels used with the board can be flaky.

As the i.MX I2C controller doesn't have either of these limitations,
let's make use of it instead.

[1]: https://lore.kernel.org/all/20190722181945.244395-1-mka@chromium.org/

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts   | 26 ++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
index c1ca69da3cb8..206116be8166 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
@@ -9,12 +9,34 @@ / {
 	compatible = "skov,imx8mp-skov-revb-hdmi", "fsl,imx8mp";
 };
 
+&i2c5 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c5>;
+	pinctrl-1 = <&pinctrl_i2c5_gpio>;
+	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL		0x1c3
-			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA		0x1c3
 			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD			0x19
 		>;
 	};
+
+	pinctrl_i2c5: i2c5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__I2C5_SCL			0x400001c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__I2C5_SDA			0x400001c2
+		>;
+	};
+
+	pinctrl_i2c5_gpio: i2c5gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__GPIO3_IO26			0x400001c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27			0x400001c2
+		>;
+	};
 };

-- 
2.39.5


