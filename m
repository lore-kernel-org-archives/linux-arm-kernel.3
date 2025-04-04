Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A62C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2NzIbuLVsOaJahdT641xBUsFIJNpkjAwbl7cZpldXQ=; b=TORskWNgX2VwEzSFIErZcKlIFo
	1v6cCJJLx5/Jl6HRSZnkzUkwGVFxf8hQeJi3e5mmV5wWAgOwETNqUuF4GCUz+ihjOpS3u+RrTYQe+
	hOFiUUfjCHqGXV8Hxb+EgNXrkckod2GnD4cAYXT8XwQJu1/be+Aqwj8Sc+FPtUAtXWl9JE342mvBv
	Z6o+5gpsL+xcWmN87kLXoQaxQWNhipv88nWSMgbLF5m0zBdJIe0Fg0vLs5coCPGtJztIT2oIGemvd
	dB4sJWVxTtwl07JX9oCWmEE3y2HLxsQNpQjsr4diRFWKzlbsCMI8uvVGsgaHtobiUk/CGTVeUvspl
	RSCJWPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fj1-0000000Bbok-2dHy;
	Fri, 04 Apr 2025 12:00:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffT-0000000Bb5w-3RT4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:04 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39123d2eb7fso191614f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767822; x=1744372622; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2NzIbuLVsOaJahdT641xBUsFIJNpkjAwbl7cZpldXQ=;
        b=LKgxVpj4tIvGarvq/cd+W3KeqwUF8MNyDtNBoziVivPQkY/WCtka64ttTZsG5K2KX8
         5VTeA760MgJW71X3heS4AmisuFbbd+4Pf09nMo4beGKlxrhufqb4dBa2qTUQyUUesIGS
         tzH3s8XQ1U31WeSGAKDwEaQxA74M3VpHn3TBBwxIYZvwxscQ5mmGbz81I4sp/ixPVcM2
         rWvJEXIr6KaHdzNhHbXGGAOqrzAEZcNn6wGcYqc/XMW0bgljWW1Dke/ivbkwglvZMMNo
         3bq8/lEF4tvIw33QFFR7SvwD2bbz0NI1IrnShKzskOYKqiiR6vwbopP0YJsVpyvk6vN+
         uCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767822; x=1744372622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2NzIbuLVsOaJahdT641xBUsFIJNpkjAwbl7cZpldXQ=;
        b=AZo3QNAaLNcsA2mgWDl1JUiqQdcKmg3awZGwyIdGl2YoWyK1vfoZZ3gs7XpUW4g5cq
         U+4bhTqVNFlNspx5YNWg2ezgrGECXBmRf7FbYHcm/xHfIpl7YD1PB3ucZJsn/VaWPdlU
         RWkQpVahT2YHtmdZFpLf7UCp/8DfEydUcaBZYGMsatOTgE4st/WUDmL6RmjUywjNOzA0
         9HQvxqxi2vqyHRSpTrSfTI57SO2CgRMypXKz9ga3qin6Yrq2UR4stq9fOxTyDHe/rXaO
         kJjzVep/to/rbG3H8zjGYxRblIbaVxVmZv36/14fsejA3gW2pYhJt6oTzpORJ36grVO/
         j6rA==
X-Forwarded-Encrypted: i=1; AJvYcCW9teshYarwy313iAyAesXeZWIUut08AV1wkwZ7kywgMlRKUcCrWks0vflb588gZTpUPksST/VeydSeo4TlY9bY@lists.infradead.org
X-Gm-Message-State: AOJu0YzpXUFc4mClo9nCu8YZau8wLdJmrs1PIiZ5WliAAMjvi+CojZSN
	wThPASNPF9cCC0e8WLxlLhGZxQsqbPelOBgc36qLLtQPQxkBfHoxZ/79PvhzXnU=
X-Gm-Gg: ASbGnctYBLyuzc88kfsCPwF+ykIbi1NQbz6NOz15AGDFXVqhxrAYts5OynFUc4MuJJd
	UbMAflUV8WP5V1B6ECYHyftWiLsE71a8tpq34vfM/lvhRDCt3uTVBoeHL+Z+GQvPqFFhnR537B2
	vU7bvW1fSn/WPFFZ3dz5FzADO3zTi2CnC4prdHhNfh43nQDLAnnESaq0InBoK2/8QkIOfFaLtMG
	p5oSGLza6W0kfTeepiOBjg8x4F2ILMov2tOgbrqwoWnhe8ioltkQLINDXYxaI3jzdBTM7EhI9C3
	hmVN+nNknkca4t1gqlbjwfq+HwqWLtSGist9D2ZhRF0wU1GyOFHpwOIp0bTfPGM6B3CsGgI2aA=
	=
X-Google-Smtp-Source: AGHT+IFxuBP0nmnZWUjwXivSZyFM5R5EOm7OqMfFckNVWAgHA5LCnGmvvIDCOlE0EShLntnYXKvpnQ==
X-Received: by 2002:a05:600c:348b:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-43ecf9c2b5emr11378355e9.4.1743767821387;
        Fri, 04 Apr 2025 04:57:01 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:57 +0200
Subject: [PATCH 1/5] clk: meson: Do not enable by default during compile
 testing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_045703_873617_FB7DE0D6 
X-CRM114-Status: GOOD (  10.30  )
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

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/meson/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index be2e3a5f83363b07cdcec2601acf15780ff24892..ff003dc5ab20d904c91fc34c701ba499a11d0b63 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -55,7 +55,7 @@ config COMMON_CLK_MESON_CPU_DYNDIV
 config COMMON_CLK_MESON8B
 	bool "Meson8 SoC Clock controller support"
 	depends on ARM
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_MPLL
@@ -70,7 +70,7 @@ config COMMON_CLK_MESON8B
 config COMMON_CLK_GXBB
 	tristate "GXBB and GXL SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
@@ -86,7 +86,7 @@ config COMMON_CLK_GXBB
 config COMMON_CLK_AXG
 	tristate "AXG SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
@@ -136,7 +136,7 @@ config COMMON_CLK_A1_PERIPHERALS
 config COMMON_CLK_C3_PLL
 	tristate "Amlogic C3 PLL clock controller"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_PLL
 	select COMMON_CLK_MESON_CLKC_UTILS
@@ -149,7 +149,7 @@ config COMMON_CLK_C3_PLL
 config COMMON_CLK_C3_PERIPHERALS
 	tristate "Amlogic C3 peripherals clock controller"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_CLKC_UTILS
@@ -163,7 +163,7 @@ config COMMON_CLK_C3_PERIPHERALS
 config COMMON_CLK_G12A
 	tristate "G12 and SM1 SoC clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
@@ -181,7 +181,7 @@ config COMMON_CLK_G12A
 config COMMON_CLK_S4_PLL
 	tristate "S4 SoC PLL clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_MPLL
 	select COMMON_CLK_MESON_PLL
@@ -194,7 +194,7 @@ config COMMON_CLK_S4_PLL
 config COMMON_CLK_S4_PERIPHERALS
 	tristate "S4 SoC peripherals clock controllers support"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV

-- 
2.45.2


