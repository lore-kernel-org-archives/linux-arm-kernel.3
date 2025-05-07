Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0675C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSGmTJ59unapETJe2Z1nCeU9bCg9pHUXtpTUGyt/Iig=; b=hFm7G9Q3mDO8kYRU7aPkV1V1uZ
	cGACTiXvT2lODUNAnyYSxFzkBJT2jDBSQ2ef30bhqyO1GA3IgGCsHel5RKnXVpjSfylLX40Qw4guT
	GXCu2YhTCinHjc2oNK51wswgmz85c9YIUV8vayUgMa1GlKSZ4jSZMbATXRoZRonSgyknLaQ5f/ypK
	RAs6Pp7p1HlmrvyS4lwInhaPPKN1D9ZHOThpUMcAIjBfHygh7/bQAwxAC7duOZYER2xh1FuycYtP4
	5UbxTD3D66DCId9HjEURbIzb6LFJQ57QQhhH/IOg2joZ58+IEp4fudqJlAk2Kk86p3YoA/9ULkpyH
	jW144aIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWY-0000000GHvu-2zvW;
	Wed, 07 May 2025 17:25:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfub-0000000FojR-3uGK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:38:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so40441815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628696; x=1747233496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSGmTJ59unapETJe2Z1nCeU9bCg9pHUXtpTUGyt/Iig=;
        b=TvVzD+FADcy8mDdexm/cqrh8vT0p1mOW/7d10gQ4MmPQBt/j4zJ0kvmkvnue0hRBun
         7aCmYVLiBUpKdBjWRghdQJctfaZEe2Tks3HDx02+czOp6fPP+h/LVhcRsG6A/OlruMca
         +NNcbQpR+kwkfneqnmgffKvCZpEqLwqCTF2is1QwE3AsRKAkSL8rsljDTPVL7nY+ywRa
         2Js5a136DEEKkb5Bwutbh1l7RfYnU728B31ergN6IyGK3LdLFGKqmRdqlc+I1Rhgdeld
         XSeNm2RgSmvTe2rc57p2dQ8M9KB/lqBo2t5RQYl+gKp4dACnvsImpbL0NV72R7ih7aSW
         aqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628696; x=1747233496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSGmTJ59unapETJe2Z1nCeU9bCg9pHUXtpTUGyt/Iig=;
        b=libgt6+t4koILlh3zUrmedMkUg/j8Hfq0n9NvvPuBwIbD0ih0TqSin1vBSipI4nrYd
         Zu1vCc2lZJ5EAswVPJTjdFW0F6NiUCEmGm+VWJFYt3E+v5r4hP0YsjzNcEO4H0b8ysMe
         kJvNWeqtt+oYcs1PhBAQxZCteUoDuQ/WEY8xzrwqoH8YabpgyhEqVvVTcQWuI5/sIF9s
         B4al+C9aVSjGqvjVkpeC5QKl0EwZPM+xbPATSErWr61VILGXBynaa8MlekNqmC7KTjc+
         j2RLOT+YZa/jNiUhwBfgpv9HkRtueyl0SlpqPHP20U9CWqw0NfFr6SikuTwMl9OT7okN
         VfQA==
X-Forwarded-Encrypted: i=1; AJvYcCXLayUutinJk+kh3ijQQQi+bFFhndMs7GVGMfIYdluKLzmwtB31f8cY/G1PKIJSM9xGCwUkJeCMhYOI+S458xKF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5t7cda8osdusmlTAQmvDzXIRkAgxzw/eUWTo2YI3VIOgjxsg/
	RR4BFwd8WYxKh7t/8fSftShIH8bEyScttDNRlI96jFdBJXE5HLywjHATkg==
X-Gm-Gg: ASbGncvLYm6vWcg2XimpaSXnkmZ1gLq+GKcgbE+za2tgdMYWzYBzet6VJHfkA9oQxO5
	vDE2IMD4QmiBP8KZqBO7rI0KhuL811VHnFB9xuvH66HHVNdsTvFlRIhOZbig+3Os7Cksyrrj8Re
	55s5Pp75R7ZEhoHJzYFvxhMILfS97uzLtjDzVRn68/HqHGm5+iVPtnpMhWSIHbBDRhKfzXQ+Nsj
	ot3JgX3atgq8Yb1hjrp6JMII0UhkydHR6/YYaE0yOlv1b9yD2SMNwQdWOo+0FBFzB/TJJ8sRR60
	V6UpEmS/j0XEHzzIUPVXJgXSXeiXVoqCVk65f/G5Q8pccxF1f0VzkyNsNQR1fsQUhdcDWcA2F3/
	2JUXQRjmCoXhA2jdp6myHJE7+s0w555wy
X-Google-Smtp-Source: AGHT+IHBRYtQe8SyD5NaCFN5EWdwRdEZV+QQ8If4cEYb4IWVUbSinNDq0I7CjAEbqGTOySM4bt1pZQ==
X-Received: by 2002:a05:600c:a47:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-441d44dc067mr28374845e9.22.1746628696289;
        Wed, 07 May 2025 07:38:16 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b17096sm17605859f8f.96.2025.05.07.07.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/8] arm64: tegra: Add Tegra264 support
Date: Wed,  7 May 2025 16:38:00 +0200
Message-ID: <20250507143802.1230919-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073817_971288_CC6DD667 
X-CRM114-Status: GOOD (  13.47  )
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

From: Thierry Reding <treding@nvidia.com>

Add basic support for the Tegra264 SoC, sufficient for booting into an
initial ramdisk.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 363 +++++++++++++++++++++++
 1 file changed, 363 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
new file mode 100644
index 000000000000..468c94137ef1
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -0,0 +1,363 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+#include <dt-bindings/clock/tegra264-clock.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/tegra186-hsp.h>
+#include <dt-bindings/memory/tegra264-mc.h>
+#include <dt-bindings/reset/tegra264-reset.h>
+
+/ {
+	compatible = "nvidia,tegra264";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+	numa-node-id = <0>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		shmem_bpmp: shmem@86070000 {
+			compatible = "nvidia,tegra264-bpmp-shmem";
+			reg = <0x0 0x86070000 0x0 0x2000>;
+			no-map;
+		};
+	};
+
+	/* SYSTEM MMIO */
+	bus@0 {
+		compatible = "simple-bus";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x00 0x00000000 0x00 0x00000000 0x01 0x00000000>;
+
+		misc@100000 {
+			compatible = "nvidia,tegra234-misc";
+			reg = <0x0 0x00100000 0x0 0x0f000>,
+			      <0x0 0x0c140000 0x0 0x10000>;
+		};
+
+		timer@8000000 {
+			compatible = "nvidia,tegra234-timer";
+			reg = <0x0 0x08000000 0x0 0x140000>;
+			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 775 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		gpcdma: dma-controller@8400000 {
+			compatible = "nvidia,tegra264-gpcdma", "nvidia,tegra186-gpcdma";
+			reg = <0x0 0x08400000 0x0 0x210000>;
+			interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 609 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 611 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 615 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&smmu1 0x00000800>;
+			dma-coherent;
+			dma-channel-mask = <0xfffffffe>;
+			status = "disabled";
+		};
+
+		hsp_top: hsp@8800000 {
+			compatible = "nvidia,tegra264-hsp";
+			reg = <0x0 0x08800000 0x0 0xd0000>;
+			interrupts = <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 622 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 623 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 624 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 626 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 637 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "doorbell", "shared0", "shared1", "shared2",
+					  "shared3", "shared4", "shared5", "shared6",
+					  "shared7";
+			#mbox-cells = <2>;
+		};
+
+		rtc: rtc@c2c0000 {
+			compatible = "nvidia,tegra264-rtc", "nvidia,tegra20-rtc";
+			reg = <0x0 0x0c2c0000 0x0 0x10000>;
+			interrupt-parent = <&pmc>;
+			interrupts = <65 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA264_CLK_CLK_S>;
+			clock-names = "rtc";
+			status = "disabled";
+		};
+
+		serial@c4e0000 {
+			compatible = "nvidia,tegra264-utc";
+			reg = <0x0 0x0c4e0000 0x0 0x8000>,
+			      <0x0 0x0c4e8000 0x0 0x8000>;
+			reg-names = "tx", "rx";
+			interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
+			rx-threshold = <4>;
+			tx-threshold = <4>;
+			status = "disabled";
+		};
+
+		serial@c5a0000 {
+			compatible = "nvidia,tegra264-utc";
+			reg = <0x0 0x0c5a0000 0x0 0x8000>,
+			      <0x0 0x0c5a8000 0x0 0x8000>;
+			reg-names = "tx", "rx";
+			interrupts = <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>;
+			rx-threshold = <4>;
+			tx-threshold = <4>;
+			status = "disabled";
+		};
+
+		uart0: serial@c5f0000 {
+			compatible = "arm,sbsa-uart";
+			reg = <0x0 0x0c5f0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		pmc: pmc@c800000 {
+			compatible = "nvidia,tegra264-pmc";
+			reg = <0x0 0x0c800000 0x0 0x100000>,
+			      <0x0 0x0c990000 0x0 0x10000>,
+			      <0x0 0x0ca00000 0x0 0x10000>,
+			      <0x0 0x0c980000 0x0 0x10000>,
+			      <0x0 0x0c9c0000 0x0 0x40000>;
+			reg-names = "pmc", "wake", "aotag", "scratch", "misc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+	};
+
+	/* TOP_MMIO */
+	bus@8100000000 {
+		compatible = "simple-bus";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x00 0x00000000 0x81 0x00000000 0x01 0x00000000>, /* MMIO */
+			 <0x01 0x00000000 0x00 0x20000000 0x00 0x40000000>, /* non-prefetchable memory (32-bit) */
+			 <0x02 0x00000000 0xd0 0x00000000 0x08 0x80000000>; /* ECAM, prefetchable memory, I/O */
+
+		smmu1: iommu@5000000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x00 0x5000000 0x0 0x200000>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 13 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror";
+			status = "disabled";
+
+			#iommu-cells = <1>;
+			dma-coherent;
+		};
+
+		smmu2: iommu@6000000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x00 0x6000000 0x0 0x200000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror";
+			status = "disabled";
+
+			#iommu-cells = <1>;
+			dma-coherent;
+		};
+
+		smmu0: iommu@a000000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x00 0xa000000 0x0 0x200000>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror";
+			status = "disabled";
+
+			#iommu-cells = <1>;
+			dma-coherent;
+		};
+
+		smmu4: iommu@b000000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x00 0xb000000 0x0 0x200000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 31 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror";
+			status = "disabled";
+
+			#iommu-cells = <1>;
+			dma-coherent;
+		};
+
+		gic: interrupt-controller@46000000 {
+			compatible = "arm,gic-v3";
+			reg = <0x00 0x46000000 0x0 0x010000>, /* GICD */
+			      <0x00 0x46080000 0x0 0x400000>; /* GICR */
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+
+			redistributor-stride = <0x0 0x40000>;
+			#redistributor-regions = <1>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			ranges = <0x0 0x0 0x00 0x46000000 0x0 0x1000000>;
+
+			its: msi-controller@40000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x0 0x40000 0x0 0x40000>;
+				#msi-cells = <1>;
+				msi-controller;
+			};
+		};
+	};
+
+	/* DISP_USB MMIO */
+	bus@8800000000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x00 0x00000000 0x88 0x00000000 0x01 0x00000000>;
+
+		smmu3: iommu@6000000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x00 0x6000000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 226 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror";
+			status = "disabled";
+
+			#iommu-cells = <1>;
+			dma-coherent;
+		};
+	};
+
+	/* UPHY MMIO */
+	bus@a800000000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x00 0x00000000 0xa8 0x00000000 0x40 0x00000000>, /* MMIO, ECAM, prefetchable memory, I/O */
+			 <0x80 0x00000000 0x00 0x20000000 0x00 0x40000000>; /* non-prefetchable memory (32-bit) */
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x00000>;
+			status = "okay";
+
+			enable-method = "psci";
+			numa-node-id = <0>;
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x10000>;
+			status = "okay";
+
+			enable-method = "psci";
+			numa-node-id = <0>;
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+		};
+	};
+
+	bpmp: bpmp {
+		compatible = "nvidia,tegra264-bpmp", "nvidia,tegra186-bpmp";
+		mboxes = <&hsp_top TEGRA_HSP_MBOX_TYPE_DB
+				   TEGRA_HSP_DB_MASTER_BPMP>;
+		memory-region = <&shmem_bpmp>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+
+		i2c {
+			compatible = "nvidia,tegra186-bpmp-i2c";
+			nvidia,bpmp-bus-id = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		thermal {
+			compatible = "nvidia,tegra186-bpmp-thermal";
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		status = "okay";
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		status = "okay";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		status = "okay";
+	};
+};
-- 
2.49.0


