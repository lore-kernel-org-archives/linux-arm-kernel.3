Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537EFCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=; b=NTJHFwtaJXbogiN0roi1u5mZqZ
	o2eFesUBiovsLoQJLr2z6K+wwmnhBCCkxgsxwnAaUcRKSJtA12Hd0H/yhCOk7xumhLEur2ihMM8cM
	flOQx1stAKKmreoStuY++qdAzVQ2eusKKS2POs3pB1nQt0uQHzgBov6ii9mMc98NrnpKaVtKvXXLn
	FG0Pwno84WtCfcnWPA7C2gHcvzFcUxJlRpGsfuXFhuIwUo8FYR7BuVrrLvGvyiLcOINcbHZmAyDqq
	xbaqz3wZCGZvogrnt6zNaca7j+Mk/cn8MFMVNNjCTPKcZvrAw7uAVpuigPmAR5jofE1s2woJDSv6X
	a+Ugf02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3e-000000009lT-0uD1;
	Fri, 05 Jun 2026 06:29:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3Z-000000009eT-072V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so1061112f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640963; x=1781245763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=ZQA1n/XbdJ0KDNzQpjv6fdtfg79c6nmJRu6zqPJCf+ghGralqXdlPRQ1jXPwuVKfzA
         W4jU/x08DrSHAeZHro/9zsHu6Aspcp159zN7qMf4bXjAXwoYtzFAbjXjk7LET9Ask1TM
         x/izdrTzm5KmobwcsoeVEKa9YhmUrvWobU04w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640963; x=1781245763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=LrGxjzNUE74MyyZYdQeaK57hHVaUweYEnbATf8kxzQxLB71/QqjIc7Xsz7Mg9WltOS
         wLxhxPGUZDDlL8SHlYadJdQWwse9hhdNDmUmqUZGfEJCEq/D41C7y9TfiArk4gwQa11Y
         LESzmnMSfAyqYsY4MFOwAFbsv1ohcaB8+HuGSIaRnD592ipYCxcJTrXxqaXM/OBWK1Jw
         DknK4wmqpazI0g+/L2kYnxD/+H/EzW05GuG2115oVBV2Pg6kRPicslnefM89o/RGC0MD
         UMo7UK9Hz79InE7vDBMni1yR7zq5b4jtu4tOlMwOkty8ciMQufSQvsosmb5WSDFRy17e
         3uOg==
X-Forwarded-Encrypted: i=1; AFNElJ8Rz5WLqY9T9NMmgSNf9i6TjM9obA8khw7CQIfeBqi5c7lgM4aho07usT7SXqwLkoLaOXjYAgl+Qbcx2ena8cYi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd0zX2PdOrUA8kdrmlomJf85QG56/0zFCP6RyADPB9V4nHzERK
	jAGzWJxYEm2glHPhtk/qjp82q11RZzXxKKjaf9px7ARQrm2jltxlw3IIuBjBIIJlRZM=
X-Gm-Gg: Acq92OFe1izAb6/HSUsu8KmZ8yaFhJOGh/DUPC3fJyHE9d1bXrkSd3Kd0bdpBmlGAdV
	c+Egr6wWWmCpvq4f5vABwc4YQLSWlrsctLPP+U9t/RXkQF70IgyJUkRoaep8povMDC8Z/oPMl5+
	TQzB0h/GGUMKNc5ywHSfKRxxVTDMQ+WVHvHE/hUthJMvPm2bufz2C8f/bg+BXr388/kKdB9YfaB
	j5Dk6CCHcASaGROEaXb/8CEw/6+7PRm6KsT23Hk71zLdCzRzVlE5D3s7MJYe9Lzzjph45/ci7V8
	/DgQh/ZpOvIwBrkXBZmtMmWKNYHJxH3+bUd6xk39qVBSi4PetOpLxbuLbB+MjUAKBHY8PpuSNmo
	spT3pej1MwzawmdBfT3vSVRjkBlumEMkw+DZDwCyuNffKlmhisYh9MWf5BTWCVAQmmsdxi/2Wnq
	Gxw/WotOW1W8vkU80b5i/KumjVAB5LgU/oxdKhOM125VoEi6//LmzaniOrFJnDZ5vDJM7EjHL+7
	vPjDGQZZZYt7GwafiK7Oa0bkCICYria3Ne0F2ponGfkPACr7C4RzcPwt3OYm7WQUex42LYOBQxW
	LT0EapTukNipzstvVZSsQQ+QfTdRFk1iDpQ=
X-Received: by 2002:adf:e3ce:0:b0:43f:ea25:20ff with SMTP id ffacd0b85a97d-46030751cf2mr2327348f8f.29.1780640963362;
        Thu, 04 Jun 2026 23:29:23 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:22 -0700 (PDT)
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
Subject: [PATCH v3 09/14] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:37 +0200
Message-ID: <20260605062900.368376-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232925_108766_D4E4A8B7 
X-CRM114-Status: UNSURE (   9.90  )
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


