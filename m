Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FABC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsuE9FrIXsRPBDeMdPlBaE6v7BVynX/M7rzn67mMUac=; b=AFpvuAzLvayUUH06jgTSEOKSpi
	qWlMEuWQtKigTgomYNoosvwlFiFTT2P71op/NinnahWkgtQCF3nUgkLERanDdS7BKirI7xPR5fhtS
	w4Kelsg+RGI/gnfE21fXXhlyoQv/iU7RyzJMAKD8HV3pZ0oC80o9JSDU0MUG4NGkZtPpTlywb0yPX
	mU6kLNTxc0uMzOITIn54zIPsDq6UxzwmFG1aiOqIaebRQYB5fuxenh3d8CyrKecrxn5xn/6f5z8+M
	0BWtcvn/Edctp2mHIJDQobbjMp752N1JNpYtGdazu0ic2zdDQc58PCbzNm06iaF9P12NboXemlJ4I
	mjlhOTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLno-000000010qe-19YP;
	Sun, 09 Mar 2025 18:55:08 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLHM-00000000xS7-1CCI;
	Sun, 09 Mar 2025 18:21:38 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B848110000A;
	Sun,  9 Mar 2025 21:21:34 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B848110000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544494;
	bh=PsuE9FrIXsRPBDeMdPlBaE6v7BVynX/M7rzn67mMUac=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=K7gA5KDDj/GUhr0vgZugfy0YNjXJ0XBVTNIKXKNGdGnIg9vICJ3fEILP7SnTedXp5
	 2WndWcjuna+3+J3j/jZNkG+GMzEnwRGXDkAoHbp6Usvalbabj8fd8MSu+ecUmXz4EI
	 hvYGi4TMb/eyUjs6gINpTx6wtDfCzH0ICNfcuZ02GoIgrKxls/5fmE39Nt5BRkGytd
	 pvXHJghMnJGHP3ATRVn9SJ5PEmNgnYp8799+I2OJn+EhCSPzY4Tlcf8ybEOEfpXzK+
	 3X5NvlgcHn2gXbTZ8cN92Ec35Sk1ld1uYBEmmHKk3Us0AXXww5Qzb77NLx9v7BW5hc
	 R0Qveu1MVp8pg==
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
Subject: [PATCH v2 5/6] arm64: dts: meson: a1: add audio devices
Date: Sun, 9 Mar 2025 21:21:26 +0300
Message-ID: <20250309182127.1322890-6-jan.dakinevich@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_smtp_not_equal_from}, sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/03/09 17:28:00 #27692143
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_112136_703284_2527FE98 
X-CRM114-Status: GOOD (  13.38  )
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

This commit adds the declarartion of currently supported audio devices
and their pins found Amlog A1 SoC family. SPDIF declaration is missing
here becase there are no publicly available boards with it.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 443 ++++++++++++++++++++++
 1 file changed, 443 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index cf0247fce740..b09df1da81c3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -11,6 +11,9 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/power/meson-a1-power.h>
 #include <dt-bindings/reset/amlogic,meson-a1-reset.h>
+#include <dt-bindings/reset/amlogic,meson-a1-audio-reset.h>
+#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
+#include <dt-bindings/sound/meson-g12a-toacodec.h>
 
 / {
 	compatible = "amlogic,a1";
@@ -465,6 +468,250 @@ mux {
 						function = "spif";
 					};
 				};
+
+				tdm_a_din0_pins: tdm-a-din0 {
+					mux {
+						groups = "tdm_a_din0";
+						function = "tdm_a";
+						bias-disable;
+					};
+				};
+
+				tdm_a_din1_pins: tdm-a-din1 {
+					mux {
+						groups = "tdm_a_din1";
+						function = "tdm_a";
+						bias-disable;
+					};
+				};
+
+				tdm_a_dout0_pins: tdm-a-dout0 {
+					mux {
+						groups = "tdm_a_dout0";
+						function = "tdm_a";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_a_dout1_pins: tdm-a-dout1 {
+					mux {
+						groups = "tdm_a_dout1";
+						function = "tdm_a";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_a_fs_pins: tdm-a-fs {
+					mux {
+						groups = "tdm_a_fs";
+						function = "tdm_a";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_a_sclk_pins: tdm-a-sclk {
+					mux {
+						groups = "tdm_a_sclk";
+						function = "tdm_a";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_a_slv_fs_pins: tdm-a-slv-fs {
+					mux {
+						groups = "tdm_a_slv_fs";
+						function = "tdm_a";
+						bias-disable;
+					};
+				};
+
+				tdm_a_slv_sclk_pins: tdm-a-slv-sclk {
+					mux {
+						groups = "tdm_a_slv_sclk";
+						function = "tdm_a";
+						bias-disable;
+					};
+				};
+
+				tdm_b_din0_pins: tdm-b-din0 {
+					mux {
+						groups = "tdm_b_din0";
+						function = "tdm_b";
+						bias-disable;
+					};
+				};
+
+				tdm_b_din1_pins: tdm-b-din1 {
+					mux {
+						groups = "tdm_b_din1";
+						function = "tdm_b";
+						bias-disable;
+					};
+				};
+
+				tdm_b_din2_pins: tdm-b-din2 {
+					mux {
+						groups = "tdm_b_din2";
+						function = "tdm_b";
+						bias-disable;
+					};
+				};
+
+				tdm_b_dout0_pins: tdm-b-dout0 {
+					mux {
+						groups = "tdm_b_dout0";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_dout1_pins: tdm-b-dout1 {
+					mux {
+						groups = "tdm_b_dout1";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_dout2_pins: tdm-b-dout2 {
+					mux {
+						groups = "tdm_b_dout2";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_dout3_pins: tdm-b-dout3 {
+					mux {
+						groups = "tdm_b_dout3";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_dout4_pins: tdm-b-dout4 {
+					mux {
+						groups = "tdm_b_dout4";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_dout5_pins: tdm-b-dout5 {
+					mux {
+						groups = "tdm_b_dout5";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_fs_pins: tdm-b-fs {
+					mux {
+						groups = "tdm_b_fs";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_sclk_pins: tdm-b-sclk {
+					mux {
+						groups = "tdm_b_sclk";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_slv_fs_pins: tdm-b-slv-fs {
+					mux {
+						groups = "tdm_b_slv_fs";
+						function = "tdm_b";
+						bias-disable;
+					};
+				};
+
+				tdm_b_slv_sclk_pins: tdm-b-slv-sclk {
+					mux {
+						groups = "tdm_b_slv_sclk";
+						function = "tdm_b";
+						bias-disable;
+					};
+				};
+
+				pdm_din0_a_pins: pdm-din0-a {
+					mux {
+						groups = "pdm_din0_a";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_din0_x_pins: pdm-din0-x {
+					mux {
+						groups = "pdm_din0_x";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_din1_a_pins: pdm-din1-a {
+					mux {
+						groups = "pdm_din1_a";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_din1_x_pins: pdm-din1-x {
+					mux {
+						groups = "pdm_din1_x";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_din2_a_pins: pdm-din2-a {
+					mux {
+						groups = "pdm_din2_a";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_din2_x_pins: pdm-din2-x {
+					mux {
+						groups = "pdm_din2_x";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_dclk_a_pins: pdm-dclk-a {
+					mux {
+						groups = "pdm_dclk_a";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_dclk_x_pins: pdm-dclk-x {
+					mux {
+						groups = "pdm_dclk_x";
+						function = "pdm";
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@440 {
@@ -666,6 +913,17 @@ sd_emmc: mmc@10000 {
 				status = "disabled";
 			};
 
+			acodec: audio-controller@4800 {
+				compatible = "amlogic,t9015-a1";
+				reg = <0x0 0x4800 0x0 0x14>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "ACODEC";
+				clocks = <&clkc_periphs CLKID_AUDIO>;
+				clock-names = "pclk";
+				resets = <&reset RESET_ACODEC>;
+				power-domains = <&pwrc PWRC_ACODEC_ID>;
+			};
+
 			audio: bus@50000 {
 				compatible = "simple-bus";
 				#address-cells = <2>;
@@ -712,6 +970,171 @@ clkc_audio_vad: clock-controller@4800 {
 						      "mst_in4";
 					resets = <&reset RESET_AUDIO_VAD>;
 				};
+
+				toddr_a: audio-controller@100 {
+					compatible = "amlogic,a1-toddr",
+						     "amlogic,sm1-toddr",
+						     "amlogic,axg-toddr";
+					reg = <0x0 0x100 0x0 0x2c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "TODDR_A";
+					interrupts = <GIC_SPI 37 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
+					resets = <&arb AXG_ARB_TODDR_A>,
+						 <&clkc_audio AUD_RESET_TODDR_A>;
+					reset-names = "arb", "rst";
+					amlogic,fifo-depth = <128>;
+				};
+
+				toddr_b: audio-controller@140 {
+					compatible = "amlogic,a1-toddr",
+						     "amlogic,sm1-toddr",
+						     "amlogic,axg-toddr";
+					reg = <0x0 0x140 0x0 0x2c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "TODDR_B";
+					interrupts = <GIC_SPI 38 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
+					resets = <&arb AXG_ARB_TODDR_B>,
+						 <&clkc_audio AUD_RESET_TODDR_B>;
+					reset-names = "arb", "rst";
+					amlogic,fifo-depth = <128>;
+				};
+
+				frddr_a: audio-controller@1c0 {
+					compatible = "amlogic,a1-frddr",
+						     "amlogic,sm1-frddr",
+						     "amlogic,axg-frddr";
+					reg = <0x0 0x1c0 0x0 0x2c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "FRDDR_A";
+					interrupts = <GIC_SPI 40 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
+					resets = <&arb AXG_ARB_FRDDR_A>,
+						 <&clkc_audio AUD_RESET_FRDDR_A>;
+					reset-names = "arb", "rst";
+					amlogic,fifo-depth = <128>;
+				};
+
+				frddr_b: audio-controller@200 {
+					compatible = "amlogic,a1-frddr",
+						     "amlogic,sm1-frddr",
+						     "amlogic,axg-frddr";
+					reg = <0x0 0x200 0x0 0x2c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "FRDDR_B";
+					interrupts = <GIC_SPI 41 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
+					resets = <&arb AXG_ARB_FRDDR_B>,
+						 <&clkc_audio AUD_RESET_FRDDR_B>;
+					reset-names = "arb", "rst";
+					amlogic,fifo-depth = <128>;
+				};
+
+				arb: reset-controller@280 {
+					compatible = "amlogic,meson-a1-audio-arb",
+						     "amlogic,meson-sm1-audio-arb";
+					reg = <0x0 0x280 0x0 0x4>;
+					#reset-cells = <1>;
+					clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
+				};
+
+				tdmin_a: audio-controller@300 {
+					compatible = "amlogic,a1-tdmin",
+						     "amlogic,sm1-tdmin";
+					reg = <0x0 0x300 0x0 0x40>;
+					sound-name-prefix = "TDMIN_A";
+					clocks = <&clkc_audio AUD_CLKID_TDMIN_A>,
+						 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
+						 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
+					clock-names = "pclk", "sclk", "sclk_sel",
+						      "lrclk", "lrclk_sel";
+					resets = <&clkc_audio AUD_RESET_TDMIN_A>;
+				};
+
+				tdmin_b: audio-controller@340 {
+					compatible = "amlogic,a1-tdmin",
+						     "amlogic,sm1-tdmin";
+					reg = <0x0 0x340 0x0 0x40>;
+					sound-name-prefix = "TDMIN_B";
+					clocks = <&clkc_audio AUD_CLKID_TDMIN_B>,
+						 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
+						 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
+					clock-names = "pclk", "sclk", "sclk_sel",
+						      "lrclk", "lrclk_sel";
+					resets = <&clkc_audio AUD_RESET_TDMIN_B>;
+				};
+
+				tdmin_lb: audio-controller@3c0 {
+					compatible = "amlogic,a1-tdmin",
+						     "amlogic,sm1-tdmin";
+					reg = <0x0 0x3c0 0x0 0x40>;
+					sound-name-prefix = "TDMIN_LB";
+					clocks = <&clkc_audio AUD_CLKID_TDMIN_LB>,
+						 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
+						 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
+					clock-names = "pclk", "sclk", "sclk_sel",
+						      "lrclk", "lrclk_sel";
+					resets = <&clkc_audio AUD_RESET_TDMIN_LB>;
+				};
+
+				tdmout_a: audio-controller@500 {
+					compatible = "amlogic,a1-tdmout",
+						     "amlogic,sm1-tdmout";
+					reg = <0x0 0x500 0x0 0x40>;
+					sound-name-prefix = "TDMOUT_A";
+					clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
+					clock-names = "pclk", "sclk", "sclk_sel",
+						      "lrclk", "lrclk_sel";
+					resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
+				};
+
+				tdmout_b: audio-controller@540 {
+					compatible = "amlogic,a1-tdmout",
+						     "amlogic,sm1-tdmout";
+					reg = <0x0 0x540 0x0 0x40>;
+					sound-name-prefix = "TDMOUT_B";
+					clocks = <&clkc_audio AUD_CLKID_TDMOUT_B>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
+					clock-names = "pclk", "sclk", "sclk_sel",
+						      "lrclk", "lrclk_sel";
+					resets = <&clkc_audio AUD_RESET_TDMOUT_B>;
+				};
+
+				toacodec: audio-controller@740 {
+					compatible = "amlogic,a1-toacodec",
+						     "amlogic,g12a-toacodec";
+					reg = <0x0 0x740 0x0 0x4>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "TOACODEC";
+					resets = <&clkc_audio AUD_RESET_TOACODEC>;
+				};
+
+				pdm: audio-controller@1000 {
+					compatible = "amlogic,a1-pdm",
+						     "amlogic,axg-pdm";
+					reg = <0x0 0x1000 0x0 0x34>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "PDM";
+					clocks = <&clkc_audio_vad AUD_VAD_CLKID_PDM>,
+						 <&clkc_audio_vad AUD_VAD_CLKID_PDM_DCLK>,
+						 <&clkc_audio_vad AUD_VAD_CLKID_PDM_SYSCLK>;
+					clock-names = "pclk", "dclk", "sysclk";
+					power-domains = <&pwrc PWRC_PDMIN_ID>;
+				};
 			};
 		};
 
@@ -794,4 +1217,24 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
+
+	tdmif_a: audio-controller-0 {
+		compatible = "amlogic,axg-tdm-iface";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TDM_A";
+		clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
+	};
+
+	tdmif_b: audio-controller-1 {
+		compatible = "amlogic,axg-tdm-iface";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TDM_B";
+		clocks = <&clkc_audio AUD_CLKID_MST_B_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
+	};
 };
-- 
2.34.1


