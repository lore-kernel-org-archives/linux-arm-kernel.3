Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58032CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=; b=L0+WDrEcDbxX42JjslFswnYsxp
	IF6/At3VLsAujiQa66EQpc1zOKxEJPJ24fzJfc1JPoCB9FvswfKnVUMvpRGWQJghtjecych5KZusp
	/cKCg67fK1Q4+/KMNTHhzNLmD9lhoJ5SV2aQnWrSsBybV6qjrXAO20FC4FjZDYiiChj0X1QrrwNLw
	4hj9QEQ/BRPV2DTLWgtoeXzSKNTJe4oy1E47eF4+yq39ZlCjSiAyyBqR1OZtrN3wA8EplWIRn9QcW
	u9AnlhyGJCPD2yIpqcfsD98cDyDcInrnfqNRQCYADPAlJzwRc6nnCyChxtuDqon21fdftjO8Haopx
	8nDFaZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX6-00000000bas-3o24;
	Fri, 05 Jun 2026 12:20:16 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX4-00000000bXy-0xZ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45efb698ef2so894426f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662013; x=1781266813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=;
        b=pciJTqJIoXJDKgnRe8sOoKUFy2m5sbM4HOek4e1fPmlGEt+6Wu98UegN9yoN6ilkdX
         0S0P8ImGVwOnKH4dg66KRK9pJ+dXTZ2kIOQMhSKvccxm2Ta5u6bPXtpNckyYcj+O6C+f
         t/eVa43CWiCsxyX8EoeCm9r1IJWm0VAOaREro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662013; x=1781266813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=;
        b=G7msLY4ofa+oerCrQ5OMa6xHj/UUrhUVjtpBlyVGEHLDdhvy2eXvMTJ7F6rzWHtjos
         OAkrNM7UE+qFFFRSdzK9b+qrvZ07VxYY3vLrizDT1C3UHqdmJX8sMQgKbEgB9+qEEsEk
         CEQQta/Fr20Dp1utojcGir9oZXF6GxXRcdCxH+YgrVRaw7PsnAMGyR66lEakiDSn+Dln
         Bq24I2wI/sr1nImWO4HvrGxS62+WiFuQJdz/8azIiri7nvcouIKDJunRxbYGljwgFyd/
         ZEnMxkT5KqEeEJ/BsPYJdm9rR9RCfRuc8u1L1+ybPexXAcN9+9qdyTaAf4R/zDILjWds
         uhqw==
X-Forwarded-Encrypted: i=1; AFNElJ/AnUpS2jmgyFD1WK9NQt9on0cSn5cnXGNS4iWvGozrWiNqIPMubpujnzTURWCox+/UO6dF3KHchmkwgFyVnI+v@lists.infradead.org
X-Gm-Message-State: AOJu0YwcJLSCwdyBzIIdwJU63D+Xf4f8lhu3D7IpiTVn8UkM/oOI9D7r
	aI5+WkO6AdpkA8WuC3+Pg54tjBjWeQkUfso8OJcRTrI5QHmDDLI58/gj3lqLgw3r9cQ=
X-Gm-Gg: Acq92OEJhrwqgnkkW3IostND0ozYVH8soioXiXrKfgP+EjWjF82XTxGoJr4yeKjqjNA
	B2btEswgPolqz3/O4xElMEpO4gvlhdQ86CnLdpkfHmH7T/jqsksZA9O79bpppxseJik0L+q1x+J
	IO7fac3v7/z/8c9YDfIVTQ1N7euqS8baD9Kee3DXtCjAES3GbXsoc3F7b75bUjgj76NSjM6upYY
	UyV+HoI8LrVMEcckgJS2Xt/CDRwQVXM1cP8ewXWishCIOhPLE1iTR9kZDiLS5ZjH1nRWZY40KQ6
	nEraBn59J0LWFsNLm75gGHwTUm5VITeDK+Vd38wkB6MyTNVXcm82o3CWtOevDsfUzEjPPRHemiB
	w/2cp5FN3q1NNfJ/H/NYAgErSAicGdkzW7PykbkpWG5drdbpj9m6r1Ema3MwG5op4yZ/585b5Gs
	Y9pEbIjW9cC29JKcvaAlEtMWHJ3F/EDZrsuRzU5yK0FSLi/x9E1tbgCMNz63PZhBPD4YSxpXP4I
	bFOGb3lmw38EiFG4i54plBInbeTG+ZFPqKwDrdE3ynnieaiFD5aueBTaMnVD8wbEBAK6huFirK6
	W2+dRpdNB4Z7GLH1AMinGCMtOEae7IcBLyUtLfapMPihWA==
X-Received: by 2002:a05:6000:4029:b0:45e:f798:5531 with SMTP id ffacd0b85a97d-460306095b2mr6077813f8f.23.1780662012591;
        Fri, 05 Jun 2026 05:20:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:12 -0700 (PDT)
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
Subject: [PATCH v4 05/14] arm64: dts: st: add ltdc pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:16 +0200
Message-ID: <20260605121957.78409-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052014_291036_1F16AB3A 
X-CRM114-Status: GOOD (  10.29  )
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


