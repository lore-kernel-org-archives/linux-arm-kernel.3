Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D8C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8B/tP0CTjVes5Gi9EiEiXMc6ToyqS4obd7jDFuSMeg=; b=dKMsYfiHyaKwIoGK0YlsOp8w1V
	b3Z1Uc/nxyRv6hQhXxt6gk5O7PImVLh+r0iy6SZuIoYxfDPTvTdE0BrGwmfoaz7LQMQ70tUM/iwbK
	OYYN6T2JJh2lepfpU0PBFnctCAZyjJspFZcScs3ySvG2unHQjeQYUKq1fCAE0lQvYpO7SLkGEVSYn
	po5F1KmyNvvOjd7IYnFiBJwAdBopSaZkauT2PujLiHD2X+HNksLBWrY2ZOWdoCywROSYhtgamZH9u
	nAiGGelVC5d7SZVvTu7YHxD7KdciYM2Fj01XU7PcvBywaYquYk8X1Yo6Mc/mixKVa9uFMqtUvEKwr
	b2uEMNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gr8-0000000Eox1-1s3S;
	Thu, 10 Sep 2026 15:38:30 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gqt-0000000EojH-0reW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:38:16 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356256so1456783f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054693; x=1789659493; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8B/tP0CTjVes5Gi9EiEiXMc6ToyqS4obd7jDFuSMeg=;
        b=oNpxmdvVsQaqxcadTBr8voWLJyt0JwRMQpKDvl7+Kb4VTeqC79DrlAXMKxUumMQgH9
         RF+60PGMuqvxdjjmEyDlfA/ZPudN4QZ70qmmsBrHwwz1H6bPyWUj1SkOIQQUXR5ANgi/
         PXutcX5eSwXZRZojxSCIJe02CwO0JwiYBrpn2UNDgQFatbkHyy1eJBYN6rsHkvkmPbE5
         bK+tCDEER+h4rpzyltH1+l+bpb2AKbPcQTKeH6xv4QpsV0KhoxYmWXU9JcZpkxLRn6aT
         3KGP3+AC8fww10TwbNLP9fmMF+JE5rizksAKu2jKLDbDh1HBmVOnFA+i0sBCQrJiSY8e
         Phmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054693; x=1789659493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8B/tP0CTjVes5Gi9EiEiXMc6ToyqS4obd7jDFuSMeg=;
        b=r6WSoU/sQL8WYseqbzvL+JgtjMwTGehTqPDNebpXVe6A8uKzng6KI4OHeoLRtxvb/Z
         W550PlJwul75yWVOchfdktz5Chw1KAqM50qVt+xx35Epvs65GNqHrq2Um9iOSpZVaYux
         f7PX0UDhkGl7JcOJutZmtNrQ9ylDe4oXiWZFo7VRqdsbRZaRgye3MZk0M0rrQQ6gaLJ+
         a3NxUtxhYefAek3kUuU6vLO9adYt0qAMCkqr6yhGpV7Kn1TqLAHODBxNPIM0gC7Jbl+Q
         JCCh+U87tLWiP0jDonTBEepaEHFaz/mnjZ+0ulrs/PbtbW0o1Mq1HD9Vy7OYPbbR7ytN
         cZ5Q==
X-Forwarded-Encrypted: i=1; AKwUvByzaLeCd1Awvu+KZuaIktp7bnNW+rXau1eUAgGOX6C5TsN+W1KzU5TtvXOocW9oGQX32PEnSQW5/NOAwBxUpae3@lists.infradead.org
X-Gm-Message-State: AFuF++m51f2uE7FDCWfP9BMDc3kOnMFQ4ccXPh//o7w0EAo6PIHtTqOB
	pg6nvcdyeVwXlDqdnCu3HglohY+08kFdirerUeg2lIgarA9CoAyFArUOhGNlQLdv
X-Gm-Gg: AYBFou20oKj/PxUdVDyDfoG5m0DXaF4/prMECFUVfabyLTMLN4aR6Ieh4roFLq6a6yv
	n4smkO6v/Jb/+1uRVVpchbFzYVCPyKhFMXvSYxBgvYyHIOFAzpwKpINfAGvi/lY9CbZCUM6YIh7
	/qMt9Jf8TjGEfSpbA1NhIolKw67pLhFRO1tLHVAJ5K7pGV784p3P1JjjJKwOJ9kMFRZm4QbrRSM
	vP5VwpMXy2iQPYuOht2XiAOMg2CyMypR0sbGGwqIG3R39kD6BnVF/3sd42eHcvGHPj7nkH/jf/j
	iEJgG2+aoV6VYt0QjDg9fjYCKobCgi7tdMsVnwaAtmIw09vbqkCqtQ1BySWfIaNVCMwSlpyTSI5
	D5x3e01ZX4ZmcKPSqV94CZAXiWAp78HBDW7G1WpBrYcjnICNV/Us3A5bwgowaET7+7ogzdrAawP
	4At9PkkG0S05CK3y8lOODmdAOdnKMT+ip/JX4LIViXy3gAjqToBu5xA9l+omt4ozaHkQViD+3FB
	g1+ANeL6DT1pSNhY+SyCg21O6NMwBDN2+HOMNDdjsEu4pudq38kBkN/k218Z06f5EIwfHcK2A==
X-Received: by 2002:a05:600c:4fcb:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49d26db4274mr57671805e9.9.1789054692973;
        Thu, 10 Sep 2026 08:38:12 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:12 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:38:02 +0200
Subject: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add mezzanine
 OV5640 overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-6-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_083815_318778_8EF513DF 
X-CRM114-Status: GOOD (  15.29  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
on this interface.

The mezzanine can route the camera control signals through two jumper
configurations. Describe each configuration as a GPIO nexus mapping so the
camera description remains independent of the physical routing.

The default positions share the native CSI_1 GPIOs and are intended for a
single camera. The alternate positions permit simultaneous native and
mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.

The current camera set uses a 27 MHz on-board oscillator. The legacy camera
module uses 24 MHz, so provide variants for both.

Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
 ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
 ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
 ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
 ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
 .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
 6 files changed, 214 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 06d41b9faa79..8dcb5d9fc74f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -736,6 +736,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
@@ -754,6 +758,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dual-ov5640.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-alt-jumpers.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-default-jumpers.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-alt-jumpers.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-default-jumpers.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640-24mhz.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640.dtb
@@ -775,6 +784,16 @@ imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8
 imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-wifi-dev-dual-ov5640-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo \
+	imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-alt-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-default-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-alt-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-default-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
 imx8mp-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
 imx8mp-verdin-wifi-dev-ov5640-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso
new file mode 100644
index 000000000000..9579ad2f2235
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on the Verdin iMX8M Plus Mezzanine with
+ * alternate GPIO jumper positions.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso"
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtso
new file mode 100644
index 000000000000..2079f9ead22d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on the Verdin iMX8M Plus Mezzanine.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso"
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso
new file mode 100644
index 000000000000..9f2372227a8d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on the Verdin iMX8M Plus Mezzanine with
+ * alternate GPIO jumper positions.
+ * These positions support two cameras but share Verdin GPIO_2 with the Atmel
+ * MXT touchscreen.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640.dtsi"
+
+&{/} {
+	verdin_mezz_camera_connector: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CSI_2_GPIO_0_RST (pin 11) - JP5 1-2 - Verdin GPIO_1
+		 * CSI_2_GPIO_1     (pin 22) - JP6 1-2 - Verdin GPIO_2
+		 * CSI_2_GPIO_3     (pin 24) - JP8 1-2 - Verdin GPIO_4
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 6 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+};
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <27000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso
new file mode 100644
index 000000000000..801beb8f48a6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on the Verdin iMX8M Plus Mezzanine.
+ * The default jumper positions share GPIOs with the Verdin CSI_1 interface
+ * and do not support using both camera connectors at the same time.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640.dtsi"
+
+&{/} {
+	verdin_mezz_camera_connector: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CSI_2_GPIO_0_RST (pin 11) - JP5 2-3 - Verdin GPIO_5_CSI
+		 * CSI_2_GPIO_1     (pin 22) - JP6 2-3 - Verdin GPIO_6_CSI
+		 * CSI_2_GPIO_3     (pin 24) - JP8 2-3 - Verdin GPIO_8_CSI
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+};
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <27000000>;
+};
+
+&ov5640_mezz {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>, <&pinctrl_gpio6>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640.dtsi
new file mode 100644
index 000000000000..3902ba62fb91
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on the Verdin
+ * iMX8M Plus Mezzanine.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "toradex,verdin-imx8mp";
+};
+
+&{/} {
+	clk_ov5640_mezz_osc: ov5640-mezzanine-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	reg_verdin_mezz_csi: regulator-mezzanine-csi {
+		compatible = "regulator-fixed";
+		gpios = <&verdin_mezz_camera_connector 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI_MEZZ";
+		startup-delay-us = <5000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI (Mezzanine JP3 and JP4 in position 2-3) */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	ov5640_mezz: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_ov5640_mezz_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_verdin_mezz_csi>;
+		DOVDD-supply = <&reg_verdin_mezz_csi>;
+		DVDD-supply = <&reg_verdin_mezz_csi>;
+		powerdown-gpios = <&verdin_mezz_camera_connector 1 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&verdin_mezz_camera_connector 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_mezz_to_mipi_csi_1: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi_1_in>;
+			};
+		};
+	};
+};
+
+&mipi_csi_1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi_1_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mezz_to_mipi_csi_1>;
+			};
+		};
+	};
+};

-- 
2.43.0


