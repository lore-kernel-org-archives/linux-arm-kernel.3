Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD80D49792
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 02:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=; b=levgq8+nBMJBey8Z+7ODTMiVBA
	OPKxzKvdnGX4ZLy4l2C3uRLuS3ZRKQ9wngkhpr9AVAtdCsNuSoJe+RhecASyy4P4hiD5qagTnyb4f
	JW0xdwnZa5bfJ0S9bbXFaD3+VWinxhVSYWc3hicbjpyKgFsVJ8SzaMOBRECTwpxzBDflQHjvON0pl
	zceaxWmvfRfkoW9TFlSVwnLYSjiaFh6hn3wt/NHk+YPmhB2ZQh6YMnZgUKQ+HecWdIMlPPoT1whnc
	mpv9vQxE8+GS0zd5zSx7B9NcYYe4fFdqxMPq0gYtwnRovcI9tCrL7u9w8SnmWjm5BrvUHaGihz8JS
	b/JNZxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwM2-00000004pLQ-0Pp0;
	Mon, 02 Dec 2024 02:40:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwJF-00000004p14-3wwz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 02:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=; b=muDOxH9otaYWg337TsjF1EjMyI
	97PUMnFrCVKxOTueqFInTG3PXTGekODRwskFIqGXZu0SUS7oVvXD/OrhcQ72hxefFxOo/akhjtEQC
	kjST/s9vLk3dTrTYewdYK/RX4LwqxXcID8TjBqA18K9qx3EDNJIyWT1EwOuDdo3VV1Ve17F6S8uKK
	GbUfLEIx/vz1G7SC+ui0W0d6iOJs73fo12ntNxlOgO8BU9v2GgbGceE2j2nFc1itK6NHdhM+SQ0+C
	LABfzfGU3MyaBOjhtfWubKuFrUP1CyyTvQ/Z/z/oLyspsyRToUVVxVCf2BmMhc8584JkRnQdNB0He
	8afTTj7Q==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwJD-0000000264P-0U0g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 02:37:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2155157c58cso11938765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 18:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733107028; x=1733711828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=SSmiOdevj1ZSFhKY/dkSbPeiNEwbVFFZ82j2bqqsQdlO1m8Uwv5e/A7NWl9Ceyiry8
         8k3/qAya3ZpojRGrlsGSXfV38oXxwvpOuk9uHPTxcvBwiXPbDoy0wcEkUO9r6Dxe/LPl
         AWpUbTdJPHg8LXXJWq6ECHEpix95MwFNV3+xswOn+9XMxrKOgQFZj2UE9AnPzlJJJSCx
         4n1K4742z2zX/1jiBc4MFxd4WtDSYoeHFm+HCfJ18yUwxwK/rAvDiNFL4cP/l46v4GR7
         89Ym/mBJ8AYktqLORcUvm76wuKLykTHaMYQWmY/U/6PToUS6dDv+oDqq1+X8jmiNeqGN
         Id8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733107028; x=1733711828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=MYqU3LI6p1ac8NiogRE3bQYiUMDZrS4NaefQYCjkqL0CdDKZhF7qn3x2AUrj/ngjaP
         UI0VSliItDH+pLLy79kApaPVSdjWdl/K29pyk8TlXjPqWCDU1D5b1MZVAg6f5hic+rWG
         c/T6bQl20anShN6NgLw3BG28NBJ/5+1hYzt1cI/zCF2/oiu6M7JnSnxXN+xun76u/qPd
         WOioqBCURgB4YCc7xfbv3WOOcA8qKW+aa/MeXGM2V1K9UKGYioupWmOdzOJwFsTMZpCq
         ExN9XgcMPTtMpXXjQCGf+jv4j+SF/ykDSEbdFBIW+IcJHMP1l3PaAlOybNDQvSZ+50bw
         gwpw==
X-Forwarded-Encrypted: i=1; AJvYcCXGVZD1GJHIYjOilEQCP5V2davk/Ffz+Zm7WZZMgNsVEBQHB8XjnCA8K7eSWgJH87fVvU3ciSB+NNgAXQ1MlabX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+5u8DaQAQwrpi20YGxgoM+efeL8LVXosLMToHvoHIlrYVjcxZ
	PLMRo3PAcLwTUyKIMUm4E/1PdzCegXQjEOrXANkfS8LjfH81KCdT
X-Gm-Gg: ASbGncuqz2lXO1N0PG28SiipQF+e2ANSTDzSzho54XKEjleY59ibUBXs2mKiDtcOVEl
	nJw1T03NlX53hsEov6Q2TCkcB5VE7HAQhr098OM3+oM3+VjcwAyLvKSIjJ4VPiKm2kwUyfyHuVo
	Sme48haEQ6i8zTtGcFQIAEHxXXwIdkfg9FzTmTljSgjFA0gX0WON9c56kMVDAh28Qdkrq+0Ii6B
	UIhULCl7fZQVuT06nrlhmJUrhOVVRy5b3DhVvbV8tJv02Ek0hAPnNPmrX68D5wcFcWcnVyS+LZR
	fSlLoIFfMHgEbUA=
X-Google-Smtp-Source: AGHT+IHG9tioNmTzw/gRzfRn8wxxDcUErSWfYqRhSyvuPLyqeXYrc/COqMFFgjtQSZCuz7fHIUyDNQ==
X-Received: by 2002:a17:902:f710:b0:215:4e52:dcfe with SMTP id d9443c01a7336-2154e52e013mr146944605ad.5.1733107028536;
        Sun, 01 Dec 2024 18:37:08 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2159ebee334sm2306375ad.67.2024.12.01.18.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 18:37:08 -0800 (PST)
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
Subject: [PATCH v4 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon,  2 Dec 2024 10:36:42 +0800
Message-Id: <20241202023643.75010-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202023643.75010-1-a0987203069@gmail.com>
References: <20241202023643.75010-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_023711_300923_E4CC2E5A 
X-CRM114-Status: GOOD (  10.01  )
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
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++
 3 files changed, 76 insertions(+)

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
index e51b98f5bdce..89712e262ee6 100644
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
2.34.1


