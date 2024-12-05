Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A8CE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 19:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Di8DczEBHjwOcuBRvbBXNrXWPxGBE+IJ9WKGx0ZYf0=; b=SOEVnnJlm9wZP/7bwnjuYc1HA7
	6PO1VKYialYWoKoNMQcqfIcTV08OUWELSkL0Mv8JAEPR8Js/hsqYfjzZNrlkxjB0zpURZ6WyNuGAX
	5Tc/rYaeGsVPX2x2VoB1Hpu5dsC+pXnneVxMKVL8951L/K/GFwk8NNzKgLzhizEhE6OLYxXSisbJr
	L1HsA8nUeC8Fb2gV72jVcblQUJKxx4597lFELTp86jZUKvdD89zkjiYg2jWnqRAx2Tb3CPbBwZ7Se
	M3/Rd2vuZG9jsj7Wr2wicU1zCq9JxsgPRPLJ/df7GZmPwj/XKV5UC0LDWLeS8ZQwCTPaAEeqPM905
	aXRdN0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHmd-0000000HExQ-2Zq9;
	Thu, 05 Dec 2024 19:45:07 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHjO-0000000HEQA-2mdm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 19:41:47 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44X80FnmzGpLp;
	Thu, 05 Dec 2024 19:41:44 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44X06TdHz2x99;
	Thu,  5 Dec 2024 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427698;
	bh=S+XF9CEtJz8Nknm8jOTFbwkWG8Xo+OeWyx4ohG4VJhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ktJxCgshI1qHvAXUjlPolw2LWmbwqb2qL06M1JwVkK9B2XKQwLWgnsXAWwKZbqPoh
	 WscCMMwOmJPzWrr8jpXENKYpszaNtyfpcHWwfjK0M7A6yjpY9cjmTJgM0+MTCz8Typ
	 OJyf4v5+KB/WFhG24V61+vfHbRnPBdgkAhNbim1awWPgBv2vWv20cjduFdLrgBm3T/
	 gtq/IrFPDeez0QEu2F1Z0JDXirxSoONYp7ak8uPBtxijiGzEbw3+sKz9ynrSNk6NmG
	 46YKJZLNTAB3kyTjuiC9Tj2mIJj+v1BhLCccrY1Cj3cwTiIQlrad21rUvhw5kQAg/I
	 X/W4QvtYjp2oA==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] arm64: dts: exynos990: Add clock management unit nodes
Date: Thu,  5 Dec 2024 20:40:20 +0100
Message-ID: <20241205194020.785846-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205194020.785846-1-igor.belwon@mentallysanemainliners.org>
References: <20241205194020.785846-1-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_114146_718796_646EB3B6 
X-CRM114-Status: UNSURE (   9.52  )
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

Add CMU nodes for:
- cmu_top: provides clocks for other blocks
- cmu_hsi0: provides clocks for usb31

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index c1986f00e443..49bb1e156843 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2024, Igor Belwon <igor.belwon@mentallysanemainliners.org>
  */
 
+#include <dt-bindings/clock/samsung,exynos990.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -199,6 +200,23 @@ pinctrl_peric1: pinctrl@10730000 {
 			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi0: clock-controller@10a00000 {
+			compatible = "samsung,exynos990-cmu-hsi0";
+			reg = <0x10a00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDP_DEBUG>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>;
+			clock-names = "oscclk", "dout_cmu_hsi0_bus",
+						"dout_cmu_hsi0_usb31drd",
+						"dout_cmu_hsi0_usbdp_debug",
+						"dout_cmu_hsi0_dpgtc";
+
+		};
+
 		pinctrl_hsi1: pinctrl@13040000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x13040000 0x1000>;
@@ -231,6 +249,15 @@ pinctrl_cmgp: pinctrl@15c30000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x15c30000 0x1000>;
 		};
+
+		cmu_top: clock-controller@1a330000 {
+			compatible = "samsung,exynos990-cmu-top";
+			reg = <0x1a330000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+		};
 	};
 
 	timer {
-- 
2.45.2


