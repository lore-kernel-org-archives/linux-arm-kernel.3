Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9715C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=; b=HU1En4c6RKFI41A+ijX0pxg0PD
	83/JlxVQMX7nxhq/lIdxMCZ56sN0Z7O9seU+Erzfnt1SLazqXpBypTN9WzFZTiMajo5ootuY1xUgm
	L4mjV1iHtWQjZAiCpKFpZoXLTnpGUb4WNetTFzJPA1DpyWBazNAk7iD3JPLrtyAQRoEZfjVLe66st
	75vQUd1x4+He/TbkmOH4nyb3zIse6Zwf9qXv11k/bHvWmhdlhApOa7kPaS7NffbstUvA7vkJUi/n4
	2zHGstxG0kXxLeQOq6h4fjm7tBgYbk1YX2+PYRYjxv5KX+hNR1AgD8XqosGh7rfVTdl9wxCeWBhf2
	seji8opA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfHn-00000004exd-0wA2;
	Mon, 09 Jun 2025 16:23:47 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdxX-00000004RDg-06Yn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:58:48 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so2938090a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481126; x=1750085926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=SaP1GmV4f7GUAYsA9A4tRXvWSteWn/kR1bEybRt2FWniRk4hd+zbMmZv9ZhknIAXHF
         7FaoIJIRrzt+h/qT8bh55ZnPjhB51xXp+uzGJ++GWJmMTYgzIJS8UTUcic0h1ZPJJsAz
         2GRWc9VLukXXR1gXcZtf5z/5xknwlgpYM53hHm9teadynRNiaOnDeC+JUNUfcxB8mVhG
         AQEgfKu87jHG7ozUdbz26vvu8SQUHRraoiutZuHSlIZwCVzhPHQEBlCaQZlNL0kXg5wt
         y+6EbFkbwVTTbxg0bDOHknzGlRnhysTCy2t3WnQfYYjpjjqHWYhg70plvQBkoM34gwpg
         NTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481126; x=1750085926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=TxhWn28Z30jJZ39DBTp7R8ug6sDD3M3S65lED5LTJ8SVEsGjw0ZI+D2Xr2UeKqiNQS
         aiXTN9hUyxcgOvprnHTyAfeVAgu0HW9Ygkn9/y7jGvEPHDq2rUDV+bwvGyTWCSGWQrDo
         jNPF9nPBKrN5WkPpS3VJG1UL9BTpoDidRoht78p2M+IfcFe3c2nxeXyKrkoO1k7nMM6o
         VFu8T0isUy2HkJb8lT0oAE7+g1ePRPmYcsgQ7tcWYpjSfQRJg56/TL8+nWy7SuYX+8NL
         YzervX3pGkC3NyB3fmUkLWNeYH8dqYSSRw6DKGEVV83drmnVUFs2mjAEISJHxr4Te1PR
         NF9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+euGLuv37QNtUvnanayJzRDsixhZ6Tm1HtnVnKT+8fOBtl/c1h6g2leP4kULBHCgQMmzqhlZKHO6qwVuGxr3X@lists.infradead.org
X-Gm-Message-State: AOJu0Yynj9eG+mLchKvzXHFC6VRtiiYxKjGJnFjCficiUaa5ZYsFOstX
	c2Qxy+pxLJw0nkbt9OdxWHQyiZYuBCXqudgtpJbnFxerGTQzgFIMe4Wd
X-Gm-Gg: ASbGncvUEvKN1st1Fhsxy/7PAwmOfcjFRStRknBRzL5g21F9Am+JWz8b/JeSSRR7dVI
	tsdPeMumTmctGr++mdztldHbjiBKIp7BfWUaJSWc6JIkzKJ2L6WbDJmGMjRwuJZIR76aLgKibyG
	kdM2SObJq+7YZZsRCjVfH+HbVd/8MGZM5UUqYZh/sT+xedGDoeBnEWjJ7rq8kFULwa7iNRf0wJ7
	o5YWyKMk06W3TQfJdF3aYMeQHteB5wBy/9A7FwiC5mjK/+4uNLnDaALl95NU48phzUFs/yb+rhr
	fr4ZfsLX6vZFFgis+l5qqJTHhQfVsBUA3GujsD5rpnUK0Ytl5t/gSA==
X-Google-Smtp-Source: AGHT+IGBZzq1ANHKFw3JS3Ua5Fpq+25+H6RoUvZn8edzoteQNG34BeH1Bc5nGHzvWdQwdG05P8wYyA==
X-Received: by 2002:a05:6a20:430c:b0:216:5fa9:55ad with SMTP id adf61e73a8af0-21ee68a46e0mr17972971637.39.1749481126387;
        Mon, 09 Jun 2025 07:58:46 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:45 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:24 +0800
Subject: [PATCH 7/8] arm64: dts: apple: t8011: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-7-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=v7W7ZvqXSh/jiGyI0EQo6XvMCTg7kLe+e7s4TGkVXGY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNnSFY/hJQsThDJa8Jmnv1srxL12FNpeWqx
 si5CL1YaxmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JPjED/9Ka+qnK4cK9jYUA+rQbtCh02n7I3z0wriS28SZn962M2wJ1QE1N5EVeHJxmae2hQHvYXO
 EAjnBJtgSUbYOG52OfOl0VA1hWKga/D3+FetxW2Hbio8oamzt3x2S/fy8oSbqR4C23yyAoRR/wK
 /vQAIfXD82M3w/6FR6r3uRsvD4Q3LlsWNPOI9d5s7nQnb7J6eUIEeZ5F0nj17pXuW5Rxf0zM5Xj
 ZacebmCSHC6DWTamr/qgy2XsxKRsVYqZxAiLtLcAZaGqrZHKRCDzOxNWVpJD+/eihAU2xgZsMh7
 Uuq6oxwA9BRgNfi+xiC4BJG5TOhr31BSy4KmH5Ur/wbRTimWgx1KMn2+BKoTbykU8QyCZ4LnOBC
 hx+Phbu0vvOJeSYiiK62y+mFlYTrblwl+ixnwAweiU0JNsml2LGujlqp4s9VB3SSSOvytEkL9xo
 oaeWBKfFHRS4D74gMpkNHI0F+Ui6BkPmSdtr9Vwxgb+jWfbNhzAzMl2aBU8Q0gBqAptUqaUGfua
 9poqIUvIC3p13+UFoDpI2+oN2obLuxNDMQj8WRfr6mTu1fKbOe1ePUN9WploUVettQV5oICoMrF
 gBKDZaI0flfy7b73N+sKOFbOfFOwYbjcTUeXVF7V7LGYXFuDLruBtb13XF513aYSqXIsn7WYhvY
 V3aaG9IzYXbGUOQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_075847_069138_3E2E1220 
X-CRM114-Status: UNSURE (   9.65  )
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

Add I2C nodes for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 974f78cc77cfe28d3c26a52a292b643172d8f5bd..039aa4d1e887625e7b6ad789bfd9aa032dc58d01 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -168,6 +168,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 230 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 231 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 232 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 233 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -204,6 +260,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(211, 1)>,
+					 <APPLE_PINMUX(210, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(156, 1)>,
+					 <APPLE_PINMUX(155, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(58, 1)>,
+					 <APPLE_PINMUX(57, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(158, 1)>,
+					 <APPLE_PINMUX(157, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


