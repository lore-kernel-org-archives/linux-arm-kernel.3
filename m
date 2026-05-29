Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D982DCD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=; b=jAiWSt46mmt1NFzrjlxBGR2X4d
	LUGxdrIboPwKq68GJ/WpIZjCwXE73TekOz7evc0sp0g/ktInhrhMPe4VELBr1s5Q7YFa/cjCxaqht
	nM8RBUBgxNzeyifXAQmmUAZdUMeZWpIYS3pvikF5kkpqhZxKIarq3/oSsa57DzNpVPf9yxsY2Ja1e
	O1yq40YSX1zBWoU19JPFpm03IoQJ1WZhykcvuTdg1n+BgEySDS+FTINiP89IzVv8QqLYbe7gyBAgJ
	hc8ZuBAdh/853VmohzT9ahQQDYaLaoHt4m4sCMYjWdP7j6vNnpVznPgOWhJMMPvhE9JOS3D3EPiwM
	BqJUPXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyVC-00000007YsJ-1nPN;
	Fri, 29 May 2026 14:47:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUn-00000007YTY-2sBT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso72194665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066052; x=1780670852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=Um4gG1rxeWZtuUm+DGpf0U5hwWfWjqWy2pAINOiwuqUE2k+TMXwq1dp02c6rZJDb8D
         MfO2gdoixLzFhcH86f5/TkvrzkKMDfkaSpGp7OV8CpGBromVZ+qwatjnx4E1lRq3yIXH
         fyc/4nmOUX3Qc0hByE5HtTllI0uoJDF/Yx2Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066052; x=1780670852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=fP2xWvpE+RSdiKCIafnaQaWQl3eHoS0uKLJbq1CzR4XofMwwGvkCSSCJWjywXKNL04
         JonNuuLJlYtP1RjqvA98tecyXNu4HBAL1QrYpirDVkBrIsBMwDyozPHarkXHPecXoODt
         EFSXQnlirnzM0HgQtqFr/KUgTLhzX06NDSmf0ds4lOEpbqzB2kKG/EbgE3SwlS8MF3U1
         cUNpbEf7ABpiWVUvGoNZKd8Gb8ra8pYa5PneI+WQYEwPJHm1jB6KWgU+hVmWiNh2nHXu
         P9GEpjBRlHM0O0GsTXT/pQWZEXrje/pu/7364DcBPYUH3tvxXAm9FapEvvHGWKc4KnMi
         015g==
X-Forwarded-Encrypted: i=1; AFNElJ+D9PKICiZxj6qWhj0jK1fL9bwD64zbia+HFL0YaA+q6/AdWkVB/aepWIKZiwU1O/yJj8W7ueFYKwLabDhq4hKd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw0HkTz5CkxgVzIcOLMvt2XJPrL4Dmti3xYks10/6Yp5zGBDJt
	mFV785ZvCpmnFvVzvHiZ90BpO370Y7rQ0pdp3e6+CHXh3v4G9oInlZpOevSmJkz21j0=
X-Gm-Gg: Acq92OGuy/D/tVjNbZ3axmQquE+aIhU93Z51J7byzQsSJ+PRVGDkXQ7DM2I3a8Mlet3
	gZ6OZsq0TGDb6KSMgvpU6JJQKRmarFs+l7jwyGAIdwlPuHmUipRmLsPebs3TMmi3M0ZEuWgy3tu
	dXCJcu1X/XxbYrc2iFYVpxcx9eL1Ze8K/vb42PWO9RT5vOHHl83YbrJmnHAPv+2dOp2snlrNPps
	jysrXUVof6TmlkAlFLCWNBYLDEivYZm5Q0mKruPeaRvgUt/isRERtCs8zcPlGrp5bWXJnG5ucgh
	7tRWzC+mUKvMDSOYhU4rSJtAiD/7JFUJ3LIkaPsNdKHf1SJ1Vdn7jJBpaX8GwRe2feATl12yTCX
	qxHrCMU1LEh5udNxhxFntEpx64qF8yggho+7F3zKD07D6fvRNK2lPHHCV94ber2caO0FiIsZHDJ
	m3AmGRBe793m3hRGOgbu6CHzihGcmWgSafLMXAKhQd9Dre4rskRcb4sq+Tu0JDOABnjx/1YVHJR
	MBDvkC2Lhw9eBPiHF9PEaysDJJr9K0h4SjjZgRZRnSA+YhSuGLRd4AhJFtOs8wx83QaqQ==
X-Received: by 2002:a05:600c:5288:b0:490:3890:605b with SMTP id 5b1f17b1804b1-4909d376fe3mr56784445e9.31.1780066051755;
        Fri, 29 May 2026 07:47:31 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:31 -0700 (PDT)
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
Subject: [PATCH v2 09/15] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:23 +0200
Message-ID: <20260529144707.3931919-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074734_691137_3186A2E6 
X-CRM114-Status: GOOD (  10.09  )
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

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index ab1e62cf2bfc..62f898a55d45 100644
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
+			bias-pull-up;
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
+			bias-pull-up;
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


