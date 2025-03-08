Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB591C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 09:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TFa7CXmw53NrYMzYbEnq3O9rMYo0r/nZFaGkUGCqWE=; b=Ym07WreEvc+mx8VXcqTebtq4pT
	eWhNbHreBtkiNl+hC2zBRRFGcJFOcg/QI3hqM+V1HMdd0WdZs0eFrtTUiY5VYQP5dKbEfyXubQfs1
	FJue8nu1I3l3v2oKpZE+WJg7VYezqM+V7qklxyPYZ5KljK5h51up8tksjehyyLASek3shohNT7J8T
	9QdYzZVFFDOLzJn24wsyOf9UuXraMTK8gZNvaEx88Sd35ibOKEK1AJIEQaBanGiccJCMp0Aht9fMx
	ny/UyhdX+/PpZmAd7cxMFJ5z1N0fMTYVBq5VQojw0Fhv9B/AqfrRiguCGH+O2Lk/9pFy1MOq/q+tN
	k6OH0hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqYy-0000000GROn-0Zth;
	Sat, 08 Mar 2025 09:33:44 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqVh-0000000GR68-3za2;
	Sat, 08 Mar 2025 09:30:24 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:3300:217:f42e:f419:35e])
	by smtp.qiye.163.com (Hmail) with ESMTP id d88bc5ea;
	Sat, 8 Mar 2025 17:30:13 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
Date: Sat,  8 Mar 2025 17:30:08 +0800
Message-Id: <20250308093008.568437-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250308093008.568437-1-amadeus@jmu.edu.cn>
References: <20250308093008.568437-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTB5JVkIeGUIYGEhCGUlKQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUhIS0tBSUpMQR1PSR5BHU9KQkFITh5ZV1kWGg8SFR
	0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg++
X-HM-Tid: 0a95751741d903a2kunmd88bc5ea
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NTY6Gjo5DzJJFCksLyE5MT8f
	LUwaCgpVSlVKTE9KT0lNSUpIQk5IVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSEhLS0FJSkxBHU9JHkEdT0pCQUhOHllXWQgBWUFKQ0xPNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_013022_159774_20478EF4 
X-CRM114-Status: UNSURE (   7.94  )
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

Following commit b956c9de9175 ("arm64: dts: rockchip: rk356x: Move
PCIe MSI to use GIC ITS instead of MBI"), change the PCIe3 controller's
MSI on rk3568 to use ITS, so that all MSI-X can work properly.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 695cccbdab0f..e719a3df126c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -152,7 +152,7 @@ pcie3x1: pcie@fe270000 {
 		compatible = "rockchip,rk3568-pcie";
 		#address-cells = <3>;
 		#size-cells = <2>;
-		bus-range = <0x0 0xf>;
+		bus-range = <0x10 0x1f>;
 		clocks = <&cru ACLK_PCIE30X1_MST>, <&cru ACLK_PCIE30X1_SLV>,
 			 <&cru ACLK_PCIE30X1_DBI>, <&cru PCLK_PCIE30X1>,
 			 <&cru CLK_PCIE30X1_AUX_NDFT>;
@@ -175,7 +175,7 @@ pcie3x1: pcie@fe270000 {
 		num-ib-windows = <6>;
 		num-ob-windows = <2>;
 		max-link-speed = <3>;
-		msi-map = <0x0 &gic 0x1000 0x1000>;
+		msi-map = <0x1000 &its 0x1000 0x1000>;
 		num-lanes = <1>;
 		phys = <&pcie30phy>;
 		phy-names = "pcie-phy";
@@ -205,7 +205,7 @@ pcie3x2: pcie@fe280000 {
 		compatible = "rockchip,rk3568-pcie";
 		#address-cells = <3>;
 		#size-cells = <2>;
-		bus-range = <0x0 0xf>;
+		bus-range = <0x20 0x2f>;
 		clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
 			 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
 			 <&cru CLK_PCIE30X2_AUX_NDFT>;
@@ -228,7 +228,7 @@ pcie3x2: pcie@fe280000 {
 		num-ib-windows = <6>;
 		num-ob-windows = <2>;
 		max-link-speed = <3>;
-		msi-map = <0x0 &gic 0x2000 0x1000>;
+		msi-map = <0x2000 &its 0x2000 0x1000>;
 		num-lanes = <2>;
 		phys = <&pcie30phy>;
 		phy-names = "pcie-phy";
-- 
2.25.1


