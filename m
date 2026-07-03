Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE830C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=; b=jp0L6s1HN2hLZNuTNOxshuRQtA
	ib9LoQT3Y3xmiPw6kJiTZLVGtop1++Yl69YSdNB7XEDmXaDcz/zHgOEpe0fJhvuX7c/gRMK60vEs8
	3xjgl42AUAffu2y486jiCw1//NE7ounPk3eaObNQ+/vjjaQi6hsQWuIOUy4EZZo4Te7ch6Beh2qte
	OBzERtMXL0irAYRmBinnaUi6xVy3JXCX86MCCWC23J32Sn34U7zS0ZgA5vipB4xDNLYha+NorS2O5
	BmspeiSBGJyG/R5srejHRidy6ttKyL27OMLC1g791SF6VLXXPGM6YsGUrfx7awbhT5kFYbHZmYTle
	vfXpLkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkn-00000006DAZ-0aPw;
	Fri, 03 Jul 2026 06:52:01 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkl-00000006D5R-0hKa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:52:00 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c0c15bd6b8fso16547566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061517; x=1783666317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=;
        b=YFOU+vPGvQsojkwUzsf/85H0LPNgGHzTrA2W5apcEdu0EPXYJj87m2R4bG3QILcyq4
         XA1vT/QVbfPhi6RFLpJZyf/Wul2agY10IAHjvFr6AoVC9FzUwYXz+ilG37lLGMe0+rM1
         DuRGvIE7WPwRal/QHG/xIgsaK8ZAbBL98zHog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061517; x=1783666317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=;
        b=kD9KBMa41QkCQAVR898ZWan5qcRTFEpxwm8xnCt9klQWa7mY20Xdf7fPZy/wcqs4i0
         diMeF/b50typ38oxzq/M1KXULod3bttMOkPwr9EQA0H5PotKt7F3f0Q4hGLl+hCOYZcK
         8dv8saqw4tafyEBB3btxQcuZgnO15yIV6cL/op13vGS/NjYf+OuDK3Ys5C0qpcS66CXI
         /0R2ci/m9Gkja1CekjbbbRNmVFXaDEuQ2NxHBwWFG3KDzYukIor0edt30iO8LoVJBbdm
         exii2vPcQH5fLWXY4fhPocgNdLD6ZxmUGg0M2NvSTyxvQy3NvBTUSh5pJNepxkaCBQ8t
         aNYw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7dNkfEV7yizOiHHD77PyW+mGc+3yJO4JAis7wArzvhFH0HTHmpJuMGvXFqdgTVnoqPWpmq0n19vvUhrg9u3ft@lists.infradead.org
X-Gm-Message-State: AOJu0YwOUrVeijuF0UeUUX1aHnEJnAfAjY5Agq2sIkhVXoF/ZJBTtoUh
	bvXKk0Ot9vTi5Jne8+k0PeYUF5tGHmaUJy2CmyFeeT5pkwScEanFTu+sbcsM2rEYXXE=
X-Gm-Gg: AfdE7cmg+H0072Z/W8xQd3x9qOjaOTU/YFL+NdTIuTq2iGxfi+nXl3X4U7IjhUSeO+T
	3TdNZrMI5QXAbgLc3FWgPRZL2rp86LEcSaK4MsmwCBqODOWSEVVXYrIfg6c2qCw2Oog/ABXiZAA
	DaAgEw9W1xL+cR/A5dXJ24oEyxD2MTIULsD0b40PPkd4qdjIrR/tx1b/GLvohXvmdLc93ky4iwY
	LwmizJAH9IKvilvGMmijo9T3HzETeo5Ezh6+JnI6eIfg2Qhx73x9z5B0Ru0q28bcXpVkGOhDaOj
	xfTAS/HyUzNPIwcNWHbPMZGvY5KhxhP7QwNuLJmB4gN4E1iycM+8WFie6gEV1nQbhXIBHEdeLuE
	Di47O2+9R+GW55pHU+rnY5ErK9PZp8cbT8vYCE3FFl7DRxWyn3oIAuMseZXGj5fAIKciU9uqnV4
	lJFU/DIR8hZ4KIWzTo9fRnS4/+AaVaAZxPSodImfsnAyxiH9mQ5ZEgFZPRkkknwYINWKTN70w3+
	GlrxBMfduc=
X-Received: by 2002:a17:907:84e:b0:c11:725c:49d0 with SMTP id a640c23a62f3a-c12ae7e317fmr362216266b.41.1783061517026;
        Thu, 02 Jul 2026 23:51:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 10/16] arm64: dts: st: add sai1 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:49:00 +0200
Message-ID: <20260703065110.1433283-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235159_224207_C3EB3D46 
X-CRM114-Status: GOOD (  10.46  )
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

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

---

Changes in v7:
- Add Reviewed-by tag of Olivier Moysan

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 695c9d771853..002fbc724b9d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -520,6 +520,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai1a_pins_a: sai1a-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
-- 
2.43.0


