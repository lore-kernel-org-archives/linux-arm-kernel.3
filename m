Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A24CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=; b=1SPq1qlELPlq0P4uFIltoktVHP
	QogeVMR5WZXDuR6Be7kJ19Xpc00nfeJiDPY4VJJ7X2XEU/g81ymC2cCB61ntUnu/qVJ6HSi60I8Fu
	2VebVek2No8HLL3qLYh4VrkaXrGbV0kZD7Qbt8hX04u7AGwVnovCwC+BbxnBcO0huLPNWLM7oo8zt
	plIPYQ+VYztXpn59i6lF7upPbNtx4SP5zmKWFMJXMg25uecWTOe6kBS5TwsFRbePBET1vgAkLE/MX
	VVKPt73iBVYi0z+ZsrAEI8hh2RugBgPDKL2hCzGYrB1T3czc4C2RRDI1/mhxOzTUlv0FEclU8xjNc
	15X1xHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3U-000000009aa-2fEi;
	Fri, 05 Jun 2026 06:29:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3R-000000009XB-3DbH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490ac357c55so17755335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640956; x=1781245756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=;
        b=kgIaAPcfT2OJl5n1k7dCE7oHyHUFnw6Hd0r5eDLWTOV2ldpF+19QCfUzsMdUPgoMks
         jRCVe5sb4BmnoU+23UUclRMaN+9BFrnXjHoRNxp/QfPMSVXvFmjz4Kwpw9lA25uhwUnM
         DTn8Pkp+KXf05oQej9Gg28Hxq7+MkRXgsHx9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640956; x=1781245756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=;
        b=VMmMsKvfq74KgdJZe1CHA6PwnNKos/s18aGIqZ38VhvlSPwD+hWEiiPH5wKvx+osMi
         Q8Ff5cXyZq7+LI+m4s5kcb90YYObfZtOt/RCuKiueibYjMIN9WvN9PBd26zP1MZ13wmy
         cX6jTL/dT3fSOwmREhbUk+xxXZJOggs0hFGgO/ZyKfMgdPwR9MjobBdE0ExL2H2zFLik
         LOQ8GR+bY5RXDR2BsjTuy9zTtz7E0ROnR3+xstVn1kqkzvtVhTN4/1TWt7gT9d4Ijtew
         s3fSEA9xTl6LOYtyj9Ueyx3LRIJ+WiT1M5NoLA4YMFgIqESEx8EVu9DRXinl3eaAxPFs
         wwXw==
X-Forwarded-Encrypted: i=1; AFNElJ/ndXolp4TCpzYYs5Tja2IAb/5qa4aAKbbpvsrMPsog8+/4baPdqv1uV3Q32KziZNby0BDKnl/U1kNJCZrtvxed@lists.infradead.org
X-Gm-Message-State: AOJu0YzK0fgD3XuAlkOSuQRUngEnzM5vG7CdoLuKDmEwealp7Rl5s6vb
	uTsFTNFs+1dPOiQubJqytluy9S9CwCrhFu95R5dSH4JlxTQyL8gyPXLPbOKzwW3ruv8=
X-Gm-Gg: Acq92OG+QBVSu8oe/FreZaG3GoR0CkkXeFMuUpg2bpoQRk9ndO6OaxtN3g3VYlipzSK
	3owEEqNd2aB/caqvCwdNzRkVWXWEaVj1P3vnMDJAY+77jZEZMX/fS/KtGZ60rDAcgn0AmJ+eovq
	fRAbePrRZcjqpP8ZXEHBsVNnaANGy4tGAEdyLyTZMFx9QmFF/C5WqjnyiZ/HIK8gTolh12/6LSN
	mAcC59GrnUr3k/LlX/HpglrY0kQSL278nni8UhkmIjypPOYGlUQM3GYizcnBAdzs+fklxg/SaQ3
	goFV0KD+qiSixDcI/VSoBu0zbOX+sO8JhScxH/kqG1NKRhrMAPNqShkCRmC2NE5W5U1UcombEPG
	xiMnBdhkAfjX5809CFq7jseosePvLJ6/rnWvY6ZYo2VIRpscjRnoxXBxcnElBQryRXB67RLzzL6
	k/xm/WESVHPGvkuhvVKkSPI0AEMo86dqxUc7h0JAT82QOLWAX0jG3VNZ1zFusti+JqxJsjC2I8X
	vzWhNrcKRH+dcqWRRwUuZgWB/xOrKIQqIKzsci9WIjRKsaYgpX/D5Zdgv7MP9YVRv3Ua9hTmkwI
	eyHb6pIQuLzTnNcMZZ73AcwCniXE+MfSEWk=
X-Received: by 2002:a05:600c:5020:b0:48f:e230:d5ab with SMTP id 5b1f17b1804b1-490c260f495mr28184305e9.31.1780640955724;
        Thu, 04 Jun 2026 23:29:15 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:14 -0700 (PDT)
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
Subject: [PATCH v3 05/14] arm64: dts: st: add ltdc pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:33 +0200
Message-ID: <20260605062900.368376-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232917_832372_3C9E9C13 
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

Add the LTDC pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index db485b9ed904..05bd07a0a561 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -260,6 +260,77 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	ltdc_pins_a: ltdc-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C',  6, AF14)>, /* LCD_CLK */
+				 <STM32_PINMUX('G',  2, AF13)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('G',  1, AF13)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('C',  5, AF14)>, /* LCD_DE */
+				 <STM32_PINMUX('H',  4, AF10)>, /* LCD_R0 */
+				 <STM32_PINMUX('F',  7, AF13)>, /* LCD_R1 */
+				 <STM32_PINMUX('C', 11, AF13)>, /* LCD_R2 */
+				 <STM32_PINMUX('A',  1, AF11)>, /* LCD_R3 */
+				 <STM32_PINMUX('B', 15, AF13)>, /* LCD_R4 */
+				 <STM32_PINMUX('G',  3, AF13)>, /* LCD_R5 */
+				 <STM32_PINMUX('A', 10, AF12)>, /* LCD_R6 */
+				 <STM32_PINMUX('G',  7, AF13)>, /* LCD_R7 */
+				 <STM32_PINMUX('F',  8, AF13)>, /* LCD_G0 */
+				 <STM32_PINMUX('H',  5, AF10)>, /* LCD_G1 */
+				 <STM32_PINMUX('C',  9, AF13)>, /* LCD_G2 */
+				 <STM32_PINMUX('C', 10, AF13)>, /* LCD_G3 */
+				 <STM32_PINMUX('A',  6, AF10)>, /* LCD_G4 */
+				 <STM32_PINMUX('G', 11, AF13)>, /* LCD_G5 */
+				 <STM32_PINMUX('G', 12, AF13)>, /* LCD_G6 */
+				 <STM32_PINMUX('A',  9, AF12)>, /* LCD_G7 */
+				 <STM32_PINMUX('F',  6, AF13)>, /* LCD_B0 */
+				 <STM32_PINMUX('A',  3, AF11)>, /* LCD_B1 */
+				 <STM32_PINMUX('G', 15, AF13)>, /* LCD_B2 */
+				 <STM32_PINMUX('I',  0, AF13)>, /* LCD_B3 */
+				 <STM32_PINMUX('I',  1, AF13)>, /* LCD_B4 */
+				 <STM32_PINMUX('A',  7, AF10)>, /* LCD_B5 */
+				 <STM32_PINMUX('F',  5, AF13)>, /* LCD_B6 */
+				 <STM32_PINMUX('I',  4, AF13)>; /* LCD_B7 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	ltdc_sleep_pins_a: ltdc-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C',  6, ANALOG)>, /* LCD_CLK */
+				 <STM32_PINMUX('G',  2, ANALOG)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('G',  1, ANALOG)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('C',  5, ANALOG)>, /* LCD_DE */
+				 <STM32_PINMUX('H',  4, ANALOG)>, /* LCD_R0 */
+				 <STM32_PINMUX('F',  7, ANALOG)>, /* LCD_R1 */
+				 <STM32_PINMUX('C', 11, ANALOG)>, /* LCD_R2 */
+				 <STM32_PINMUX('A',  1, ANALOG)>, /* LCD_R3 */
+				 <STM32_PINMUX('B', 15, ANALOG)>, /* LCD_R4 */
+				 <STM32_PINMUX('G',  3, ANALOG)>, /* LCD_R5 */
+				 <STM32_PINMUX('A', 10, ANALOG)>, /* LCD_R6 */
+				 <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_R7 */
+				 <STM32_PINMUX('F',  8, ANALOG)>, /* LCD_G0 */
+				 <STM32_PINMUX('H',  5, ANALOG)>, /* LCD_G1 */
+				 <STM32_PINMUX('C',  9, ANALOG)>, /* LCD_G2 */
+				 <STM32_PINMUX('C', 10, ANALOG)>, /* LCD_G3 */
+				 <STM32_PINMUX('A',  6, ANALOG)>, /* LCD_G4 */
+				 <STM32_PINMUX('G', 11, ANALOG)>, /* LCD_G5 */
+				 <STM32_PINMUX('G', 12, ANALOG)>, /* LCD_G6 */
+				 <STM32_PINMUX('A',  9, ANALOG)>, /* LCD_G7 */
+				 <STM32_PINMUX('F',  6, ANALOG)>, /* LCD_B0 */
+				 <STM32_PINMUX('A',  3, ANALOG)>, /* LCD_B1 */
+				 <STM32_PINMUX('G', 15, ANALOG)>, /* LCD_B2 */
+				 <STM32_PINMUX('I',  0, ANALOG)>, /* LCD_B3 */
+				 <STM32_PINMUX('I',  1, ANALOG)>, /* LCD_B4 */
+				 <STM32_PINMUX('A',  7, ANALOG)>, /* LCD_B5 */
+				 <STM32_PINMUX('F',  5, ANALOG)>, /* LCD_B6 */
+				 <STM32_PINMUX('I',  4, ANALOG)>; /* LCD_B7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0


