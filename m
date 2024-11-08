Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9D0D5C0CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pw79i7q7e/DZSw3U8kbl0tezb776Kpjc5WLXApNdfFU=; b=nY3bFEri9P14e76WTsQ1cVB+my
	L5wgPTkaoncVPrGMnxm2SdYv6DwEZqXtN16tz7SYq8soCW9MSGtk0M4pmYbT/FElcvyNfcrWuh3sW
	e8agO8kkMawWwYIEwXLyWtXkVhk7sFe444nENgIViXnoSjsxxP67/WDH50lAAUlxeMVor06NYNUO+
	ODmo4kCvQNXkgzaSleBx4oSqMWzdtw7JCx4E1/29z8R1P75wkR1lahAaE0uY9BVdrpny8sqaGrSlu
	cMqQ17jBJXS5MO3UN5SWEwqftpwPEiBfvH9jQq9DDP602cM+Ur6qpqvc4SdJJd9z5Ah7R9+H6Lk/D
	WeWW3Z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pl7-0000000AobT-0uUA;
	Fri, 08 Nov 2024 14:14:45 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PNO-0000000AkVW-48It
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073815; x=1762609815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pw79i7q7e/DZSw3U8kbl0tezb776Kpjc5WLXApNdfFU=;
  b=NxjYWO2w6mAJL1R/vz1vXsT+vZeTEkV2l8MHfk4C1ksR23+R7rE95R43
   rMAMDdBYj6Bfve4jkGIhae7hXmCAaBVbV+hYprE2qPGHXWRwePW4HyJDT
   FbE2ZKaZPYrCy7TYLdCmXhoP45NiFkvUA4GAq+wMh1hx1tmhGClaUeHX/
   K/kMxwAw3dUOufVSHWETF3dj2yiHDVoSBgpohp6+seafqY+959TFpqQBz
   ZFKUNyk9wxXoj3jBVk5wjYMQGLS6t3t8P0aq+hiFkD5yGqrWMdtWpEIZT
   dLWymhPPer6st4gFCDbxBk5VV+pS69kzVB5C6Gw5qxLHM/Nm//lDY/3x8
   w==;
X-CSE-ConnectionGUID: NPvH8mAiR6Cj2k7Yy8qn4A==
X-CSE-MsgGUID: wnH/NjH5SnqZiNaRa8xYcQ==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936935"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:50:13 +0100
X-CheckPoint: {672E1715-35-90CD5875-E0265C0B}
X-MAIL-CPID: 34381C6652A21CF8C6F764790CF3E0DB_3
X-Control-Analysis: str=0001.0A682F16.672E1716.003E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E07651655C9;
	Fri,  8 Nov 2024 14:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073809; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Pw79i7q7e/DZSw3U8kbl0tezb776Kpjc5WLXApNdfFU=;
	b=BsvMjynvs4PQUPLEKwTggd0gUADAGNR4v+/8IAAInm2y+ds6SDtnbXajvkDBaukqRQr2Ro
	IlutHWZ+I1X5fIh8xDUWzxNsSS/kgfvghGQeW2aO4aAxVbE3AoB3qwviDtORVZxGilZdKV
	+NHouin7qHWKby/cNBYr/hq784fkopXVwOVB7lECyCvq78zbOHEDKO0PWFZ4zR35p5NJpe
	/BT7+j5tTypujzSUivNyWPm1QzqXGzNW/TtCB+/ntcH5Vogn2CUR9HisHF9lCDW5UKKrJe
	0EmkLa5cYmdaDLUJ5DF4MhG2zi8TJtpuqLIlybEEQc8Abgt9pOUobwn/XUYoNQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Jo=C3=A3o=20Rodrigues?= <jrodrigues@ubimet.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] ARM: dts: imx7[d]-mba7: add Ethernet PHY IRQ support
Date: Fri,  8 Nov 2024 14:49:25 +0100
Message-Id: <20241108134926.1324626-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055015_444036_C3D1CA30 
X-CRM114-Status: GOOD (  11.62  )
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

The regulator-fec*-pwdn regulators were used to deassert the PWDN signal
of ethernet PHY, e.g. not powering. This is not necessary as the line
has a pull-up already.
Instead of the combo pad of the PHY for IRQ support.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 23 ++---------------------
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts |  3 ++-
 2 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 304281681abfe..576a7df505d3b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -87,26 +87,6 @@ iio-hwmon {
 			      <&adc2 0>, <&adc2 1>, <&adc2 2>, <&adc2 3>;
 	};
 
-	reg_fec1_pwdn: regulator-fec1-pwdn {
-		compatible = "regulator-fixed";
-		regulator-name = "PWDN_FEC1";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	reg_fec2_pwdn: regulator-fec2-pwdn {
-		compatible = "regulator-fixed";
-		regulator-name = "PWDN_FEC2";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-		gpio = <&gpio2 31 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "VBUS_USBOTG1";
@@ -231,7 +211,6 @@ &fec1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet1>;
 	phy-mode = "rgmii-id";
-	phy-supply = <&reg_fec1_pwdn>;
 	phy-handle = <&ethphy1_0>;
 	fsl,magic-packet;
 	status = "okay";
@@ -252,6 +231,8 @@ ethphy1_0: ethernet-phy@0 {
 			reset-gpios = <&gpio7 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <1000>;
 			reset-deassert-us = <500>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
index 0443faa3dfae4..e3ee16f1aaa96 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
@@ -21,7 +21,6 @@ &fec2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet2>;
 	phy-mode = "rgmii-id";
-	phy-supply = <&reg_fec2_pwdn>;
 	phy-handle = <&ethphy2_0>;
 	fsl,magic-packet;
 	status = "okay";
@@ -42,6 +41,8 @@ ethphy2_0: ethernet-phy@0 {
 			reset-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <1000>;
 			reset-deassert-us = <500>;
+			interrupt-parent = <&gpio2>;
+			interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
 		};
 	};
 };
-- 
2.34.1


