Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69476C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 19:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEyTIsxqMshl488YgnfcvqVadV4Pnrv2mqlshsOe4mA=; b=Rj9KCbPnwPDrmZDi/HxqXl+8k2
	hA4dgc2Hw+51oHLdqJBy7fR8Lqc0nne4PXbSmTmUhUWd4moB6BgLvzx9eSS8vONEw3cBYx9StKc/Y
	5Y87y+XO/H+VH03cl9hCQ6aFr57o16kRpcYOqwyPQRCdXYoFqoXjYLf8hP6sBQf8VLZIFfytS1beY
	4OJ3ImUyw+6jQzXmK+mIjtC4a/7dEbOi9rn53rNQ7U37/RfXomWxW6qKarhDUU1iCC1XxHfpTFUQb
	RlQlDC46QWHnxIdF4oczYFwPTSnj8l0t+M0vXseETXhue23hFAvkb3SDKTXSdO3G6QpjskDziTSmG
	8enGzr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn80-00000003ryX-0vX2;
	Mon, 23 Jun 2025 19:46:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjiB-00000003M6W-2mAA;
	Mon, 23 Jun 2025 16:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694878;
	bh=LAtHIDsXc48M+4SNF2evd23d5+2WZS3MzWRndXBDn7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SaB0zpAHjXwCGcMTaY4yKSJkhwbsYNN+QC6lQXd0qEINs3aPwKdC8+EugvoX3hzlq
	 3OUzwmZZxTvvoSqVwZYy09nSEJYvKMToPzJ58ikI46LFNMO2/hziBfrwxoSZCljo9z
	 V0umNgidaM6cVS4GYIz41lFQlzWyjL/AcpfWiRYiWv/MTIulK72WfOXj5jKiL+czuG
	 P89Z9sZbvN/4PbRvlXY2xhUhBSBtpS+gkou5omQar5r//iUAtCA6ogeOn006Ur0guq
	 WMCQe8/65QrsOKEKebY/rVx1k6edtBoA0QfgCkkM4oWSb6TP0V03cOh6F9OWOMJCSI
	 CDEkXG+SA5oWQ==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 12DAC17E35D3;
	Mon, 23 Jun 2025 18:07:54 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 4/8] arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576
Date: Mon, 23 Jun 2025 12:07:18 -0400
Message-ID: <20250623160722.55938-5-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623160722.55938-1-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_090759_847319_69B6C3E5 
X-CRM114-Status: GOOD (  10.40  )
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
index b1ac23035dd78..26896ac22cedf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1139,6 +1139,41 @@ gpu: gpu@27800000 {
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
@@ -2412,6 +2447,7 @@ sram: sram@3ff88000 {
 			/* start address and size should be 4k align */
 			rkvdec_sram: rkvdec-sram@0 {
 				reg = <0x0 0x78000>;
+				pool;
 			};
 		};
 
-- 
2.50.0


