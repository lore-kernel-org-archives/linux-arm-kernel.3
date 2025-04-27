Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1403CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Da7zIFrpu0j7h2mGPrNiJuERzcQJY6X/JIb6xBtGQ24=; b=kFLChKfAXnzHuAfL8mdIDsStkA
	sC8bQiLZQi0u1lETmSfsXCrr32wpYY9nhbIXHq0Nu+NcPBNn71fRIh1TtwhrXBhXfv4oASn0fgyFk
	UuS5tLIqBuV9fMCZsIl4wbTI99urj2XMr1bQ+rwqYaYJVSDV+hH+MvrvakPVUrO7d9XeuAC6M836Q
	CmO51kcShYpu00APFU7Klh4SOr8Fnu9nBogvghPs38rOEYG6wPk0aTqHK/+wVChSyaTFRenbbuo1V
	bfUNF5C0zBAn3LKFkfir9afENZrFRHbJ7Di7quug7gR0YfovEUvPTjnKHKGTDYdB2QA2gP+gHlM/F
	CrFxKorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wvc-000000038Xn-3703;
	Sun, 27 Apr 2025 07:59:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wgV-000000037FH-3Ivb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:44:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf257158fso21128315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739858; x=1746344658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da7zIFrpu0j7h2mGPrNiJuERzcQJY6X/JIb6xBtGQ24=;
        b=pk7UzMYTixzeeaNfTSYS3ApKhYGu6NgBfIN6LWNVWoBO/ZBoWOf16KLCgjYNdkt8iI
         YYrD+vbiYCHX4AQF5CsQMnUMFtngiHpD5V9M+6nqD+8rhWcioN51rfFOmGpaExo3m2FZ
         Ia81ZVMo5TzhyRL7KS1g8Ib64pdYjDtVBQHQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739858; x=1746344658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Da7zIFrpu0j7h2mGPrNiJuERzcQJY6X/JIb6xBtGQ24=;
        b=BPaVJ1CpYUy8PUF8YlG14hclXGgHxPQm77GOqlqfHR0Zq8eaQEIzU0jhKyH9GV9Y69
         WJi2SkGVFkJwR7znNW916n1Ys4WpjFydjALKS4zkkI6LetLQqe+pr6aEqDGvvWTiHFuQ
         4mWSmldUZ4PHwZFiZm18HoTysyIVfjqMxlSUcF34F4ykVEcQ8vSaq+hiMNWIpJjATK/I
         joK3G984Bm1/Cy+3MAiTvoHAerbF7gY5PyVzYC188qjNN2ThkmpniUtUo+2Dhm8K8ud6
         8al3UBIvlKEv0fYskVtkouokEYceqLWmQfUs+XIbSE4ujnWvNG1h9B0j0rwEwlAGKkO5
         hhTg==
X-Forwarded-Encrypted: i=1; AJvYcCVmOnIon40LYkqlQCqNNiRJxkoxSUh2C8munw+NwZ6Pj+4mEoSsLEWRjC6D/98WXPxIhdBGY2KKe/bNIwGRgm9n@lists.infradead.org
X-Gm-Message-State: AOJu0YxBQvrk1YPqqGmuoviCmEBnzLSbgUghhaRqPO15x8C24g2qEUfI
	zxSAtw4SvF9FwIRXE5eJtTCiYYDjcm7AzrfnjgLX5H3OfoAkR7WEs8+8ZYjbkK4=
X-Gm-Gg: ASbGncs/px7jUY02Io3qjqYTNTmH1Bugt9G/LNcG8Y1jQ5HCF5hVSIL/tbbxDCpy/2b
	kM3NOREuPzGUrHGh2qoRfUKNYl9ER4gPUNYMbr/idP2KGKtT3NlBh1JV6d7Bnqp5wBAJ/r1cjrk
	T9ztXtVvRnWzjUBsddhFveT2Q8C1SFNzL4e3M0Wg5AMhgB/vZfJ852wXOnSkoyqbp+1sMAhUcZp
	yGPWXwpkp8qkAhfAHYgW0PEPdaAQio6AXzh3p/lsjcyx2+R2kIRn8SNHM0EvKbAuv2/Ii5Dy03H
	OF5GXE9Kl7qwWYGJJbO6/W9u7FeeDj4rf4UGy2bU5eVXjMt3jBX+Bfg+ag381zSFY/q314j3tOM
	Bq4hZVA==
X-Google-Smtp-Source: AGHT+IEuupyIlTgaign30DDDz9KUfwF9305jfDutvCc5oP7891e/+Sd1Sp7bK1ZWlfa2LaTwV1N8Ag==
X-Received: by 2002:a05:600c:4509:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-440ab77d34amr40034595e9.4.1745739858133;
        Sun, 27 Apr 2025 00:44:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 7/8] ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
Date: Sun, 27 Apr 2025 09:43:26 +0200
Message-ID: <20250427074404.3278732-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_004419_824732_05677EBB 
X-CRM114-Status: GOOD (  11.34  )
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

Add an additional pin map configuration for using the USART1 controller
on the stm32h743 MCU.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
index 96022afd0168..8a6db484383d 100644
--- a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
@@ -237,6 +237,19 @@ pins2 {
 		};
 	};
 
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 10, AF7)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
 	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
-- 
2.43.0


