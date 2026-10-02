Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFF7CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhKeQUqgRHEYfGkRtz/Yeckf6aMSdSVeZAspdRE2AKU=; b=0ZKzelX3U9NeIJ3x0D/MT1J1dr
	WOmeBrysszfGP2fAt70xvesttODvlt0WKKXCImcfXzSN5aHNEAen4BbH9r9YzaEbQDapTRI0b7ys6
	MK95Gz9/l2rsSJCScadcMdgcbXkW7POsXus7PnzNo9wB52E3hAIIkep5U2/08JHbKbsqYInBhA5sq
	5dl1ze6H5LVIN+BucbjArFOKSvMCgLtBDGOrZngvsQgPQfmGJwkS9UF9MVPhKqq3Tx7uqgRx4xHPo
	KejLmQb1ExIl0rBxCD3C9r1mEpgxFq8uD9XSNhi0OOlk8XVXQxOgDphKdtZtsEyyIjWo6BX7NytY7
	aL4hf3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfJb-0000000Bwld-1ufE;
	Fri, 02 Oct 2026 15:36:51 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfJZ-0000000BwdW-0zPX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790955409; x=1822491409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ncoIcJMjN4hDAj/9N08291CMNffYFm4StbJr4oc7nMk=;
  b=ceqZAoyUNbn9ajWvu+5u2T4xqiVR3Ea6+GXJ29sPmRonJGE8TO2EWrEm
   pAlNnU2CB92hebFQhcarUnzyOVb+JDhbSXKIW1v3wr3PqVBg6GQ6ncLKW
   N03+GBv7/mg9znblwnl5FW0Qpdh0jCoGlkl5361ypOYuWWjpSMpVmhsSb
   LKhaCUPBjQKbB4C4O9mDq+xQMBRqsPTU6GacgcDcn8Og/JlnWHUXeixdz
   ICFDaakcAokXWCNh/xzKvdZqRJ6jEPhgnmgEq0z28/PJTeqojr1Ag4/2w
   CHdRKCUQJiaaQeQuX97bplepV3hBRImJOETop+6lp7YRFd5BkSPJzOzhH
   A==;
X-CSE-ConnectionGUID: oz8yHGtvRWST57YQhozQBQ==
X-CSE-MsgGUID: LbKtzYBUSqq+XsudYbnneA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="117247744"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="117247744"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:49 -0700
X-CSE-ConnectionGUID: cOn4c3uKQ3iaVHAMz3g3bg==
X-CSE-MsgGUID: v9dCpw+PTlG1CFE/lzD06g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279522427"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:46 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH 4/4] ARM: dts: aspeed: add Intel JNCRP BMC
Date: Fri,  2 Oct 2026 18:32:45 +0200
Message-ID: <bf582c24cc3222aca1b7d78a32439fd3505dfe20.1790344811.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790344811.git.dawid.glazik@linux.intel.com>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083649_288848_8545F10B 
X-CRM114-Status: GOOD (  12.99  )
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

Add the initial AST2600 device tree for the Intel JNCRP BMC platform.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 257 ++++++++++++++++++
 2 files changed, 258 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index ea4645ef9872..f0d665b3dcee 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -55,6 +55,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ibm-sbp1.dtb \
 	aspeed-bmc-ibm-system1.dtb \
 	aspeed-bmc-intel-avcrp.dtb \
+	aspeed-bmc-intel-jncrp.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-inspur-nf5280m6.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts
new file mode 100644
index 000000000000..87e5e1ce6594
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2025 Intel Corporation
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Intel JNCRP BMC";
+	compatible = "intel,jncrp-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		bootargs = "console=ttyS4,115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+&rtc {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mdio1 {
+	status = "okay";
+
+	ethphy1: ethernet-phy@0 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <0>;
+		reset-gpios = <&gpio0 ASPEED_GPIO(C, 1) GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <50000>;
+	};
+};
+
+&mac1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
+		 <&syscon ASPEED_CLK_MAC2RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy1>;
+};
+
+&lpc {
+	lpc_snoop: lpc-snoop@80 {
+		snoop-ports = <0x80>;
+		status = "okay";
+	};
+};
+
+&gpio0 {
+	status = "okay";
+	gpio-line-names =
+		/*A0-A7*/ "", "", "", "", "", "", "", "",
+		/*B0-B7*/ "PWRGD_AUX_PWRGD_BMC_CPU", "", "", "", "", "", "",
+				"FP_ID_LED_N",
+		/*C0-C7*/ "FM_FORCE_BMC_UPDATE_N", "RST_RGMII_PHYRST_N",
+				"FM_TPM_EN_PULSE", "", "", "",
+				"DBP_HOOK3_CPU_FBRK_OUT_R_N", "DBP_PRSNT_IN_N",
+		/*D0-D7*/ "CPU_ERR0_N", "CPU_ERR1_N", "CPU_ERR2_N", "DBP_ASD_BMC_PRDY_N",
+				"FM_SPD_SWITCH_CTRL_N", "", "", "",
+		/*E0-E7*/ "", "", "", "ID_BUTTON", "", "", "", "",
+		/*F0-F7*/ "", "", "FM_AGGREGATOR_MODE_N", "", "", "",
+				"FP_LED_STATUS_GREEN_R_N", "FP_LED_STATUS_AMBER_R_N",
+		/*G0-G7*/ "", "", "", "", "", "", "", "",
+		/*H0-H7*/ "", "", "", "", "", "", "", "",
+		/*I0-I7*/ "", "", "", "", "", "", "", "",
+		/*J0-J7*/ "", "", "", "", "", "", "", "",
+		/*K0-K7*/ "", "", "", "", "", "", "", "",
+		/*L0-L7*/ "", "", "", "", "PREQ_N", "FM_P3V3_SW_ENA", "", "",
+		/*M0-M7*/ "", "", "", "", "", "", "", "",
+		/*N0-N7*/ "", "", "", "", "", "", "", "",
+		/*O0-O7*/ "", "", "", "", "", "", "NMI_BUTTON", "",
+		/*P0-P7*/ "RESET_BUTTON", "RESET_OUT", "POWER_BUTTON", "POWER_OUT",
+				"", "", "", "LED_BMC_HB_LED_N",
+		/*Q0-Q7*/ "", "", "", "", "", "", "", "",
+		/*R0-R7*/ "", "", "", "", "", "", "", "",
+		/*S0-S7*/ "CPU_CATERR_IERR_N", "CPU_CATERR_MCERR_N", "FM_BMC_FRU_WP_N",
+				"FM_INTRUSION_CABLE_PRES_N", "PWRGD_CPU_AUXPWRGD",
+				"FM_P3V_BAT_SCALED_EN", "REMOTE_DEBUG_ENABLE", "",
+		/*T0-T7*/ "", "", "", "", "", "", "", "",
+		/*U0-U7*/ "", "", "", "", "", "", "", "",
+		/*V0-V7*/ "SIO_S3", "SIO_S5", "", "SIO_ONCONTROL",
+				"SIO_POWER_GOOD", "", "", "",
+		/*W0-W7*/ "", "", "", "", "", "", "", "",
+		/*X0-X7*/ "", "", "POST_COMPLETE", "", "", "", "", "",
+		/*Y0-Y7*/ "FM_BMC_CMOS_CLR_R_N", "PLTRST_N", "FM_BMC_SAFS_EN",
+				"IRQ_PSU_ALERT_LVC3_N", "", "", "", "",
+		/*Z0-Z7*/ "", "", "", "", "", "", "", "";
+
+	spd-switch-cpu-hog {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
+		output-low;
+	};
+};
+
+&sgpiom0 {
+	ngpios = <128>;
+	bus-frequency = <2000000>;
+	status = "okay";
+	gpio-line-names =
+		/*A, 0-7*/ "CPU0_VRHOT_N", "LED_POSTCODE_0_LSB",
+				"CPU0_THERMTRIP_N", "LED_POSTCODE_1",
+				"CPU0_MEMTRIP_N", "LED_POSTCODE_2",
+				"CPU0_MEM_VRHOT_N", "LED_POSTCODE_3",
+				"CPU0_MEM_HOT_N", "LED_POSTCODE_4",
+				"CPU0_MON_FAIL_N", "LED_POSTCODE_5",
+				"CPU1_VRHOT_N", "LED_POSTCODE_6",
+				"CPU1_THERMTRIP_N", "LED_POSTCODE_7_MSB",
+		/*B, 8-15*/ "CPU1_MEMTRIP_N", "FM_ASYNC_WARM_RESET_REQ",
+				"CPU1_MEM_VRHOT_N", "HPM_FRU_READ_DONE",
+				"CPU1_MEM_HOT_N", "FM_ASYNC_GLOBAL_RESET_REQ",
+				"CPU1_MON_FAIL_N", "BMC_BOOT_DONE",
+				"CPU2_VRHOT_N", "NMI_OUT",
+				"CPU2_THERMTRIP_N", "AGGREGATOR_MODE",
+				"CPU2_MEMTRIP_N", "RST_I3C_PCIE_HUB_N",
+				"CPU2_MEM_VRHOT_N", "",
+		/*C, 16-23*/ "CPU2_MEM_HOT_N", "HPM0_PRESENT",
+				"CPU2_MON_FAIL_N", "HPM1_PRESENT",
+				"CPU3_VRHOT_N", "HPM2_PRESENT",
+				"CPU3_THERMTRIP_N", "HPM3_PRESENT",
+				"CPU3_MEMTRIP_N", "HPM0_SOURCE_TO_DESTINATION_FAIL",
+				"CPU3_MEM_VRHOT_N", "HPM1_SOURCE_TO_DESTINATION_FAIL",
+				"CPU3_MEM_HOT_N", "HPM2_SOURCE_TO_DESTINATION_FAIL",
+				"CPU3_MON_FAIL_N", "HPM3_SOURCE_TO_DESTINATION_FAIL",
+		/*D, 24-31*/ "FM_BMC_VAL_EN", "HPM0_FRU_VALID",
+				"FM_SERIAL_BOOT", "HPM1_FRU_VALID",
+				"FM_INTRUSION_CABLE_PRES_N", "HPM2_FRU_VALID",
+				"USB_OC_P2_3_N", "HPM3_FRU_VALID",
+				"FM_SYSTEM_COOLING_MODE0", "FM_S2D_DISCOVERY_DONE",
+				"FM_SYSTEM_COOLING_MODE1", "", "", "", "", "",
+		/*E, 32-39*/ "DBP_PMODE_S0_PWROK", "", "DBP_PMODE_PLTRST", "",
+				"DBP_PMODE_GLOBALRESET", "", "DBP_PMODE_CPU_PWRGD", "",
+				"FM_SMBUS_RDY", "", "FM_LEAK_DETECTION", "",
+				"FM_LEAK_CBL_PRSNT_N", "", "FM_LEAK_CBL_FAULT_N", "",
+		/*F, 40-47*/ "CPU0_SKTOCC1_N", "CPU0_SKT_FAULT_LED",
+				"CPU0_SKTOCC2_N", "CPU1_SKT_FAULT_LED",
+				"CPU0_MISMATCH", "CPU2_SKT_FAULT_LED",
+				"CPU1_SKTOCC1_N", "CPU3_SKT_FAULT_LED",
+				"CPU1_SKTOCC2_N", "", "CPU1_MISMATCH", "",
+				"CPU2_SKTOCC1_N", "", "CPU2_SKTOCC2_N", "",
+		/*G, 48-55*/ "CPU2_MISMATCH", "", "CPU3_SKTOCC1_N", "",
+				"CPU3_SKTOCC2_N", "", "CPU3_MISMATCH", "",
+				"HPM0_PRSNT_N", "", "HPM1_PRSNT_N", "",
+				"HPM2_PRSNT_N", "", "HPM3_PRSNT_N", "",
+		/*H, 56-63*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*I, 64-71*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*J, 72-79*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*K, 80-87*/ "FM_BOARD_REV_ID0", "", "FM_BOARD_REV_ID1", "",
+				"FM_BOARD_REV_ID2", "", "FM_BOARD_SKU_ID0", "",
+				"FM_BOARD_SKU_ID1", "", "FM_BOARD_SKU_ID2", "",
+				"FM_BOARD_SKU_ID3", "", "FM_BOARD_SKU_ID4", "",
+		/*L, 88-95*/ "FM_BOARD_SKU_ID5", "", "FM_BOARD_SKU_ID6", "",
+				"FM_BOARD_SKU_ID7", "", "", "", "", "", "", "",
+				"", "", "", "",
+		/*M, 96-103*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*N, 104-111*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*O, 112-119*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*P, 120-127*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "";
+};
+
+&i3c_global {
+	status = "okay";
+};
+
+&i3c1 {
+	status = "okay";
+	mctp-controller;
+	i2c-scl-hz = <1000000>;
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c8 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c9 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c10 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c13 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	multi-master;
+	status = "okay";
+};
-- 
2.43.0


