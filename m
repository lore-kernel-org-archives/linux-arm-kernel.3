Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D394C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqd78ujcofxGc0Gn+sI8cVUproWrfxoFrb915leQm6w=; b=0P72kOORUTNFsJFLMwmakSgEAx
	dKYlw7WAQ8rm8GgkOlgl8zFpuICFHcgJgPcR5d/7/v/h6NUCzClECK3nbabBl7ml+RY45r/AlCN/i
	gIRjh7MEowcJld+NaI+4U1Ao4lwGAg0LcjzHUzUbWodKX/hnKoToWLerukaLvcsPT1TT9taF7N1h+
	qXb7n5VarKdfLtXxIkzu661UEQFmgMqytG2njxxzczIWa3IIwStttNA050PDBJOXjLDD6JS8is27A
	7R7DiBU+/F0OVIkczNjSCBV7pfYZil8ksECh64wqDnz0ZuQH39cySgxtceewLOd/ScLWjU9JJ0p35
	3NkCKrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfpS-00000001yNO-32Vz;
	Fri, 17 Jul 2026 10:30:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfpF-00000001yAy-2RuT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:29:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493b966dd74so31042665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784284188; x=1784888988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqd78ujcofxGc0Gn+sI8cVUproWrfxoFrb915leQm6w=;
        b=S++pCn6jHsML4fEfLpLwtu/Fm+9sL/wM7adAInQTTmAajrkmyopopHi4CEMKBX2Ltb
         ryfSQJbj2CLd/z8eXIfAKIfzyP7/QRFKQ+4/cYtUGttn3o754+zy2ejnMnqUWElqTKvR
         FEguZeRxuqEj0jwoH8crl8cr67qm4GrgW9rsBWvsyVBLB/1nG+y2Voschz99ZlBsLtCm
         iOXAKKiZOREiDIEWgSRf8u6dAGeJTQQBvBfzXkk3w+pKLlTEiZrZto4Jh6WEuqpWxoP4
         oevRPNKFMLzYX36oyNntEqbkrLY2ghdsL1bj0FEILbtYfkDTyllbAC+ZAXFegRGiXWtZ
         uJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284188; x=1784888988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqd78ujcofxGc0Gn+sI8cVUproWrfxoFrb915leQm6w=;
        b=HiEnt4uSdeVfLDc/F3EN68VezTWV8VesC/kVnwPbvbta7/ZOqEuInPdSePipb2eQmh
         dwtvceuYKKhGd+UK45BNE09NyyLzTk6BMvfFFtgtv6BbI8EDw0ituLvXL1hCvC6touZ9
         FAWOPkExZ3Hc2NfABj9zmHcTMctvOBnCCjCOsAWjc0javAeYPcU/48yCbvH30025da2I
         2A89WiplYrHbJEadmW7WwrqdxQ/i/bw/c+hLYIAmaGbds3jRHhCW2zUGXjnOKxCmzdxA
         acbRXTyKF2Tc3c5wAOMe63Cv8NBDnRzSHdW/ZqvSC3Ume9ytvneiGJw8/+bICDDhSgvd
         +kkw==
X-Forwarded-Encrypted: i=1; AHgh+Rr33E/qmZiIXT5/N0AWdPl08EGzBSfPM7VaoH+w9o8tGmTsVJfe3gg8VfjYrVEo3pal5vvKsdTkvcP0AfwGdHr1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxul2StO2Egzb9NLgOegkx+B5IxwS8jMyMQaR0HFYZMZQ1I+uF0
	SBSOmWEFsOFfizcEMbQJ0Dxl3cvPfjpMhvbylZmBShHK6cDZa7Wg13gr
X-Gm-Gg: AfdE7cmL8Q3I95e098HxGHimgtXDTQfdAzgYCL2/xXkklUazEfx4/C1tzEcOr9wJiuS
	qoVoehTfvpojSg/8psvsDsc5BEUGVSiGqndy/FgnSQxwy0VtNWmh66OznCLPEUgy99nxwpmfwgY
	vg1SlOWdvujYyvG3/3T0Id4HljySI8RQsZab2z5aZpZuorW6kvrxYK0hwaB+WkDkukMGPR42snw
	9+adR2xOr/8UdxYLjCcyC22pW1qk0I+SE7D+N0Iwmk40ilfvfh7FLuSL7LuceWOaQsLTXLXEDV9
	ePT8QgkocKhFtFERZ9Ag+3dSLBml4gJTCc68g7Ie3YplW+xa75soZaZFJi1DjYfNUgnRomT8KKx
	b8qhTm4rJAd/IYdIEpKKgwOPjrRy7BDeZPczrufTebCnVats5evak2yPAKOHpd3Uw0f+hqFvvTl
	7AGaCzMhx3Z2HowLtPmTugYHtzDdsPsApDgt0JlIYj57TilNael+so8RzNK9/45SehRovUUMLBh
	cpni9ksvAJbD0Y=
X-Received: by 2002:a05:600c:4ed4:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-4954a3ec5f7mr21570365e9.2.1784284187551;
        Fri, 17 Jul 2026 03:29:47 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm39931735e9.6.2026.07.17.03.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:29:47 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v6 2/3] arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
Date: Fri, 17 Jul 2026 12:29:38 +0200
Message-ID: <ad9656f3a07243b014340615e2be4aaefbe5eed4.1784284092.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784284092.git.stefano.r@variscite.com>
References: <cover.1784284092.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_032949_794270_518CABA4 
X-CRM114-Status: GOOD (  17.59  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite VAR-SOM-MX8 QuadMax
system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX8 QuadMax MPU processor
- Up to 8GB of LPDDR4 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quadplus/var-som-mx8/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v5->v6:
 - Fix regulator typo

v4->v5:
 - Fix sai7 clock
 - Fix codec regulator voltage

v3->v4:
 - Fix sai peripherals clocks
 - Add comment to clarify 1GB variant

v2->v3:
 - 

v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl

 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 531 ++++++++++++++++++
 1 file changed, 531 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
new file mode 100644
index 000000000000..b11da10c5ae3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
@@ -0,0 +1,531 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite VAR-SOM-MX8
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quadplus/var-som-mx8/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx8qm.dtsi"
+
+/ {
+	model = "Variscite i.MX8QM VAR-SOM-MX8 Module";
+	compatible = "variscite,var-som-imx8qm", "fsl,imx8qm";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0 0x40000000>;
+	};
+
+	reg_audio_supply: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vdev0vring0: memory@90000000 {
+			reg = <0 0x90000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@90008000 {
+			reg = <0 0x90008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@90010000 {
+			reg = <0 0x90010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@90018000 {
+			reg = <0 0x90018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table0: memory@900ff000 {
+			reg = <0 0x900ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev2vring0: memory@90100000 {
+			reg = <0 0x90100000 0 0x8000>;
+			no-map;
+		};
+
+		vdev2vring1: memory@90108000 {
+			reg = <0 0x90108000 0 0x8000>;
+			no-map;
+		};
+
+		vdev3vring0: memory@90110000 {
+			reg = <0 0x90110000 0 0x8000>;
+			no-map;
+		};
+
+		vdev3vring1: memory@90118000 {
+			reg = <0 0x90118000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table1: memory@901ff000 {
+			reg = <0 0x901ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: memory@90400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90400000 0 0x100000>;
+			no-map;
+		};
+
+		dsp_reserved: memory@92400000 {
+			reg = <0 0x92400000 0 0x1000000>;
+			no-map;
+		};
+
+		dsp_vdev0vring0: memory@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: memory@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: memory@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			/* VAR-SOM-MX8QM doesn't have 1GB variant */
+			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
+	};
+
+	sound-wm8904 {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&esai0>;
+		};
+	};
+};
+
+&acm {
+	status = "okay";
+};
+
+&asrc0 {
+	fsl,asrc-rate  = <48000>;
+	status = "okay";
+};
+
+&asrc1 {
+	fsl,asrc-rate = <48000>;
+	status = "okay";
+};
+
+&cm41_intmux {
+	status = "okay";
+};
+
+&esai0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_esai0>;
+	assigned-clocks = <&acm IMX_ADMA_ACM_ESAI0_MCLK_SEL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+			  <&esai0_lpcg IMX_LPCG_CLK_4>;
+	assigned-clock-parents = <&aud_pll_div0_lpcg IMX_LPCG_CLK_0>;
+	assigned-clock-rates = <0>, <786432000>, <49152000>, <12288000>, <49152000>;
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <4>;
+			reset-gpios = <&lsio_gpio2 28 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <20000>;
+			vddio-supply = <&reg_phy_vddio>;
+		};
+	};
+};
+
+&gpio0_mipi_csi0 {
+	status = "disabled";
+};
+
+&gpio0_mipi_csi1 {
+	status = "disabled";
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c0>;
+	status = "okay";
+
+	wm8904: codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "mclk";
+		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+				<&mclkout0_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
+		AVDD-supply = <&reg_audio_supply>;
+		CPVDD-supply = <&reg_audio_supply>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&reg_audio_supply>;
+		MICVDD-supply = <&reg_audio_supply>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+	};
+};
+
+/* Bluetooth */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart1>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&mu_m0{
+	status = "okay";
+};
+
+&mu1_m0{
+	status = "okay";
+};
+
+&mu2_m0{
+	status = "okay";
+};
+
+&rtc {
+	status = "disabled";
+};
+
+&sai6 {
+	assigned-clocks = <&acm IMX_ADMA_ACM_SAI6_MCLK_SEL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
+			  <&sai6_lpcg IMX_LPCG_CLK_4>;
+	assigned-clock-parents = <&aud_pll_div1_lpcg IMX_LPCG_CLK_0>;
+	assigned-clock-rates = <0>, <786432000>, <98304000>, <12288000>, <98304000>;
+	fsl,sai-asynchronous;
+	status = "okay";
+};
+
+&sai7 {
+	assigned-clocks = <&acm IMX_ADMA_ACM_SAI7_MCLK_SEL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
+			  <&sai7_lpcg IMX_LPCG_CLK_4>;
+	assigned-clock-parents = <&aud_pll_div1_lpcg IMX_LPCG_CLK_0>;
+	assigned-clock-rates = <0>, <786432000>, <98304000>, <12288000>, <98304000>;
+	fsl,sai-asynchronous;
+	status = "okay";
+};
+
+&thermal_zones {
+	pmic-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
+		trips {
+			pmic_alert0: trip0 {
+				temperature = <110000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+			pmic_crit0: trip1 {
+				temperature = <125000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+		cooling-maps {
+			map0 {
+				trip = <&pmic_alert0>;
+				cooling-device = <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
+/* eMMC */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+/* WIFI */
+&usdhc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_wifi>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_esai0: esai0grp {
+		fsl,pins = <
+			IMX8QM_ESAI0_FSR_AUD_ESAI0_FSR				0xc6000040
+			IMX8QM_ESAI0_FST_AUD_ESAI0_FST				0xc6000040
+			IMX8QM_ESAI0_SCKR_AUD_ESAI0_SCKR			0xc6000040
+			IMX8QM_ESAI0_SCKT_AUD_ESAI0_SCKT			0xc6000040
+			IMX8QM_ESAI0_TX0_AUD_ESAI0_TX0				0xc6000040
+			IMX8QM_ESAI0_TX5_RX0_AUD_ESAI0_TX5_RX0			0xc6000040
+			IMX8QM_MCLK_OUT0_AUD_ACM_MCLK_OUT0			0xc600004c
+		>;
+	};
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			IMX8QM_ENET0_MDC_CONN_ENET0_MDC				0x06000048
+			IMX8QM_ENET0_MDIO_CONN_ENET0_MDIO			0x06000048
+			IMX8QM_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL	0x06000048
+			IMX8QM_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC		0x06000048
+			IMX8QM_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0		0x06000048
+			IMX8QM_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1		0x06000048
+			IMX8QM_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2		0x06000048
+			IMX8QM_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3		0x06000048
+			IMX8QM_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC		0x06000048
+			IMX8QM_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL	0x06000048
+			IMX8QM_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0		0x06000048
+			IMX8QM_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1		0x06000048
+			IMX8QM_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2		0x06000048
+			IMX8QM_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3		0x06000048
+			IMX8QM_ESAI0_TX2_RX3_LSIO_GPIO2_IO28			0x06000028
+		>;
+	};
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			IMX8QM_ESAI1_FSR_LSIO_GPIO2_IO04			0x00000041
+			IMX8QM_ESAI1_FST_LSIO_GPIO2_IO05			0x00000041
+			IMX8QM_ESAI1_SCKR_LSIO_GPIO2_IO06			0x00000041
+			IMX8QM_ESAI1_SCKT_LSIO_GPIO2_IO07			0x00000041
+			IMX8QM_SPDIF0_EXT_CLK_LSIO_GPIO2_IO16			0x00000041
+		>;
+	};
+
+	pinctrl_i2c0: i2c0grp {
+		fsl,pins = <
+			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0xc6000020
+			IMX8QM_HDMI_TX0_TS_SDA_DMA_I2C0_SDA			0xc6000020
+		>;
+	};
+
+	pinctrl_lpuart1: lpuart1grp {
+		fsl,pins = <
+			IMX8QM_UART1_RX_DMA_UART1_RX				0x06000020
+			IMX8QM_UART1_TX_DMA_UART1_TX				0x06000020
+			IMX8QM_UART1_CTS_B_DMA_UART1_RTS_B			0x06000020
+			IMX8QM_UART1_RTS_B_DMA_UART1_CTS_B			0x06000020
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK				0x06000041
+			IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD				0x00000021
+			IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0			0x00000021
+			IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1			0x00000021
+			IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2			0x00000021
+			IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3			0x00000021
+			IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4			0x00000021
+			IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5			0x00000021
+			IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6			0x00000021
+			IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7			0x00000021
+			IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE			0x06000041
+			IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B			0x00000021
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK				0x06000040
+			IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD				0x00000020
+			IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0			0x00000020
+			IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1			0x00000020
+			IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2			0x00000020
+			IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3			0x00000020
+			IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4			0x00000020
+			IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5			0x00000020
+			IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6			0x00000020
+			IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7			0x00000020
+			IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE			0x06000040
+			IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B			0x00000020
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK				0x06000040
+			IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD				0x00000020
+			IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0			0x00000020
+			IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1			0x00000020
+			IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2			0x00000020
+			IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3			0x00000020
+			IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4			0x00000020
+			IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5			0x00000020
+			IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6			0x00000020
+			IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7			0x00000020
+			IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE			0x06000040
+			IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B			0x00000020
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			IMX8QM_USDHC2_CLK_CONN_USDHC2_CLK			0x06000041
+			IMX8QM_USDHC2_CMD_CONN_USDHC2_CMD			0x00000021
+			IMX8QM_USDHC2_DATA0_CONN_USDHC2_DATA0			0x00000021
+			IMX8QM_USDHC2_DATA1_CONN_USDHC2_DATA1			0x00000021
+			IMX8QM_USDHC2_DATA2_CONN_USDHC2_DATA2			0x00000021
+			IMX8QM_USDHC2_DATA3_CONN_USDHC2_DATA3			0x00000021
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3100mhzgrp {
+		fsl,pins = <
+			IMX8QM_USDHC2_CLK_CONN_USDHC2_CLK			0x06000040
+			IMX8QM_USDHC2_CMD_CONN_USDHC2_CMD			0x00000020
+			IMX8QM_USDHC2_DATA0_CONN_USDHC2_DATA0			0x00000020
+			IMX8QM_USDHC2_DATA1_CONN_USDHC2_DATA1			0x00000020
+			IMX8QM_USDHC2_DATA2_CONN_USDHC2_DATA2			0x00000020
+			IMX8QM_USDHC2_DATA3_CONN_USDHC2_DATA3			0x00000020
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			IMX8QM_USDHC2_CLK_CONN_USDHC2_CLK			0x06000040
+			IMX8QM_USDHC2_CMD_CONN_USDHC2_CMD			0x00000020
+			IMX8QM_USDHC2_DATA0_CONN_USDHC2_DATA0			0x00000020
+			IMX8QM_USDHC2_DATA1_CONN_USDHC2_DATA1			0x00000020
+			IMX8QM_USDHC2_DATA2_CONN_USDHC2_DATA2			0x00000020
+			IMX8QM_USDHC2_DATA3_CONN_USDHC2_DATA3			0x00000020
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			/* GPIOs used by user space WiFi init */
+			IMX8QM_SCU_GPIO0_07_SCU_DSC_RTC_CLOCK_OUTPUT_32K	0xc600004c
+			IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x06000021
+			IMX8QM_SCU_GPIO0_02_LSIO_GPIO0_IO30			0x00000021
+			IMX8QM_QSPI1A_DATA0_LSIO_GPIO4_IO26			0x00000021
+		>;
+	};
+};
-- 
2.47.3


