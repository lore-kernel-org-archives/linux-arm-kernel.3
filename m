Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21EDCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=; b=r+pe/hfq0QeBbi7bVaznSaGuo7
	2frVS0lYuw2vGpYiSrJOcdNg61B/5LgaUHiw7BeY+YRblR8A0nTHwR0NBK2Y/5vajh9x3YKbo/qxj
	3VELxJypSpKwQXI/thSnwZFb2w7DwbyPcMuPgM3C1S1IIyFzRXj0thJxJgJP2S/cA0HQmpeVOZCrV
	OlNuYWWpM1ZgMdN3pJObtHXBuG5rUumisAot3LKoALx/SgVIz2pVAcy0trmKc1WjCAEE/15om88Rb
	1ntgrBe+fvjsqWVEhdzUN3KVhqZ0SdiEKKpJLcdVNgsWyE7PGpUfpDLxDWLjj6+MFz12t5003YByv
	emGarb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3X-000000009eC-3eFv;
	Fri, 05 Jun 2026 06:29:23 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3V-000000009ab-3wOz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45eee266c6cso1187327f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640960; x=1781245760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
        b=hC2Q+V9RqEPPT/MfEgONkZZpcP5laZ9dveBW1kzooqebJxH7gE7yyf9S7m36jX/cSG
         CFq+1CcHU6NxU4qvHMuM8Jzeh2/eFPZiB7EVVQ5rtL4rYuSK6ZdPn5AMSB6KYSE0j9DA
         /nD6miVaI8f5dfSU3o9Mvf7zNpYUJobXv8kRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640960; x=1781245760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
        b=F/KrxpxiAOlxvu/yYpRvpTGH+Kdvnrxx7YCuuYvUKO35lgK7cGXndB1pEYXhi3vlp5
         hXe07Pi/bxow902FjLPErmxnjxDXOFmmFxfFphNwNSe0talO2e4PuBJF9yd3wYq0K1G+
         geyME6RmEwcyqJCdYC/weccJCO5Rx336Y1cPvfxDHnTRFrNNENhMGBsUMKc7DbZv3jH1
         JCj13yDaSR4mkQYZRlweZele9wfZEqhN2lL++eEqL3VSIudGGqQ+lfz7ARUkeNJOxnFm
         YKP11D0BjvFTWygwdYF9DoC2l+3O9pfg6+SgchRao3IB3wLDQk4QR0LntcJfDamr1La1
         swjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pYGtfi83Q6FCMXIM9O7eRJV+mnR5ng36bCl3/Kn/+wAtLtn75iui7AVqrwKXpOX5p42vlQCzmFWgzocCa8JgJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8BPkEzGzQO+W/5rmzWZEsIUXiKRqjkKoPD/k2eJMtaGor4v9N
	up6oEP+P48qe43R5f4qZ83/AsBwubdWA0bPaPww6XmtxHxIWnyIvsHYQLFoMDGDbCL8=
X-Gm-Gg: Acq92OFCijWZWpUI/Fvei6k3dy2WaOMw60QM7HsU8hiG4cy6SfVnYPnqP6Fep/sYfZY
	jsr3beGmpyQi1KRSHE3eqAhyGDCa+t0orN8vcnXme0nOZkrEmHrQKzcaHEOYX5gcM5vX4JxuzU1
	Vm+8KC1FwQOjHAHlSekjtzP5jC3LbS3qpYf94ziC6rtweL1EwWy1t70vFkC2yi9s0oTJYMJQbBD
	DPMuEAHzPlpnPbzmRnHEmK3GFxuTuTLQHKUCR/eljbrTVG1UpZ9frKDdG7m7g3G8QhIeE59wF7U
	TOyIgQV9VyYOd+IMTJXMSoWs7qO7JjTXJUW03+ytelz5Xo9kZt35oDfS7RwoHktAjHf5SlKWQJ4
	5JFsxYMXTbQPkDM1yaL9ND7K6GVXL8kJJPnqEbkVMKB8eMdNfwfDAm+xH5zIro+UQDoUieqBDsQ
	A9/cmeXl8doGIvxi4NmjqU2h3KSh71TBy2u8yCxOZJMax/N3ZlBLWksIF2AwbrHdZfcSuGCFpgy
	tSQQbmetOC5ALgsIGUvj7qP5Dw1+DfhNKfKK3Egdt7swC4hoQ/rVdLMBnjxfxnTYKSCSAI84kO4
	KG3BfKo8YNGisdcQeghGESsHOOG43L648lxgLxaJNsGhnw==
X-Received: by 2002:a05:600c:83c5:b0:48a:7a10:4f17 with SMTP id 5b1f17b1804b1-490c258f424mr30412265e9.6.1780640960028;
        Thu, 04 Jun 2026 23:29:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 07/14] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:35 +0200
Message-ID: <20260605062900.368376-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232921_994726_500F4A2C 
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


