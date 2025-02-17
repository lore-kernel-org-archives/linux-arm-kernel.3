Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12662C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 06:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yq5m0Vs+IbA5tS76mUyjcukPBR2/nmT4yZo11uEVqDc=; b=LxQHp2M0wbrXO/rqQdWI/5e8ow
	rmufMgm0OokxVnzRKbs3o9XWB7nOvf04NZUsmUMqpWvttp6w8hwfnRqSkcnZuq3HM824Hkcth0mHW
	yluCkSAy55C9ywYsI9SxFBto31/hPbZYeBA/CifIPse4RpYH5Fqb4obV/93MkuvXzJ+EUPCSNiCyb
	R5t1J3jbCziuyYQV78GM7AU0EA/Y5WMqf7jAAS6drsOcnPrGX/+TAFvLLu1REd4Rk14+G/U6n3Nza
	qj/6YSPd0y39yYDcTcK8DsiKyY4bMTFmZZ7+bmrTVmVUCuexDa0oeGSY6WRsOgdDoNh6OSpJRxCed
	5BxZz85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuXU-00000003T3G-4BgP;
	Mon, 17 Feb 2025 06:23:33 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuNr-00000003RYt-2beH;
	Mon, 17 Feb 2025 06:13:36 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E65C625B3E;
	Mon, 17 Feb 2025 07:13:30 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GR83PAvBYqGs; Mon, 17 Feb 2025 07:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739772809; bh=KL5LWq3tVG+rNZGNlilgz13R0OzrXLbjR5j5u9DTUSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FV7GwqZ0VXSCWqTPXo96NcjvgXQxs0uWMbycvE+ItZhmBdV7JroMmtyjzNluvGv0+
	 /r1/iw0Xj8cWN+x86B84mx5U5B+audILT9/7BX/1hjLwhQAP5afRN/hcg1Q6uLs9ic
	 j2aN/XMN1m8y0hpVWwHsu1wIAu0SiuWvkE5CaN723YCxcS+mJ9aKtmcdvwVFKYVLkx
	 Zwnol6vLuIfdj3KXgrlfsxY0EZ8NROWqPUCfLHY7dIthuCsQFDmTGk4dWfmVD8uaLp
	 bY/6k7tyyiCiubY9GQ/OeHeHSgtC5CEtlrCD0ptm0D4JFLt/Ivwrul+NqIjqehJe92
	 RGvuteT/hmewQ==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v3 5/5] arm64: dts: rockchip: Add UART clocks for RK3528 SoC
Date: Mon, 17 Feb 2025 06:11:46 +0000
Message-ID: <20250217061142.38480-10-ziyao@disroot.org>
In-Reply-To: <20250217061142.38480-5-ziyao@disroot.org>
References: <20250217061142.38480-5-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_221335_789182_E5D70AD9 
X-CRM114-Status: UNSURE (   9.32  )
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

Add missing clocks in UART nodes for RK3528 SoC.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 37fd40377076..5b334690356a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -168,7 +168,8 @@ cru: clock-controller@ff4a0000 {
 		uart0: serial@ff9f0000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xff9f0000 0x0 0x100>;
-			clock-frequency = <24000000>;
+			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -178,6 +179,8 @@ uart0: serial@ff9f0000 {
 		uart1: serial@ff9f8000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xff9f8000 0x0 0x100>;
+			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -187,6 +190,8 @@ uart1: serial@ff9f8000 {
 		uart2: serial@ffa00000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xffa00000 0x0 0x100>;
+			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -195,6 +200,8 @@ uart2: serial@ffa00000 {
 
 		uart3: serial@ffa08000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
+			clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
+			clock-names = "baudclk", "apb_pclk";
 			reg = <0x0 0xffa08000 0x0 0x100>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -204,6 +211,8 @@ uart3: serial@ffa08000 {
 		uart4: serial@ffa10000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xffa10000 0x0 0x100>;
+			clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -213,6 +222,8 @@ uart4: serial@ffa10000 {
 		uart5: serial@ffa18000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xffa18000 0x0 0x100>;
+			clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -222,6 +233,8 @@ uart5: serial@ffa18000 {
 		uart6: serial@ffa20000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xffa20000 0x0 0x100>;
+			clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -231,6 +244,8 @@ uart6: serial@ffa20000 {
 		uart7: serial@ffa28000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xffa28000 0x0 0x100>;
+			clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
-- 
2.48.1


