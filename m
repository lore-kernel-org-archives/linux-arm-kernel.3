Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFD9C54795
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjLf7R4lNu+2nzvX6T24Rd/xLzYCShIJGBXSraBLYuI=; b=ZwbNRAuU/WuTsk7p7W5QXDypOd
	9yWG3nvzO6jRkf2absXmJG3FmLhyxyO3QEExlRcsuTv6ltDVjCw2a9YjsTI+Le9RxUIsR6744NZ7N
	GlJ2lkdVlzz1fsKOFvHetFLU6GPWYu7e8uVKn64ELRcZUSz3CcF3dDtDyj8Rr8Wq0RU81pbPj/pag
	r8M8bJ17Rsp1DAaC1BTpqXe+ZV80q2GaNDi8zcIXwg+QKIM8OPOZbyqDocff5AUJRypHNO5EPpgHo
	I7mozfSp7b7+5NWg3mtX79gtl/u1kbyufrsWWYeL4RJ2ppA6uxpvXTWqwfuo5uuFRoqbmpxqa5RI5
	gTbUWcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH464-00000009w9i-2WZW;
	Mon, 19 May 2025 17:16:16 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3Bp-00000009mDJ-3AoO;
	Mon, 19 May 2025 16:18:10 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6604120F85;
	Mon, 19 May 2025 18:18:08 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmtN3vBAVKkw; Mon, 19 May 2025 18:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747671487; bh=EhhH2Voxlf14KFwiAk/dd5Jg0RabzoVgX6qYyH37IMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b+655J56PtwvdNRUhoPoxE3jVWPvAQHMfMyPqaGLiWmIHtxvfQYK4WYhpHvruvsA8
	 tiPAsaZtRFzWJkk62IpOAxaETGR0LvPAVEu1yCnd2x9MCbys6NHzHgcH/y2QoZK4zP
	 lPFo8m+6H6j/HbXoPdZSUCQ/29vp0/J5TRUHyHdtVz7Y/6ivyYvShoQcN9vTPgYcfo
	 IctMOW/G74UZ7z7f/eBvkwnCBZa0jQgAuAa9qNp1ZEyavmtfGq93wq5CFNYCwquj3b
	 Z+x1Uv2SkPDviZrceL5ep50zNG4/DaWl+7+GI4ha7OeujWci7mXR1KnzOKutiAaDFV
	 12BtqxIWTRong==
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
Subject: [PATCH v3 5/5] arm64: dts: rockchip: Add naneng-combphy for RK3528
Date: Mon, 19 May 2025 16:16:11 +0000
Message-ID: <20250519161612.14261-6-ziyao@disroot.org>
In-Reply-To: <20250519161612.14261-1-ziyao@disroot.org>
References: <20250519161612.14261-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_091809_924077_0C16460C 
X-CRM114-Status: UNSURE (   7.74  )
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
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index b2724c969a76..314afb94e19b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -318,6 +318,11 @@ vpu_grf: syscon@ff340000 {
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
@@ -867,6 +872,23 @@ dmac: dma-controller@ffd60000 {
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


