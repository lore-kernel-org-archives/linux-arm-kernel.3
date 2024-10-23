Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB8CD2E03A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TukqJrYsDFG1DJAJmueEwaHQL71E3jPssuf+t5HzkMw=; b=LIPfd3BYMH+2RJ2yOuHyJHW0Ji
	Gs8xMiznrLBHWiyQX3aS/A2hgcm6zvpfJsfHKbBA7IPmwkFQdT+zNptK4c3ZsVAhORcaVcarEeaU1
	pWeJVFUHBYXx52TsO+mL8OaKoRXkpnRy2xv+NUAKy0Nhq/aDLhglfxUJ17uy+4+TAzScVFnvNq+6j
	cDIZ/AY3wcQrN3Y/IZ4z6O/tMne9r2JDxZPC4n4/jUHptwmCpAWBVan7+JW7ZiC/mGrw2vnbb1Hg5
	Pows6Ju2kQr7zIrNkWBuusGpsOmENkuPqH9Zo1+EmfIKqcX0qETsM0h1RR/jdmjE8ZxwKoApGaz3V
	0mXf4Twg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xw5-0000000Dqta-30eP;
	Wed, 23 Oct 2024 09:45:49 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XVF-0000000Dks1-1DgJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:18:06 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso871103466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675083; x=1730279883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TukqJrYsDFG1DJAJmueEwaHQL71E3jPssuf+t5HzkMw=;
        b=gY9pEL68o3pyzMsnNZguJ0RxEzxxo8ZjaH4FeN2Aqw6sxFS7d1S39DrfyrutpRsr3J
         y2HNa5yWDWMC2XTdHgzB4kD0TEh0cMVzbxgQs7rDBIANRSwK0DLouZ/Yl/tHwtqck8yW
         uoN9xlIejKVVYkTzGly/LtY/fhKhQRZeS5uKv96GwTFnGIGX/Q8wO7r9vsMyPD68KBlM
         U4Gd3Msz2dMESoEhP2yIQYWiL0wDwCeEg6jweOLGPbZKov4V1/Mkpga/Ea6+dYo8c8cP
         JoS77sLClcLlNS0nzOYGj+XYpqiyY13tD7MhZp0+7Bk+7BURhY3+Y4KP5zhyRXoFlWxp
         0FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675083; x=1730279883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TukqJrYsDFG1DJAJmueEwaHQL71E3jPssuf+t5HzkMw=;
        b=D2BpFtgfRZzCOXsnSm8yTQiC8JX4geI2nIdFFt4RVp1V7EHPJvAI3L+ymDbvxVlvkw
         kZp3V0Jne2OZy+doR1R5d+6k0yGSIS6edKzv/yJmEQukLSrtaSC8+qAqsF06fvbyI7YU
         Vp3W2zeipNOFerufAYYhpgXVy3sW1O/MdjnXRryP+FBLjx8e0+MIK2Ity+KUMvgsZk4f
         /hjCKKd9PXuce7W3l/nYodWFudHkbslp7IZYRpPTQ0RN8R+vWdIuExVUcQ5xPm9E1XAO
         g48+wMHG0uEM51kGhVer3LvR6mUcof4YXrZv078RgrfqgPKUMS3Mxi+ERL8Jf0uZn80q
         liNA==
X-Forwarded-Encrypted: i=1; AJvYcCX8K5AL+noPRx72yL9v46fUneI25i2ZK2auwyw7M/KoMnHHH+TPNdJBQ9EYiLS+X48QatVUFBc28G/zbpB6CdE7@lists.infradead.org
X-Gm-Message-State: AOJu0YxYIgoKUkzB0a9HuG9EBU5V6DggHLqGSEtXPeCH9/RdeE7eHQi5
	uInPxE9JZNDY31/uESuUFc45R5gEv/2ulyKF/984v88B/D9gifP3
X-Google-Smtp-Source: AGHT+IHZv/+oJUevS4s8PoL1LtsFuNYgQymnDcOySsDEjVW2EW41HdvXfoHIx9nX4R1+73GpfVGcFw==
X-Received: by 2002:a17:907:728a:b0:a9a:188f:efd9 with SMTP id a640c23a62f3a-a9abf8a828cmr166012466b.29.1729675083365;
        Wed, 23 Oct 2024 02:18:03 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:03 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: dts: exynos8895: Add clock management unit nodes
Date: Wed, 23 Oct 2024 12:17:31 +0300
Message-ID: <20241023091734.538682-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_021805_350380_2F3603A0 
X-CRM114-Status: GOOD (  11.27  )
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

Add clock management unit nodes for:
- cmu_top, which provides muxes, divs and gates for other CMUs
- cmu_peris, which provides clocks for GIC and MCT
- cmu_fsys0, which provides clocks for USBDRD30
- cmu_fsys1, which provides clocks for MMC, UFS and PCIE
- cmu_peric0, which provides clocks for UART_DBG, USI00 ~ USI03
- cmu_peric1, which provides clocks for SPI_CAM0/1, UART_BT,
USI04 ~ USI13

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 223ebd482..54037b0dc 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
  */
 
+#include <dt-bindings/clock/samsung,exynos8895.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -159,6 +160,15 @@ chipid@10000000 {
 			reg = <0x10000000 0x24>;
 		};
 
+		cmu_peris: clock-controller@10010000 {
+			compatible = "samsung,exynos8895-cmu-peris";
+			reg = <0x10010000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIS_BUS>;
+			clock-names = "oscclk", "bus";
+		};
+
 		gic: interrupt-controller@10201000 {
 			compatible = "arm,gic-400";
 			reg = <0x10201000 0x1000>,
@@ -173,24 +183,91 @@ gic: interrupt-controller@10201000 {
 			#size-cells = <1>;
 		};
 
+		cmu_peric0: clock-controller@10400000 {
+			compatible = "samsung,exynos8895-cmu-peric0";
+			reg = <0x10400000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_UART_DBG>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_USI00>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_USI01>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_USI02>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_USI03>;
+			clock-names = "oscclk", "bus", "uart", "usi0",
+				      "usi1", "usi2", "usi3";
+		};
+
 		pinctrl_peric0: pinctrl@104d0000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x104d0000 0x1000>;
 			interrupts = <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric1: clock-controller@10800000 {
+			compatible = "samsung,exynos8895-cmu-peric1";
+			reg = <0x10800000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_SPEEDY2>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_SPI_CAM0>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_SPI_CAM1>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_UART_BT>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI04>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI05>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI06>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI07>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI08>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI09>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI10>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI11>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI12>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_USI13>;
+			clock-names = "oscclk", "bus", "speedy", "cam0",
+				      "cam1", "uart", "usi4", "usi5",
+				      "usi6", "usi7", "usi8", "usi9",
+				      "usi10", "usi11", "usi12", "usi13";
+		};
+
 		pinctrl_peric1: pinctrl@10980000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x10980000 0x1000>;
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_fsys0: clock-controller@11000000 {
+			compatible = "samsung,exynos8895-cmu-fsys0";
+			reg = <0x11000000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS0_DPGTC>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS0_MMC_EMBD>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS0_UFS_EMBD>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS0_USBDRD30>;
+			clock-names = "oscclk", "bus", "dpgtc", "mmc",
+				      "ufs", "usbdrd30";
+		};
+
 		pinctrl_fsys0: pinctrl@11050000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x11050000 0x1000>;
 			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_fsys1: clock-controller@11400000 {
+			compatible = "samsung,exynos8895-cmu-fsys1";
+			reg = <0x11400000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS1_PCIE>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS1_UFS_CARD>,
+				 <&cmu_top CLK_DOUT_CMU_FSYS1_MMC_CARD>;
+			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+		};
+
 		pinctrl_fsys1: pinctrl@11430000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x11430000 0x1000>;
@@ -213,6 +290,14 @@ pinctrl_busc: pinctrl@15a30000 {
 			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_top: clock-controller@15a80000 {
+			compatible = "samsung,exynos8895-cmu-top";
+			reg = <0x15a80000 0x8000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+		};
+
 		pmu_system_controller: system-controller@16480000 {
 			compatible = "samsung,exynos8895-pmu",
 				     "samsung,exynos7-pmu", "syscon";
-- 
2.43.0


