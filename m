Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1DCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=; b=kcNequn11CRAepuDxVeCT7CJAO
	xoGZ7Gi0xCYm7Tw79b843Y+rFpJM12d0RBE8YKaBRRTtp+GHNQFyynsIbVOGVslMUFDUtTT6Y1a1f
	abDzmPzbVSMXatamYc5tV3KWdqvBbXzwNbPRqNaLpatwXcikKqeaS0b6b73T7XnLZaGzOIOtafkKq
	ZI+iKV4wu3Ps+5nWXOKnCwHDMxK4jSIBbN+Smd00NLVCMQ0yyGTjZcNN4V4Y21QrY4MDPVoz/UrkX
	jsttPvFGqdK6DRZQS5dkLhl7W+A3tNClo2STdK0yUSoTjT4PXzMYeQA7qQg9q717LpP/8lhRSVtcf
	+yvEwlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTbPq-0000000CFMZ-45dR;
	Fri, 03 Jan 2025 06:44:14 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTbFE-0000000CE75-0G36
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 06:33:17 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so16534171a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 22:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735885995; x=1736490795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=NenVw4ZK4MJui0JAovfjEfbw+OSZgAwgA+KVQfmml1mwNvacTcgvqVUu+EDNDtuypR
         irZtbMP//4llhk+1JkOSUurU2tGeloMUpj/cLNvyJVE4zXXZMvgq50BpHnakUgu9Xkee
         BoUHJtfCeLnwnoGBB5R/uNpwpQACrosbNfz6dsfTYwUvB7BQjN38oZq9gwpbIZ948PYJ
         sneMIFZyBVxD9EIGJ1aFdT8sOHHya6gDqeD4dCZWgDt41feA0/5vnV/wqjXAt0AezL+9
         I3DYTPaD2LeYVvwapwsSPSIdh1uDEjEkEEx76/8MSvhSXzGvzxMCpYSPUcYCF4xONL+M
         d+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735885995; x=1736490795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=ZZfKQ9CW7ZXQltCIXuVDA2rqmJluXF6Hbx43F4KTBtpK/Ya1LypzoY2ocRGQ3GOzBh
         cKkesO42srK5O3F/ETFMsjjlWNDBuTlwnXNLunBISmaOmVYGTXNZq2F36P4DJ48VILx3
         /SjoQBdA2Kw55XM5n+6jI2teq2jLEZlFBS5Lgo2wQFicmWq5sjyG3IfCE5kCRx6RgLgY
         s1JIt7wDSuiJoGBAQN+EXRRkPP8MgQ94YOHB8MQ5DPpiZPBYLuwfthBEoqj9SLLxKJk0
         J4jyNIo1YWsV9xErQN4sPuXiyJR871pMSoyZykGKObOVQJIlFqJ9RS5TA5Da5r2WiYPw
         gKVg==
X-Forwarded-Encrypted: i=1; AJvYcCX0uPyzu1y8Or5vrBrmS88J5EH8mhI/QxKMpUJmrezCNRngvv1x9ipSbiyu+FGeQ7sljIgF9XagJamWU6xYe6tI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Vdbzp59PvyT3WaOm3jeYGqo7OMusOctCvRVmG4FzKsltBfeq
	UR8tY8KD6UPKBzDeTfkWlg2817HuSXa9+7q7wf9Ef0KZt9rcOI5r
X-Gm-Gg: ASbGncuuu1qyDYILaISwJEwtxrsxttBQTOlskQ29G7J+9MopBwtSh2zKXEZ385Q56D/
	+EAXvl6ziwPBEKT9IcmElCY3KHqGwcxAFQFeRXTDYBuR2dZmD8e0EKLNlreV9+H9iwiLF6tZojy
	jwLcyzY63/oOScvko8GCZkjxbHNoqJQGILex4eGvpCind/bS8he/o8OzBiB9/5RSA0hLIxT8sBP
	sX2NDf6fBnNn0fSrXGVLfVePL3Kqg7YgKA2kz/tXQw851L+s85wqcDd6iwuu4m5lVNdm7uNhwlk
	DsTwQ2a4SpDE/7d5hLG0mg==
X-Google-Smtp-Source: AGHT+IG23kmj6DK+vlZPS0EcCMKK+e9+4Q3xk8hUGRJ9aeWgvaZ8mRigTjEz+v5buodrd7CiMiIrMw==
X-Received: by 2002:a17:90b:520e:b0:2ee:c9b6:c266 with SMTP id 98e67ed59e1d1-2f452e22592mr69746730a91.13.1735885995130;
        Thu, 02 Jan 2025 22:33:15 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26d89asm29427805a91.46.2025.01.02.22.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 22:33:14 -0800 (PST)
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
Subject: [PATCH net-next v6 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Fri,  3 Jan 2025 14:32:40 +0800
Message-Id: <20250103063241.2306312-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103063241.2306312-1-a0987203069@gmail.com>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_223316_098185_AB2B1D2A 
X-CRM114-Status: GOOD (  10.14  )
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


