Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E33FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxz58oZE8Yp5FA6X2/d+svnhhMgKBtRUyy1sb9Y+PtA=; b=JTzR7YkroCnTKes7KaoWmKGn5M
	+vg2dKvW3DUPMbMvHSpEZAYXRgWzYaSC7vQ0fwGw2MMm3i8a3ntPjxEaw1PBTo2+GM8KuCmD61CXK
	Zgjnd+2EMLPE5d68iVNe9p8lCfooJmCZax/h7PGRhFMOBnuYgA+017eqAEDyXnM3nxlWxCY9dOupR
	6RBUqf8YtdOX1BRjLp+G+uY13WTA9cZlo5Hvdx9dA3k/kg2ahtiEK9EFNNJxO1NTVWlaqaOhvvnBY
	LNwOA2RVruHCVw8cQa69hnO4QPMvnYvKEoZSmYnxtHDsZYuMsfKttkgMM5wqPwHN7lvYazTFfpMrI
	QeO7RJsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1S9d-0000000FVAy-0vZc;
	Sun, 06 Apr 2025 15:43:25 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzP-0000000FUBK-3sZ6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:32:53 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so3250016e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953570; x=1744558370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxz58oZE8Yp5FA6X2/d+svnhhMgKBtRUyy1sb9Y+PtA=;
        b=r8TpMrTJMjkbASDbnJ7W54fCXy8dIVRQOm/mI8fsnTDdpsU5RLq06kqC9p+EoGMQMp
         rPaq80/R/QNj71+hOO9YmJsqNelexN3EgNREEStkKt31fdvC4WhlyjMJaCyJIQHi5CDx
         bpd6I7rvB07JKP/qz1i3hAjcSVeugOvVtbv5cUQfzQBDHDA2ngB9LVOY+9v5nPza4kRR
         +bikpCW/7UpG5wPMlBvUmLuM3fTXE2L4xvSB+3wDMlKxRO858tEKDbwwasUaMFSWxnJb
         PTAUltGOrVytHNWHMq0WNZqLmJtQQzKaOyeE5aactEVZTv7M0ULntpxw3abJGpoH7vze
         v9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953570; x=1744558370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxz58oZE8Yp5FA6X2/d+svnhhMgKBtRUyy1sb9Y+PtA=;
        b=RVIQ5yM11AxX5k6RPJqENbsPE5smpbBQQP7rF3jSyCFLODxIfsXIJ2hZr/JicYsi0H
         jO44xhU2xSMm6mRkdaBj/um+pz0Q0nbyiwLZNyxvXDhflZHjhB9HZ+P25lgPkZAMQN7C
         8muJGRZZ/FrcQSVxqtev/CpRS7BKF63EJ24bUKzbOpglUlbLLpB4bzJfJYjvKP+b1HrE
         5tOPZpXyEpI4AR9NF9qiR8KFjU2NYwT1dHBPwf+OschoiI6UmCSXOFKyMh0eNli/eV1u
         o/VxxcIR2h19IY6zbhDX++6Jmo3SZ4dCevXbPHY6mEnGexxO2FNrFN3kKHO+tuIkRW82
         BGrw==
X-Forwarded-Encrypted: i=1; AJvYcCU9z1tskYSUUvP/A5gY8ifehYqNy4LwfsjC/qwoJP+oZNQ9QVi0tqc/y7eKFjEfELInor+Fy8CzOToKB0MjCqIX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd0PmaXXFPFsf2coGbKNSYQ3r4FfmrpOo4x8lc99QnrVhTw+3q
	oFYyBxYx2a14vWX2Kudef84Q+BsJQIgkqsAb0DMyCz7fYyNlAEb/MLl2E2vzgbOhEyCu16J1e1C
	ye9w=
X-Gm-Gg: ASbGncueUsjgvE8m7jyc1j0JyJa0xYAoCU+eIVkBJPL8huUWx5K69gcy+m4Qk1nwvcz
	BQGbkfPJTltG+Pj6eHadwVWba2A+w9fU3ikU1vCgdp+4swhE3mY5AX7pzb7AkJNOiVQSh2nAb/8
	W7L1pbhmIoi/ggYm4hHxLuMbGvKcGK+v4pI5pYuxuo+efJr5nDSmZwx6ySRWcyGuz8xlBpmaroz
	mTIMh5t9aRHdF2/P3OqCSkwEX/DsYX2XijPxj7vZo0k6s2V2gBuWody+F2VwAVAc4oa+kdEMrI4
	TseM9DBeYL++h/XVJ1g4oJ0pGRtJ91jETMeB9yUEsLpvMohxJ2wxoMc=
X-Google-Smtp-Source: AGHT+IGx1uVsqYbz4JHsuvBApEHNIPiZVATzav+WygbEZ5ZZGgIuxPb0cPGKihRRrdJZqbC0MfnziA==
X-Received: by 2002:a05:6512:3e03:b0:54b:1039:fe72 with SMTP id 2adb3069b0e04-54c297d09abmr1385671e87.14.1743953570058;
        Sun, 06 Apr 2025 08:32:50 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:45 +0200
Subject: [PATCH v2 05/12] ARM: dts: bcm6878: Add BCMBCA peripherals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-5-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
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
X-CRM114-CacheID: sfid-20250406_083251_967492_1BA6D1FE 
X-CRM114-Status: GOOD (  13.36  )
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

Add the first and second watchdog, GPIO, RNG, LED and
DMA blocks for the BCM6878 based on the vendor files
6878_map_part.h and 6878_intr.h from the "bcmopen-consumer"
code drop.

This SoC has up to 256 possible GPIOs due to having 8
registers with 32 GPIOs in each available.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6878.dtsi | 118 ++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index cf378970db08c05c40564a38931417a7be759532..f317fc888da0ef449d9b5153677e6dadd869a7db 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -108,6 +108,111 @@ bus@ff800000 {
 		#size-cells = <1>;
 		ranges = <0 0xff800000 0x800000>;
 
+		watchdog@480 {
+			compatible = "brcm,bcm6345-wdt";
+			reg = <0x480 0x10>;
+		};
+
+		watchdog@4c0 {
+			compatible = "brcm,bcm6345-wdt";
+			reg = <0x4c0 0x10>;
+			status = "disabled";
+		};
+
+		/* GPIOs 0 .. 31 */
+		gpio0: gpio@500 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x500 0x04>, <0x520 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 32 .. 63 */
+		gpio1: gpio@504 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x504 0x04>, <0x524 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 64 .. 95 */
+		gpio2: gpio@508 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x508 0x04>, <0x528 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 96 .. 127 */
+		gpio3: gpio@50c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x50c 0x04>, <0x52c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 128 .. 159 */
+		gpio4: gpio@510 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x510 0x04>, <0x530 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 160 .. 191 */
+		gpio5: gpio@514 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x514 0x04>, <0x534 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 192 .. 223 */
+		gpio6: gpio@518 {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x518 0x04>, <0x538 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		/* GPIOs 224 .. 255 */
+		gpio7: gpio@51c {
+			compatible = "brcm,bcm6345-gpio";
+			reg = <0x51c 0x04>, <0x53c 0x04>;
+			reg-names = "dirout", "dat";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		rng@b80 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0xb80 0x28>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
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
@@ -134,6 +239,19 @@ nandcs: nand@0 {
 			};
 		};
 
+		pl081_dma: dma-controller@11000 {
+			compatible = "arm,pl081", "arm,primecell";
+			// The magic B105F00D info is missing
+			arm,primecell-periphid = <0x00041081>;
+			reg = <0x11000 0x1000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			clocks = <&periph_clk>;
+			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+		};
+
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;

-- 
2.49.0


