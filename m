Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B2ECCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqiilCvBT89TNpnfIdoOAPlel/VpSlUIATq3oQ5TsnI=; b=KOLBwf37D2EtnZkAGHCQGWG9SU
	3YkDHT4Cnu4/IYjDFYFTqZINJrVWQGI17HEaR4sy2K4bwE3YshQhb5Y3pxHIZA2czAtXm4EirwFop
	ghgP76rcEPu68uCN6y7V3Rhiw3Dp+AmYhvWpLU0D5hIakxsv4lBMMWfQg/C2wFIq4C7MyW1SHa8yO
	UptbNDwlKle9kPl/SD7zXTBzSYhde3OWWsuj8hOQDdSxcFYu/nXWAc2MYNZEgN9VKYI2muq/yzGyH
	VAo2pkP3DRUivsUf+sd4PipdOUqqnzGs+qjYNfe7FqHf0kfU6jdOyN9xvY/zBx0nUcXT/HyWhIyLq
	cB9ofTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiM8-0000000Fseb-40my;
	Tue, 28 Oct 2025 11:59:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiM7-0000000FseP-0TD7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Oct 2025 11:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GqiilCvBT89TNpnfIdoOAPlel/VpSlUIATq3oQ5TsnI=; b=NSbBiSip//tFikt8nO77/sMMJl
	qOXkvxTuSfYH+24L6+1yzClS36WEYA8uUjYvP6qY0watTacy0gInSpd+vB6Tziirn5mlej1aRKL+t
	0S2TaODN8m0emU22vzM4P+xnTA8pK3iK+uXk9kUOAyR+I3PT16WcjrfOLCHHxva6kJXkSZ0FuHYuU
	hlA5DzbNb9ZtfCaVKRFN9DYSWmqf36rnfWnbleDvhmMDkz3G3D8tmyDMFhixTtyG51aSiuv7Mrajd
	kJVwCheRTBXgzRULVcPOD5Wdn6KoyTZ0Ada/oReW0wJvcH5IoHidm1Rbva2BmteL6mqPcawXUP/+i
	7dtnZyBg==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhUK-00000004Iil-0zdb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 11:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GqiilCvBT89TNpnfIdoOAPlel/VpSlUIATq3oQ5TsnI=; b=aNtHXz7Qio/7YewRk/tpYqSx5v
	JCCN3sra/xcNi2hlzNxV8YFgYJEZ5Rk0ffAp655Znesk+KM6K+CztLoJX5nxI+Xe2V9r1GSiO4Lcb
	+3m1g+tjL2GYlAbgGjNzadbWQ8BM9x/SxM9O1yzPcvmpe1VSmrHubMwwlyw4ohhEoQuumvkbq76Un
	MBu4tw2lBtu0CdC/xB1m4Tg1hjPYV/oCFE+rByS7kCKFAC/PI7mTjzTww/HINZpl5j8EhfE/06zIQ
	wDD217wfEFq/Flh6hGyJ6WJbfTgxzcmGph1zmsy8crBozSrRQdKJ6C28cxDMqtbWi72APdsDu8bef
	nfNebSEg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:39330 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vDiLI-00000009Q7M-0bQf;
	Tue, 28 Oct 2025 12:58:22 +0100
From: Primoz Fiser <primoz.fiser@norik.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx93-phyboard-nash: Add pwm-fan overlay
Date: Tue, 28 Oct 2025 12:58:20 +0100
Message-Id: <20251028115820.3165399-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028115820.3165399-1-primoz.fiser@norik.com>
References: <20251028115820.3165399-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_110340_611152_1FCCC35B 
X-CRM114-Status: GOOD (  11.19  )
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

Add overlay to support PWM fan on the phyBOARD-Nash-i.MX93 board. Fan
can be connected to the FAN (X48) connector on the board and will be
controlled according to the following CPU temperature trips table:

 - bellow 50 degrees - fan is off (<1% duty cycle)
 - between 50 and 58 degrees - low fan speed (~35% duty cycle)
 - between 58 and 65 degrees - fan medium speed (~60% duty cycle)
 - above 65 degrees - fan at full speed (>99% duty cycle)

The output frequency of PWM signal is set to 25 kHz.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
Changes in v2:
- add Reviewed-by: tag

Link to v1: https://lore.kernel.org/all/20251007084028.1125185-2-primoz.fiser@norik.com/

 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../imx93-phyboard-nash-pwm-fan.dtso          | 75 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 33151065684f..e5c71dd7f4f3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -359,11 +359,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
 imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
+imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
 imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
 imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
 imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso
new file mode 100644
index 000000000000..d1adf04d56d9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ * Author: Primoz Fiser <primoz.fiser@norik.com>
+ */
+
+#include <dt-bindings/pwm/pwm.h>
+#include "imx93-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_fan>;
+		cooling-levels = <1 90 150 200 255>;
+		pwms = <&tpm6 1 40000 PWM_POLARITY_INVERTED>;
+	};
+
+	thermal-zones {
+		cpu-thermal {
+			trips {
+				cpu_low: cpu-low {
+					hysteresis = <3000>;
+					temperature = <50000>;
+					type = "active";
+				};
+
+				cpu_med: cpu-med {
+					hysteresis = <3000>;
+					temperature = <58000>;
+					type = "active";
+				};
+
+				cpu_high: cpu-high {
+					hysteresis = <3000>;
+					temperature = <65000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map1 {
+					cooling-device = <&fan0 1 1>;
+					trip = <&cpu_low>;
+				};
+
+				map2 {
+					cooling-device = <&fan0 2 2>;
+					trip = <&cpu_med>;
+				};
+
+				map3 {
+					cooling-device = <&fan0 4 4>;
+					trip = <&cpu_high>;
+				};
+			};
+		};
+	};
+};
+
+&tpm6 {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_fan: fangrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO23__TPM6_CH1	0x31e
+		>;
+	};
+};
-- 
2.34.1


