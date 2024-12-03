Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0162BE6C617
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/jJiIHjvkiB22PNCi4eNueXPhKpos4iBXIHr+E1TmA=; b=RbpMTpd98JL1mscI3+KjWC8hhA
	3fBw/W9RL79eXJ4++NqBujjcwz47X+EaxU88fET6eHmYIfP0uiGUw3UXnqt33vB+tuGb5TG2GUbcV
	QrXUtJixAL6SuXEZ5q9F1lKziIQ9F/mGpFjmXYHr4juAWJxc/dfS5NT/s2YHr6vqWz8q/HSUtwkkg
	OrDhgeikvv/muB7KF/K8XhZJspKNPkjprYlFYin85n61uWWhoAZqjeLzAxlSe3hkqDxfSoLV6iQ2a
	+fqJH6lV0lJuA0Do+j+AZe88pCPst3Allv4QeJadjm+Ry4xc5ypwd7vVOjHxRxrbn5tq70M/koiUN
	0SClYRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINpL-00000008bhM-0New;
	Tue, 03 Dec 2024 08:00:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINnK-00000008b7D-0eiL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 07:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E21E5C66DF;
	Tue,  3 Dec 2024 07:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FFF7C4CEE2;
	Tue,  3 Dec 2024 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733212684;
	bh=2F5Ap5T1lB8u5tqM6pAXUZmDBikyRGGz4fFHNUYaWKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kiav4+IjjJJMxmeDjtda1IXOK++k4ehpuUE601mm87dp1q/QV6ZodFPpvuYvKnj3G
	 Bx2tDwFmtv7P1XBv6iHOSrYGbeKjcWY2RQInnFZ9KzacwpCkBf1eMZ1N8NjGUL5F9s
	 /jWV+ty0YtZlOqXet+45RoVRfOh8lRzCmPhSGiGtRLXg+6kqbh+W/Wp13eHOdsY6J7
	 KzO8SmNAy4ZldSK5AmqCpQEEAz4+qLZD/FTeZsy/I7BJ+45bfqMr11xbu4oSc2Wxlh
	 Vn8U241Upz1sWVz6EDC/sWLctjMAd1kFz5q5GU/OM5ez3PhEIxPEqiheCM3mWGp7MI
	 YDSRjLhuDlQiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EBCE6C617;
	Tue,  3 Dec 2024 07:58:04 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Tue, 03 Dec 2024 08:57:59 +0100
Subject: [PATCH v2 3/5] arm64: dts: apple: t8112: Add spi controller nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-asahi-spi-dt-v2-3-cd68bfaf0c84@jannau.net>
References: <20241203-asahi-spi-dt-v2-0-cd68bfaf0c84@jannau.net>
In-Reply-To: <20241203-asahi-spi-dt-v2-0-cd68bfaf0c84@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2929; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=AHySIPwyOhxDcF5B5Lzvbynlqb4i9BPBB11Y3mPxE4A=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnS/XVzn3NQCKjdNN0yfwnZ7UpHptNoJ1xvCUvKub33Zt
 /OxhseSjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABPZq8TIMOlxywQ/nzt9UUt1
 KzvkjjJs7La63MK/THbP2Ts7OmboLGFk6Pp7i82f/V/RHxujqVy+yqYP97Cl719WMKvR9FvbcXd
 nfgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_235806_283404_5DF2E7E7 
X-CRM114-Status: GOOD (  13.19  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

Apple silicon devices have one or more SPI devices. Add device tree
nodes for all known controllers. The missing ones could be guessed and
tested with a little effort but since the devices expose no pins and
no new devices are expected there is no point in spending the effort.
SPI is used for spi-nor and input devices like keyboard, trackpad,
touchscreen and fingerprint reader. Only the spi-nor flash has upstream
drivers. Support for it will be added in a following commit.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 44 +++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..58d88f1ef92a32061765bd3b569fdae0255dcd7e 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -349,6 +349,13 @@ clkref: clock-ref {
 		clock-output-names = "clkref";
 	};
 
+	clk_200m: clock-200m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+		clock-output-names = "clk_200m";
+	};
+
 	/*
 	 * This is a fabulated representation of the input clock
 	 * to NCO since we don't know the true clock tree.
@@ -467,6 +474,34 @@ fpwm1: pwm@235044000 {
 			status = "disabled";
 		};
 
+		spi1: spi@235104000 {
+			compatible = "apple,t8112-spi", "apple,spi";
+			reg = <0x2 0x35104000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 749 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_200m>;
+			pinctrl-0 = <&spi1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_spi1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi3: spi@23510c000 {
+			compatible = "apple,t8112-spi", "apple,spi";
+			reg = <0x2 0x3510c000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkref>;
+			pinctrl-0 = <&spi3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_spi3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		serial0: serial@235200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x35200000 0x0 0x1000>;
@@ -626,13 +661,20 @@ i2c4_pins: i2c4-pins {
 					 <APPLE_PINMUX(130, 1)>;
 			};
 
-			spi3_pins: spi3-pins {
+			spi1_pins: spi1-pins {
 				pinmux = <APPLE_PINMUX(46, 1)>,
 					<APPLE_PINMUX(47, 1)>,
 					<APPLE_PINMUX(48, 1)>,
 					<APPLE_PINMUX(49, 1)>;
 			};
 
+			spi3_pins: spi3-pins {
+				pinmux = <APPLE_PINMUX(93, 1)>,
+					<APPLE_PINMUX(94, 1)>,
+					<APPLE_PINMUX(95, 1)>,
+					<APPLE_PINMUX(96, 1)>;
+			};
+
 			pcie_pins: pcie-pins {
 				pinmux = <APPLE_PINMUX(162, 1)>,
 					 <APPLE_PINMUX(163, 1)>,

-- 
2.47.0



