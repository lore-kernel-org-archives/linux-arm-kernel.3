Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0CBC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=; b=UjIRo7eN3XrrCewnStfCQJmOsm
	8mXSoJTgUTMvJ+bACyqdYeP+wuZnjz963D1vlxJ7FjJZug7aoUiP/P979/0tEjmueJqhlkbap7Wmj
	tj6unHhRNQiLD0iXTWLj35O89+mqW8dpvCqPdKlsu2gQRzAdj6DI4WaZJ1farVBoYjdJOuGIJ5Gfi
	quC1sggUoLOG0ntLCfktqUAd9xxnNNfCGREa2R8hJWJ2mw1xGxchl7ZLvBkLTnVVd+YAzGKIRIFjl
	62NwJfp0/Hs/hmSEjt4lHgSaJZZ7DFcJ6dbgXUVmX1Dydz/6hat9yhj41XlkC3tFBSsuHFX1bqpcT
	ONE/CIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7n7-00000008I3D-3PFt;
	Tue, 10 Jun 2025 22:50:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Kr-000000080jC-2blV;
	Tue, 10 Jun 2025 20:12:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso11953915e9.3;
        Tue, 10 Jun 2025 13:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586360; x=1750191160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=;
        b=Uf7HldRtqQHb0XjXYN55jKj72DvbQTIPR0GvhbLrBcsnJrgYpUv/WHY0VM2b+Q2WDh
         ckA1HIdvlVzulqJAeBWO+wcfq+zifOJaK1pFyvPQ8tDMdpQ6wKtm15X1vapamGsHRXhy
         SEaPPsSomSGGsfxp/iX4spiv6kPinOEOVVkHDSvgklnvipkID4YO/5HMiGycE2sEuWXJ
         m+4mAJt8SkjDDUTfJCMvyWKDmoxddme/CTxgU0PAGEJbCljK/DXVOtMFBZ3VavgnDKFZ
         Gsn9MduEE8uzWq8ZdOOf97q9ZqxYvtOVqZa/IewdMvqGx99EPceyt1kz5Hw6X01djjRX
         50UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586360; x=1750191160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=;
        b=GrovrgBWoA+Yw0a7E5NEhUAgShoUf8sjpg2JzrGKNdSVDo2RfiIZfsKXYvDDv6o2DS
         I9sBnkZMR0JtKdsDKbon3FCWmiiIXF/wgzZ3T2PzReeILmvaeIwhkunIEOD3CbuDHsTB
         sM2KK0dIyOsQ6ejQKCWtEL+aq/yzyTudeIa+4CS2ompcBMOG5wRt1Qy7QBY7e7g+jqez
         2LsAs21c/VmWDTvwO5mfVmYtHKlpLEMeG400KSP8YLHq6ugAVkZibkZaTiLCq7z9xAGR
         H4CJ68TiooDLNEQgaLWSpOcFajQmVx7DIwny+lAOb/2KNac9IM6vwTHfF5X6lTRKKeOm
         VlCA==
X-Forwarded-Encrypted: i=1; AJvYcCUY8o89+yFCLzw9u1SFDVpkwpRb18xWe9T2qwrdbqzKLksibKOoOzwtsSzQFk4IBg0HsAkC3OQmH6Kt/2jfw73z@lists.infradead.org, AJvYcCVvRlzCaHib5jENBKuzn1CZETZhJnrTIoZv7d6YTdiM0oBO646c9HhuDRarXpNb7mlMEEGJLNGXsWdETUI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzLKxzRElE5XQqiif5n5YmhrhPdq8LviX3K5K7oLlhCy/fF2Pz
	sCc+24l2xzrK8TQbx5a4VPaUt6dR848RrjPQoe2R3Ikk6B2xut4Zgy3O
X-Gm-Gg: ASbGnctF/9OZ1twZUjSKiDqp1An9ARPb9FEJ+unhwvunHnTspPJOv1x68IIPDMq2bto
	Noqn9Rd/zeBxUI5S4YC546QRb9trLG5Z3WZrYR8x7s9cD5Vu1eV1IpRkXlRwUJAnyDaE6gyJgH0
	YCvQlKAnsBTll19X0fLzlugYCh+Hc5WDsEcL5F+Vn0ZYW6CU3H2G3CkGrdgkfPqIua6Z1sXJLrb
	62RgGNRlacK4OqRel7PRsz7hPXUiaJxLF36g5VEG1y0YKMnD6c8wRWr46QUItrpt/n1j0LAfFSN
	7J8oSV7S8HY/hOzYb+jxVAjJEH5EETnPThoktykyDhBwndd4eUunCaVcDMR+FbT0Yt2jwicyP7c
	=
X-Google-Smtp-Source: AGHT+IHyEoGHD5tepEtrwPhkiYB04vT6fIVhYLL1fSUiVeF1jVVohZotdneB827s6FkCiDb96kHwFw==
X-Received: by 2002:a05:600c:4446:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-45324eded2amr990395e9.8.1749586359758;
        Tue, 10 Jun 2025 13:12:39 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:39 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 2/6] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Tue, 10 Jun 2025 22:12:15 +0200
Message-ID: <20250610201241.730983-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131241_659683_6D3D8F42 
X-CRM114-Status: GOOD (  12.94  )
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

Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 86 ++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..51177dfe9ed2
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv180x.dtsi>
+#include <riscv/sophgo/cv181x.dtsi>
+
+/ {
+	compatible = "sophgo,sg2000";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0>;
+			enable-method = "psci";
+			i-cache-size = <32768>;
+			d-cache-size = <32768>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x20000>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512MiB */
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+		cpu_on = <0xc4000003>;
+		cpu_off = <0x84000002>;
+	};
+
+	soc {
+		gic: interrupt-controller@1f01000 {
+			compatible = "arm,cortex-a15-gic";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x01f01000 0x1000>,
+			      <0x01f02000 0x2000>;
+		};
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		always-on;
+		clock-frequency = <25000000>;
+	};
+};
-- 
2.49.0


