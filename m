Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E53C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y5kZ7u7Dr0fsKDXt1wjhWFkaPUY7KtvLcENII4UEcyQ=; b=zVMvnPDdaBjTi1rQClbpQwVA+a
	FEAAcDZxaSMFAJFhrIxOIx6KpGNRktz46vMCS2XghMy9if5PIGrwj2AO0y/xFZZAVVeMTI4wOJB9i
	ny70tipwCNxLa/2BzSxvuF0bxWxkApPAJHYaRXt+0KUEDMR8uLg3F/hBeo23ouI8ZzsrKpN0A4b1H
	SKn/VWM3MUY2CGiNUbdB045OQps6Vv9OzmTjpY5ffYrGptuW1vzePGrk+EjuVdSNEoe3vPpQovpAq
	fQaPq/ivWELpxkyybEfnDpu6J+NWAN+3PhOKzvVG7C7Fue+RPWKx9HCV+obTFZmwRvYj7UQh5mY+D
	swzK9U6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPywf-0000000Fbca-1p0D;
	Fri, 13 Jun 2025 07:35:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPydz-0000000FZux-11Sp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:16:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso2230205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 00:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749798966; x=1750403766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5kZ7u7Dr0fsKDXt1wjhWFkaPUY7KtvLcENII4UEcyQ=;
        b=uwzNjQZzm1vqnrjP6Fi9jXs1//V6BS5DQKmLnH9WS2/B8F2XLPnKo/Yil1Vdwq6GPN
         GoYgXNvDGlAp8CDfCssR3XEtj38lRHhquvUk3EnU+TzOrP/roAOhQlW/Jv+Ot91bwVq5
         0lJPTiJFyRvmyoehyH0lzfztbD4prYVrRL7c/0WzMRkjc49BUzzJPvbyFy5lPh9MELfJ
         F0UffIAu7UE520WpphVQxuD2lk8FluAnjKW1kIaYogNKyJkHNxWl5ZjP9bPCHBs3QNyk
         2MERs+fYtmkNihdAD1eSTcMMlwjQ0YloAneiKYblyadW/X96wsKCiZPJihAw6G9wYdIV
         VvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749798966; x=1750403766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5kZ7u7Dr0fsKDXt1wjhWFkaPUY7KtvLcENII4UEcyQ=;
        b=uqakLcRF01Wx/FroXfiNDuAgDQMeQYuNmg2ARFj8SosEY+Z4E7mnj3uwVhK7QCx6zE
         07fQxSFSQdBXcojq/QxZWcFkgMa8RyORO5avAs5NOUi0JccqoCMJR6QFxOinVJJlsvWA
         boo6rJJAfkh6BRr2f01F7+wJ8GeDkD5rxHyiFLu13rX5o4+/PwXLJD1Hp6bAsxIYzSmn
         pkdVy2y0LuCpZBwM+H+SLcU2hqs8jZ4/dM9ORxJY44Cd3g/SSJdoavZapt5MxAcPi0fI
         eLf/vwe+04xWp39Q3Ty8yqLcecR2KYDLW67JXNpnE9FiFSx66nE0PUAbtiSrf8viBIDv
         +Q0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzzmNu4FGxpDXiHtmghVHoGUMGpL+ydGkTd5Ej0I5n1dQU37zxIDXL7IXapbL1ijrZbv8HOTZA9gNRNgz4GGru@lists.infradead.org
X-Gm-Message-State: AOJu0YxQtjj5HaaNCvKwkCVfvghIe/7EuCSY/jK+eeCIhcTKikyeCiJV
	g4cMf2j2ZBZ0JP8BNhEdfdLna8YgL0T8nKdxEDXH1/wEBL59r14D6M/xFMA/o3iB5zs=
X-Gm-Gg: ASbGnctArMeT+P1jP50rtxa8lG8Dq1VU7HYKDffta+VMNh9/bFuaWiBjrOEo98htA51
	JCIzeb8pbiSPtWMOVljGaUv0r5YzBRp9g4DX/IqsjoLOa1fn7/8/ahLKGmSYdPaF8RGGqeq8Y1t
	oO4k7S/hcd2ovfWHrK060ZT0x/8FZy31eMr4F+OLO4bWMoMDmEvbTe/W56lo9aR3S4vC3m0lZWx
	7bit05KiZXe9JcH5RDELPU5TNqgSc886bm4iYprdy1Rg9OljVn/zcoZCsvpw9xADZQRAlLEBPAM
	5apcYCge/39tVohlqfptmRcHrLpXnLIAi+id9uVOM0GRB/PX4nApqgA/YJSBxGoGB+wf/g0KIQ=
	=
X-Google-Smtp-Source: AGHT+IG5fdCQC4xaFcWmupiR1XNMdJV3tpCXa2Aa0dhnWO62Uu1xkclF26M8m6TAJ2GxEAXFunYgsQ==
X-Received: by 2002:a05:600c:1d24:b0:441:d244:1463 with SMTP id 5b1f17b1804b1-453349bff4dmr7398455e9.0.1749798965705;
        Fri, 13 Jun 2025 00:16:05 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d98sm1456138f8f.7.2025.06.13.00.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 00:16:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: exynos4-is: fimc-is: Fully open-code compatible for grepping
Date: Fri, 13 Jun 2025 09:15:57 +0200
Message-ID: <20250613071556.46521-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=m6qHT7ZGx3axLWtAA1ik9FjqdHgd8DBCvLXWUV8VpHI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoS9AsRRjfFwrBhrAdu6YhTXWliEG4OfD3sB8xm
 u9Go3bASU+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEvQLAAKCRDBN2bmhouD
 1/ilD/4/zLqseRzSCkCDre89I0rSm1KMGMk+UqY9BuQkG2ooiHyUFkBGTWUWzbEIt2nYYAKK+Vj
 Y/RnC0IOf1Z+N36zVqQVmZWfZ31dPCWh3Kr+oCBy53v65WSmJYpFt2fq57HhNNVaZock0CV2UY4
 cfwgcSLPVPkoRojPiWn5JtnpRaYw0irSwPcUhIwDk7qJoC9uCt3kajj82cSzzfA+XHHUfnnukjQ
 JOjs2YdOzReWwtyydz349ZOvJBCIH1L2km/BAeeJAcA8mpAH+T3HOSHYrqbO+2mQhIaBR2QL0dw
 nYOPFdlIkBJEDAjkOks+r2VFHOvED4gnTa3WTSxW6KhWZOq0KwLSenfohvAOzjvlVNwkJZCvmhh
 v43wkRC9ojZwug8PGq504B/ukGqpiUNdQgB1VMQ0FDZcoyfnE9iX1Mlv1J0gQ1ZiVWaHnGPMRx+
 Yqhyx2u8MkyVo4Rox9g6+xPHIHXe+94xDprndb/PHypnN39SQ5eVuxD58vkonvraBT1mma/K5g9
 A4JYCaP6K43pFci+7f6FvWVqERy2CD/nQZVYVNuz2mh77d43k4CgD2DV4hoAOoX2TFnQtUHZCxw
 Qpc6/BTgjgs+O3HVJUoE9+ARzSG0DvpK7NmCz+HTvJqSxDKiEP7G2ZTeAAPMm2m1fvWOCb3Bb0X tVc9mUs8NAOu5xw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_001607_294922_635213D3 
X-CRM114-Status: GOOD (  14.34  )
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

It is very useful to find driver implementing compatibles with `git grep
compatible`, so driver should not use defines for that string, even if
this means string will be effectively duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.h | 2 --
 drivers/media/platform/samsung/exynos4-is/fimc-is.c     | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
index b243cbb1d010..b5b37b6f8fa8 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
@@ -131,7 +131,7 @@ static const struct dev_pm_ops fimc_is_i2c_pm_ops = {
 };
 
 static const struct of_device_id fimc_is_i2c_of_match[] = {
-	{ .compatible = FIMC_IS_I2C_COMPATIBLE },
+	{ .compatible = "samsung,exynos4212-i2c-isp" },
 	{ },
 };
 
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.h b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.h
index a23bd20be6c8..69d597e5c297 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.h
@@ -6,7 +6,5 @@
  * Sylwester Nawrocki <s.nawrocki@samsung.com>
  */
 
-#define FIMC_IS_I2C_COMPATIBLE	"samsung,exynos4212-i2c-isp"
-
 int fimc_is_register_i2c_driver(void);
 void fimc_is_unregister_i2c_driver(void);
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 2e8fe9e49735..ed7b7ca16f71 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -207,7 +207,7 @@ static int fimc_is_register_subdevs(struct fimc_is *is)
 	if (ret < 0)
 		return ret;
 
-	for_each_compatible_node(i2c_bus, NULL, FIMC_IS_I2C_COMPATIBLE) {
+	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
 		for_each_available_child_of_node(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
-- 
2.45.2


