Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEB0CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 01:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjOU7YARtrXAbkjxgoW/D83MupO/fBHcHqOARUheMbc=; b=sgUyl5QMGTQs/pCJquymg482FZ
	sauWqLKAKl3Zho+SJZnOsp3XqP/ftj5oV10Ul03643pEsKq9tdlmvwIqlOOBd9Pb3MaQ4N7ZPmwb3
	YvFU49UGfkWL3nHafq0UxjXD/y1GF7/pMc6XKnuPwPhBl2pDc81AmMg5dLgkSDvtIKdX+X7toKUIL
	GBGBsImi+cXtHMgPWlgdTQfLgcRjRtvEJFvkQwc3BSvz+B5vY5lf4l6IaddxO83HthFyYbx57N1/V
	hx/GlLC8jKXlZd4xxnV19D0aHAHYwTMrTtn9PPdUTcK0rwjA5vVFO2fP3dw+AEJmQNTifuhyQcuue
	VKRfXe+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWNo-00000001f0Z-1Za8;
	Fri, 16 Oct 2026 01:05:16 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWNl-00000001ezg-2anB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 01:05:14 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1388111a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 18:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112712; x=1792717512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjOU7YARtrXAbkjxgoW/D83MupO/fBHcHqOARUheMbc=;
        b=RFKL27nIMKViop8kCXqtwLUjkhkszmEWsoolRxiSPeTfRnuKs9NyB3DAFcu99xKQSQ
         gDGu5O4Cb9aGZPZZZafdE64Q2mJbXWNZOf7WeENzw4JL3gxsiI0U1R6+7G8AfLNzCs1k
         MmdicdhN7PTf40kTXtq+OVLLhGzQ0KhrQMGFw8UmBqRO0oLnVDuIohHfRLooJoRDs17W
         dHHHd0xZ177xlk0uyggBMeyioFF9W/Prjj+ieMeU5BuCLJ80mU0a1vfoH/oax1d/7Z9x
         fZCFiPrHD5vk0Xpay8uKXqCdoYUG2gGBNJVrKrL1HBW1NOHahb+M0Y4HqqW8uB20kqh0
         GHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112712; x=1792717512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjOU7YARtrXAbkjxgoW/D83MupO/fBHcHqOARUheMbc=;
        b=gfYSQrANpF+IZWQPxQl0jUwV8sx5679uwLLUzPeNKlgJIobLIO6PNf8inOwQnpL86M
         fXs/tfo10qdl68Vk7AVpUAMNE+I9ZrQKkaPWL1N2qtcyp+JnIMMkWOY8zfK1ws6MM3sB
         /Vzz4sKztlnMJcu7fZ21KIYI0ThI/F4bTC3ZbeTmmH0eClx/RJe1Y2Zs+4YzRekC9feS
         fjGCAU/vxRSl1EeqlwxnPzhZAXhJS8LSI607/Eni8sTSJJ1+tJuL2eGaYeNDREguyp6J
         a1+c4HTvKMfMnExr6w9QlxA49whoIt1OcFzR4juExmGyhbbGDtaIpRTQdP/JbROrEQzO
         d90g==
X-Forwarded-Encrypted: i=1; AKwUvBzH/27LEb7wipRr3DTty9UMjrCwislGkjef5sd9bD8zEG2ApY0z+Sar4SpOBrE9DkOTNXvxpWQuzS0QDUwsLVox@lists.infradead.org
X-Gm-Message-State: AFq9FYJgmzpdeglGoWjpjZgtENsXJbMK1AdT77/AR7muZo1b3Q0nX5Ow
	DpXMQFScGOHZAQyoWizQg4N1gVRKe1QR0KjDUfjFUFQP5g2+Fww9gL3R
X-Gm-Gg: AYBFou1tqzUO9XBYsjYR/DrCIXh7wdit6PjuE45Y8OSXZODiOPyXwlfXfBa1u/KhqKw
	vE0RBNNwLQ/S7BL+qSJsBcM+UzHxfqU319HMDeBS1mr2PW4JM9JiT6v0mR2bqF3i//uJfPztHgD
	Ex49hQGNZ802e1Z6k3nQsExQbdUsU5TCdte4mWyDZULYmJVLdIMUzyMJCceLpzpAesYT2+aZkRe
	fHrlCDg7I+Yk9sQhH/o9i0Ijs2NI7ocOlW+OnBTvPZ5Z1aw3jbgN7BQTpqb2mE99FvcL04TqroB
	voE4+PcgmOlrzlbKUhFq07fiiiPzWmeZDpIjAFOQ6ALfHt7ai6mnV4Ke0Lf5cIZaDaqUHsOf8CE
	U8KwtnxIJMlqxKlGSEy+6QKptNO024t5/9QTwxCDPnYL9jysRIIGEVv8/VQL/3l40S3PccSF8k5
	Kdf+B6G25vqVDi6nIYFB43P0rXDKgWxw3wtbTJALw4xGbX2C4KbV4MZqdeQHEnwwSWkHZHxlSA3
	WGX2GM+YNRnEgrgvC7x2WZtFcQM3EGAr6RVg4ofDxtZDgxgSmRUxJJO
X-Received: by 2002:a05:6a21:7a97:b0:3e1:5816:8743 with SMTP id adf61e73a8af0-3e16bb71247mr17172837637.6.1792112712303;
        Thu, 15 Oct 2026 18:05:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735e513sm302821b3a.27.2026.10.15.18.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:05:11 -0700 (PDT)
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
Subject: [PATCH v12 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Fri, 16 Oct 2026 09:04:48 +0800
Message-Id: <20261016010448.324856-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016010448.324856-1-zychennvt@gmail.com>
References: <20261016010448.324856-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_180513_662805_41012717 
X-CRM114-Status: GOOD (  10.60  )
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
index a029b660e8dc..488567f830a6 100644
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
+		reg = <0x1a>;
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


