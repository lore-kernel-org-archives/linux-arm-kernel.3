Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B1CCD6E7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=; b=FrK+9rZJyvHHwxmTLUsiwtmj+S
	b/EbaOwTYrVjaYcPkwXFHguygKLMFCFse+z2b17meg77p4O9UkgEMW6Exx1cnHdRGUAkOhvchG6mb
	eNKYyb5WfdTMgR7ii/YiUIijT7N59xWgStozRHmBLuHAkDP0OdXT/2fSxGz16pX6WL0oJT0xMI5l1
	ZhpJi83k43yOn/shxa/zflw/HgedJ15ANcSwqwky+GytecS7A/UlEQ2mqLFCw3f/a6jyy/8SKsRyN
	v+NiWhPpWVeUILhmzUa/gHt5vB50l3x+bxreXdhKG1IWI0KGC+SayTj9zopiivKsSXKTi/bwT/qKx
	J3Ex99kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXB-00000000bfm-19eJ;
	Fri, 05 Jun 2026 12:20:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX7-00000000baH-3RLO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso10094155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662016; x=1781266816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
        b=nLbk59ickeOPIoEF26+6ZecxBv/2IXnbnnFo5UesUa1xUFvOanT6qonH5EzL1g9/EO
         elseMPZ39nH446uMXgSniI5eqOUh2e1mTZ4LhLePoIAA30AaSWotwyqLIuiFdg1QrR0L
         Diz7G2F8M8oEIFCMOFclvrJ+EpF1gPIHiqQ6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662016; x=1781266816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
        b=DgLbqScKy8eWJCr4n8H/e7P+qA3vIl37rBb+UnByv7Kt6a+hHb4V1275WwLL1E5B+2
         6tUOam7OMR5I/qKS8/UvjEjIdprpa5EQ+7xevPRYknpjIiPkZjytdia6kz3RUk6Vk1WN
         RRJ42BabrM9xLcvOb3hN5BifuHLeQXr63p6bKPHfF17P/i0v9hzWziCApgTWXJF1zpnS
         wxxQE9QcvEBxHw+eDtQxZQi5FB1uPZmHSmtpyc3d7LGTPdZZopisZYoiDPaEEwcUa47i
         AH5qhOOP+zFn56rm0O6Y0Q47zUg5DyTqu3AM3PV0FDl1W/MwXRn5hrZC06WqvtcRwROZ
         KNVA==
X-Forwarded-Encrypted: i=1; AFNElJ+7OwmOYrqvSLV2ZCnoW7zqJDISDhhpr4MQjqTGE0ieb9X3TJCy7JPI9MWCyau0tuB0Yf64h9EA4Nlx11U4+Tfd@lists.infradead.org
X-Gm-Message-State: AOJu0YxPUWkWdf+edbd3zqhghPUHcuaawcWAc6sxOCSNJdm0ZA5syQAN
	fK/wayu5P3lTzknQvLDX2XsEwY9zTixNVQ3ekNX1WhZkKPOnxk0svI97V66/DqR5O0c=
X-Gm-Gg: Acq92OFCgA5HRrqnqlMD6t9VHFY1UgdHkVg+BsBoAylP8J45WtrAMQcS+jcrN4+0hU1
	xoPbCDqanZg3yommfRCfUmrQ7YBrzzZFDBljNbbqpi6bzhd2EoB77TX7RVgeUOhTnX0hRlAfaLV
	n4FrrWVcrT1jd3N6FXEwYB6C8QiBXXitjg6gnNTeAIZYcQNRs2gFMS2QjWe7KF+bT6Kd3Vcck/y
	7alnTzciNJJ9cl2iHMWBPnzETsOp+aGKsW+ww23+kPgpX1wNM6FqxrW8Uwl/O4BHKRWGTjHhHLc
	BTR4yIZKrXA89cAgP6tN52pHWfX58rGjhj5GTExoag98mbmEjJJhNyNV8IjRphY0JuT1Nx6z0jJ
	DKov/D7dSRAFqmHDHQiwAqeakviVBAAUjIRFVRxsRlWRCfC6LAY9up+6DFt99mb3Xc+LdXHC3vV
	WrhWOi9wlYxoc2XNwPWYn6ciZg6qZ0Z2vfdjoyZxsorppnu97kPtyqOs1p1otIXD06TzT7rBt8p
	kdR08cGbJWN/kRBto1Np+6pO6STge28GUy6Wo4c4+W2WcooOkCfUk5SLtqkADJA8DEX02a5Zaz5
	RDCV7g2QbwUd5KraVcIUXV2zRZlsMzWZWeY=
X-Received: by 2002:a05:600c:1d12:b0:490:afc5:f95d with SMTP id 5b1f17b1804b1-490c2602bdfmr52692865e9.29.1780662015953;
        Fri, 05 Jun 2026 05:20:15 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH v4 07/14] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:18 +0200
Message-ID: <20260605121957.78409-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052017_867800_DD670AA3 
X-CRM114-Status: GOOD (  10.37  )
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
index 4be01a6574c7..eab8ebe71660 100644
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


