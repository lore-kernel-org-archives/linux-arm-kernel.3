Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D64C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANwi8Daw8t76xwibNngEAjRselsFlEuOLFRfQhaCOVA=; b=mt5Ck46rwOCzBnaJ4IRLHlLMpq
	d/rOsXTcRgEcEWWwvGjzwdmVw7z6U+D0wDL/4J8HquXAIhO8LeXbf3rl/yB2YLhFzpaCffS3g6ITy
	BvIdgAJFlceNayKXUOPSuLQimy5PFVYgBJnKjP7JMmtM5t/IGsYBaRt0AhkYX9W4dP6NL/YItuwT5
	UF683DR/nHWcbsNxEeao6HTD2kj5OitGCXeBTHXc0L/8BoLRPh53P5E0adaH8jYvf4U3uVo9L7EH4
	+iTcZTYDiCbE+8RFL/Wv8n8q31f04HJDfI7REopWQeJumaQtK+HhD0E+SEvORDcbbweP5AHndETwS
	O9+H9nVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBLv-0000000B7pf-3ACj;
	Sun, 23 Feb 2025 12:44:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB8H-0000000B69w-1wgX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 12:30:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4394036c0efso21356435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313852; x=1740918652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANwi8Daw8t76xwibNngEAjRselsFlEuOLFRfQhaCOVA=;
        b=DjgouRslREOIeyuGCnhGv4vJW6JBD+f6xXaziREgx5ysxcJ0Rb9LEst6uB+l1pTLDJ
         WSBjhMEcAwkGTKXev+68eq+U8J27IDb+JcNyM2eIYWCFv1usYOERYNyFlYFQBDoHKH06
         EhokO75R0Vr2CppK7ouXMtE0ADhXVDrUBdu5YYhyEGZLwAhwfY4cYGSC6Xceshc5mA8E
         GSZIhNmp7cHW4BQOXcJje2YTbknoi8ZXZh1gtKatMZJasR5mkQxn+mPR7tL2OQKZvF8O
         085jKu36iwRTI+RcXxQD6KwbFgtke/VylubVK8wL3M2yyHDJp26WXBiQkJqP6tqWYckr
         i6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313852; x=1740918652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANwi8Daw8t76xwibNngEAjRselsFlEuOLFRfQhaCOVA=;
        b=vepMpfw7/WKl4NCDwhfxLEROEFX9a1gzj/ROgLDaQrute15944ADE0xdHboTJTb6Y2
         5B5jXj8/9SAMEjIvXYTYr+T6CVx9NdF4xMq9zeP7yOlubQoCmmYBBgm3xteVcLb5ej0Q
         A3ZWs/fhQC4Kbw61DxU6Cjjedmjim2aKdeQTX8+Tema17/aPwG800R/RG9znY1IAbW62
         F5w8lSB3XvVyt4m0gQuuM+wCRjH+BEY4NyF197NaYkjMzJIqr6p6k44AKXlUNngZXCgY
         eoeyfDG2Sfu6TmuOoodK77HjDhT4zWFecewNuRofX4Eni4XMX5d/up6TBT2nRtRvv+O9
         bE3g==
X-Forwarded-Encrypted: i=1; AJvYcCXZU7ysmtTsMANiZlRGPw3Jb3OpVQOltlGfGZoLPVphe7cVTLPOqm+j9PHFCN73roJnrtk+xudXQ3YiODeGucDV@lists.infradead.org
X-Gm-Message-State: AOJu0YwOE5ZC/F32C5krLe+QbJjmkMZG/edlxTvR3/TUw9nBJZO2BUgB
	tiwhS7erKWC1nwd2aPoPhiWD15BnhnKHBhWXWDkw5ZGj1m25nuq5Vrlx5w==
X-Gm-Gg: ASbGncu8C+ej8QMk/eQmEYdi0p36PoePBy3GEIsX237bSf+R1YxbzPtyq4dhuN6ID87
	cng68vXwHYSE++jcWxyAjFdVXuTXBtwnEKDbFSpp7rzUoFStp5lgv56mYIJDoc8qsxni5FH5Zbz
	hUG90mcV8J/UBzpR7rCBo6HdeP9kaM+LOi8fyvXgZVP9FUt0RapBmGYzZAwtsNzNyz4DN35VTnu
	mLjlHhhs7dTGdN+X2w0sHxC8RSiyau+xg/+SAJvWsjzsMJt5rpRG9fS9Q6dlJbpsGmY52e5eLFN
	c4YCP9rYnCRHE6eTNqnOiQi/sg050/Er6vF/JioFUOjOwDSbKy94OSd6o6M7uWYerHIVAduCJe4
	zOg==
X-Google-Smtp-Source: AGHT+IGYhvYztyYsvJwTwSXXLYbt3cnGgl7CixfgnQsza534vfgcgsMdLx4kBCCU9Ct/VLgMbHQzUw==
X-Received: by 2002:a5d:522b:0:b0:38f:2403:8e98 with SMTP id ffacd0b85a97d-38f6e95b4cfmr5832643f8f.20.1740313851743;
        Sun, 23 Feb 2025 04:30:51 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030b2c8sm77061935e9.25.2025.02.23.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:30:51 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Date: Sun, 23 Feb 2025 14:30:44 +0200
Message-ID: <20250223123044.725493-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_043053_500899_FF560F73 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Add maintainers entry for the Samsung Exynos2200 SoC based platforms.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4f5d8f68..7da20faf7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20937,6 +20937,18 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
+SAMSUNG EXYNOS2200 SoC SUPPORT
+M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
+F:	Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
+F:	arch/arm64/boot/dts/exynos/exynos2200*
+F:	drivers/clk/samsung/clk-exynos2200.c
+F:	drivers/phy/samsung/phy-exynos2200-usbcon.c
+F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0


