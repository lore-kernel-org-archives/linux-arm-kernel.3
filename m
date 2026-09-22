Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C10C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=; b=JL3L9A8r0qRTfX06ihyALGXChR
	lqgFgNPWRJTCBSXehRuB1DFp9ahtIfbBpqARm84s6tg3UtYLQu970jozxoJ319yRh0oYjOlRky+Gd
	OHfD2LDhZhY6F+MN9w2qAKphYjmpQ6cSvgi+/qOP+fN7rR8Ecel4uJU7s0la/LR9TuhuxpyTG57fr
	B9s5O1fIhR3UL3hHHJu2r468L/vhyxMlyFqIzcoWEXlukn00kIfylpDVMYwEyYfy6+OxX2ILkzSIz
	N4J2BvlebyuybJGgHqkcQIkufc5uby3agRI4GDN3c9DC1C01wROK6RXtx6rf8DCSgjQsjtMsk5yCo
	JYcqKvOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8o29-00000003kmL-1YXx;
	Tue, 22 Sep 2026 00:06:53 +0000
Received: from mail-oa2-f12.google.com ([74.125.231.76])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8o26-00000003kl7-29we
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:06:51 +0000
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfb21so3741035fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 17:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035609; x=1790640409; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=JxMeA5Zmxz4VS6CYyv+CjOPx9DidtHHzAabVNf8mFvalvGkpmWYzWwLr6vz8jjiQB0
         ovWsZ0yQAaBn/XpJyZwRqFo0D5Kx5SNOwhJrCOkdXPr1CJ5UumhsF4iNx7OEkXrxQMXy
         mKb2IKtmrpBZ7Ni1LFRYf7cjHWsDmvXFEmyQwa/GP6QQOCRoW86krnJrqftqik1aYoNk
         DhnegNywwFJn5E6MD4Q8qYt4BmituVlIditPq4swlbFED1VXOkxSDep28LpjdXAI8rJS
         LLF/5KyZ7fNUCGDraRkmxY/N4KR7eDfHpYtxsLe5Couf06wZCh2MzZ9hOxIyXYeuqcbn
         NQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035609; x=1790640409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=j9CkKOM4vuGMn812VqxKlXY+A/f8hFarGzI2FpZewHqybsdpOHTDdZAdUKzfna6bCk
         WYg5rsEh9DG0JnZTRdf6PrJYTX4xjEuTpX8Iyd+UMjIO+N9pMaWU5Hu+oP4yT9N23/xM
         PiDN+Dgu8qLzs/y5qsN2MlfW3Be0NmLArfB0IloXrOVDpWUDuBlA9n1ANdsYxF6TCAHM
         NU3CmfyBBOMesYPQTZhg3GvX2DtD+aAB6kqC4+SvrPHId0AfXoyqh4NhpPo1sSymP4eh
         xxk7oo6h/hew55LrGFU2gtOSCVPkifLHZuXY49+PVXdvPjGbytzNDHXqC1Gxs+Ahp19I
         dckg==
X-Forwarded-Encrypted: i=1; AKwUvBwbLftDmkLUuLXXtLimjbr97gx+DSyidl79ctVS7TrwVAioz1cd7WJ+bTW5hOHc6qxHg1mRU9UyJ/OgsbkHbOWt@lists.infradead.org
X-Gm-Message-State: AFuF++nlmTIbf2HFrbj28GV7F/g496GFWGe5wDBun3eO5uSKUbUA5cIW
	Yu+CmeMosj9bwXNyNwVtggdzNGNyrocHjX6+E266q9VpNwD1xy/BK1Ls
X-Gm-Gg: AYBFou1lV9sZ6UoSkx7LywvBFuJG55FQMCEE/pT7MvAbfGZcAYAmd6Tuv2ioPbF+i5V
	h16Nvq5C3JtymSwrsYsPOqR68zIQhoyko1wh/BVtLiOW0fU4CM6LvI34YrH57XHELXxXJ81xXyh
	b/nejDNzNxPNejnZxfX+xV8yTJTsL8jnYDI+h1otA3z0LnUDDJ36sTIcRnDiCCy+76gQQVqaesV
	6S3xXvrZMnosWSXTygLAo5NKkinbc/c3Tml6O9AJcup5h9O4g3hhdUGYXQ5z9AovKduaUiJ/XxR
	KHt5f/rs2CwRVdGn2JKhbWFy3tqaFxpzKC7QERk1JEfEgOZkX2h3OL7RCy5KUBf0sJTIH4LoXlc
	HRew8ZFPIimtcTbCyGF8j+kq+eUL0RPwHcoAm78TlQR/mqm6TeTtofpA1opMw8JxyGTWEzc2/Ya
	BC6ssI2qn+90ub1yjkkB33FfseVAEXXsOQgOZKy30TIhZVi2akxd5lbxt4V4o8k9h8ndoVHN7YF
	Ry7E0Z8wkNgSMs8Dhh2zMxbB4lZ8mShHmK8kx6ycZEfoLgkh1XN9WsPBS9fppJDT5So0YvpihGf
	HQ33En264OjY8+M5CPa0RNWuOCaLPtp3+VY2w+VzEc+U+Ay9cQixKLwJgVJojHZCpiI003C1r6m
	6P6qO95Bmrd4TW5uXgWAt
X-Received: by 2002:a05:6870:21e4:b0:464:c314:ddc2 with SMTP id 586e51a60fabf-486e4bbce38mr12349868fac.8.1790035609185;
        Mon, 21 Sep 2026 17:06:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f7280cf14sm801683fac.13.2026.09.21.17.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:06:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:06:33 -0600
Subject: [PATCH v9 4/5] arm64: dts: allwinner: h616: add PWM controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-h616-pwm-v8-v9-4-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
In-Reply-To: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_170650_594330_F3674DCD 
X-CRM114-Status: GOOD (  10.49  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a PWM controller that can provide PWM signals, but also
plain clocks.

Add the PWM controller node and pins in the device tree.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..90fe56a1d3cd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -281,6 +281,17 @@ watchdog: watchdog@30090a0 {
 			clocks = <&osc24M>;
 		};
 
+		pwm: pwm@300a000 {
+			compatible = "allwinner,sun50i-h616-pwm";
+			reg = <0x0300a000 0x400>;
+			clocks = <&osc24M>, <&ccu CLK_BUS_PWM>;
+			clock-names = "mod", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			#pwm-cells = <3>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h616-pinctrl";
 			reg = <0x0300b000 0x400>;
@@ -385,6 +396,42 @@ nand_rb1_pin: nand-rb1-pin {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PD28";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pin: pwm1-pin {
+				pins = "PG19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			pwm2_pin: pwm2-pin {
+				pins = "PH2";
+				function = "pwm2";
+			};
+
+			/omit-if-no-ref/
+			pwm3_pin: pwm3-pin {
+				pins = "PH0";
+				function = "pwm3";
+			};
+
+			/omit-if-no-ref/
+			pwm4_pin: pwm4-pin {
+				pins = "PI14";
+				function = "pwm4";
+			};
+
+			/omit-if-no-ref/
+			pwm5_pin: pwm5-pin {
+				pins = "PA12";
+				function = "pwm5";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";

-- 
2.53.0


