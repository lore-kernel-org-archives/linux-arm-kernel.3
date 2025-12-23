Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8ECE6ADF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 05:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9sPfj+1nXNfy6XRhZ53lA57h2cCDNgdDiH2054BPv8=; b=om70PeSWLkEAr0GD83g0s9By7L
	e49pICGCnC+YHmMbvo0xNR0/1q2/YlxZxPLJX0qjjLl748Eptl00RUvQh0WlEIQCBu0DNPrXqcei5
	t5akJac6puog3T+d6QMnJIssxYid6e5gPzHeeJiT1vAGq80VWo/+peSG1kBt3Zuo7PnceZC7WAoIN
	+LBH1JCL1R9qeDbUkR/rDinTKhIE3zc/38jVeF0V9BVlHJ4CXmKZsLieYzn2F6knBrRRdVkLmCU9a
	Non08F1weoKxqwaOMzWkGBGUbtYn8iSweG75+J+6StJ3sUJEojYZvuRSb6L3GHsrEwc5JK2swLlgo
	yyjvAw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv5O-0000000EY6O-1dZ9;
	Tue, 23 Dec 2025 05:37:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv57-0000000EXx0-3EXQ;
	Tue, 23 Dec 2025 05:37:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8EC944340;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65DF0C19423;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766468232;
	bh=Ep+ac+R6I1EjjNFNEGIEPw5hetO+xIBtQ+QP0Lu1Src=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q2d06AcWY1cmaNOVXxapU4h58QH7WyI7XAN8/WW7+q5q4qnMD23PLoIeKKmG6wv0g
	 jSLPOQfHWkvUaiqBAD+xkpSesJoixX0RjXihcoT5VcYyQupvZH+0hlDxH0/WcuMLCM
	 +OknDj6gJB28DmBthaT+LAauN5M1Nuvr3yVxdQIJWnWl3VrGagPX+W+kJYqgxrUH6Y
	 Bu7isnnDqUVIXSEB25WblAsnRZAKrg603E0P+buZsw59kpC/mRnQBw2dMlWzvEb9CC
	 dH4VgE+qPOx4QrttrpDoCjpXLKe7AEGRxqJhf0kdVjxnhKElKz5uSAfnbzs+P6mDSW
	 qO2Nthr3x8XgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF2AE6ADF9;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 23 Dec 2025 05:37:11 +0000
Subject: [PATCH v2 3/4] arm64: dts: amlogic: Add S7 Reset Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-reset-s6-s7-s7d-v2-3-958f341449f1@amlogic.com>
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766468230; l=4612;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=Fr+n33k6HHrDopySr/XnGf+wJrkcpny3tUyJ6cnpMXA=;
 b=jS+mm9Z3V5aX70iBZPI2HiRzkuST9EuPzGBDoFmEhtCZ3dtktFrr8/9pNYxL64B853573PBk2
 znUSLGqsdpgAlFAx3NyJlSCv3UuOYQQSFmFxMXvxiKwyAhCOzUWPI4X
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_213713_882704_43564999 
X-CRM114-Status: GOOD (  12.24  )
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
S7 reset controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7-reset.h | 124 +++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi    |   8 ++
 2 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-s7-reset.h
new file mode 100644
index 000000000000..243136aaf8ec
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7-reset.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2025 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_S7_RESET_H
+#define _DT_BINDINGS_AMLOGIC_S7_RESET_H
+
+/* RESET0 */
+#define RESET_USB_DDR0			0
+#define RESET_USB_DDR1			1
+#define RESET_USB_DDR2			2
+#define RESET_USB_DDR3			3
+#define RESET_USB1			4
+#define RESET_USB0			5
+#define RESET_USB1_COMB			6
+#define RESET_USB0_COMB			7
+#define RESET_USBPHY20			8
+#define RESET_USBPHY21			9
+/*					10-14	*/
+#define RESET_HDMI20_AES		15
+#define RESET_HDMITX_CAPB3		16
+#define RESET_BRG_VCBUS_DEC		17
+#define RESET_VCBUS			18
+#define RESET_VID_PLL_DIV		19
+#define RESET_VIDEO6			20
+#define RESET_GE2D			21
+#define RESET_HDMITXPHY			22
+#define RESET_VID_LOCK			23
+#define RESET_VENCL			24
+#define RESET_VDAC			25
+#define RESET_VENCP			26
+#define RESET_VENCI			27
+#define RESET_RDMA			28
+#define RESET_HDMI_TX			29
+#define RESET_VIU			30
+#define RESET_VENC			31
+
+/* RESET1 */
+#define RESET_AUDIO			32
+#define RESET_MALI_CAPB3		33
+#define RESET_MALI			34
+#define RESET_DDR_APB			35
+#define RESET_DDR			36
+#define RESET_DOS_CAPB3			37
+#define RESET_DOS			38
+/*					39-47	*/
+#define RESET_ETH			48
+/*					49-63	*/
+
+/* RESET2 */
+#define RESET_AM2AXI			64
+#define RESET_IR_CTRL			65
+/*					66	*/
+#define RESET_TEMPSENSOR_PLL		67
+/*					68-71	*/
+#define RESET_SMART_CARD		72
+#define RESET_SPICC0			73
+/*					74-79	*/
+#define RESET_MSR_CLK			80
+/*					81	*/
+#define RESET_SARADC			82
+/*					83-87	*/
+#define RESET_ACODEC			88
+#define RESET_CEC			89
+/*					90	*/
+#define RESET_WATCHDOG			91
+/*					92-95	*/
+
+/* RESET3 */
+/* 96 ~ 127 */
+
+/* RESET4 */
+/*					128-131	*/
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
+/*					140-143	*/
+#define RESET_I2C_S_A			144
+#define RESET_I2C_M_A			145
+#define RESET_I2C_M_B			146
+#define RESET_I2C_M_C			147
+#define RESET_I2C_M_D			148
+#define RESET_I2C_M_E			149
+/*					150-151	*/
+#define RESET_SD_EMMC_A			152
+#define RESET_SD_EMMC_B			153
+#define RESET_SD_EMMC_C			154
+/*					155-159	*/
+
+/* RESET5 */
+#define RESET_BRG_VDEC_PIPE0		160
+#define RESET_BRG_HEVCF_PIPE0		161
+/*					162-163	*/
+#define RESET_BRG_GE2D_PIPE0		164
+#define RESET_BRG_DMC_PIPE0		165
+#define RESET_BRG_A53_PIPE0		166
+#define RESET_BRG_MALI_PIPE0		167
+/*					168	*/
+#define RESET_BRG_MALI_PIPE1		169
+/*					170-171	*/
+#define RESET_BRG_HEVCF_PIPE1		172
+#define RESET_BRG_HEVCB_PIPE1		173
+/*					174-182	*/
+#define RESET_BRG_NIC_EMMC		183
+#define RESET_BRG_NIC_RAMA		184
+#define RESET_BRG_NIC_SDIOB		185
+#define RESET_BRG_NIC_SDIOA		186
+#define RESET_BRG_NIC_VAPB		187
+#define RESET_BRG_NIC_DSU		188
+#define RESET_BRG_NIC_CLK81		189
+#define RESET_BRG_NIC_MAIN		190
+#define RESET_BRG_NIC_ALL		191
+
+#endif
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index a3faf4d188e1..0b2ac24e8dbc 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>
+#include "amlogic-s7-reset.h"
 
 / {
 	cpus {
@@ -142,6 +143,13 @@ uart_b: serial@7a000 {
 				status = "disabled";
 			};
 
+			reset: reset-controller@2000 {
+				compatible = "amlogic,s7-reset",
+					     "amlogic,meson-s4-reset";
+				reg = <0x0 0x2000 0x0 0x98>;
+				#reset-cells = <1>;
+			};
+
 			periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,pinctrl-s7";
 				#address-cells = <2>;

-- 
2.52.0



