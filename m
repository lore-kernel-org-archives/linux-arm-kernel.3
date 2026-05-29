Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46693CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clN6wdSkjaXLXwCgf9/FLjly93DEMRnjE35Sh9qesgU=; b=elk+eopnHQO0Urj1hvb23ULirC
	Sb+dJHV7xkbms4bt7uKBrqdHPELbrx3v6Z0SY8EsGwf2MDP/gaoZNms/Xg0kCnjg0Jl310Lw2V5pX
	sPA7dW5ILOvXLz3q4nZlgA9gvnpIYX65sfrzIZYhPO5y3JZfi1kFOJVcMeARpFKhe5eN//avY2VjW
	WYD3CpBiPgHGCYlGEOxohGlJX0WxIcsMCnlaHPWRNGvTo+vdzL9Q2qeEablYmsoSCwgEDDgUkSVn9
	+xgJCjWUEADZY7wa9MLsDd/pKgBWUl/UU+zfmLaCroyavF/eJZsco3JAlg8+QdIXVyWCHere33UOC
	Qbin77xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv24-00000007F7m-2Neh;
	Fri, 29 May 2026 11:05:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv1z-00000007F6H-2CHk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:05:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so1110515f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780052734; x=1780657534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clN6wdSkjaXLXwCgf9/FLjly93DEMRnjE35Sh9qesgU=;
        b=LNPwKOGhnbroC2fgv3I2XiECmTFw9szskxKly20yI4GQBLVjdjiMl9yU7fi4idpSp2
         W3yJZeyhxSIDTWrbIhsWxgxhpLaJtn9gtzsJ2d+yi8z0B4iNomqjj+1+gCNqkSXsh3OK
         Q+MYKh6nbrdguwxk+q5k6F3mFW1ffPkk4W4DMSBBOdYsU+Fp6U330ywv46XWrnkNvY4J
         hXq6/32p6d2XpZa8QaTRi6BV/rRBrG9ZsTkeVUWD9MfJ03sRzacuiwox4VjzlUh72geU
         yRa+YciEhABAvdu867SziHVUzhKkgDfwfOh28V2/AxV68vfWwNBKirBeQW7pDVfpjIqr
         VI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052734; x=1780657534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=clN6wdSkjaXLXwCgf9/FLjly93DEMRnjE35Sh9qesgU=;
        b=J9Q7F1o+vv2e86ySQJmvtxQMTMfVRLjG2PESmCwe7xx3feXyWe41efCf2Frx7VIt0K
         3n8/K9wJXNkN+jVTXa4E7Yhd0M3HcIOkH8TyDzH4TKxsySyiD0KKvJxCXwjafjMuTgLT
         HJ2jI+stpf+NP/K3UElosYG9cxeSOZd/6BKM5KChw98niVqQgLR6b6/wbe/Lf2VKTNh6
         tNe9+RxBUKwsr77Sei4wDNi/anCqe+xiHhPxUBFDbwrv090HE7wYG3viu5xr6z0WQzlT
         zFJBOhUT92fHPploYJcqqklSwW8SSmPgn1YoumQD7kQ5jcauaB/S031H7e4o8ckNjr/M
         7p/A==
X-Forwarded-Encrypted: i=1; AFNElJ9bmcQm+J/wlcg5mNUJrkY9pA3khjI+ncqkYG46FpKzxpJj4DK7QRq/TY9TKCLXiAsOLWRpMb3tu67tgpb1DJVj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb4yXf8STnbP7RjWw0cjrsxr5NpKsncgUbSuJZ0g+8a8y3Hq3K
	iDQMoI6SCRAhVjsekC3GpS695KsBQsBTwavGZzmf0yABbpOjLU5B3M2N
X-Gm-Gg: Acq92OH0JN12Kn0vCqN+Yi56CQzyjLcbO71W+QnUGeHuSr4L92XIP6slZ9AXq1e0l8E
	9w4laypFcNAEXQT1GypCrOvqYhGyxu0Hkk2RMGIEk5VMa90s01oFeA/JUr4vGmFfEolkhXLVcpn
	+l6LPXnqSAwtfSbpjRrarS/B2Ckq/c/qdca7N42hlUdz4mFQx1Qq3cOB2jgEtK0XR5W0FGMBhOu
	jCNUG4o4GWPT01x3RrF/VMCHwaq1J9oRcjbrwtsyE2yr8Ii8bVsVC1cwYNM/yLhibKy4rvo7s9H
	nTc+Lc5aYZYC9Ai/zWnD+y6utsLkDaFMibOz4+jyLCz41boVxL42/LMOXUokoa7Xp+VPIW4e8O5
	vspHAA5fRFP6BygEizXFzUy2MNNiwfdmCsszDH9MMuIqFadO3K2NoZtI/IjhB3QtXUKUOTdz97T
	aOcz0fG30qme/nFNeRjBnSYWKYLQ==
X-Received: by 2002:a05:6000:220c:b0:45e:f2bd:2b17 with SMTP id ffacd0b85a97d-45ef2bd2d85mr3402627f8f.21.1780052733486;
        Fri, 29 May 2026 04:05:33 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:7677:753b:2cb5:7f25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c3081sm3033663f8f.15.2026.05.29.04.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:05:33 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS panel
Date: Fri, 29 May 2026 12:05:20 +0100
Message-ID: <20260529110518.624454-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529110518.624454-4-ivitro@gmail.com>
References: <20260529110518.624454-4-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_040535_617271_C00EAA0C 
X-CRM114-Status: GOOD (  15.09  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay enabling the LG LP156WF1 15.6" FHD (1920x1080)
dual-channel LVDS panel on the Verdin Development Board with Verdin AM62
Mezzanine expansion board. The panel connects via the AM62 OLDI0 and
OLDI1 in dual-channel mode on the Mezzanine LVDS interface (J10).

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 131 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..e9951b5d2e0b 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -30,6 +30,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
@@ -232,6 +233,9 @@ k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 k3-am625-verdin-wifi-dev-mezzanine-can-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-mezzanine-can.dtbo
+k3-am625-verdin-wifi-dev-mezzanine-lvds-lg-lp156wf1-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtbo
 k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
@@ -352,6 +356,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-can.dtb \
+	k3-am625-verdin-wifi-dev-mezzanine-lvds-lg-lp156wf1.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso
new file mode 100644
index 000000000000..bb4acc1edf35
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * LG LP156WF1 dual-channel LVDS panel on Verdin AM62 Mezzanine
+ * LVDS interface (J10), used with the Verdin Development Board.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm2: backlight-pwm2 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin GPIO_4 (SODIMM 212) - LVDS_BKL_EN */
+		enable-gpios = <&mcu_gpio0 4 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) - LVDS_PWM */
+		pwms = <&epwm0 1 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "lg,lp156wf1", "panel-lvds";
+		backlight = <&backlight_pwm2>;
+		data-mapping = "jeida-24";
+		height-mm = <194>;
+		width-mm = <345>;
+
+		panel-timing {
+			clock-frequency = <138500000>;
+			hactive = <1920>;
+			hback-porch = <40>;
+			hfront-porch = <24>;
+			hsync-len = <16>;
+			pixelclk-active = <0>;
+			vactive = <1080>;
+			vback-porch = <23>;
+			vfront-porch = <3>;
+			vsync-len = <5>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_lvds_native_in0: endpoint {
+					remote-endpoint = <&oldi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_lvds_native_in1: endpoint {
+					remote-endpoint = <&oldi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* DSS VP1: internal DPI output to OLDIx */
+	port@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dss0_out0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&oldi0_in>;
+		};
+
+		dss0_out1: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&oldi1_in>;
+		};
+	};
+};
+
+&oldi0 {
+	ti,companion-oldi = <&oldi1>;
+
+	status = "okay";
+};
+
+&oldi0_port0 {
+	oldi0_in: endpoint {
+		remote-endpoint = <&dss0_out0>;
+	};
+};
+
+&oldi0_port1 {
+	oldi0_out: endpoint {
+		remote-endpoint = <&panel_lvds_native_in0>;
+	};
+};
+
+&oldi1 {
+	ti,secondary-oldi;
+
+	status = "okay";
+};
+
+&oldi1_port0 {
+	oldi1_in: endpoint {
+		remote-endpoint = <&dss0_out1>;
+	};
+};
+
+&oldi1_port1 {
+	oldi1_out: endpoint {
+		remote-endpoint = <&panel_lvds_native_in1>;
+	};
+};
-- 
2.54.0


