Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DB1C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Am0NLocsWvONNqEB/DzW4Db9kldaVkSiNfu4dGHoSWg=; b=mBoOi7HKxRHJZgR9NKGLHhjMLg
	QWcvqDs1o1rX3eJgBtErJy4DyQTPejcQzfhCf9yRkXnUcrq2J+zcM54+My5r56jwSlBsg3AF45304
	mL53QZnfA3ipPr9183KPleYHwSnBOXl5LAgl3J0xXOHuLNc9t1YLF73Z3pKvc8ZJ+1/AXWNgdesmc
	mPmxuJLRrYZeKgaqWoIDuUR7tsqNdIc3HMC/pzhl0g0jMwCXOcxBx5kgu2KpJsRxudHzWG8q8kkXi
	BL0ZEQ2Rxp/q9oKbTZN/p3xq44fkn/R4p/7t+zyolLx86FufKPNHAN67WLTzxCQU85YEOJsXoAXnM
	eHPh5jhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SO-0000000EfQm-1nrB;
	Tue, 07 Jul 2026 09:51:12 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SG-0000000EfKk-2XqT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Am0NLocsWvONNqEB/DzW4Db9kldaVkSiNfu4dGHoSWg=; b=He5dCxqhjlUXTlaQBa+4Pc+XvC
	TOgp486rZa2jnRW/r0cB/iGt+pFsZUdxW2Mdzp9rjZPLAqe7Jgk+QQdyPs4Vk9pZOOIJ0xQZvwCTK
	WQrCySH0bxJvvI+B5a32cNpE34HhSHDhSwb5NwT4HTcELzKyoliuqeQj5vJewsUU+5PSeEAKKH5eX
	gJRYZLCKNbAHCkW/XE1BY7rDYH10YnBrlQKGupwDNDbpm8tNwRWGbQ+3yua1Cz0fTbMjUz8wNsETl
	dzzQ0iofS20UCIv7wFyOBNaCNBE2hXSCW+QFarqUu9UT+TD4fxEQKlEh57nqU651QvfeLd9oaAOi9
	fUSf8cYg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SE-000PWj-3B;
	Tue, 07 Jul 2026 11:51:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SE-000Ck1-1A;
	Tue, 07 Jul 2026 11:51:02 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: specify Ethernet PHY reset GPIOs
Date: Tue,  7 Jul 2026 11:50:53 +0200
Message-ID: <20260707095057.1745867-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
References: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_025104_645306_A79697C2 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Correctly describe the PHY resets.

While the TI DP83867 requires only a 1us reset pulse in RGMII mode, 2.5ms
are needed for SGMII, where series capacitors would result in incorrect
sampling of strap pins if they don't have enough time to discharge.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index 46a9fdc92bb56..687fd0d62235d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -106,36 +106,59 @@ &dpmac18 {
 	phy-connection-type = "rgmii-id";
 };
 
+/*
+ * Assert reset for 2.5ms on SGMII PHYs to let capacitors discharge before
+ * strap pin sampling
+ */
+
 &emdio1 {
 	status = "okay";
 
 	dp83867_1_1: ethernet-phy@1 {
 		reg = <1>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 1 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_2: ethernet-phy@2 {
 		reg = <2>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 2 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_3: ethernet-phy@3 {
 		reg = <3>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 3 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_4: ethernet-phy@4 {
 		reg = <4>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 4 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_5: ethernet-phy@5 {
 		reg = <5>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 5 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_6: ethernet-phy@6 {
 		reg = <6>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 6 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 };
@@ -145,16 +168,25 @@ &emdio2 {
 
 	dp83867_2_1: ethernet-phy@1 {
 		reg = <1>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 7 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_2_2: ethernet-phy@2 {
 		reg = <2>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 8 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_2_3: ethernet-phy@3 {
 		reg = <3>;
+		reset-assert-us = <1>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 9 GPIO_ACTIVE_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
@@ -162,6 +194,9 @@ dp83867_2_3: ethernet-phy@3 {
 
 	dp83867_2_4: ethernet-phy@4 {
 		reg = <4>;
+		reset-assert-us = <1>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 10 GPIO_ACTIVE_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
-- 
2.54.0


