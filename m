Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D902C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 21:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKsUHHGH/SII730m2DtTgjJ0hYE983TDVtK6awQQBNM=; b=StRKgJTb9qaZIC2PzMtl07ZOFV
	a3yIOQJUqlpCrkgF7R0eKkJ4MFSrvNMrOyJCCCbIUyUnRdky1VIKo7U+T/cRHsLr6aLE+86Vy/W8/
	TAFMMS1JWBhrw1ZOuKKgjFM1CbGvCmXxDQNrBQae5kmcAH+8JIFaYQNyaPwrd+qmWJpW2gowF7bxd
	PI1MORnhD14QfYeWLH5iR9SbwUTvqi9bLUN49feSKd8nB8umUS+5DpFPo/7Pw7n4YXk44M5W1VcRI
	9kElz173F7TPVJ1uVpypYxdLCvOXLV7BHSXZEHWGVzI1nkX3ScBfXGsn7yAQ8JCXqe9SU27JYlmD8
	sEXu2q3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepo-00000006t5e-10HO;
	Sat, 11 Jul 2026 21:02:04 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepi-00000006t0N-08gR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 21:02:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 800B111984D;
	Sat, 11 Jul 2026 23:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803713; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FKsUHHGH/SII730m2DtTgjJ0hYE983TDVtK6awQQBNM=;
	b=JIKUv9Qw6FRXnOuL5Z1N+Hy8bYD1Z+NiLmyTYNl1GUVcJdd2tSeMmXf7fbZY06mb1MF+IS
	y2r4YDPj8veMp0iLkufZW4q1uoje0dwSGugrb0O4jBfXNXB8ur7QbaCL0rWWPfWu/ZR3Y6
	s1mOujyzLb2OgFVP4dnPoJmduWxZEAEpcLwPW/m4RqWTcGFiaz+klVCp8pgjU2Ie2JHkMo
	+6rane4Dqv8lqAZOqIEhr4v16p65f3ujNwa0fdhnQGsizxpiyLE3BkB1nLZmoZSjvWCijt
	vMY7lNhFqS1WNdf200ipRTenl3enjVxwXyE2RVJ6WgXAUZCTc2g5Hsjadwjw2Q==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 07/10] arm64: dts: st: Add OMM node on stm32mp231
Date: Sat, 11 Jul 2026 22:59:36 +0200
Message-ID: <20260711210131.236025-8-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_140158_229501_EF0A3835 
X-CRM114-Status: UNSURE (   8.88  )
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

Add Octo Memory Manager (OMM) entry on stm32mp231 and its two
OSPI instance.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index d70812f094142..4505fc0e3b537 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -222,6 +222,60 @@ hpdma3: dma-controller@40420000 {
 			#dma-cells = <3>;
 		};
 
+		ommanager: ommanager@40500000 {
+			compatible = "st,stm32mp25-omm";
+			reg = <0x40500000 0x400>, <0x60000000 0x10000000>;
+			reg-names = "regs", "memory_map";
+			ranges = <0 0 0x40430000 0x400>,
+				 <1 0 0x40440000 0x400>;
+			clocks = <&rcc CK_BUS_OSPIIOM>,
+				 <&scmi_clk CK_SCMI_OSPI1>,
+				 <&scmi_clk CK_SCMI_OSPI2>;
+			clock-names = "omm", "ospi1", "ospi2";
+			resets = <&rcc OSPIIOM_R>,
+				 <&scmi_reset RST_SCMI_OSPI1>,
+				 <&scmi_reset RST_SCMI_OSPI2>;
+			reset-names = "omm", "ospi1", "ospi2";
+			access-controllers = <&rifsc 111>;
+			power-domains = <&cluster_pd>;
+			#address-cells = <2>;
+			#size-cells = <1>;
+			st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
+			status = "disabled";
+
+			ospi1: spi@0 {
+				compatible = "st,stm32mp25-ospi";
+				reg = <0 0 0x400>;
+				interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&hpdma 2 0x62 0x3121>,
+				       <&hpdma 2 0x42 0x3112>;
+				dma-names = "tx", "rx";
+				clocks = <&scmi_clk CK_SCMI_OSPI1>;
+				resets = <&scmi_reset RST_SCMI_OSPI1>,
+					 <&scmi_reset RST_SCMI_OSPI1DLL>;
+				access-controllers = <&rifsc 74>;
+				power-domains = <&cluster_pd>;
+				st,syscfg-dlyb = <&syscfg 0x1000>;
+				status = "disabled";
+			};
+
+			ospi2: spi@1 {
+				compatible = "st,stm32mp25-ospi";
+				reg = <1 0 0x400>;
+				interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&hpdma 3 0x62 0x3121>,
+				       <&hpdma 3 0x42 0x3112>;
+				dma-names = "tx", "rx";
+				clocks = <&scmi_clk CK_SCMI_OSPI2>;
+				resets = <&scmi_reset RST_SCMI_OSPI2>,
+					 <&scmi_reset RST_SCMI_OSPI2DLL>;
+				access-controllers = <&rifsc 75>;
+				power-domains = <&cluster_pd>;
+				st,syscfg-dlyb = <&syscfg 0x1400>;
+				status = "disabled";
+			};
+		};
+
 		rifsc: bus@42080000 {
 			compatible = "st,stm32mp25-rifsc", "simple-bus";
 			reg = <0x42080000 0x1000>;
-- 
2.53.0


