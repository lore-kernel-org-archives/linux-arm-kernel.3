Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3665BCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=pImoRDS3pa3G80rNm7NY0vzMH0ovbewcwmQ3GzyNIJk=; b=DOK+D8pZD4XnZnHVJhMQhH9i48
	lSzPZgR25i9Ep4iLZO3+wQxfxPWFJhWEQeS1AhJxzzX4/vQydlsh7m/FAqtTqOmaCwhwuGhb0DeUv
	WuI/1e7Z1ym6QQn6Y/PEOyaOd/X7tHoXFJaSIWidP6gak3pwx7UuBR3R/gr9HV9rsGRwuKxi4ajLF
	u4fMoFcsd1Zo4m97rB1SPLjlAfYViwZUoorW7o0vF2Bgcz/JkdJzi7zLuNJYhtVgAIs4QbV4yq8rS
	7oa0wDLuH3rbwdF+Tm4fmmXswl8FCYRo09gj7iPiwTYuOyhxcJfns8gLkJkoPlKsifC/uzXwsTfcj
	+yAGmhpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbNh-00000001RNP-12oq;
	Thu, 28 Aug 2025 12:05:29 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYAa-00000000pSi-2iTo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 08:39:46 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250828083938epoutp0261d06eda63f59e6b63f52e95601d266d~f4Y2wjREW1818118181epoutp02L
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 08:39:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250828083938epoutp0261d06eda63f59e6b63f52e95601d266d~f4Y2wjREW1818118181epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756370378;
	bh=pImoRDS3pa3G80rNm7NY0vzMH0ovbewcwmQ3GzyNIJk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OD0KBnfJWEdjon3M/fuPM/DdXCaJ/RsSb56XaTzJL6qJOINn+DfQ31sAa1LY9ce9V
	 O7pdBh4bzTwUzbqL+v3K89E6TnR7vyroGeyakjhUWv0JjyCbEFnTtK6uCHQoCCFWRv
	 yb6vQh2YG+4VeEAytQXgL2s6OmIXaM9/cbO7BhNs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250828083937epcas5p2cfdc1ab63546f02b4b6ae3fe2022af4f~f4Y2WLuWH0455804558epcas5p2L;
	Thu, 28 Aug 2025 08:39:37 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cCFFN6t6Qz6B9mC; Thu, 28 Aug
	2025 08:39:36 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250828083936epcas5p3d2e5ec402bd00dae08c11d8cc7246896~f4Y0o3laA0819308193epcas5p3p;
	Thu, 28 Aug 2025 08:39:36 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250828083934epsmtip1b1a947a422fa0d8fe1705a2a1c1dfec6~f4YzAy47L3118031180epsmtip1q;
	Thu, 28 Aug 2025 08:39:34 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: alim.akhtar@samsung.com, linux-fsd@tesla.com, krzk@kernel.org,
	robh@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com, shradha.t@samsung.com,
	Inbaraj E <inbaraj.e@samsung.com>
Subject: [v3] arm64: dts: fsd: Add CSIS nodes
Date: Thu, 28 Aug 2025 14:09:26 +0530
Message-ID: <20250828083926.16849-1-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828083936epcas5p3d2e5ec402bd00dae08c11d8cc7246896
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828083936epcas5p3d2e5ec402bd00dae08c11d8cc7246896
References: <CGME20250828083936epcas5p3d2e5ec402bd00dae08c11d8cc7246896@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_013945_343913_673B339A 
X-CRM114-Status: GOOD (  10.56  )
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

The Tesla FSD SoC CSIS IP bundles MIPI CSI-2 link controller and video
capture interface. Add nodes describing the MIPI CSI-2 link controller
and video capture interface.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---

Changes since v2:
- Changed generic node name
- Fixed node ordering

Here is patch link for v2:
https://lore.kernel.org/linux-media/20250814140943.22531-1-inbaraj.e@samsung.com/

This patch is dependent on below patchset
https://lore.kernel.org/linux-media/20250822002734.23516-1-laurent.pinchart@ideasonboard.com/T/#t

 arch/arm64/boot/dts/tesla/fsd.dtsi | 540 +++++++++++++++++++++++++++++
 1 file changed, 540 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index a5ebb3f9b18f..22afcf5a5dda 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -485,6 +485,546 @@ sysreg_cam: system-controller@12630000 {
 			reg = <0x0 0x12630000 0x0 0x500>;
 		};
 
+		mipicsi0: csi@12640000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12640000 0x0 0x124>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_0_out: endpoint {
+						remote-endpoint = <&csis_in_0>;
+					};
+				};
+			};
+		};
+
+		csis0: csis@12641000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12641000 0x0 0x44c>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_0: endpoint {
+					remote-endpoint = <&mipi_csis_0_out>;
+				};
+			};
+		};
+
+		mipicsi1: csi@12650000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12650000 0x0 0x124>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_1_out: endpoint {
+						remote-endpoint = <&csis_in_1>;
+					};
+				};
+			};
+		};
+
+		csis1: csis@12651000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12651000 0x0 0x44c>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_1_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_1: endpoint {
+					remote-endpoint = <&mipi_csis_1_out>;
+				};
+			};
+		};
+
+		mipicsi2: csi@12660000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12660000 0x0 0x124>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_2_out: endpoint {
+						remote-endpoint = <&csis_in_2>;
+					};
+				};
+			};
+		};
+
+		csis2: csis@12661000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12661000 0x0 0x44c>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_2_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_2: endpoint {
+					remote-endpoint = <&mipi_csis_2_out>;
+				};
+			};
+		};
+
+		mipicsi3: csi@12670000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12670000 0x0 0x124>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_3_out: endpoint {
+						remote-endpoint = <&csis_in_3>;
+					};
+				};
+			};
+		};
+
+		csis3: csis@12671000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12671000 0x0 0x44c>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_3_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_3: endpoint {
+					remote-endpoint = <&mipi_csis_3_out>;
+				};
+			};
+		};
+
+		mipicsi4: csi@12680000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12680000 0x0 0x124>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_4_out: endpoint {
+						remote-endpoint = <&csis_in_4>;
+					};
+				};
+			};
+		};
+
+		csis4: csis@12681000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12681000 0x0 0x44c>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_0_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_4: endpoint {
+					remote-endpoint = <&mipi_csis_4_out>;
+				};
+			};
+		};
+
+		mipicsi5: csi@12690000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12690000 0x0 0x124>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_5_out: endpoint {
+						remote-endpoint = <&csis_in_5>;
+					};
+				};
+			};
+		};
+
+		csis5: csis@12691000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12691000 0x0 0x44c>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_1_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_5: endpoint {
+					remote-endpoint = <&mipi_csis_5_out>;
+				};
+			};
+		};
+
+		mipicsi6: csi@126a0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126a0000 0x0 0x124>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_6_out: endpoint {
+						remote-endpoint = <&csis_in_6>;
+					};
+				};
+			};
+		};
+
+		csis6: csis@126a1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126a1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_2_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_6: endpoint {
+					remote-endpoint = <&mipi_csis_6_out>;
+				};
+			};
+		};
+
+		mipicsi7: csi@126b0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126b0000 0x0 0x124>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_7_out: endpoint {
+						remote-endpoint = <&csis_in_7>;
+					};
+				};
+			};
+		};
+
+		csis7: csis@126b1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126b1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_3_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_7: endpoint {
+					remote-endpoint = <&mipi_csis_7_out>;
+				};
+			};
+		};
+
+		mipicsi8: csi@126c0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126c0000 0x0 0x124>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_8_out: endpoint {
+						remote-endpoint = <&csis_in_8>;
+					};
+				};
+			};
+		};
+
+		csis8: csis@126c1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126c1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_0_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_8: endpoint {
+					remote-endpoint = <&mipi_csis_8_out>;
+				};
+			};
+		};
+
+		mipicsi9: csi@126d0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126d0000 0x0 0x124>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_9_out: endpoint {
+						remote-endpoint = <&csis_in_9>;
+					};
+				};
+			};
+		};
+
+		csis9: csis@126d1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126d1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_1_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_9: endpoint {
+					remote-endpoint = <&mipi_csis_9_out>;
+				};
+			};
+		};
+
+		mipicsi10: csi@126e0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126e0000 0x0 0x124>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_10_out: endpoint {
+						remote-endpoint = <&csis_in_10>;
+					};
+				};
+			};
+		};
+
+		csis10: csis@126e1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126e1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_2_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_10: endpoint {
+					remote-endpoint = <&mipi_csis_10_out>;
+				};
+			};
+		};
+
+		mipicsi11: csi@126f0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126f0000 0x0 0x124>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_11_out: endpoint {
+						remote-endpoint = <&csis_in_11>;
+					};
+				};
+			};
+		};
+
+		csis11: csis@126f1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126f1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_3_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_11: endpoint {
+					remote-endpoint = <&mipi_csis_11_out>;
+				};
+			};
+		};
+
 		clock_mfc: clock-controller@12810000 {
 			compatible = "tesla,fsd-clock-mfc";
 			reg = <0x0 0x12810000 0x0 0x3000>;
-- 
2.49.0


