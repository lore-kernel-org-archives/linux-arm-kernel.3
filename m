Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2840FD3B7F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeNTD5NpcQgE4jhk8SfjST6p9d7CjYjnHUOcQ0YjnOc=; b=etUc8eA2nsq9DKsGRF6iCoxTQH
	gxuHux0aLBQdHeyLNIoHh9Xo+t70/08UNiLFu/3TjvnSRKTyTvQLj+R4zBxbRJQCuovtqQk+eF70y
	0mEnPknGvjsEMffhJBWifIV5DCQEvVe26R9K7s+sOC0hogMYtyApDN/SbzLbf8+/vyBPAZAyODcjQ
	AnMSqGE+5alTUw5SSK4kGEqL80J0DtaK6I8axf5oiRU1WwbW9/krwFi6ik/2eYiF8aN9FU0UVEhT0
	1DYxE/stqGQQtrtI0dWW9nQcRlnBjhS1gLKBJUfymtRuYO1b06f6vTNdeji/EDDpYKXIV+3fLBGHv
	WcBw2lZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUUq-00000007NwQ-2tZO;
	Mon, 25 Nov 2024 08:31:04 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUIv-00000007M6Z-3SYp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AeNTD5NpcQgE4jhk8SfjST6p9d7CjYjnHUOcQ0YjnOc=; b=IQhVL1qA0dtlfDO75GsFDcyV2H
	8jUEGI0kNZZdtzVWu5Tr4OLZKMgE5WyPXqnCpG7l+bT1DP5jYPFMO1ARdJwuRxc2E+rK+ZjctvrX1
	p5loEpjG4M/u3EJCaXmwh5rKkGUTzi2QP/No3yD53znNqSR7vWShHG4Gly9SeHXlL9E9xK2AIyi4E
	DIbxbNS0c9ZfVAEEs6NO0Muocc1zqsmmasrbLvB62XEnSvK5/t+1HDkH96ctCGnIQMgTFhOWnYvi+
	RWawUu8PmlUcpgm/iXDzAk8adWsr2ZzEn4Ct9oqECS8m2tAb64HWCm9ZjwTCOwNT8AoKAc7ynfgJf
	c/a/E+cg==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIu-00Eq70-2u;
	Mon, 25 Nov 2024 09:18:44 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 12/15] arm64: dts: imx8mm-phyboard-polis: Add overlay for PEB-EVAL-01
Date: Mon, 25 Nov 2024 09:18:11 +0100
Message-Id: <20241125081814.397352-13-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_001846_014579_8C886EF6 
X-CRM114-Status: UNSURE (   9.24  )
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

From: Janine Hagemann <j.hagemann@phytec.de>

Add support for the PEB-EVAL-01 expansion board for
phyBOARD-Polis-i.MX8MM.

Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../imx8mm-phyboard-polis-peb-eval-01.dtso    | 72 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b411d76c3d1d..99be36a04db9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -124,8 +124,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-rdk.dtb
 
 imx8mm-phyboard-polis-peb-av-10-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-av-10.dtbo
+imx8mm-phyboard-polis-peb-eval-01-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-eval-01.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-eval-01.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phygate-tauri-l.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso
new file mode 100644
index 000000000000..2ca4ae6e2bf2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 PHYTEC Messtechnik GmbH
+ * Author: Janine Hagemann <j.hagemann@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include "imx8mm-pinfunc.h"
+
+&{/} {
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>;
+
+		button-0 {
+			label = "home";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-1 {
+			label = "menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	user-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_user_leds>;
+
+		user-led1 {
+			gpios = <&gpio4 14 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		user-led2 {
+			gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		user-led3 {
+			gpios = <&gpio5 28 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_gpio_keys: gpio_keysgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI1_TXD5_GPIO4_IO17	0x16
+			MX8MM_IOMUXC_UART4_TXD_GPIO5_IO29	0x16
+		>;
+	};
+
+	pinctrl_user_leds: user_ledsgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI1_TXD3_GPIO4_IO15	0x16
+			MX8MM_IOMUXC_UART4_RXD_GPIO5_IO28	0x16
+			MX8MM_IOMUXC_SAI1_TXD2_GPIO4_IO14	0x16
+		>;
+	};
+};
-- 
2.34.1


