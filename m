Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E86C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=; b=LP4SvaHhXGYt60VkmzMoNumZGy
	bHrNsuShK20DhIvHz36yUysJcia3QmiRW9tsDAf+Btc9YpTmycQbIgyJY4KCi8z3KZZ/mOE6pSlsS
	Mcv+wk2ORMRgqeBJYUH4IJIG4djxiH7V1VD04ixWqKU3KQZ+e0sFKXQ7xtFtTHBVSOBOWStQZJAqK
	N1F2hwWOYjCgYK8l/EMksyPdQAVT6W8qAbH/RCyaV3NGsMsy9ZqS/ZqLpD/6xtrERh4h/e28p/ixP
	bQLOAUU4aSdQgmWIQt+zj9cZ1vnxQvaxxbTh/zcJQc01UzVFKqAsa652acT8rixlNerD2MhokRT/M
	4lMy+t1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOz53-00000006ykC-1eou;
	Tue, 10 Jun 2025 13:31:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAQ-00000006mJx-1Gda
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-453066fad06so19263375e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558805; x=1750163605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
        b=oFM1RNxZaHy8aNHdrHxPRb/r1SWJglK8SLM1TBgs3oPsWfUjzk8ubMt1U55wOab28U
         OfHNfkraYrEmrFLxde+jmlef+GeDdrM/K92rILWCeN3Z2xT8jOpdR1qsuSE12q7NNiVv
         9AaDDCnAfrp4jTizEfJ4okID0GXfg/mPC0s6NdHyKAGfp9MG+A697Jmc3pU7Nlqgusq0
         mEcCgDX7dAuITJQ0pf4NreBU36f5roM82APG3mfjZjzXaVjVQmQNm3xhtAfsiBmmT3XW
         PI6wIZ9n50eFPbZQXkiBpIWYUWbXfHaez5zAjIz9SymFNQTvDMAIRhPhofK8xQ/1fEns
         ZGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558805; x=1750163605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
        b=DGC+8KV4YF0LyeZZk2TasVjADTrM1BvcziibUGl+fose0K5Yah/m9uQ23eTC1uZJIs
         vaez9SJATKSPiO1Nz8P+r2TffnnV1Oag19hCeJgiUyKIzo5XvONUAm+dFkXeHRWaME+H
         1ZWngJhXzxwhuRd2oJtB9C5hJcy3uEMrVDYaT026o3Crob2Gp0f5YpR/SEvKKOuo5GSK
         gMT3pH6Rk9wUu2wSznP2ozBcMaYe8Dibt4ekLL98KQfklwaK6LVLd6K9N5/DDpNzbHV2
         Ru0drZcmB4fScOaA5moNq92JfhYD11A2UQkSXvSuN7MlMJ5oF9YlVxvz0RynUT0svG1U
         P4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVazvnjO3RUf5unUjmdfQYiLzDW8y4025pVAF0gvt79BaGXxHAWfmpFztExgQMNygivll2VXStIeQrg8iAqF6rW@lists.infradead.org
X-Gm-Message-State: AOJu0YzHZ/uI9okvcyoYmVEDyajIHdjdPEE28WBwQEQR59WJbAGsL3gQ
	n52YOCSl+lRsQs7F71McVewSyrObol4ev/Kf9e6WlVi79KqNnkyGcyXQ1e7P2xbqvVQ=
X-Gm-Gg: ASbGncv3x/i2y8GIRSknmS4Aw0/CZRusH3tifx68IKUrptTKbF6E+Bu6+6WW5tyIJ/6
	xpNt1SotSs6PMe3JKplAuMvtP06m2I1kbtx1v8sW+LZUowetbo+MKuxMtMr7xJB65X/dlg3+eMd
	a1+QWua0tqHxYU9OkLK4bN1N/m9ZM1sHamwNNE1R7w9BaPC6fTwwjuspnxENNxeIIT2KzA7XEVI
	w02M9obI8N5kjhqD8ocpke2RFuRUgp0VWsEIj0mWK0W4FJLkrcA6jh243EmL19qwKKycLfrcnX6
	gTsOFqK+NYR+jjfhhvePBbA916k3LncY36ZUe35a8gX+y9EnN8lEwg==
X-Google-Smtp-Source: AGHT+IFSBusLtZEhcB35bdsLhsIDJKEdI0B2x6nuBuQEbHF1Ukz5MK6AfplwzfpXypgWmTNJf64szw==
X-Received: by 2002:a05:6000:2283:b0:3a4:ef2c:2e03 with SMTP id ffacd0b85a97d-3a5318a90cbmr15138062f8f.33.1749558804571;
        Tue, 10 Jun 2025 05:33:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:12 +0200
Subject: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=h//lpMqxpm+YSvksV4b6ru3A6OjJcjH0LPneHhPANFI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYOyVxQ6f3OBK/aG05w0mHNnvJLnDT+orDrz
 CyfWJIjJ4KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 ciHSEACbAaLEpy3rIEg/INTnqZRSZcKjIFtdWlKQuLFDeybOyeiSxsXh2wVCKE9HyLBM4Pe4aOe
 VeJn1Gr92epXjzFOgr9ljMI5XuvfDKiUaJ+rYkq7/Zs0doHxU2JdVUOZ56W/ksVaQRwyC8wCRBr
 1Wli4N7JwPdD4t/y88MkdyHuplV05Azu8GK/HebhanaJmAdKsKGHxR/A4RYuWfrffEarVVAQ688
 yj7fctEZEtajQVjw+qCP5GBjsONGyfRiTciEzFZk2Eo6IIQCZEYQq3wc8Gd6b/7f7x1mHHGRecY
 DySlDOvl/blSxGU/19Rk59Ji7N0jIHlFGoRdOlEfDYsyxYcQ1YGhBm/EWbwy7C7TVwwmYmhRHjQ
 6U0crUDECD+RHZf8ESHp1fzD0gQD6M87Z2n5Qqj/iXDfT7F3+/E0NCfX2MGjJEoG9D+gFkzNSqN
 ovpcvq/yrRt4BiP+N/+81NwzARAgmNtA4arZxeyh5i4OqTMZtaMMgDsKwlZxHweLeCJzeHU2c01
 Gd0uc8Rd+iWf1vbf/mnnIHTHyTaSYWwYmVxa/FJSj98NsXYkeE2f9VoTVKzBj/b4ltLuEiTBWHq
 cm2Kz0AGsiu4qJ7PmhkesDqXdEvXX8g0I9jum1a/5pvlAwYSlfyl1w9eyBKPjCur8y1vx+5atSV
 t1BHqk4gNTPA4rA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_053326_450574_B2A1BB7B 
X-CRM114-Status: GOOD (  15.14  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mm-lantiq.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 14ae257834381186faba94446ea326cb3be99ca2..897a1e004681c085217bcf295bd971f3424011b1 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -55,9 +55,9 @@ static void ltq_mm_apply(struct ltq_mm *chip)
  * @gpio:   GPIO signal number.
  * @val:    Value to be written to specified signal.
  *
- * Set the shadow value and call ltq_mm_apply.
+ * Set the shadow value and call ltq_mm_apply. Always returns 0.
  */
-static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
+static int ltq_mm_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ltq_mm *chip = gpiochip_get_data(gc);
 
@@ -66,6 +66,8 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
 	else
 		chip->shadow &= ~(1 << offset);
 	ltq_mm_apply(chip);
+
+	return 0;
 }
 
 /**
@@ -78,9 +80,7 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
  */
 static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned offset, int value)
 {
-	ltq_mm_set(gc, offset, value);
-
-	return 0;
+	return ltq_mm_set(gc, offset, value);
 }
 
 /**
@@ -111,7 +111,7 @@ static int ltq_mm_probe(struct platform_device *pdev)
 
 	chip->mmchip.gc.ngpio = 16;
 	chip->mmchip.gc.direction_output = ltq_mm_dir_out;
-	chip->mmchip.gc.set = ltq_mm_set;
+	chip->mmchip.gc.set_rv = ltq_mm_set;
 	chip->mmchip.save_regs = ltq_mm_save_regs;
 
 	/* store the shadow value if one was passed by the devicetree */

-- 
2.48.1


