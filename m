Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5BBC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xx9BM0BLm+AQYbiFC/xinhfjgQ15WbHp3OQVXWgCDOk=; b=zXZY3AxvAlHreG/waHqlePF44h
	hat0/u4DkAyBwIxOSetQneexw8TAhhCYNUQhKpqP9u5x4Qa7D6llqVGyF/dpnBcz1yvZodL/doxHf
	jn76m/1dchMD7Ns//pnlgDk184CD4t/Kd7Ghjn44E2eVnZz8AYFyiTVWKALfSBOeGknQCSCJLiNh+
	fFNa4Jm5uRqenBZqHvhqUb/LzGy8n0+ulp3m2RrE4EvIzfUAIossHd7fIw151Ofhn/i399hT9HtkJ
	IIu1P+wbbRr6nHwO697nZXl8609pFGBmOonfSwfKCg90sPpTWId/CYD+ZsRiIL+bZsgc+Pf9ROQqw
	7F68tWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2R1-00000000xsX-1m0G;
	Thu, 08 May 2025 14:41:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1go-00000000pKV-3SkL;
	Thu, 08 May 2025 13:53:31 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8B00C25A8D;
	Thu,  8 May 2025 15:53:29 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YET6xmJWoQyn; Thu,  8 May 2025 15:53:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746712409; bh=QswFB5tgp/GHNhRRoFGsejr8xzEI9y2/TqU4JZ05+W4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CeX52YagXDvSu71pGGBEbmeF1p/mtDUMN+KlqsHvYvgwPMJN4A5WM73QpGIWfYfFt
	 /52NnZYOdSX8UjzkCMdiToGxP1+ohK8Wn1zKRydSd9oVcnVOamLfQnkpt3vEua9PSH
	 vosGBvQ+qEb7dnrCP6G2LLg9RcFM1dBxOiVcIYves5SsRkPdhasv+XRN5FEdxdPOxl
	 Xfq29IvWaiIByiA6X/iVvwRk3n7BfVlGdRpwoWfdkFbCuMBdyLorjoK9m7N4XqhE8d
	 ktWs3QjYJbae1ZH4iTAF35r7mmb3M6re2Na4x86cy27zYogid0knJ1+3VN3aOUoNFi
	 8cnyZmmsBLRkw==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: rockchip: Add naneng-combphy for RK3528
Date: Thu,  8 May 2025 13:53:07 +0000
Message-ID: <20250508135307.14726-2-ziyao@disroot.org>
In-Reply-To: <20250508134332.14668-2-ziyao@disroot.org>
References: <20250508134332.14668-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_065330_995687_1A7CA017 
X-CRM114-Status: UNSURE (   8.00  )
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

Rockchip RK3528 ships a naneng-combphy that is shared by PCIe and USB
3.0 controllers. Describe it and the pipe-phy grf which it depends on.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 68059c7d7e80..cd6b9ddb3345 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/clock/rockchip,rk3528-cru.h>
 #include <dt-bindings/reset/rockchip,rk3528-cru.h>
 
@@ -334,6 +335,11 @@ vpu_grf: syscon@ff340000 {
 			reg = <0x0 0xff340000 0x0 0x8000>;
 		};
 
+		pipe_phy_grf: syscon@ff348000 {
+			compatible = "rockchip,rk3528-pipe-phy-grf", "syscon";
+			reg = <0x0 0xff348000 0x0 0x8000>;
+		};
+
 		vo_grf: syscon@ff360000 {
 			compatible = "rockchip,rk3528-vo-grf", "syscon";
 			reg = <0x0 0xff360000 0x0 0x10000>;
@@ -698,6 +704,23 @@ dmac: dma-controller@ffd60000 {
 			arm,pl330-periph-burst;
 		};
 
+		combphy: phy@ffdc0000 {
+			compatible = "rockchip,rk3528-naneng-combphy";
+			reg = <0x0 0xffdc0000 0x0 0x10000>;
+			#phy-cells = <1>;
+			clocks = <&cru CLK_REF_PCIE_INNER_PHY>, <&cru PCLK_PCIE_PHY>,
+				 <&cru PCLK_PIPE_GRF>;
+			clock-names = "ref", "apb",
+				      "pipe";
+			assigned-clocks = <&cru CLK_REF_PCIE_INNER_PHY>;
+			assigned-clock-rates = <100000000>;
+			resets = <&cru SRST_PCIE_PIPE_PHY>, <&cru SRST_P_PCIE_PHY>;
+			reset-names = "phy", "apb";
+			rockchip,pipe-grf = <&vpu_grf>;
+			rockchip,pipe-phy-grf = <&pipe_phy_grf>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl {
 			compatible = "rockchip,rk3528-pinctrl";
 			rockchip,grf = <&ioc_grf>;
-- 
2.49.0


