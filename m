Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD42CD5BB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWDvvZpW/sE15P0paVY2aruhyEKLAjYbjEimD4YPxkE=; b=bkoQPcxIstHxnWDnAWpoLLZGyk
	lVk094SpVH4tTdwLVY3Yo4jnuFuDYGNCby1xRJ3nmxko9wPOX3DnUMrqACweRJJxI3ntLlgNNCnkO
	MfJxcp3pTTXrebLYrgK0Cp9kIRm1P5dJnZezpnUIgsyDSvRUGdE/W9GtXzanShLOzd2UMmovPcFAl
	OHJ1lkL+zv/4tCx7mONC0F9sva3wYSY+uTCnFHnqIRiKo6fc/Tc4j6DoBED+SMUOA8732Sl9NfFHZ
	1OjwG8B1dubkEp5CwxuZlArJi+O0lagfXTCYw6E7B+H1K0SbqK1UfRbWmKBpg2unsj89vTI6McWAf
	Q+qQOSHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4ud-00000008EHV-3n5J;
	Thu, 21 May 2026 15:02:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tx-00000008Dfz-460M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49040362e4aso347235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375692; x=1779980492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWDvvZpW/sE15P0paVY2aruhyEKLAjYbjEimD4YPxkE=;
        b=IhY0Ime++ztOODcAdx4Aw9OqSqIHkMZathhWe+2EAuCP/Dvtym1wFgtSutQFb39qcN
         IjLPmkFj0Uev4uw65FPxDORciOmCiGumivtY0+SWt24hWzW+mvCkoRXd+SL1n6uKAe1z
         2FhN2+cv/u29VD67JkXIuuB9SL8Yrx131vcLo666qcR6tzlZPqFG3XkQemnwchbW7jKK
         hBjL03LnYv7bJCMyVN26ozbM3a2HSI8YJolXOJQlEDt5g+a9wKuiGfh507nnT5iCkfcb
         pixYSScm69eqBuzUXyp8S+dEhk8SXxP9Ga1INvBHkZawbWNn1zStK4Pna98uieiLZ+dE
         uONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375692; x=1779980492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HWDvvZpW/sE15P0paVY2aruhyEKLAjYbjEimD4YPxkE=;
        b=RIVcUkyTesopaw6WyzFWM0iMPqiuhecS7hvgh9x53BBqh8nV2qxrqGFGPJQMdd01uU
         eV560JhH/G/Y1/10ej3sC5c/QqMgdqwktcOugpzw66m2pre9gd3HEaBW/mqq6NGsbQww
         F5DTs7hLdSvlSxiTaKwD2fARS5wd4zAqXRXg9oK4uwrjYm/d7SsX2oXQNgK522BGinlC
         YRZ0ETfYiNJXN84OfJo9ns9lEhynwTppvBlUli9coSJiTsq9CL2A4gjPcTnyU76K4/+R
         3p8kHkUA9PIJlzMcITVYeH1LY0picV9eRnXYZG6mqSTAYwUPtb/VQyr9q1NmZcP72L4D
         Ef5w==
X-Forwarded-Encrypted: i=1; AFNElJ8LZTGoSdFN5qp7zYf2HT4jlt40OUZIns9SBD3aEnPyBWOJOSY5Qd8R0UmB4tGIOHaVFhcML/3tHhDKy3L5CB2j@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb2hnDgnyhPXZ7fJfZmPybufmpSH2BVyUGYoKJ/SrVSl+tje5o
	Bqtaxv4Hx3SdfZG+AiOLXLgc9GUSbJu5DeGpiQEM+njDh/oSawoZCvS1
X-Gm-Gg: Acq92OGvH5/xFyfibBiDu6olOxgYVY7mMAF02pDFWrvSewKE3wqgFJYZ882Bm4nsG9g
	yDnlZuPNXsft/H0BEXUethqB+WyHm+d4A+nGJF/bUzhHQtP98sSCqaXUrEFgU4ae+0jru8eZ9J1
	qZ5G/cJx0lqfJnkPYMAG0p+ExP/ifSV9WjD3dCRT3GlJBHUH43XukWutqQQ7ova1TRPBT+QWp67
	vKkVxh81fz9NXx0F0ekXpg1YlqmGMDe1eff/OKpKWqpDDBaS+mdp+LmF7b6S38r6MH+Y1qSEc9f
	Bc8WLhy5GLvrraFlxN4Sh2Px3R0PJ1Mwy4ls8euy22euTbWYDejZUkWnINQdk97hO3eyc+4GHMG
	qk4MlB4LtPUy/hP76cQq4MxnPERTr38camYNnXKR47zddfUqMc7mlICygT+DV4wCA9PKJnpsPPx
	M8sgr3apqBt0W6m8pS+xfkYUfh12xpOUf+GSSxr3VDEA==
X-Received: by 2002:a05:600d:10:b0:48e:526e:101a with SMTP id 5b1f17b1804b1-4903606b81emr41807905e9.12.1779375691986;
        Thu, 21 May 2026 08:01:31 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:31 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 15/15] arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS panel
Date: Thu, 21 May 2026 16:00:51 +0100
Message-ID: <20260521150038.103538-32-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080134_051241_154D0204 
X-CRM114-Status: GOOD (  15.70  )
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
 ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 129 ++++++++++++++++++
 2 files changed, 134 insertions(+)
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
index 000000000000..a4d6cbe9ff3b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso
@@ -0,0 +1,129 @@
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


