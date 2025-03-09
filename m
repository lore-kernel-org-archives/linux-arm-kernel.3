Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C646C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s04pQk8rE0esUEfzS9Lzjv0hhk+AvT2AINnV/GWmDis=; b=Z1f1DeookXpJiDWA+xIEU1uilb
	JnlK6baZ1peM0AURj1PI1DnRn0sYqRWziNRx1yiGvVhTWOixtzaUl2rQVi0eStH65FPBFRT+uIjlu
	nuvSwMC07E7w3h26w2wUrzlEB573liV/cXnau4V1M6sr2BSGqf1XI4SVcQG70Dv63stLqmZTjE5rT
	0WsDsdDn5ASoi91nqnoXyI4Y1RpT2khGZHrNAt8cmEnT3YzQiDvDPJcq/pG8zaj8Omp0yV5957rCK
	y9kznOekfT+O1C1Ms2GEfpW0TZuocUCkJx6KzrG2ZQxrKur/r0Pal4IxIriM1CsXDjf0IoBBvDyAL
	cvo2loQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLmE-000000010j3-2XWs;
	Sun, 09 Mar 2025 18:53:30 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLHM-00000000xS8-2Tx9;
	Sun, 09 Mar 2025 18:21:38 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1E3E1120009;
	Sun,  9 Mar 2025 21:21:35 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1E3E1120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544495;
	bh=s04pQk8rE0esUEfzS9Lzjv0hhk+AvT2AINnV/GWmDis=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Nr6EjHG2LsM2hGMYfBirsyqFO1ws8KgiQ9vzcWZqJQXyhVmNNrxCsfNyptOG06HwU
	 ZON41RN3mVrPZ69V+Y/fv1b96YL+neHXCHhrewSJfDmeTW+DWleS8ELhmsrCv5gO2J
	 vEKF/F+dJrlnuPUeTDRga7HIxv+uIyh6JCA32VvNho0WWXPbtr2U6nv/7bt7OH5c9R
	 eicROhIJ8pIIDdMd1D1L+ijl8GQ/7Z0bKbRqUWV0uHmbGdLVq65jufS+Ju/Hzwao3X
	 402eII1lvNcx5tugomwdpvLSTWzW9iQS7Pdsyf8lKMxlgcmU4NrCBRhxXK2y7eNFxP
	 zdMSgCYKO6Hcg==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 21:21:34 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh@kernel.org>
Subject: [PATCH v2 6/6] arm64: dts: ad402: enable audio
Date: Sun, 9 Mar 2025 21:21:27 +0300
Message-ID: <20250309182127.1322890-7-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309182127.1322890-1-jan.dakinevich@salutedevices.com>
References: <20250309182127.1322890-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.252]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 191599 [Mar 09 2025]
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_smtp_not_equal_from}, sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/03/09 17:28:00 #27692143
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_112137_073047_E116DF24 
X-CRM114-Status: GOOD (  11.63  )
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

 * playback to speaker

   - setup:
     $ amixer set "FRDDR_A SINK 1 SEL" "OUT 0"
     $ amixer set "FRDDR_A SRC 1 EN" "on"
     $ amixer set "TDMOUT_A SRC SEL" "IN 0"
     $ amixer set "TOACODEC Source" "I2S A"
     $ amixer set "TOACODEC Lane Select" "0"
     $ amixer set "TOACODEC EN" "on"
     $ amixer set "ACODEC" "70%"
     $ amixer set "ACODEC Playback Channel Mode" "Mono"

   - usage:
     $ aplay -D hw:0,0 -f S16_LE -r 48000 /path/to/sample.wav

 * capture from digital mics

   - setup:
     $ amixer set "TODDR_B SRC SEL" "IN 4"

   - usage:
     $ arecord -D hw:0,1 -f S32_LE -r 48000 -c 2 -t wav /path/to/sample.wav

 * capture from analog mics

   - setup:
     $ amixer set "TDMIN_A SRC SEL" "IN 3"
     $ amixer set "TODDR_A SRC SEL" "IN 0"
     $ amixer set "TOACODEC Source" "I2S A"
     $ amixer set "TOACODEC Lane Select" "0"
     $ amixer set "TOACODEC EN" "on"
     $ amixer set "ACODEC ADC" "70%"
     $ amixer set "ACODEC ADC Filter" "on"
     $ amixer set "ACODEC ADC Filter Mode" "HiFi"
     $ amixer set "ACODEC ADC PGA" "50%"

   - usage:
     $ arecord -D hw:0,2 -f S16_LE -r 48000 -c 2 -t wav /path/to/sample.wav

 * capture from TDM loopback

   - setup:
     $ amixer set "TDMIN_LB SRC SEL" "IN 0"
     $ amixer set "TODDR_B SRC SEL" "IN 6"

   - usage:
     $ arecord -D hw:0,1 -f S16_LE -r 48000 -c 2 -t wav /path/to/sample.wav

   or

   - setup:
     $ amixer set "TDMIN_LB SRC SEL" "IN 0"
     $ amixer set "TODDR_A SRC SEL" "IN 6"

   - usage:
     $ arecord -D hw:0,2 -f S16_LE -r 48000 -c 2 -t wav /path/to/sample.wav

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
index 0d92f5253b64..09a5732f0981 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
@@ -9,6 +9,8 @@
 #include "meson-a1.dtsi"
 #include <dt-bindings/thermal/thermal.h>
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	compatible = "amlogic,ad402", "amlogic,a1";
 	model = "Amlogic Meson A1 AD402 Development Board";
@@ -128,6 +130,98 @@ map1 {
 			};
 		};
 	};
+
+	amplifier: amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AMPLIFIER";
+		enable-gpios = <&gpio GPIOF_4 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&battery_4v2>;
+	};
+
+	dmics: dmics {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "MIC";
+		num-channels = <4>;
+		wakeup-delay-ms = <50>;
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "AD402";
+		audio-aux-devs = <&tdmout_a>,
+				 <&amplifier>,
+				 <&tdmin_lb>,
+				 <&tdmin_a>;
+		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
+				"TDM_A Playback", "TDMOUT_A OUT",
+				"AMPLIFIER INL", "ACODEC LOLP",
+				"AMPLIFIER INR", "ACODEC LORP",
+
+				"TODDR_B IN 4", "PDM Capture",
+
+				"TDMIN_LB IN 0", "TDM_A Loopback",
+				"TODDR_A IN 6", "TDMIN_LB OUT",
+				"TODDR_B IN 6", "TDMIN_LB OUT",
+
+				"TDMIN_A IN 3", "TDM_A Capture",
+				"TODDR_A IN 0", "TDMIN_A OUT";
+		assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>;
+		assigned-clock-parents = <0>;
+		assigned-clock-rates = <1536000000>;
+
+		dai-link-0 {
+			sound-dai = <&frddr_a>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&toddr_b>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&toddr_a>;
+		};
+
+		dai-link-3 {
+			sound-dai = <&tdmif_a>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-rx-mask-0 = <1 1>;
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&toacodec TOACODEC_IN_A>;
+			};
+
+			codec-1 {
+				sound-dai = <&toacodec TOACODEC_CAPTURE_OUT_A>;
+			};
+		};
+
+		dai-link-4 {
+			sound-dai = <&toacodec TOACODEC_OUT>;
+
+			codec {
+				sound-dai = <&acodec>;
+			};
+		};
+
+		dai-link-5 {
+			sound-dai = <&toacodec TOACODEC_CAPTURE_IN>;
+
+			codec {
+				sound-dai = <&acodec>;
+			};
+		};
+
+		dai-link-6 {
+			sound-dai = <&pdm>;
+
+			codec {
+				sound-dai = <&dmics>;
+			};
+		};
+	};
 };
 
 /* Bluetooth HCI H4 */
@@ -190,3 +284,19 @@ &sd_emmc {
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_1v8>;
 };
+
+&acodec {
+	AVDD-supply = <&vddio_1v8>;
+	lineout-left = "right-inverted";
+	lineout-right = "right";
+	linein-left = "differential";
+	linein-right = "differential";
+	micbias = "2.5V";
+};
+
+&pdm {
+	pinctrl-0 = <&pdm_din0_a_pins>,
+		    <&pdm_din1_a_pins>,
+		    <&pdm_dclk_a_pins>;
+	pinctrl-names = "default";
+};
-- 
2.34.1


