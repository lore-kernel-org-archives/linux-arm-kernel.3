Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4892EC01B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOEkSlTsUnJOWH6di5YZ2og4W/BSsECGWZ5mBPhB2us=; b=rLkvxNvsP2aHHbyx6fs1kfPuWH
	cVk5FT0nMcsD6oJHLEVCpXtSqs4LocL/ZxyYXFQ2PUeuAU1VxOuWXS3V4R/5Lcj1ZIP6qHrNta7Ed
	MA99xQiUyda4hXZreJ41fMssMZFKfKh0+hPrXw5zax0zON+x5ErLSb96/oN5/r1BJwYnc1v68HLkt
	41ygjkcCt2Vd4lvqttzzjnq7kYKmvOQmEK7VtrGj36x2l0PGvTkf+WaZ2ACpskmEWEBmp+LKBrf/h
	tTI+0o3X5SSQ82vIhyBSAYZGghfMMeyfJaM5RX8v5i9JyGBQgFlwOOn20HsGpYAt2sX/GhY7Vz+wz
	whJ62QVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3j-0000000GQxl-15ED;
	Mon, 23 Mar 2026 09:58:55 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3K-0000000GQY4-0G7j;
	Mon, 23 Mar 2026 09:58:31 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774259903;
	bh=OHhaocqrcyvsfcC4nwRCQzXz7HSpal5P8Pl4jRGYs5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OUTZmbQQlN/RqGWdkrOHanbOL8AdBU2wDAOdjiUgc/It7IDE4YwAAr7QokoV3NLR7
	 p2P/PM8l+pXNMxPkqnOBglk/Supq9KRFLr271a73gZQ0T4PXBcVUVRMdXqvS9OZxht
	 5nfc0l1InUaIBfb1pu0xrWoNYCK1pNatSSJ8Y4oU=
Date: Mon, 23 Mar 2026 10:55:32 +0100
Subject: [PATCH v3 7/9] arm64: dts: amlogic: t7: khadas-vim4: Add SDIO
 power sequence and WiFi clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-add-emmc-t7-vim4-v3-7-5159d90a984c@aliel.fr>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774259895; l=1444;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=OHhaocqrcyvsfcC4nwRCQzXz7HSpal5P8Pl4jRGYs5Q=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA2+JhnbgwDiwkQMZUUK1kdfqFB6gHx/VO/wHVQT2TwQo4rpGN3NvKqU74eiBj0Fbt6jWjlYGAc
 Sh7XzGYO9TQg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025830_260058_5C543F33 
X-CRM114-Status: UNSURE (   7.46  )
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

Add the SDIO power sequence node using mmc-pwrseq-simple and a
32.768kHz PWM-based clock required by the Wi-Fi module.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 2450084d37642..770f06b0b16c7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -67,6 +67,15 @@ sd_3v3: regulator-sdcard-3v3 {
 		regulator-always-on;
 	};
 
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <500>;
+		power-off-delay-us = <200000>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
 	vcc5v: regulator-vcc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC5V";
@@ -135,6 +144,19 @@ vddio_c: regulator-gpio-c {
 		states = <1800000 1
 			  3300000 0>;
 	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+			pwms = <&pwm_ab 0 30518 0>;
+	};
+};
+
+&pwm_ab {
+	status = "okay";
+	pinctrl-0 = <&pwm_a_pins>;
+	pinctrl-names = "default";
 };
 
 &uart_a {

-- 
2.49.0


