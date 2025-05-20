Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919CAC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laEkWWVQjQ2oI3CZqHqG5uO1wLsoJjXKyEWBV14uYNg=; b=Bs6T0GiU7w0GmQxTbZkMbpWUn9
	IBfrToBcLvKP74g8qGZO/pcXdT4XrqIHiwGoVDATnJQH7bVWCTUkKB+r1PSVhQgFRT+u/iupJ1Z6I
	9dbpSL5ij1M675J5WzgzmVIzCIa6BZcbTNF4Aj0ykNgoLHpDhrxQVgOVZXq9xbEW770PZvg+Ia51x
	HuVWl9NtXAHkAG5Mm8cL7HfJ242MmdDDDtmCWZeFSZysKC/ITctFNtEl1t+aIdy4e7YnqJP7bjSPr
	JEwyNY4R0BN+j0LpnOubTVVWUw4W6K1erlq4rIu1hQqyHs106+K84/aFyt8bJ5qqTso3BxqY1c91g
	MwpwnaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKcc-0000000CSrf-14b9;
	Tue, 20 May 2025 10:54:58 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKC1-0000000CLFN-2ezJ;
	Tue, 20 May 2025 10:27:30 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso67802005e9.2;
        Tue, 20 May 2025 03:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747736848; x=1748341648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laEkWWVQjQ2oI3CZqHqG5uO1wLsoJjXKyEWBV14uYNg=;
        b=ptNJ/s1/YA3v1jZ43iIeXiupyLaJBbxy8Tzp6rxDIW1xJ+3av8XiaEBi5ie8A+rDRg
         a3RCh/XO/JXswNxuq4ZktYmxsBO3LMm0v8A2U+uzm1y09ggcKGBMlTnm9oQ/D2ZMS7h8
         RY0hkOeKPJMSefVmEhSUKXEb3Wo9uxj1+X+gDah1VATkIQTKr7o3K1ccM/j78uwMt9ko
         XAbEXa1IwIrJdH1tvkV+GeSS7h7RGZbCtVOE8PAMWVSPLWIdNCnF3DDCsvyowpn5jm7g
         jv2BGX7Er3g39R8zTgL37TUsoLkIe6kc0lVcutuQoKp7Vgzuo4vF122gT7Iffkhk86oc
         kKUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE9d27IT+nFx96e+qUH9DkUqiCMQKwN/sLE779w6/kG5+oaFHRWiMw5Ha8881SI5pw8KkHcXRGbO3xurYJO08=@lists.infradead.org, AJvYcCXuA8aIC5Mq38V25em9KL2HVrGXDhlgmeRGRyr4i6txOt1gHcG+WZoG6sGKccfBtoylPK2JYdBtWkBL6bSA6CYP@lists.infradead.org
X-Gm-Message-State: AOJu0YxoQKGNVzpRAlwoENunFWp4dszAVLoMne3VhbcPxujUPsIRkQR9
	UUzHpnKVMTjyMqBtVXtdSjm/uPlNvHqk2JfBaUonEVOxdTA6IcJ0r1sV
X-Gm-Gg: ASbGncvz1YTs1XWbiQ0Lhn6eronkwLxtHrYcKiBvzO/5Wlz1xH0cXkgeNNoJLOeEgMj
	J0IcQnFqlQTPUxNmOHXOPJ0g37R6Y39JBhQMqd/p+XX9/jeylFY70cMAwkGoLOn+h2D2T6S6bBk
	kVMvlbnKotwMaVZgIn7zGh9NfhL+DgJEGXqfm7uq8ItZGBeTPMmbhK4A3HlJ4r6vzNF+VUjW0Po
	hOfQ0gWMNc2NuVgs+mU+0afrGhxSl8WGULZneWkHL45cOTHLyPGExyJ+Ese2IrOmmL4L2gaTzqg
	qyVLYpD+7D6QsPu+vvaGNdbDTzUtTedsvDusnN0Vr2iVkiFlUvg4eM6c4uZR+Qtgb9LYEyZB4Oo
	ZRSPItxu0Tw==
X-Google-Smtp-Source: AGHT+IE5Bxm/E8r67kmDtvflrTA0WsP6FuXs0GnBPgIeKU2e5T6lT8BURuMuEsuYnHCevSt98CcBpQ==
X-Received: by 2002:a05:600c:6806:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-442fd618ee7mr138062635e9.9.1747736848247;
        Tue, 20 May 2025 03:27:28 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:27:27 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 20 May 2025 12:26:55 +0200
Subject: [PATCH v5 02/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588s
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-6-10-rocket-v5-2-18c9ca0fcb3c@tomeuvizoso.net>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_032729_678385_DFBDAFC7 
X-CRM114-Status: GOOD (  12.51  )
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

This is a derivative of NVIDIA's NVDLA, but with its own front-end
processor.

The IP is divided in three cores, programmed independently. The first
core though is special, requiring to be powered on before any of the
others can be used.

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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 85 +++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..f5e58851047e80b23f9ff3244692ad868ddc1ff6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1136,6 +1136,91 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	rknn_core_top: npu@fdab0000 {
+		compatible = "rockchip,rk3588-rknn-core-top";
+		reg = <0x0 0xfdab0000 0x0 0x1000>,
+		      <0x0 0xfdab1000 0x0 0x1000>,
+		      <0x0 0xfdab3000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>,
+			 <&cru ACLK_NPU0>, <&cru HCLK_NPU0>;
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
+		clocks = <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
+		clock-names = "aclk", "hclk";
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
+		clocks = <&cru ACLK_NPU2>, <&cru HCLK_NPU2>;
+		clock-names = "aclk", "hclk";
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
2.49.0


