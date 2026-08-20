Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE4BC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8THUtdFYZjL+qriYRdCLEggdu/BrIkQ1sUvSgc+nNg=; b=EMM2XwYhcoeHXLIfoRWnCa5scq
	zK15gqSPGnFu4Avsu8FXhoGvHTsrVCghpb/gZlX/zPeKuwf5YAFPnuKAKQ38M7WrgfFv86agWdT58
	Awy1VUVVlV2MUWNH2P/72kYoReR8ZenPFF0tVSUQxK0RZSi2MQsAdpXcvtmhP+ZMU/oAZ1W80tqrS
	FqTEBd+aenl0nsI2NK9bdFJ4s7yas6G13cuMTyjAXHfca6H60z3EGs1Y+ATuO6/rIp5y5i6nNK7tp
	RWqWw7K+tPt5nGwzkxx6veOpMxy9lZMAzhbH0Aujr5IlopECWF2x55SuFdACiBcqSL1vYQ4Vk9tGm
	/vadLpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyu5-0000000BF81-2zME;
	Thu, 20 Aug 2026 09:17:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytp-0000000BEum-07WL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-476a130c138so2209973f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217443; x=1787822243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8THUtdFYZjL+qriYRdCLEggdu/BrIkQ1sUvSgc+nNg=;
        b=R1sXkiV1RgHhu1xy1WAeqbr4M3O2pAlicITNMA0zl8ai7vqR4J0/tXkgUgv5XN4S2I
         TAdbDFjEQbEewr/0lyjoZgDPrrThl9aBudX8B5N7GueAVg2AoqSDZdXPs6pDQDvcWS1Y
         SQK6AXXaA9vGinu4dMba1ZE5nR92ep2F+7RSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217443; x=1787822243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8THUtdFYZjL+qriYRdCLEggdu/BrIkQ1sUvSgc+nNg=;
        b=nDbDjlQrN4966yhlskQrEBFV8Rj9tIqT4X2CZELivb8x4cd3UiAIln+wGucCZam5nS
         T3ITjspjJ9N441fxMKLmRy6extorAX7O9mFYpL9/loR/37oIZHbzwpDKgZlZNR9nQ3d5
         +6wbsHRg9Z9D+5PvlEpQR2bmElb9vQVWTJVFLq+86iweu8WadFMvhSPomHkiaSvodoWL
         BZGg1Nr3kb46BSOsAh3SXHA1bnDi04BlN5P80RHq7uWJ53QTuuOm8j44QlriCdpBH0T1
         roQ86UHHzXxDRtMOglm4vWXLmUn5NbK46bQJrwiW8bb+C2MqAMXxaX6fBOD3CVfa668R
         coDg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8l1ogH7jtd6fNMyT2yDpQZFKUPe6Rxim+0kBz7bqr7QlU81gZImIBFha8Ij/SVq3PmO0kPN78lZsbg6Nr9yBk@lists.infradead.org
X-Gm-Message-State: AFuF++kYMyGlAM6mLRZoota2VZqVzhxpXe4IMt3rcHaM5vO+PZYepATP
	pDFsI4LEZ8SMPNqistmsbFJpwVTamo57KBH+JdhFXLjcbADmCAtq31vlypEZevB2ZSg=
X-Gm-Gg: AR+sD13te3A1iPS2oaVfeUMxvWV/WH3JZpvC0tVHA8FijIQJR5evvuXR00VPsl/lnhP
	i8P6fDWBuo+0xsj4/W6qxGRTuNxZ5FLSkYjylRLEMKGXOHSEV3gEXwxyx/v2w75h0hOUSrQiRBp
	uSwPHx4VN1wGcXkTsAv8WHYFuIqVITty65jpjILp3SLy0l6WgNqHm2Rp8wqe7iJflekTdoEWAwb
	Dvn/rql25zCCx3BCT+DGv4m+5RqkeWb0jPRH5tmv3K276yE1ux3m6BibOEM/pmLfpAVZB1NAEIu
	gL/RUxiVQdNwV0QM0j+jxZuC9mbCljKMVoU7K40Pm+WJlE0+zAZSyYhHhxlyzVH6fvermoW+iW5
	qx+09FVAGP52Drq1dib1Sm1AixxanvS+OOVegeXtcVW3yoFq2zNuxLKFox8Lg8deq8Wb7R/9Vwm
	IS2TSYmohKbPSNrWATQE7oeE6cNsd/xiNGIutq6KhixXpxtnMuXphzGMRrsautVjSQc8JeUbhCK
	eJOYW/dtBu9KMILcbn72XQih0x698OlVzFf9dA5Nzd40vqjCT2uT4xgQsJQxoBkeT1eKE7l10wb
	obBpjNSvb8VNPttzSIICvP2CVaTYfLqU7EghZX7q7OGcXrKp9TLrhVsk4OazNQ==
X-Received: by 2002:a5d:59a7:0:b0:47f:f3f9:ae37 with SMTP id ffacd0b85a97d-482b1e94cc4mr20351548f8f.7.1787217442940;
        Thu, 20 Aug 2026 02:17:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 07/16] arm64: dts: st: add ltdc pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:15 +0200
Message-ID: <20260820091652.43541-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021725_093974_4A4B5062 
X-CRM114-Status: GOOD (  10.99  )
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

Add the LTDC pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Increase slew-rate to <1> to support the 27 MHz pixel clock and
  prevent timing violations. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index db485b9ed904..50f454630cf2 100644
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
+			slew-rate = <1>;
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


