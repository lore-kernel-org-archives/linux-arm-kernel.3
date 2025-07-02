Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2645AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 21:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnhMLudv+q/D/hSONBTmJZVo154ineWrRQ/21yucmkM=; b=CHH1KXpuIujHKBlH0dYrvSAs9N
	T9NlMTw19OplT+FRxbd8uHcU/fDAa2gl+FtWW7UYC5482xy6jC5NVul3BKGox/2ptnvKw5lZEgMaa
	coTO8J4FQN2a4YWTrXt8lHyK26LmcztlCaE2CJ5r7gJZOCrjjPFOGYUMWeza2EVOmPf6lwiW1I2mi
	QYE8PVP2b/uoEZwuG+6giMVvK2fv15O19bQyBQgy3upc4oDXAbVJS6SKPl1CQcVqYxBPf3qKUJDYx
	bsY4PIq3Z9x/waU+9iCaqWnot9mbTdDPGqR80hagtmMA3/QfoRoEg8gcSL7eZFqapDv6T+nqst49+
	xcFdkSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5MF-00000009dcR-24wb;
	Wed, 02 Jul 2025 21:51:11 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5Js-00000009dR6-3FuS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 21:48:46 +0000
Received: (wp-smtpd smtp.wp.pl 33642 invoked from network); 2 Jul 2025 23:48:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1751492915; bh=FnhMLudv+q/D/hSONBTmJZVo154ineWrRQ/21yucmkM=;
          h=From:To:Subject;
          b=rwSUEglHOPVgT4/GIJwGZNEcF1GJVdBKcJRwuyU/NIAVHU+i9oiuZESyRE3iWDxNl
           j8AFXvIL3d4Isad15BsyOOdhoEQvJphwlfFmdkoVM1RmoW33Kq0VKS2q8v3aMtEMnI
           Wmnr2eMYaNNoFCeGcgxu7gwMsYmeGmRnv8VBOPk0Jp35Dfx9dlNH2hUqWu3h3/TJ6U
           eXH/Q1Li32civ9iShojvR47LYWdB2lYkmr+uUnrnbda5NcU/shWYGZuh2izRRpjbCJ
           v6rnKJ4Ddq9zqbxeZGigWQlt32R1fxY+veqdd+75p6sEYSgau8VM2Yc/PFBU3bYXFC
           YwCiyif19cQ9A==
Received: from 83.5.239.54.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.239.54])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <jic23@kernel.org>; 2 Jul 2025 23:48:35 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	olek2@wp.pl,
	zhiyong.tao@mediatek.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: mediatek: add thermal sensor support on mt7981
Date: Wed,  2 Jul 2025 23:48:30 +0200
Message-Id: <20250702214830.255898-3-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702214830.255898-1-olek2@wp.pl>
References: <20250702214830.255898-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: b00664f4f4ac2cf6bacf908830148b39
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [0YOR]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_144845_282307_A7122DB5 
X-CRM114-Status: GOOD (  10.25  )
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

The temperature sensor in the MT7981 is same as in the MT7986.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 32 ++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 5cbea9cd411f..759b9e8059d9 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -76,7 +76,7 @@ watchdog: watchdog@1001c000 {
 			#reset-cells = <1>;
 		};
 
-		clock-controller@1001e000 {
+		apmixedsys: clock-controller@1001e000 {
 			compatible = "mediatek,mt7981-apmixedsys";
 			reg = <0 0x1001e000 0 0x1000>;
 			#clock-cells = <1>;
@@ -184,6 +184,32 @@ spi@1100b000 {
 			status = "disabled";
 		};
 
+		thermal@1100c800 {
+			compatible = "mediatek,mt7981-thermal",
+				     "mediatek,mt7986-thermal";
+			reg = <0 0x1100c800 0 0x800>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_THERM_CK>,
+				 <&infracfg CLK_INFRA_ADC_26M_CK>;
+			clock-names = "therm", "auxadc";
+			nvmem-cells = <&thermal_calibration>;
+			nvmem-cell-names = "calibration-data";
+			#thermal-sensor-cells = <1>;
+			mediatek,auxadc = <&auxadc>;
+			mediatek,apmixedsys = <&apmixedsys>;
+		};
+
+		auxadc: adc@1100d000 {
+			compatible = "mediatek,mt7981-auxadc",
+				     "mediatek,mt7986-auxadc",
+				     "mediatek,mt7622-auxadc";
+			reg = <0 0x1100d000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_ADC_26M_CK>;
+			clock-names = "main";
+			#io-channel-cells = <1>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@11d00000 {
 			compatible = "mediatek,mt7981-pinctrl";
 			reg = <0 0x11d00000 0 0x1000>,
@@ -211,6 +237,10 @@ efuse@11f20000 {
 			reg = <0 0x11f20000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			thermal_calibration: thermal-calib@274 {
+				reg = <0x274 0xc>;
+			};
 		};
 
 		clock-controller@15000000 {
-- 
2.39.5


