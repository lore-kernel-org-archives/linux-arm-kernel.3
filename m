Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1593CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqveaJe53LxwbIM9SPax0uC9xDx3I0UHkG7RcVXnAnw=; b=xZATuBy7kY6v0yWhQkyKhnDNXw
	UtKLXdjBdal3zYs0ID12JNQk+FflKmTkQmgYQErp9xiY/zmp6nEHkGwjcpV8vjCloCPlqLoPSayW3
	IQGLXlomcC7wMpIj7aDFXiqbH+5OrWt7/hX9Q1flVYeobY3SMfDzx4CaxYZ+roUS8XQiL9BAGkCpX
	QgBI54GxXulo8fQdrrUS2g6tzi+tKwZdM/cilIiiQs8ohHdorXjHOI0dB1HW6IdCURTDDMR7r7Xky
	3qpbV0RRQb0bUq2V/ICp4ekU/iAUPGJBHgb/m0V9uU7Cjub9CKV3dgi1RAcw3Nalf3+tLWfCVVIAO
	S5DlvANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjlw-00000001UyE-12mV;
	Mon, 19 Jan 2026 07:34:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjlt-00000001Uuu-3r3r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:33:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a0834769f0so27333885ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 23:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768808037; x=1769412837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqveaJe53LxwbIM9SPax0uC9xDx3I0UHkG7RcVXnAnw=;
        b=F7SpAGUsmiajgtMwXJlfEZn081N2lO4/eKtsKmbQrC7TaElFCD/az+BxLhYhSK/oVZ
         8eWwYVfHTtx1+vdW0Oz4pYObV6j55xiGmaxYMBvSmDvnBAzVNrMvIeDw6jX6jPDbJqon
         XME1WQB5GJ/izg5Upk+IOIedSHKecxxoW0+jZ1zVG8kX4YNJtHbZGTnpucPLsmw8pza5
         Nja4yyEvtJY0cB9bXNagn4l0mxxSUHb33Fx3INOkKypIHBwakhmu0JaPOpSiEkRqUkvE
         UFYyJ796XOC26onhMB9pQiy2pehf9gaAeWzKK5PEzxDOQ3w+MxvXmFEqvWAuvOHhA5vA
         Zueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808037; x=1769412837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqveaJe53LxwbIM9SPax0uC9xDx3I0UHkG7RcVXnAnw=;
        b=YX4MElIt5YNlGBF3V+thnMukWLoEcIpIX/j2aNi2xU29uJlY1fRFL1eW4XuXevmmba
         1Dqwq6qIAUO+k69N1oVCsBdM9e4qMkgCHJp5pL8P/qLWksS/Z4EhcUGTGPg8Uoyplv+p
         Pnzg+fRf7QwwBT5M0aQLHbYDO4As0fN/CoY4Tk4uw2CA9X6vpoKZtFnkfZnMmWyTb2dY
         UvX0dpr/Xfuo8ycVFraIput/BVjj+epCjJFH5q92/x+ahshL21Ncc12PzQ4rcEO2FhfL
         elZmArVwnN2iaRqaeM2iOjIYXUQbkwH5CBXKpfnaR9xt6Crl0VsF0RqKurzyPsvLGL98
         6LXw==
X-Forwarded-Encrypted: i=1; AJvYcCU/WX1ujjaTfRGJE+R2uFDDhP9aFEaRnqTRnHl3si+vP2sGRNNCOyS88MEtZ6FMZ+T3xxuGH+8Couo0JC7kozy2@lists.infradead.org
X-Gm-Message-State: AOJu0YwlKdpKehx3iIM5j7UAsiUowFKhMv/AS7hA1NyrrFTC2bcPQBb1
	P5p70qPG5mxEgoOg2jTKA85tiZM0jhuzHjaDTNvrqgIRDuQtFhIVFVjX
X-Gm-Gg: AZuq6aLFFAbxGlLX7OtR4paYW1H7kNuUAphKmb8CJRHZGSMpAIaGSJBGhe3ZI2QEC35
	3sCKLcE1MFNSgEFv2S8u87hFxMlQHWP03X/nNwWqs9tio/cWlawU5Zw+wy+j7ResAxKGJ2D6XGq
	VXLrFBqBl0xVWsdvJw04Bp4KKpa2kZ9yd31RSIh4OkfpGALI/p9UliqggKXMf34I0joWsO+P8vr
	Abp39WaU0bCRDFbmXkppVkgZW3V0DGBDe8xqxAiOzUBUS0ab5F7xMKsm/Vwbougv43PcSOdvbb+
	cNPPnU+YGIYAU828iK51QoaFiX+gQkNbsL8vVBQitIdhl172Dj8a9fHKE32eZ8HrZPK5sxcBh94
	ntn7mIctpLEAax7ZssvLFL1j6B2hz6DQDfCLlGbu9+i1fZpvr8nweneGDUyppUTxH1ryyOTSS4m
	iE8vwqucaTW2OTwOwTdGS6jVo++Wu5iQeVdv0gE2E42OjwvSUeMXRzAwxiseltPrML1yN4h/U+
X-Received: by 2002:a17:903:3b87:b0:29e:93be:fe50 with SMTP id d9443c01a7336-2a71891ace9mr83664425ad.42.1768808036852;
        Sun, 18 Jan 2026 23:33:56 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941e3cdsm84863325ad.100.2026.01.18.23.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:33:56 -0800 (PST)
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
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 19 Jan 2026 15:33:40 +0800
Message-ID: <20260119073342.3132502-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119073342.3132502-1-a0987203069@gmail.com>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233357_983190_2C6C28C3 
X-CRM114-Status: GOOD (  10.06  )
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
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++
 3 files changed, 76 insertions(+)
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
old mode 100644
new mode 100755
index 9482bec1aa57..5cc712ae92d8
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
old mode 100644
new mode 100755
index f6f20a17e501..1d9ac350a1f1
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial14 = &uart14;
 		serial16 = &uart16;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
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
old mode 100644
new mode 100755
index e51b98f5bdce..89712e262ee6
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,59 @@ uart16: serial@40880000 {
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
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy0>;
+			status = "disabled";
+
+			mdio0: mdio {
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
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy1>;
+			status = "disabled";
+
+			mdio1: mdio {
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
2.43.0


