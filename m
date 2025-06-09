Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086C6C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=; b=zsvhzHQ3hSpCjv0kB4MjQKCVGd
	EVTTTXBQCN8su+F7y+i0V7NJGauTAlfY90uA38k9OzX0+3xgKeKbagrsGCo2VPTMAb1TNkhgD5GGZ
	NJTRqJU4/9uLNuCleZXBnmmGxliSPkGubwyDh3o1ipV539hlOTzJEFqSWmFPDh2oINpjLCC62T3Bz
	ry2zuNHP4j8ceUFK++91F+TONsWwig/S1Exm4VjK5qhy2vJeNzzmZIbyHNnY+0yLgSuWPtQ0CxDUf
	coYi8OiojRRwXhBAN1oy0P+R4FjKYRxht7o/7vuY9wX6WbO4O0RG/sAQBDoz7Jsnn0q1FOLkb5Tx6
	Ay8pBveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOe1e-00000004S4q-1mmq;
	Mon, 09 Jun 2025 15:03:02 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdxF-00000004R9D-0LBD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:58:30 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso4920809b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481108; x=1750085908; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=;
        b=LpChcBknWFHdOUlwFP4kfD/ETeO6TgQvJxStZXZS7jiyf5nhEwIFI47zbUKaX/oMsd
         XnsqUIC6yfJjJda/TBH3/16EcN9U2wXIR79AkmMzBSUncKyAoC0UwNVNVGzfcGM2MEOb
         RGd2jXvw9Gq9uMgvnEnLeLVTghRg76fCGf4a0OZ3imUxKKEAre3wIqkP3yX7VqcoBZiW
         quG1M7d7w7bsFeBRL3QclsRc/YDMFImSZ8wqAAg9Ci9avR+//7hIYw9b/N3vq/+WYUHz
         9kJ7uqtkoQWlEBPE2LTtQz8ozgsZGcTKz+SykTGg0fStWb5dach1hA5MWt5+uBxqcSoe
         M6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481108; x=1750085908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=;
        b=mEvtbRZQVA3btDzGPQHRPUob8N+J1Gos95lE2ZtDKeaUdZRHkXg+GzEAFTMIdf9LwN
         9/M8Hn+DqnQdmzhiDNs6tUtR9TcfOX5wIEbjQHQxD72vyuOyx3rYoEYtYM4PkT3+0iH6
         sGJ3zgUcDxlJX6IPDuxrzJNMX0DLLen9opCC/MODEJyfiIdiJFB/7sfdgvfO+eeVORrT
         iObunWSJfRaVkoNsv8V7gg9zgBKerisKIm59/WBDE6kaePLujJaFcynJT/K5jhHJv+5w
         S5cISdPn2GQnMSpkpDf/nolRZnCrdmW4LQPy7oNajg2JoyT72e2p2A1iVpiOCa4zwiFI
         3DUA==
X-Forwarded-Encrypted: i=1; AJvYcCVUQuvuvxQJFqBxG4SHetpgtTLjJ36ZI3A1mJ3YcRZ7ZuyYlNFt9FlzZhkcUe4GKaYEtH4gdJw6JHsyg2kiREAp@lists.infradead.org
X-Gm-Message-State: AOJu0YyvUOwZP+vo6QVaCoGdPp12aUCRvuDU9RQC1WRJc3P30iInYX5T
	i7BCHjgCB6NN3HGIK42JV++mawYHyEGAbVWE7vWkLTO8q1O2RcAFKJ4V
X-Gm-Gg: ASbGncukYV7N3O+1+boGMKyD6wedsPNOHQle65IZR0BNcbz7JnBxsX09q+570++2BIb
	rAR29dY5yhCY6EFl4+bTIbPY4aozdJmPMH5Px2nXsRXJEX7l3R5QH4F+/wJ46WIPjfsIjUfubPL
	j6SnfKYTkahPiUAYgC+/SXjMnIVmVPI7MjW7acofen1KpsCMqWjFrmx429nfdiqlpXcFqEnrYNG
	RyDxIVRCpuusHgeCjxNOMogBgYLwk56vvhRNHsHX0i361L4Rts6Abo/hOPdmKuNKf2C4ACWVi/w
	/OQqfx33RxVvKRATchh5l9cZOo62APlDroOWvch2f4oFp8Idi4aDow==
X-Google-Smtp-Source: AGHT+IHlBqNiRN/VzjCmH+GccWEqdp0qoeYXb4Bn1Al96nJIn7YSkT+omzOCGqLdFgbUeF7GTn8deg==
X-Received: by 2002:a05:6a21:a43:b0:1f5:9d5d:bcdd with SMTP id adf61e73a8af0-21ee6851aeamr18131835637.1.1749481108259;
        Mon, 09 Jun 2025 07:58:28 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:27 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:18 +0800
Subject: [PATCH 1/8] arm64: dts: apple: s5l8960x: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-1-789c4693106f@gmail.com>
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
In-Reply-To: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=UtUXsBApERv0HSkBqesHqqsf4hnDJMVAjhLKU618wUk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaMq1tbvO1pHM4ifn1yfNOZ+7YnNCeDkJchC
 OWw3fzANbuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jAAKCRABygi3psUI
 JKZyD/9GgjSg0Tw4TSvf4ue2tv+yyhIWjc6Xj3LpbN2mHLSWgl6xkpys6vomEF//9NaCKiWvq3e
 9uaJSGdvP3PZQsVYpd+riUXwsdKndS/xPI/82j8e0pEdQ7+XXggqjWjQ4b8Mp+qHSv4FAWNOLGz
 WOsHsU/r8U4077WjWetPAcEInMUgG7VGFIaOKgwEbpaKOtQyDi8wx2UgVft0wO7AMjiuP9xQZCl
 TOmVfQXOTlSqTmQKcI7qMo3brDohSbJumG896goKofidmw22/s7YUR28T/b3eRS/7GqCwuws70n
 qICo4AXPr1b+tYRW1aerQzxlxkL/oK3/pWCwZ5z4eI7DqigTAhe8G64/aJ6rWdU7SWK+kH43n3G
 T8Deu3zhl7/zq7xAOo8DA8AwvaOD42Lsppun4fPdzxVf1Alr4G3j1mC1pTasv44ZQGPGDbaTmF8
 CMvu34V8tmzN7SSw/9M3Ll3JC4HEYzrcn4n143IqZnA8tpQ7pUkw7vjyumvkqAjmOV36YwN3g7A
 ZHusSectPWalpWiQQh008rvE4PnwOoeQx/hS2R3uBvF+YFTiih9vVFbKeggQdDtnQ2unMFj2FpI
 Mw4/ztyz6RwQLM7o8qmFy13YRdHmeiEeIzUzUsrk3TRgRWzI+p2Kv9NWxFucsdm9sXdKtSifiCn
 9TtI+4Dmdcyl7FA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_075829_132390_0F7901E1 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Add I2C nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 5b5175d6978c45052ded495fc0d18ee3a8fbfdcb..462ffdd348fc893d8e1d597b11d063dc5f88bdf3 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -89,6 +89,62 @@ serial0: serial@20a0a0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 154 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 155 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 156 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 157 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,s5l8960x-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -140,6 +196,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 112 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(81, 1)>,
+					 <APPLE_PINMUX(80, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(83, 1)>,
+					 <APPLE_PINMUX(82, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(101, 1)>,
+					 <APPLE_PINMUX(100, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(172, 1)>,
+					 <APPLE_PINMUX(171, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0


