Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE4EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qM2kjDv8yiHdNanOkkqrr4uaRt3f/qugOPAoj2T+6O4=; b=ripgPaHrxCsHQbmaTEDwWFEwHo
	8iSTRVovXjYUpbDmpSLNjYAQjLsAiqqXIipT1FJk49BUu70h1ISaqPzpheig5FmrxnSMtcFSeoizz
	NbGO5Q1H4fuQB5k1siTAEAyNAEH7yU01GJhMEbAVDdo4PHRyzEks9s7dgAZFfcgb/yxWlmgVQvy6t
	weB/lo4NNvjiyPJI7twOrpC+Ac53FYnZMY3f2dX14Kx58rFvYMNU3lgV8lmg6HnBnWgyoY5KpaLKK
	l80CgttKVxNt0kqPPxEW8aizpTwDCn45z9FqMbkZWDOQu1yePzC6TJ1rQhA+2iEd1PKxjP4ikjCpT
	2Q+wQbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYp1-00000004w6m-32Tg;
	Wed, 23 Jul 2025 12:43:47 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYVx-00000004tul-2MEx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753273445; bh=qM2kjDv8yiHdNanOkkqrr4uaRt3f/qugOPAoj2T+6O4=;
 b=AMdyYPNlx1ubu2sWh6v8INEdsTNCH0Bf2frCR0yZ7HgQTAoIWfv3RhvetDzmo1tXrcL/5ghMd
 fGxfMoyGCmfQ4o65WjLZm2YDtN8VxcbI7JUg48XTmOcVuXlNBiReMR+pzHRKfV/l9PKPO6jX/WH
 H1MGmOxyq+Lx+dnlMmjyOlvJ70FLe+QG8AEuq6bOw/OwpK6hWPNZ/gqKkEhsQhBwqWbI7rX1rTD
 Zv9kHzgO7YPEeUxJIBDAcazGM3evFJ+Yfqt1Farp0DqbUOZwpMETfJHb5hwrNRo7hZ/velHqiyq
 U3BIlCyOlbSTTb9pTmcIMAwzivGes5Ol6RFgfP4blBQw==
X-Forward-Email-ID: 6880d460cb0ee86f9731a0f5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 07/11] arm64: dts: rockchip: Add USB nodes for RK3528
Date: Wed, 23 Jul 2025 12:23:05 +0000
Message-ID: <20250723122323.2344916-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723122323.2344916-1-jonas@kwiboo.se>
References: <20250723122323.2344916-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_052405_641629_11F14E10 
X-CRM114-Status: GOOD (  10.99  )
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

Rockchip RK3528 has one USB 3.0 DWC3 controller, a USB 2.0 EHCI/OHCI
controller and uses a USB2PHY for USB 2.0. The DWC3 controller may also
use the Naneng Combo PHY for USB3.

Add device tree nodes to describe these USB controllers along with the
USB 2.0 PHYs.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
The DWC3 node does not contain any default phys because out of current
and pending supported boards only one board, ROCK 2A, can use USB3.
Remaining boards use the Naneng Combo PHY for PCIe instead of USB3.
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 76 ++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 85bc3f5aa2c7..3e51a3f51e05 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -243,6 +243,29 @@ soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		usb_host0_xhci: usb@fe500000 {
+			compatible = "rockchip,rk3528-dwc3", "snps,dwc3";
+			reg = <0x0 0xfe500000 0x0 0x400000>;
+			clocks = <&cru CLK_REF_USB3OTG>,
+				 <&cru CLK_SUSPEND_USB3OTG>,
+				 <&cru ACLK_USB3OTG>;
+			clock-names = "ref_clk", "suspend_clk", "bus_clk";
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3528_PD_VPU>;
+			resets = <&cru SRST_A_USB3OTG>;
+			dr_mode = "otg";
+			phy_type = "utmi_wide";
+			snps,dis_enblslpm_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,parkmode-disable-hs-quirk;
+			snps,parkmode-disable-ss-quirk;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@fed01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xfed01000 0 0x1000>,
@@ -256,6 +279,30 @@ gic: interrupt-controller@fed01000 {
 			#interrupt-cells = <3>;
 		};
 
+		usb_host0_ehci: usb@ff100000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0xff100000 0x0 0x40000>;
+			clocks = <&cru HCLK_USBHOST>, <&cru HCLK_USBHOST_ARB>,
+				 <&u2phy>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&u2phy_host>;
+			phy-names = "usb";
+			power-domains = <&power RK3528_PD_VO>;
+			status = "disabled";
+		};
+
+		usb_host0_ohci: usb@ff140000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0xff140000 0x0 0x40000>;
+			clocks = <&cru HCLK_USBHOST>, <&cru HCLK_USBHOST_ARB>,
+				 <&u2phy>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&u2phy_host>;
+			phy-names = "usb";
+			power-domains = <&power RK3528_PD_VO>;
+			status = "disabled";
+		};
+
 		qos_crypto_a: qos@ff200000 {
 			compatible = "rockchip,rk3528-qos", "syscon";
 			reg = <0x0 0xff200000 0x0 0x20>;
@@ -1109,6 +1156,35 @@ dmac: dma-controller@ffd60000 {
 			#dma-cells = <1>;
 			arm,pl330-periph-burst;
 		};
+
+		u2phy: usb2phy@ffdf0000 {
+			compatible = "rockchip,rk3528-usb2phy";
+			reg = <0x0 0xffdf0000 0x0 0x10000>;
+			clocks = <&cru CLK_REF_USBPHY>, <&cru PCLK_USBPHY>;
+			clock-names = "phyclk", "pclk";
+			#clock-cells = <0>;
+			clock-output-names = "clk_usbphy_480m";
+			power-domains = <&power RK3528_PD_VO>;
+			rockchip,usbgrf = <&vo_grf>;
+			status = "disabled";
+
+			u2phy_otg: otg-port {
+				interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "otg-bvalid", "otg-id",
+						  "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			u2phy_host: host-port {
+				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
 	};
 };
 
-- 
2.50.1


