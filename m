Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC07C98309
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=; b=iJ6ivis0yF1Ec4P9yqNTvd6aSj
	h1lzSomlNpUpEbHquQAhp1vcZAQBVaqpR0hRa4AH8Ghhmde7TRk45Px87k3XbyK9u6MyUiDl1Jkaj
	6r3+kEpXQTHtGaf1KZMrnPQha4dfoBGcFH8etG4/LWgPsc7UtQ270rBRurGG8KX9rkJ3lZeh27BcC
	3e/aH+jQ1L4WPIwk/YqtFh6ILcFzDYKFprzPY9i8xYvOxg7gi3IjEuma8gDsU36yprgNHHrqLHWee
	PEv19bSrL7nftETNp8a9Vap90IAwFRbKhYeLVcgKxibO78cGg/f4nGBGHA0JOlsK2y5UugXfN7XGH
	vsyxFoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Few-00000007ArQ-10OQ;
	Wed, 23 Sep 2026 05:36:46 +0000
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fef-00000007An4-1OHw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:36:32 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b37a2c0356so397457b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141788; x=1790746588; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=fPIAxPcxX8geazQ1fhFKee1khztHifuEmmaBatOEEZHMQSwTFip5fd2rSSlO0NCaW/
         osSbN6j28W3u5r4MV1TRyTT9E7DeTeUF/PdtoJ10SqZsm+KWZozip83CsS0xHV4dWmYi
         O6un/TuiXdaWeosJkWaFO0gKmp92XmscmCjC35oGsjheVuaRkwlRjXaBhk9SYDS0di2u
         0OcaCy6iNFahHuvccoB+65fXHZbTq534B7kVK6IdAvBnMiQZuzep3YIrNeEjrMlPoAJ/
         9fqSfD2PaVmbmHNGf2LFJWF016o4Dnahaa7txN/6OZNfICpcgm8go5MX5YI9sWJgnudH
         9WYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141788; x=1790746588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=cUEgN6Gf3Pq3u6sbtxa6aIppwnKdJuqi1RrjWzkJq4147VHXOcTXZc3DS/pMygdmpl
         JEdiJ3YyVjQ6cdvww1AicAikKMJPU1bkJHKvzJ0NC17X3RukEdpy7rCXgWfpCZhrwvn5
         zSrdqXN9a2ZjpRveOWhzFEwr1jF/9cos4tvSp7aCnRS7cSncIlDYUFx2vfdMsSJXA0rt
         6t1zsnwQ+y8VYMewGZvwALK+6SFQFpjps9bNz+I1506DabL85qpHP2qh+nyfav+Cl656
         cTYAQ/4AwL6TCsM4FKtveOrTil+BaZQ3nJc+xPKG67vYt7VBNr3uIvetFctZZvtf5a/M
         hSNA==
X-Forwarded-Encrypted: i=1; AKwUvBzALMKzHo+FKrSo+boSOqAGd2tXgvY7wbKMbprJTHpoT4CbSeQtJnnE2E6hlqCs3c6BVGBgOfttUioY2OfWwm8Z@lists.infradead.org
X-Gm-Message-State: AFuF++nm39jTDzDTDF2ynH0qyJGGPPbD6cu+IkKFjTRqflt4OxHLihPY
	XBPzq7Iu+AhUulx7nqur9O2v+jyJf/I7JNQzEpuFMgKegOm3Dze3v8NE
X-Gm-Gg: AYBFou3KOetmHxTHkYKE3xJmX9m+V13KNONTI9bcACGXUfigfltLHHYhS4riXiBxfTn
	fAfDVOhRrDzG9KJ1coz77dnqLifgbEMOA3oTokjRhB6zNVzT+pl9t+ruCwkx5GL9lQ+/Ugibuwb
	0HaFWMN2oCNp75cmsFQHsmUNhVYLG7FyLAjUPww9IdURLQscoOzsjZ48/f+RXs9pnzSipdBMVlZ
	Q2H1pNvkU3DWd273HLMqWSt2Kcu2n5r5uwaTBD2hKNQ6qjbMUwBizK7icTqaRUBEjUXAsbm0UFO
	Gc8OfKmy/Nb9KcKaGw3p9owFqIuNN28hM9oMLddv1psrO93/51oTBknCcRMgIlRD6ujrgvpx8rl
	ocfU0W0egkzREFGG670bQ/6sMM8vYEfcfX83c+G3ill8UYI7/q7ZhP5LPug9+WCohkDu/GyvPik
	XD8ScnoY+nHnp3pY6gDBNOJebEV7TdVKwoZwh5kNeftSyjimpWLtiWCgK6OOZCBCOKyb7A5cL2X
	HEcXOWWm07QtR8/c6OPME27EYR1mhlOcoL/RfpC4i+B/5YvW8gsLghy9fAT8J8U70Fck4y2yMq/
	s0koH6XRFcDEKIlan9lSdBMsfJKJgNV0wswH9U6o0PhUM2Phyds7FjDdI/gV7P6UtQo03wViV5p
	xnPHcf8IVt3KeUR/dik82
X-Received: by 2002:a05:6808:1783:b0:4c6:eddf:ca6f with SMTP id 5614622812f47-4d5b6bda069mr1922304b6e.12.1790141788407;
        Tue, 22 Sep 2026 22:36:28 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:17 -0600
Subject: [PATCH v10 4/5] arm64: dts: allwinner: h616: add PWM controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-4-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_223630_766001_9ADDAC44 
X-CRM114-Status: GOOD (  10.75  )
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


