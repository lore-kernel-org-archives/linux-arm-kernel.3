Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4CAC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 01:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJ3bKwcyB7ptCjFnxYzYbWXHilW0QPTLoxB6wvOt2lQ=; b=HBoN+Kwk/43kYFdJNIDjS4SVyd
	3e7BDU7yMs8m7dD5LdWueOGDcxPJkh5WKEU7K02GoZ9aEttIkQciVzl72lAVog5ghtszqU7eBNGNT
	ByS6eNSSXajSzQ9Y0XkybW5gzv7SKgU647uIyfoGd3B2uoyut2EGHOWAYauk8Xeml4fkVv4b5ZeEe
	yV1t03vWl0Gkmct3BpMeuUKo7uNZA1o6WG/sTgRazJ7O3/ymDTcKOUcBBs74O+JKjt8aJSDNT/JIW
	Uc4xEdJ+qsHv63P8X7coV+bvy1PJV1jWDB2cUq+5sBxiwWPfUzg6lJvwbWEFwhXdf6RoCzl9N9Xcb
	7zGzpLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3kua-00000007u7R-1L2j;
	Tue, 08 Sep 2026 01:46:12 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3kuW-00000007u6t-38Eo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 01:46:10 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-86265451beeso1869184b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 18:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788831967; x=1789436767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJ3bKwcyB7ptCjFnxYzYbWXHilW0QPTLoxB6wvOt2lQ=;
        b=iOxFgJT1DoCAy5G0CBNprR+sFk4ps1/AGH6arB/2IcLHy2c+cN04eRHpQziVuJc0JC
         fRYWuoLy1ISASr4oLor+UwGHIj5LG/6ZPF4jsVjzI3OzMjU0Zc4TZwdNDkOo8DF8P9oP
         rEvr6wYRi9SCSMBBl12C25XC/es6MxHIY00R9wPHPQH2/KhHn9f0Gcfm+zSAxqlRZGIp
         WZ2Ai/JlxcVDsXVvml5Y6W1CXeE2JJqerrt05bSPQ6olE60OZYTT3Uo0Q0fjTUf7wlh1
         NR4waQQMdhDLgDUt27BySOoO6BjUPE+iUsecz/5Q1FPJwme5qoLELMWxQ9O0xUH1lviQ
         X/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788831967; x=1789436767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ3bKwcyB7ptCjFnxYzYbWXHilW0QPTLoxB6wvOt2lQ=;
        b=VwQZdWNAdpmxV/NzVM++OdxCBDx3w74GB+/tFt24ytiMK4SR2AtG+w6vUZ6jal0DQW
         nV1heyZP/peQxFrJHsV68BPxv7BxyD9/sMxGsivW/lNqDP366Gpe4kmj5Pvm46/Js+wi
         y33DlOu7wnMxtj9DKMLLxWPWw6/Ly6ETcdiE6D/L4Juwi8XCBe4iAH9YJz6opF4CN7M9
         eXT0k3L59Kvh9IvFJl8WyAK79erkET1gTRhTJA7z91plq1HNNW6zylTpYkZ0zbDyhgLx
         CzU50BzQm/C8FYKwiY+iK1iBD9gvY4A2k6rRslgig/PBosGynImzfiJou7wdwqEr11TN
         a+9g==
X-Forwarded-Encrypted: i=1; AKwUvBziFsC217VSU4rpuyKajaibWrVt7jwJwoFR+uDiTXVXTQ0bKfX88kcnzfbuRdyQiUNRhzTn6IsvnxdCa/RNuG1X@lists.infradead.org
X-Gm-Message-State: AFuF++nypn7YcM3+naQ8ySfEIb8dtVskjosF7aB+/+Nr98d7PsiqDhy4
	VKxwvzuGG6fYpwOP1ll8tSL2lClesHypwRI38J4lu3Y2I7ttG2IfKKWQ
X-Gm-Gg: AYBFou0BasZDgoVAMTB9hGGGyMpd/dQI+T1J+0dRoWzpHr2USVhTceFIUDCmtatCkum
	f0U+NJUlRc8csUZtuZaji/RxhtIloNlq0AY8Ca4pemPfjgb2tX1AXbrl9ADnuO81cltuxVF4jX+
	nD/v9C4LT5o5kl47bWIWrbHHrVW6SU+EBPMuVEriG6gxzbLQvztgurPv8CwQrn+aFTgfLY4Y3sB
	1U5kPH6hg/EYHhA+wJf3oOZcpC6Uy25ehk5gDA9WchuxSzlPfEP859BZ3cvQYXg3r8SZS6U5mGx
	0lXAyGgHudpKTVye6bsz+JTErJ5JHY8cJY/EuSIHAi5Qh3HOsLpoC6HhJ2jca/n8QVUXnbYj3Lu
	D7Ks3l6DYvETiVMN98AbOtBoIqaQi2/ayMOZ2TbMeXnzsdYAVugaUfeYQbKM4e+3QxUtz3RGOVh
	1vXddb47CLSr0ROtoEOCuiiapDU20O1ZBmqPeVa9NQYFtFKRsh1QFFud7A5OKZR/jV3GRohdh2w
	99RB7s/eCKhC0vf0h9QKkKQM6H3SAvhCRyMxiN7c8KODQ==
X-Received: by 2002:a05:6a00:600d:b0:847:99bb:b6d0 with SMTP id d2e1a72fcca58-86168591720mr39700598b3a.15.1788831967118;
        Mon, 07 Sep 2026 18:46:07 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8633cc0f7e2sm3142089b3a.37.2026.09.07.18.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:46:06 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mkl@pengutronix.de,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Tue,  8 Sep 2026 09:45:26 +0800
Message-Id: <20260908014526.413399-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_184608_792849_3091F4D3 
X-CRM114-Status: GOOD (  12.60  )
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

Add controller nodes for the four Bosch M_CAN blocks found on the
Nuvoton MA35D1 SoC.

Additionally, configure pinctrl and enable CAN1 and CAN3 on the
MA35D1 SOM board. Also, update the APLL frequency to 160MHz to ensure
the CAN controllers receive the required input clock for 80MHz operation.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
v3:
 - Change CAN clock to 80MHz and APLL to 160MHz to use a higher multiple
   of 40MHz, as suggested by Marc.
v2: 
 - Move assigned-clocks and assigned-clock-rates configurations of
   CAN_DIV from SoC-level ma35d1.dtsi to board-level ma35d1-som-256m.dts
 - Update APLL frequency to 200MHz to ensure the CAN controllers
   receive the required 50MHz input clock.

 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 +++++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..7bed0287e256 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -37,6 +37,22 @@ clk_hxt: clock-hxt {
 	};
 };
 
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+	assigned-clocks = <&clk CAN1_DIV>;
+	assigned-clock-rates = <80000000>;
+	status = "okay";
+};
+
+&can3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can3>;
+	assigned-clocks = <&clk CAN3_DIV>;
+	assigned-clock-rates = <80000000>;
+	status = "okay";
+};
+
 &clk {
 	assigned-clocks = <&clk CAPLL>,
 			  <&clk DDRPLL>,
@@ -45,7 +61,7 @@ &clk {
 			  <&clk VPLL>;
 	assigned-clock-rates = <800000000>,
 			       <266000000>,
-			       <180000000>,
+			       <160000000>,
 			       <500000000>,
 			       <102000000>;
 	nuvoton,pll-mode = "integer",
@@ -56,6 +72,20 @@ &clk {
 };
 
 &pinctrl {
+	can-grp {
+		pinctrl_can1: can1-pins {
+			nuvoton,pins = <11 14 4>,
+				       <11 15 4>;
+			bias-disable;
+		};
+
+		pinctrl_can3: can3-pins {
+			nuvoton,pins = <11 10 3>,
+				       <11 11 3>;
+			bias-disable;
+		};
+	};
+
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
 			nuvoton,pins = <4 14 1>,
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..494724a25f3b 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -244,6 +244,58 @@ gpion: gpio@340 {
 			};
 		};
 
+		can0: can@403c0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can1: can@403d0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403d0000 0x0 0x200>, <0x0 0x403d0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN1_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can2: can@403e0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403e0000 0x0 0x200>, <0x0 0x403e0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN2_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can3: can@403f0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403f0000 0x0 0x200>, <0x0 0x403f0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN3_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
 		uart0: serial@40700000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40700000 0x0 0x100>;
-- 
2.34.1


