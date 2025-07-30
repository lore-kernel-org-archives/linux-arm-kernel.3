Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78338C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0hLEz604jvcXEN/T2mEEGr6WT4Oxp/78DXXL0VyUnc=; b=zOn7zeBO/EPv7Epr3XrYOvCxLc
	fpzaJO/wIWDvnp3G/puctwzcn55sWjWs1OXuTKes5l+fgCNdaqV9T2LzBok1py9VX5Sl4FGRD0d9Y
	jmaTQOcKUwRJ5pI64472JLAPevY5IRyt+Kd0MLHahHC+OCOcPmfB6I11YwKxtJqfcpnID+XuY2vOj
	NB/MExkKX3GI1GVaKSWlKHwwxw+2jcgNEFmJoqdjvxFQTiEsmrwMtaK4Z+eReqtZTJiXSUEGwnuu0
	66I5P7qrU9n0G4SbE+qye4WvP1TJ9Nyd2tnuM6kRRxIXnry17buF9U+O8S5JAQZVc3KJcieVGL0Se
	QKWndsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1a7-00000000vCU-2HLi;
	Wed, 30 Jul 2025 07:50:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Sm-00000000uI0-3HzB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:43:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b7892609a5so261972f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861379; x=1754466179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0hLEz604jvcXEN/T2mEEGr6WT4Oxp/78DXXL0VyUnc=;
        b=kYifY+isf6CjL3sufhubj4hmhp/oxl8jZG2R/SbytfRpYQwZPU4fAEh5tnW8Ryy0MV
         SZfe7aUBrtu7pylFm+BMR57sKIXHBFsWFBT8XxYYn3mY0oMRTLQbofcdlYGbq6KugqGy
         7T/CD85YwaapfLL3oW1/cpeLVnIaeM24J73aknljwwukzljj6DmUJRHjzqoaroG0vlqr
         7EIGbtF3dVYKuBV237rLTPYUi9A7YlD51IAT9HGgzWB0eBrMbWO/Sn94lYb+wlm0Fl7g
         PaGs4Emnvb9Aq38xj3V6W7qCDXHCQqliP4BIASZi8UrcupG+2QIjKCNt2thK5+Y0p5UN
         25IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861379; x=1754466179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0hLEz604jvcXEN/T2mEEGr6WT4Oxp/78DXXL0VyUnc=;
        b=KW31YX0V3BKtEYhQOHdB3fTzaVfTs/y06CRXKkdNuzCi7p6cSmXou1w2tf8C/Po7q4
         1D5b7EBR5HIjS2LyQte623MAJwR2P2CHkEXFp6t2YQbFyN90/A3Wf5eOtQQrcSbMLAwp
         FGwu6DgTaniSTMbr2GglaQGOS9G53pWIx61T0Bu4YzJR32KDdc4J9B+E0cQ8GQRxd0Ys
         OD2uH7pwB4gm2ussenTgBugumuznsVJuDRUe9YRa+bP/0K6qzLTvPXJtD3n76Y3mce0d
         Sg9yixhaLmm8w85Ha1qNf57Kabkvk4sVA3MEi15w96iP0/DgUr1MpghQGbyd6Vi4nqdy
         iEkg==
X-Forwarded-Encrypted: i=1; AJvYcCWzM2GRtOouPiVv7MVm62P5HfcbQMSsMgtGkuzfmRjAapp+Bih3skvVQiqDywwvfYS9LoQ2dSTZqZrljjelUYOY@lists.infradead.org
X-Gm-Message-State: AOJu0YyAhfEmAYMfeo9cJjoxHztGYmBHbnETeNz73Ie8/jjzgqh/7i3c
	BWyuK9uq6KNW/Jqi3Zra+PMGmVTiFPo8hd1+hyuTFTQxHzs6A4SUuLa5
X-Gm-Gg: ASbGncviRbUXdEYEZlTKWcG7bMGjYNQ84AJQDvEqD4F/fOFxwKv//lhi4KlydDH3t2Q
	6ailD8BjIwkOwe9/n3RYM84TNMcTO+fSftdX7ryWzhZejGNPhoRWBLP0gwsYybfP1AjOQWE+yKi
	AghnAcrNXWcpYOsN1WlPCPCxbym33gauM1gzp80rOoiLZ2OQtcIfoOJ9HNZ9osuJ+Xu+geU6Rgo
	pTUG6kqJSu/lwsnMPMpPbjgCpoRJ0EZcPu4v+T4cgY/GUu4RbvRr/MBVgIBbR7ufmxPmsdqz/xI
	P7eeXN2vt8kUuefzOCPMaKS44CYA45c9ndmXqwmu6W8OE0hbn28IU5iDNMeTeS1bUR0L1S4J2fU
	qgBgkSJmjchWeozx3/V+gda3UxNbTEn2msVg1xKSs9+L5R1tvzSqQ12S3DS59eWwXqMVxJXH8mw
	==
X-Google-Smtp-Source: AGHT+IGhFmO4oF6kD0Ko40MEOLP56KuDL+105SXE8A6OwScEL3wiW4/hCwb6fHK70dZK1plOzP/mqg==
X-Received: by 2002:a05:6000:2008:b0:3b7:8fcc:a1e3 with SMTP id ffacd0b85a97d-3b795032797mr1716620f8f.48.1753861379038;
        Wed, 30 Jul 2025 00:42:59 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaed4sm14783835e9.27.2025.07.30.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:42:58 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: dts: exynos2200: use 32-bit address space for /soc
Date: Wed, 30 Jul 2025 10:42:50 +0300
Message-ID: <20250730074253.1884111-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_004300_821783_1113FFA3 
X-CRM114-Status: GOOD (  12.63  )
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

All peripherals on this SoC are mapped under the 32-bit address space
(0x0 -> 0x20000000), so enforce that.

Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

---
This was suggested at [1].

[1] https://lore.kernel.org/all/CAPLW+4kPN65uX0tyG_F-4u5FQpPnwX9y6F1zrobq5UyVbks+-w@mail.gmail.com
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 72 +++++++++++-----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 6b5ac02d0..943e83851 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -221,22 +221,22 @@ psci {
 		method = "smc";
 	};
 
-	soc {
+	soc@0 {
 		compatible = "simple-bus";
-		ranges;
+		ranges = <0x0 0x0 0x0 0x20000000>;
 
-		#address-cells = <2>;
-		#size-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
 		chipid@10000000 {
 			compatible = "samsung,exynos2200-chipid",
 				     "samsung,exynos850-chipid";
-			reg = <0x0 0x10000000 0x0 0x24>;
+			reg = <0x10000000 0x24>;
 		};
 
 		cmu_peris: clock-controller@10020000 {
 			compatible = "samsung,exynos2200-cmu-peris";
-			reg = <0x0 0x10020000 0x0 0x8000>;
+			reg = <0x10020000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&cmu_top CLK_DOUT_TCXO_DIV3>,
@@ -250,7 +250,7 @@ cmu_peris: clock-controller@10020000 {
 		mct_peris: timer@10040000 {
 			compatible = "samsung,exynos2200-mct-peris",
 				     "samsung,exynos4210-mct";
-			reg = <0x0 0x10040000 0x0 0x800>;
+			reg = <0x10040000 0x800>;
 			clocks = <&cmu_top CLK_DOUT_TCXO_DIV3>, <&cmu_peris CLK_MOUT_PERIS_GIC>;
 			clock-names = "fin_pll", "mct";
 			interrupts = <GIC_SPI 943 IRQ_TYPE_LEVEL_HIGH 0>,
@@ -270,8 +270,8 @@ mct_peris: timer@10040000 {
 
 		gic: interrupt-controller@10200000 {
 			compatible = "arm,gic-v3";
-			reg = <0x0 0x10200000 0x0 0x10000>,     /* GICD */
-			      <0x0 0x10240000 0x0 0x200000>;    /* GICR * 8 */
+			reg = <0x10200000 0x10000>,     /* GICD */
+			      <0x10240000 0x200000>;    /* GICR * 8 */
 
 			#interrupt-cells = <4>;
 			interrupt-controller;
@@ -294,7 +294,7 @@ ppi_cluster2: interrupt-partition-2 {
 
 		cmu_peric0: clock-controller@10400000 {
 			compatible = "samsung,exynos2200-cmu-peric0";
-			reg = <0x0 0x10400000 0x0 0x8000>;
+			reg = <0x10400000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -306,17 +306,17 @@ cmu_peric0: clock-controller@10400000 {
 
 		syscon_peric0: syscon@10420000 {
 			compatible = "samsung,exynos2200-peric0-sysreg", "syscon";
-			reg = <0x0 0x10420000 0x0 0x2000>;
+			reg = <0x10420000 0x2000>;
 		};
 
 		pinctrl_peric0: pinctrl@10430000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x10430000 0x0 0x1000>;
+			reg = <0x10430000 0x1000>;
 		};
 
 		cmu_peric1: clock-controller@10700000 {
 			compatible = "samsung,exynos2200-cmu-peric1";
-			reg = <0x0 0x10700000 0x0 0x8000>;
+			reg = <0x10700000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -328,23 +328,23 @@ cmu_peric1: clock-controller@10700000 {
 
 		syscon_peric1: syscon@10720000 {
 			compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
-			reg = <0x0 0x10720000 0x0 0x2000>;
+			reg = <0x10720000 0x2000>;
 		};
 
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x10730000 0x0 0x1000>;
+			reg = <0x10730000 0x1000>;
 		};
 
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos2200-cmu-hsi0";
-			reg = <0x0 0x10a00000 0x0 0x8000>;
+			reg = <0x10a00000 0x8000>;
 			#clock-cells = <1>;
 		};
 
 		usb32drd: phy@10aa0000 {
 			compatible = "samsung,exynos2200-usb32drd-phy";
-			reg = <0x0 0x10aa0000 0x0 0x10000>;
+			reg = <0x10aa0000 0x10000>;
 
 			clocks = <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
 			clock-names = "phy";
@@ -360,7 +360,7 @@ usb32drd: phy@10aa0000 {
 
 		usb_hsphy: phy@10ab0000 {
 			compatible = "samsung,exynos2200-eusb2-phy";
-			reg = <0x0 0x10ab0000 0x0 0x10000>;
+			reg = <0x10ab0000 0x10000>;
 
 			clocks = <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
 				 <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
@@ -374,7 +374,7 @@ usb_hsphy: phy@10ab0000 {
 
 		usb: usb@10b00000 {
 			compatible = "samsung,exynos2200-dwusb3";
-			ranges = <0x0 0x0 0x10b00000 0x10000>;
+			ranges = <0x0 0x10b00000 0x10000>;
 
 			clocks = <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
 			clock-names = "link_aclk";
@@ -406,7 +406,7 @@ usb_dwc3: usb@0 {
 
 		cmu_ufs: clock-controller@11000000 {
 			compatible = "samsung,exynos2200-cmu-ufs";
-			reg = <0x0 0x11000000 0x0 0x8000>;
+			reg = <0x11000000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -418,27 +418,27 @@ cmu_ufs: clock-controller@11000000 {
 
 		syscon_ufs: syscon@11020000 {
 			compatible = "samsung,exynos2200-ufs-sysreg", "syscon";
-			reg = <0x0 0x11020000 0x0 0x2000>;
+			reg = <0x11020000 0x2000>;
 		};
 
 		pinctrl_ufs: pinctrl@11040000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x11040000 0x0 0x1000>;
+			reg = <0x11040000 0x1000>;
 		};
 
 		pinctrl_hsi1ufs: pinctrl@11060000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x11060000 0x0 0x1000>;
+			reg = <0x11060000 0x1000>;
 		};
 
 		pinctrl_hsi1: pinctrl@11240000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x11240000 0x0 0x1000>;
+			reg = <0x11240000 0x1000>;
 		};
 
 		cmu_peric2: clock-controller@11c00000 {
 			compatible = "samsung,exynos2200-cmu-peric2";
-			reg = <0x0 0x11c00000 0x0 0x8000>;
+			reg = <0x11c00000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -450,17 +450,17 @@ cmu_peric2: clock-controller@11c00000 {
 
 		syscon_peric2: syscon@11c20000 {
 			compatible = "samsung,exynos2200-peric2-sysreg", "syscon";
-			reg = <0x0 0x11c20000 0x0 0x4000>;
+			reg = <0x11c20000 0x4000>;
 		};
 
 		pinctrl_peric2: pinctrl@11c30000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x11c30000 0x0 0x1000>;
+			reg = <0x11c30000 0x1000>;
 		};
 
 		cmu_cmgp: clock-controller@14e00000 {
 			compatible = "samsung,exynos2200-cmu-cmgp";
-			reg = <0x0 0x14e00000 0x0 0x8000>;
+			reg = <0x14e00000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -471,12 +471,12 @@ cmu_cmgp: clock-controller@14e00000 {
 
 		syscon_cmgp: syscon@14e20000 {
 			compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
-			reg = <0x0 0x14e20000 0x0 0x2000>;
+			reg = <0x14e20000 0x2000>;
 		};
 
 		pinctrl_cmgp: pinctrl@14e30000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x14e30000 0x0 0x1000>;
+			reg = <0x14e30000 0x1000>;
 
 			wakeup-interrupt-controller {
 				compatible = "samsung,exynos2200-wakeup-eint",
@@ -487,7 +487,7 @@ wakeup-interrupt-controller {
 
 		cmu_vts: clock-controller@15300000 {
 			compatible = "samsung,exynos2200-cmu-vts";
-			reg = <0x0 0x15300000 0x0 0x8000>;
+			reg = <0x15300000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -497,12 +497,12 @@ cmu_vts: clock-controller@15300000 {
 
 		pinctrl_vts: pinctrl@15320000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x15320000 0x0 0x1000>;
+			reg = <0x15320000 0x1000>;
 		};
 
 		cmu_alive: clock-controller@15800000 {
 			compatible = "samsung,exynos2200-cmu-alive";
-			reg = <0x0 0x15800000 0x0 0x8000>;
+			reg = <0x15800000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -512,7 +512,7 @@ cmu_alive: clock-controller@15800000 {
 
 		pinctrl_alive: pinctrl@15850000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x15850000 0x0 0x1000>;
+			reg = <0x15850000 0x1000>;
 
 			wakeup-interrupt-controller {
 				compatible = "samsung,exynos2200-wakeup-eint",
@@ -524,7 +524,7 @@ wakeup-interrupt-controller {
 		pmu_system_controller: system-controller@15860000 {
 			compatible = "samsung,exynos2200-pmu",
 				     "samsung,exynos7-pmu", "syscon";
-			reg = <0x0 0x15860000 0x0 0x10000>;
+			reg = <0x15860000 0x10000>;
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
@@ -536,7 +536,7 @@ reboot: syscon-reboot {
 
 		cmu_top: clock-controller@1a320000 {
 			compatible = "samsung,exynos2200-cmu-top";
-			reg = <0x0 0x1a320000 0x0 0x8000>;
+			reg = <0x1a320000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>;
-- 
2.43.0


