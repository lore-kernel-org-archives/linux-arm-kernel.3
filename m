Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEFCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lvmAl49q0nOo+CXHprDwYdHIdAg6MStjLB57aFHcjK0=; b=24/XVcSnyZoiCgmDDI65zx18rN
	3YPwNjEi+2Dx1/xqXlpmFa60XWvYkHZb7JIe3QJTUEGk3S4DNggcgJj9rLbM5jaMFwBfG7P1I/UFf
	5nPovZsz071lm9XR44S1azZMygSpIvlhQ8tnA+R99ZfdheXcPpbCuj0rmICczlN7JkPQEWRKw2XY+
	1l1uNcVj6Lwq+AIa0QjU0enxjdI9Ftcl9wtxRNSFjBJsa2v3CDmCTH4z1MFhH5QiF2vxGrWBfQbQg
	8X6E8142SeikS1kjD6v58hAMLDItV0b2hOr+p7oYYtzqNGYAr/+XHroR9AUiGwsn5cvgCcALG6y3I
	DYSfMnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvz1-0000000Amic-19c7;
	Tue, 10 Dec 2024 08:52:43 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvxO-0000000AmSi-2CIU;
	Tue, 10 Dec 2024 08:51:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21634417587so3901815ad.3;
        Tue, 10 Dec 2024 00:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733820661; x=1734425461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lvmAl49q0nOo+CXHprDwYdHIdAg6MStjLB57aFHcjK0=;
        b=WgzfXqfr50nFRSP500EiXbO7hKXviW8l2XlWbxa+81XFefvHHnxy+Y/lyQddwxl1o0
         bESqD4yPDns+CP1Nibyinf1QcBVg033vpFY3ULuTW0+sVSnA+mQ5yrk749eERfcrzDAQ
         mew9dxEeXAPh9RT3aOeAnKUjJ93BOxcbCtuGkFidOPtIekAUkd8Mz3W0Gg9Olal1mnty
         nM3DMg/KbpC6/9hDe4NzB2v9LBqKPlnUS3iIOw/iivfsZnL1R9hlDXy5Kal+IKHVcFEl
         ntidQ3orQszRT/b1ysfWoqp6zDpddKh61X+57KTH3BwtSCKns/+AkHQqjrX6il2jEDoj
         bQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733820661; x=1734425461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvmAl49q0nOo+CXHprDwYdHIdAg6MStjLB57aFHcjK0=;
        b=hk6XcaHYIYOX4nXraWDKD78gDRBhNNaCo1rHpu36rwS630ZMlpYjxx91Go9VyuGrk6
         oXhRL9aRW4c8jlAznxpqBBQWwOi1ze/2TBQFEnxmDggEYVYXccrl5KEEZLtgvFw0JytS
         1yhQwkmXrZvm//TZq5dLKQFs+EHRmkdKpF8M+FI5LLspiCuJOe/MuB2iYWvQVHpFrWSI
         hQeMbEh8+wzQriJniswBKQikNXJX4g73K8U/G/hDiXzS2dtQ3+HJxqjGKofTp//yDPBj
         gv9QWqzNCHgQs3iY8wu2WhulGerpHa2yDn8X2CDfzpSI1CDpjwby0lKZECAOSUfqwNnR
         uamw==
X-Forwarded-Encrypted: i=1; AJvYcCUb+DLtn7wYOpyuzzWuzR0tFk97TPq5BV+QEfs6ja9zJcjluTMBPj+ZSlpVezD7IvW+1656mrl1rR+cAAVV0TPG@lists.infradead.org, AJvYcCWaZHIMHE1NF7xpck98oWXFB9rPo9po73VCLc+C3ISilE/8BcB7mFouNhWmFmMCYdNpJW204tjx06YIMjcXFn4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmfGNc8ad7Oqvn79MDCChWAOdpFhRtgQatos8zf/jLDF3LVT78
	A1+FiTS6WcpGnFYLuYQJH54rmQRN97luzbfU+RcwX5aSfeQWe2Y9
X-Gm-Gg: ASbGncv2xZoVYvXNkSXZGOUMCq4j+OSE1ix1wMrqc7YZfqBeIRmxECpCb4QJdRNOn5D
	IVFbWD0+qXlNkj7ywvV2iczNMhyPOnfs8bkiqDuMkY3h5PB071NNGuP5uuC0vVIB7p61wb8hG+j
	oRSvnlxNl8xNdjqkPES71RrUt6sS30z0X+Rrj0+NdqQwB9q8/wFe6gNG23/YMybYVegYeIt51OC
	qr2eS+z2CUk0fK4nEwY8kv2BFfBYayoM39ltje59GF3CdUx3X0bG6RXT1X/PKEylkM=
X-Google-Smtp-Source: AGHT+IHuUD4OQIvKVC68Jcb0WI5maZSwAo50mG73GT8qwADzaNvcHaD5/ggUoORwSEiUbK0S9nZB/A==
X-Received: by 2002:a17:903:2451:b0:215:a97a:c6bc with SMTP id d9443c01a7336-2166fb9ca4fmr14413735ad.0.1733820660864;
        Tue, 10 Dec 2024 00:51:00 -0800 (PST)
Received: from localhost.localdomain ([103.29.142.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e3e807sm85046915ad.57.2024.12.10.00.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 00:51:00 -0800 (PST)
From: Frank Wang <frawang.cn@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	william.wu@rock-chips.com,
	yubing.zhang@rock-chips.com,
	tim.chen@rock-chips.com,
	kever.yang@rock-chips.com,
	Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH] arm64: dts: rockchip: add usb related nodes for rk3576
Date: Tue, 10 Dec 2024 16:50:53 +0800
Message-Id: <20241210085053.64294-1-frawang.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_005102_566505_C4CBF548 
X-CRM114-Status: GOOD (  10.70  )
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

From: Frank Wang <frank.wang@rock-chips.com>

This adds USB and USB-PHY related nodes for RK3576 SoC.

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---
The compatible string "rockchip,rk3576-naneng-combphy" in the patch
depends on the following commit which has not merged into this branch.
 - https://patchwork.kernel.org/project/linux-phy/patch/20241106021357.19782-1-frawang.cn@gmail.com/

 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 169 +++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 436232ffe4d1..70cfa099089a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -445,6 +445,58 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		usb_drd0_dwc3: usb@23000000 {
+			compatible = "rockchip,rk3576-dwc3", "snps,dwc3";
+			reg = <0x0 0x23000000 0x0 0x400000>;
+			clocks = <&cru CLK_REF_USB3OTG0>,
+				 <&cru CLK_SUSPEND_USB3OTG0>,
+				 <&cru ACLK_USB3OTG0>;
+			clock-names = "ref_clk", "suspend_clk", "bus_clk";
+			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3576_PD_USB>;
+			resets = <&cru SRST_A_USB3OTG0>;
+			dr_mode = "otg";
+			phys = <&u2phy0_otg>, <&usbdp_phy PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi_wide";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-hs-quirk;
+			snps,parkmode-disable-ss-quirk;
+			status = "disabled";
+		};
+
+		usb_drd1_dwc3: usb@23400000 {
+			compatible = "rockchip,rk3576-dwc3", "snps,dwc3";
+			reg = <0x0 0x23400000 0x0 0x400000>;
+			clocks = <&cru CLK_REF_USB3OTG1>,
+				 <&cru CLK_SUSPEND_USB3OTG1>,
+				 <&cru ACLK_USB3OTG1>;
+			clock-names = "ref_clk", "suspend_clk", "bus_clk";
+			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3576_PD_PHP>;
+			resets = <&cru SRST_A_USB3OTG1>;
+			dr_mode = "otg";
+			phys = <&u2phy1_otg>, <&combphy1_psu PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi_wide";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,dis_rxdet_inp3_quirk;
+			snps,parkmode-disable-hs-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dma-coherent;
+			status = "disabled";
+		};
+
 		sys_grf: syscon@2600a000 {
 			compatible = "rockchip,rk3576-sys-grf", "syscon";
 			reg = <0x0 0x2600a000 0x0 0x2000>;
@@ -515,6 +567,65 @@ usbdpphy_grf: syscon@2602c000 {
 			reg = <0x0 0x2602c000 0x0 0x2000>;
 		};
 
+		usb2phy_grf: syscon@2602e000 {
+			compatible = "rockchip,rk3576-usb2phy-grf", "syscon", "simple-mfd";
+			reg = <0x0 0x2602e000 0x0 0x4000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u2phy0: usb2-phy@0 {
+				compatible = "rockchip,rk3576-usb2phy";
+				reg = <0x0 0x10>;
+				resets = <&cru SRST_OTGPHY_0>, <&cru SRST_P_USBPHY_GRF_0>;
+				reset-names = "phy", "apb";
+				clocks = <&cru CLK_PHY_REF_SRC>,
+					 <&cru ACLK_MMU2>,
+					 <&cru ACLK_SLV_MMU2>;
+				clock-names = "phyclk", "aclk", "aclk_slv";
+				clock-output-names = "usb480m_phy0";
+				#clock-cells = <0>;
+				status = "disabled";
+
+				u2phy0_otg: otg-port {
+					#phy-cells = <0>;
+					interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "otg-bvalid", "otg-id", "linestate";
+					status = "disabled";
+				};
+			};
+
+			u2phy1: usb2-phy@2000 {
+				compatible = "rockchip,rk3576-usb2phy";
+				reg = <0x2000 0x10>;
+				resets = <&cru SRST_OTGPHY_1>, <&cru SRST_P_USBPHY_GRF_1>;
+				reset-names = "phy", "apb";
+				clocks = <&cru CLK_PHY_REF_SRC>,
+					 <&cru ACLK_MMU1>,
+					 <&cru ACLK_SLV_MMU1>;
+				clock-names = "phyclk", "aclk", "aclk_slv";
+				clock-output-names = "usb480m_phy1";
+				#clock-cells = <0>;
+				status = "disabled";
+
+				u2phy1_otg: otg-port {
+					#phy-cells = <0>;
+					interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "otg-bvalid", "otg-id", "linestate";
+					status = "disabled";
+				};
+			};
+		};
+
+		vo1_grf: syscon@26036000 {
+			compatible = "rockchip,rk3576-vo1-grf", "syscon";
+			reg = <0x0 0x26036000 0x0 0x100>;
+			clocks = <&cru PCLK_VO1_ROOT>;
+		};
+
 		sdgmac_grf: syscon@26038000 {
 			compatible = "rockchip,rk3576-sdgmac-grf", "syscon";
 			reg = <0x0 0x26038000 0x0 0x1000>;
@@ -1587,6 +1698,64 @@ uart11: serial@2afd0000 {
 			status = "disabled";
 		};
 
+		usbdp_phy: phy@2b010000 {
+			compatible = "rockchip,rk3576-usbdp-phy";
+			reg = <0x0 0x2b010000 0x0 0x10000>;
+			#phy-cells = <1>;
+			clocks = <&cru CLK_PHY_REF_SRC >,
+				 <&cru CLK_USBDP_COMBO_PHY_IMMORTAL>,
+				 <&cru PCLK_USBDPPHY>,
+				 <&u2phy0>;
+			clock-names = "refclk", "immortal", "pclk", "utmi";
+			resets = <&cru SRST_USBDP_COMBO_PHY_INIT>,
+				 <&cru SRST_USBDP_COMBO_PHY_CMN>,
+				 <&cru SRST_USBDP_COMBO_PHY_LANE>,
+				 <&cru SRST_USBDP_COMBO_PHY_PCS>,
+				 <&cru SRST_P_USBDPPHY>;
+			reset-names = "init", "cmn", "lane", "pcs_apb", "pma_apb";
+			rockchip,u2phy-grf = <&usb2phy_grf>;
+			rockchip,usb-grf = <&usb_grf>;
+			rockchip,usbdpphy-grf = <&usbdpphy_grf>;
+			rockchip,vo-grf = <&vo1_grf>;
+			status = "disabled";
+		};
+
+		combphy0_ps: phy@2b050000 {
+			compatible = "rockchip,rk3576-naneng-combphy";
+			reg = <0x0 0x2b050000 0x0 0x100>;
+			#phy-cells = <1>;
+			clocks = <&cru CLK_REF_PCIE0_PHY>,
+				 <&cru PCLK_PCIE2_COMBOPHY0>,
+				 <&cru PCLK_PCIE0>;
+			clock-names = "ref", "apb", "pipe";
+			assigned-clocks = <&cru CLK_REF_PCIE0_PHY>;
+			assigned-clock-rates = <100000000>;
+			resets = <&cru SRST_PCIE0_PIPE_PHY>,
+				 <&cru SRST_P_PCIE2_COMBOPHY0>;
+			reset-names = "phy", "apb";
+			rockchip,pipe-grf = <&php_grf>;
+			rockchip,pipe-phy-grf = <&pipe_phy0_grf>;
+			status = "disabled";
+		};
+
+		combphy1_psu: phy@2b060000 {
+			compatible = "rockchip,rk3576-naneng-combphy";
+			reg = <0x0 0x2b060000 0x0 0x100>;
+			#phy-cells = <1>;
+			clocks = <&cru CLK_REF_PCIE1_PHY>,
+				 <&cru PCLK_PCIE2_COMBOPHY1>,
+				 <&cru PCLK_PCIE1>;
+			clock-names = "ref", "apb", "pipe";
+			assigned-clocks = <&cru CLK_REF_PCIE1_PHY>;
+			assigned-clock-rates = <100000000>;
+			resets = <&cru SRST_PCIE1_PIPE_PHY>,
+				 <&cru SRST_P_PCIE2_COMBOPHY1>;
+			reset-names = "phy", "apb";
+			rockchip,pipe-grf = <&php_grf>;
+			rockchip,pipe-phy-grf = <&pipe_phy1_grf>;
+			status = "disabled";
+		};
+
 		sram: sram@3ff88000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x3ff88000 0x0 0x78000>;
-- 
2.25.1


