Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052D8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b3JdFQg9OP+vObOtg3YucUTBQsfmVEuB77cG86LXLR4=; b=GefusLjNtTT5981QnbY4a9UKeR
	M0mKByE2g6mfWymYFRAfgXpygVHMZRdZnErG9kGGe8H+2mLNjLfgo+heTZ0rs/bBYer5Ud5NunhRR
	VF3mobuhwFY3KfvrnFqGE1jXn2q11GZH0VidkLgDtbWdC/tsudJgifYWZqYF/CLP6PIKQ10e11hSJ
	0ofNLtgXzrM2Pv5A1J5U8zrW0g+CQGl+kV+duJIjXsGDTINidxXxaScgfBDljkwNPjUniujBt0/8i
	ovr0ExR/MbdzJgMv12cKaiBMO3vc8+DQLaXTJkNBeXqTrGgBFa/eCyH3VJjVonWz6vlFMtS41O/p/
	aTxxWXGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0frt-0000000Bdn9-0DIT;
	Fri, 04 Apr 2025 12:09:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffo-0000000BbHh-30bS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1881085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767843; x=1744372643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3JdFQg9OP+vObOtg3YucUTBQsfmVEuB77cG86LXLR4=;
        b=AlNe792o9IrCRdWfuMLsuTSIVATS60ceDbrok/n5MTEDRdH1O15sbI2kTlWAeffIIf
         cr5qEai3Mw3b+94IPGHbe1N/1pv5ABr1nMGg6tLfqZExPco2j1/xaBR7V2U9ZZKQulli
         ecs5F5mW0hoNUyZgUfEAXdztp18W5F2HjOCO+TIQu+1rBaU8RGY7vklAk+P7XAw8D41R
         yFgeNnYXyjPrQRu1USnRk0Ev9FakRIGAu5qSmZvWIOyxfgH4ikHPw/euTitldYN6j91Y
         jHoKVuHPs1y9r+VF9V17rCO87FrDhRpamAjhmwVF/0NOxI8RHTR32FXblwmctnf1ONJ2
         i+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767843; x=1744372643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3JdFQg9OP+vObOtg3YucUTBQsfmVEuB77cG86LXLR4=;
        b=dvKtisgsxc8e3cAOr90nVh0+oKLHxXdSn65tYf4nQnsHgl6hbpC96fWaRhapUruk49
         IViuXKTEHFv3kHsvTA8jaokMvWCpqfRlBrJYXNoWgHwNwhksYBDb+MLLUi7EqQIyvekM
         SROTT+zK7jHvubLXd7m5hDgFnp+98p7so1o0nvO0dDG6RXKWLKA0ETBVIzNWGZgy107Q
         6yA8vfZeL2qMsDPGFjFw8A3TjChKCQJjtI2H0E8V4eh3gdHUzCWs2muPNYlPiDGQpz+0
         jQm76ddzRxRuELBqeGjrsytAu3ZzhdsAvia1o/EbPsM4AmmnY2yPJts0Rwp1MnSL9C0t
         jKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqhW/dpIK+acUO8fphJ/oleFhG3QuzNQIwdr7tgHHJ1ELE3Y6oZZAb7DhJ3gd9m6VRXQgpYrKjNJOratxKuEw/@lists.infradead.org
X-Gm-Message-State: AOJu0YxCd0t5BP4dRMS6D+53TFRBmWvos3eOYnHB6z7dGSLm0jt3Jto0
	zjbY/g9Bn2c3aaLAbccEIo0vFtu3suKjthOeukfOaBm5nOVPdFIrwfC1c65QNA4=
X-Gm-Gg: ASbGnctFPDf+VCY+gMXxjHThU6XSGMAUHQBcqWOCltfhpZSD5LBCY2qDQf3riW8pzFL
	slPSuauZXHRcEaXP1O3Y+u94pbagtZNLa8p3DgZUrag8ydIRmHJ2zvYLv0Pcz2kyVOXnsc0CYQa
	BWwDxw1Qa4CLmHPVMZLu4RkbnWLa/cV96Bb8iP25FZwIvJ8TvqG4+7Vwmqe4GUDj+K+4VQ2XlAe
	oyl+lL/YLU2EOvbRP07ziAvSBSIH1aFncJCR9W0+eowu3AyKIdKH4Fxkf7Cfgsr5jIFv9ZMvCpE
	P00IDZoMhYqN5uSzHDtF6Wt3gugPGvXOed3ub82/J93Ha2z990kJ4A==
X-Google-Smtp-Source: AGHT+IErSp1UfkWiyQZSYQ4Fs3U5j3CAQMjPo78hcc56nmGo8lsKvG80Q29kD9bY+/gtM61oyOPwyg==
X-Received: by 2002:a05:600c:1c1c:b0:43d:fa59:bce9 with SMTP id 5b1f17b1804b1-43ecfa4d95bmr7235225e9.9.1743767843351;
        Fri, 04 Apr 2025 04:57:23 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm4209455f8f.60.2025.04.04.04.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] pinctrl: meson: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 13:57:18 +0200
Message-ID: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_045724_757038_7437BEA4 
X-CRM114-Status: GOOD (  11.26  )
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
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/meson/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 90639bc171f6..0315e224bce6 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -3,7 +3,7 @@ menuconfig PINCTRL_MESON
 	tristate "Amlogic SoC pinctrl drivers"
 	depends on ARCH_MESON || COMPILE_TEST
 	depends on OF
-	default y
+	default ARCH_MESON
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
@@ -17,25 +17,25 @@ config PINCTRL_MESON8
 	bool "Meson 8 SoC pinctrl driver"
 	depends on ARM
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON8B
 	bool "Meson 8b SoC pinctrl driver"
 	depends on ARM
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_GXBB
 	tristate "Meson gxbb SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_GXL
 	tristate "Meson gxl SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON8_PMX
 	tristate
@@ -44,7 +44,7 @@ config PINCTRL_MESON_AXG
 	tristate "Meson axg Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_AXG_PMX
 	tristate
@@ -53,24 +53,24 @@ config PINCTRL_MESON_G12A
 	tristate "Meson g12a Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_A1
 	tristate "Meson a1 Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_S4
 	tristate "Meson s4 Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_A4
 	bool "AMLOGIC pincontrol"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	help
 	  This is the driver for the pin controller found on Amlogic SoCs.
 
@@ -82,12 +82,12 @@ config PINCTRL_AMLOGIC_C3
 	tristate "Amlogic C3 SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_T7
 	tristate "Amlogic T7 SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 endif
-- 
2.45.2


