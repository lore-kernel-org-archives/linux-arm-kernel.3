Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18E9D43FEC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 08:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js4XwaykndxmdA7yiX8pwiKscaOEEt+IBgrF0wpJ000=; b=0S6Qo9O301vbjtYnFkzwrHJU6e
	5MnKBzyuUl0ZYZZ6GMNagAuE2YsvKCuY6JoggN+m9p0zu4tgVPDqt7v7J+I71Gau87dheVpqLSHfq
	t3XMFgxCvrfOFDdHEbzg3REKr8aVD0tHvCoemLXzVAjFcBvyq5HfxdRbodwIMRDAY8qnrs0aFQiAq
	POb2zJ4rNjmM92Dzq32sDGe7JOBGIuls9BlFsbBVbpyBIHSdD+bf5dMeAnxD01RlZA/qdo2KbE+SE
	nwEODQLtW0fkr5zCWrUpIv4dGGIdhAaWayDk2YFjAgQTXvXoIKtjF2NshcZn8/inMKsU4XQoe1U8/
	FH51oTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxAc-00000008mwQ-18f4;
	Mon, 18 Nov 2024 08:31:42 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCx6h-00000008lsh-2TlD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 08:27:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-211a4682fcaso25508005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 00:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731918458; x=1732523258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Js4XwaykndxmdA7yiX8pwiKscaOEEt+IBgrF0wpJ000=;
        b=Ozd6NL+deldJvPgYIhW9USXsBF+evr3e8DT2kLrCmnA7/u8xfGkCQ/mhdwp0inj4D5
         YKHtg2knGFV59HBLBQ7mOh8Geg3SBsMHyHIlOBPlMqOxxA7bnGnvNJx4VLk2nP8HX/QG
         IWnrqGXdMiVrPlQBUlkw9zcFf1FtLzNq3e2sofw3dOmTgbBcIDtKXb2IdoVGEcrgKVhe
         OPtOm52ChclpTxa3Ka2RkeChSChwyMOcmKyNFmuFiQ+OWal+aoSIuSfkMQCsVGLyc146
         gtks4gKnI7/mY3H3IS5K3vy/TA9OFE/2RraxYBpAk/0xDc4Yi1UydeZVucULzZsgFShA
         z7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731918458; x=1732523258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Js4XwaykndxmdA7yiX8pwiKscaOEEt+IBgrF0wpJ000=;
        b=Cy2jwSZ9j0KKoPpsIa4PYB4V63wRj4C2PVrh1iaAOsC2L2FcASTIhSMX8Umomc5N3Z
         O5/vI+DJ6ryowxaYCRDn1lRSGYLq/eeXd+x/s0WqezgysZy1lzyBJSbP/wkQHlPpg93w
         wOHsexvzmVw4YJTAu59T8ZKdpcpgbFohysTBPUN5Uydx9WBOjxrgnBY4ATRn/o9FImeD
         OmNbCIiv+eQOyLviah76scxANDXyjGYXeAkdoy4a5IyXRv8eHNyNnw0i0mwXlukt/+PR
         e3gJmwbQd1LmxobPjR4GBDUFtCeKtIQvOAZvisW2r2msz1Md/57HuzD5OjGpPWat2+rw
         Y08A==
X-Forwarded-Encrypted: i=1; AJvYcCXJe8vXF0pCw+eWHxGApALEaXWhQtTW0O5ZpzlSi5Mi8O5JcBrvuxd1rHonIz5sg6Pmeo4gzHrhqmnM7CcNuniv@lists.infradead.org
X-Gm-Message-State: AOJu0YyRaQLhhRtGsmUON5fIGvoCT5dgC+lZ6ig0bPD6qnQ2H4ysj4R5
	aUEus/ky26iygP62mab4W03D/zjyMXF0V4KeCWJOslkniaRzcIRs
X-Google-Smtp-Source: AGHT+IHsm3Txde2aN86FKECvf2CdflmYt/JDCEML/U6tfMKKmqNWqaQEFWe+BBbYl2dbFEA2ZfGw1Q==
X-Received: by 2002:a17:902:f710:b0:212:c9d:5f62 with SMTP id d9443c01a7336-2120c9d604amr71094745ad.52.1731918458392;
        Mon, 18 Nov 2024 00:27:38 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0ebbf9esm51883815ad.45.2024.11.18.00.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 00:27:38 -0800 (PST)
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
Subject: [PATCH v3 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 18 Nov 2024 16:27:06 +0800
Message-Id: <20241118082707.8504-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118082707.8504-1-a0987203069@gmail.com>
References: <20241118082707.8504-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_002739_629247_D18EA2B4 
X-CRM114-Status: GOOD (  10.22  )
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
index f6f20a17e501..1d9ac350a1f1 100644
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
index e51b98f5bdce..2e0071329309 100644
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
+			status = "disabled";
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy1>;
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
2.34.1


