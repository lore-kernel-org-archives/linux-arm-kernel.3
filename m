Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81236C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=; b=enFCVLqMyywBmcmrRrKm6K+R/v
	z/5qwdBNV2rnkQ01IK2KstabTOjhRFin9OWAM2lQU/rBP28iGXY0hL6eNCTftvGOlRw04n8WtKl7Q
	c+DEk4xI/s4k37k9HEZBbPyzsZnfQCab7skcA9LrrEQuH9cRUUH/1OZJA+aOkC7c9PMS9RiZqY74z
	1hQ8va09vUaTAb+6juz+71bNRc1bapEs1Im1rcENVkM1uP/VI0/2siFFI/obwZVhq6A7W7pzGLsxq
	UcqVBsV9fyCinCySmumi9Kg1yqLdwyMNMTHT0HlYg/R9CfELlBA67JlGPKa9nTXE4A6rNbeEzA/dX
	CUcToF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeAL-00000004Tn9-1xhB;
	Mon, 09 Jun 2025 15:12:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdxR-00000004RBw-0KAh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:58:42 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-73972a54919so3667560b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481120; x=1750085920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=TzsIPj5879NMgMN6UoULO/lbRf/3wWrQlRXDbE73YCq01I7v4qgtnC72Twq5u53evg
         N2j8P9naetdyj3iOGwDO5MGQQqdbS1aLQDfQdf6bgZzC+7JabEyzbPB1hDjXb6Im02+f
         2rfFI56YWIBbU7aTWBrQvN+BA+dXeFK2+aC14SFAwUeBOUJL6f8PKDfDR5uFyWSM89Rp
         rTIK+BfvftLT5V2/aFgmj1cbYtQs7O+oi3wlH495uGq/IJpJ5/fWuLvHi69kg1Qyr1Tu
         zVyQTxyurwXNUI8dX6utvdNU5UhC4FUoE3KfTVa4Q4piXmtphhmhr9MEuBW4RWE64wD2
         922A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481120; x=1750085920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=C+mpdp4CwjHT4917YAMg/X/cdEsXQxmpoS1jeEGYig8zT0edpeKBGs7f3spCvAOgIW
         rz9r6O6/nMyf06Ay5XIpIDxMy12OLmBuqz055xN7CjwAN+bYZDE8fPii6BWWNFGqafqf
         HJFceVk5SPKqwzPhEul0glRckPVgXGKJLbfYagFCTt0a7kXNuwvCwqg2cvVPBIXAdiac
         RkXwyvu+hIgFFdfUe7W/DItQ9pOpiMaBGYXY9LfWb2Xkya0OrgadKPeFJKWDORjS3o4+
         AA4BJKDJrAuvHRwB9/5QbLSqnxAQuB8mwfRYspPtQmGosApXA/086TMwkuiFTyj5ETUH
         yIJA==
X-Forwarded-Encrypted: i=1; AJvYcCUEYx77JIWKxK/YjTSv1CMeOKm/Dh70+HZ9Ef4QXniCYOemFpscMRGeGBxslIHnoKU/mTCnKJqoTkWrPh4Z6/Ww@lists.infradead.org
X-Gm-Message-State: AOJu0YyhvWHbV4H/kmGKI2QjieJTAm7RaW8aeIJnWNuV7tQn4vLLZ7Yg
	9u81PbnN1qjUTbanBJ1O8sPxLjA77IFJACsekNoWSoE2WPXDbnrtMw5p
X-Gm-Gg: ASbGncvxV+/n2JFHATucdT6H1A6Mp28ViYzXxFSYC+8jfIgz3jQ6GH2ETLfpZGncbf+
	a2Pl7XDoACWkNkHVpPrqQ3uBa6LJckMkFt9iYKC2DL4BGacC06eHmsRhbqWj5nOTdhT9XZfL6nJ
	nSvrbCDpTeg4p83Pm+yNvpB6eSmSazkmMy/HaMNp2pxLFQGD1M7sfl15tLW1jwMj+SyISbeBC2s
	Kh3Cjj9qxrDhjEZg1fo6uZ215r/Dh7H2FTpQb40pLnFjLoKnBHDSdn686TSPXYX0dw+VQLUwdOs
	lm4sMNJT3zIH91gQftNT5SxOALzT9nC5g+g+SgttUw9+9N6HU+EuVSL1rDABPkjYYlixpChP1bc
	=
X-Google-Smtp-Source: AGHT+IFw8IvMKNIWd5gWkVBoQRrM5vUVEUtBsHNh2RGRc9tiIamDx3Fd6bbvQwFp4qtR7pf7qpf45g==
X-Received: by 2002:a05:6a20:2586:b0:1ee:a914:1d67 with SMTP id adf61e73a8af0-21ee24cbe0emr22088573637.2.1749481120337;
        Mon, 09 Jun 2025 07:58:40 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:39 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:22 +0800
Subject: [PATCH 5/8] arm64: dts: apple: s8001: Add I2C nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-5-789c4693106f@gmail.com>
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
 h=from:subject:message-id; bh=9566gmKhrX9N7D4Gci4+NELLJwjkHJyrdvGevl4Fe5k=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNxfcAbW3TYkOeYhxAMfsIgBzRWfGSZbef7
 23Ix15IJ4CJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JEAcD/9ErpqdBthzHsKIUK+k175hpDjDyj+anU1uwYkwJjtMAL9LwY43R05KWoiTW/n8S6oPVE2
 lzfDtL6xXQhdryBbbWF1sLB/OwB55cdFCE5at1rFudqKmns1IVdHjMVm3Vb+mtFbOUb9aEAXVRS
 x1NItqPe00vqoGsJBd7mzon+SFIH+8DquEzjt7Qp8RLJkdW+2EI6QzXVqldnVGrcCNsmlS5VAF/
 J9t7/YVXPAs5/y/+6U7lp/Q4/2DAOOu+oWCLLKFCdRA175DeKn/s/BxPRScookg+SY6u7gB8riF
 46pDcoPJtOXP38FCHM44uR5nospwFG3OU6GJp6pZ6UcYv6pxHhJdSU0rpPIsxvSd6Q9PJbuVJYC
 5huGMTnsw66AhStMhDDgQH1EazsbVAaggLG9h2yDfPX8P1bfLiMyHSGBgnqOxGNQ1tLuOzDB4Fq
 i9M/p2tNaeMGXJM3sZfMHvh5XHJm6Hu2ITsF18tgf7x6JZBzM9QcHs0zUW8KTRoaT1g66Gc+9gu
 5A76TnGMK1eZMbEhLOlB9zqfdluhiPsnR6pogyYBMJS6kgiGhBsGeHBktOOGM8GbCkw/Dvu1lgY
 LNr/vdwnNG6iPnrE1gep30gil7258s+kMQuM7W2CQ0cibx8oVUNpdKCJWQcgce67/1jPxZ0LJG8
 20q2BXSQ5Iwm3tw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_075841_122541_AF59170F 
X-CRM114-Status: UNSURE (   9.56  )
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


