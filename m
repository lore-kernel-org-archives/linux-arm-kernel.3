Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i3/ftGr0;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=eSWucYVB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ONPO9iv+gG/8/my8a4wsEXO1rhD3B0oGFhZA4jXD498=; b=i3/ftGr0zxymnQaemd8DJgBCB9
	4hXg22auG+PBhExn8rflAuihDhYVsFoDxj0jVq5hGVI4C5mBIriMs1SVp48jRGMJR/L0rr74wyyO1
	d7ZHENynBGaM/HezYRPn/T0NS6R8N/8THKT4DKUgn7rSIbejb7q/JNrM17tSBcQEMChjDonIrS70B
	G6V7vG3Rbtjjp2LbKJ+C8rheHfyqAcoGsLYQKgdAzC5/G5rYofq++ZqVEQhzmKCXdCkn+RPmbzYhz
	FM63DUyhq25p+d6hKO4Hf6ZR3Y66Ih6sZ8KCgJvcYrv7lmYg+0D7h8rxhVFH/Wl1GCu8MMAdoymiQ
	kTs1ngcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKBX-00000002XWP-1cwO;
	Mon, 26 Oct 2026 12:52:19 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKBV-00000002XUW-1IRb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:52:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DD01108493;
	Mon, 26 Oct 2026 13:52:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793019125; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ONPO9iv+gG/8/my8a4wsEXO1rhD3B0oGFhZA4jXD498=;
	b=eSWucYVBc5laiV8IH04jLFMhd1NqSSAgVFtoBYhzz8ofkfrMWNiTQScay55YlczBNsLLzJ
	NkCDA6A6AMVK50wEPUP4VnM4TV5eiFVgienl86d5xGXbMlPjQyJETeSyc1CemKKD0GKRBb
	f0wsWwV2mdC7KDSw5j7GEA93jiXGxlCU/7IBFGNTeHmBBprrVJUlMkWh9KL6Q/k5BMjcXN
	iO057G9cQcL0Imoi+xSqROEys44E+lxaRiG6oYhOdD9AFgAdNrhLBQLQMw/v0Rq/6O5pV0
	Wepe63+vL175llrR9nEo2NwiJxhDK6cdtWDq3OLmqfpQCnDw32O7HTanq2ZlKA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] arm64: dts: st: Move Bluetooth to USART2 on STM32MP23xx DHCOS SoM
Date: Mon, 26 Oct 2026 13:51:38 +0100
Message-ID: <20261026125201.76716-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_055217_626008_3388761B 
X-CRM114-Status: GOOD (  11.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Bluetooth chip is connected to USART2 on STM32MP23xx DHCOS SoM,
adjust the DT to match the schematic.

Fixes: 6642d6a47901 ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
index ffdcceb2fa237..5d4624c3200ad 100644
--- a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
@@ -24,7 +24,6 @@ &rv3032 {
 	interrupts-extended = <&gpiod 10 IRQ_TYPE_EDGE_FALLING>;
 };
 
-/* Bluetooth */
 &usart1 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&usart1_pins_a>;
@@ -32,15 +31,9 @@ &usart1 {
 	pinctrl-2 = <&usart1_idle_pins_a>;
 	uart-has-rtscts;
 	status = "okay";
-
-	bluetooth {
-		compatible = "infineon,cyw55572-bt";
-		brcm,requires-autobaud-mode;
-		max-speed = <3000000>;
-		shutdown-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
-	};
 };
 
+/* Bluetooth */
 &usart2 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&usart2_pins_b>;
@@ -48,4 +41,11 @@ &usart2 {
 	pinctrl-2 = <&usart2_idle_pins_b>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "infineon,cyw55572-bt";
+		brcm,requires-autobaud-mode;
+		max-speed = <3000000>;
+		shutdown-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
+	};
 };
-- 
2.53.0


