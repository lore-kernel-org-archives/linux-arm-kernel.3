Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A17EC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=; b=I2zIIYENyzF7fnf6tZhItTYKCJ
	Z+9fppFaKaIlevQLPMNyevP6Ymm3pUnKVfgHqKbXLOLAdDX6QCMpJSIN80XNsvc+6Zm4SGtnLz/gL
	QezpEUCFASQ0idW2Y+Tqgbf2TX+2Yw7C7T0Y3n0sfl1FmdYC88iLY8Ku63igg87rqxl2gtcK5wtoe
	jkhZDXCBsn3Y1qItjI0cKGX3KKJ8raoW9FYc4QYEpCXdRaS+citvVhtKCiShsUHEbWEh9sI2hXtbd
	q64rQIyS91y4cyS9NoCllVDQEiDZbDZc0GTCm3oV++7GavuFJoNAoTl2IqT/deIyMXnmZF5Onb+Cs
	griK4QWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeCV-00000004UEU-0nKw;
	Mon, 09 Jun 2025 15:14:15 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdxU-00000004RDA-0bFA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:58:45 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7482377b086so2094488b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481123; x=1750085923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=eXXjupyObN+z3+DdBoo1+kSl8zp3pNGnCBvGIxyQSg006nilzu+xg8FFxGoaOcDxQf
         2xnp6CJ9UvPKh9XPDunCTVRXPskEnafJRUG/+vBezL3pWda0WxusBoiwk2E++MFkRl1l
         FdVCssersF7RvtYLHh7hao8DdVvB0SISndDMk+UXgQgxRlGEwUx6g2nU8ox4JytgStzg
         hxqo86vE5cKGrOPYTFXNjO/dIqdek3e5jyez/5puooWnjKd6D7KUTQOz4qgdBZbXyxlD
         S6gtwBkMEBkvqxSq6ETEHSxia9TFswDf154IfsyqliLyiwZYPpxOZLK+X401p/Z9p9Fo
         jjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481123; x=1750085923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=OjAOvu2Yjnpfn7x/6jbMmv/+2tWOBrioToyrHVy5tDNC4Djm99kpw8vOWYB1GL8yJF
         +fWCNc+5KERd9zhxmsBd4uUjYltFsckf+knSYni838uJHohOF/zXyDMso7UWCdzmb/mJ
         +AQOc79UkbdkcW9KWNCCopdHBbYI/dyyOc1kvj3TYtMyglk15rVttJWFG49Z/buOkEb9
         mSaPGhRFmobZb/wVcMQnSf18J96D2aNPPnxoESyvVPC7QJmZTAA5iVHA2ES+iPQpjZTQ
         DIl6lavkAE+i4nEdN54pQGZWvJXr5Wk2Ch2ngunLbBrNeAPXFczirjUT7TlsexptY7kL
         9V5A==
X-Forwarded-Encrypted: i=1; AJvYcCW3XHUUYV5E7OmrpP5/vldARKwCSem6C4B91yVDVI+lTDnVrCTi8nSf9Cgma3NVzm+zkUvgit9JJvfP8McAmgYw@lists.infradead.org
X-Gm-Message-State: AOJu0YzLJkktg7WN7X3LjYxtFFehRs8dsB9edTigCXpAVOGrziuqYTYq
	DlaM1muMQDqXQrkKqgP08CGPxAXGzsjMT+0rR0lJ0szijtyEovd9x9un
X-Gm-Gg: ASbGncu6lxX7exWzTcmk+myb8TN/OFDJ+Fs2rFgg9Iwq8TTF47ESOID0iriGH6V+zw/
	AtOm6cBT1pclT0WuhagoNBF0biSz+ckOC6xH00gdTQjfOAHLYziHw1Wyst4WBRbAIOe5dO+ohhS
	LGB4GSIDN+zFmps6tpDnFG8HmA+Vv49W3Oa/HA/Fx+sDyONl3tqqnc/9ECzGLL1TAgz8LRBIsD/
	+woE4I2qm4+jMbawldBHqLglyCfy+W1NYNe360+XrAXUERxQ4Q/R6Hf159QK6S5jpa89c/7bMZr
	vddZ4dIVreVPQggJJ3rz6G+odgQE/4Fx7Mj9mQsd8HRRbux4BEsgXA==
X-Google-Smtp-Source: AGHT+IF9V5FoejTbOfgTUjSh5U20o43Ptpx1VS9a00C7Lf/+wYzzpDCkG5fAahS0c0GV/Yg0u8lHAg==
X-Received: by 2002:a05:6a21:101:b0:1f5:8220:7452 with SMTP id adf61e73a8af0-21ee2547255mr20009310637.24.1749481123353;
        Mon, 09 Jun 2025 07:58:43 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:42 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:23 +0800
Subject: [PATCH 6/8] arm64: dts: apple: t8010: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-6-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kHaRIkP/PArXXOw9EiKwVTXYiFfFFiSty0mPZ+ZDpAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNS/y4iX29gS3aAIlLuS58cEiUPGQP/jsex
 Np4+5wNe8mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JPk5EACXhE3ns6xwOWxDALCCu/HydSPQI+SziopTrLwhkoVky5weah2oRrnhihfhVziC3xdrI+z
 IJa9shSE5S7AfojRmc9fe8s26gbaScIHHSl6ZqbhBr/kbVSv4fmJweUfCukJEka0iKqN04zTZYD
 iDcoeGgS4Ctjj7iNEmvQQGoMuPPCaUR87OsIthu+17z42Gl5pZZQqsvZWLrw7tNAbMuRHmsgb5D
 FxM56no1fDTBY2DIE7ht5pqtRbOUtDWUfgOWFRNZRATQciuh369b+CDmh7r5OeeC/77qtP4PzBD
 +SzeU4xpi4Qpxq7Gdx1CCETXYNImqBGvp0FZ1ljmPDTCdc/fxW0dPZIoz6ue8sgI3sWYd6TmbJz
 9hN88ksYTIOd+g9u8IkrPT3euuVJScc7Ewj0YYMy97dDt78TJDchZEb+vPok4pnGdjlRhDeSGaC
 Ad930c9tauNNaRoOgQZc8Zz5E5Myt8t7Eut7xJKXxzUx8M44nvl/LHScUyZ3mU+aNKqknYrtrRo
 b4nerPh+OnZbncrFhuPSaOdkqDtPCbIojtsyqWbPHkliRdfcWee/wWcP29+YdL2xmTgQbbZORt2
 spOZs9LzNyDnRqwjbXF8I8O8QdM6Fz9q3jG7gZtMVpi/39xN+ZqUmmDC7sauCcctLjqkHBt6ZFQ
 KvfxcS+KuzlpZAA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_075844_190041_B18DE6E8 
X-CRM114-Status: UNSURE (   9.44  )
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

Add I2C nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b961d4f65bc379da3b215ca76d5f68691df06f4d..522b3896aa87eb290dc831cbbf2cc8e593844097 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -164,6 +164,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 232 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <AIC_IRQ 233 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <AIC_IRQ 234 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <AIC_IRQ 235 IRQ_TYPE_LEVEL_HIGH>;
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
@@ -207,6 +263,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(197, 1)>,
+					 <APPLE_PINMUX(196, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(40, 1)>,
+					 <APPLE_PINMUX(39, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(132, 1)>,
+					 <APPLE_PINMUX(133, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(41, 1)>,
+					 <APPLE_PINMUX(42, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


