Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946C7D149DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZEz4/9qLe30swJeAKIBBvm5fHc5WeQ4yezYVAmOgKA=; b=RjdZWJM7tdsB4GUQND8PrtpjD+
	Otr/Pf+lZZShS3lECnCXlnZU30p94BvoRxvXI2PDo4FRaeRAMlxSi1nKo1cEIb6cwP+5Vv4qy5yDj
	Q4ScTBD5PuJNu85q+NwlF/4sEiPRYsgy7stXEMKcjp/MrvmuLLtKS9ij/zYqbXvkkNkvzrEApN8kv
	YiaHdg78nxuE5AEkLLcvA2E8mEN4UXeugzsVPle6JhKzh4LbYugpmvzOvf4t6fK4935mL7zCUgC23
	4rsfOWrxE207mFXXwmtk4nC8h4C5nZKBM7NlWN3fBYQNU64Gf2TjtVXU45ML4Lr/+umW7JkUIGsRp
	bcAR88Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oue-00000004lzB-2VGU;
	Fri, 25 Oct 2024 18:19:52 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvR-00000004Y75-107u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:38 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4314b316495so20675515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876595; x=1730481395; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZEz4/9qLe30swJeAKIBBvm5fHc5WeQ4yezYVAmOgKA=;
        b=KvBLZER3M9SayCIWRtKvboXE/osbUtSmIgZR8TNfATk15zl5tjA7T00nTRe3oCKdiP
         xUeJG9IeuzHnMOa/6bmtki0OprF+Yz7u8qbNHU4emWRWgNo65jWvfEJ7STyCwuIxnaSB
         H2mqCm/hW0SEVedi66oiVl4QA1p4stCSjetDM2OwHlPIrfOy1TCidxZ3l1gFRld4yOxV
         Oz4P8AAGLuaoLGQtEMs0QRuvENpaJxR+qpsUAmXewL7nJ4aqdAC8Zi5YiCOwYIUud05g
         W6jsJtOrb7GxO1eFm6rj/U+9W6x63LposnzgAA2ktojHcec0yQG9OXhpP2q+YEnSsOdw
         nOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876595; x=1730481395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZEz4/9qLe30swJeAKIBBvm5fHc5WeQ4yezYVAmOgKA=;
        b=sqNc0Tesxg9CGdOOLpntKqYplM0xnZ4GoMU23kr+wkRD5WOzOA+IloKoG3BKEkmwCQ
         SVaeaEoEZDIFDwwCDS+sO7lZF18lt4YXxSsngbMI6TjnVFXGzUGgr+W60eFznFPput/2
         aRr+U2wwll1veDCieEDSlXfMWM+Bk/bZexvseV0sRrEp4XG/cXTurnxU1cMfuL2IHx7u
         KyngnP+y8vX6u/GMu4y1pZXP8bUuQFquoU0aSLHVsv5UnxWD8d9y6Kd0/2+WDJJJ7GYG
         h/Ty/PLtnxjc0zQ8KXNWdPtRRcvT8UpW7jmXz3G29/h7uC8g85xbejhD6H0EWgYjh4tM
         7a3g==
X-Forwarded-Encrypted: i=1; AJvYcCUVnzPX3Lqrk3kRcounubmBV6YNks3nFU052398ULBtTITsWxQnwejDJWGfDbev4/3sGnVtfV/FyYL8dXavOc7A@lists.infradead.org
X-Gm-Message-State: AOJu0YxmPAR9NZ+JMqxCBV7vl8+2uA7cvFo1HJyIEfqrJVYjbMq+qufs
	aEfXCRo54aeu3PhBjomwU6z3rwqjoACO188TLTBQd0aa9TWejzmHyG1b0vfpcZM=
X-Google-Smtp-Source: AGHT+IFIR9g4wPz9AIYx6zXI6mtmRWJRoukoFOA0zSanhmararEgIJGNhppbZKvOIcKdNVw/sX50cg==
X-Received: by 2002:a05:600c:1d84:b0:431:51e5:22fb with SMTP id 5b1f17b1804b1-4318413f0a8mr100184415e9.14.1729876595075;
        Fri, 25 Oct 2024 10:16:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:34 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:06 +0100
Subject: [PATCH v2 35/36] arm64: dts: broadcom: Add display pipeline
 support to BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-35-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101637_352191_86B17DF6 
X-CRM114-Status: GOOD (  11.63  )
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


