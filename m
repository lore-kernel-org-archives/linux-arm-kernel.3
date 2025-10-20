Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC032CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 21:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owM2ECmj28klizbxLdnckSW4KHV1gevIqDdGUgOsXSI=; b=mN8UXOnbkUkadR5KIztBYNM2OK
	rgdfturZ1b+y5uGGMLmLW0VS1nTVckpFeNOIdrnACQEgeplKqj0P6V8Gi2An2FgF4KJ5yowTJ1Szg
	LlMFbIXi0trG2rYgZC+z4mlnCU39aVh8gNt65vkhmkNGguewgYBWZwfF4cy1XzvLAP/czII1at+9y
	NiaCkqTKnOKDLeoWjuACZ1TLB29MJWmcxKZbHRHpEmp8CLrlRvlRkW8oN5bDbC09vAP1IGIaYV26n
	khrrAip3JcAS1YYYSqeLAFuqpEczgISkZVB3P0lV5SRaHLP/hJUB17dLvbs1ZuuSaWRqlHlLo6dmV
	gIzisyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxIx-0000000F58N-3qUt;
	Mon, 20 Oct 2025 21:20:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxIu-0000000F568-2hqU;
	Mon, 20 Oct 2025 21:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760995229;
	bh=ebhCP696my3k4WkNCPQ1Nj+6kNj+G6BYfiv6ewYHW84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BuTVmlhmnDI7AsEdDshMpCtHVCVCrdFdOybD8PjHoR0ElTXqcXEFZm/Th+YkWzgs5
	 Qbodetct5EBCzIV/Hpxk5ro3eX7nvy/MDWBQ/5qut5Cax6rNKYcd85nHcOpoiLwsg9
	 HIh6x2U+eu/gbCsvi+UItjjTpb36iJSHgz/bFFGC3KLHhfrkiwrSPZHeW1z0weHq/g
	 I/tNzxyy9SH+eUjOgdZrXCZCe/WE5i7reTNqpEpSnt1dQ/dwkE7iUtSglrkaOHEhTB
	 s6BoWoz9BAtfadyq7qRC6ok+i6X4sB+IxIlu6qhSbyCmyIaZH1DswQa+1JzNsXGskj
	 DY9VI5qXtMClQ==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B61A117E055D;
	Mon, 20 Oct 2025 23:20:26 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Dragan Simic <dsimic@manjaro.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Patrick Wildt <patrick@blueri.se>,
	Diederik de Haas <didi.debian@cknow.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v3 2/2] arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576
Date: Mon, 20 Oct 2025 17:20:09 -0400
Message-ID: <20251020212009.8852-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020212009.8852-1-detlev.casanova@collabora.com>
References: <20251020212009.8852-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_142032_842578_F17A1F63 
X-CRM114-Status: GOOD (  10.28  )
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

Add the vdpu383 Video Decoder variant to the RK3576 device tree.

Also allow using the dedicated SRAM as a pool.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index fc4e9e07f1cf..00999823746f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1289,6 +1289,41 @@ gpu: gpu@27800000 {
 			status = "disabled";
 		};
 
+		vdec: video-codec@27b00000 {
+			compatible = "rockchip,rk3576-vdec";
+			reg = <0x0 0x27b00100 0x0 0x500>,
+			      <0x0 0x27b00000 0x0 0x100>,
+			      <0x0 0x27b00600 0x0 0x100>;
+			reg-names = "function", "link", "cache";
+			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKVDEC_ROOT>, <&cru HCLK_RKVDEC>,
+				 <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_CORE>,
+				 <&cru CLK_RKVDEC_HEVC_CA>;
+			clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+			assigned-clocks = <&cru ACLK_RKVDEC_ROOT>, <&cru CLK_RKVDEC_CORE>,
+					  <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_HEVC_CA>;
+			assigned-clock-rates = <600000000>, <600000000>,
+					       <500000000>, <1000000000>;
+			iommus = <&vdec_mmu>;
+			power-domains = <&power RK3576_PD_VDEC>;
+			resets = <&cru SRST_A_RKVDEC_BIU>, <&cru SRST_H_RKVDEC_BIU>,
+				 <&cru SRST_H_RKVDEC>, <&cru SRST_RKVDEC_CORE>,
+				 <&cru SRST_RKVDEC_HEVC_CA>;
+			reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+			sram = <&rkvdec_sram>;
+		};
+
+		vdec_mmu: iommu@27b00800 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27b00800 0x0 0x40>, <0x0 0x27b00900 0x0 0x40>;
+			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru CLK_RKVDEC_CORE>, <&cru HCLK_RKVDEC>;
+			clock-names = "aclk", "iface";
+			power-domains = <&power RK3576_PD_VDEC>;
+			rockchip,disable-mmu-reset;
+			#iommu-cells = <0>;
+		};
+
 		vop: vop@27d00000 {
 			compatible = "rockchip,rk3576-vop";
 			reg = <0x0 0x27d00000 0x0 0x3000>, <0x0 0x27d05000 0x0 0x1000>;
@@ -2694,6 +2729,7 @@ sram: sram@3ff88000 {
 			/* start address and size should be 4k align */
 			rkvdec_sram: rkvdec-sram@0 {
 				reg = <0x0 0x78000>;
+				pool;
 			};
 		};
 
-- 
2.51.1.dirty


