Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C5ECAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6c/pvFPyTaB2IKIW4xwQWlTQpyrmNMmH9gU68Ylyi64=; b=0gE98tOJTBD3zCBOltlRwCe26s
	U5W8NAmyaEnDGCr+EGeDvtGpDP0GUFISwn727QOM4f+Z+ARfHwrb/DPsODD8ZK1tk+1uRd2Znst01
	3Qabs9tBTmH+oPuirLcBLovF15kwvo1neVF0D+Z3PWsfg2osC7k+QQHxZX3HzsgUEWZVum66rnOfm
	HdYw3S0mbNQSv5+orIk9h+Cf0/DOqctbOzxQUstBk/8fHwxZobn1IuNTpJp4ZEApe8PB/nmUjG5QX
	VQaOupz6zHX413ARTO96jQk+AK6pLnVRiwCUFBT1unEUITQY0RC4tEdoyxgNsPkKR6qTQ39WhUirq
	JTAGt/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1g-0000000CSb2-3fCE;
	Wed, 10 Sep 2025 07:13:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF12-0000000CRcG-3Dq4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so26896325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488394; x=1758093194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6c/pvFPyTaB2IKIW4xwQWlTQpyrmNMmH9gU68Ylyi64=;
        b=JwX39JNXlMaA1M4BuS5mPiyr0r/EjNede64h0tMdr8ACn8Mec33OusoCd7ulgiDODd
         KXzjoqkUOGBySFdyqqt1oR73xv/6ljqgM3Us2KpY72iA9EUaf6XJFPbUwq6qF7qXz5+5
         byfV5YojgiX5cIYSonJv6FOggzpqL5daXY2IPwRlw2zzwEVL1dfVXFDj5snzKnxkCQO3
         lqVwmnobXDp3LQQhDzWw/V3aKhifZWrdSsNgrk2HabbxOx/qWNn6HRIK8fLCRz9eVnJE
         4YHrQ6/IFeNznpAWGpfKrcWxAAbMFmIX64edLxOhDTfktqhskb32wTCi/x3L4OwJPvfX
         WXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488394; x=1758093194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6c/pvFPyTaB2IKIW4xwQWlTQpyrmNMmH9gU68Ylyi64=;
        b=vYz9d/dGcQYf0EOj8albpdmRNZS4NJwUvYA4CO5VJYS+wMTQSGCR4rQy7Eb1WQlTkI
         PxYQAeavUfxB+6ojwSYcYjCDXRQjTAirnMMeVVzDtP5lZmXdUXwcyqLF0V9J28lSLhD/
         MVbSA5McBB8YG1ZWlKpM0+eUXDIrmQ+OWAeYlYMoBQe4hlPEjJwFMUk342Zx+aUHB8sG
         mydBPMZRCJZJFUC0rFReEjC1DbV9tOVijqoHB1LGitjEAFR1iJu+b8r1U5jh0DLb6oQv
         pAkFUmx+E8yygM6LA4sxM+5S2pEYXJrAQ60u7MgFi5lg+DZDlTf3Gyc9CsyZkk0X+HJX
         OxHA==
X-Forwarded-Encrypted: i=1; AJvYcCWOJ4N78Xc7HqvnEuztcat7Y95TEU1sbf4swJPBJge+eL59fvwEuR/x2LJ32Vpdws7y/KQXe6lM4FGt1jtFiCeo@lists.infradead.org
X-Gm-Message-State: AOJu0YznLyEd9Vro+ZU0yLHDgK8gYcmQTQwNzDFpDHuq5g0sj6Uiph12
	VmmL5xZbVRG0cbXJM+qr14NhXacwQfbB0eYkYFcmWaKkQJc+3ex2wUKrCZGOdU0feUg=
X-Gm-Gg: ASbGncu30qIQ+SbSUIjPonzl+T/+3lmK3oHQ2MF4jTFVZqa2DF4KaiVOOvLjNB9Bmal
	GLw43Mxam3odWQl7KIm/xSBDyjXItaPLHHr7YGw5fYNkUXpOoqQtxJByxFWSXTNFR/1Nol2Cp9I
	H3Bl8n3K7MYLiljmi5hbCQLTjlDph75jg6L06nYtI61QQl8QLwxGYSODuVchaVqFoJbNzFWt+ot
	qb4Uk7GnI9Xx/e3eYBpT2vcDMLwtLgquedJktHAPlsplF7QGQkpMt+vfPmAcz0ptvrnycbBS+g7
	a46ZQmXHXkLy5hCYJnAsqegC11ly5z09277G5YgF7TNcCC/HgI/PZ/CxOdpXN9v6ycWRZ0ozkP9
	c4qdYzvo+va987pTsRZRB9nmH+d4=
X-Google-Smtp-Source: AGHT+IE8/2TOR5e5wBjK6bwnPnGoPFsiXC2aKo6sThqo4Y4RFbUV5dbrmcgYl3+7QyN1qmp1C0uHGQ==
X-Received: by 2002:a05:600c:4ed4:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-45debe22055mr75199565e9.31.1757488394170;
        Wed, 10 Sep 2025 00:13:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:46 +0200
Subject: [PATCH v2 10/15] gpio: menz127: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-10-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3350;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2qJwbWHnGxbd4mos2wZZqovvMW1o0Hu1zLY8DCz5XAk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTuC53hX0ok/Q7bV2FUvI7TGC0rpB5vDWeq2
 RyfDFLq142JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7gAKCRARpy6gFHHX
 clYxEAC3ZY6fYBuRFCcSFDyDskUwOZE2MX3YsufyWILM87g5ZR3/HcyQuHHqj2HQFbM3B2aD4z7
 jETazyJnFEwuK1Zu59qO4JN7NLxyh3p7swxsZUu/xaV+5rChm5DXPX/03l0TLe/OJuAKFrkzr8j
 6NuiO3U9+ljhbhkDSUWl5M2/KiYgR42isjnUCZHWhMzP141dBJBbZRcFqr2tINv4gU1GEaoToBT
 8bkmOtJ7gdezWtPlueZEjvVSpkR2RKQAVDkAACExtQ21X1tfW7Zc0BQBtXZqZqt7FsTDa744Vg3
 +0Zp7WiRMFTYfxEbByqHZShEUpFduKiMbYkzt7NmeRUhUAkmfPThvj0XT7jQWbS/mG8guHkYhCr
 UfQg5zgkbn8fKImUSFJDGis5nQB6LfJ8CybqlZXIHoLKXuG/HNXp4+xCrWu2skxu/9zavbYsFw7
 E3iscHrsHoZVdNbHTykbwgKr7DVBP4ROjyAcp+DVLSnu3hWkINY3udREpTVRHeNH86FfPQ919ou
 I8Gy+JRIXXHqNRWUMbnxsFcA5UU0ZptqQqHZDbck1gSaFtdpdrhJNUX9f2sQHWOs0PbodXHmx4L
 Zf7wbpgGa7xfMSQe7NcXrNOYi9hGxAUu6aCxSUoy+YMY5G5l/S/GmthMZn6ZPoIyy/XkJ6wLWdH
 f7j8pv/nNptmfUQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001317_001934_3B4D6251 
X-CRM114-Status: GOOD (  15.84  )
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-menz127.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index ebe5da4933bce730c70f83c1c0f86fc4a4cc9906..da2bf9381cc43cd489f6a8593636bbbc95ab5660 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -12,6 +12,7 @@
 #include <linux/mcb.h>
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #define MEN_Z127_CTRL	0x00
 #define MEN_Z127_PSR	0x04
@@ -30,7 +31,7 @@
 					 (db <= MEN_Z127_DB_MAX_US))
 
 struct men_z127_gpio {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *reg_base;
 	struct resource *mem;
 };
@@ -64,7 +65,7 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 		debounce /= 50;
 	}
 
-	raw_spin_lock(&gc->bgpio_lock);
+	guard(gpio_generic_lock)(&priv->chip);
 
 	db_en = readl(priv->reg_base + MEN_Z127_DBER);
 
@@ -79,8 +80,6 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 	writel(db_en, priv->reg_base + MEN_Z127_DBER);
 	writel(db_cnt, priv->reg_base + GPIO_TO_DBCNT_REG(gpio));
 
-	raw_spin_unlock(&gc->bgpio_lock);
-
 	return 0;
 }
 
@@ -91,7 +90,8 @@ static int men_z127_set_single_ended(struct gpio_chip *gc,
 	struct men_z127_gpio *priv = gpiochip_get_data(gc);
 	u32 od_en;
 
-	raw_spin_lock(&gc->bgpio_lock);
+	guard(gpio_generic_lock)(&priv->chip);
+
 	od_en = readl(priv->reg_base + MEN_Z127_ODER);
 
 	if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
@@ -101,7 +101,6 @@ static int men_z127_set_single_ended(struct gpio_chip *gc,
 		od_en &= ~BIT(offset);
 
 	writel(od_en, priv->reg_base + MEN_Z127_ODER);
-	raw_spin_unlock(&gc->bgpio_lock);
 
 	return 0;
 }
@@ -137,6 +136,7 @@ static void men_z127_release_mem(void *data)
 static int men_z127_probe(struct mcb_device *mdev,
 			  const struct mcb_device_id *id)
 {
+	struct gpio_generic_chip_config config;
 	struct men_z127_gpio *men_z127_gpio;
 	struct device *dev = &mdev->dev;
 	int ret;
@@ -163,18 +163,21 @@ static int men_z127_probe(struct mcb_device *mdev,
 
 	mcb_set_drvdata(mdev, men_z127_gpio);
 
-	ret = bgpio_init(&men_z127_gpio->gc, &mdev->dev, 4,
-			 men_z127_gpio->reg_base + MEN_Z127_PSR,
-			 men_z127_gpio->reg_base + MEN_Z127_CTRL,
-			 NULL,
-			 men_z127_gpio->reg_base + MEN_Z127_GPIODR,
-			 NULL, 0);
+	config = (struct gpio_generic_chip_config) {
+		.dev = &mdev->dev,
+		.sz = 4,
+		.dat = men_z127_gpio->reg_base + MEN_Z127_PSR,
+		.set = men_z127_gpio->reg_base + MEN_Z127_CTRL,
+		.dirout = men_z127_gpio->reg_base + MEN_Z127_GPIODR,
+	};
+
+	ret = gpio_generic_chip_init(&men_z127_gpio->chip, &config);
 	if (ret)
 		return ret;
 
-	men_z127_gpio->gc.set_config = men_z127_set_config;
+	men_z127_gpio->chip.gc.set_config = men_z127_set_config;
 
-	ret = devm_gpiochip_add_data(dev, &men_z127_gpio->gc, men_z127_gpio);
+	ret = devm_gpiochip_add_data(dev, &men_z127_gpio->chip.gc, men_z127_gpio);
 	if (ret)
 		return dev_err_probe(dev, ret,
 			"failed to register MEN 16Z127 GPIO controller");

-- 
2.48.1


