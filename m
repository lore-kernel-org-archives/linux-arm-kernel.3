Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4614DD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 07:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxihMZcjnq2w9IEiH/jMCHOlqjiWFI46GZ/SZbxIzT4=; b=OMQe38MfJfpvZ+ohMSbbfX8QcZ
	jhx0k2hwWCA6o1XsvMKMSdzWBYeCakEHiBgVZJw45uW4KTrW/ESAHRRpfj4xoSFEX5Pu2ja1x9/X3
	/pRKwjviUZyV8+g9p4LgyRWlvug5sCzMmSh36NQ/UbQfTPrp0vVL3MebqsgupV8kO53rin4WZBljE
	fNw4iyd3i5wrrCBLn6QU8U7xE8ptNBq9NpsjqCsFqwOkSPKykBJXfN0hdHh3tguJtzgqwSOYIjFXF
	Oou33hM4tvHCPi2uRboF2NWMs23VyuNGXFjlocOhNjyMvv3mInstgyqjoUmrdVQXYK150zgqvA4Tk
	UY5th4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWSv-0000000G7fi-1a1s;
	Thu, 27 Nov 2025 07:30:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWSj-0000000G7ZY-0nES;
	Thu, 27 Nov 2025 07:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BC6244063;
	Thu, 27 Nov 2025 07:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBA62C113D0;
	Thu, 27 Nov 2025 07:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228644;
	bh=VlPK9YoqpoRr+lpStVZMNzj30vUjm3u6aa2LU2vTg9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oECKsbmd0ZHUVh3FiZ40fH4ZQ9KutJzS7JNHB6rEiEz2f6z3S1g255KNl6rwQFKn8
	 eDG/KDB0RBz6iW25nvgNySl4EqK2ugglFGSfKkSY+MSW4t3JoEaPkFIhvetosGwjKJ
	 DQ8I8dzP+9Ib00MVIKfJU23kuI3kTWNOxDnaV81/KgVGflWGOqGnEYS99fm10Ejjue
	 SoVxk2z5tHqMuFRVsrEXDTtt6ENKHJZOE7M627Kdiuj55VZA7mVB9NvqAXplWryCwF
	 afPkOJ/yH06d360naUFwcIi42Eho7s2iXzZtx6lLR68sBeErXL1bO7l58fAqdkndEP
	 L6/1pMjWsR27g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E345DD116F3;
	Thu, 27 Nov 2025 07:30:43 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Nov 2025 15:30:32 +0800
Subject: [PATCH 2/4] arm64: dts: amlogic: Add S6 Reset Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-reset-s6-s7-s7d-v1-2-879099ad90d3@amlogic.com>
References: <20251127-reset-s6-s7-s7d-v1-0-879099ad90d3@amlogic.com>
In-Reply-To: <20251127-reset-s6-s7-s7d-v1-0-879099ad90d3@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764228641; l=6210;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=DBjDoIozgGAUkaE0mfMdnA0X88fxJQ65BViRQ8l6yOs=;
 b=h/lZAE+XcJ+mE3c/pYE79oIlKEtDQbfh3Bu/HJxiilUPXOPA5LnQsCOXVfyRZ5GfNNASu++es
 1WVqaFz6zkMBP9P6IgOs0RSiBaEA+UmZ4TPfFWt+l5gQ604jRWZ39oU
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_233045_288507_BE8316A1 
X-CRM114-Status: GOOD (  12.16  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the device node and related header file for Amlogic
S6 reset controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s6-reset.h | 171 +++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi    |   8 ++
 2 files changed, 179 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-s6-reset.h
new file mode 100644
index 000000000000..eb665b0b8fce
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6-reset.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2025 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_S6_RESET_H
+#define _DT_BINDINGS_AMLOGIC_S6_RESET_H
+
+/* RESET0 */
+/*					0-1	*/
+#define RESET_U3DRD_USB3PHY_APB		2
+#define RESET_U3DRD_USB3PHY		3
+#define RESET_U3DRD_USB2PHY		4
+#define RESET_U3DRD			5
+#define RESET_U3DRD_COMB		6
+#define RESET_U2DRD			7
+#define RESET_U2DRD_COMB		8
+#define RESET_U2DRD_USB2PHY		9
+#define RESET_USB_CC			10
+#define RESET_BC			11
+#define RESET_VC9000E_APB		12
+#define RESET_VC9000E			13
+#define RESET_VC9000E_CORE		14
+#define RESET_HDMI20_AES		15
+#define RESET_HDMITX_CAPB3		16
+#define RESET_BRQ_VCBUS_DEC		17
+#define RESET_VCBUS			18
+#define RESET_VID_PLL_DIV		19
+#define RESET_VDI6			20
+/*					21	*/
+#define RESET_HDMITXPHY			22
+#define RESET_VID_LOCK			23
+#define RESET_VENCL			24
+#define RESET_VDAC			25
+#define RESET_VENCP			26
+#define RESET_VENCI			27
+#define RESET_RDMA			28
+#define RESET_HDMITX			29
+#define RESET_VIU			30
+#define RESET_VENC			31
+
+/* RESET1 */
+#define RESET_AUDIO			32
+#define RESET_MAIL_CAPB3		33
+#define RESET_MAIL			34
+#define RESET_DDR_APB			35
+#define RESET_DDR			36
+#define RESET_DOS_CAPB3			37
+#define RESET_DOS			38
+#define RESET_MALI_SYS			39
+#define RESET_I_DSPA			40
+#define RESET_I_DEBUGA			41
+#define RESET_U3P2_PHY_APB		42
+#define RESET_PCIE_PIPE			43
+#define RESET_PCIE_A			44
+#define RESET_PCIE_PHY			45
+#define RESET_PCIE_APB			46
+#define RESET_AMFC_APB			47
+#define RESET_ETHERNET			48
+/*					49-50	*/
+#define RESET_BRG_ETH_APB_SYNC		51
+#define RESET_VICP			52
+#define RESET_DEWARP			53
+#define RESET_GE2D			54
+#define RESET_VGE			55
+#define RESET_PCIE0			56
+#define RESET_PCIE1			57
+#define RESET_PCIE2			58
+#define RESET_PCIE3			59
+#define RESET_PCIE4			60
+#define RESET_PCIE5			61
+#define RESET_PCIE6			62
+#define RESET_PCIE7			63
+
+/* RESET2 */
+#define RESET_AM2AXI			64
+#define RESET_IR_CTRL			65
+#define RESET_MIPI_DSI_PHY		66
+#define RESET_TS_PLL			67
+#define RESET_MIPI_CSI2_PHY0		68
+#define RESET_ETH_AXI			69
+/*					70-71	*/
+#define RESET_SMART_CARD		72
+#define RESET_SPICC_0			73
+#define RESET_BRG_VGE_PIPEL1		74
+#define RESET_BRG_VC9000E_PIPEL1	75
+#define RESET_BRG_AMFC_PIPEL1		76
+/*					77	*/
+#define RESET_NNA_APB			78
+#define RESET_NNA			79
+#define RESET_MSR_CLK			80
+/*					81	*/
+#define RESET_SAR_DIG			82
+#define RESET_SAR_ANA			83
+/*					84-85	*/
+#define RESET_AMFC			86
+/*					87-88	*/
+#define RESET_CEC			89
+/*					90	*/
+#define RESET_WATCHDOG			91
+/*					92	*/
+#define RESET_MIP_DSI_HOST		93
+/*					94-95	*/
+
+/* RESET3 */
+/* 96 ~ 127 */
+
+/* RESET4 */
+#define RESET_PWM_A			128
+#define RESET_PWM_B			129
+#define RESET_PWM_C			130
+#define RESET_PWM_D			131
+#define RESET_PWM_E			132
+#define RESET_PWM_F			133
+#define RESET_PWM_G			134
+#define RESET_PWM_H			135
+#define RESET_PWM_I			136
+#define RESET_PWM_J			137
+#define RESET_UART_A			138
+#define RESET_UART_B			139
+#define RESET_UART_C			140
+#define RESET_UART_D			141
+#define RESET_UART_E			142
+/*					143	*/
+#define RESET_I2C_S_A			144
+#define RESET_I2C_M_A			145
+#define RESET_I2C_M_B			146
+#define RESET_I2C_M_C			147
+#define RESET_I2C_M_D			148
+#define RESET_I2C_M_E			149
+/*					150-151	*/
+#define RESET_SDEMMC_A			152
+#define RESET_SDEMMC_B			153
+#define RESET_SDEMMC_C			154
+/*					155-159	*/
+
+/* RESET5 */
+#define RESET_BRG_VDEC_PIPEL		160
+#define RESET_BRG_SDIOA_PIPEL		161
+#define RESET_BRG_SDIOB_PIPEL		162
+#define RESET_BRG_EMMC_PIPEL		163
+#define RESET_BRG_GE2D_DMC_PIPEL	164
+#define RESET_BRG_DMC_VPU_PIPEL1	165
+#define RESET_BRG_A53_DMC_PIPEL1	166
+#define RESET_BRG_MAIL_DMC_PIPEL	167
+/*					168	*/
+#define RESET_BRG_MAIL_DMC_PIPEL1	169
+#define RESET_BRG_U2DRD_PIPEL		170
+#define RESET_BRG_U2H_PIPEL		171
+#define RESET_BRG_HEVCF_PIPEL1		172
+#define RESET_BRG_AMBUS_ETH_PIPEL1	173
+#define RESET_BRG_SRAM_NIC_NNA		174
+#define RESET_BRG_SRAM_NIC_MAIN		175
+#define RESET_BRG_SRAM_NIC_DEV		176
+#define RESET_BRG_SRAM_NIC_CPU		177
+#define RESET_BRG_SRAM_NIC_ALL		178
+#define RESET_BRG_CPU_NIC_RAMA		179
+#define RESET_BRG_CPU_NIC_VAPB		180
+#define RESET_BRG_CPU_NIC_DSU		181
+#define RESET_BRG_CPU_NIC_CLK81		182
+#define RESET_BRG_CPU_NIC_ALL		183
+#define RESET_BRG_NIC_CAPU		184
+#define RESET_BRG_AO_NIC_EMMC		185
+#define RESET_BRG_AO_NIC_DSPA		186
+#define RESET_BRG_AO_NIC_SDIOB		187
+#define RESET_BRG_AO_NIC_SDIOA		188
+#define RESET_BRG_AO_NIC_CLK81		189
+#define RESET_BRG_AO_NIC_MAIN		190
+#define RESET_BRG_AO_NIC_ALL		191
+
+#endif
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index 8ef631939033..386244b3a1f5 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,s6-pwrc.h>
+#include "amlogic-s6-reset.h"
 / {
 	cpus {
 		#address-cells = <2>;
@@ -104,6 +105,13 @@ uart_b: serial@7a000 {
 				status = "disabled";
 			};
 
+			reset: reset-controller@2000 {
+				compatible = "amlogic,s6-reset",
+					     "amlogic,meson-s4-reset";
+				reg = <0x0 0x2000 0x0 0x98>;
+				#reset-cells = <1>;
+			};
+
 			periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,pinctrl-s6";
 				#address-cells = <2>;

-- 
2.37.1



