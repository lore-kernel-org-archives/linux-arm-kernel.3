Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9479CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlYmcGocUtKVOJ3lCSjwzgCdhzYGeg/sEXkvnvDcqs4=; b=uI8JAqC2GOdFtcGGfD6tMIJEC6
	I62RvbszV6xyio14sd3uc4OmbdqJ6yeFZA28pwKTtLlIqcdcEqnH83iufMItHJYRf/v+tzewOMiON
	IOAB+LyEfZSpWrxSLf03ytjxrJhseF3voKNFdH0qzk89j1ahzCJ5wlPnh2nX70Ek3Q7fYNTZWk8hB
	jUyot16t4FBijj27KUy2o2/v9oqeyFhAdSvOQ2JdM+wTFr/MJ1f04k8fQDz3u7nD2p9v8zNSI2oGu
	NalFNlKX1dAv2ajQnfcX+G0tfho3elFJt8O/UUzk96FnDbAxAjLwTaPOGbDTiBMIeSCCspCUU6HS6
	cpYz0aqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasH-00000003jZg-474Q;
	Mon, 08 Jun 2026 14:22:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasD-00000003jRu-0l9i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:42 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so7925147a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928559; x=1781533359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlYmcGocUtKVOJ3lCSjwzgCdhzYGeg/sEXkvnvDcqs4=;
        b=ALkcYfKjRd+aHuyJhYGXoBLYG6k/+ZC1Li00TuDVHceoHJf1UhvbodrPTnp8zAN3td
         UeOxODz6OpnCoW1C0LynMmXEfGqRQMuwCs6SrClkUsbTtubCTh0KP/ntDZ+kUTH8voao
         C4Gj8xtvLpzyDuyXP7ADir4U1y1HBIuAjJ/OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928559; x=1781533359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jlYmcGocUtKVOJ3lCSjwzgCdhzYGeg/sEXkvnvDcqs4=;
        b=cZZKNwU5wta6tkq1VA13UFzwkR9wsvUcF6zWdWXrPTdl1ZNYz2zF6T60jj1rRdLQbl
         2xqWnQ2EPMrn7SWZ3OUg/D7YNum2+f5YOyuZE8sQ7Q80ziIm8G/uRqWH1REH4qfI3Rmq
         jMsVLJ3z6dxwUxTj5Ru5ngcsLnJ1jC8KQCAOf25rjC0NDvv9aM0PFJhK1zVjWe4kg6ba
         jTiYtA0fn+MPaJarIJQ8XLie/xSC+PK+pmvNwFz8kYdJbuyZyDxtRK3SAK1GqMAjILlH
         E/eDewR5vUbmPllxkYEUWsQHfY/1VLA2tmXedxPVBJ3aKxrgY3CxwlP9kJ7r/b1MFq+8
         Tb3A==
X-Forwarded-Encrypted: i=1; AFNElJ+Ta41fpCXlv3gXJ2hj9RgK4x+AWwF4BJCUbT5P8dIpXlnQ5fuOFiTJfMBDw1FpJduy0RCKAqH/w80DVrlALlsy@lists.infradead.org
X-Gm-Message-State: AOJu0YzsP6rOnC++hF1zqiqVPIfgj8RNv1DJV6o1c84LdU+7AyFWTUU3
	M+vDBQOzEPcxDoEmGJYmzxPyCRbmR1Jn67Lp+NipJ308UEn9qzs7RYCY+JcZjZV79uI=
X-Gm-Gg: Acq92OGD4EKuvd0rbARxAAwgMBlSWris8U5TQtS8W5KZnBp761mRoQKw/8T1HKl0r70
	TAkNpIcrZVRa9tlYcl56iLSeqkjnCluYf5XKFlwMe8YLuQ2ynZRj8JPNij77jcwB4rcbjrGwyN0
	S/4KgzMJRYnW4vjONuzeKReQS+JDrB4zDGN7JzobeyMJt3r6j1RGHD6tedIcNuAZn2GXn3h0BHT
	iWFGj2cAnyeFz90pM0SXEhg7g2KopvUPUbKXR67LWPhmUYS0pW21ykfAEwYgImCoLZoJGhpF+0G
	TyEvY7b/oLyYZmGiSwcbWvS6L2aVlzq5pLOWjnuEtuIIE7xnMmcj1uCOBRfuw2JJC7GHLfIj0NE
	De9e68+ieZd+xridTaU3SFn18s29w7MJiu8WaM5Zo94nG53fB/v168PV3Usy6MUOy9Y+HICyIDq
	mCHWgzqDwm082u6ifFpFdU37vvJJ/p8v/VRipkvTi6STXQeVHB2lHirXOQuiISSQeDlJGI14IpL
	+y/vC9CDm/dJPraKB9ZiYeZOry6TG6okMfYzmE5zmgcOh7IWXM6oKIwuCM=
X-Received: by 2002:a17:907:9812:b0:beb:2665:f37c with SMTP id a640c23a62f3a-bf372f20f8bmr632395866b.46.1780928559123;
        Mon, 08 Jun 2026 07:22:39 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:38 -0700 (PDT)
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
Subject: [PATCH v5 07/16] arm64: dts: st: add ltdc pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:24 +0200
Message-ID: <20260608142221.952245-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072241_249935_6EB0C3B0 
X-CRM114-Status: GOOD (  10.76  )
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


