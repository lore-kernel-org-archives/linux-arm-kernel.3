Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5FFC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAg1xxPrByLVXS5zqSSsIze8Df8Cn+rlbuQoqH4AjLQ=; b=EMA22tkSir8FeeQUxUfmCfI9yQ
	wobUHMvRrJJYJ5sLOvPbrTeFeq+NfoAEwJLtuXPj1eibMIwa3sAuoqLLt33zAfhQGbZJ5b1eZlBAj
	ETu+JjmN+sKJAW2n0tCmKLVQbsReJvz1rTg3n0L+ft5BnDeiEMjNViX1Vy++9pfeO8XMnTzHfCwbd
	iYbaj5iFPC46Ow5LFq9KAQaKknS/ak/pPmGEQj8bktDNmVCv9dwn0qxh/8OCVG6ia1447gJCNc1ci
	gu+nTs45x6Jsu/cbMvEXPYwynKwiJfDPPbU4BOjXZdgsU6s1B5+AKvJWZD11/L6ZiT4eNegfYpe3L
	hAupTbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOe8B-00000004TMP-2kqe;
	Mon, 09 Jun 2025 15:09:47 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdxN-00000004RB3-3yEp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:58:39 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-742caef5896so3608300b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481117; x=1750085917; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAg1xxPrByLVXS5zqSSsIze8Df8Cn+rlbuQoqH4AjLQ=;
        b=W6bWPBicklOfE0LV2r3LvLwQ2xk0G9yyS4wTWj4+Ua+CYLhu+IAOqQ7s7ChfMIEMAG
         CTLIqbKH+o7cEzP2oRVXVP+2z2/2Z+gRy85jQGa6+5sEaBuBIW4iw7q2P+5/wMClG+N+
         cms+BocT0lJS7LzSDgsGZn+63o6qctm2wGBEofWGX0dH7+UKfcoGqL1V7UhgTeE2RsVs
         wRe5rAVObK1yRNqqIwly7mAz88O3s1x14g/29/ZNfOVlX3i6jscJfRmb9/MjhwHvPpxr
         w+XPUN0ipzC/ec4GpTCwJzv31Y2HN2HYYN/W1m984f+bfMZZFKO2BMolMfHZD1NXG+Tn
         SDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481117; x=1750085917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAg1xxPrByLVXS5zqSSsIze8Df8Cn+rlbuQoqH4AjLQ=;
        b=tHt38K9m0lP4IGr/r8M3Efi6xm92gc0saRZBY0WT2hHms0PKR6f4omQ4rA8xkaQJ0C
         kiqmxJkYjYFpi3CGRiNREwJx08bkQvGns12JYwv7Wn6bEWVvpVLNP5EMcgaCG8kdrbDc
         nEdi9lUkEjfzVQoqMdWCIA0xl0/+exNA4Gm3M0LvTbVTqp/wEKIHGF2jh9ZoIv44I5El
         ARV6mVThsMP75/cPQgvQY69LG/u6QJTBOIHTrpb6/JXdusqxm/fH5/WkedUmH+rz2GFf
         Q/+5UvSveVQyzIPq18umSs1pzno15glOXYSXTeGUr3Kpy7MbpzWvGJ6pK3V/dXtCAxWK
         +aAg==
X-Forwarded-Encrypted: i=1; AJvYcCXYO+I7ySpfyJQo93u/utHd+daC5H/5FZOZh4e+hBAlcdSSnDAPn9AEvq5qXxm7QGKa8Hdd+Jii92l0MFIefw0I@lists.infradead.org
X-Gm-Message-State: AOJu0YxkhMaN6LNjEri8Bml8OkFM1Z9+zVf5n+6GtyD1Tfe1Z6bdgNSk
	+UapA7w8lpsZxhnaZThMy+r7g2IlcUyesKayLtpEgE+HQ11NE1wyYRBe
X-Gm-Gg: ASbGncs55Mc6RoWc07NEBwHX80KNndOBjKs4d8ZsxTdIwi/k99GQcOm0MZGsYgKnY44
	e/KPsgVX4a+rzfUgXrCwTo4C2zaR8NTUPNW6qBrpq/F98yN2TtvmHsZ/4ULFQ3HZBFTvUWaO93x
	N3rqxLxwSvMfqqeuMJbGjgPFAsTTXwhTLk3egtLLxvi6YcfKHKdfreJQRszbJxeOXotdML9SCMs
	bGxkoMvC3Shi8VRT7YetTL6iaIfYZK4Ds7NCxytDP25vjdKj5l7WF0r0pNpVOBPnaCAdVwSGZJi
	KtZzXgwOXO6UUpEN+7leqLpw9RSBHV2DDmlBaLlzMh++J3uAD9GUXXQi7ScCuEueEAn6t6FhK9E
	=
X-Google-Smtp-Source: AGHT+IEMNRSQHs1yQKt7YZ59zczYW9rOSQyhZpYpFQ4pBA7eBs6caacxie1e7KiXI8EoIfyMrKJjAA==
X-Received: by 2002:a05:6a21:112:b0:1f5:6c94:2cd7 with SMTP id adf61e73a8af0-21ee26214a3mr17045591637.42.1749481117099;
        Mon, 09 Jun 2025 07:58:37 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:36 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:21 +0800
Subject: [PATCH 4/8] arm64: dts: apple: s800-0-3: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-4-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2705; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=K2/pnHaMI2yTXkNfn6PYNYe6qBt38rxRGGJx2uQPPho=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNFqV+Pzmjq+28SeLjdcgzc7RH7/v0Tzgco
 jfgYVFTAZ+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JFl1D/9yvw9GGd9JOXXUg4ExLhIvdTFDhzGXs1oOsYWqVuciWsgQXn4zqjRbbSB8EnU659Kuawt
 RSu5ikag+qyHC4yavVyyUxkPcpQmxM92db8TikyusnC9jXULnkFNSqo13vzyRbTHfCcx7s9jQJL
 Z72+IShhjfv6j+EGDeZm31qIm9MDkYXvijunX0Nc50rvLgyBZHYcjMp9FT/bxYKTqUOVPBZCEBy
 tsw2e7vqww8UR/lAAqwAbvUgSWAXuI7XdLLbQDMC+XX6Wswvd/ilVB1DA2rgN+Ojhjdjgtds0gj
 flVFsMYXl5pPN0j79+/XUpSfXusXPuuB9R0Ah51owgpFREgRPS5nd3CKg+D4YN16FrncWejn1MI
 aGUjOeS0J4TWXwpkWVjOrt+GeU8vNeTS8eh9TFA+F0QhnOcs5QFXMlpTCJ3I9DS7g2OsTwGh5tM
 Em+mbzW/1IqFoHM4rn4A73VV3jkHjzygLjLU71LYb7ZzQ+3cKjJ8vM7N5jG+E6mHmdWYbeBdDv0
 kW9Q+0usZQYObw/ehlBSn30EPi8PttRPWnGBa8GLbwq+eSe6LjOD8c7NV+QIbTJ4RO7hdQiNUEg
 9JDd97/ba8Kjfj1unQoPDRxvpEy5lHKr6EVQuA9IOu5h4u9lWsKja8Kjb/P1F7ei7Q8vs/uaAsZ
 TTs3Mv+lwAmMtCw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_075837_991268_035AD70F 
X-CRM114-Status: GOOD (  11.63  )
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

Add I2C nodes for Apple A9 SoC.

There is actually an i2c3 on this SoC but the SCL and SDA lines
appears to be not connected and no peripherals are expected to be
connected to it, so there is no node for it.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 09db4ed64054aefe5b8f8298553d87fe5514e81a..bb38662b7d2e0b70e18b6870b706789b1cb242af 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -88,6 +88,48 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 206 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 207 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 208 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -131,6 +173,21 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(46, 1)>,
+					 <APPLE_PINMUX(45, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(115, 1)>,
+					 <APPLE_PINMUX(114, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(23, 1)>,
+					 <APPLE_PINMUX(22, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


