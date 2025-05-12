Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239B8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13/MDnqvilhzElhCywJcKpSZ25QUsLbrCE4P0TR4EUU=; b=rW4/q/yyqcqDznE1b9WUv9cIbB
	1omOLGtDZ1vsrQPOzgVhFk2NhhPmUoc1P9soZ+OKG5ahvVFcj71bwcekA+Q58iMMXbysUuzRszQgq
	bEN2f/zY0PtT7m3OHnhIhgdUnasREgvWpqmf967kyYq240K2vanF0W9xAsIL6wk8LuzUNRNUqww+X
	dRbgvVzyTVdw5ZSlLYHbFwa95RQcFSfy7HNgPvEIXPkHdEJsl5mBXFL+z1v3nuIgdlFLq8vR4U6P4
	zyVl3f8d/7Wx4IAwJEDAPxcQuVmih8XXXJd6ktxB9LNVFCqHW5+EzHpd0gy+8i6CkdcEVHZ2O+xGd
	6H4Q7nqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESEt-00000009NSs-3zZz;
	Mon, 12 May 2025 12:26:35 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERuz-00000009KvU-0ejI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:06:02 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54e8e5d2cf0so4408492e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051560; x=1747656360; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13/MDnqvilhzElhCywJcKpSZ25QUsLbrCE4P0TR4EUU=;
        b=Ap5FzGL86SsMeCQB2dYm3cnu+8aVUn337sxMBlp4ZtbIgMx+t8ZasFGonu0PmDv7nA
         hi5eDplolmlJkKTkAGcuenA0ULe8fk7p+YMDlAn5WmjdNQ/40o8tP+lDm78KpI0vgiuD
         G7TH6otN5qiABwIyKEau7C7Sv4Z0S/QM0vuz8t+NFe45pDz388wvrCScJXTjDX45mWMR
         gcvd9pOgeeyEFH8zPyZv9f8uN0EgFMJPSPZqJf6Bs+ACQ29zNXWjav9T/jbGIPEM6P72
         MyeFsFPkmIAaPiQCC0vJ7n6Kudfg/0EAn8ggPW7spbyjkfKT3IBsZZxeOWxW1jEH/8DR
         OXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051560; x=1747656360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13/MDnqvilhzElhCywJcKpSZ25QUsLbrCE4P0TR4EUU=;
        b=MEe+ULeLj3cFN126uaFAvFmD+NVIzUls1BK1kJ7FQFx3KOy0o8laaTZOWYChwoOriD
         8BeFenBSPgcyNEHJggaeFtOsIGlthsJBflevKLqoJSMqf9EQen5aBmIZnfRWFG9w9c8A
         6rwg8i4v6wU1BEpMEDHMLFditlpXSviOcufXqocyIFdU/FCfneNk60jzbisMmCdRxro1
         IrrGr6Niqwjxl5n+7780tMbwUof+vzjVKkeGYmIBJ8vCvcvPYZBOajGBnspysHtctQ60
         3G2waVT7EVqbd9YOmErNFIDyi/dqyr4NTUiOesmsJITYKwv84A4vtv1hWmxbALloUH59
         xx4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3cuKJ+QMxjSGFOBSBPB20kW8B4yQTSL69+MPbzbKkX0Sh21dh1crs6HwFENjORdO3jXlLiA+sYmofQr5xvtt2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5q1OuWAu/PrnEl6Y+PVBbTPlxGjtTv1tPmIJBRjYnq0UxxJ8x
	2+9XIQwIDFRlXHobvMqjez1Vi0lMDBqC5WodufszBhAqhxIhe3qxQZ0Ox63GMLM=
X-Gm-Gg: ASbGnctRSzNwPTwjCF1cO0Lu0Ly6uTH/cSVZBSVtalzHcA7rVAn2lat5JXhha8Kumw6
	GFLy3gZCYz7ukrWaTdJR8ufHIQQ0X1tftYcDc7BKO7QXTT07bs+CKSsLsIEzotLYNQ1hbvzdC7p
	ZVOeGnpoix4YGu5wqtTLqgnEnzF/6Vg11FDysnONbtTmhKK4j/QjcU8MMD+x3DqjISd/tNdfGho
	PulGsdp5oY5g8LqczjmTiB5SMBo7A53IN9J2hquIsikTGbaZpK1ApvRK/X1YrA44ALYojDfh4qX
	fA35ITaRjb6arlOjcnuWztfU2c0TgCwpO3wmdgBx8Nv6GrHMWEfmuBkXDMYRrQ==
X-Google-Smtp-Source: AGHT+IFzh/yJYzxWy00yNIwvV6Uts3H5TcOvRtw6gs/HO6e30umcHnBY9xrWmL0juAaZeBMLvfWD/Q==
X-Received: by 2002:a05:6512:3088:b0:549:8c86:9bf6 with SMTP id 2adb3069b0e04-54fc67e61a5mr4220105e87.39.1747051559621;
        Mon, 12 May 2025 05:05:59 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:05:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:53 +0200
Subject: [PATCH v3 07/12] ARM: dts: bcm63148: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-7-86f97ab4326f@linaro.org>
References: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
In-Reply-To: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
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
X-CRM114-CacheID: sfid-20250512_050601_226698_8294EC30 
X-CRM114-Status: GOOD (  13.09  )
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
index 53703827ee3fe58ead1dbe70536d7293ad842d0c..e071cddb28fc2888b8f408b4bc275290dd135642 100644
--- a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
@@ -99,6 +99,62 @@ bus@ff800000 {
 		#size-cells = <1>;
 		ranges = <0 0xfffe8000 0x8000>;
 
+		/* GPIOs 0 .. 31 */
+		gpio0: gpio@100 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x100 0x04>, <0x114 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 32 .. 63 */
+		gpio1: gpio@104 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x104 0x04>, <0x118 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 64 .. 95 */
+		gpio2: gpio@108 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x108 0x04>, <0x11c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 96 .. 127 */
+		gpio3: gpio@10c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x10c 0x04>, <0x120 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 128 .. 159 */
+		gpio4: gpio@110 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x110 0x04>, <0x124 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		rng@300 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0x300 0x28>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
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
2.49.0


