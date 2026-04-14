Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0C4F9D0F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 19:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rx6Gs/k39gM6qSQMBZbg940nHO3jpX+P2ASmGy0OCbE=; b=X7phr0GolnCieALAlKBm12droa
	uyZ8NtkKzesYPZzYmI4fL+eT0SA4AzwdKNbhdzaPKiMkU9QxtvDfS3tgXmZMM35iomU8eZ7XMS6aX
	ApLfMnDGhDkYJzk/oYjtQyVsG1Pui7j+CXRTIDdmov9vAyxPpmO9fJhOMAft938ytyhMNMMJDllTf
	iobqBI8yaF8TmO8lRvg5VFxq20DXG9ckCiCDWQQN3PDM3yg2edZ1qeRMBqINyixgv/Dk0Txzqk5ih
	cXit7LrjNZyaZVIfvER3LPBqKcZ3gJj5XQjcxLb4U4riMPzmeH1QwESDVIq+0HovcSdjG9VpnZu0u
	h1jPMB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjq5-00000000AEl-0aPL;
	Tue, 14 Apr 2026 19:54:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjpz-00000000AAx-3rJ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 19:54:21 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43cf906b007so3499020f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196458; x=1776801258; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rx6Gs/k39gM6qSQMBZbg940nHO3jpX+P2ASmGy0OCbE=;
        b=pu3CBitUrzpTVRk1K6bZeOm6jw7HDaV3a+8UJ7lGpKwK22K6CaEdJZ09AyHcIM9TWy
         O8vcopSm22D0RAuak8qywcucu3iBAIgBA8oF2Ujw2bQCMrflbhDYXQpYYU1e66nZoAzv
         2b+rIzbRXrKAWZKD87F+r7XrJSeGwLFYoKS0x91vh2BbX6sf+lL0H0ZFAzpZu+/ZockW
         JIE8UP678dDT5fmfhpDuPnQX1l3NB4si92omgQ1Na9ClulisqUyJS8yOUVDuJNWizT7T
         r8L8nEYC9Pn4dIAUaRL6tEvPVB3sQDe72LYr7kT28REqKh/pB2QHol6oGVwe0v2o5aVd
         opKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196458; x=1776801258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rx6Gs/k39gM6qSQMBZbg940nHO3jpX+P2ASmGy0OCbE=;
        b=SiTWjeiE9wEeEBb/3S7Rw2bN97tcV6G1HYljVMXcPUTW90SOydqLAt3IRJQlLHOB0Q
         VxL2LPlgX6leBw2K9t6hENpnVx+mDelGGSBgryidUnK63igffrIKa6CLQf+RkL/1j51Y
         PuaSEsw4IttZ3MPWuP9nVghdHABZKTf7wRyqKYKJd98JEzdjqClcHuBkvuumH1Myk6TQ
         8RneIksOhdYqX+Qfh78ad4TUMEmGCzXLT6QdOOd6PUo6kNSqC2WeU75xgsknEqrA4E4O
         3DC/vuEvA8H05ihURvyEXJ6dz4cgs9gC+62DZ83vLQsPmN1AVw8EzxTcvfxaTj8+Dxe2
         P63g==
X-Forwarded-Encrypted: i=1; AFNElJ9P2kxhdSvegwGBWOVg5GdKoDan77BUX2VnAyJWhVxr2Q2lVGvLjUNAjnAMWYjBoa+WVasWBjzOTqTaOknL0wU6@lists.infradead.org
X-Gm-Message-State: AOJu0YyvBhvp/0sngdkKrUY2H1v5szHF+QafUrUA1FzHC8r2k1EIQN3w
	peFJrwuEewRQ11XEDL77XchY1lfzVcVv1DODWddEP46cxGmb7THTpAUJ
X-Gm-Gg: AeBDies3p9mHEpuUAEw04tUowwRnk5A/S5WV+avZOjB5cV1PRblWPIs+BghtoZbKkgB
	it1qosTZq1WxVAH93GJ0q0vDb56dJ1bvsXJO55jUyv+Yi7TuanumUflzw0jB8WJfnm39zqAK40s
	215xKY4XrgpeulxTLhXV41sD0xCwfSLGEeDNRNedeiIwfYJ+g1djWp6FvUbNBuxhbdnNCice2IQ
	MWFUD9PZLqOrR7BOTDqL+yYkUN6aw5PVT2dQJyNAOH069yywCgUH6A9T7WRSsPmQQwR4Xi+htzs
	dujUuFUroPHQuJjZyDg1xTtFx6ccnnXTbxv7dv2ETR06sZUc8su/V42AnjhivfncWf47il4Ho2+
	wAr6EevjOLlhckgcuopDWgrWpY50FvCwzzRrV5AlaVSLj4/Ix8p1nzDf7hf+gaCeQ9/74fzJ7qA
	bYcDqFyOq/GOyApba9RO194Lkb3+cByn6da91up+Zl00OZ3e3cSyHo6onnMvAtP3bafsQ3CIB2v
	d+p5BlGsPl5wmVFfXuLF28=
X-Received: by 2002:a05:6000:2211:b0:43c:fd92:f432 with SMTP id ffacd0b85a97d-43d6425968amr29336493f8f.2.1776196458135;
        Tue, 14 Apr 2026 12:54:18 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:17 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 14 Apr 2026 21:51:53 +0200
Subject: [PATCH 4/4] arm64: dts: marvell: mmp: pxa1908: Add reset cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-pxa1908-clk-reset-v1-4-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
In-Reply-To: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4013;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=kl4so4YGhRFTk6k5KZvqqawzD5p7cMzaSqktF31UoyA=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU68sktuSvCp0Ohk9bsnNbry6xribDI2aM+cl2Pgp
 3nYbqp/RykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgInwVjIyrF5ZvTbw2TfG8PI7
 h5onnri4Yu+G38v4S0qOBslK/zY6xcbwP+kd5y0Wl+rbMmeufLL9vP7LaeFZmddqyiocpaIVbuq
 /ZQEA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_125419_995562_0AC3D208 
X-CRM114-Status: UNSURE (   8.72  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add the newly implemented reset cells to the SoC dtsi.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index 5778bfdb8567..05b56a759e27 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -132,6 +132,7 @@ twsi1: i2c@10800 {
 				reg = <0x10800 0x64>;
 				interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_TWSI1>;
+				resets = <&apbc PXA1908_CLK_TWSI1>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -143,6 +144,7 @@ twsi0: i2c@11000 {
 				reg = <0x11000 0x64>;
 				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_TWSI0>;
+				resets = <&apbc PXA1908_CLK_TWSI0>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -154,6 +156,7 @@ twsi3: i2c@13800 {
 				reg = <0x13800 0x64>;
 				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_TWSI3>;
+				resets = <&apbc PXA1908_CLK_TWSI3>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -162,6 +165,7 @@ apbc: clock-controller@15000 {
 				compatible = "marvell,pxa1908-apbc";
 				reg = <0x15000 0x1000>;
 				#clock-cells = <1>;
+				#reset-cells = <1>;
 			};
 
 			uart0: serial@17000 {
@@ -169,6 +173,7 @@ uart0: serial@17000 {
 				reg = <0x17000 0x1000>;
 				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_UART0>;
+				resets = <&apbc PXA1908_CLK_UART0>;
 				reg-shift = <2>;
 			};
 
@@ -177,6 +182,7 @@ uart1: serial@18000 {
 				reg = <0x18000 0x1000>;
 				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_UART1>;
+				resets = <&apbc PXA1908_CLK_UART1>;
 				reg-shift = <2>;
 			};
 
@@ -188,6 +194,7 @@ gpio: gpio@19000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				clocks = <&apbc PXA1908_CLK_GPIO>;
+				resets = <&apbc PXA1908_CLK_GPIO>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "gpio_mux";
 				interrupt-controller;
@@ -215,6 +222,7 @@ pwm0: pwm@1a000 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1a000 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM0>;
+				resets = <&apbc PXA1908_CLK_PWM0>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -223,6 +231,7 @@ pwm1: pwm@1a400 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1a400 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM1>;
+				resets = <&apbc PXA1908_CLK_PWM1>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -231,6 +240,7 @@ pwm2: pwm@1a800 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1a800 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM2>;
+				resets = <&apbc PXA1908_CLK_PWM2>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -239,6 +249,7 @@ pwm3: pwm@1ac00 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1ac00 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM3>;
+				resets = <&apbc PXA1908_CLK_PWM3>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -261,6 +272,7 @@ uart2: serial@36000 {
 				reg = <0x36000 0x1000>;
 				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbcp PXA1908_CLK_UART2>;
+				resets = <&apbcp PXA1908_CLK_UART2>;
 				reg-shift = <2>;
 			};
 
@@ -271,6 +283,7 @@ twsi2: i2c@37000 {
 				reg = <0x37000 0x64>;
 				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbcp PXA1908_CLK_TWSI2>;
+				resets = <&apbcp PXA1908_CLK_TWSI2>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -279,6 +292,7 @@ apbcp: clock-controller@3b000 {
 				compatible = "marvell,pxa1908-apbcp";
 				reg = <0x3b000 0x1000>;
 				#clock-cells = <1>;
+				#reset-cells = <1>;
 			};
 
 			mpmu: clock-controller@50000 {

-- 
2.53.0


