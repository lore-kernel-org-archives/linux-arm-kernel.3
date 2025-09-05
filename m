Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C90ACAC580
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heghjJ1ZyKj3HH53+DkN1wBdADEuuQYiJXxp+teA+vw=; b=txLs9sza3L43viyO+1YiVwwDWx
	gKsteW7woJ0Ek8bMoX+PJ2W2DpIbea4VNqMsNspX0Tf60jD/JWTFW/hAzrvJsiSq8bvf1X08LvH3J
	jl2LtGcM5EcmnRbUS18V+jPGvvCrLMyUQcW4K2ghJRrM17ZOrT2GdaQfWdSn/ZmSFeNaOlbp0CqWv
	xMMCH5tcts1ylYbXkFprJWraVyTzIx50bQOvyrAFcf9o65v3o7e+ips0IK+5VfBAop2NS+KWLA+OI
	x+zjBe1+OhZqy4cWNDXe1D29BMXWSG7f3MqCR5oJ2BoTTOyH+ZFoptwiGcyJH6jDP1Z6C2k3rGsGF
	OfN1Bosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVK-00000005R2S-0XIn;
	Sat, 06 Sep 2025 00:10:06 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZAs-0000000341k-2Js3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1757089229; bh=heghjJ1ZyKj3HH53+DkN1wBdADEuuQYiJXxp+teA+vw=;
 b=u4TiicekGlyc8dbBjz1WG+I8rLZRjM92nRFF0fgws25MBCnifvbdT77TU01lKMbKweAmkuUQ+
 8rfTXwDLG8OnPz7R2Y+0juTc/qL+49FMKtd1dbUGofLDnfAYjT5f2kqStMShPg+3o4j/EV5Q2oR
 zujrrukQLlS955PTGDNsnaZHPBsGN9mNyfjHzyrPSjcr9C3cY4K1UwS+LZT9CBBk1JJ4j4yzFW9
 5rFTfWcYzdacdGS9+GxYYFh8JXkozD+CzO0GUoP0gFKzE9KG/kDNTA6pxZLvHw4zIt4AGmg6Gt7
 tacFlk3jhVJJ7bEIjzKgDGPjwDq5NR4h0XhHvpY2XTdg==
X-Forward-Email-ID: 68bb0dcb90d039a4fd84d728
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.13
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 7/7] ARM: dts: rockchip: Add vdec node for RK3288
Date: Fri,  5 Sep 2025 16:19:25 +0000
Message-ID: <20250905161942.3759717-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
References: <20250905161942.3759717-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_092030_721758_C4F27A23 
X-CRM114-Status: GOOD (  12.15  )
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

From: Alex Bee <knaerzche@gmail.com>

RK3288 contains a Rockchip VDEC block that only support HEVC
decoding. Add a vdec node for this.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- No change

Changes in v2:
- No change
---
 arch/arm/boot/dts/rockchip/rk3288.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288.dtsi b/arch/arm/boot/dts/rockchip/rk3288.dtsi
index 42d705b544ec..eab0c9a2d482 100644
--- a/arch/arm/boot/dts/rockchip/rk3288.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288.dtsi
@@ -1293,6 +1293,21 @@ vpu_mmu: iommu@ff9a0800 {
 		power-domains = <&power RK3288_PD_VIDEO>;
 	};
 
+	hevc: video-codec@ff9c0000 {
+		compatible = "rockchip,rk3288-vdec";
+		reg = <0x0 0xff9c0000 0x0 0x440>;
+		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_HEVC>, <&cru HCLK_HEVC>,
+			 <&cru SCLK_HEVC_CABAC>, <&cru SCLK_HEVC_CORE>;
+		clock-names = "axi", "ahb", "cabac", "core";
+		assigned-clocks = <&cru ACLK_HEVC>, <&cru HCLK_HEVC>,
+				  <&cru SCLK_HEVC_CABAC>, <&cru SCLK_HEVC_CORE>;
+		assigned-clock-rates = <400000000>, <100000000>,
+				       <300000000>, <300000000>;
+		iommus = <&hevc_mmu>;
+		power-domains = <&power RK3288_PD_HEVC>;
+	};
+
 	hevc_mmu: iommu@ff9c0440 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff9c0440 0x0 0x40>, <0x0 0xff9c0480 0x0 0x40>;
@@ -1300,7 +1315,7 @@ hevc_mmu: iommu@ff9c0440 {
 		clocks = <&cru ACLK_HEVC>, <&cru HCLK_HEVC>;
 		clock-names = "aclk", "iface";
 		#iommu-cells = <0>;
-		status = "disabled";
+		power-domains = <&power RK3288_PD_HEVC>;
 	};
 
 	gpu: gpu@ffa30000 {
-- 
2.51.0


