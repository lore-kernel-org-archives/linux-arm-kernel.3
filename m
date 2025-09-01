Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF06CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LajjRTBlYEsi7dzIrIXznZEWMv2DMfPXR+f7i8S1vlg=; b=ax2tDfT9WA+qQW9V5VnjWfdOoC
	pIKHp6l9cW0Dl40iWGvWTO7Rfi5ZQmMtxcXkPkrrxFh0AabEBuDhPfsiAfKdhHtnSWT9qYOHEpciy
	cytPxsw+onYuMYmR+P6YA1dMrSkm8Vk3EniSnoh0Su2+ZW2gpjvSJ5EjMu7lFj4U5YA8VLWwX88me
	CERlExVSyPfFsI9qwP0tvMqiwb+A7tSG8jqf+BxYgP1h/u+h5a58IaogPfeSFfk6n72dTXVPNpqMZ
	CxvRk4skE6jKeKp9RSyANYUazfhz1PeR0xPvX8In1TyuWC0/fBxMEAo7Hzirhzs2J0LTlKZCFgrts
	g0NXY0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Vs-0000000DHjQ-0pre;
	Mon, 01 Sep 2025 16:36:12 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3za-0000000Calo-1H4j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:50:39 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso1185620e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731036; x=1757335836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LajjRTBlYEsi7dzIrIXznZEWMv2DMfPXR+f7i8S1vlg=;
        b=diMVG9Ub/jAuaf/MS5WCkSNTlgJpKXEFzmTSzsSKCwMXoJZZRkaZLEe1jaaHEdPonM
         /yv4TgEMoaFHKL+05RZyhirY6R9OcYr3lubk/KH7G5lQi1cug/s6qSCSsQtPtWl1S6FC
         M3T5rPlsaUJ46dZIJQgDqu24ro8sYglcl6n/I672DQOuuiRi53kmMSon7YLle8Kli0xp
         C/4U967J4LdwwSAsCAywUEue9HUeI1VvkBQrlfjFwHoov1Oeze75XtQVQ4xLQifkWOmA
         saAgFGC0vSed0znbjJbqOsZ1cUkPLMJUQMaUoE9IIhtYkLOR3fZRZtvHDXJ2TfgSfGP/
         e1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731036; x=1757335836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LajjRTBlYEsi7dzIrIXznZEWMv2DMfPXR+f7i8S1vlg=;
        b=fTT3GdT0XeJZ5YH8cnRdmhrXPha8CColIsHxDG/ASBRD+82Mb9XDtsUe9iEy73vnlj
         zBVUuEhldR1jMBg+HPiSLTRTWmXfQ+RZJrmd532aMoW/uOGrOpNDIqzrziYzj/0ofXbk
         izLUX1e4Y+ay5djiIXkDjjE9ucuuCZdRuQlMZ8T0RmOKt5SQA5j/q0JlpoxpwC5+ItoD
         8yeeO7LES6IifQA7ldnhcXNanaImUWJ2BJ7EeNjs57QpFaQ09UW9TApn6rVD8RWfhMnW
         DJgaSeYtdz9NLn7yENP3uLSCiTrgkHorh2U8+MauwWe5Md2yW0IK9Y7BDta55AcTSEes
         Ok+w==
X-Gm-Message-State: AOJu0Yyt/8ZiGrbExGYdbf1IXDAbXM46N8Map/a7w84UwkrVzDjADqsk
	Jlpgi+b5PgAXYTboMlrHx/ToDcmV7qK5gWA9WiGS/qo4/UXmL46+O0HNvwcDJyuP31c=
X-Gm-Gg: ASbGncuEa6+YsKPYQQQU0r0HMC4qoL7ME0SWPXfmyg040tncHvaFkYxSKjsXLOOCAtf
	8nqZu0YcXMuRd4k2NWAMOzr6rb7RJAQs5Ow4VlJ+Kc66LCLh0f3Rj9uc6Mb04MTC/acXTEDWsQB
	SjX6wFMQjlFRKi1bXRd81yIutP5CLCIBt8tbYYthLdWf4zK8yuL9FkWz75g9uvo/hN8FniB4fcO
	XuWqJwZKPAAWGrtFsMDLr+VtRXs4bqYTvxFioh9wh9Qe81pMmSuvv9jV26ab4ZbUgTmSav55K7L
	beGjQdhCaUmoa/WzVHVfMIolKcNUJ5gok4LoLho36tsk/e4CoXb67+giDkDZ32KER451f7L4R8k
	QrlaV8QvBalwd7DIKFwSeo6NWiU3uvzch
X-Google-Smtp-Source: AGHT+IHe4MCOdvoC+w1MXtumj6zxvCUtfLsSeBvyDtpuGXxqb/TDaowzgdOE6aacSmVQ3aHqMU3yyg==
X-Received: by 2002:a05:6512:b24:b0:55f:4ac2:a5a8 with SMTP id 2adb3069b0e04-55f708bce0bmr1616268e87.13.1756731036438;
        Mon, 01 Sep 2025 05:50:36 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6774bc3fsm2926155e87.59.2025.09.01.05.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:50:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Sep 2025 14:50:33 +0200
Subject: [PATCH 8/8] ARM: dts: bcm63148: Add STB I2C block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-bcmbca-i2c-dts-v1-8-ad81f60d4276@linaro.org>
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_055038_346670_CD69388F 
X-CRM114-Status: GOOD (  12.60  )
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

The BCM63148 has a STB I2C block.

The peripheral range needs to be extended to accommodate
it. The Boot LUT is at offset + 0x10000 so extend it to
cover at least that too, 128 KB.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63148.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm63148.dtsi b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
index d94da16ab799c0ab25946e9cf24ae25812e85817..76c418030fbef3352e8266b679541c9129338eae 100644
--- a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
@@ -97,7 +97,7 @@ bus@ff800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0 0xfffe8000 0x8000>;
+		ranges = <0 0xfffe8000 0x20000>;
 
 		/* GPIOs 0 .. 31 */
 		gpio0: gpio@100 {
@@ -197,5 +197,14 @@ nandcs: nand@0 {
 				reg = <0>;
 			};
 		};
+
+		i2c0: i2c@be00 {
+			compatible = "brcm,brcmstb-i2c";
+			reg = <0xbe00 0x60>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.50.1


