Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EFDCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 01:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iIPw2Ul3tsPc2bxto6n13tf9Lx1PY2MWkQj5XztoNyM=; b=ux/zvUVszJ8Jmk8FZuObLOY4Pv
	RVQ4e3onseszluxw1TPXupT2UHPr2ujnqvv91FpgJ3mzczhtWUTG/q/GeGiyX3DLtrZQDSbLzwbm0
	bEuGXe6Ro71fpt93S+URXTs6xTuDaEpRwJ3JwLwvv72YgiYTsZ0/W0CrwOKUDo3HHrxWZIR2kxnrl
	mKrC2wmwL1uIU1KArBKnNI6b4J+ToxVQS64WPTaEM37q1vcUHRR8HbJVRhBVODB5NB0qqMXHfj7Mt
	uB+hxvybpSkYcDzwiJwK4oMjtonPSB5q+XyUK/6GkpvBFth5+ne60c1yXZkltKG043uE2SNDITWEM
	FIup2gGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOLr-00000002fNj-39EO;
	Mon, 08 Jun 2026 01:00:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOLp-00000002fNH-2527
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 01:00:26 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bf18c30bb2so24840315ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 18:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780880424; x=1781485224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIPw2Ul3tsPc2bxto6n13tf9Lx1PY2MWkQj5XztoNyM=;
        b=a2JNHIMcfgyKPYM2+uAe8KUQHz9fUel9kZttjQosEQwLs0unBVnxF4hbaikhP+6VO0
         NTK3YxViy3d29+/aqF6cgA03Y52hJ6T6p1H4jTfxRrIifwWzY6KcMDnVuqaZE4LF5vcq
         BKDogShB9A9rYZKVnU7HBsYoEe5zKgUnhP7qJVxK6wQLOqYelZl33wvP28uS5ZFrB/24
         PHZktcJi+A4xuAOmnYNIxlejBsQ3NavimpiqgSh15QG+N3HfPkqrcykHvcjXVPnLdIqu
         W2yQJ6u2NTRtt9w+l4DKEYDVXo3Aec79Li8snVNVwMnjshL29P7zth1HgWx6Ksy0MaCm
         dDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780880424; x=1781485224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIPw2Ul3tsPc2bxto6n13tf9Lx1PY2MWkQj5XztoNyM=;
        b=anecKeW3naoj9VipmDMUSNymggvo2Gn8fb8ntBvlUR4CJeovUM0i/47EiK7YXZVr/S
         dyAyxAo6wkZ8K3eeUIstX6HUKfxybzEg1eR/yaQnubCFNGMNucoxL/XDQLf0y+mepYyZ
         OP6v7TNiYOZllurCK3L9Vv5HhFfAK3BXStXXVu9rbF8pS7oJ0dche0hHVFhdq0AJot5U
         bKsL7vk9SUFHojLVg4/d9oGeeGgdx+6HRUpIWAkP6WXqXgQymZNXPRsbLJWMWJXmPUft
         9xLjBk4jPV0Z4VxFmWD0LVhKzT1kFV/yUJbWE/6h1VHVUh8PeQVsw1OaKsP8lVl9VePm
         ZIqg==
X-Forwarded-Encrypted: i=1; AFNElJ8kTgjnC7ZYsGJu7EMzIXGtYKttQ60S78YSKVb0DLwo9mWa5ATwzViiu902CF7qhUYXNAVxD2JMpZylojmzkzeW@lists.infradead.org
X-Gm-Message-State: AOJu0YwSlZgtYpv3hMQZYHmVSm/e90wcnCzrgtT6MrZfmvqhJtMPD8yJ
	+agpoCByTiL5pg0VdqhDy+++sPQYupx9popUyLKUIfIwJXIi+MGR6AcV
X-Gm-Gg: Acq92OE4sQ+rdU1P+DN7sM9zqSrefC9zz1ER0TsZohszH+ldPkRBtHPio0zSNEbvvlZ
	p30mA8r8/Vj4QSE1DI410nFGCNVCjHVu2XyoLgsrUSaiSOuAxAuHz9V7WnIMKw90f+w8hZxB8uF
	foVzrestZGm0H09G2pIXZestcDBO5idDMCdJuhdwwHbMX0wAMnE4Loq03R7pCxoig8Y0l9f249d
	c88JQSuia3hiCOoWCPiWo7U7LEGNYhFmuS/6fwqGTrDm10UAE3juRK40R23WuKEL1v23Qk9crEV
	4PzSU14QrvS1Mw/tU7tjZEJWAjuor5r8QJkhLFT21/it9TRb8XBcExZJuaeRJp6z8IN+8nJw09D
	uicqPV6IzwJ7MY/pDdQ0yqIQ9qUUUcJzmbadb6dEtSTzhSkHqreQvaYBIL4ivKg7z+1AHk0/JeF
	nf5zlTA4tgW2MU2AXyMiYE9Cb+oq3qjLjwCEILWeamaikJH+0xcGJqp6lK3KIL+zOmDzly+LrT9
	XBUT3RrAWAwBpa8JF7l
X-Received: by 2002:a17:902:f608:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c1e881fd52mr142085415ad.22.1780880423815;
        Sun, 07 Jun 2026 18:00:23 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm156772795ad.73.2026.06.07.18.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 18:00:23 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v2] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Mon,  8 Jun 2026 09:00:09 +0800
Message-Id: <20260608010009.3389558-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_180025_546533_FD19DBCE 
X-CRM114-Status: GOOD (  11.51  )
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
MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
the CAN controllers receive the required input clock for 50MHz operation.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
v2: 
- Move assigned-clocks and assigned-clock-rates configurations of 
  CAN_DIV from SoC-level ma35d1.dtsi to board-level ma35d1-som-256m.dts
- Update APLL frequency to 200MHz to ensure the CAN controllers 
  receive the required 50MHz input clock.
  
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 +++++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..fb23b0573bdc 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -37,6 +37,22 @@ clk_hxt: clock-hxt {
 	};
 };
 
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+	assigned-clocks = <&clk CAN1_DIV>;
+	assigned-clock-rates = <50000000>;
+	status = "okay";
+};
+
+&can3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can3>;
+	assigned-clocks = <&clk CAN3_DIV>;
+	assigned-clock-rates = <50000000>;
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
+			       <200000000>,
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


