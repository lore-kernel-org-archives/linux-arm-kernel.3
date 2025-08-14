Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE391CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 04:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSkdw64CntSwfouYp0vv8j2CxJaW7ckqGcXdVod6U8A=; b=cuOk4P7fpZvj8rwkAav0vWVL7D
	r/1+QucRT/FeufZekitwiYI51McKogDDr6/foqjmbTRQxM16+TA9vJh1kg8SKrhGoa6KBk8P2L3B5
	Dtgw7rfiPWQ04dRsoOxBno/TasvrEswfvqkPdRgyHa4PeE+nlhkCuBqbRxfP3oin4KLw8POz5XBCc
	enYMfyp+D7cTzsUQW7kdJ7acletMmjc9SKBLmq35YnTcAe+VV1pzafStygjtOhzNfvyEAku0I9ulE
	NNNuLYU5Qz46UARcEayv1Q01Cy5dxcNccx1B8Nsml9i0Aw1EcGFaRYJoITzSE7tFmPOJ3AaxPMjOI
	PPYmBn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrpJ-00000006V7u-0Iyi;
	Mon, 18 Aug 2025 04:50:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrd7-00000006TdJ-1Eo0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GSkdw64CntSwfouYp0vv8j2CxJaW7ckqGcXdVod6U8A=; b=W/KcdM8VOTKBpVYdj69Q6IanPU
	vJJdT3yFzU/g+DyLj3lO+sfzwXFj/NgY8CyHB3/Znv2Zjy4mlHAtfKyP+xODe+DOjciDEIDYSxhGS
	xyRP2DhxaiqNSngGLUMROgyzgI96OFXzIkBaUbSZT4IgsV9QN2fC7Ra4gDyacee3+unNaE8j49Zbu
	MmlLSO0qCenukjP+MMvlmlpbgK8bZ67kiWMlm7OBhE14yb0RUJOfv1VMSiHiHumNXJ1uge68N2LhP
	3rs23Yf44VQAByrZ3E9/g7+CRUVaWDOXsUsNasu3Hqy1wnFcK8aPqn7HtB5Z5irXkIFId/VzQiZ7z
	fYh6V5Uw==;
Received: from mailout1.samsung.com ([203.254.224.24])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrd2-0000000HEzS-0auo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:37:55 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250818043746epoutp01dce96be3b8a66468513e22c15293a3f7~cwo1H42G_0653606536epoutp01V
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:37:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250818043746epoutp01dce96be3b8a66468513e22c15293a3f7~cwo1H42G_0653606536epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491866;
	bh=GSkdw64CntSwfouYp0vv8j2CxJaW7ckqGcXdVod6U8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q0iR8iwYce8fBOG17084t9hJ58rI24N8XhqsovM5aeEhrKl48QvMmknz2bYsKyavE
	 CXsRNQCzvpO9YqAcf+DTQ7MET8yAGrj4glX5i3C8V4jAUJbTcXyFSFyF7WR85PVAn1
	 n79h0R2QmDXSOSIogM169FtTuTjZPxm7Ss1JfXxM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250818043745epcas5p3ff89beef59ab75859d7e613b32ba3a25~cwozm5PwJ0972809728epcas5p38;
	Mon, 18 Aug 2025 04:37:45 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c50Lw1cvdz6B9m7; Mon, 18 Aug
	2025 04:37:44 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5~bp3l3t3B70487304873epcas5p2e;
	Thu, 14 Aug 2025 14:10:19 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141015epsmtip213875c3a71a7740663108afc82388f23~bp3iBPqAy1817818178epsmtip2l;
	Thu, 14 Aug 2025 14:10:15 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Date: Thu, 14 Aug 2025 19:39:35 +0530
Message-ID: <20250814140943.22531-5-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_053754_260928_58A781FA 
X-CRM114-Status: GOOD (  13.61  )
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

There is a csi dma and csis interface that bundles together to allow
csi2 capture.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts |  96 +++++
 arch/arm64/boot/dts/tesla/fsd.dtsi    | 552 ++++++++++++++++++++++++++
 2 files changed, 648 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 9ff22e1c8723..dcc9a138cdb9 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -130,3 +130,99 @@ &serial_0 {
 &ufs {
 	status = "okay";
 };
+
+&mipicsis0 {
+	status = "okay";
+};
+
+&mipicsis1 {
+	status = "okay";
+};
+
+&mipicsis2 {
+	status = "okay";
+};
+
+&mipicsis3 {
+	status = "okay";
+};
+
+&mipicsis4 {
+	status = "okay";
+};
+
+&mipicsis5 {
+	status = "okay";
+};
+
+&mipicsis6 {
+	status = "okay";
+};
+
+&mipicsis7 {
+	status = "okay";
+};
+
+&mipicsis8 {
+	status = "okay";
+};
+
+&mipicsis9 {
+	status = "okay";
+};
+
+&mipicsis10 {
+	status = "okay";
+};
+
+&mipicsis11 {
+	status = "okay";
+};
+
+&csis0 {
+	status = "okay";
+};
+
+&csis1 {
+	status = "okay";
+};
+
+&csis2 {
+	status = "okay";
+};
+
+&csis3 {
+	status = "okay";
+};
+
+&csis4 {
+	status = "okay";
+};
+
+&csis5 {
+	status = "okay";
+};
+
+&csis6 {
+	status = "okay";
+};
+
+&csis7 {
+	status = "okay";
+};
+
+&csis8 {
+	status = "okay";
+};
+
+&csis9 {
+	status = "okay";
+};
+
+&csis10 {
+	status = "okay";
+};
+
+&csis11 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index a5ebb3f9b18f..a83503e9c502 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -493,6 +493,558 @@ clock_mfc: clock-controller@12810000 {
 			clock-names = "fin_pll";
 		};
 
+		mipicsis0: mipi-csis@12640000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12640000 0x0 0x124>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_0: endpoint {
+					remote-endpoint = <&mipi_csis_0_out>;
+				};
+			};
+		};
+
+		mipicsis1: mipi-csis@12650000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12650000 0x0 0x124>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_1: endpoint {
+					remote-endpoint = <&mipi_csis_1_out>;
+				};
+			};
+		};
+
+		mipicsis2: mipi-csis@12660000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12660000 0x0 0x124>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_2: endpoint {
+					remote-endpoint = <&mipi_csis_2_out>;
+				};
+			};
+		};
+
+		mipicsis3: mipi-csis@12670000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12670000 0x0 0x124>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_3: endpoint {
+					remote-endpoint = <&mipi_csis_3_out>;
+				};
+			};
+		};
+
+		mipicsis4: mipi-csis@12680000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12680000 0x0 0x124>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_4: endpoint {
+					remote-endpoint = <&mipi_csis_4_out>;
+				};
+			};
+		};
+
+		mipicsis5: mipi-csis@12690000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12690000 0x0 0x124>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_5: endpoint {
+					remote-endpoint = <&mipi_csis_5_out>;
+				};
+			};
+		};
+
+		mipicsis6: mipi-csis@126a0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126a0000 0x0 0x124>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_6: endpoint {
+					remote-endpoint = <&mipi_csis_6_out>;
+				};
+			};
+		};
+
+		mipicsis7: mipi-csis@126b0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126b0000 0x0 0x124>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_7: endpoint {
+					remote-endpoint = <&mipi_csis_7_out>;
+				};
+			};
+		};
+
+		mipicsis8: mipi-csis@126c0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126c0000 0x0 0x124>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_8: endpoint {
+					remote-endpoint = <&mipi_csis_8_out>;
+				};
+			};
+		};
+
+		mipicsis9: mipi-csis@126d0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126d0000 0x0 0x124>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_9: endpoint {
+					remote-endpoint = <&mipi_csis_9_out>;
+				};
+			};
+		};
+
+		mipicsis10: mipi-csis@126e0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126e0000 0x0 0x124>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_10: endpoint {
+					remote-endpoint = <&mipi_csis_10_out>;
+				};
+			};
+		};
+
+		mipicsis11: mipi-csis@126f0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126f0000 0x0 0x124>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
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
+			status = "disabled";
+
+			port {
+				csis_in_11: endpoint {
+					remote-endpoint = <&mipi_csis_11_out>;
+				};
+			};
+		};
+
 		clock_peric: clock-controller@14010000 {
 			compatible = "tesla,fsd-clock-peric";
 			reg = <0x0 0x14010000 0x0 0x3000>;
-- 
2.49.0


