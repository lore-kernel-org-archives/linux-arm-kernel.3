Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2887CC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9l5G6RkfJNGl6CnVwssyReWh7AHu+6IehUiBWk/o3A=; b=trmQNib1r/28HlWNbbC7nf4YM+
	Qq7Mw488kyHk6ORXhiHcx8PVVUWNcym3gUl8uLcL/ghW7GrwFG0RssFWD92Po4scFO8ooTjtqbZOz
	a8hRO5Fs5v+ZSqqHtEJY9TSbfD2sNi4H9fAfbx1FlrF5w6Z1KWXB9/MS6rGP2idiV0cHXjnswQC8Q
	nhMWK1b9LOM6KFscYqjbSDQ6vfbgStBvP1o1Wb/Mj0DF34h4Fw+E1/8v9RBp0EFvtdkboItMX6/Ie
	RIizAwtf3IUo9LbFpZr5ZO3Ho07rKSpT23oxUJXzNCslFAj5JKpUphS8WB9Wuw6qwoQXhsDkMRqzv
	Rjfyisag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvY-0000000BjHK-1VXh;
	Mon, 10 Aug 2026 12:16:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvQ-0000000Bj0S-2fB6;
	Mon, 10 Aug 2026 12:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y9l5G6RkfJNGl6CnVwssyReWh7AHu+6IehUiBWk/o3A=; b=AmsSKSFYTgSFCUYJH/zy8wgr3k
	uLiBJk7my7X3P+DJlHu6S+vfQSlEpvg+CXx5WYv5r0WSl48BqvxMMKUTUBp5DbVvzrs2Mv2t75fFX
	r6zCBn9+izYM6l8oBXylwfxFrYe3YAwNVhTUn08PtCmMC6u4fbEOjsXaB3BurioOQbuYCEoirOmuN
	aVNTzNlhDjNEYeoEyVmre9nJ0JKgFRkDewmSnhwD7SF9Ni8j2JgDXeoxHDEqp/hoPYM9foT74hhjY
	dISaE5z2tfC47L1oYyhc2rCS0egI/N5GQZZfayvPcX8w2OFeEqe8pkhQKoo5YPvnDLJqvMZGUTzR4
	XBl/5bqw==;
Received: from mail.zlab.su ([109.73.193.145])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtOvN-0000000Dlr0-2aJx;
	Mon, 10 Aug 2026 12:16:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6506BC0519;
	Mon, 10 Aug 2026 15:16:05 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364166; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y9l5G6RkfJNGl6CnVwssyReWh7AHu+6IehUiBWk/o3A=;
	b=ZiAL5w2Ugmi20YSJg6mtqwFHgXOxL4/kYEDiVU/y3GghFCCs4p5DncpBLmVIRK4xA7Fohm
	vfho6lQLJJZqlTsZG4LkyEb8HvY/5sUttyFKPtr1ZTCLhEaaM4wk1nHM93xQ8TsmaYm9mc
	C8SfJUVp0lhWQ53GpKa5Ps8ai5SAbRS2dEc/AF3drcrHgcUKkHPXI42Z2m7J9mMOx+sd0R
	fvKiJejwy8YXO7ItjtjqL0dXDi+sfqs/XvcXo5zyH45gMvlBeFIxcRJENxnX3bL2bc65lr
	mnBdPfTFV0OzUlJbP1NDIUU5yZ3QsFSb+0Tvg88YP+DJlqjVNEDp03pENpR1Nw==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 12/25] ARM: dts: rockchip: Add I2C nodes for RV1106
Date: Mon, 10 Aug 2026 15:11:03 +0300
Message-ID: <20260810121121.210040-13-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_131613_842993_A29E4B0D 
X-CRM114-Status: UNSURE (   9.41  )
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

Rockchip RV1106 has five I2C controllers. Add the i2c0-i2c4 nodes
together with their aliases, using the m0 pinmux by default.

All nodes default to status = "disabled" and are enabled per-board.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 70 ++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 43db3b1dd4b8..43d992e3e2d6 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -25,6 +25,11 @@ aliases {
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
 		gpio4 = &gpio4;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
 	};
 
 	cpus {
@@ -155,6 +160,32 @@ gic: interrupt-controller@ff1f0000 {
 			#address-cells = <0>;
 		};
 
+		i2c0: i2c@ff310000 {
+			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
+			reg = <0xff310000 0x1000>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
+			clock-names = "i2c", "pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0m0_xfer>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@ff320000 {
+			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
+			reg = <0xff320000 0x1000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
+			clock-names = "i2c", "pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1m0_xfer>;
+			status = "disabled";
+		};
+
 		gpio0_ioc: syscon@ff388000 {
 			compatible = "rockchip,rv1106-gpio0-ioc", "syscon";
 			reg = <0xff388000 0x8000>;
@@ -204,6 +235,45 @@ u2phy_otg: otg-port {
 			};
 		};
 
+		i2c2: i2c@ff450000 {
+			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
+			reg = <0xff450000 0x1000>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
+			clock-names = "i2c", "pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2m0_xfer>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@ff460000 {
+			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
+			reg = <0xff460000 0x1000>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
+			clock-names = "i2c", "pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3m0_xfer>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@ff470000 {
+			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
+			reg = <0xff470000 0x1000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
+			clock-names = "i2c", "pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4m0_xfer>;
+			status = "disabled";
+		};
+
 		uart0: serial@ff4a0000 {
 			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
 			reg = <0xff4a0000 0x100>;
-- 
2.47.3


