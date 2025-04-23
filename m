Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D38C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFMUXD1U+4Z14AqM+HV1w8wuHug1ZmPE1i35Sl+Hm6o=; b=O1mw9YwJKfK+tbW5Mci+o0/hD1
	apKxsPTPFQo2er12xh+YBzgfn07Yb7GvYGzNXlXib572I+AV6RmYSfv5elkNF2iqQFdkp+PqcSsvq
	vu+4mnRqlBKt+EPlgBlmlSWQvMcrzHJRKUsCgliNY7JChekwdpKQe66EGAj7Q4/Az6tkcXMETV3NM
	1LR9t9RUsYC2f8QWJi5qSU3ak8+BKfRPXL2pLoUbSJUr9M7yW2Ahw4BC5eVdoPQiRaPsN7niQI1Qe
	3IdPTzTR87yoRCHjbK8Ap7lnBIXCWQFPxAGMOPqN6b2l+YjxU6Nt3HGdTKqdnMXd0ODRXAIZGkMR7
	t/7GCNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UaD-00000009Wpd-137a;
	Wed, 23 Apr 2025 07:31:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKJ-00000009TVW-2NtJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3913b539aabso3661118f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392522; x=1745997322; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFMUXD1U+4Z14AqM+HV1w8wuHug1ZmPE1i35Sl+Hm6o=;
        b=Dp2ORPn89t2kPQxJi0sPDMduKFHrdXzgewwjTFacJ/wpN+iXiwa/FgYEaSN/dm7ylO
         XM0y97/qOASj3gwgfD4fOZsbZcW16KGTqIOoUHOWwPI6dZERvfon4FXtdeNTOrG2YB4c
         KsTNDjWw00+IKmCTJ+xxy4I9udFGqAbBouGoLU7a7S7lTQIazFt4uFGvO+8cL3yTProT
         or07ouqlYw1wsZz1RS/xCFsGLxBKMSCL17h9jkodwUq3B+618WG/qvHtpqXjeF1SMAZ+
         oHqNaBSoMdkyFyuLJgZdb2a4GsZZzjVZ14/E670rgPZlO2UUf/vg9Fh9kAFLoQsX0OWl
         IR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392522; x=1745997322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFMUXD1U+4Z14AqM+HV1w8wuHug1ZmPE1i35Sl+Hm6o=;
        b=pcv+zBXM0cRwIqpMe+eKXMwbxgr/wQmzReowHio7AkdkGzgKn42fqX1USTuygEdLcr
         TrwIRloJOnOOMrXLxaniScpgBFqLpC8yyuM7DzivsblTC7qKtIAzoH6rSkguaFW/ncBG
         DDjXgkzKdhkBK74WwR5/YCiItAroyQwxu1DKL7W7OOGMIqN8ZI6fBxBs1C66wbF7kR6q
         St1vrJkIQ+COkL7fbTCRQCxP9n7rjEIMl2DywMOgRW8Wq8kVPfCym14tbt/6onvQChx6
         5ESicm17aq7o+RzYhkC6vvpNdsdXHZuzyXszcc3cg4Yxq9o4qDZQtGs1GHzKfzqu9KOQ
         3F9g==
X-Forwarded-Encrypted: i=1; AJvYcCXroROqqYP6P+EpC7+agkkiMLNffqmR5MsSZ1pFji8XpDsYNAgqJh44m59mRnvTGNEaRMHM3sV3nc5yVU0nzI+M@lists.infradead.org
X-Gm-Message-State: AOJu0YxTBYxRI5vEEBXzMfZP9SZx5C1UYbh0y+aziSEuYErDzbrx+LBk
	CJZi4FTM6i7WFOe8K19srduh5xnDv3Pl3tKMaKSWbIfJfjHO5qF+BV4lBAuM1I0=
X-Gm-Gg: ASbGncsLzBZpCZNBZFDoFoXPw6I4RUmWGntPoH9ePVfwJV0vUzgmuHFSd2cuceKinMM
	/9vYZynhmZIIvXOdoHtd+V/RkA1NQBjYwhBjUZh1lm//vXnTfMvPZa71XQe2xi6D9c+Z7pcjv5J
	+fQeKXPZKLMKzg0qy2XtOkAO9togFaI4LWYIuqamfYHUNw5tvcGUrqLxbhsbgWNRDIMr4VqlOcE
	Y3VpIcnQ6ae9onSYbw+xdLYSK8nWF/mk3gmjaNcwC7eLH5CYU4V8bqp+kuQVxM8jHrSZpj4gK8P
	zzIdLIMnBKcBRMOPyoThKNpSdDuTy0ETDg==
X-Google-Smtp-Source: AGHT+IHvsBcpeDWfBI/J2ZFwFCxrj5c1G/ZijldBOLJ+QHGBhSPa+tWadnMgTQM8cXeS6fsrFI6NKQ==
X-Received: by 2002:adf:f94a:0:b0:39f:6e9:8701 with SMTP id ffacd0b85a97d-39f06e9871dmr8041245f8f.7.1745392521822;
        Wed, 23 Apr 2025 00:15:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:07 +0200
Subject: [PATCH 05/12] gpio: it87: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yQXPOqcv3YdoDMJN26EWQWwmF6WtRyLx2iAMkZ4jR2Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOB/2C4C8bp0IytZf1fZVlthvBDEJeTwZpbU
 1xYV3YMLBeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 cvFCEACywxkvcnWQIWdFASec3Bgy1BDbBkOwECogN+Tf0BW6jjjtMhLaYlakK70ThJwbwhpvbUk
 uTcNGfW73G5dusyRfhVo8jV864P9WLKJRvPWN4fY6POTOmkYS8HuSB8y2ySIFdhkY11wIAMaWEr
 V5GFNUiFTHl5LpHdBfU/iA8u0VAq4PkvdFd2P6sC8l6QPnQK2yRAjaXgtw7l0oDscOTrwr8nkZb
 zpD3HIqIbp+4DW5XLnmZPFlpv+5GOiIJzKjY4VP38iPJltW3gFZthDg730+RrKm2dYY9dT8XMKX
 t6veqXdJwNvyWBDvwMj6jlzOMSHcoKL9EI/GN2LQnHD8K14P95f4wN6nJdjzkhIp8kY8NMvAG0M
 vGDY2MmLZFfx/viAY9H/jX5kELjO4upTXGb0HMpsMNlvPiLh9Obee+3BMN1we/axJVmGCCa5qgp
 BJTAqJAQWupVylYmsGyeIrDN6oVny1bg9T9J3BXIRKbRFeGY4wLeYXvTICsl3XDDyMyupOjltOI
 Rt9Z/iBdMS3P0O7JYIvMdF7U1hKFuabfVoQymeyQEgm5dc4F6zOt2WPSJHbUub145QgCVOorCXL
 K5zAKoQuqxCtTJYGPyTlNwNei70stMpgj1yXWSLNJ7/RNuvDZy0IHUkeqD2TGsRE6ZRsTp5vgV/
 xluig4eEUuGwCzw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001523_630135_A1F356D2 
X-CRM114-Status: GOOD (  12.99  )
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
 drivers/gpio/gpio-it87.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index f332341fd4c8..d8184b527bac 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -213,8 +213,7 @@ static int it87_gpio_direction_in(struct gpio_chip *chip, unsigned gpio_num)
 	return rc;
 }
 
-static void it87_gpio_set(struct gpio_chip *chip,
-			  unsigned gpio_num, int val)
+static int it87_gpio_set(struct gpio_chip *chip, unsigned int gpio_num, int val)
 {
 	u8 mask, curr_vals;
 	u16 reg;
@@ -228,6 +227,8 @@ static void it87_gpio_set(struct gpio_chip *chip,
 		outb(curr_vals | mask, reg);
 	else
 		outb(curr_vals & ~mask, reg);
+
+	return 0;
 }
 
 static int it87_gpio_direction_out(struct gpio_chip *chip,
@@ -249,7 +250,9 @@ static int it87_gpio_direction_out(struct gpio_chip *chip,
 	/* set the output enable bit */
 	superio_set_mask(mask, group + it87_gpio->output_base);
 
-	it87_gpio_set(chip, gpio_num, val);
+	rc = it87_gpio_set(chip, gpio_num, val);
+	if (rc)
+		goto exit;
 
 	superio_exit();
 
@@ -264,7 +267,7 @@ static const struct gpio_chip it87_template_chip = {
 	.request		= it87_gpio_request,
 	.get			= it87_gpio_get,
 	.direction_input	= it87_gpio_direction_in,
-	.set			= it87_gpio_set,
+	.set_rv			= it87_gpio_set,
 	.direction_output	= it87_gpio_direction_out,
 	.base			= -1
 };

-- 
2.45.2


