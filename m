Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0294AC36013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0VhS/v22NU8eHmN3wX2UOpbzS0x/EJicz5QW5NMbiE=; b=dIc3WUCOKbPAh+sOQMS5oGwbMA
	OMY+uBB5ZZR82P9UigWkGVKGi+im3GK/McRaqGXGEXZAPXcJLyDvo3VkWFh4UFIoesx7QoDT2gv0U
	wgYXm2MpovaX5PiqyflK1PN7TjtmErA9w0+FE7puI0saKIiKGxPQtdMzWsc/UXhS9ABZum3/8z86W
	dQMLWsVTw1T2GrjPA6dogeUkJaetVp7q4TluFQR85FkwXDa5FdfVXFnyZmC09RLKKiSbTYHeP4fdE
	lDNOlB9KJz2B5W6PyYB4tAYXiIfkiSTyx9FsIDBrH0XmGvYCDC2/3Qn0T96xjxgO8cDd/v3DIAocl
	on+qUlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4RH-0000000CpnM-1yBk;
	Fri, 28 Mar 2025 07:47:39 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Nq-0000000CokP-2sAg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:07 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54acc04516fso1799968e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147845; x=1743752645; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0VhS/v22NU8eHmN3wX2UOpbzS0x/EJicz5QW5NMbiE=;
        b=prkZELBamvc4g8ZVcCIW1Xq4arMC+pSopphfnVBumM6u1ySvKrl3+EoISzcgv/Ww/m
         CorhF3PKrxfr3m7WDxTaIQhVoZwVQkxiUle4rH533dhcQ9nCh3doR1pdxjKgMnqjEGfm
         JBPhsz5mA4R8OINA1ZbelCCw0Hz31gHChhONzFu2xK8jc8U5vyRqnJgrs5S9iSIQLUce
         TR61dtHdS2hFifuor/Cxzx9SEeCeJL9XzzJKQH52Ywif0yKCyCIyE46Gfi4vz2Sbloyb
         DJGZfr/r/2jyufjT6Bi1LHozSvFpjqL5uqqPrmnrF/zPqhRglb8j8PQPJ7Ut4DZam0YS
         EB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147845; x=1743752645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0VhS/v22NU8eHmN3wX2UOpbzS0x/EJicz5QW5NMbiE=;
        b=O92/G9XbdVISc/tapsMky5ng3ACkYSbzx2pbUJHVw/WAmUOKiii8ymvM3eyzT4VSqT
         hansyMZfCHKBp/5eqeoBnN5sPQZif3owpvwsGsO2XPji6mXwZUqaRBqc4u/YxN2YYkuU
         jziKtoMIpzvXd8zxFTdOEFP6Er6x6xWA8XhoyRB38vW8rxjwBOq3DzQgPWMCEb3qTkc8
         W92oijXsApmwsXc4wQCE4/ULQ+AFHeJIavT+7ojRVLjhUH1ztNMKORyFSLmJ5/XTwjXj
         AdRZ3FUvcfShKGkPcwuwqnokvccq4vYqJCTLrMoSSJxCNvG/CW5UT/g4mmHyu7mU5zTS
         SRJA==
X-Forwarded-Encrypted: i=1; AJvYcCUAgPsF7PpBmn9Pz0O3VAZ2bbiwa9xFpZhl4FqGhBNmA9MRlizuO8nCJV30IX1IDrJhjLYyCGT1ySxy1Ra7WNSk@lists.infradead.org
X-Gm-Message-State: AOJu0YwbGHsFZXJrj3ieuE2MQPtW5VqCEkm9NVdG2B2XHll34MyAY2VM
	43uw9Yg5LSbp2zvhiahrn6Iu8TOMv/mtogkLvYETcjiHeb2SpyIAElu8NNXplXk=
X-Gm-Gg: ASbGncuD2XhoHKg3i9p5rvwvGv9LLlw2b2Ps+RtbJDCKF8wVfx9iWhf0Kz7enkgfqVo
	L2/VF3KoMTpqQEwzeLSQK3eDUB5i9GZp5yxgKK3rnGFAXmsfkHY3QRLgQ3F4ldY9GLXfLokXZwo
	kKVW3Cf7ZtBJ0OhGPC8PU5PPspwS4bGrQglrEuQ9hO/xLc6kZYEh25UpT+kyY3Z2n9e0nqADex1
	2ujN/VvHYOiFbYVILjQ+dpN5oMKP4vC3hscueLCvvn2l3SOuf8q+C0jvigghIXN7u9RVqO2e2YO
	qyVHSe7qS6Dp7AmzPq9pAk/JVhyMx72z0hYyiVJO1u8hJ3a8gBcmRZllFpze4wb71A==
X-Google-Smtp-Source: AGHT+IFqexEpUV8AIrXmhig8TO6o/adeivq1AYJStXwRnF5UkTeMDdMVIJ/YWHWaksBob2pUlYpnUA==
X-Received: by 2002:a05:6512:10c4:b0:545:60b:f381 with SMTP id 2adb3069b0e04-54b011dceb2mr1996778e87.29.1743147844697;
        Fri, 28 Mar 2025 00:44:04 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:43:51 +0100
Subject: [PATCH 01/12] ARM: dts: bcm6878: Correct UART0 IRQ number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-1-e4e515dc9b8c@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_004406_726010_6429682A 
X-CRM114-Status: GOOD (  12.52  )
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

According to the vendor file 6878_intr.h the UART0 has IRQ
28, not 32.

Assuming this is a copy-and-paste error.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6878.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index 70cf23a65fdb5ac7ed9eabc986f4ebb4df263c43..cf378970db08c05c40564a38931417a7be759532 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -137,7 +137,7 @@ nandcs: nand@0 {
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&uart_clk>, <&uart_clk>;
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";

-- 
2.48.1


