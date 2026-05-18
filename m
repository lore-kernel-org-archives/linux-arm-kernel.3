Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24F6CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdvucN4E2bCrplak4cO8WKE5auEkirQtL7ZhDvTXJtA=; b=EtH88Mz1Yv28r02pyeiDEiQe2Y
	QzYb/3Rowq6x+Z0TUOX7L2SVa7/fRL595XfzKjnt7ZdIgNpMF7LlV8RqsO+zluvDBExPBheOIdqp2
	chxgX9CI8gGrslJb+vNZCWH47Ku0tUJEU5ff5nkL1j+7R7otlC++M0PmJqNOem53AqozmSozmytJ1
	zkyr7bRoNdabMrIbQi8w3JfF+eRANyo9F0pWp/0O0Und/3zssBnMm0v9GLXVteCVdvY2nf5nyKbzI
	RcRbgzkuMc+Xh3dL9cZt8DVvH0KK6XPX9OP49H/71hFTESQ6UeoiOi33vlBy8yFZGQPYEOc1N+nZq
	ueM+odlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz15-0000000FzIQ-08J1;
	Mon, 18 May 2026 14:32:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0s-0000000Fz7o-04Mh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:11 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45d96d21e82so1372361f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114728; x=1779719528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdvucN4E2bCrplak4cO8WKE5auEkirQtL7ZhDvTXJtA=;
        b=QsuknABfGkBbzc0+xO3ft1vt/SNEYTU/cA0uVIEcbZ0sGq0eopGB+cP+BVJbmJDJ7b
         Enr56AO0Re9EQQJSmEvs/v54cS0w63ootFZsdlVLkEU7Jfl8Ovd8a0CwswPN4EAZx4TK
         /DsEW92IbFxUPZ0dliYeWgC7FE6eAbfI/Pat4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114728; x=1779719528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qdvucN4E2bCrplak4cO8WKE5auEkirQtL7ZhDvTXJtA=;
        b=ClSu2EBfHjsojx3FZoS0yCGEhwZE8EPzpsb4fQ91OKcsZKGGYKzFQD5nI4e+sHWzwW
         LccII1FxSSC4mgkLqW5uF0x44JnBrbfe7dEAD2K4sPTj7U4Cqja1rvkJQeiiKQwM5D61
         vuaLBbFvEduGgGZxpAztcL3yXIX/NO25wNciNc8ALvWf67hF5Mpli/g/jK8+5Xsvth4p
         4Ou1hJ5he3Zxya0QPNM3pZrBBzumaeDuXdNMync4HKV/Rez/5SfBHLI3UFhgbRQ/aSZw
         J5Dc1FBV582aUN8LyARmxz9VrSCHuUBCYys+GdNIqhDdmx9kfK6bTAUglqioohyPwPnb
         MQsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rWOClMK6OG5iuCGcXyP1sidc4yX44Go6NBAo+mokcucTcAy2kZX7zfaPAL+OCJxAw/3SKU1uHo6bO7wLi5KIA@lists.infradead.org
X-Gm-Message-State: AOJu0Yynbohv+93l+vAMpPZKTQ+57kEnJ69vw8YRBtWVEOdRL/I/1c3i
	e39WjyfBRMJBC0AQ0ZLjBXlpZ6GLqqrtEMrbd5CB2UKtB/ugD19WFzbhepV5hEjubug=
X-Gm-Gg: Acq92OEmLXq6aeB/6nbuKFdbJa1Ymqr/5vYDXU70Uu8W+IOktPrjuOuU47NKkQN2Xii
	PDyVySEFdpdI3aLXsd5og0nPcnI3AnCoYf+ypheqieknKmquj41785fkKGSRTitmWxoHggPCHPp
	pIkSpTJXv37EFh5ZaC7tMrfwHrEz3Fp6yocRVGjTgtT+Bm3CKFhjrtLXDH7pWUWojbzCkU/EG74
	UEcl0h0v/awLmO8OSWhaMHVTNrvxTMe85FV6xwTzvEvUzDGmSu38Ixu8yP5OuhsaIlzYxQEAL4V
	A6FSSoOORkgxpqpJ2xNDw5TDp2yzktF45zuX1KeKnw1vBnbEIL5rtA7r5fgIRKAZ6W32iTewc5O
	xzxrgz5oGGPPJXJY+tmVgmypGUv0qXHjtbgq36R9mK9A+QOnRKmKmsbjUiIh2NfjquOa7KILFz/
	pOzXhkO14XuujyB3mIqm18X2ELV13gSGsudAHqO8hTycGQU4CWsQ/EhMihA0Qtz5Qx7NtJeiYhd
	0ReqlHgCi+1b1xQEB9ytG4aWC7LB//c3Y5QP3WOmLR8Kr3C
X-Received: by 2002:a05:6000:2384:b0:44a:247e:67b4 with SMTP id ffacd0b85a97d-45e5c5a0fbbmr24201432f8f.18.1779114728068;
        Mon, 18 May 2026 07:32:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH 05/15] arm64: dts: st: add ltdc pins for stm32mp25
Date: Mon, 18 May 2026 16:31:20 +0200
Message-ID: <20260518143150.3138712-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073210_084567_6B36A073 
X-CRM114-Status: GOOD (  10.95  )
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


