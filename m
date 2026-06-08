Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC16ECD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=; b=R9uAokyEyLJaMseDwjdMNXw0y+
	iRNAQJPBE/oJy8LIMfrz/AcGLHSmj0iISf1BZFN54YYX4wL3qARqdK1oYGVRfXsCLzqDHvitEYZr9
	xaKjuGuHms/CtbHTbJncnaeTQ7QHMqMACco5+SDHx92/oiMjnZBvr/dHGQuq3EV1l3sgPk3GmaVJf
	EjEvTGfruI2b48kAbGN/rtStrqlYrBXL6gmS7WOAICq3Ri+GskTZRTcHLuo7ORJfY24zgt8huWrsy
	TOFX74ul4F/IiV6+fNLvQiO7DD/Wyf6i4fmNiSKCG9qX23sPnP3b3DOPmm+VXkUCHoMA9PmQM1C1R
	nvftZi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasN-00000003jgZ-14ee;
	Mon, 08 Jun 2026 14:22:51 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasH-00000003jWm-0LlR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-beb7f26ed62so505216766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928563; x=1781533363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=H+KBNV2yYVlaOzcosy+2x4A13SzpBT61lKwq3ylLe51Nditwb/YXiLUPHT3Mb+ACUE
         EddUoT66JMSocGuoPE9R3p7axr6nAtxXOMKiY6mjV8znwedPdS35yYrdqaa6n1ypJtSP
         WfVztxFRJ/9esbI45Tf55tEUBVw/ltcFAfov4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928563; x=1781533363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=BEdVGrG5QXXihzLKg40mV10iAmv58U8eaSw5l8hZ0FislVGGNWH16cS8bu+AbG/PI2
         yhW6YL8+aLuQ1arA5lffqH4rBshYV/K/rlMT0f8g8hTwOaNmstqnc2FERHjHjyDeFzc3
         c2q2UhZZPdPibgbQPP0mbueGKpd15RCak4Lu9JVXSIaAM75Rt3bQaoerZLufjnyTSrez
         NIhPg+EwnwBE33euUxbF8ky25tpZOjMOWfDTDli0gw3pRuYd2LFEgIk/dBZ5j5KINmbv
         GlvAFWxMf0EpkjoJXNvxzKZCgGZ3TOqbVeio6tn9rPaNgmpW+LTntWVScgm1zLpeDOU9
         InXA==
X-Forwarded-Encrypted: i=1; AFNElJ+7dr48LOFYGud4z48+Tq8YY+s6F5Z8vVyU+lVAi1Gs/6q8njjOlM1sPOgN2KOwBgFMj104dANVUo5KzasPdrMi@lists.infradead.org
X-Gm-Message-State: AOJu0YzAE/0TKkNMCSK88d2oLYaV7H4p4FFPWX6BS2FAd+CJDnYNgONc
	MNqbLoHxe7Nwj0lzGRN1wka/56Dr8PEwMYrxElbbO5yvi89N62Mxte1B86JVkFcJNiM=
X-Gm-Gg: Acq92OEUHVecgqn/kKdyiYIqC/mKS49n3M1z2G48mqZn2p5FNX4hgGolDvsQnADZqFc
	LFCvn09KyOqCFJSg5pi2XRIRlYyBPm5+fnIw8apDKIE2SNmk+pSv/XLeXy2plR8zgtSlDm2Wpzr
	nWn/oBMPaJ0tEBlhni+v87Fa82OfpPGjrevh//ZMCa1dyy6U8XKJLgs3bu+aCuIie8v0SbnH1dq
	dKhO5dh0Hqbqi8XRUwMEI9zt8a0tLGOdBzBhpZB4tUN4314oByFaf2nXtKh2rlevKJaU4ATAJVP
	wGSdP/msgv9liz5xM8JNGHPbKT/2aFdzDFGtNA/+qcKHvonIgUq745nWUQaPFoNzjsquJRMjkob
	6mLCfrO2amcH7Af4OHcF07RkMmViL0tGTcXuXsqnyHWUUK8aio0yqcOLmlyTJOwC0IKbSICtbHJ
	gWMxtRabqTTkSCzxL2ieFWoFeg9szJedy9ZKXBVnGatxwTwqFWm1YOm9toHcaF13ib6Dg8a9EzX
	IQp9alOsxiXjD2qc9tH058MqgHidRbKkjtAC02n0ZiCop1GMOiZ7wZXOi2KJQoPFKf8Qw==
X-Received: by 2002:a17:907:6d0d:b0:baa:1d9:66ff with SMTP id a640c23a62f3a-bf370a681e8mr754666366b.20.1780928563028;
        Mon, 08 Jun 2026 07:22:43 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 09/16] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:26 +0200
Message-ID: <20260608142221.952245-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072245_148525_0B950E2F 
X-CRM114-Status: GOOD (  10.45  )
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

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 6482dd47e977..695c9d771853 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -433,6 +433,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm2_pins_a: pwm2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, AF7)>; /* TIM2_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_sleep_pins_a: pwm2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, ANALOG)>; /* TIM2_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm3_pins_a: pwm3-0 {
 		pins {
@@ -450,6 +467,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* TIM4_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>; /* TIM4_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
-- 
2.43.0


