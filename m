Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8F5C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oSwy52wPE+n9CbxU0Afr3cSq8DpmnySrLvPQBrinhvc=; b=N+MNpqtd1M0uUzWJqJ0SwGVjME
	bX/IKENGoS4k++Y7k1fLYRYP9EjJ0FnuPEgvBxR87fHBPgjnZbrF/DZ/hXtpbPN1HeUdfIs14CPX0
	Z8u+hMS2qEBxxtKr3jgLU1BKmKUk3dEarjJo5r3Ow8do/IA9v8kzb1wPUEkXtj7rNYNnIg7t8aoQE
	FFAW5U+P7sW6ExpkZNlc4MohC77Q5A0GZUK+UtS2+odi9WkKs2fa2wYYZ+PY475FeVMn4Tc1Jo+uy
	9l/UA0baLuTyP56edaaiGyYF4KeVVVXgNKLjWUh4dDxoS+PKMtBzM4PuMjnrbzHcPxfetgL++qAjY
	VX3oVBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq6p7-0000000EAEt-0ifV;
	Sat, 01 Aug 2026 10:20:09 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq6p3-0000000EADe-1Efv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 10:20:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4954d29264cso2630665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 03:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785579603; x=1786184403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSwy52wPE+n9CbxU0Afr3cSq8DpmnySrLvPQBrinhvc=;
        b=A53kNSi7HSywRuA7XNtBdxh1ml9W75ax+kwaA1TBDy45Jtb0ldRRVSqxmF+vTj1fz+
         +S1RbEgzenz8By8qULQAun3mMPUgi1rJ7cbM75DzEUSUeULJZjufIYiX5oGueeTvYAg8
         ghD/gxfavIl7ix2cQmBL98KMscSEamf2iUS9AZsBspIV4LOh67vejw2MRLHK4UpICJL8
         RE2hVXpdUcZDTdg9ZQqnFUHGXELnnB8F0SJoe5KG/h/k9luAJbWaXlnwc/JH/ORWXgc1
         FowIwe3vk1fFSTlk4deiglJbYFS15yuXbQrOVdeimJJTKuVeciO5UpR0gYAq8eBbHCku
         qFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785579603; x=1786184403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSwy52wPE+n9CbxU0Afr3cSq8DpmnySrLvPQBrinhvc=;
        b=h8CL7W0ztZjnGIaHfiVzpuRjZBcuL9XnDZiqhcywmJHhPaD7IgUBhrk1+atd6hAvnZ
         6vFHnDk+4nWzoNmeU8H0p+OTO+4r7uiSwLe4l9/4f/cdAUaPyGNYmjmsPWZsNg3Hn0Cd
         pH3YsOtwYRQkkODNu0BpBvo4xInkJBmdmymQwwaiMnn/SGFsBTmMbd2xwCwX58NesVv8
         Zo5jR2HL4LzrHJQreoCLIQJWgTKIeW2xcMDS/MOsxd5KEgQDuAFMJcWfWehkpFO2WkPo
         04L3+XaCcJ6HyD0DXZEs/RQZnglW7WpqEg3Fvfvw5J7W4QpRd9QCB9xRJswtHGbcgFig
         DHzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPXmqY8tx1zPvK3rWT8JFsfCjUSJ552ZMvkkrJdP/UHlVc60RLOWz2A2evb6pQQsvIjrPLCBHAq9jobKTyk8AK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Lon0o49MqmPIlnKKRuE8CCZ7wvLSd4WIF2NhHVX0N4t+kTzz
	zm43REDdsZh9y4QiSjdx4mJr7ddMjSBrzlq7mlmr/m/wLkOeT5qrCVvA
X-Gm-Gg: AR+sD11P9ZN1SEtsSuNTLZ9yoC10g9Q3EeWsg0R/0suTUDrQCQZE2OgLogfsAYwbsKT
	sKs4v5tFYIxCZOr4N2TCJNvVlXDscgDRyTkL1esuMaPNvrINg0FixErorGYwEoY2CggJra9Sw7R
	2sUsFog+iJLpAwz1A7Kmo0HoX69RjqobEAu29SL3A9oflE9LmSdF3iaoBY8mkGy/sOF1kmbDBiH
	hOB9ZsVd42Ba+AnnOBkERaSIEw38xgIb+4bJMVIZ+/hO+WanGCmbSgNSzcjQaOnOiL4w1cVY5I3
	ouRz98W5JG25THJ00SIjKCOqVtE0vxV7Dr0rtHBKvOWwBPujuwkymFz9T9TVYsL9bYhlNj2gKPf
	M53ZJw7XI6wu9JCY5MPs3xSt2cqCJhNYHgNtA0YPsCWFkqlnnkRzxt3QzulLXpsr4pC8XOmE4Ja
	Wfc3Fd2ExZhmJga6l5FVkU+bFTId9jlHY/BdSUqLgJeb0AV3ftUehOfPxjsS6pbwHt8SSaly4Ph
	Pe2ZYLX9Z8M0Cc9LBqohP4bZbbqnuG51y5O0hHeiAN+ka3YK2qiD1SmSRscqnA5f3WxdvOwOg7w
	weBMLL4yZqDstmudUvFC3zXzvsxohQI9T1BZjZUJmhnB0qChiHTXhp6iqlXbtx+KE817r79m2Wx
	FBBtrvWxR/0h0ELKuiMTK70rnVmYo5Kz5NgCtyZC+ZNRN14nV28AYGLLblFoB
X-Received: by 2002:a05:600c:c490:b0:494:596e:e8c4 with SMTP id 5b1f17b1804b1-4980c67d1cbmr29142895e9.17.1785579603235;
        Sat, 01 Aug 2026 03:20:03 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd456a5a4sm14804509f8f.20.2026.08.01.03.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:20:02 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2] arm64: dts: broadcom: bcm2712: adjust display status
Date: Sat,  1 Aug 2026 11:19:53 +0100
Message-ID: <20260801102000.551644-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_032005_360898_3506907F 
X-CRM114-Status: GOOD (  12.38  )
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

Typically non critical IP in a SoC are disabled by
default in the SoC .dtsi and enabled on board specific
configs. There are usecases, such as some CM5 carrier
boards, where display output may not be desired or
connected. So disable them on the SoC .dtsi and enable
them on the RPi5 board.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
---

v2: rebase to align with upstream changes

 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    | 31 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 11 +++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1ab..51c8533f31812 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -104,6 +104,18 @@ wl_on_reg: wl-on-reg {
 	};
 };
 
+&ddc0 {
+	status = "okay";
+};
+
+&ddc1 {
+	status = "okay";
+};
+
+&disp_intr {
+	status = "okay";
+};
+
 &pinctrl {
 	bt_shutdown_default: bt-shutdown-default-state {
 		function = "gpio";
@@ -230,16 +242,27 @@ bluetooth: bluetooth {
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
+	status = "okay";
 };
 
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	status = "okay";
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	status = "okay";
+};
+
+&mop {
+	status = "okay";
+};
+
+&moplet {
+	status = "okay";
 };
 
 &pcie1 {
@@ -250,6 +273,14 @@ &pcie2 {
 	status = "okay";
 };
 
+&pixelvalve0 {
+	status = "okay";
+};
+
+&pixelvalve1 {
+	status = "okay";
+};
+
 &v3d {
 	clocks = <&firmware_clocks 5>;
 };
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc9..9b36ecd7bba54 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -359,12 +359,14 @@ pixelvalve0: pixelvalve@7c410000 {
 			compatible = "brcm,bcm2712-pixelvalve0";
 			reg = <0x7c410000 0x100>;
 			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		pixelvalve1: pixelvalve@7c411000 {
 			compatible = "brcm,bcm2712-pixelvalve1";
 			reg = <0x7c411000 0x100>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		mop: mop@7c500000 {
@@ -372,6 +374,7 @@ mop: mop@7c500000 {
 			reg = <0x7c500000 0x28>;
 			interrupt-parent = <&disp_intr>;
 			interrupts = <1>;
+			status = "disabled";
 		};
 
 		moplet: moplet@7c501000 {
@@ -379,6 +382,7 @@ moplet: moplet@7c501000 {
 			reg = <0x7c501000 0x20>;
 			interrupt-parent = <&disp_intr>;
 			interrupts = <0>;
+			status = "disabled";
 		};
 
 		disp_intr: interrupt-controller@7c502000 {
@@ -387,6 +391,7 @@ disp_intr: interrupt-controller@7c502000 {
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			status = "disabled";
 		};
 
 		dvp: clock@7c700000 {
@@ -405,6 +410,7 @@ ddc0: i2c@7d508200 {
 			clock-frequency = <97500>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		ddc1: i2c@7d508280 {
@@ -415,6 +421,7 @@ ddc1: i2c@7d508280 {
 			clock-frequency = <97500>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		bsc_irq: interrupt-controller@7d508380 {
@@ -460,6 +467,7 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			status = "disabled";
 		};
 
 		hdmi1: hdmi@7c706400 {
@@ -489,6 +497,7 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			status = "disabled";
 		};
 	};
 
@@ -667,6 +676,7 @@ v3d: gpu@1002000000 {
 
 	vc4: gpu {
 		compatible = "brcm,bcm2712-vc6";
+		status = "disabled";
 	};
 
 	timer {
@@ -703,5 +713,6 @@ hvs: hvs@107c580000 {
 		interrupt-parent = <&disp_intr>;
 		interrupts = <2>, <9>, <16>;
 		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
+		status = "disabled";
 	};
 };
-- 
2.55.0


