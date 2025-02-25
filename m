Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5393C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bttKeyS+W49kYKVE/Q0TanEzPtlhvTNN8fcNqxR6WQw=; b=lkxISDjdxLBevnaRzL4RakLxOS
	YZzHVedGeGGnF5vwWQYVTEs3ZnLvmOdhjdjzkEy650hpTljTU+VMUs8pCcaFDc8JVi/Yw18wa9+XG
	YeIvBrylTFHkEIylZhfPkCXb6U0le2sKLCBAR+M/NZHnZaZsCcHgiFFC8TUVmrhw5cx8BsI5Rhjp5
	jWfWBp3rEB4LbExcXgJcGNE4xksn2lTdjzxO+7XD1PCY3zfxgbtnM/Wn243dObmERSPfIgM2OcjpL
	e9tmC8BVe3fDm+pHvF9BwQ/rjbLV2FlpVPmyONhhF/+IKAkXciXus3tOZ7hLgPxJyfmkHZdTVjQtR
	y0tUOymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmprs-0000000GIgA-3itn;
	Tue, 25 Feb 2025 08:00:40 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpnQ-0000000GHcp-2Kfo;
	Tue, 25 Feb 2025 07:56:05 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a823036so49961515e9.0;
        Mon, 24 Feb 2025 23:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470163; x=1741074963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bttKeyS+W49kYKVE/Q0TanEzPtlhvTNN8fcNqxR6WQw=;
        b=u35g6FPHO1EctElQbU+Njl0m+Ih9odPpMMGxdbCM8lHcd6xQR4Q14JydtGjX5YnoLt
         a0yp0HRydGFlMUcammwFaLj+uaSMxHqIWIaXbjMh2kJTPhuS9Bx3+tb4JT+8bsHQRsgM
         ik9B91tHvpBUCA0mUSOj+HKNocJn55zptMqLYBZGT1wj0cDre3BK38FWlRkngDiVYLp9
         xZwWtgFPqmSZRy5rQ+YmRIraO8LTFvZP8wmgvYSCDBHOAapETleA5z88r/nXvAhRA2jl
         UVEMoitdfIUGP+nnCvBATRx+RsCC7BZt9wemtuh9jini4MPPJDHDZy4V/EJsPrUVq3v7
         T2sg==
X-Forwarded-Encrypted: i=1; AJvYcCU0IfbXay6CpMthZ/DiUQoAPtsPOo0LaBC3cjrwyAItIi8Ngq6a3/LjxkW/mZXMT6m8y7i7NbQYuqe9fD1huSU=@lists.infradead.org, AJvYcCWeV7Dg5nppxlXEg0KmIDNrOPG9K4wU5MiusG6r5NSOclCN0Ga7GGaTDLkEjmdF6sRYh709qe/CPXZrTeZGSRFH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3cbXrJrt60rBoOf2YehNVUR6PX9uwqj7owfKNQOd/PSIJ6MBc
	iNECPwQpU31Qi2j7UNk8KxW7M7SVPM8I9j7NDlXmNJmkWgeTehP0
X-Gm-Gg: ASbGnctbvAODEm9KZn7psMvlL6K4UZ3mBnN3ITrqn7sIstJJN4Sl/YwJHN9OwdfUzWW
	daxIUBOttST33mqdhbwQoJxo2sF9YtrjyYw9aJESZLF0GKrMy5NKcVUSwqWjbKHiGp9FnuePoZF
	Ud9MvHaSWTHqi6cL1issKzMmKIEG7yNtbgtnS/5zObJZObJtuEb0W3fkxpEeo89Lm07G+g1PXnJ
	wr1FIwG0BTF6W7VKM5X9rTObAYlOExILMek4CZPp+qFLZxNJ9iEmukFtB5LJ9m/a3d2MT3lHP9s
	AIFQjWe6TN2mpnmc95JNT6RgToqs5gz9Hbk25U1AsoSkcW7X0bQLOBYtJA==
X-Google-Smtp-Source: AGHT+IGlnf3zeYcKfw6UHFzFMOBrY9gNCtvaCQ4A3tiD1q4/beEfrfwhp2DF03Do2Fta+a8Paidiyg==
X-Received: by 2002:a05:600c:470a:b0:439:a139:7a19 with SMTP id 5b1f17b1804b1-439aebb3155mr125686995e9.23.1740470162856;
        Mon, 24 Feb 2025 23:56:02 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:56:02 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 25 Feb 2025 08:55:48 +0100
Subject: [PATCH v2 2/7] arm64: dts: rockchip: Add nodes for NPU and its MMU
 to rk3588s
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-6-10-rocket-v2-2-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
In-Reply-To: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_235604_601894_7C54E4C2 
X-CRM114-Status: GOOD (  12.47  )
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 76 +++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8cfa30837ce72581d0b513a8274ab0177eb5ae15..2680ed854e0c2ba5de167740ef18fcee167016fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1125,6 +1125,82 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	rknn_core_top: npu-core@fdab0000 {
+		compatible = "rockchip,rk3588-rknn-core-top", "rockchip,rknn-core-top";
+		reg = <0x0 0xfdab0000 0x0 0x9000>;
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
+	rknn_core_1: npu-core@fdac0000 {
+		compatible = "rockchip,rk3588-rknn-core", "rockchip,rknn-core";
+		reg = <0x0 0xfdac0000 0x0 0x9000>;
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
+	rknn_core_2: npu-core@fdad0000 {
+		compatible = "rockchip,rk3588-rknn-core", "rockchip,rknn-core";
+		reg = <0x0 0xfdad0000 0x0 0x9000>;
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
2.48.1


