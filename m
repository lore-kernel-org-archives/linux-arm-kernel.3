Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CDCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9G7ck1RRq3L4uiItpCj2akoXxNfOqpcJPIc28Hmw54I=; b=hmGJ9gD+FBgYTO727wandt8Qjo
	udN2GRi9rMxWfV+ce7EaoGvWKaqoqGZNYOKMIT+VPYT4wggxYEc0m/H2dtcsa6YNRcG9fpkzo+x6N
	9iGiniz2N+PRDadVocLdsoeBMaC1FGXbnSZOBOqn4GuU/43TIe9SJjzJ9oOf3lgychBg5ELUHCaQM
	qehCskFYlpF/jUo79VUksvX5xzT/Us16Zyy7VQjIiQX3YOmwGXcXA1QmBHB1ZlJNDVeasGamYtWGo
	b5OHdeGEJ1Cpt/rN7EKqZAVxY7dP8DHdyGafaWiiLw4E4C70HyqxU09inJveQvha6cFV05V97/qFO
	hezd6itA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGbt-00000000OYR-1GLy;
	Thu, 18 Sep 2025 15:31:49 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGbp-00000000OVF-2ktR;
	Thu, 18 Sep 2025 15:31:47 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F372120E31;
	Thu, 18 Sep 2025 17:31:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EP9vSBDod2Au; Thu, 18 Sep 2025 17:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1758209503; bh=7Oock8b8hlmLqfE0k+5g/Ha+kXjaqiFUV09Vepcpo4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mk+VgQiIXCA9bcEjRzqyyb/CX5Gu0IUqO8JKphsCbXb3DRV5M0pg9tB1LNG6NKsAd
	 Xy4OUm7xHjqDgEEOjy32kZUcG67qhduvLkzj+Dg2f1cllP+B6e4U/5iBiBWhyBjEkR
	 4O4ZRzEewF7yD+zovPUPecdvbG//qGWx6keXyFSlxwbtf5f+8j9Sg7sR+dttkLfq9h
	 3QgEuQAZQ04aUX1tdjOfr83ephV70PcXyYiNtp+LzLcuaPcMgdxtb1G0TyL7Y4ZD+T
	 +wxIg8OB52XK6qT2YaiWhg4pgE67N9YOb+fgPbW3jW2Wz31fO5k/xCRpTLktRIop/i
	 UcYE/GzIKe5Ig==
From: Yao Zi <ziyao@disroot.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Add PCIe Gen2x1 controller for RK3528
Date: Thu, 18 Sep 2025 15:30:56 +0000
Message-ID: <20250918153057.56023-3-ziyao@disroot.org>
In-Reply-To: <20250918153057.56023-1-ziyao@disroot.org>
References: <20250918153057.56023-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083145_835209_AFB4E2F0 
X-CRM114-Status: GOOD (  10.58  )
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

Describes the PCIe Gen2x1 controller integrated in RK3528 SoC. The SoC
doesn't provide a separate MSI controller, thus the one integrated in
designware PCIe IP must be used.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 56 +++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index d5f8f7b9bf01..d402f2828814 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/clock/rockchip,rk3528-cru.h>
 #include <dt-bindings/power/rockchip,rk3528-power.h>
@@ -278,10 +279,63 @@ gmac0_clk: clock-gmac50m {
 
 	soc {
 		compatible = "simple-bus";
-		ranges = <0x0 0xfe000000 0x0 0xfe000000 0x0 0x2000000>;
+		ranges = <0x0 0xfc000000 0x0 0xfc000000 0x0 0x44000000>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		pcie: pcie@fe000000 {
+			compatible = "rockchip,rk3528-pcie",
+				     "rockchip,rk3568-pcie";
+			reg = <0x0 0xfe000000 0x0 0x400000>,
+			      <0x0 0xfe4f0000 0x0 0x010000>,
+			      <0x0 0xfc000000 0x0 0x100000>;
+			reg-names = "dbi", "apb", "config";
+			bus-range = <0x0 0xff>;
+			clocks = <&cru ACLK_PCIE>, <&cru HCLK_PCIE_SLV>,
+				 <&cru HCLK_PCIE_DBI>, <&cru PCLK_PCIE>,
+				 <&cru CLK_PCIE_AUX>;
+			clock-names = "aclk_mst", "aclk_slv",
+				      "aclk_dbi", "pclk",
+				      "aux";
+			device_type = "pci";
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "sys", "pmc", "msg", "legacy", "err",
+					  "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc 0>,
+					<0 0 0 2 &pcie_intc 1>,
+					<0 0 0 3 &pcie_intc 2>,
+					<0 0 0 4 &pcie_intc 3>;
+			linux,pci-domain = <0>;
+			max-link-speed = <2>;
+			num-lanes = <1>;
+			phys = <&combphy PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+			power-domains = <&power RK3528_PD_VPU>;
+			ranges = <0x01000000 0x0 0xfc100000 0x0 0xfc100000 0x0 0x00100000>,
+				 <0x02000000 0x0 0xfc200000 0x0 0xfc200000 0x0 0x01e00000>,
+				 <0x03000000 0x1 0x00000000 0x1 0x00000000 0x0 0x40000000>;
+			resets = <&cru SRST_PCIE_POWER_UP>, <&cru SRST_P_PCIE>;
+			reset-names = "pwr", "pipe";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			pcie_intc: legacy-interrupt-controller {
+				interrupt-controller;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 155 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+			};
+		};
+
 		gic: interrupt-controller@fed01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xfed01000 0 0x1000>,
-- 
2.50.1


