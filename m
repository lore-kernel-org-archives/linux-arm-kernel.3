Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3367FEC01C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=; b=4CJUa1uJug7ksBa7NYj6h/mTIp
	EK9qBEfc7mhJy3jBGyNYPgsbEFJhnLJiiINZ/x0yLGzpTTTduakrjC42KV1Cy7qHkh9qe6wPNys41
	e/ftAPbZrnYtm6g4sYV++Ak4KILmEeOcj/ML7gjR2FKp67pd6Zzjbi1Czmx/tu7pxrylJgfIbVlNR
	fARjhYXh33v7yvWmePbi6LIJfq0ijXa0dtvEnvPR2GGKIhL6Su0sBYj6oN8FaFM147AEVe+b8pI1C
	KL3O8Llt7hKYLeNXh3QtI9p+na8YlHvN7dVWHl4Cf5QM7qmRb5ysmwQB+RqrnrHEYgnYzjrc00ijS
	yHar/zuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cMV-0000000GTdx-1wFc;
	Mon, 23 Mar 2026 10:18:19 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cMP-0000000GTau-19CC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:18:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82c20f1e890so1899111b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 03:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261092; x=1774865892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=EEBmwa8kTKaMvAU1JICt6roBHxxS3wyszFmNR6SZTxcmqAhGH1YLjnHJqgxj2S+pyg
         FfpUarMpJTn+yqVgIqvbHsdWUUgJ2KwernTudbAWQw+A5DnH+0cbuqqEe7yPW5ZwQweb
         J9k5phXq3C9Ekm343OadngROzLzB5tPc3d11bqpv++3KguREeu/MtshbEV6kMPDuoPBV
         NVY2Rl9FYdfmAoiMnSQjwEf69xnQqQaMbR+DnTX/5PGSmcybajcG6t+SLTSc5/ZvqMb9
         qxQbzvvhNSEVZSlTOVMfoOBIDtPCkHtCm+t8Y0WzDU9WLbSBD5Am3Ub5b7j9+K5gkjvh
         KpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261092; x=1774865892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=hYaT+pixQx0/Wd4WGavdB4ZrW9/tEPl4yAS0dkT5E7qtLlBI2eAn8x3dpobOU73Swg
         OvpAvLVWA5c+Joz+cV6eansm/uSQvZw6q8v+3EgzLa20hTdWg824+PQtU5U0nxKo1Mls
         nT0Je5lUSg+1upI7QL2RIlW63RTV83dqq4F6oBpL5XArtzxfVprEhh0Q2pQ+tBZgg9oc
         K4c8kzSVrwvPkELcui1LwJ9GCCZLtS40Z6lMAfCAodIHRi2X0SLEqVK1m9UVg747OwyO
         s3MvAUVVELODEbGdjRBs3lzI5o4SM9Q0/PN2MXgP/U1J/94KskrWqYkzAXvQbQudF9We
         pTbg==
X-Forwarded-Encrypted: i=1; AJvYcCWJVr76nim0FFe7vznH6IYAX6yJVBXiBBaDzVS6J47erFrW0SFXtdty17MOmCmcafWdmkMxvSe+b/504fJaHmoL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9ZS9jhapYNdsODhTc8uwdtd/1q7PJS81q9HY2UBGj/nP3kBNu
	rqrQOT3tFP/7HBS7Soi7navQQopJrFJGGnqSxlA4sktnHZLseQaQ4L+m
X-Gm-Gg: ATEYQzwe9xpoAI2MFkNX7alOTCrtSfkxLYQUnLAQpfOIuYYEyRGPzjbfaAhEOdoeCYT
	wWjA1HZROtVFK/FxGErUxmtocxm1DPLIpyojZaGr+fgS7gHIzlCLnVM9CJ6Co426Q+o1vfJVAAD
	qUPYEn0MsYVg9V6HtzRL7gQkdP8GckRon2y/QxcbmU6QAs71/F12ue7WifEjbwSuaWlnymjlpXP
	D+EUttPcxtkydWaS+/HUVhJmucBXtFOTbgQI/btxsKbJmCqXJH/lm/+Sa/+0cZutsJ9zoUmvq1a
	PfO/u9NyrroYDHz3dfcA3PPxY6qgluAIUBbNmd8MldtpzqwiZTetTwWxqGmsRf81fzN9aoZeRcW
	ZrFOZS0md+g8R2ncthSLgoSZNIwTCKUJdZmbgmqJFcWJ0b7Oj2LUbuigDYhfn1JVnWEpnZf3J/F
	oqQVvGoU/xbs4Pofgy6FA1acQ40XURkN9qNV6CN/QnJhVsSeKJTitu+GZrO0WsCqoINEV92F1ql
	rO23SGrTk/E
X-Received: by 2002:a05:6a00:23c6:b0:82a:899b:d804 with SMTP id d2e1a72fcca58-82a8c353162mr9822673b3a.38.1774261092458;
        Mon, 23 Mar 2026 03:18:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:18:12 -0700 (PDT)
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
Subject: [PATCH net-next v15 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 23 Mar 2026 18:17:55 +0800
Message-ID: <20260323101756.81849-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323101756.81849-1-a0987203069@gmail.com>
References: <20260323101756.81849-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_031813_321628_9D51D64B 
X-CRM114-Status: GOOD (  10.18  )
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
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 25 +++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 24 +++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 3 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..78534d613486 100644
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
@@ -126,3 +128,26 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&eth_phy0>;
+};
+
+&mdio0 {
+	eth_phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-mode = "rmii";
+	phy-handle = <&eth_phy1>;
+};
+
+&mdio1 {
+	eth_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..a029b660e8dc 100644
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
@@ -129,3 +131,25 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&eth_phy0>;
+};
+
+&mdio0 {
+	eth_phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-handle = <&eth_phy1>;
+};
+
+&mdio1 {
+	eth_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..7228ad4735b5 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,57 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <8>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gmac1: ethernet@40130000 {
+			compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <8>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
 	};
 };
-- 
2.43.0


