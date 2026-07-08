Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C07C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0jyaycIlFsITmoKtSt+baeUtSj03KZOHsdXm+Zi9cFI=; b=L7m0wH8srxjnHA1Mm/w/dUUWw3
	4iNoEReb2Du9bMwq8uW0KG+IH4Tjsasx75LnmoRecZyIztclZg1s8SkPS4VQT4vYBLZTchqwVFF36
	MBHgf7aFOQ8ud6/9VzwNyid5/cPMuwieMM5fQMl4wBXb4X3ajSYlpQ3tMtUsBO98E1VYUQcPAG175
	0Qq8PGUWFCrrFOrofzRbmcepKWwzSo6vg2H3W9ioe/bRDo/SN6OphSad2HdXJ5hVpKIaS3Llv1PHD
	poQRqzEjBqAYl80auADJl9zEmw2OHLfD7JnTkcI/umdIzxbwAP2SqsBK6QRT0RpkBOgL4m/+AmdW1
	n56Jlq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNas-0000000GcAT-1dpu;
	Wed, 08 Jul 2026 08:25:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNaq-0000000GcA2-0Fe0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:25:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cad225673bso3572575ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499118; x=1784103918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jyaycIlFsITmoKtSt+baeUtSj03KZOHsdXm+Zi9cFI=;
        b=rmdqHjFEDjLu0GP8yQRGm/QYXo7bazGHYQul3kokWBEhe7dFAhX0i0sBW/2FuJxDh9
         rj9pMGnsYev2SoAeWAGTQS/7+rTV+beVlMZjerfqT2gqLetS7lyyyoq8z0lq4YZ2POCv
         1+WYv5e4X0ueoXJDwctYhqusQJLZZhzvuJs5gLPhVe0di/fhJF6DAQQSdZvpHCVJuG9Z
         cLoiZ2xcmnP2lclutssnIXTElCTNz1NhPdGOCew6BbfkjDEPsyYWzgN2G2gemWRO7ExH
         6dncEJnDh2GBl8J16TP2OSWajdmi/JLPxR5c7YpI8c9c4LatrnbBGkgwqd2/YEgZgEtM
         00PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499118; x=1784103918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jyaycIlFsITmoKtSt+baeUtSj03KZOHsdXm+Zi9cFI=;
        b=FN938pELo2TQM1tbMtzy71QIWimX06m2GesgL7B8TUYJVJ5/ZBPLCqKuzELq2h2vE0
         ZAKJ30u4OHaf0tEWNGccgHeFN0bOSiXu9hRXy7Jo5y1h/YnOraLLZhWtDYq4s27tumj7
         MfVxtR4EWpV8ZKw09O/28vxNdWK5W1o5DaLzgBW8TGSoDyjSIwjTjDHv780FwimGvFIA
         qJ7A9eud7fOFYkYN2c9rfBS4FO8AXS3cGhNpC9/wK4D5SrI8LWUytVwQ/QggGyNHRVQa
         PVr5Cbjon/G4O+qUIFbASbynSRaHBA/PfCPZNtKgp8M1aqlHWCGV90wV/WiOe7K9utAR
         2XEg==
X-Forwarded-Encrypted: i=1; AHgh+RpbH6rLsrYucEvdDSUMkp5LgpeON0omIowHrCHUf3oDU2mQ9sU3QbnpJamuieQjNxvgDxN0Pv4qDjrPdCN0kZFG@lists.infradead.org
X-Gm-Message-State: AOJu0YwuArRZ7gUm3K4mP824oOQJJh4FIH/5btzG3N8c6NVB6liL4hV7
	u9gh7CyYD6brFTnKnrJDZosgajv2CF22wsWdHHCQ+HmCmYrRk7QnqFLS
X-Gm-Gg: AfdE7cnABw4ShdvzDaY/DnSbB1SoANJm8Rcr2cKCnUpGXBSG4yrZVyLlWrUF9GGAzuF
	vT+/Bz/Q3OHpqN2W5Mlx9HMoA/Fmeak5p5lV1L910Pmy3rvgKNZvDkI7t+nnlO8ghqLAYS5amr4
	TuaxRHdwQIHuSkZqSL7Oo2tqCyu29N3I7KmkwpQvrKNxlUtVA0wDn5bSwiTAfhrEnSIiNBhZ7L3
	XoPqzGDjUXFlQajT/Hi9yxun9dVJNF9Fv1et+0Gk7vvmVdzJuSOtjJUxBJLWOMS0OdWp2M9J3Kh
	ZRKDLZ48gUNkum9W1pd/CJQ9gtOpTVhWH6qGqaALpMl/VwNjs7pivSzWgbXU/U1Nsqw9s8GdA0Z
	MzAzkzbUHC/NMfCRzQXQ/A6j7Wb3ZaTrK9Rqq0WNU7l6R8zA0WkuhRXp50Xaj2/YReBQh2rwuA7
	r/JHWiNI8pmRJN6bohMYD64+hbCXNklZASN6Pr/dkl+Tn3bS7ltxuy6NnPIc6lRLsQhj5t5rM=
X-Received: by 2002:a17:903:b07:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2ccea2d56f0mr17414495ad.19.1783499118444;
        Wed, 08 Jul 2026 01:25:18 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d952sm24010315ad.61.2026.07.08.01.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:18 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: arnd@arndb.de,
	olof@lixom.net
Cc: soc@lists.linux.dev,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Wed,  8 Jul 2026 16:24:57 +0800
Message-Id: <20260708082457.460710-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_012520_103559_D3CBD575 
X-CRM114-Status: GOOD (  11.85  )
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
Resend note:
 - resend with the complete Cc list; no patch changes

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


