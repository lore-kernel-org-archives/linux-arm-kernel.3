Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE625C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPaIY3x3VVrMkB4/G8kk/a/tWB9/OjPG56rBALdlvrQ=; b=y11Mp0Tf9rv/WUtFUrmtMVJD1p
	W+KHuQdPucg4B7NKJWqpq2FggKJbuUIFTgAJG7hLamfIvmYr2F/Pqa25vE0nGRCz62LTfsQP5YOdn
	JsrxVXRGEy/3C4xvrCmue2F2FGgzlfEC0BFix6L+yYuxahCtmb8I2xq6IabyKp9C2JAq2NiqavEoa
	2d0FPA+s0c3ZtuF5eFTlOW8ImL7nYgp4t28o/cQHajxTibhr2aQ/2EJTyHwHll1NS2vNx2jwxQciM
	6aO/VJuef+uaIKYvIiC94es0v0eI7CLVLvi0oo+PvtBIQlpJZIDto/d69YxLU6ttKrvtuOEDmUCkQ
	zbLYfiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUFe-00000001rzW-34fq;
	Sun, 23 Mar 2025 22:57:06 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyd-00000001p6e-0wUQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:32 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac345bd8e13so673815466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769570; x=1743374370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPaIY3x3VVrMkB4/G8kk/a/tWB9/OjPG56rBALdlvrQ=;
        b=tfVoeNcgyVvtrbYT2TQ5yH7890rWu1LznphXZHx+8tb77tI4eBFXjZmAAPJdjWsZNN
         kN9FhxkCDmV7xoXh2zjZ0FIdclIxr8cMhxN6ACB1FK/SEzJn5+JaTdFCz0Y9T6U+h3iU
         N7GzHtL3eoKM0VgIG2ilEQvm1n6e4FFgeTE5DMOTznUKJllcVdv7sGq1HF8CWZnh2b6k
         /ImjdsVbTEh1RKD3C2zAU6a2+obq7r7HRmN41p53Pbv30XsnS1LOSC2pxaAl2YHRaZ40
         fdnrcwr0L/RoWDZa5Tow/bzOeyd2tLITBbqxTDxSOjOAPHRhCGyn7/K8W8YfXl7N/rKL
         33+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769570; x=1743374370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPaIY3x3VVrMkB4/G8kk/a/tWB9/OjPG56rBALdlvrQ=;
        b=qzteSrv62jVd8bkCZ0fPMPZXZoPnuoZV7gczFCr4Fr3jHiSZtMUbaKMiMSffHYRx45
         sPfvzVZATV7cAoBaiVp/QLxdSJv7sY7l9Fdlcw2h/N2FhEmZkIoIwvPt32GcZm+tp4Z/
         unoDnsaueekoES1Yh0Cr+IVMYOx4PmGFqOev3WewO0bPWxpJUgDJrSqI8dCzFM6AmvZF
         z2NlhVUxzV3Qh8hfyOHfCCJlX0P7tuEvtYl4kd9ktsq98zSdDp32ozJSB5asb9ZeIa+a
         xq067uysRb/K8yI05BUm92c2+J3bYT4xNdpjYrpZXMRMWSPRSmH+2oCzsFtazuO9a1tE
         DTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG6Fw5TRIVlz3fmFcPIhAT0F/QqKvCOdgrWRF8lP25SAFTjzFuwMClDu9FoDdFQ7OIrgqvRAV9zH/79OwqN4/o@lists.infradead.org
X-Gm-Message-State: AOJu0YxB4Qi3jqKW0YrIDuIpr4MsPjoDeLZhFBWhGO0aW4PYvZk6NMH9
	Ymk9WW6QB5HIp4/n+X1YYDRf+ZoBP7ofenA0N+zmKdCdlrjFRMtZVKwcpoD9Qes=
X-Gm-Gg: ASbGnct5tq5WXiN44Kt0aABtG3dSB3OOYMKhGVFF+fEicfkmZKoV6c6gAYO3ChBDRAM
	Ts5vq5ef0T2vOCqV9hGPNRArsjp8kwFp3ET/Kvjda2rpE9Yyhh2aDe91ccK82lgzhhE9lOkwV1I
	q7GmO8+7dJgnPIhmOqWHpRapDtP2BY8ukP+jYhHiISfaY6E2gjrY3+oTEeuRumWArWmDJvrptUz
	myGb/av54e/BDhOH0g04XHqPp4HeTIQWz/ytBDKFqtfD3g2G5lKoddVvMMMKqdv3EMyQoklBuWf
	UFLJJYBYjhi5rSdpIE/qSkB2PLHkMtvsMSt2t9GAWYtdT6ghIqVTYGFJH1/7jYxKbtNB1lcufNM
	ekGE7mYePisMV4LK8VmwJO2XzMmD3
X-Google-Smtp-Source: AGHT+IFPXn5kuydsVZ5juxiG+97RkmMKn/3aV6ozY9UpbUvRFJV9i4K4wAS7EARyuWbOU8je237GtQ==
X-Received: by 2002:a17:907:7293:b0:abf:fb78:673a with SMTP id a640c23a62f3a-ac3f22b0fb0mr895769166b.29.1742769569876;
        Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:27 +0000
Subject: [PATCH 11/34] defconfigs: rename CONFIG_MFD_SEC_CORE to
 CONFIG_MFD_SEC_I2C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-11-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153931_265924_8574AB4C 
X-CRM114-Status: GOOD (  11.11  )
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

We are adding support for Samsung PMICs that aren't using I2C and
therefore had to rename the Kconfig symbol.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm/configs/exynos_defconfig   | 2 +-
 arch/arm/configs/multi_v7_defconfig | 2 +-
 arch/arm/configs/pxa_defconfig      | 2 +-
 arch/arm64/configs/defconfig        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 7ad48fdda1dac69a4a9612eabb573729bed7b3a6..251f45be6c14af59263373f21b27b15f42ec7f61 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -167,7 +167,7 @@ CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8997=y
 CONFIG_MFD_MAX8998=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_STMPE=y
 CONFIG_STMPE_I2C=y
 CONFIG_MFD_TPS65090=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ad037c175fdb0ec8601c9b3607aca0c0e5f3c145..7d06ac5369b1a2f325462f2cf5b54fe22061ca77 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -612,7 +612,7 @@ CONFIG_MFD_QCOM_RPM=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RN5T618=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index de0ac8f521d7612704ce327e9ac16ab9e999f3d3..064e79baf20da809c9ab1f1fa18282aaba11a41f 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -335,7 +335,7 @@ CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8907=m
 CONFIG_EZX_PCAP=y
 CONFIG_UCB1400_CORE=m
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
 CONFIG_MFD_TPS6586X=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e8dfbe22db68d9aa24df5af0786a2eeb8f33bf3c..cc4dc330cfe82d11ca0c4c9ba8cac4b14decdeab 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,7 +769,7 @@ CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RK8XX_SPI=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_SL28CPLD=y
 CONFIG_RZ_MTU3=y
 CONFIG_MFD_TI_AM335X_TSCADC=m

-- 
2.49.0.395.g12beb8f557-goog


