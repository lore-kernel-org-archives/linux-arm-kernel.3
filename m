Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51456C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=; b=JlrEAHBBWI5V9I0lRhnodtc4xk
	chHR4TOZU2nzp6DVylGNLDp1TQYxnDw9A+rdETVuVlMKHuMFl9/wjqy/DT6ElYhu1wPwaTZJAtcqU
	YcFTeeV/ZODn0a9CgMSlzfPqeGx3YTzokr0U+SP7Uu/YZ2ubtYHu66YG8azyXQ4n9o3OBUeTxOCEZ
	u1i9cdFmE33SgNrysbGrv2RNTQDDWLAdiP9AbCB6n2Ea+nf3SFBsOJ9E3UkbXTHJoRSgRTOkpKoNN
	2fD1QC2Ep/t0Q9nEeFsP9ednOiI/pQz+VQV8GZccpY452VJAo4U1eG6sudP2HJMjM9a8V8mIv+NJi
	Af0Cq7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZXk-00000001Mcf-26jj;
	Mon, 21 Sep 2026 08:38:32 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZXY-00000001MUK-2PK9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:38:24 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747f0135fso25795885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789979900; x=1790584700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=McO4gm5ZaxY4H9BpmBUDODEaX2uW64GBgt5tISko2avz/rHn4Px/YKXAIqAFCWveXp
         uYQqUsaNyxQdhvgX2+hzy5+bWfgJeoy2+SCAPPIBOR8pSBFBuSQ1K1y8/FEZWvVMIvNK
         7kIgE/N9CxaJH9c3q0rVXR3f/BVhRwKURF2Zm2OqgJvt+Tko48q/cTslVFG9rkhden6u
         OwhVIlgypv5hnwe7gmH9xMcAUrMW1tF+Uj9YNfQRj+cL7GYqhqBX5j1P+trfI7dkiHUN
         TuMwfr7KRqqPII4R67RnUDczHblk2J965NyD8lu8LtWPnEtp4/iX12EDsdWjtl4XH8fO
         cRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979900; x=1790584700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=WWjht1OHNYkhgMbxZBo053TRMNsRSWpoyRr0OdzP+SOwEJfIC8Bh2ujh15pfcJXHXv
         wT0VKzG9Yi1dHd1gN4wuEOUa7rwCnT5vHzyDQrqGb3uMy1UhWxHPg0tCF3zltS+UCSOM
         0KpdZYmQ66JfiQj9qxV5s8btRl8cc0juK7qS9vlw9FtUlsvBFqbDlLo05WtVDA/G9k56
         Z/pZXPnjo0j85QOvTymME/Ha2W+dzcAdYH+L+xKP5wNgVToNOQLOM1hDnQU0Db/q5D3H
         Lu7uUNBkXoMW/F64hTVZE7VnUiCOyFzA0/2cCzt/iNHkwVyQ4oDs/PE1R5Iq0N1j/UkK
         r3LA==
X-Forwarded-Encrypted: i=1; AKwUvBwqEANNQu49rvrkTqzYxciKPgG10YDv5C2RFsBRqyhYnMRnk0nNYOmAOI5TQOvqV7QBMksp8vK+QLiGrvMB7GyS@lists.infradead.org
X-Gm-Message-State: AFuF++n+uBMNGmZESNNm5BKmojtjFisNJ/peafgJTw1LBvKQUSfuUyY4
	i/H40tkfhzYr089GRW5E241KCSlsc5XpDkTbAcFyk4hE7z3pxkyokLq+
X-Gm-Gg: AYBFou3v5IKbJicj+DeijRLl/aGr6jkaDtTm80w77NViBKoQIqnKCoyMxpplrz9tuS8
	3LApWLLOttgH2QA6bPaQoANNXD068OHd1a4ZaAI3MW/PK8jc6Ba1aSje6MaHG1q8hdU71kebxG+
	onNfRC4UcROmTm7nif4YF9mukrSCqVOk71gJQBe+9Ej9e1ts5A3+AnUqyZxPO7fotPR/Vbb86AK
	jEXGxVYqAoOywXsNDjGNw5DS9I2wl07xHmmHtrrXE/btK6xHr6JZbOEb9W4QIVkYn13kvc8+LQg
	3MulD3NzDiOmkwP34OGJR1Tg88PIXYvvOwThLJImrSiutz5B0UPbJFbDFeq5U82WuV9tPdahmto
	Zh9JzEKzT1KmEvIAt3Y2HI1rX3pqaVDaARUjFDUNJ9jfb7y5YyaQZG0kFha13F2tcJjZguwsQ4K
	PLFRzpBUNBbZZBVOQO6beA7QEe0/ggTtKrYs1puUTTxrA0xqeai9sneH9EqW2Bf/YUu9IoNCHe9
	WeVehwR2nzex64me+ougLW9JjaM6y4a3DSqQKVwBF2Au1rF+eloJqUx
X-Received: by 2002:a17:90a:da90:b0:39e:6a80:b796 with SMTP id 98e67ed59e1d1-39e6a80b849mr10118808a91.38.1789979899922;
        Mon, 21 Sep 2026 01:38:19 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca50694sm15121508a91.2.2026.09.21.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:38:19 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v10 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Mon, 21 Sep 2026 16:37:53 +0800
Message-Id: <20260921083753.1109826-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921083753.1109826-1-zychennvt@gmail.com>
References: <20260921083753.1109826-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_013820_619794_B945E032 
X-CRM114-Status: GOOD (  11.13  )
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

Add I2C controller nodes to the MA35D1 SoC dtsi file.
Also, enable the I2C2 interface on the MA35D1 SOM board and
configure its pinctrl to allow communication with the onboard
NAU8822 audio codec

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 20 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 72 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..422468dbc3bf 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -57,6 +57,18 @@ &clk {
 			   "integer";
 };
 
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+
+	nau8822: audio-codec@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a> ;
+		nuvoton,spk-btl;
+	};
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -100,6 +112,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c2: i2c2-pins {
+			nuvoton,pins = <1 8 4>,
+				       <1 9 4>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..28488889f564 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,78 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@40800000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C0_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1


