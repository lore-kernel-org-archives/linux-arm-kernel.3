Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DB7CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y85zsZDQKxK8sD7ttJKCoLuHRw4j4DeYk5X8DxnnGnM=; b=kekeLjwuKrW5GuI7yJE1lwlFAc
	guQij/OwqLWXBUMX6cmI+O03JTAWw2Boep8spnGEmWSTo9HxSSDPTk7Tizwd3fPfSXMRFGTPvs75o
	jqJKDMUm2QMDp82qH5zJo+UiYR9tng+KWx67/PPXsgdvu8yh/G48ozoWHWhQLWGEz3FtmOqw2U1M+
	CSrFDTqdkrSJ1K26uD1PkQwJAbC2KZDQ8DV/RL1q8WZ2PQwVgbZXCcKPVzWsy7OIrwLEqKc39+oPB
	+vezVwYW4jZHYm8ONFXcMC+gSt06E1xcn+ULe45K7ttCKe8y5WmZKhA2nskNOxQdT1xhyPWfL7hBI
	8ZV2oBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoci-00000001hm3-0Syc;
	Fri, 15 Aug 2025 07:13:12 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoV4-00000001gBM-3hwH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 07:05:20 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb7ae31caso299832366b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 00:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755241517; x=1755846317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y85zsZDQKxK8sD7ttJKCoLuHRw4j4DeYk5X8DxnnGnM=;
        b=JcAquw7NJAZRv7LM3f2L7HldtxVFenTVTZhGOqKMA4glkQsLdNuO86jl3xY8LqqlcM
         a2lxdogZEs28jUmi2yBmahr9h9xBa72Q8hWwC0GN9vTxRRRMkYcOoD1V82ZnoOalpPag
         modz+XJZwvXRgq+Ra40seFPdJDvprp8ESWUGuP4YGIKsHEnS4Grzyvm1h5mGYWNGCYoM
         Ol19FM1fdVQsZ6tRaM/V2L5NySblUrxW0FPKO3dhFaA6Ds4M/xIzAX/kZzv3cs5cHbTX
         k7sRX2ihzhD+XUp4ySc2Cs9IA4DrT4UKTxr9i5arULId+uuoP8Rj1TNlyPkolpk7y325
         0dKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755241517; x=1755846317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y85zsZDQKxK8sD7ttJKCoLuHRw4j4DeYk5X8DxnnGnM=;
        b=GI3kGBGtSB0ukj7RKDjP5BXrM0Zylz0DCeLdJawTZs4IEu+q/aS+x9wmyzqsZ8pBO1
         KlXQ7CYZbQNzE3pi8L3cAgf8xUrW0zcnN+APd5X+YUDhQrkKFaR7nRnyMnEEpaae5dgM
         wjhjSGm2ajYcTNHz/14gsHDbD1dLcVi5eKB0OuFKkeieNr8iIiDliI6JYDcFMI2A6ygK
         ucd2r6yptGqHBbTWlQ/YWqZsSIMWCfORgcH+5Z48U7JgOu3LvStOnojcLm8qblgRRhr2
         hsw/Gdkcol1s+KHSGHppS21p0kP+8XHhmOvjuSLvjNnYtu9VqOAt73HV4wpflqkOkoI0
         TGXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn6KB9fqnayz1+032WoLNCOm9WLvNkIH2qJXG1DgL++6RNDqLx/mMi1mdK2KpH6TUvNW7H1QZjEUTcbwGsYseI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq2V5hAQPaUMQ6mMy3RREYvNuPU2VE3pki/wkgTO2py5s7RdxP
	ZPlk6bYqAndmAWSfyHCYPMSedyZ8dYjx0mIAzLTAXDjw0THUDJI08+m+bbsF4g==
X-Gm-Gg: ASbGncuGURptDObXqE1vuxGGpy2R/zrmKVfbsY8ghAfiEC7YkqUy0L+Ri8aSuWbPoC/
	Nw5O13rvlkkVfOmwignrTgQLA2+u1kD0RRbEzwilfRFo3F3iAy/HPvKadzTmxBcpiePZreZk4oe
	oFtb/qG3oTs5LutEIB3z5g4UHidi2h80s++JO5FojS3wAT6gibiec8SQVghhQHtQF/8cjcyemoW
	UX3FHxinSKd+KCvKVkRvw+J3lwYPOTnMZYwkP2eWZmFIHK7PEzf5K/DZmkeK/lr57d4jIf5mEYn
	gxL/zZBKpY1GZovRKYMOKwvU5ppy1js9uJiKovifVjp2nKSD6HEXfdIMcImj1n+mmc2l6CfK9XN
	rcab8MmQKPL2c736y+CLH66K/USo9Aqz+z06wrsPDVDkfE0nbdKITFY+WyOGMDH/YzGIVVtjkXA
	==
X-Google-Smtp-Source: AGHT+IFh//es/9+sWoVhDlPCizn4RkmKiZ2SJp3F9fhVcL4Iza4SCu0VZsuSos1QjjpgbKmXip+6xg==
X-Received: by 2002:a17:907:3e1a:b0:ad4:f517:ca3 with SMTP id a640c23a62f3a-afcdc1a3d54mr98349466b.20.1755241516911;
        Fri, 15 Aug 2025 00:05:16 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcb2ddsm74269266b.74.2025.08.15.00.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:05:16 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] arm64: dts: exynos2200: use 32-bit address space for /soc
Date: Fri, 15 Aug 2025 10:04:58 +0300
Message-ID: <20250815070500.3275491-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_000518_923296_5F6CC53C 
X-CRM114-Status: GOOD (  12.65  )
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
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

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


