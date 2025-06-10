Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB85FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=; b=jASGdC0mxmUOrXiAAHThV2xMVr
	a04UxiZJT/X0oUJ4dKVEnZi3L2hbRtuvWz78HKqzO/7+DoezO/VfnzcJPHwhlN32zmzCRHRpjLALW
	tQzOSIMNSGf4fiPtKg0zzupHngFVPV95SXYeuaNQJ8ckbD/cV++Hyo64Bxt2G2ePCi6tnDb++02X7
	LDXaZaO8GF4hfAZwlqKUZr8BRd3+2UX98AaAvnOAvEL28rkYIaM5i72ffsVyjcP4mwYTruMgSf8Nn
	/+YsccPpOySUEnBMa39jhjnJUROCo3ZrjTILA57xDqUIA3QBQpj20yGQVGr1mxjuPMVd3nIyguSBG
	r5GOXF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP208-00000007V50-35xj;
	Tue, 10 Jun 2025 16:39:04 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzIs-000000071im-0B0o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:46:15 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b2f1032e1c4so5046224a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563173; x=1750167973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=iMaARX5hTZNPq2IJT3Ws7ZG8Er7g7eMrV/DFfqrxTOL9JhPjQsVryrdJ67GW0WBIqq
         BhN9O6WW8nz1VltN5SPqwwSlRg+30LgpOXaJNCZ0SwpviyZMhZ/4s1yqVrsReEvDqt5Z
         yt2gp7+VcyhPnRYqiaaScM8kvCEeX9lcw+sVU6rDeMjhbUvMJ1ZVm+kCm0wCT9vTEVpa
         hzsvQgbugl9F+grKL30NuGAYVNnjnATfurVMUMLMYBNlEbAO+LiFAX1qhZS6ML/2hExv
         y9X1MnOxw8U3Xu2zpZTiR57n/i4B1RYavSbhcKd4cmqO8pHZ3yjqhzHGQ3njnTKYTWPg
         jGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563173; x=1750167973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=wmXnr8th/VlwaNPpp5iljdMEGcf1MX3onELgkSxJl0GcStoJ6tFuYzE/oxtwNmiDsN
         154OC6ymumBEqHXMOGC8XuAryTlr79FAC8qen9KfjFKfKIZ2fLk8qLbajYUFlGk2FtpJ
         SdGg1YYX5/Yu6R/JY69iB50pMBsk3gKxzYWBhLQ+jyFJvNffBTdCLTJqvnJVgM8Cff8v
         t5BZ1PmOYytkRTiGLkBfzsmJhVstXa0RKBEbtfm3Tl2/FQkxiEF2NZo7JHUfcnV24DOH
         l80k8RSinV/CV7IXfIKsw7HlIc8lDbyhUTrYMjNZ/G89vimtPNKx9PHMdaa1hVp9KUn5
         tUrA==
X-Forwarded-Encrypted: i=1; AJvYcCUGZTNY4muGM81nPnN7ADAgEuPVLd/kmI3GGDHPPUxYHkUjerEOAwhtX8NcV+lN1cptsefj940gSrv1hOjCylZx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5SSrkEW3sBcmzAACCQzrb7Zl36J8UuVjEucudwPo2JgPuxJBg
	VotEV3/Dft0GCqYLKZCP1ENFxsbEPWBcQLEels1UoL+RATavbTqBTcF5
X-Gm-Gg: ASbGnctg2n2ohNyKGetCffKiwimsYKyMkjY8AA1v5+/GTqCfyXXpE/CaxOE3wajX5kr
	W1lggL517/vFWQyFyngt97q9h62indj9NyidGzj3QGqserPe4jN9L2pjWboOj5Y4s8BvXdczbD3
	XZxSN2VIth917gMxfriSvJrfq6JZy1ASMFvpllFmy7YmHKakqGRZW2tBo9bs6dxiG31QOyL+8c8
	/4VwINrp8hMwEz+QMEqDAE29L3TGbVwodQNPI6QmHHvQukRfYb0GSIi/sbPJPbHP/PKnhCpkhhF
	wC2Ncu30agbyce6/jKyt4JEofCh2G00U4CVHpe2L1I2vmBXC81D83I9yNC2boUc5
X-Google-Smtp-Source: AGHT+IGWLnHsznkJ/Da/EQnD3kporOvoVzQzAShfY9FI0ZIFQMZIr+5VR8cBdQf/AsoVqaF8p64zzQ==
X-Received: by 2002:a17:90b:1646:b0:311:f05b:869a with SMTP id 98e67ed59e1d1-313472eb280mr24147530a91.8.1749563173273;
        Tue, 10 Jun 2025 06:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:12 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:25 +0800
Subject: [PATCH v2 6/9] arm64: dts: apple: s8001: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-6-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9566gmKhrX9N7D4Gci4+NELLJwjkHJyrdvGevl4Fe5k=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMUl2/apVzAT/V/KkKkeb6CQjlyBAid7HYa
 M99AEPEte+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JGMrEACVFL6WIOESUBESHHupcLhxC37GYnackPUmK1c3JVn74JsDd4FZOTvqH9l/z/I15UWLS2G
 DXc6QT0Zhlh5Q127sMKncN3SgyYxoYEhtuBzr8DZNdTgUOu06rggIC/s/rrT7vBOLpFbf4WNN7G
 f61RjdR7OU2lYvyIp1h8NpoxmqMYhe9BCbIf7044KRaHWnGY/fJe5yNxbLi0UUbVPzi6AJmszcM
 0KCYyJkFWR5p2z/CJHMWJTYOc39SOk/I4zqLCYPjDU1y5beBohG4fbZqAKUq81SToOlqvbW082y
 iG13lNqMyRnLZLMukmZB8Ko8uvWKL/xzwxRQTyN54aPx03+qOQ6ccV2UHKj8SxNoNlhbHRelkJk
 Fb2N+g/Atl/U9wY4pC2bmD3jQtbrRY4Aed8Fr2Lq2BbGD23ZwHvpIKEiAMvKYd4YIyazQH4d1Ep
 RRC0CZOGCFGCt32VG3i+Jx8MCWNS6OzU9GRVRE+GbUcNxYwVX+/wWQVfJen1IWGijaFigdozcUc
 cGEiycJ742rkbUen+z3iQZrMcjMujFqDh95NK/Hq2kII4rBz45TowZDzIYZ1oMr+8hIJKvRWJB/
 J65N/tZq5Gd2Hnf0yymVCjwBwFPM+usFe+9r/kLSBTFjlz6WPh1B5iKemTEDR/1uJUygrtA63bZ
 zbMai8ah9rXRDJA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064614_079239_66BCDF9B 
X-CRM114-Status: UNSURE (   9.80  )
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

Add I2C nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index fee3507658948a9b4db6a185665fdff9f5acc446..b5b00dca6ffa4caa1d504860693da001a8ced80e 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -137,6 +137,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
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
+			compatible = "apple,s8000-i2c", "apple,i2c";
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
+			compatible = "apple,s8000-i2c", "apple,i2c";
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
+			compatible = "apple,s8000-i2c", "apple,i2c";
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
 			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -173,6 +229,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(165, 1)>,
+					 <APPLE_PINMUX(164, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(178, 1)>,
+					 <APPLE_PINMUX(177, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(132, 1)>,
+					 <APPLE_PINMUX(131, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(115, 1)>,
+					 <APPLE_PINMUX(114, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0


