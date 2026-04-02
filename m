Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6925BD3942E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/X4jTz6p0HVhWNP5VyN87jvXO1HteSTbBLVy6AgCcPQ=; b=BCZtmC8J1YY1B6naGgxKasqmR7
	gcWj5PcvuzHRziB0bFSpBzXEUg0WbG20zBFaw2c6PcsJZ5zNwp6heijUMAb+Laetb0G9NPVOc77Qn
	hbzp7IRzIOqkNLGMLntb/UYAKm/5l+HzZeeQqsncTYoITE2AJNgkBGBGj+ejPpJZLo84RIO1b2m8D
	7mZSXjrYREbIGDkDaWj1zSpmCS+jbFA4xas82eMRVgAzFWQ1mec0XFp/t16hR+XR7+JXYe0tK4TBh
	zmew2ppUDQSfCwU4sgf6RvsxUKNBHZn76bMnb/fi3TVRpNRDeiA/JoR+I09NRsvpuQloZe6t3XX1R
	MutsQYZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1o-00000000L9z-0E5F;
	Thu, 02 Apr 2026 14:28:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1j-00000000L1c-163f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F8E560128;
	Thu,  2 Apr 2026 14:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAD1C116C6;
	Thu,  2 Apr 2026 14:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775140086;
	bh=jYBBKg3Y7KpHmnh21GneYr3GYiLyKe3yBAWQm4Vwwh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i2swjqI+h0T5bux1CJM2467rAsYnpRwolgzO20v4Ry76ARm4rRpzWX1/k4JwE4Hkq
	 MPGxX+IMihKdoVomu5SE0m/2gtxq9SbuHTpt6M1QUCupBM2mggcre1haFgEJEkmhy6
	 cCAFDMG/cBYvAG+2cfePj8hRcD4wdL+DiK5aM0JKnOHiuAEi6AItuQ9SMN6RTNqyBL
	 exXrnVjm1ViPv7p5oJxDI4sK02+F3Y01irTt/Tepqvkj5J+SU27lt5Mt6hc2u9Mik/
	 /avhc4jhZhMlmwh0PvmJQej12tIGKRGiLVn/+gFrgDy8DxbHibmlPmidjyd6VhDgr5
	 2BO+OU4Uru2OQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Thu, 02 Apr 2026 16:27:38 +0200
Subject: [PATCH v4 4/4] arm64: tegra: Add PCI controllers on Tegra264
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-tegra264-pcie-v4-4-21e2e19987e8@nvidia.com>
References: <20260402-tegra264-pcie-v4-0-21e2e19987e8@nvidia.com>
In-Reply-To: <20260402-tegra264-pcie-v4-0-21e2e19987e8@nvidia.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=13747; i=treding@nvidia.com;
 h=from:subject:message-id; bh=SwZu0xB6YZN1HWZcXx7U3cnqXXmQ8x5xiYLkorAgNhA=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBpznzo0esIf0137W0PrUfR2DWoc9RKd6WxH4QWU
 f5XqIWskFyJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCac586AAKCRDdI6zXfz6z
 oZGpD/9eJqcLW33/a4/u/eh01FMyrDhy6zijl5Y4Y7kgSZ54hK8RTmdAeHhn8GjGfxHIVx8he/3
 f6GMz0uUSu/Wah0nj/CkMm9Bhux4oX5mBNrscnZPWumaVGPcPrAmcST77JPtF3Rqm5UNBE0QMuH
 SULG03M7dmMScC1R9Oquo7Tjxi4Iiu3B3v7xIIgG/Ss/Dx1wKPw58Wh4YFPUjBKNayIXsC/F7I+
 fb8E8DyJfdZTMqxVlYNg4HpjIDQGgRBfVqFmr/tMrVJcYzwndZ9e2FdRrf3iGfnR9uRdrxVZVPQ
 Y8XLG/rITu7YW1BDcv+Bkw2webram3gmn0v6QdlehuX4gaPSH3gYCNpGq8pPIK9zaUrZocrMYyu
 zHdRLEf9ojpx2MRcnP8Vx8UNq4QFp+5eo9c61jDlipner9O8JhaDsPmhCmn9n+RMpiIpKY5TH+q
 HfC1qlpIYsAlOCKkwqpYxRMnLXjWoO0mR7NDB7zrkmziYIXxUEIhRhx2jHews403D0mprJfLSAt
 kSbXiLT96qWjhe8DEsJjrglmWoBujxHhAFDo1Kw1GSexubEvhiOYbhTvlS1CbLiELlpix9LpUaW
 UAVMj5Az8m7TelGMkb+ZiBtfmCS1Z+Ufen9bDcUWCcb+T7KQhiEh7PrkmMcBSXSwt2J2DB+fviz
 ijO7h7LIAmJ5LFw==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
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

A total of six PCIe controllers can be found on Tegra264. One of them is
used internally for the integrated GPU while the other five can go to a
variety of connectors like full PCIe slots or M.2.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- revert ECAM "reg" entry order

Changes in v2:
- order ECAM "reg" entry before others
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 248 +++++++++++++++++++++++++++----
 1 file changed, 221 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 7644a41d5f72..1bf5a2368afe 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -32,7 +32,7 @@ bus@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-		ranges = <0x00 0x00000000 0x00 0x00000000 0x01 0x00000000>;
+		ranges = <0x00 0x00000000 0x00 0x00000000 0x00 0x20000000>; /* MMIO (512 MiB) */
 
 		misc@100000 {
 			compatible = "nvidia,tegra234-misc";
@@ -3356,9 +3356,10 @@ bus@8100000000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-		ranges = <0x00 0x00000000 0x81 0x00000000 0x01 0x00000000>, /* MMIO */
-			 <0x01 0x00000000 0x00 0x20000000 0x00 0x40000000>, /* non-prefetchable memory (32-bit) */
-			 <0x02 0x00000000 0xd0 0x00000000 0x08 0x80000000>; /* ECAM, prefetchable memory, I/O */
+		ranges = <0x00 0x00000000 0x81 0x00000000 0x00 0x20000000>, /* MMIO (512 MiB) */
+			 <0x00 0x20000000 0x00 0x20000000 0x00 0x20000000>, /* non-prefetchable memory (32-bit, 512 MiB) */
+			 <0x00 0x40000000 0x81 0x40000000 0x00 0x20000000>, /* MMIO (512 MiB) */
+			 <0xa8 0x80000000 0xa8 0x80000000 0x57 0x80000000>; /* I/O, ECAM, prefetchable memory (64-bit) */
 
 		smmu1: iommu@5000000 {
 			compatible = "nvidia,tegra264-smmu", "arm,smmu-v3";
@@ -3402,23 +3403,23 @@ cmdqv2: cmdqv@6200000 {
 
 		mc: memory-controller@8020000 {
 			compatible = "nvidia,tegra264-mc";
-			reg = <0x00 0x8020000 0x0 0x20000>, /* MC broadcast */
-			      <0x00 0x8040000 0x0 0x20000>, /* MC  0 */
-			      <0x00 0x8060000 0x0 0x20000>, /* MC  1 */
-			      <0x00 0x8080000 0x0 0x20000>, /* MC  2 */
-			      <0x00 0x80a0000 0x0 0x20000>, /* MC  3 */
-			      <0x00 0x80c0000 0x0 0x20000>, /* MC  4 */
-			      <0x00 0x80e0000 0x0 0x20000>, /* MC  5 */
-			      <0x00 0x8100000 0x0 0x20000>, /* MC  6 */
-			      <0x00 0x8120000 0x0 0x20000>, /* MC  7 */
-			      <0x00 0x8140000 0x0 0x20000>, /* MC  8 */
-			      <0x00 0x8160000 0x0 0x20000>, /* MC  9 */
-			      <0x00 0x8180000 0x0 0x20000>, /* MC 10 */
-			      <0x00 0x81a0000 0x0 0x20000>, /* MC 11 */
-			      <0x00 0x81c0000 0x0 0x20000>, /* MC 12 */
-			      <0x00 0x81e0000 0x0 0x20000>, /* MC 13 */
-			      <0x00 0x8200000 0x0 0x20000>, /* MC 14 */
-			      <0x00 0x8220000 0x0 0x20000>; /* MC 15 */
+			reg = <0x000 0x8020000 0x0 0x20000>, /* MC broadcast */
+			      <0x000 0x8040000 0x0 0x20000>, /* MC  0 */
+			      <0x000 0x8060000 0x0 0x20000>, /* MC  1 */
+			      <0x000 0x8080000 0x0 0x20000>, /* MC  2 */
+			      <0x000 0x80a0000 0x0 0x20000>, /* MC  3 */
+			      <0x000 0x80c0000 0x0 0x20000>, /* MC  4 */
+			      <0x000 0x80e0000 0x0 0x20000>, /* MC  5 */
+			      <0x000 0x8100000 0x0 0x20000>, /* MC  6 */
+			      <0x000 0x8120000 0x0 0x20000>, /* MC  7 */
+			      <0x000 0x8140000 0x0 0x20000>, /* MC  8 */
+			      <0x000 0x8160000 0x0 0x20000>, /* MC  9 */
+			      <0x000 0x8180000 0x0 0x20000>, /* MC 10 */
+			      <0x000 0x81a0000 0x0 0x20000>, /* MC 11 */
+			      <0x000 0x81c0000 0x0 0x20000>, /* MC 12 */
+			      <0x000 0x81e0000 0x0 0x20000>, /* MC 13 */
+			      <0x000 0x8200000 0x0 0x20000>, /* MC 14 */
+			      <0x000 0x8220000 0x0 0x20000>; /* MC 15 */
 			reg-names = "broadcast", "ch0", "ch1", "ch2", "ch3",
 				    "ch4", "ch5", "ch6", "ch7", "ch8", "ch9",
 				    "ch10", "ch11", "ch12", "ch13", "ch14",
@@ -3437,12 +3438,12 @@ mc: memory-controller@8020000 {
 			#size-cells = <2>;
 
 			/* limit the DMA range for memory clients to [39:0] */
-			dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
+			dma-ranges = <0x000 0x0 0x000 0x0 0x100 0x0>;
 
 			emc: external-memory-controller@8800000 {
 				compatible = "nvidia,tegra264-emc";
-				reg = <0x00 0x8800000 0x0 0x20000>,
-				      <0x00 0x8890000 0x0 0x20000>;
+				reg = <0x000 0x8800000 0x0 0x20000>,
+				      <0x000 0x8890000 0x0 0x20000>;
 				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA264_CLK_EMC>,
 					 <&bpmp TEGRA264_CLK_DBB_UPHY0>;
@@ -3493,6 +3494,38 @@ cmdqv4: cmdqv@b200000 {
 			status = "disabled";
 		};
 
+		pci@c000000 {
+			compatible = "nvidia,tegra264-pcie";
+			reg = <0x00 0x0c000000 0x0 0x00004000>,
+			      <0x00 0x0c004000 0x0 0x00001000>,
+			      <0x00 0x0c005000 0x0 0x00001000>,
+			      <0xd0 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "ecam";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <0x00>;
+			#interrupt-cells = <0x1>;
+
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 155 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 156 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 157 IRQ_TYPE_LEVEL_HIGH>,
+					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 158 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommu-map = <0x0 &smmu2 0x10000 0x10000>;
+			msi-map = <0x0 &its 0x210000 0x10000>;
+			dma-coherent;
+
+			ranges = <0x81000000 0x00 0x84000000 0xd0 0x84000000 0x00 0x00200000>, /* I/O */
+				 <0x82000000 0x00 0x20000000 0x00 0x20000000 0x00 0x08000000>, /* non-prefetchable memory (128 MiB) */
+				 <0xc3000000 0xd0 0xc0000000 0xd0 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
+			bus-range = <0x0 0xff>;
+
+			nvidia,bpmp = <&bpmp 0>;
+			status = "disabled";
+		};
+
 		i2c14: i2c@c410000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c410000 0x0 0x10000>;
@@ -3720,7 +3753,7 @@ bus@8800000000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-		ranges = <0x00 0x00000000 0x88 0x00000000 0x01 0x00000000>;
+		ranges = <0x00 0x00000000 0x88 0x00000000 0x00 0x20000000>; /* MMIO (512 MiB) */
 
 		smmu3: iommu@6000000 {
 			compatible = "nvidia,tegra264-smmu", "arm,smmu-v3";
@@ -3765,8 +3798,169 @@ bus@a800000000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-		ranges = <0x00 0x00000000 0xa8 0x00000000 0x40 0x00000000>, /* MMIO, ECAM, prefetchable memory, I/O */
-			 <0x80 0x00000000 0x00 0x20000000 0x00 0x40000000>; /* non-prefetchable memory (32-bit) */
+		ranges = <0x00 0x00000000 0xa8 0x00000000 0x00 0x20000000>, /* MMIO (512 MiB) */
+			 <0x00 0x20000000 0x00 0x20000000 0x00 0x60000000>, /* non-prefetchable memory (32-bit, 1536 GiB) */
+			 <0xa8 0x80000000 0xa8 0x80000000 0x57 0x80000000>; /* I/O, ECAM, prefetchable memory (64-bit) */
+
+		pci@8400000 {
+			compatible = "nvidia,tegra264-pcie";
+			reg = <0x00 0x08400000 0x0 0x00004000>,
+			      <0x00 0x08404000 0x0 0x00001000>,
+			      <0x00 0x08405000 0x0 0x00001000>,
+			      <0x00 0x08410000 0x0 0x00010000>,
+			      <0xa8 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <0x01>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 908 IRQ_TYPE_LEVEL_HIGH>, /* INTA */
+					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 909 IRQ_TYPE_LEVEL_HIGH>, /* INTB */
+					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 910 IRQ_TYPE_LEVEL_HIGH>, /* INTC */
+					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 911 IRQ_TYPE_LEVEL_HIGH>; /* INTD */
+
+			iommu-map = <0x0 &smmu1 0x10000 0x10000>;
+			msi-map = <0x0 &its 0x110000 0x10000>;
+			dma-coherent;
+
+			ranges = <0x81000000 0x00 0x84000000 0xa8 0x84000000 0x00 0x00200000>, /* I/O */
+				 <0x82000000 0x00 0x28000000 0x00 0x28000000 0x00 0x08000000>, /* non-prefetchable memory */
+				 <0xc3000000 0xa8 0xc0000000 0xa8 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
+			bus-range = <0x00 0xff>;
+
+			nvidia,bpmp = <&bpmp 1>;
+			status = "disabled";
+		};
+
+		pci@8420000 {
+			compatible = "nvidia,tegra264-pcie";
+			reg = <0x00 0x08420000 0x0 0x00004000>,
+			      <0x00 0x08424000 0x0 0x00001000>,
+			      <0x00 0x08425000 0x0 0x00001000>,
+			      <0x00 0x08430000 0x0 0x00010000>,
+			      <0xb0 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <0x02>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 917 IRQ_TYPE_LEVEL_HIGH>, /* INTA */
+					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 918 IRQ_TYPE_LEVEL_HIGH>, /* INTB */
+					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 919 IRQ_TYPE_LEVEL_HIGH>, /* INTC */
+					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 920 IRQ_TYPE_LEVEL_HIGH>; /* INTD */
+
+			iommu-map = <0x0 &smmu1 0x20000 0x10000>;
+			msi-map = <0x0 &its 0x120000 0x10000>;
+			dma-coherent;
+
+			ranges = <0x81000000 0x00 0x84000000 0xb0 0x84000000 0x00 0x00200000>, /* I/O */
+				 <0x82000000 0x00 0x30000000 0x00 0x30000000 0x00 0x08000000>, /* non-prefetchable memory */
+				 <0xc3000000 0xb0 0xc0000000 0xb0 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
+			bus-range = <0x00 0xff>;
+
+			nvidia,bpmp = <&bpmp 2>;
+			status = "disabled";
+		};
+
+		pci@8440000 {
+			compatible = "nvidia,tegra264-pcie";
+			reg = <0x00 0x08440000 0x0 0x00004000>,
+			      <0x00 0x08444000 0x0 0x00001000>,
+			      <0x00 0x08445000 0x0 0x00001000>,
+			      <0x00 0x08450000 0x0 0x00010000>,
+			      <0xb8 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <0x03>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 926 IRQ_TYPE_LEVEL_HIGH>, /* INTA */
+					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 927 IRQ_TYPE_LEVEL_HIGH>, /* INTB */
+					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 928 IRQ_TYPE_LEVEL_HIGH>, /* INTC */
+					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 929 IRQ_TYPE_LEVEL_HIGH>; /* INTD */
+
+			iommu-map = <0x0 &smmu1 0x30000 0x10000>;
+			msi-map = <0x0 &its 0x130000 0x10000>;
+			dma-coherent;
+
+			ranges = <0x81000000 0x00 0x84000000 0xb8 0x84000000 0x00 0x00200000>, /* I/O */
+				 <0x82000000 0x00 0x38000000 0x00 0x38000000 0x00 0x08000000>, /* non-prefetchable memory */
+				 <0xc3000000 0xb8 0xc0000000 0xb8 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
+			bus-range = <0x00 0xff>;
+
+			nvidia,bpmp = <&bpmp 3>;
+			status = "disabled";
+		};
+
+		pci@8460000 {
+			compatible = "nvidia,tegra264-pcie";
+			reg = <0x00 0x08460000 0x0 0x00004000>,
+			      <0x00 0x08464000 0x0 0x00001000>,
+			      <0x00 0x08465000 0x0 0x00001000>,
+			      <0x00 0x08470000 0x0 0x00010000>,
+			      <0xc0 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <0x04>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 935 IRQ_TYPE_LEVEL_HIGH>, /* INTA */
+					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 936 IRQ_TYPE_LEVEL_HIGH>, /* INTB */
+					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 937 IRQ_TYPE_LEVEL_HIGH>, /* INTC */
+					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 938 IRQ_TYPE_LEVEL_HIGH>; /* INTD */
+
+			iommu-map = <0x0 &smmu1 0x40000 0x10000>;
+			msi-map = <0x0 &its 0x140000 0x10000>;
+			dma-coherent;
+
+			ranges = <0x81000000 0x00 0x84000000 0xc0 0x84000000 0x00 0x00200000>, /* I/O */
+				 <0x82000000 0x00 0x40000000 0x00 0x40000000 0x00 0x08000000>, /* non-prefetchable memory */
+				 <0xc3000000 0xc0 0xc0000000 0xc0 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
+			bus-range = <0x00 0xff>;
+
+			nvidia,bpmp = <&bpmp 4>;
+			status = "disabled";
+		};
+
+		pci@8480000 {
+			compatible = "nvidia,tegra264-pcie";
+			reg = <0x00 0x08480000 0x0 0x00004000>,
+			      <0x00 0x08484000 0x0 0x00001000>,
+			      <0x00 0x08485000 0x0 0x00001000>,
+			      <0x00 0x08490000 0x0 0x00010000>,
+			      <0xc8 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <0x05>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 944 IRQ_TYPE_LEVEL_HIGH>, /* INTA */
+					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 945 IRQ_TYPE_LEVEL_HIGH>, /* INTB */
+					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 946 IRQ_TYPE_LEVEL_HIGH>, /* INTC */
+					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 947 IRQ_TYPE_LEVEL_HIGH>; /* INTD */
+
+			iommu-map = <0x0 &smmu1 0x50000 0x10000>;
+			msi-map = <0x0 &its 0x150000 0x10000>;
+			dma-coherent;
+
+			ranges = <0x81000000 0x00 0x84000000 0xc8 0x84000000 0x00 0x00200000>, /* I/O */
+				 <0x82000000 0x00 0x48000000 0x00 0x48000000 0x00 0x08000000>, /* non-prefetchable memory */
+				 <0xc3000000 0xc8 0xc0000000 0xc8 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
+			bus-range = <0x00 0xff>;
+
+			nvidia,bpmp = <&bpmp 5>;
+			status = "disabled";
+		};
 	};
 
 	cpus {

-- 
2.52.0


