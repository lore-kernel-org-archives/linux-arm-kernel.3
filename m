Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC65CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=; b=pXKoOjYlT6zwbCL4xGVT1aEW91
	Kh1V272gW0ADsKUpywOV1Q8gI72sL8j67amF9GQGcmrZlUQLU0hp+19mxRrXnn9dU/RIXZ6cFqefH
	FKTV18IwNy1ShFbcOXWtFCeF72hm6k+qkRk+BtOnrqzN8MB+RxpxWKw3iKkI02xvbK9+NPEWMwRJ7
	RLYc0zl7rKvC6ix9rbKmVdhC0DivL7yi+EEDwZFmfM8TfBPyMBKhxi44uU5iK1pRj1EVy8Ak7uW17
	tq5DzyOtEhlK7YDYkTQnbvtOehrRpRZXdNfgu4WAoG6L7Dp7lLr/DJEYFA0r3gZIy1k8mp2sT1km4
	t+X9Dptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXl4-00000006DR1-1xK5;
	Fri, 03 Jul 2026 06:52:18 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXl1-00000006DNd-1KsN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:52:16 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso458687a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061533; x=1783666333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=WhqnSbzDFIac5/b0m/XpyWpyum758mUf5X3SmFLqT71Qps4ZtReBNN7nO/3Z2SaMBC
         NWuG09sibF+/Br+/mGNxs0X09wt1NXdR6VwW/3fltazTjVg4BE2hRBmP/LPoJAw7bg7l
         LLo0XGvxW8DjEcVfZVBtteIYHe0P7SclKqwtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061533; x=1783666333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=W1CAGfpcpHey0HaM5ULcNcFA+JVcf2gLlhL5Tk5LgPP50A0zwQfXW8CZcg1YRpp6R6
         +83CRcXV3rtpoEmu8k06OU8AskiZWh2yAf2YhIL79HQpK7/+1dSVWU+vdV91wT9zIxbO
         8TsOdxZ3Q6/sC77ZewQpMHHFvQ+WvXH/AI9s33Q1YPnS+9kkdY0ktyyPO6vf3IAub4sS
         lzBpSrn62tILbkuWOc3g08DVOZ9DVAwDgEc4qpXuyzWQ+CJNdGeiN406vxuVeVkt6yRW
         gXachSDKD8rGyU1NBYiP5gi2DrCqwsGYdEyZLDO0QvYe4YEZ1EHz8/Yhv2IODnBpCkHp
         A+AQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSWMUv4AU45hzIaDv0/GHlEzhm4xcLaJqK+KhTGHi8r7+mVNyUxVQfpbrOeQK04diYPPK6tUZ65aKVtJS0Lflo@lists.infradead.org
X-Gm-Message-State: AOJu0YzKPOv+tgnl2zaX6BFK62a9mSWcDkzVfr4/szfwMG4hHOVItNAn
	euYrVHAmhvWGrK8SumfRNIT4OOiWBiPbuWlMkFX7qxOswc3K/tmz78u+NUg+F0gkdOs=
X-Gm-Gg: AfdE7cmZIr9sIQtKuZdAvURPc7EhmW9Z/a3QMQvFLtA/Ex6pQSbeL1byu55vTHedDmj
	l5VtDjEkoR0/n2WfprVAQA4uVUBofoU1EqrLIONuz6pDPDDiXXuy6JuuFz9SVyWNRajPf3b5JyZ
	JYNCyzfvxZ8hlKRONhC2dlL4reKe1FFWRtjpGDJHsGkE/zen26G3aTw0kC4Lrvyx/dTmi2RiVUB
	Ynt/DesRZPFJBQBMaG/didgjczHjGVuc2bAb9R+TNK+m5lVWHM5gc3tK7ZcGG7hUQg6rP6SP8sH
	q1IFyBQh0xDe+MSr5QaOrmr2S9QO/vcdQeL0GHF4Ikh61B3Thfjp2kRpbXVeAsAbH6IGHZz3WVj
	cMT49mmATBkEl9qHYrIZ+FWo5IPRl62wNvGIvg2LUcBa/HEXwug9e749meFKL6da6P3I5mdrwfE
	xkdevAD6QiPyDpmqtxVOe17GFyZONw/V5fJpAvd3kdgbEt/iYGEC8IkDZNg8AQnt2DdagTI1+mX
	bchzQ3EDzk=
X-Received: by 2002:a17:906:6a27:b0:c07:ef7f:61a4 with SMTP id a640c23a62f3a-c12aa1b050bmr418013066b.39.1783061519801;
        Thu, 02 Jul 2026 23:51:59 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:49:01 +0200
Message-ID: <20260703065110.1433283-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235215_367299_B443F489 
X-CRM114-Status: GOOD (  10.40  )
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

Add the sdmmc2 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Change SDMMC2_CK pin bias from pull-up to bias-disable to
  avoid signal integrity issues on the clock line. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 002fbc724b9d..c816a6aece47 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -622,6 +622,86 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC2_CK */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* SDMMC2_CMD */
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0


