Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B742CCD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 11:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyhrgWDIug9AoQBuogx+uuVQlmm7DjfRSlnDmW0s7jY=; b=zz4JITSD8GKgymInp7irfpwviL
	Cuu3FtzuMeAdOwRkaTIEIKaORq7bNDP17k4cMT8n0HRzKqAfgKDHiDYCpwt+9ZXUYHmG5kOEFu32P
	Th3BikT/uCD6OGNubaRnp3THkETcrFBrlrLq8QuwE0owtQqL5DiOEMhqCCp6AWcUn1+US/eEDZ5+1
	Zz4pm6GDJ277OuBmlYHEi7y7+iM9+zmjsEAXj6Rv0k5apGsSnTUH3BiD1XNnINDnnsTdQTTs96rIy
	ROxx7nAEEyYm5RDQvLz30w2efW3k2lkCjdtJzEmi9ez5kBZSHVVk0XLFAQ5kEdmHvFWEIQn4WIwVJ
	iD4xw66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV66N-0000000Gd9Q-0LyE;
	Thu, 04 Jun 2026 11:19:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV66K-0000000Gd6m-1DiA;
	Thu, 04 Jun 2026 11:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AyhrgWDIug9AoQBuogx+uuVQlmm7DjfRSlnDmW0s7jY=; b=buPSfMoVLOEDVqHKVsnZSuVSd3
	dZtSxj9hYg2MiNrBLsfcczTyemU0zNYnhJYigiNq44UhCl51V8D28qwarlTdlcH+ieoBCNRUkBIS7
	cwJxfVoNp+5KQVK8X/J2XrsMsOl+U/eXznSuShmZZ2sOigP/+IZxQlA0iXO59Li5q+2UhGAm1Nagu
	9RIX0gwcL9G71QhrWHAt8cG/F7UUwBp7kwYfKyScArjylXLZCR6K6ZxkXGPImz/0YylWa8XVR1BMd
	oW/6VhVey/o5iD5EDwS6hpmn7JrKP4IagVO9sw/3IQ+b4kIoTDSMxy1+EAslDMgU+1CUx9lW4QYfU
	seZGvm4w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV66F-0000000EEpB-04Zt;
	Thu, 04 Jun 2026 11:19:03 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 654BIM070299936, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1780571902; bh=AyhrgWDIug9AoQBuogx+uuVQlmm7DjfRSlnDmW0s7jY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=HKOdra+Gm5katShwCxqIlUQ9mucRuISJWDFyFqinwDqmai8wzifimb6T7/uBTj085
	 bhkuPbeBG7aR4o4ljzyEQa19ShzBoemF0uQH1aNgopcKIFsPPMlwJfDRV8APFDZP6C
	 Gkie12/evrzPhF/+9u9gP2Ukk8SRHncJk57ucOhHmwYjG6AcuvKCCFZ7uqL42jLzeV
	 EjH3WICYTj7W73RQhN/sYDmfz2dPh+hag1c6xLdhmwqZt2RdlahqXvReJhYHR2BDYc
	 nnUvR8awiZVq7ryUV0SsALfbRfBtuE+bQ9LgOS7gsJnhOjpduVvcY2GvRZ8reQjgMo
	 IEXMCEyv7W+1g==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 654BIM070299936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Jun 2026 19:18:22 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:22 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:22 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Jun 2026 19:18:21 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tychang@realtek.com>
CC: <eleanor.lin@realtek.com>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <james.tai@realtek.com>, <afaerber@suse.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [PATCH 3/3] arm64: dts: realtek: Add I/O level detector
Date: Thu, 4 Jun 2026 19:18:20 +0800
Message-ID: <20260604111821.975624-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260604111821.975624-1-eleanor.lin@realtek.com>
References: <20260604111821.975624-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_121859_719809_3156EDE3 
X-CRM114-Status: GOOD (  13.17  )
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

Add io-level-detector node with pinctrl configurations for 1.8V/3.3V
voltage selection on RGMII, SDIO, CSI, SD, UART1, AIO, and eMMC.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
This patch depends on this pinctrl node patch [1].
[1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=50d92732d10e
---
 arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi | 108 ++++++++++++++++++
 arch/arm64/boot/dts/realtek/kent.dtsi         |  28 +++++
 2 files changed, 136 insertions(+)
 create mode 100644 arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi

diff --git a/arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi b/arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi
new file mode 100644
index 000000000000..ec7e33034b96
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (c) 2022-2026 Realtek Semiconductor Corp.
+ */
+
+&iso_pinctrl {
+	aio_vsel_1v8_pins: aio-vsel-1v8-pins {
+		pins = "gpio_98", "gpio_99", "gpio_100", "gpio_101", "gpio_102", "gpio_103",
+		       "gpio_104", "gpio_105", "gpio_106", "gpio_107", "gpio_108", "gpio_109",
+		       "gpio_110", "gpio_111", "gpio_112";
+		power-source = <0>;
+		input-threshold-voltage-microvolt = <1800000>;
+	};
+
+	aio_vsel_3v3_pins: aio-vsel-3v3-pins {
+		pins = "gpio_98", "gpio_99", "gpio_100", "gpio_101", "gpio_102", "gpio_103",
+		       "gpio_104", "gpio_105", "gpio_106", "gpio_107", "gpio_108", "gpio_109",
+		       "gpio_110", "gpio_111", "gpio_112";
+		power-source = <1>;
+		input-threshold-voltage-microvolt = <3300000>;
+	};
+
+	csi_vsel_1v8_pins: csi-vsel-1v8-pins {
+		pins = "csi_vdsel";
+		function = "csi_1v8";
+	};
+
+	csi_vsel_3v3_pins: csi-vsel-3v3-pins {
+		pins = "csi_vdsel";
+		function = "csi_3v3";
+	};
+
+	rgmii_vsel_1v8_pins: rgmii-vsel-1v8-pins {
+		pins = "rgmii_vdsel";
+		function = "rgmii_1v8";
+	};
+
+	rgmii_vsel_3v3_pins: rgmii-vsel-3v3-pins {
+		pins = "rgmii_vdsel";
+		function = "rgmii_3v3";
+	};
+
+	sdio_vsel_1v8_pins: sdio-vsel-1v8-pins {
+		pins = "gpio_45", "gpio_46", "gpio_47", "gpio_48", "gpio_49", "gpio_50";
+		power-source = <0>;
+	};
+
+	sdio_vsel_3v3_pins: sdio-vsel-3v3-pins {
+		pins = "gpio_45", "gpio_46", "gpio_47", "gpio_48", "gpio_49", "gpio_50";
+		power-source = <1>;
+	};
+
+	uart1_vsel_1v8_pins: uart1-vsel-1v8-pins {
+		pins = "gpio_8", "gpio_9", "gpio_10", "gpio_11";
+		power-source = <0>;
+		input-threshold-voltage-microvolt = <1800000>;
+	};
+
+	uart1_vsel_3v3_pins: uart1-vsel-3v3-pins {
+		pins = "gpio_8", "gpio_9", "gpio_10", "gpio_11";
+		power-source = <1>;
+		input-threshold-voltage-microvolt = <3300000>;
+	};
+};
+
+&main2_pinctrl {
+	emmc_vsel_1v8_pins: emmc-vsel-1v8-pins {
+		pins = "emmc_rst_n",
+			"emmc_dd_sb",
+			"emmc_clk",
+			"emmc_cmd",
+			"emmc_data_0",
+			"emmc_data_1",
+			"emmc_data_2",
+			"emmc_data_3",
+			"emmc_data_4",
+			"emmc_data_5",
+			"emmc_data_6",
+			"emmc_data_7";
+		power-source = <0>;
+	};
+
+	emmc_vsel_3v3_pins: emmc-vsel-3v3-pins {
+		pins = "emmc_rst_n",
+			"emmc_dd_sb",
+			"emmc_clk",
+			"emmc_cmd",
+			"emmc_data_0",
+			"emmc_data_1",
+			"emmc_data_2",
+			"emmc_data_3",
+			"emmc_data_4",
+			"emmc_data_5",
+			"emmc_data_6",
+			"emmc_data_7";
+		power-source = <1>;
+	};
+
+	sd_vsel_1v8_pins: sd-vsel-1v8-pins {
+		pins = "gpio_40", "gpio_41", "hif_clk", "hif_data", "hif_en", "hif_rdy";
+		power-source = <0>;
+	};
+
+	sd_vsel_3v3_pins: sd-vsel-3v3-pins {
+		pins = "gpio_40", "gpio_41", "hif_clk", "hif_data", "hif_en", "hif_rdy";
+		power-source = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index 8d4293cd4c03..f18b975c3593 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -125,6 +125,32 @@ psci: psci {
 		method = "smc";
 	};
 
+	io_level_detector: io-level-detector {
+		compatible = "realtek,rtd1625-io-detect";
+		pinctrl-names = "rgmii_1v8", "rgmii_3v3",
+				"sdio_1v8", "sdio_3v3",
+				"csi_1v8", "csi_3v3",
+				"sd_1v8", "sd_3v3",
+				"uart1_1v8", "uart1_3v3",
+				"aio_1v8", "aio_3v3",
+				"emmc_1v8", "emmc_3v3";
+		pinctrl-0 = <&rgmii_vsel_1v8_pins>;
+		pinctrl-1 = <&rgmii_vsel_3v3_pins>;
+		pinctrl-2 = <&sdio_vsel_1v8_pins>;
+		pinctrl-3 = <&sdio_vsel_3v3_pins>;
+		pinctrl-4 = <&csi_vsel_1v8_pins>;
+		pinctrl-5 = <&csi_vsel_3v3_pins>;
+		pinctrl-6 = <&sd_vsel_1v8_pins>;
+		pinctrl-7 = <&sd_vsel_3v3_pins>;
+		pinctrl-8 = <&uart1_vsel_1v8_pins>;
+		pinctrl-9 = <&uart1_vsel_3v3_pins>;
+		pinctrl-10 = <&aio_vsel_1v8_pins>;
+		pinctrl-11 = <&aio_vsel_3v3_pins>;
+		pinctrl-12 = <&emmc_vsel_1v8_pins>;
+		pinctrl-13 = <&emmc_vsel_3v3_pins>;
+		realtek,iso-pinctrl = <&iso_pinctrl>;
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0x0 0x40000>, /* boot code */
@@ -184,3 +210,5 @@ gic: interrupt-controller@ff100000 {
 		};
 	};
 };
+
+#include "kent-pinctrl.dtsi"
-- 
2.43.0


