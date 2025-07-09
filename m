Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2231C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYXzAgR/QsucPPbY1ptN+8QS9bw6Y723FyD/WGEX0Vc=; b=c7dixg11v5A8UBMBkVlpQxSYzc
	2Mu/nCFadbEia8cF/tnALjuAtcqsasUaWWT9l6ayzlAEMhbrTLzwp0btCWVGGQoN0/NrwfM+EixkE
	BJ5fDXKD6W1nWgfOBeJFPTDRYJ9iYWuypyNBrOT1sgJN2/uaYjRIGA4jOIr88jy+IX+Ai92V52GSz
	d7eI5+QLidOMw1w4w9iK5QpiGxLOjrBNTj0QbQCd1lh1Pjm2HcHGpBVZMI2Dvs2LkwnaCbyRj2Yln
	itYtbgdlb+lLRbrp3uOLXElWpq2H7u+mkDVgRhc8ye6Czqm0QkjRP2R19aJTvKLRvcLOARxQXxqLg
	HS8leCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP8i-00000007nlL-0Cr9;
	Wed, 09 Jul 2025 07:22:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVk-00000007hCL-04Hs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so31067715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043350; x=1752648150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYXzAgR/QsucPPbY1ptN+8QS9bw6Y723FyD/WGEX0Vc=;
        b=MwG6mr7Z3nBhnePwWlkz2QCqXWqp45hK2VV6xCI5yJo77HEvnL2KiBR82bTtL5GX7q
         cTV31HuvWUYLYZIvqmo6s+SqPYP0V8JLb6aYKLVO4IujDOAOQ7K0tNfgtk44xoC21AZC
         U3vBW1ld+EePxtOCTxN78juU4BLEWuN/YFDDBIkSbP6t3k2uiDDCRxz5kBw99RuxmhZz
         7ofUfWP0jU8Nfi7gjxEnQonx1YD43e8t+8z0JOY02JHMXbK8b/Qdq0S/1I37Qwjo+JAJ
         gBzvV5DbKAeZA47yGYar/X8hDbOCUDJhXqJMpwwBwlyviyj2L+9VaRKolU/tXiqhxiSU
         H9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043350; x=1752648150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYXzAgR/QsucPPbY1ptN+8QS9bw6Y723FyD/WGEX0Vc=;
        b=fq5lTnLtjw4ok/np817BUcNvBUbt5/5t6dLUI+0vouip8PHHZqWHp4F1PskiPQ3sqi
         SLczBuH+CgV6dQDS/OKRAJAJzHzQBYA9dFObyMx7i+6wO6E+xU0gFt5r5VBQDzweV/O1
         Xk7Vs7qQ7hHp0/AbNCbrrSh4J+bjeP859xJ3t63iX2hGxuqaC1Qgz0bl+Pdx2u7u0jGa
         E6wWSNMAFc+EmphAsnv8yTyjBbEPyat7STQzY6OPYGMcOCGQjAxgWo6pBwS5J1M1hZrr
         KM42Fi+RqrJj1F/ICcMsqZqxivxaokTjfCcfZa/A8i5ND3rwlNV9GmspooUaP2qctUvj
         sUmg==
X-Forwarded-Encrypted: i=1; AJvYcCVWe5F0ixfU7Op4ONKiYgmNPwmvBS24tGvVARRJx3PvSLhvZZ0uQUCj+PKhOFlIzqsl1qEwImh13COF86knO5Gb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfi9LN73fnND037nxVwjshua0D8rn/PRt+oR5Nt6RnxddvkPQr
	s5y4zlvRnq0wzqD0fsse5DVAhPnz83ycznqg2/DWuEMP+vdMR2Nj0W/kHMssKxAtauQ=
X-Gm-Gg: ASbGncteZIAGsQ9btmrtH9FWL+1x+XPEhwCUNQ393lejVfEGkM9J1GQB70rSCrphQZJ
	XP4/JX5WRJNjHeikwhz0Br4toDk3fenv3THMLIRyG3btXY/b7e5mggy8SIFky8nMglv1Io2h27t
	mzQHXqSskB4uFv6KmoPqKMNlHfr9ixjiqCqKpIXZf7/3Ci79LH7yjOa96LixXpSI/Ikd/qgUrYp
	gdjdebIAUXuwB+Drs0yBUzSEKOrtNy6S+/WTNWv5Jplr4BB804w9SM4q+4NYz1eP5f1HPeE789S
	fNUP3LBdMIzacpeVrvdrZfP8MXY3wX4SW5qnYaslisymel9QE1/gbl+c
X-Google-Smtp-Source: AGHT+IHj+s/VBrAvrguJEGL092/FlNxW8s0VoNwIzQuaD8vmjFv21VYppz9JisncrQZ/PhZ/Kj5qew==
X-Received: by 2002:a05:600c:3e14:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-454d539ae4dmr8311655e9.22.1752043350479;
        Tue, 08 Jul 2025 23:42:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:50 +0200
Subject: [PATCH 13/19] gpio: xra1403: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-13-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=p+d5WgTnWs1VIynPaJSr2B/ELmhJiS6sSBvx1VfH3LE=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhuD0Oh/HloFhHS73yJ325WaqTvQX/AGUbo1nsFHnvTfiIDJ
 okCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJobg9DAAoJEBGnLqAUcddyn6MP+gKa
 0+icq0YpvqrQlI4V5dVyb+qmZYKcVGLeTkKKTfv1XQDeLi+ty+D/XCF6RmQ8pUI0DpwGPz4FlFi
 eZGsCO3LtRxF5gNLsA40qk2QMYStsYx6SI83lV7it6aqyqIDIRi4eap4wQQFjfIae0K8y7PjeMu
 iLbcdAMd97aYeCge89v90bFZDovETU9k9iYPGdnjLjU3lr6OsT7Lrh/+wPlwRm6bL4eyIK/qXO/
 G8Nt9Lp2CZ92AewjbjSMzSXfTDzAl+hZn8sGks6XsDYSPpCtWofFpm+ZEhtB2eCkyrCmhHA2Ej+
 KyOV3CrXBCLXfUI9wEbqwAOs5GhdHLz8DtJb+jAIWJ+EGuJcqssxPR/CklDNi6Xx4AcT9OhHvx3
 UuxbP8wV3kWAGKmP5WtA67Gdn6P8hyrLsisXZ3zlSEZhmq9zroo1IpJrIq431cFztrZi6tUte+V
 tFbMvGx2vHnyNx+p+6XkwKlLIAeJlQtM6v7/Zy41z2Rhbp4a33TZFDOEbBSZULUVYOQdG63LNM6
 SGbBqqweY2HNv07muZGVvULV0Ix7KRZklKGtNSjPwoLTB/nTaoOYQ4GMKcjWxRgd+bqDiXDsU4G
 tQHkQS9WCONID3ZY4eW/gKdqdZ3n53Wrt/HlYLQSUDdO2HscxlcDqJp9+MEfwIbpLvxUEdiiug4
 wXszr
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234232_073891_FC52545C 
X-CRM114-Status: GOOD (  12.12  )
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
 drivers/gpio/gpio-xra1403.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index 842cf875bb92036616adc63748dda85c47af544c..70402c6b540739b73170988d03ad592b5d55c153 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -102,16 +102,13 @@ static int xra1403_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset % 8));
 }
 
-static void xra1403_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int xra1403_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
-	int ret;
 	struct xra1403 *xra = gpiochip_get_data(chip);
 
-	ret = regmap_update_bits(xra->regmap, to_reg(XRA_OCR, offset),
-			BIT(offset % 8), value ? BIT(offset % 8) : 0);
-	if (ret)
-		dev_err(chip->parent, "Failed to set pin: %d, ret: %d\n",
-				offset, ret);
+	return regmap_update_bits(xra->regmap, to_reg(XRA_OCR, offset),
+				  BIT(offset % 8),
+				  value ? BIT(offset % 8) : 0);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -167,7 +164,7 @@ static int xra1403_probe(struct spi_device *spi)
 	xra->chip.direction_output = xra1403_direction_output;
 	xra->chip.get_direction = xra1403_get_direction;
 	xra->chip.get = xra1403_get;
-	xra->chip.set = xra1403_set;
+	xra->chip.set_rv = xra1403_set;
 
 	xra->chip.dbg_show = xra1403_dbg_show;
 

-- 
2.48.1


