Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761D5C3600D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 21:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9m2jZPr111Q1rzAW3toiaMm9B6b2aNk6dSLQMUSVKs=; b=UdqX1DkBe2d52Eoqxe04YfGFp/
	y6BoUiuoo425bTOKZ5GoD46qpUOqbDOPK4eSDHA60GnsS4lQYsAqHIfSFAieV6Nht0U4pkV4OesH6
	w1Q5+zdo6syWiYJ9pcFXUgreG+Rvh2CMwO9b47GlQP7FR50D6J3kvBdPstxJ0GbyrO14Ea9nAJ4rm
	q9woQqMQvza7/jnh97cl1VJcedSkCCqyCUlpCel9HTs7QCwcT7NQ5IZk7KGRsXvLrQqCK3Re6eU5n
	kKMl//W2JlpZnfo0y+G+PrgOxpRTnI1vc/RY1vVozydVWfGB0Jwtddc0DUKls3gvioTSd+FynBScm
	X6I1m10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txC5X-000000075nO-1BXq;
	Tue, 25 Mar 2025 21:45:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBu1-000000073vq-26Ph;
	Tue, 25 Mar 2025 21:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742938420;
	bh=RIwz438r/s63gFgZUecLnaG9eUlgOCD/aBHrHYdi1fU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fE6qmdVoLeoyvxhGvbETHLH1YV26mbH3mMvegjz3h2UZnSa9rlRpRneZd4uoNIHgR
	 4/xdGSCsf6N/hE3857KIJzgSs9hER/pAqmTJt2iXH9+seX8WODDqpA82/V9EhP9PIv
	 u1Oe+gP/RfyJT+bb4QdliV2LpM8JriVnZofm3be9dafb3gCRUbky6hzJhnWDOxfq0h
	 fFHG2nXsLnlksJ1wWGj03mfOyE0bMCF1T6mopAxa+gz5UOf05zGmjqbx8aQfjkOpUZ
	 7RWENWT8rykqGJqMpkV5Pc6ANpUr3zlg0ao8g2P8Ucdq5MWlLYwfpwT5hkbj7CYm9H
	 aL1toeb1yZs7g==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2067517E0865;
	Tue, 25 Mar 2025 22:33:36 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: [PATCH v4 6/6] arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)
Date: Tue, 25 Mar 2025 17:22:22 -0400
Message-ID: <20250325213303.826925-7-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325213303.826925-1-detlev.casanova@collabora.com>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_143341_681672_F18F81A9 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

Add the rkvdec2 Video Decoder to the RK3588s devicetree.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index c3abdfb04f8f4..636c287b94e0a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1237,6 +1237,70 @@ vepu121_3_mmu: iommu@fdbac800 {
 		#iommu-cells = <0>;
 	};
 
+	vdec0: video-decoder@fdc38000 {
+		compatible = "rockchip,rk3588-vdec";
+		reg = <0x0 0xfdc38000 0x0 0x100>,
+		      <0x0 0xfdc38100 0x0 0x500>,
+		      <0x0 0xfdc38600 0x0 0x100>;
+		reg-names = "link", "function", "cache";
+		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA>,
+			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
+		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
+				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
+		assigned-clock-rates = <800000000>, <600000000>,
+				       <600000000>, <1000000000>;
+		iommus = <&vdec0_mmu>;
+		power-domains = <&power RK3588_PD_RKVDEC0>;
+		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, <&cru SRST_RKVDEC0_CA>,
+			 <&cru SRST_RKVDEC0_CORE>, <&cru SRST_RKVDEC0_HEVC_CA>;
+		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		sram = <&vdec0_sram>;
+	};
+
+	vdec0_mmu: iommu@fdc38700 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdc38700 0x0 0x40>, <0x0 0xfdc38740 0x0 0x40>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_RKVDEC0>;
+		#iommu-cells = <0>;
+	};
+
+	vdec1: video-decoder@fdc40000 {
+		compatible = "rockchip,rk3588-vdec";
+		reg = <0x0 0xfdc40000 0x0 0x100>,
+		      <0x0 0xfdc40100 0x0 0x500>,
+		      <0x0 0xfdc40600 0x0 0x100>;
+		reg-names = "link", "function", "cache";
+		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, <&cru CLK_RKVDEC1_CA>,
+			 <&cru CLK_RKVDEC1_CORE>, <&cru CLK_RKVDEC1_HEVC_CA>;
+		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru CLK_RKVDEC1_CORE>,
+				  <&cru CLK_RKVDEC1_CA>, <&cru CLK_RKVDEC1_HEVC_CA>;
+		assigned-clock-rates = <800000000>, <600000000>,
+				       <600000000>, <1000000000>;
+		iommus = <&vdec1_mmu>;
+		power-domains = <&power RK3588_PD_RKVDEC1>;
+		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, <&cru SRST_RKVDEC1_CA>,
+			 <&cru SRST_RKVDEC1_CORE>, <&cru SRST_RKVDEC1_HEVC_CA>;
+		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		sram = <&vdec1_sram>;
+	};
+
+	vdec1_mmu: iommu@fdc40700 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdc40700 0x0 0x40>, <0x0 0xfdc40740 0x0 0x40>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_RKVDEC0>;
+		#iommu-cells = <0>;
+	};
+
 	av1d: video-codec@fdc70000 {
 		compatible = "rockchip,rk3588-av1-vpu";
 		reg = <0x0 0xfdc70000 0x0 0x800>;
@@ -2883,6 +2947,16 @@ system_sram2: sram@ff001000 {
 		ranges = <0x0 0x0 0xff001000 0xef000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+
+		vdec0_sram: codec-sram@0 {
+			reg = <0x0 0x78000>;
+			pool;
+		};
+
+		vdec1_sram: codec-sram@78000 {
+			reg = <0x78000 0x77000>;
+			pool;
+		};
 	};
 
 	pinctrl: pinctrl {
-- 
2.49.0


