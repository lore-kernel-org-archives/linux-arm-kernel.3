Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2E6CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX1P98lL0ntVTFobuHZJG04rSny4tquvD0IzM102LdE=; b=coktjlTqJmVwbi9WQI+qsTeE6n
	/BRBKlFRj0m/Wt3ESE+S8JSCSHLGTG8OQD89+zQQZp9NguF1jawMoMLGjeEIsLSuQqozjJCiSXxqv
	Jqylwf6dAyDtLZ5TACZkm0TZiHxHz6KUZJgz7O1Z7t77ygmGKmqIhPKrkmTi0ndMtpPDXbuo4SFjh
	PWzeu5bSMO726pocohsARCgwteKypa7KbMNqGzk9r0vOuWsqFaz5xSHr2JKp9xFXMvEPJ0P9HdrSq
	8heCNq6D4UfU0n9oVFfguMkceq6ZbrtRfJJFcl878GQ2az28wNJP/8haXfgTQBFjtvMLyKqdXu9f/
	SD1M0Uog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUZ-00000001V18-2GO1;
	Mon, 08 Sep 2025 18:21:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbg9-0000000HIRB-15PO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:13:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so26832695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757337184; x=1757941984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HX1P98lL0ntVTFobuHZJG04rSny4tquvD0IzM102LdE=;
        b=a479SVOkz+AiHO7jbwV6X1ipAQGFKhgUDJ5j8Wm8Y7Pa0PdLQiWw7jtg2ZtbGugbzh
         uDW3LOWM2n6KlxWxkSN0fP9u5zKt6hVuVBLuxbQEJYjw32LyU2qKpIN9VbiTQF1wO2vX
         EPxFgidIM5jeUY0ya8l2ofku6LvZrNmgXUltx8s2QuAu4fOudhreIEKRYHXBf64/ABZu
         dPHVaYUyUu3O9a1yo2mdZEbSk5fB2m3vg91BSP08xwn/EvYlwQ/X+hNc6y3bRmoB7EVk
         MvLMwA0Zcumad/wH+JkpFofPa7nGjeH7QPaDUJkCESAZoL2kcKsPG7XO4cc9AQoreiPh
         loqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337184; x=1757941984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HX1P98lL0ntVTFobuHZJG04rSny4tquvD0IzM102LdE=;
        b=UEidTIEp57zuqZgV6c9kpW2Gn0w4PE1/NnBi13DgimQF2Iav+21iKvcifPon/3GiQL
         kUVnr+qFcbj0d11BrqOUonyjMH90QqEuLyy0euQeJiSqma8Jh1wOLSMv0/JVTA8Ll+N/
         4AxbQJ0yDivqrKg9AqAa7HadqfC+AOiKSyOfuvtrjlBX+4jLK1P0fLHBmloyCO0zPO2U
         IxQ8l2OCETatjlpiPu4mwqPYPpwt0UcvAlWW8qoyHd07n5FhZex+ZAR4r6JgMFp1YZt6
         spexvGQuz4oJOHDPOXTwdL8JgFZEu6P2ScyxvFyn3Bt7ZN72SyDjR3ZnjqUXNFC1d8o0
         v7CA==
X-Forwarded-Encrypted: i=1; AJvYcCVkcE+g7LuNaqYkmQLt2kKGzTKNu6vrfLeUOZVM3XrPUdwDHyEHWlFMPjABSy0TFaIJE5WcB/jmpI8HDhyZsNhk@lists.infradead.org
X-Gm-Message-State: AOJu0YyKZCFzwTSD+By7wPhTyZAyP/UG3FbkASLtbB7n2XoCdOebcLgK
	37vOZ+NUxza1hRoIb6JpbLWiI2/VuSeNgzFG0JbyyS9snZcey4FkFxQK4GyN82+bdjY=
X-Gm-Gg: ASbGnctdKmeJjiZb5lpX2Ex/UPFqhjnN7SomqA6u1G5N73gkKda1VNTk9qk1Ew8w86V
	QJk7ijecfeGPBlqMp+22aFbISi8pGStHH+MRVlpt+3Im5AvWDZGBIyeB0JC7i76XVU8Dw+TyUKe
	MuR8afZ4Csu8nWGTLAf6OMpqk5AxgWKfEGs1Oxnq3VAo2OfQ2jXeiYcAg6ov8ULO8H+qwOAeaWG
	dzt9TVQrPScaRva1bO4tWK1qohFmia7GekXYeG0fvgZiEnuY36F4KkzzS7/L+JV2ptcPck5Pi33
	RCPwLDY0OSkEBZrCJgnyLY/Lg4IlM4YX3I0S7QU/C/W0j3GLKlhscLqCcVVtoYusN5UIsrJnoV7
	BZM9Td8PbnY0HuHcWuhA3j5eojhoSTU+zy35HmfnjdznQajBiXe6uhalbS6dainWxiFehPzCk7U
	rLtX89RlEa4u8/
X-Google-Smtp-Source: AGHT+IHrei69SE3S2Wo3PhQL3nGzDL0r6xFLtoIiPAj8bXHlYe0awD9SWK429eaX/ZmPsA2F6T6ySQ==
X-Received: by 2002:a05:600c:354f:b0:45c:b61a:b1bd with SMTP id 5b1f17b1804b1-45dde220a2emr74636385e9.18.1757337183601;
        Mon, 08 Sep 2025 06:13:03 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm41650181f8f.43.2025.09.08.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:13:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 08 Sep 2025 13:12:46 +0000
Subject: [PATCH v4 5/5] arm64: defconfig: enable Exynos ACPM clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-acpm-clk-v4-5-633350c0c0b1@linaro.org>
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757337178; l=820;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=r9B8eJrWR/g38PUeQ9J2wFXWREa48OIMpTY6cZptlBw=;
 b=9ggP3KUVS2zT7FryKyHNIZtbBh3Rqan9vA/aNkZzb27KJvR7ycYAxiFo0bkteyhSCJ1SQvT4Z
 n+0HD5LlcvUD4LkTHTo1imFXIzH7ED6AZ4JOBehLysGJoPG0239vgL0
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_061305_298653_4CED0C85 
X-CRM114-Status: GOOD (  10.31  )
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

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..4255bc885545fb3bb7e9cf02760cac35bf2872fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1445,6 +1445,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.355.g5224444f11-goog


