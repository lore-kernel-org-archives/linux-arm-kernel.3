Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7DCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxJsf8FE0MuuxFa/Fkir6Q9pPJ5F0EO+7sE3OSG544w=; b=Qk5NgKnLxAeDsaX9bWd0TvO+mN
	qEAv1EpntuLr+vhBrcmahON01zUJL6aeFUx4Aj4eqSqwhvIEZCOQBu3Dxw4XfJkf1HR3iPhKDWWTR
	J1y/rmcRcV09MMs0Vby9U0HQtIHKFj0QQ7sBO3hnk2n4+VUeNe47uIzZ/aG1kpI9Mc3sFn83wwJeE
	z5Bp7i3VFKkOhvMhHrHiy7xFE9qzqOqV8dehh8jDvoPP/sYdwhZN6aJDj/EYsLMWQzoCUhnE3qxtR
	W4+OspLszEdwry/XFgu0UMLkr3+hhhZkzwt9S2Kylvt5qUu17h8fWRv3lgCTEduCRPRC6l0pRIrbP
	1WYeBOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4bT-0000000Cr0S-0Dgy;
	Fri, 28 Mar 2025 07:58:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Nz-0000000Conc-46JI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:17 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54af09697f5so1751231e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147854; x=1743752654; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxJsf8FE0MuuxFa/Fkir6Q9pPJ5F0EO+7sE3OSG544w=;
        b=X5l95SRLMESvKWFV6QHb/lyAAh4IV2Keau9SWjJrGu39f450F96CWQGTMplSJPdFx9
         cVcwAJwa6xoRjPElVqF7oJZ3bKX29UGVywu1o0SbljOyAqBTwnqGHX2o5u+D+EHbSTFr
         OMXINJo9bPkYIW3AdU511NDAJCCBkNL7lPK/00vhqzlqX3jf8C8ogzpXtAzHb2F/saJB
         de07sYHTH+adB7hAxs3sB4pEuQvHRhUGDGWUts24G1IquJynsO+T8fPVGzxpQBHeGsmC
         KOwL322qPRFyGjtaoAE+f1pWNcIgKRtPjbQez6jvuSCvrBncUJhxPv5p8sXofJbzSCFf
         ISOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147854; x=1743752654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxJsf8FE0MuuxFa/Fkir6Q9pPJ5F0EO+7sE3OSG544w=;
        b=OQB/ZG/axpwJYXV6ozB6Zfvy7Yl539Q/9qF0af8kBEDXTMV7VBaJ/zQoW1hPxI6AOT
         tFpd3I9LcBMwF7B2ZCyT68bDfBa1Qiw/kMBwwiyplJzOh2Hn/Rl4BYf3BN7RGpWNMPtE
         y6+RIFOhkpCvbR+0kHmToh5CTPEFnsOZtx0ZvNQsZ8m9JrnUBAZxKz8bePM4pAmtTzWz
         cKnURj6VyI71u468PmP75tP8BpaYh2ibq8KNObjw2fT94TgkbL/wQtPhPQDAGqi2He2G
         4EKqB1T7oUm4D77C1LEIhOThJqdjiLlKTyF3N+PpyjdPOF3qngddE3cCkmqMpb/r/9ZF
         vKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjkE+l190NyMf7TA+sPuQ2Pg7iiTObKp17TxRxMRKOGJfWjftobKG2iCJEdbTTn2OStO7Hfek+Ya9uffVB7I9f@lists.infradead.org
X-Gm-Message-State: AOJu0YxxJaHAbC3YjJIVhYvz2pXM7391A4vH/AD2ExW8QQxine6SLD7E
	lzdICxzLKwfGJg1fnsoj4nKnMGAL+JkhiUc3eBEnS6DtezEuY6rzhSNSJ/VRKgY=
X-Gm-Gg: ASbGnct/5Nqo8iorLPO+OWN3tyMwk+wwCMJLGlI1ZVHWJ8HQYvLujzoHho25kOL8kEU
	pHcOZCe8bvHQu34uCaaJgosr/dNWawvRlqzFpunzOK8ahXE3fpQxD0XUW4bYqrHBkBQJTTmzde0
	0fG8000eomeSAhTZ4nP2RBQ7Y7DbgBrgGA482PuppzWRCCyFLQ5UBLrwh9eed3fyzIBT9RXblLR
	Ppj/ww44KlnRf/5REjbZVJ855HKjA8UXJI1rxvx88PTqoP8EcHsCjsH70OZdOX2S4YdHgNBqlJF
	FmpeapAUxrumh0bEUHM9EtLIFVB41MdvcoHmimEwklLL5kvBtCl7E6I=
X-Google-Smtp-Source: AGHT+IHSoffSWfcJMRGuGw6L4wY74EAeuWbkQZylOYsn5uGLkfOegEfRmQeY8GK/mlQStmMGQIfdWQ==
X-Received: by 2002:a05:6512:3e0a:b0:545:bb6:8e41 with SMTP id 2adb3069b0e04-54b0127873fmr2753525e87.52.1743147853995;
        Fri, 28 Mar 2025 00:44:13 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:43:57 +0100
Subject: [PATCH 07/12] ARM: dts: bcm63148: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-7-e4e515dc9b8c@linaro.org>
References: <20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org>
In-Reply-To: <20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_004416_020481_8AF947E7 
X-CRM114-Status: GOOD (  12.93  )
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

All the BCMBCA SoCs share a set of peripherals at 0xff800000,
albeit at slightly varying memory locations on the bus and
with varying IRQ assignments.

Add the GPIO, RNG and LED and DMA blocks for the
BCM63148 based on the vendor files 63148_map_part.h and
63148_intr.h from the "bcmopen-consumer" code drop.

This SoC has up to 160 possible GPIOs due to having 5
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63148.dtsi | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm63148.dtsi b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
index 53703827ee3fe58ead1dbe70536d7293ad842d0c..0f6232f0553ad62fbaa7d8db251a0204ed6ed782 100644
--- a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
@@ -99,6 +99,62 @@ bus@ff800000 {
 		#size-cells = <1>;
 		ranges = <0 0xfffe8000 0x8000>;
 
+		/* GPIOs 0 .. 31 */
+		gpio0: gpio@100 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x500 0x04>, <0x514 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 32 .. 63 */
+		gpio1: gpio@504 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x504 0x04>, <0x518 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 64 .. 95 */
+		gpio2: gpio@508 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x508 0x04>, <0x51c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 96 .. 127 */
+		gpio3: gpio@50c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x50c 0x04>, <0x520 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 128 .. 159 */
+		gpio4: gpio@510 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x510 0x04>, <0x524 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		rng@300 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0x300 0x28>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		uart0: serial@600 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x600 0x20>;
@@ -108,6 +164,14 @@ uart0: serial@600 {
 			status = "disabled";
 		};
 
+		leds: led-controller@700 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm63138-leds";
+			reg = <0x700 0xdc>;
+			status = "disabled";
+		};
+
 		hsspi: spi@1000 {
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.48.1


