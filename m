Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79523C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 03:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2s2T9FBq0PkVeveB8un+nM12JI6im71Uplh3ykpnzG0=; b=Hh2ecagMoj22Z73neNLoM7q3qU
	fTDrp3B45C8L+XJ/a8Qod8kezSjdvDeHBxztsp7LbW5cGuJGRiPdlHwhx6NXOq/PoQxWlXh79owdu
	F5dfQS3eEdJpt2IUNtAlC9eFGmq9K0Gj2M+wjP56SzM4PZ8K27zMQ37bY9JiCOhWq1ElljCG9/SYA
	liDb/WkecwRWez4SCxDWc1Sn3ROehA9nVLz3JtygQnrOF6ycCVC9A1B7xQiEiqLe5/rs3m6zPdQOS
	c/KGlYNDq4HxegnUS5irv2pfnjQRriKanI9Isk+rGdFxjfQDb8O8EFSD/7lV7p4c+ZKTdieZyfCcS
	XtYzdEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTulX-00000004aJi-38Lz;
	Tue, 24 Jun 2025 03:56:11 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuVn-00000004YyK-0fQq;
	Tue, 24 Jun 2025 03:39:56 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E0D6625A24;
	Tue, 24 Jun 2025 05:39:53 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTZH90UD7F9r; Tue, 24 Jun 2025 05:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750736393; bh=Cn577oWTiuD78zUlriRAp/KCdUeL45UyKPT3ZBfVSNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MvpY/fp/GC/4at6lGtQowOZO/8toL+OLqjdCqhMbcnsa8/RujJ1XHBCvyx83zh3UQ
	 SPdXvB0xdxZ1NHDQaw0jB6H0bnGJfzavbFAQD/mndyAc9kISM1JNzxngKPd2Ex1rZF
	 IG9PPmDHiSpId/9jZGyudx10QjTUp5tBZrG2Oytvwv/3dyc7RQ8LoQGgDPMGg6UOtX
	 h0GgTcqm1z43zl3We7QRRkbR4V4shR1RrrJtfR6PlpUfAB8fh9aygUgsjuHA6mO20P
	 XcSuczhntnHFm65KZQbJsZsSwdl+U0cAxsj3sjgW1omWilsy7FUvS/bXVB26snkmQr
	 aD4PaKFyEKcOw==
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
Subject: [PATCH v4 6/6] arm64: dts: rockchip: Add naneng-combphy for RK3528
Date: Tue, 24 Jun 2025 03:37:33 +0000
Message-ID: <20250624033733.50197-7-ziyao@disroot.org>
In-Reply-To: <20250624033733.50197-1-ziyao@disroot.org>
References: <20250624033733.50197-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_203955_357281_0EBF5B4A 
X-CRM114-Status: UNSURE (   6.87  )
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
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index a22db9d4b518..31b27096566a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -417,6 +417,11 @@ vpu_grf: syscon@ff340000 {
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
@@ -1085,6 +1090,25 @@ dmac: dma-controller@ffd60000 {
 			#dma-cells = <1>;
 			arm,pl330-periph-burst;
 		};
+
+		combphy: phy@ffdc0000 {
+			compatible = "rockchip,rk3528-naneng-combphy";
+			reg = <0x0 0xffdc0000 0x0 0x10000>;
+			assigned-clocks = <&cru CLK_REF_PCIE_INNER_PHY>;
+			assigned-clock-rates = <100000000>;
+			clocks = <&cru CLK_REF_PCIE_INNER_PHY>,
+				 <&cru PCLK_PCIE_PHY>,
+				 <&cru PCLK_PIPE_GRF>;
+			clock-names = "ref", "apb", "pipe";
+			power-domains = <&power RK3528_PD_VPU>;
+			resets = <&cru SRST_PCIE_PIPE_PHY>,
+				 <&cru SRST_P_PCIE_PHY>;
+			reset-names = "phy", "apb";
+			#phy-cells = <1>;
+			rockchip,pipe-grf = <&vpu_grf>;
+			rockchip,pipe-phy-grf = <&pipe_phy_grf>;
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.49.0


