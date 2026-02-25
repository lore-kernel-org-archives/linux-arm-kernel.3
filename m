Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598B0FD376C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2DYSbFgAcKwW+hiNqGZwACsRe8F9Rpx5pS8RmxrVpo=; b=Ugy+sDOQlSteQAUjGy2iUJ7VZk
	mjM8W24cjxgDnbg9iLkoOBqWmwzz9Tr2K/JOt1G0u4Z/ijvQ5x+bfRxACyuxnviBf6GlLHsPshhB+
	RnWrQ6Z4r/ERQ5YQfb0vcA3IaLhhsYdm2UMgV/1FaLS/yLuhusQPt5TBS18O8vmyj8vTPb0BkrdbB
	bsIS4+H3Qj2Bfek1gTP/geaYCvAnPOoxe6xKjpAYca+Q6+E1CTMcpFInV+pWZKcHoJJhnQcDpfFvi
	F/NuArnZsR9G4646Y/G29EoN5XKH/mRiBk4frxTvMaZCG7+EC7JUsf3kxE69JpYfhhK4tm0emxg51
	eu3zOSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHRQ-00000004S47-1cYs;
	Wed, 25 Feb 2026 16:08:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHRH-00000004S0S-2sh9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6641444FA;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3497FC4AF0C;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035718;
	bh=eLvucCb55GuE8Q5tfT8jNQeAspRn+aiAF7vdpEhbIZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rR1fiPxfb8dTk5Vty4dou+2INGLQKdOCV9FO+iERkK+ZoqQo6BcoJ9H5z0qx9L8el
	 9L1wpXPhloRfG7BKm7swbMZC6b5fGq6hCzVzkhI1XUTaA1ggKuTQPjYekfXH+0wOaY
	 PKFdIHUot6jzHKRRnywfhFELKgJzqevmVstGREgwqDsUkMrQ3A9r36mKzRyNvtaGdE
	 kS8kOO4V6+RbEUCj8lCW3lWCqNf1xFZBcqWXzG+Ho2lzsZknF1PfMKMj397+FXgXcX
	 MQ5AlIvMgN25VPdaGL5sKzxg1TE3Q6DfYpCAFvZpfqIw7rxWKc+yu5ktSi4yTkwrgt
	 cCtMwOnDAmP0Q==
Received: by wens.tw (Postfix, from userid 1000)
	id AFD005FF06; Thu, 26 Feb 2026 00:08:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
Date: Thu, 26 Feb 2026 00:08:25 +0800
Message-ID: <20260225160828.1687643-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225160828.1687643-1-wens@kernel.org>
References: <20260225160828.1687643-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_080839_749408_01BECC96 
X-CRM114-Status: GOOD (  12.17  )
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

The A523 SoC family features an LED controller that is identical to the
one found on previous SoCs.

Add a device node for it, and one of the possible pinmux settings. This
setting is used on the Avaota A1.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 09bd149bbf51..b8263e2872af 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -170,6 +170,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ledc_ph_pin: ledc-ph-pin {
+				pins = "PH19";
+				function = "ledc";
+				allwinner,pinmux = <5>;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
 				allwinner,pinmux = <2>;
@@ -300,6 +307,21 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ledc: led-controller@2008000 {
+			compatible = "allwinner,sun55i-a523-ledc",
+				     "allwinner,sun50i-a100-ledc";
+			reg = <0x02008000 0x400>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LEDC>, <&ccu CLK_LEDC>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_LEDC>;
+			dmas = <&dma 42>;
+			dma-names = "tx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ths1: thermal-sensor@2009400 {
 			compatible = "allwinner,sun55i-a523-ths1";
 			reg = <0x02009400 0x400>;
-- 
2.47.3


