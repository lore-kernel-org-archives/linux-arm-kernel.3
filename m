Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E72C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBSPC8pTSQ57td7P0e51fRcWQ16a8iRP+LO7Bo2xebQ=; b=x1YRvc1FFPZJybaIshCJF4cUqH
	e0kiQWX+KvF3RXhvsNV1AlBUuvZ/38lLTGIFKFe3UnyzNEvEkdNMr1TGk+Y8CLUgr9zBCFR+k/o6S
	xeollpW0PCP34/jf3Zj1sTKDTwArLqrcTHOrY9/W3Z+SgUdS27ZZSgtD4Y0218JxZGCmz0Lk+ob5a
	wjks9v5LC4Z4JjYDGROyD0Y/kiYZpIbOR9USJtR6wr2g52UiWvytiApukuRjtXTVkDfdtvP34AS/h
	CEMLU2hpgSvsXfqQyF/inats4X4sMaMz9VR1+rRnbjIFy6LmRfScE3ZTWUM9Y2E6xTSY1QOcvmr4e
	wsQgrnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZe41-0000000AEmn-1l3s;
	Wed, 09 Jul 2025 23:18:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdzQ-0000000AER2-2p4p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 23:14:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450cfb79177so1869565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 16:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752102851; x=1752707651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBSPC8pTSQ57td7P0e51fRcWQ16a8iRP+LO7Bo2xebQ=;
        b=RDOwFfGnxDJeNIS3CAcXS6KwTjzSwkk7c2K+iDY6oU79gOtEcq2hSvwBaFxHeCgxAK
         FWe9x++Y573wZGCi18NlmiRpUHKrQpHQaOawwTfC4HgRRBlF5HzYXukFTA4b+mWol37o
         HjeWrKIQEWKpdOfphxkM/v3zjobJVwcvGYHAIuAjtgAK7fP1C9UMS+AvNVqLDaMcjtGd
         VIr0d2FNZWv4AJcWi5cgn89HQLnNsnRCs82nx+Q8arKE8P+6sTbDjAz9Zi6dC7ZRIsF+
         5y2MVACw+loERX+H+a8KTt19+T1k/kZEl+LuhwvN0J+vc88hoHdfuYUTA0qrbWhd96fA
         cj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102851; x=1752707651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBSPC8pTSQ57td7P0e51fRcWQ16a8iRP+LO7Bo2xebQ=;
        b=JPZpq7PgqNyR5z8CVcifS3GtiB8XwwcfGgrbPkhR+nfIlGNwClkk8JccnwCSUMbv0v
         0eLMBy08wMUoyCNpxpwZNNStoO7+BAmLKk7M0n3rBYk+MAfLL4NI4n1h905Z2RTGMIpF
         5nw4uLk3MecjZgdasGbTHdr1WpridcIH68jwdDHEaxOaJD+RsquKQsJrB3tLNTTNyAy+
         s2CiyVqiYcQSfZmdgepkNE2GSmcPO+JwQP6VaJaBLGPsoyAT5cVahfR/mBkGdaB45zUs
         IIubKSFifKWeS85kwllv3trA1khTo+8d1/1syAT1IVNmo6bnI7MK7cwbHCxlYAIIigRe
         2LhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLK31M6H48Lwxe/zGnWjH2p8t2q1DsIHH+0ue2kcwZk3oZqQ3e7T4egkVhsYi6HDe+FCt/v00eO+C4ObxAzafh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/bfESjhlPtw46vFWXoZJwOXwGbw2RhHUaNVE0nLXGoWRqqQub
	oLaXnXUVg9SIG1kq/QlIEOHJtAhqDx7s6hH1BGqaxaGhs5U8BAu2DJ/dwaGq6Q==
X-Gm-Gg: ASbGncs6fxlAis7W3d/U5tLgxvwxajTAKRUlHvYDI8TVQQeahd0otTDEeRlQE5lTyFg
	F+r2tL0uXqARx5Yfp4YpMhruWduMq0Z0a6fjz9xzi1LbeoDev33sdDJocdl0s3ht33fMu6mpkuF
	CBmIiuChrBo1IHtMxLQEJv6uZlI4mZ4vZAuq3ZCZm9S2JK+TbickOlvYFv6RebNgU5l2mxnez/M
	3GKRWdKIEDvC8zcQ7XCNtCqSebTYrimLlAkQ5ub9hS85Jqudk/ixFrSOsflprKyHpHuCY/Alh+g
	Oapch01ap+oXgUUsNmWAvbv1PDUqiDJkwgloTo7tGew6xMTO6VqI3ZZl/S0smBDi2SaA9c3DzS3
	eHxdyOfKC1nze768ojcs1uW+CAOO0xiYHrB0hY95Z6eOX5tAKNLzROyDfAQ3SfGio
X-Google-Smtp-Source: AGHT+IG5q5advBlY4ckoQ8foZ+zdJxgd1xAHPVMawLbqSVGFGqZaQAVuJkYW9xVZAOTdfmj8XvPE0Q==
X-Received: by 2002:a05:600c:470d:b0:442:d9f2:c6ef with SMTP id 5b1f17b1804b1-454db7e87cdmr14122715e9.2.1752102850779;
        Wed, 09 Jul 2025 16:14:10 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc3a54sm213923f8f.39.2025.07.09.16.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 16:14:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] arm64: tegra: Add Tegra264 support
Date: Thu, 10 Jul 2025 01:13:58 +0200
Message-ID: <20250709231401.3767130-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709231401.3767130-1-thierry.reding@gmail.com>
References: <20250709231401.3767130-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_161412_715972_B38E8B00 
X-CRM114-Status: GOOD (  13.64  )
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
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 362 +++++++++++++++++++++++
 1 file changed, 362 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
new file mode 100644
index 000000000000..0c9e4809b310
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+#include <dt-bindings/clock/nvidia,tegra264.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/tegra186-hsp.h>
+#include <dt-bindings/reset/nvidia,tegra264.h>
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
2.50.0


