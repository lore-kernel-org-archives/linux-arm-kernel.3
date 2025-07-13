Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B838FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 09:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Hm16g5Mxtx53PSxMN74Q22wyf8qfoU99Wb/xlnrO7E=; b=ZewKYHOpxN7VkG0iX7u1K9Cpmu
	8KLhxUZN1in0QQALFCHDvfDMnsFBCX7EpY4RxB8LtOPId+GbcRWN9HuN332tYNBAaz6OjwGs56+bf
	Zj7OY4VEI2A1B3oXF5rhB2YUeFKn74bHgGcIibXPs/sCn2t0Ow3XGnRKiet7lhqIgzUpe/S6U9mud
	f/ph46qeh8MiOj6rPv06yeQTSUqWPknDne+21/x+GFNbwqi5XoIpq693zs9cXX44glI3jWB9r7r2b
	h3AFIdgbq0XFPqHgg4yAd73cpvUWgk2K9mROjTRT5QOOL9UPgxmq2IzTycdcrBl1o+cbvLzNQDlh9
	wGKOivpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasiG-0000000HaQt-2rbC;
	Sun, 13 Jul 2025 09:09:36 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasEz-0000000HXHQ-0RZ5;
	Sun, 13 Jul 2025 08:39:22 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so590647566b.2;
        Sun, 13 Jul 2025 01:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395960; x=1753000760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Hm16g5Mxtx53PSxMN74Q22wyf8qfoU99Wb/xlnrO7E=;
        b=tgDCVsuXa/t9P1QILYgMdSGgca75iJFbDEmdoZWYOukOZOcau2M+csztvmKyAE4Xcr
         Y8oS1wA7kRsn0xUwk63ZE6AkkvUzByW52OvnPJPc7Knlp7Rb1/xcZnUX4Ta3f4WQDVv9
         a6B+2VmsbPVgTpXqx87meWABEZbFncKfUKW3TBSNO9Vbp/2KQk/bije86/BUeIx0wAL6
         7AYKHKKWYJ6i3fbx5iOZG1wSbyPt7zdmyFK5uVquVIcsI9wOUXHlvK6AvoRq6VLwF7Qn
         GR2hBmIIBKqArT/ojiCKq6X5VnejFZ7AZfUDWuugZ9RCqbUWmLsi4Qv4XApc9iqLwL2w
         jdVg==
X-Forwarded-Encrypted: i=1; AJvYcCV7rq5YDjhUDp7Gwxefh7lq9i6NgIVBRyNlIyqSwBTEruRR/bm/kZQ2Lr/QuXBz0psdEfq0+kzctxxoC4S490E=@lists.infradead.org, AJvYcCX9c5435p/EbFLGEjoT+Hw1w4oxlY1I7PRP0OEODVJdXOXGTjMWEpjAaDMU7bN4JVg4pRe0CO/o4x5CHw6NtgAZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwqqDPBs8j92zKntJ4+F5gJRfpaUMZBy+KXlyG2tLHN/z5KtTa7
	KPJoqV2PGSHmd06JpKe9xGFjPWIMQWo2LpWcJfgeblHFzP6iR4h03/Moez15eFOa
X-Gm-Gg: ASbGncteANP8rO9KSUOS4t1SvJs0GGrUmX6p0gWTKIEHCDLGE8kAGkuE+2eG6YVwCq+
	gzFwswvp6TXAptH0V3w4ezb1yQr3NGEFsFAGNSdEjKGmHbpV504rJd10sX0Nkisff5RfMrSujXw
	QPUf/ILnFdqOKY6vtjn6BUjGzvuSJVWlJHzmTiayl6FoBNmq/0bISLWrZFXxLwfSuntXaDxIgx9
	ADwCU32/OdeaTqDRxgkLlNXGbS6Op79ztvykp88Etpm9Gph1Ezm7pkTTUE0UPOIeNRvU5/H3wtu
	JMXl1tAw8Qx6FgFUIjHqAHB9z2evGVzyinq+QGbXzhCVk9fqhNX+rbodsPLUjyn0y0ErFOaJFUZ
	kEzGPTNOUy1osBqU36Ew9LxeDI0j3cUpt9jNBkTwaBuXEme7CvICfT6Os
X-Google-Smtp-Source: AGHT+IHYAnqKa11NZdx4DJugnnBcrrL8eyEdMDfMSbvMuRV0PN4x6j1/G2L31aEokbnVnM1KlwmfHA==
X-Received: by 2002:a17:907:3f14:b0:ad8:a935:b8eb with SMTP id a640c23a62f3a-ae6fc6a70b1mr950430466b.3.1752395959438;
        Sun, 13 Jul 2025 01:39:19 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:39:19 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:58 +0200
Subject: [PATCH v8 08/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588-base
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-8-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_013921_149772_4E9EC861 
X-CRM114-Status: GOOD (  12.64  )
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

See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).

The IP is divided in three cores, programmed independently. The first
core though is special, being able to delegate work to the other cores.

The IOMMU of the first core is also special in that it has two subunits
(read/write?) that need to be programmed in sync.

v2:
- Have one device for each NPU core (Sebastian Reichel)
- Have one device for each IOMMU (Sebastian Reichel)
- Correctly sort nodes (Diederik de Haas)
- Add rockchip,iommu compatible to IOMMU nodes (Sebastian Reichel)

v3:
- Adapt to a split of the register block in the DT bindings (Nicolas
  Frattaroli)

v4:
- Adapt to changes in bindings

v6:
- pclk and npu clocks are needed by all clocks (Rob Herring)

v8:
- Remove notion of top core (Robin Murphy)

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 91 +++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 1eddc69fd9c9ed95cdc810ba48d9683e3f82489a..dbd472feaa8b3f8c14597a48a4f5afbe3cb45b6a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1140,6 +1140,97 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	rknn_core_0: npu@fdab0000 {
+		compatible = "rockchip,rk3588-rknn-core";
+		reg = <0x0 0xfdab0000 0x0 0x1000>,
+		      <0x0 0xfdab1000 0x0 0x1000>,
+		      <0x0 0xfdab3000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
+			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+		clock-names = "aclk", "hclk", "npu", "pclk";
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+		assigned-clock-rates = <200000000>;
+		resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
+		reset-names = "srst_a", "srst_h";
+		power-domains = <&power RK3588_PD_NPUTOP>;
+		iommus = <&rknn_mmu_top>;
+		status = "disabled";
+	};
+
+	rknn_mmu_top: iommu@fdab9000 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdab9000 0x0 0x100>,
+		      <0x0 0xfdaba000 0x0 0x100>;
+		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_NPUTOP>;
+		status = "disabled";
+	};
+
+	rknn_core_1: npu@fdac0000 {
+		compatible = "rockchip,rk3588-rknn-core";
+		reg = <0x0 0xfdac0000 0x0 0x1000>,
+		      <0x0 0xfdac1000 0x0 0x1000>,
+		      <0x0 0xfdac3000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU1>, <&cru HCLK_NPU1>,
+			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+		clock-names = "aclk", "hclk", "npu", "pclk";
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+		assigned-clock-rates = <200000000>;
+		resets = <&cru SRST_A_RKNN1>, <&cru SRST_H_RKNN1>;
+		reset-names = "srst_a", "srst_h";
+		power-domains = <&power RK3588_PD_NPU1>;
+		iommus = <&rknn_mmu_1>;
+		status = "disabled";
+	};
+
+	rknn_mmu_1: iommu@fdac9000 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdaca000 0x0 0x100>;
+		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_NPU1>;
+		status = "disabled";
+	};
+
+	rknn_core_2: npu@fdad0000 {
+		compatible = "rockchip,rk3588-rknn-core";
+		reg = <0x0 0xfdad0000 0x0 0x1000>,
+		      <0x0 0xfdad1000 0x0 0x1000>,
+		      <0x0 0xfdad3000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU2>, <&cru HCLK_NPU2>,
+			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+		clock-names = "aclk", "hclk", "npu", "pclk";
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+		assigned-clock-rates = <200000000>;
+		resets = <&cru SRST_A_RKNN2>, <&cru SRST_H_RKNN2>;
+		reset-names = "srst_a", "srst_h";
+		power-domains = <&power RK3588_PD_NPU2>;
+		iommus = <&rknn_mmu_2>;
+		status = "disabled";
+	};
+
+	rknn_mmu_2: iommu@fdad9000 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdada000 0x0 0x100>;
+		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU2>, <&cru HCLK_NPU2>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_NPU2>;
+		status = "disabled";
+	};
+
 	vpu121: video-codec@fdb50000 {
 		compatible = "rockchip,rk3588-vpu121", "rockchip,rk3568-vpu";
 		reg = <0x0 0xfdb50000 0x0 0x800>;

-- 
2.50.0


