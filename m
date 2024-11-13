Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB5ED41C00
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 05:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuVwXZjcL2Z1SKt3iutb0b2hQewo+6dCF311Yje5+1s=; b=wYIrVqoBLWiDkVJiRob5aUzudh
	EwHyu5x5xlvvjP+xpPANVo4SAbNunSFcludSycMxRagv0E8bAfcPiecphoVKGBKfNH0LlhCkTY/hC
	5D91/lpSoru3vEPdtNSoNYAQFcWQ7evuvougTQ33B9MuOr0FvsJG6lqJcpq2R5qaTdHWArglFQDL7
	B0WvsDSr56fw1/3AGvFepNRYE9WY0PiL6EYUF61HR/Kswzu8ZenRj02fP9XkaSb0SilVqKB5pROGo
	Xq+4XSflgggTnjbp5p7qzgvPnz6YxruLv2xfDknk60bMsfbqldgtL4kXyI9XeEAGksaRF26S7qM5z
	HSDLyTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB5uB-00000005oId-11dq;
	Wed, 13 Nov 2024 05:27:03 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB5nS-00000005nRp-3p6E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 05:20:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso237658b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 21:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731475206; x=1732080006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuVwXZjcL2Z1SKt3iutb0b2hQewo+6dCF311Yje5+1s=;
        b=g4LOnPoidChffF1X+xJSgMQwo+paWFMpAgQvJRxlhR346FCdsTEnPyx1jr17qxnWmB
         Y63brK8qSEAqxivqrVBYeS3oWMgELP8Mo5WhO+b+nLX22SmcZA/qBUcueJcxg8s5ArGI
         TPytksO/HOujQdgMvMxXaTj4hbi+/oSt+qzbZabJQ5vj77W9aWvxN14igr+oXW+2btMt
         6+koaEBhijxPJn9gRpDfw6c7zTFksRUwMXLu/V2R9Pyv/F4z5C76VJGON8f+uqphnP/L
         bHyui9tjLR6PK2BxDfkQXdGK8tWE0k59pLKAGNSSIqcP6gydYZS1yDAhJFCa25vzseQl
         MlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731475206; x=1732080006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuVwXZjcL2Z1SKt3iutb0b2hQewo+6dCF311Yje5+1s=;
        b=TARVrlVo5oA4OMghGkYlBXauSGoF4/zptMJ+M8cHixHVy43HX/PxZ9vIkYX+grTCO1
         BlBe8InKPwjpI4n7h6OMqPwm+6MJzqulKzFBfZT9SkWpg/KTqosqqbc3O5oYsskzNcml
         srICVNGgk3byfD47uMRTo6Hdl0uD+JtaOdcTowflY4sFO7fDgdcGxheozHx/oRNvmgwT
         FXi5L30QRsq3xFBmNvvIHRbSxrDauPqcMXQPtcxgvfdvmLpxrGWYSORBQH/cnh5lcpB+
         v81sf4S1hdnTTfZbMyEaLZY7rRht+ddFdu29fNp9kKE7+2bnm8KYiurF8utc+CVl4qA8
         qKqg==
X-Forwarded-Encrypted: i=1; AJvYcCXV7Pd4imrT6/H1Pen4iHpdHzlntJEDt/V6luJLjf91XkybEbIA3FVt+hT9SoU51Zr39TukpFWx9haFFejQya9l@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh82ouK4En+jz9k1lZz+u6yWfQeF3A1gD6gh33q6inYHI1U8Oe
	znmSP9EUPxe2thNU0EF4WFNNXeVZdhvZsta+P32ECveqyO1YfNsv
X-Google-Smtp-Source: AGHT+IGpB0xrH/V27To/lXeqTaqAnf+loTtbj7zqhrRLdFwxCNZXnx6HW51bRSHSDDQRKdW0iMg6fw==
X-Received: by 2002:a05:6a21:3391:b0:1d3:418a:e42 with SMTP id adf61e73a8af0-1dc23321c26mr29010340637.10.1731475205616;
        Tue, 12 Nov 2024 21:20:05 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079aaa01sm12644376b3a.100.2024.11.12.21.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 21:20:05 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Wed, 13 Nov 2024 13:18:56 +0800
Message-Id: <20241113051857.12732-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113051857.12732-1-a0987203069@gmail.com>
References: <20241113051857.12732-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_212006_973635_2A7DA904 
X-CRM114-Status: GOOD (  10.48  )
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

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII and one RMII
interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..5cc712ae92d8 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial13 = &uart13;
 		serial14 = &uart14;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -126,3 +128,13 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&gmac1 {
+	phy-mode = "rmii";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..08f5a7b5b507 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial14 = &uart14;
 		serial16 = &uart16;
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 	};
 
 	chosen {
@@ -129,3 +131,11 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..7f7c7f8b7ad3 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,57 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
+			status = "disabled";
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy0>;
+			mdio0 {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eth_phy0: ethernet-phy@0 {
+					reg = <0>;
+				};
+			};
+		};
+
+		gmac1: ethernet@40130000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
+			status = "disabled";
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy1>;
+			mdio1 {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eth_phy1: ethernet-phy@1 {
+					reg = <1>;
+				};
+			};
+		};
 	};
 };
-- 
2.34.1


