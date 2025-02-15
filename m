Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E715C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5SxoWr2vFLkloiiVYCn5S11j3T2lrQAUOXkKWdINmvg=; b=PU4fr1I5iBGHjdRCV1YE68+/xs
	7G7Qf/r57R3ehik41z7owt5V7jZN1HURT88VibtxwcOEtDv70FN4jB4+JCQ4v+AvLtPQcObc3O9lf
	odFyvbYQkdUKQZbLcL3V/fJ4Td0R3vDGD2y8zBnHpZRekI1lBwdFqH/Cp6vgg8p/oC2/+Pxxp7l1Z
	OKkJxZnOyikk/+v0J3CS2EaT78Ww46SP9wyHHPdltw9craGlKZn622s7CDwEd3yeePvjNWFqvJN5e
	q945VoM3O8aSnnP4dPit27rQCJ0Cd10JYLU2EsapByreR9MeKXB5Nk72H2YSdPVrCjPAlKwCsjFVl
	RwONmcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEty-0000000HNqt-2xZ1;
	Sat, 15 Feb 2025 09:55:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEfv-0000000HLzj-2YhF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 09:41:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4396444e4dfso1355125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 01:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739612486; x=1740217286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5SxoWr2vFLkloiiVYCn5S11j3T2lrQAUOXkKWdINmvg=;
        b=xjZvEhDjKpqfILJ1f4B+y2eumSMr9EhyMffn05UOSzUDOk1TbeCXNctTof+drZ0LAp
         vklvAzbv/jACsXOntNYf0MrLhA+BeMR+X3PdkDv87RVRHZVKrvDKOAJ4qZToAFpbIU3g
         HRSoLI64EHtM1H9AFvA7aYI+vGBrCYpYymNhi+oVmVZft27hOR98O0wiwij+yo8rkhxq
         BUkGB3avJ2hCKYHUVWyBlxa/onUS+C2iczIrlwA5TNaLh7WiFWJYWFzeDWTFVqFXe5VH
         3OUuVe5TUCtGTle5FO4InmtkfksqlssOKJrFTp46JgUg7oJanrmTTUywlbXu2CVo7F5X
         kGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739612486; x=1740217286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SxoWr2vFLkloiiVYCn5S11j3T2lrQAUOXkKWdINmvg=;
        b=pJKXpUtwkoJU79vNlgOoa2GhgdEa/KdKtgmukbbCv9Z0thTLK6dLZhMs6TozPqgnlv
         O5qdCeJ4/cZQe1xmsfRGNVZ+v+xzziJ9MtgQ6FZtlukpYTrU71eGdXD4O0qJuknH7UH4
         3E73goTmfeuzAtgrBjSFzqGQayPkZhHeeXv6dU6UIhZLPfAPaCNR9EcIkUVjTQSWhQFS
         qL0Kc6a4idGXZBjXu4C1ddX+Az7eyBe3Boc8bUVgR4uXJFNLVVs5zNjYpUPujR1LFPW4
         EvLXFazTv4ymA3ESql723LzDLHV8AC4oGq8Lt2FBDaVsWBKj5QCXGQQZ5z6pLfwxVSxp
         9uHg==
X-Forwarded-Encrypted: i=1; AJvYcCXgfZZ4lhlJHt6IVyHHsfWeAe2SPJOO1e+taiOWeBjDIIUsOXSkj4NUKyjFZZquA9ZlgKz6aq5K1yITDKD480RQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwKkyqVLBXX0uutIRy8fAyj/0KY9SHTIZw/OCajcQZEPC9Cpkeu
	y1Jk7S23gShzFDulQwOH7iJT1B5/8042zj4PhcMN8uklJQf5w5EoEu+syhI+wWc=
X-Gm-Gg: ASbGncs+Ssq46+/RKr2Wnk+w2tM4a8pxg1g/qtsxCO6wVtdC4ncTFCLXR8JicWO7XC8
	oVnwdgzL3gvDpiTEHxHpWzlMjQQvg1fIQOmx4o95nerfJjnhQgTwM4XMd5zPr3bS1H+LcEfxiZQ
	LLEBkUu2hZLtCxfaFnyU5Luxfi0+IsN+77jG19lDJvPHH9kuAJ5lJNCKkVYWEbIzFJjc44VsOxd
	Ci9qIrNxXrp3XlLs5QxHgGDoDtkv8gnoa73nCM4oilmaPxcb5+Fb+bu3Ur5ZAGrJDQ8GqEDX/Ua
	+4AmIwwfaXUYPhmaMH3rSyUjGyiLvA==
X-Google-Smtp-Source: AGHT+IF2PoXxZGft4S7bEaK90H7os4Iev7h+v97AgdpzM5GZ1g5ZH5opiwmuf7Drdh8bXm5uHZBgtA==
X-Received: by 2002:a05:600c:3ba5:b0:439:6538:c979 with SMTP id 5b1f17b1804b1-4396e781fa7mr9169255e9.3.1739612485654;
        Sat, 15 Feb 2025 01:41:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8471sm97985345e9.37.2025.02.15.01.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:41:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] phy: exynos5-usbdrd: Fix broken USB on Exynos5422 (TYPEC dependency)
Date: Sat, 15 Feb 2025 10:41:22 +0100
Message-ID: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_014127_691489_289B6BB7 
X-CRM114-Status: GOOD (  14.51  )
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

Older Exynos designs, like Exynos5422, do not have USB Type-C and the
USB DRD PHY does not really depend on Type-C for these devices at all.
Incorrectly added dependency on CONFIG_TYPEC caused this driver to be
missing for exynos_defconfig and as result Exynos5422-based boards like
Hardkernel Odroid HC1 failed to probe USB.

Drop incorrect dependency and rely on module to be reachable by the
compiler.

Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Closes: https://krzk.eu/#/builders/21/builds/6139
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com/
Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch for issue in linux-next
---
 drivers/phy/samsung/Kconfig              | 1 -
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index 7fba571c0e2b..e2330b0894d6 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -81,7 +81,6 @@ config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
 	depends on HAS_IOMEM
-	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
 	depends on USB_DWC3_EXYNOS
 	select GENERIC_PHY
 	select MFD_SYSCON
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ff2436f11d68..e8a9fef22107 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1456,7 +1456,7 @@ static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
 {
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_TYPEC))
+	if (!IS_REACHABLE(CONFIG_TYPEC))
 		return 0;
 
 	if (device_property_present(phy_drd->dev, "orientation-switch")) {
-- 
2.43.0


