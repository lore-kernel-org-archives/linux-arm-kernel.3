Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350FBCFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZEz4/9qLe30swJeAKIBBvm5fHc5WeQ4yezYVAmOgKA=; b=OTUMvKm+1EEOLLuppgmzXOq14T
	TTt6GVxNCKRzC1UQPTPU5hoR+wA68JmF9UMQ6CLAZ5XR49LsCzn5fnNoTicxh07TziO35yqLNPq8m
	TNBvsXLhASGPWaXA3+I8HeEr+y/SAJO7QMEMl0vvw/onVfRa+VYSiJnvPN+TYrJBjpoK4deazIJTX
	QkWB6Njdk5DBeijpBtsXCe6YFUnXHtiUCJ98bYWrzTe90OZLW8E/bbuqIYTvdQlRdLmQFjSnE+Ld2
	Hl00eLfxxRLs5pD/dKE8MjiN5rE0K0GuyPraXQcPwT3d3OzaPptCekSk6IM76M/Y1s2BOsJZp30Cy
	vBeS9qNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gsa-0000000FdpE-36nh;
	Wed, 23 Oct 2024 19:18:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZW-0000000FDjM-02lA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:51:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43163667f0eso55405165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702256; x=1730307056; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZEz4/9qLe30swJeAKIBBvm5fHc5WeQ4yezYVAmOgKA=;
        b=Hp6bu2P+Mf93ANFjzba83492++Vij9pBQzyAETPosilOy+sQuwppl3ksqGhWA5ZeYb
         j0B6ZX4Wn5SumB/uxo7ZBk/+IfumRXztgb3wtQdM5UWt+aWoXcTgPuPmoAIAq3+jFWSY
         Od4audvmMI286DmSPtna40NRSkWQ1MF7B9ODpv5Q8+gEDUuE1IBkQ4JCwfDA2XFRcBsl
         Q4dMmhDrJq3DiydbL2slJVkxaTC5obrwUCH1WuMzTxas4nPd8hFSDKlkGf9q44mCYtfd
         eOqQUzIx0SuJVXbCazGXPjMxw6oD1Xqhuk5MyLUBanqIq9RYYeaoisCbH7i51Q727Oel
         Op8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702256; x=1730307056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZEz4/9qLe30swJeAKIBBvm5fHc5WeQ4yezYVAmOgKA=;
        b=tYycAvAk0soxsxC3zbcSlZ5kVJ0H9Jmc5f73HQj6nA4a92cCWvVVDV4pvxCYHpI4i5
         NiX5pvqb6ldlyPuCkpke1D3MJfJkfNtEdKM2RYh8nxW+9qpMIExsKlb0naA70kkwsoZC
         ubtTrD3UpOoqN+2iigEbPdq2CmRbRg1Yzz5CrBEcCSrC+pyzhLblx8qwDyKX6M+mIQoP
         kzVsUsRH76Cn7GRz8A3Mq5JIRwXta32wIynX4DnymK9cb71ZKlp/c7QzxSGD/kak/og3
         qIjK3wsL9oQJ0//N04c28fgPbkGg5JPLQJl+H1L5cT36jtMBG/1cl0n1ajE7dShxkflU
         kQcA==
X-Forwarded-Encrypted: i=1; AJvYcCVLKnpUlF9R2XiLLcoyPrEL/muRxuoZBft/IL+Y57uJ/4xXKJuG5hZwQ7rLA/FIy6chCSFJWw549T6vNQnh8FWF@lists.infradead.org
X-Gm-Message-State: AOJu0YybenTzsilIlMRkFl4O0Smo8zaG3LBU24lAb8Y6MntHIyRSDiep
	fNUBrQ8huIQ+o+AaNCQMJcZ/dLrsr1e+HV4z06WnWZo12/IX+9L4/yiBO0PYtDY=
X-Google-Smtp-Source: AGHT+IEKHk3DI5IbbI8urr1ZRpPA9f3+OxHfkXhNNfwqtfcP/WAzZ07gB+VgLne69sb39V54boK1Cw==
X-Received: by 2002:a05:600c:4e8e:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-431841fd6b6mr24505825e9.8.1729702256467;
        Wed, 23 Oct 2024 09:50:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:56 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:33 +0100
Subject: [PATCH 36/37] arm64: dts: broadcom: Add display pipeline support
 to BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-36-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_095058_271535_0AE2FF34 
X-CRM114-Status: GOOD (  11.66  )
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

Adds the HVS and associated hardware blocks to support the HDMI
and writeback connectors on BCM2712 / Pi5.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts |  14 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi        | 188 +++++++++++++++++++++++
 2 files changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 92a2ada037f3..fbc56309660f 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -88,5 +88,19 @@ power: power {
 		firmware = <&firmware>;
 		#power-domain-cells = <1>;
 	};
+};
+
+&hvs {
+	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
+	clock-names = "core", "disp";
+};
+
+&hdmi0 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+};
 
+&hdmi1 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
 };
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 6e5a984c1d4e..39305e0869ec 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -265,6 +265,172 @@ gicv2: interrupt-controller@7fff9000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 		};
+
+		aon_intr: interrupt-controller@7d510600 {
+			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
+			reg = <0x7d510600 0x30>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		pixelvalve0: pixelvalve@7c410000 {
+			compatible = "brcm,bcm2712-pixelvalve0";
+			reg = <0x7c410000 0x100>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pixelvalve1: pixelvalve@7c411000 {
+			compatible = "brcm,bcm2712-pixelvalve1";
+			reg = <0x7c411000 0x100>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		mop: mop@7c500000 {
+			compatible = "brcm,bcm2712-mop";
+			reg = <0x7c500000 0x28>;
+			interrupt-parent = <&disp_intr>;
+			interrupts = <1>;
+		};
+
+		moplet: moplet@7c501000 {
+			compatible = "brcm,bcm2712-moplet";
+			reg = <0x7c501000 0x20>;
+			interrupt-parent = <&disp_intr>;
+			interrupts = <0>;
+		};
+
+		disp_intr: interrupt-controller@7c502000 {
+			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
+			reg = <0x7c502000 0x30>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		dvp: clock@7c700000 {
+			compatible = "brcm,brcm2711-dvp";
+			reg = <0x7c700000 0x10>;
+			clocks = <&clk_108MHz>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		ddc0: i2c@7d508200 {
+			compatible = "brcm,brcmstb-i2c";
+			reg = <0x7d508200 0x58>;
+			interrupt-parent = <&bsc_irq>;
+			interrupts = <1>;
+			clock-frequency = <97500>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		ddc1: i2c@7d508280 {
+			compatible = "brcm,brcmstb-i2c";
+			reg = <0x7d508280 0x58>;
+			interrupt-parent = <&bsc_irq>;
+			interrupts = <2>;
+			clock-frequency = <97500>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		bsc_irq: intc@7d508380 {
+			compatible = "brcm,bcm7271-l2-intc";
+			reg = <0x7d508380 0x10>;
+			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		main_irq: intc@7d508400 {
+			compatible = "brcm,bcm7271-l2-intc";
+			reg = <0x7d508400 0x10>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		hdmi0: hdmi@7ef00700 {
+			compatible = "brcm,bcm2712-hdmi0";
+			reg = <0x7c701400 0x300>,
+			      <0x7c701000 0x200>,
+			      <0x7c701d00 0x300>,
+			      <0x7c702000 0x80>,
+			      <0x7c703800 0x200>,
+			      <0x7c704000 0x800>,
+			      <0x7c700100 0x80>,
+			      <0x7d510800 0x100>,
+			      <0x7c720000 0x100>;
+			reg-names = "hdmi",
+				    "dvp",
+				    "phy",
+				    "rm",
+				    "packet",
+				    "metadata",
+				    "csc",
+				    "cec",
+				    "hd";
+			resets = <&dvp 1>;
+			interrupt-parent = <&aon_intr>;
+			interrupts = <1>, <2>, <3>,
+				     <7>, <8>;
+			interrupt-names = "cec-tx", "cec-rx", "cec-low",
+					  "hpd-connected", "hpd-removed";
+			ddc = <&ddc0>;
+		};
+
+		hdmi1: hdmi@7ef05700 {
+			compatible = "brcm,bcm2712-hdmi1";
+			reg = <0x7c706400 0x300>,
+			      <0x7c706000 0x200>,
+			      <0x7c706d00 0x300>,
+			      <0x7c707000 0x80>,
+			      <0x7c708800 0x200>,
+			      <0x7c709000 0x800>,
+			      <0x7c700180 0x80>,
+			      <0x7d511000 0x100>,
+			      <0x7c720000 0x100>;
+			reg-names = "hdmi",
+				    "dvp",
+				    "phy",
+				    "rm",
+				    "packet",
+				    "metadata",
+				    "csc",
+				    "cec",
+				    "hd";
+			resets = <&dvp 2>;
+			interrupt-parent = <&aon_intr>;
+			interrupts = <11>, <12>, <13>,
+				     <14>, <15>;
+			interrupt-names = "cec-tx", "cec-rx", "cec-low",
+					  "hpd-connected", "hpd-removed";
+			ddc = <&ddc1>;
+		};
+	};
+
+	axi: axi {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x00 0x00000000  0x00 0x00000000  0x10 0x00000000>,
+			 <0x10 0x00000000  0x10 0x00000000  0x01 0x00000000>,
+			 <0x14 0x00000000  0x14 0x00000000  0x04 0x00000000>,
+			 <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
+			 <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
+
+		dma-ranges = <0x00 0x00000000  0x00 0x00000000  0x10 0x00000000>,
+			     <0x10 0x00000000  0x10 0x00000000  0x01 0x00000000>,
+			     <0x14 0x00000000  0x14 0x00000000  0x04 0x00000000>,
+			     <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
+			     <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
+
+		vc4: gpu {
+			compatible = "brcm,bcm2712-vc6";
+		};
 	};
 
 	timer {
@@ -280,4 +446,26 @@ IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) |
 					  IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	clk_27MHz: clk-27M {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <27000000>;
+		clock-output-names = "27MHz-clock";
+	};
+
+	clk_108MHz: clk-108M {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <108000000>;
+		clock-output-names = "108MHz-clock";
+	};
+
+	hvs: hvs@107c580000 {
+		compatible = "brcm,bcm2712-hvs";
+		reg = <0x10 0x7c580000 0x0 0x1a000>;
+		interrupt-parent = <&disp_intr>;
+		interrupts = <2>, <9>, <16>;
+		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
+	};
 };

-- 
2.34.1


