Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9D8C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWhB5AtStN8MNZiCkYaz8R6NVOnCdNzeWmy93mQ7HQA=; b=RwDSSSD31FC+1CSDB/HUhOH6Dg
	QCXisQF6yMpJWTpyOaAFsELyoseJvYJsqzLaZLQEoROk7+a3FMUfpcsPqlr0KhbbCANlG+wS5rxZx
	Onu19XPICjG7MQCgUoNLeYJVTUFK4rGsZHrysAfwuhuuu7vccdQsA3a5S+0FsF+FBNVVDFbspuwyI
	7slgV670uj5bWdLaBS01t1ZU6nRiq+ulLOdNW6EwmeaXHWz7hFrwVrp2aXgerhhdqJJS23WeGGz3k
	JgN1n+3b9ow/4L22YF0rEKupejujIixAx6TZMHrFU419KLdNjboCxNMTFCe+pWyyqtGQboYpbAY/x
	59rAp0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLBm-00000000waE-0wCl;
	Sun, 09 Mar 2025 18:15:50 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKvH-00000000uNW-1KdW;
	Sun, 09 Mar 2025 17:58:48 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 852CE120006;
	Sun,  9 Mar 2025 20:58:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 852CE120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741543125;
	bh=BWhB5AtStN8MNZiCkYaz8R6NVOnCdNzeWmy93mQ7HQA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=oO76xMpHl9MV2RE8cqbv2IOi8tFDekC1bx7IK5O39bAW4ewkmgE66ngInvt976JBZ
	 f6s/7heGKd5ajNzlkbZ+oESvTxdSYZM1Mt5PFKqx65aHagfiqON0ChmAoHRk+8S9Ot
	 hV/VetVJM0O5iZ1iXtVMdYF8ZRfFhbE5yCmHzdtz1Ezn8aQoQO+ra0DFZEeJgLE5x0
	 g3gIeIdj1lCo0CzHddSgjhS31vuMkFQ5Rg/bG6gaB9Q7RMZ1CNLUbpXfpWvfdy7+Ns
	 i6O1dtzs5hTzD3JA99qllNWSxg10wPpGS8RcQb5lbFbNig4jokZ2VCsQiM8QtKiTg1
	 pClBuSyHdvsFA==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 20:58:45 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v6 4/4] arm64: dts: meson: a1: add the audio clock controller
Date: Sun, 9 Mar 2025 20:58:38 +0300
Message-ID: <20250309175838.1322014-4-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309175838.1322014-1-jan.dakinevich@salutedevices.com>
References: <20250309175838.1322014-1-jan.dakinevich@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_smtp_not_equal_from}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/03/09 15:22:00 #27687174
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_105847_738431_F88BA57B 
X-CRM114-Status: GOOD (  11.11  )
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

Add the bus and audio clock controllers' device tree nodes.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 49 +++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 1eba0afb3fd9..cf0247fce740 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
+#include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
 #include <dt-bindings/gpio/meson-a1-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -664,6 +665,54 @@ sd_emmc: mmc@10000 {
 				power-domains = <&pwrc PWRC_SD_EMMC_ID>;
 				status = "disabled";
 			};
+
+			audio: bus@50000 {
+				compatible = "simple-bus";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x50000 0 0x4980>;
+				power-domains = <&pwrc PWRC_AUDIO_ID>;
+
+				clkc_audio: clock-controller@0 {
+					compatible = "amlogic,a1-audio-clkc";
+					reg = <0x0 0x0 0x0 0xb0>;
+					#clock-cells = <1>;
+					#reset-cells = <1>;
+					clocks = <&clkc_audio_vad AUD_VAD_CLKID_TOAUDIOTOP>,
+						 <&clkc_periphs CLKID_DDS_IN>,
+						 <&clkc_pll CLKID_FCLK_DIV2>,
+						 <&clkc_pll CLKID_FCLK_DIV3>,
+						 <&clkc_pll CLKID_HIFI_PLL>,
+						 <&xtal>;
+					clock-names = "pclk",
+						      "mst_in0",
+						      "mst_in1",
+						      "mst_in2",
+						      "mst_in3",
+						      "mst_in4";
+					resets = <&reset RESET_AUDIO>;
+				};
+
+				clkc_audio_vad: clock-controller@4800 {
+					compatible = "amlogic,a1-audio-vad-clkc";
+					reg = <0x0 0x4800 0x0 0x20>;
+					#clock-cells = <1>;
+					#reset-cells = <1>;
+					clocks = <&clkc_periphs CLKID_SYS>,
+						 <&clkc_periphs CLKID_DDS_IN>,
+						 <&clkc_pll CLKID_FCLK_DIV2>,
+						 <&clkc_pll CLKID_FCLK_DIV3>,
+						 <&clkc_pll CLKID_HIFI_PLL>,
+						 <&xtal>;
+					clock-names = "pclk",
+						      "mst_in0",
+						      "mst_in1",
+						      "mst_in2",
+						      "mst_in3",
+						      "mst_in4";
+					resets = <&reset RESET_AUDIO_VAD>;
+				};
+			};
 		};
 
 		usb: usb@fe004400 {
-- 
2.34.1


