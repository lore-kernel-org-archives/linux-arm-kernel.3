Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED790CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRkcPjZLCx4KGQ69YlsYx3CS01joHDVdS8gNEI5i67g=; b=FPVJcD0x24GwV+yhbnwUXLh+O7
	RrKa5U7xXjGcENVNcQXzhJcPOP1NpYL1cU3EGumyq93iCGgFrDOly67nVkDsl6ni4YeclREr/bKQ0
	Y90Duvt7H5PwJVJ/b+/+f0ATT7T2ny9pHUR0pHGWMBX2hpB1b9btLwv0Jz1OAu9+/zJTRAtCxGHXa
	MnXcKbenx1jpmRZvI+QpLNrtX2iKvicIApbpgyDbaqstGx1Js1feZyo3qyv8hIV2NgbF5O2eRLXhj
	mTHRGOryPF0qO4D/jd1yiFbMZl8WWYA2dRi8ejExyj4PElHQtTzqgZp2l2RV7Pe/jZ2plvy39QQJ4
	MX6FUO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyr-00000004wif-0QVt;
	Thu, 08 Oct 2026 19:40:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyh-00000004wZl-0fAr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:40:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a061a13884so29635225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488429; x=1792093229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRkcPjZLCx4KGQ69YlsYx3CS01joHDVdS8gNEI5i67g=;
        b=VOXkr96hF5hjhuZNhy5Y0YR2979OJauQkiDSLTIf4DNuN3oB+zpfbzQaV7HKgTIorh
         L8HdS4HUwVqc9TLiCnNXlnNITfKKliGWNC24HnUZOsKRUFjCU6GgT7v4/DviyAqLwvdX
         qCMHyGLGHv2qQIbpPG0wB+7U2blLos/AyUPI/i6oDCupwGHdJ12D7G3ZuIVQyqI7UJQM
         3kvqXQhH6RCKZX3KhXRj7P1iZL/Sr9lF0ta8LJgJlDQx9s864P8xeTLCMNGTBkVRxIpJ
         393G3O4kdLJzkiH+9v3dTYRoQdfZMRrm0y18vV5mDcAK8e2EW5mNzo0ryfpTlBEpX6wz
         1XFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488429; x=1792093229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRkcPjZLCx4KGQ69YlsYx3CS01joHDVdS8gNEI5i67g=;
        b=KBW/Kx9P+khcBYPJ0dx0s3P1uG5QZZjGyQUGpR6wfb+j9XEkWjqVrr8Ppul9ZlaoH/
         jgmXWwmPagMPCMAvZnjtRFsdc4/JGb30AIfnn87EHi+B46VLS2wH9JZPnbSXDWlaVy+2
         oAiEQuZmhCcKepldXDnXWnq/e+XzDHiPEF0ANa/PwFdESps1vgepoO/d56xo+qS5E/F8
         HSdPZrQ1tMG5NLSJCA3X+io5Rmvn0+oI+FT33+gonL/pttSTU4MiEerdWUX1YYrVktD5
         +Y/2hsVSO57iLhzxXc7MLpn4M9nEvfzYDKdux8dKa1gDIbGhYOQ9rf6PNyePEtG0QpZe
         0FBw==
X-Forwarded-Encrypted: i=1; AKwUvBwYKbzbiqePRQ/2F8F6yea6LhgN0anHFlhsyOA0Pfj0i3bC42J6CfaE/Gj+rNJVUIPkdAl7LuakxWJMl6dKWpyO@lists.infradead.org
X-Gm-Message-State: AFuF++mBVrXxzqZITsESewWxOWQb3coPP18U8gPCOk6DRREPzLc7QU7A
	G2cwQ/Q2rN537H76dyD+vnN4nPjNkO/25nSiREkEqXMVKqsTBvypwb0N
X-Gm-Gg: AYBFou29P8stowbEtfDWSlAACFV2fx7adBH8ZuxHqUY7MHNIYVnPBP5F656MTArwJ3Z
	pQKV5vezxbPC12jMQgsSvvCDFV4wxVxqGoVOoYdsm9QiTVDB34tWxN6+4wcEHLh8kAdb5ZC8SR7
	TDBCri7q+doC35OfJekREGWY4HK3hEM9Qwz2dW9gjUuQPMa6tihWPn0WW9IeKXf3hjtbnpVWmjp
	LJk45+x5Uto1ZBQIX6KkfJKAcCeYOirpXzUom55LJyb5mU2ieIT4T9qHPVT5KjUoJRpL6LIpWQf
	J05laHdZ5L7/oyzbjFCRXKKdXVK1zOmQR7QTuZSN7GOQHvxzorgP/dFh8RFoto9MLGQ/FGseBJ/
	TgwdZbHwirJhmTbHtcSThlPcA2QjXMSECuajAdRa5V8GWVE7BrZb714358adNuwveKybjDgcBZg
	2SQ4QjyNlS4AXVYkWN0ayPiedqrlsB91v4gky6g5BmhEAQ0vbEJzgPef6BdweiCS85xlTvkCwgG
	Ncsgh+0Uy0atIDaSDDxuZoDxNmjwX7H1vKCi8eOZ4npXY6Pp1VGyUpgL264HAdkHOr68XWqXHCu
	usO2a8AsgE3tsYPG691sjw==
X-Received: by 2002:a05:600c:a00d:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18065f30cmr122465985e9.32.1791488429121;
        Thu, 08 Oct 2026 12:40:29 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:28 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 07/13] ARM: dts: imx6ul: Add Variscite WM8904 and WM8731 support
Date: Thu,  8 Oct 2026 21:37:47 +0200
Message-ID: <50f74f31925dd5d43d5b6578888c33875d8f2a20.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_124031_251085_22053B6A 
X-CRM114-Status: GOOD (  21.29  )
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

Add shared WM8904 and WM8731 codec and sound-card descriptions for
VAR-SOM-6UL and DART-6UL. Reuse imx6ul-var-som-audio.dtsi for SAI2
and select the clock setup and audio routes in each codec file.
The DART-6UL WM8904 wrapper adds the IN2L, IN2R and MICBIAS routes.

The existing Concerto DTS files enable SAI2 but do not describe a
codec or sound card. Include the WM8904 option there to connect the
codec on I2C2 to SAI2 with the module's audio configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Reuse imx6ul-var-som-audio.dtsi for SAI2 and its pinctrl, keeping
   codec-specific clock and routing settings in the codec files.
 - Add the WM8904 include to the four existing Concerto DTS files in
   this patch instead of waiting for a later conversion patch.

v1->v2:
 - Share the WM8904 description with a DART-specific microphone
   routing wrapper, and consolidate the identical WM8731 files.

 .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 17 +++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi    | 50 ++++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi    | 68 +++++++++++++++++++
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  2 +-
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  2 +-
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |  2 +-
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  2 +-
 7 files changed, 139 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
new file mode 100644
index 000000000000..236022f3da10
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+
+&sound_wm8904 {
+	simple-audio-card,routing =
+		"Headphone Jack", "HPOUTL",
+		"Headphone Jack", "HPOUTR",
+		"IN1L", "Line In Jack",
+		"IN1R", "Line In Jack",
+		"IN2L", "Microphone Jack",
+		"IN2R", "Microphone Jack",
+		"Microphone Jack", "MICBIAS";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
new file mode 100644
index 000000000000..ed9af0a39714
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-var-som-audio.dtsi"
+
+/ {
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8731audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "RHPOUT",
+			"Headphone Jack", "LHPOUT",
+			"LLINEIN", "Line Jack",
+			"RLINEIN", "Line Jack",
+			"MICIN", "Mic Bias",
+			"Mic Bias", "Mic Jack";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Jack",
+			"Microphone", "Mic Jack";
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		HPVDD-supply = <&reg_3p3v>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
new file mode 100644
index 000000000000..c95dbf3824af
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-var-som-audio.dtsi"
+
+/ {
+	sound_wm8904: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8904audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN1L", "Line In Jack",
+			"IN1R", "Line In Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		CPVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		MICVDD-supply = <&reg_3p3v>;
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
+	};
+};
+
+&sai2 {
+	assigned-clock-rates = <0>, <11565177>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
index 725f34d6b7ee..66c9deaea083 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
@@ -13,7 +13,7 @@
 #include "imx6ul-var-som-wifi.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index c249e15772b8..4905abf5aa08 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -13,7 +13,7 @@
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
index 1b7c1a3383ee..880b72833091 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
@@ -13,7 +13,7 @@
 #include "imx6ul-var-som-wifi.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
index 9c9d16eb1a11..c481839a98a5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
@@ -12,7 +12,7 @@
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
-- 
2.47.3


