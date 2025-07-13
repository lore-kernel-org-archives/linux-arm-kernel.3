Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2C7C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGSW5MLOnZEjMDuGJkkmT4oAKQwsUUEgTK+EsICMEXA=; b=IHNxhEikOt0gUY5Pk9ZMaCDIzN
	onDROtmLmT/oxrqdTdKioPZ/oCx0VHoGcnyn8qD25fleLAlH1tpqxTiRWfOeAukrvsNPSxcUWxjjg
	x6Wvge7plY8EnF/Jxr83wn05F733vIR3YnpxJvs5VD/yG+AozRj2Nez389rRb44t3Rho93v3XyIjg
	AVKaGsdDKb6/0PtjrYkfN9bT+FwF+9BRh60MIw3q538pwjp5k+7Lojb+kVr4oxKVDOrjn2rTVIw0Y
	aUiET0xIiaR8NFBRBvoVLiisq13MaV97yvu0cqMEkQk9Yq/xVoNfZZa1MkfeZwrAal8ZcpyTc5Ioi
	ncetdElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawu9-00000000CUW-2Vfp;
	Sun, 13 Jul 2025 13:38:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawkh-00000000Bop-2umw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 13:28:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-454f426b3e5so9623445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752413302; x=1753018102; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGSW5MLOnZEjMDuGJkkmT4oAKQwsUUEgTK+EsICMEXA=;
        b=eaQXpSvcyGcf81cIjJ2rMwAmg398yGKJpD803xYn+lvoRXiKn2F7QJlCd4U0KGo6k9
         AatQ6nzTZ+aaT+uLPfR1IgCQe8aHlRgl04TGx9EnOtxkZX4/r8mNBwpH0XHaMN894X78
         zRbJ1lV0qKGQQr2I0qYY+QlNrQ3nJrZwSW83k3hw5GMK51l/81w9rI8lE3wWOPBAX9Hk
         khyL/3Hx/Z/IBdKHtr1WUMN52d2iaP4DCHzK4T5m10H4mRRP7IJh4Zn/23xiKyJuTxXW
         tegAq7d1ozqjTNwQwVdyW3eT70tUI7lTu3gX0qVYZqQgkSwwKgMI5PzseOiSc4U5v5bZ
         0Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752413302; x=1753018102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGSW5MLOnZEjMDuGJkkmT4oAKQwsUUEgTK+EsICMEXA=;
        b=SNz6mVCiBq8r/DZyiO1Ypwa2DMPfe3mE0ZSXD0dwC2MIAp6EG7AQZk3tXHodBRSrrJ
         tAklhRtpGGKyomAG3k81TfWsuO1OVHPeLUFi8jWZ0EJPtsRtObDxsHbrxo0JO5mm9Tq5
         aVxfxBqY/XyUCHfWlXBHnOP5lM8jpXBUEpUA5raylLgKjhJErJAwrN1c0mkXy3MruxKL
         EBt9ym8MdwEBVT+M9/5j4c74b2Tx9ubP6odbSiw3Yr1y2n/+rD/2IWIs8+bNKppnqdyj
         RorUCUWdOIg0ryMOp3qhmX68+fCGXGAjLKTenffb5KeX/K1Rv9FEkPDcJ4tdyW7n6BuX
         05zg==
X-Forwarded-Encrypted: i=1; AJvYcCUE+hpsdUXz2LZ8149oHfdZjd1nN9s9TfbYHIAfpiFi8VVuDVttkqA/aRrmF/3L8Lba0DS01GHjFaGdCLBCbHHG@lists.infradead.org
X-Gm-Message-State: AOJu0YySiAvtrrrsvndEElSv318LccdOu5uyUmWckGJzP/dEIQN9MdD2
	NufTPgm2dGDlwTqTO6XeW7+1n7Zk1AdCGsdEM/x99wD6lu5YGrJXnoNdYb1bJg==
X-Gm-Gg: ASbGncsVodAHd4l2ZbyCW7HaQOsK3mKDQPY+24DaIaMEkidv/5phai0BoS33OILEQRv
	EJpVGvCgvKtEEYWtvaSDRJEvoY6qsZQCMZXBFl+5OBrnVbYoZ6W4XGJE4nH9h1roslAzRIUhpbD
	pm0Ucra89l19eqmUq/ANCey3SIR3D2wqzYF+iHmFfCnkMAIhQhlGGRHo9KoTfiqwRbHFxwhuoR+
	9+W9gxGNzWaIhdj/u5Cg6E51NRdTWyblL+3jAfNsLxCQctQMD4YArJzW8zhUxjFHC8F5EtvnGop
	rG8Ikw8DDo+2VAKIUO6tWm3Oqg/+9SRaybJSq2rjbJrobOlUiM2wQDTtcOPoESsHt/q7OR2bsVy
	lsR7g8/Mg+ChcybnKpIv7Yg==
X-Google-Smtp-Source: AGHT+IFILGoL267t9lqnTbEklFkXi9deVYGu9oXnGYG2xKrr7MSjR8SSR8mnVhrI+x6D5td4cjX2rw==
X-Received: by 2002:a05:600c:a408:b0:456:58:1114 with SMTP id 5b1f17b1804b1-456005811famr47146795e9.9.1752413301732;
        Sun, 13 Jul 2025 06:28:21 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d758sm9574691f8f.49.2025.07.13.06.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 06:28:21 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 13 Jul 2025 15:27:30 +0200
Subject: [PATCH 3/3] ARM: sti: drop B2120 board support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sti-rework-v1-3-6716a09e538d@gmail.com>
References: <20250713-sti-rework-v1-0-6716a09e538d@gmail.com>
In-Reply-To: <20250713-sti-rework-v1-0-6716a09e538d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12621;
 i=rgallaispou@gmail.com; h=from:subject:message-id;
 bh=gS1HbsK2yctgEQPDYKhh1GC/x/c/E9cYrQK8O0dE8Pk=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoc7Rx/tF2GG9dnbONPBSQ5t+F75opSAvlQ51Ko
 vT3CBSMziuJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHO0cQAKCRDnIYpo1BLC
 tUCND/92QTCMqwhd8WBzi4t1CyBmmHGDwQi0qqB/Bi598f6AdSEMkorfaTZaM21GIaawvY6nMKF
 55U5WRqvFgeekdincPD/59Aei5aoJei01PQh8GK7mkJEY+lFCFQuloa+0TgUh01L3QsTong0XKc
 Ldwnd1tO+KT6may2SsSNj0R1jcgmvPIxst3xNfLujEGtMgqwYiBux2vlC+N8Cjx/7XOLmji4sBj
 ImT/3R+rexMtqfpQMFMJ8bN117n38II04R79DT1UDmxQh4XiwWDCD9dKcKS9A3QiHTIR6a0lmjR
 1CS0oFfVIs8nO3D/j8yzV41Gv8rUUvjoRyYHWor7Wr5QhgGVKAV1ulnYX8pqXR7ebtFeJ+DujVj
 4AvKj5I4Ni0YJNKM1aQkCkDbgcs2L4FyzSJ9cgTn3CqTQYxiim6Zmt1Tzh8i+Jl846snOtPARAz
 Rko7tAqxDGE5LsLTt4X310oKq7xoLXBAFRfVQPaCPBi4bfMg/xoven8ZDlDxfcy7s2QaDWAfYSk
 iFPkWiq2zTFGvLJ8ap10QUkxy0vgdoFYg5+bDdWYxh9PGz0K+01SzuaM58Zn0wZ0o9KcFdiKg0z
 Ry5P/koZ9SEqnIKxakgs7Ua5sqjwmWzGRtrtXCOpz3oqrr9pDic4BiEFLUnTFjZioz+8ExOO2vm
 Hdob81giNKheO7Q==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_062823_745172_D22A0703 
X-CRM114-Status: GOOD (  12.14  )
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

B2120 boards are internal boards which never were commercialised.

Drop them.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 arch/arm/boot/dts/st/Makefile           |   2 -
 arch/arm/boot/dts/st/stih407-b2120.dts  |  27 -----
 arch/arm/boot/dts/st/stih407.dtsi       | 145 ----------------------
 arch/arm/boot/dts/st/stih410-b2120.dts  |  66 ----------
 arch/arm/boot/dts/st/stihxxx-b2120.dtsi | 206 --------------------------------
 5 files changed, 446 deletions(-)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index cc9948b9870f7f73629573149bfd342af75b07da..f57fc6dc48a00c9a9323b4508e5e4e161b197c47 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -13,8 +13,6 @@ dtb-$(CONFIG_ARCH_SPEAR3XX) += \
 dtb-$(CONFIG_ARCH_SPEAR6XX) += \
 	spear600-evb.dtb
 dtb-$(CONFIG_ARCH_STI) += \
-	stih407-b2120.dtb \
-	stih410-b2120.dtb \
 	stih410-b2260.dtb \
 	stih418-b2199.dtb \
 	stih418-b2264.dtb
diff --git a/arch/arm/boot/dts/st/stih407-b2120.dts b/arch/arm/boot/dts/st/stih407-b2120.dts
deleted file mode 100644
index 9c79982ee7ba8fadb1a2a92e732bf7f652b74c38..0000000000000000000000000000000000000000
--- a/arch/arm/boot/dts/st/stih407-b2120.dts
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2014 STMicroelectronics (R&D) Limited.
- * Author: Giuseppe Cavallaro <peppe.cavallaro@st.com>
- */
-/dts-v1/;
-#include "stih407.dtsi"
-#include "stihxxx-b2120.dtsi"
-/ {
-	model = "STiH407 B2120";
-	compatible = "st,stih407-b2120", "st,stih407";
-
-	chosen {
-		stdout-path = &sbc_serial0;
-	};
-
-	memory@40000000 {
-		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
-	};
-
-	aliases {
-		serial0 = &sbc_serial0;
-		ethernet0 = &ethernet0;
-	};
-
-};
diff --git a/arch/arm/boot/dts/st/stih407.dtsi b/arch/arm/boot/dts/st/stih407.dtsi
deleted file mode 100644
index aca43d2bdaad44ef2a0e8a120c679c217709af44..0000000000000000000000000000000000000000
--- a/arch/arm/boot/dts/st/stih407.dtsi
+++ /dev/null
@@ -1,145 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2015 STMicroelectronics Limited.
- * Author: Gabriel Fernandez <gabriel.fernandez@linaro.org>
- */
-#include "stih407-clock.dtsi"
-#include "stih407-family.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-/ {
-	soc {
-		sti-display-subsystem@0 {
-			compatible = "st,sti-display-subsystem";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <0 0>;
-			assigned-clocks = <&clk_s_d2_quadfs 0>,
-					  <&clk_s_d2_quadfs 1>,
-					  <&clk_s_c0_pll1 0>,
-					  <&clk_s_c0_flexgen CLK_COMPO_DVP>,
-					  <&clk_s_c0_flexgen CLK_MAIN_DISP>,
-					  <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
-					  <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
-					  <&clk_s_d2_flexgen CLK_PIX_GDP1>,
-					  <&clk_s_d2_flexgen CLK_PIX_GDP2>,
-					  <&clk_s_d2_flexgen CLK_PIX_GDP3>,
-					  <&clk_s_d2_flexgen CLK_PIX_GDP4>;
-
-			assigned-clock-parents = <0>,
-						 <0>,
-						 <0>,
-						 <&clk_s_c0_pll1 0>,
-						 <&clk_s_c0_pll1 0>,
-						 <&clk_s_d2_quadfs 0>,
-						 <&clk_s_d2_quadfs 1>,
-						 <&clk_s_d2_quadfs 0>,
-						 <&clk_s_d2_quadfs 0>,
-						 <&clk_s_d2_quadfs 0>,
-						 <&clk_s_d2_quadfs 0>;
-
-			assigned-clock-rates = <297000000>,
-					       <108000000>,
-					       <0>,
-					       <400000000>,
-					       <400000000>;
-
-			ranges;
-
-			sti-compositor@9d11000 {
-				compatible = "st,stih407-compositor";
-				reg = <0x9d11000 0x1000>;
-
-				clock-names = "compo_main",
-					      "compo_aux",
-					      "pix_main",
-					      "pix_aux",
-					      "pix_gdp1",
-					      "pix_gdp2",
-					      "pix_gdp3",
-					      "pix_gdp4",
-					      "main_parent",
-					      "aux_parent";
-
-				clocks = <&clk_s_c0_flexgen CLK_COMPO_DVP>,
-					 <&clk_s_c0_flexgen CLK_COMPO_DVP>,
-					 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
-					 <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
-					 <&clk_s_d2_flexgen CLK_PIX_GDP1>,
-					 <&clk_s_d2_flexgen CLK_PIX_GDP2>,
-					 <&clk_s_d2_flexgen CLK_PIX_GDP3>,
-					 <&clk_s_d2_flexgen CLK_PIX_GDP4>,
-					 <&clk_s_d2_quadfs 0>,
-					 <&clk_s_d2_quadfs 1>;
-
-				reset-names = "compo-main", "compo-aux";
-				resets = <&softreset STIH407_COMPO_SOFTRESET>,
-					 <&softreset STIH407_COMPO_SOFTRESET>;
-				st,vtg = <&vtg_main>, <&vtg_aux>;
-			};
-
-			sti-tvout@8d08000 {
-				compatible = "st,stih407-tvout";
-				reg = <0x8d08000 0x1000>;
-				reg-names = "tvout-reg";
-				reset-names = "tvout";
-				resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				assigned-clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
-						  <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
-						  <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
-						  <&clk_s_d0_flexgen CLK_PCM_0>,
-						  <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
-						  <&clk_s_d2_flexgen CLK_HDDAC>;
-
-				assigned-clock-parents = <&clk_s_d2_quadfs 0>,
-							 <&clk_tmdsout_hdmi>,
-							 <&clk_s_d2_quadfs 0>,
-							 <&clk_s_d0_quadfs 0>,
-							 <&clk_s_d2_quadfs 0>,
-							 <&clk_s_d2_quadfs 0>;
-			};
-
-			sti_hdmi: sti-hdmi@8d04000 {
-				compatible = "st,stih407-hdmi";
-				reg = <0x8d04000 0x1000>;
-				reg-names = "hdmi-reg";
-				#sound-dai-cells = <0>;
-				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "irq";
-				clock-names = "pix",
-					      "tmds",
-					      "phy",
-					      "audio",
-					      "main_parent",
-					      "aux_parent";
-
-				clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
-					 <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
-					 <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
-					 <&clk_s_d0_flexgen CLK_PCM_0>,
-					 <&clk_s_d2_quadfs 0>,
-					 <&clk_s_d2_quadfs 1>;
-
-				hdmi,hpd-gpio = <&pio5 3 GPIO_ACTIVE_LOW>;
-				reset-names = "hdmi";
-				resets = <&softreset STIH407_HDMI_TX_PHY_SOFTRESET>;
-				ddc = <&hdmiddc>;
-			};
-
-			sti-hda@8d02000 {
-				compatible = "st,stih407-hda";
-				reg = <0x8d02000 0x400>, <0x92b0120 0x4>;
-				reg-names = "hda-reg", "video-dacs-ctrl";
-				clock-names = "pix",
-					      "hddac",
-					      "main_parent",
-					      "aux_parent";
-				clocks = <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
-					 <&clk_s_d2_flexgen CLK_HDDAC>,
-					 <&clk_s_d2_quadfs 0>,
-					 <&clk_s_d2_quadfs 1>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/st/stih410-b2120.dts b/arch/arm/boot/dts/st/stih410-b2120.dts
deleted file mode 100644
index 538ff98ca1b1b6542f98a18f68968f030b8c55c0..0000000000000000000000000000000000000000
--- a/arch/arm/boot/dts/st/stih410-b2120.dts
+++ /dev/null
@@ -1,66 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2014 STMicroelectronics (R&D) Limited.
- * Author: Peter Griffin <peter.griffin@linaro.org>
- */
-/dts-v1/;
-#include "stih410.dtsi"
-#include "stihxxx-b2120.dtsi"
-/ {
-	model = "STiH410 B2120";
-	compatible = "st,stih410-b2120", "st,stih410";
-
-	chosen {
-		stdout-path = &sbc_serial0;
-	};
-
-	memory@40000000 {
-		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
-	};
-
-	aliases {
-		serial0 = &sbc_serial0;
-		ethernet0 = &ethernet0;
-	};
-
-	usb2_picophy1: phy2 {
-		status = "okay";
-	};
-
-	usb2_picophy2: phy3 {
-		status = "okay";
-	};
-
-	soc {
-
-		mmc0: sdhci@9060000 {
-			max-frequency = <200000000>;
-			sd-uhs-sdr50;
-			sd-uhs-sdr104;
-			sd-uhs-ddr50;
-		};
-
-		ohci0: usb@9a03c00 {
-			status = "okay";
-		};
-
-		ehci0: usb@9a03e00 {
-			status = "okay";
-		};
-
-		ohci1: usb@9a83c00 {
-			status = "okay";
-		};
-
-		ehci1: usb@9a83e00 {
-			status = "okay";
-		};
-
-		sti-display-subsystem@0 {
-			sti-hda@8d02000 {
-				status = "okay";
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/st/stihxxx-b2120.dtsi b/arch/arm/boot/dts/st/stihxxx-b2120.dtsi
deleted file mode 100644
index 8d9a2dfa76f1fe55b954803cab8d00003a8ebec0..0000000000000000000000000000000000000000
--- a/arch/arm/boot/dts/st/stihxxx-b2120.dtsi
+++ /dev/null
@@ -1,206 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2014 STMicroelectronics (R&D) Limited.
- * Author: Giuseppe Cavallaro <peppe.cavallaro@st.com>
- */
-#include <dt-bindings/clock/stih407-clks.h>
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/media/c8sectpfe.h>
-/ {
-	leds {
-		compatible = "gpio-leds";
-		led-red {
-			label = "Front Panel LED";
-			gpios = <&pio4 1 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "heartbeat";
-		};
-		led-green {
-			gpios = <&pio1 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
-		};
-	};
-
-	sound: sound {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "STI-B2120";
-		status = "okay";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		simple-audio-card,dai-link@0 {
-			reg = <0>;
-			/* HDMI */
-			format = "i2s";
-			mclk-fs = <128>;
-			cpu {
-				sound-dai = <&sti_uni_player0>;
-			};
-
-			codec {
-				sound-dai = <&sti_hdmi>;
-			};
-		};
-
-		simple-audio-card,dai-link@1 {
-			reg = <1>;
-			/* DAC */
-			format = "i2s";
-			mclk-fs = <256>;
-			frame-inversion;
-			cpu {
-				sound-dai = <&sti_uni_player2>;
-			};
-
-			codec {
-				sound-dai = <&sti_sasg_codec 1>;
-			};
-		};
-
-		simple-audio-card,dai-link@2 {
-			reg = <2>;
-			/* SPDIF */
-			format = "left_j";
-			mclk-fs = <128>;
-			cpu {
-				sound-dai = <&sti_uni_player3>;
-			};
-
-			codec {
-				sound-dai = <&sti_sasg_codec 0>;
-			};
-		};
-	};
-
-	miphy28lp_phy: miphy28lp {
-
-		phy_port0: port@9b22000 {
-			st,osc-rdy;
-		};
-
-		phy_port1: port@9b2a000 {
-			st,osc-force-ext;
-		};
-	};
-
-	soc {
-		sbc_serial0: serial@9530000 {
-			status = "okay";
-		};
-
-		pwm0: pwm@9810000 {
-			status = "okay";
-		};
-
-		pwm1: pwm@9510000 {
-			status = "okay";
-		};
-
-		ssc2: i2c@9842000 {
-			status = "okay";
-			clock-frequency = <100000>;
-			st,i2c-min-scl-pulse-width-us = <0>;
-			st,i2c-min-sda-pulse-width-us = <5>;
-		};
-
-		ssc3: i2c@9843000 {
-			status = "okay";
-			clock-frequency = <100000>;
-			st,i2c-min-scl-pulse-width-us = <0>;
-			st,i2c-min-sda-pulse-width-us = <5>;
-		};
-
-		i2c@9844000 {
-			status = "okay";
-		};
-
-		i2c@9845000 {
-			status = "okay";
-		};
-
-		i2c@9540000 {
-			status = "okay";
-		};
-
-		mmc0: sdhci@9060000 {
-			non-removable;
-			status = "okay";
-		};
-
-		mmc1: sdhci@9080000 {
-			status = "okay";
-		};
-
-		/* SSC11 to HDMI */
-		hdmiddc: i2c@9541000 {
-			status = "okay";
-			/* HDMI V1.3a supports Standard mode only */
-			clock-frequency = <100000>;
-			st,i2c-min-scl-pulse-width-us = <0>;
-			st,i2c-min-sda-pulse-width-us = <5>;
-		};
-
-		st_dwc3: dwc3@8f94000 {
-			status = "okay";
-		};
-
-		ethernet0: dwmac@9630000 {
-			st,tx-retime-src = "clkgen";
-			status = "okay";
-			phy-mode = "rgmii";
-			fixed-link = <0 1 1000 0 0>;
-		};
-
-		demux@8a20000 {
-			compatible	= "st,stih407-c8sectpfe";
-			status		= "okay";
-			reg		= <0x08a20000 0x10000>,
-					  <0x08a00000 0x4000>;
-			reg-names	= "c8sectpfe", "c8sectpfe-ram";
-			interrupts	= <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
-					  <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names	= "c8sectpfe-error-irq",
-					  "c8sectpfe-idle-irq";
-			pinctrl-0	= <&pinctrl_tsin0_serial>;
-			pinctrl-1	= <&pinctrl_tsin0_parallel>;
-			pinctrl-2	= <&pinctrl_tsin3_serial>;
-			pinctrl-3	= <&pinctrl_tsin4_serial_alt3>;
-			pinctrl-4	= <&pinctrl_tsin5_serial_alt1>;
-			pinctrl-names	= "tsin0-serial",
-					  "tsin0-parallel",
-					  "tsin3-serial",
-					  "tsin4-serial",
-					  "tsin5-serial";
-			clocks		= <&clk_s_c0_flexgen CLK_PROC_STFE>;
-			clock-names	= "c8sectpfe";
-
-			/* tsin0 is TSA on NIMA */
-			tsin0: port {
-				tsin-num = <0>;
-				serial-not-parallel;
-				i2c-bus = <&ssc2>;
-				reset-gpios = <&pio15 4 GPIO_ACTIVE_LOW>;
-				dvb-card = <STV0367_TDA18212_NIMA_1>;
-			};
-		};
-
-		sti_uni_player0: sti-uni-player@8d80000 {
-			status = "okay";
-		};
-
-		sti_uni_player2: sti-uni-player@8d82000 {
-			status = "okay";
-		};
-
-		sti_uni_player3: sti-uni-player@8d85000 {
-			status = "okay";
-		};
-
-		syscfg_core: core-syscfg@92b0000 {
-			sti_sasg_codec: sti-sasg-codec {
-				status = "okay";
-				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_spdif_out>;
-			};
-		};
-	};
-};

-- 
2.50.1


