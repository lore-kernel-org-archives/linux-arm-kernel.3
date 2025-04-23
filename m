Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556F4C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0bNDTv+LkOZiuFXKOWgCql95LZI/mk8z3mrtaxkHEY=; b=EjeIfa4KMapf/hrFUuki8h8ttc
	TisX5F3hoQKz6IhFy3r4mBUC3f2EVntveb548CzG6T9qQlH1K8/Upj8IjSIuNnOAgmauXdDr6fJY6
	8RUpbXEmhfhrMPS7OX4W6LRy1KvT47g+Gk44Y2ktOygrT9d0dDRzqyDmMpZuaui6chhxuSbvsxvBh
	shVZ7skoNiZxRbuhW00wC7VM7ND2cwt3SL+vAzyc2UGrhSQZXRzdR0E4/JKykwKg9fMOZRdARn6zP
	AFpO5+c+B6nRgpnhJB+mjL1zy/feR6ufAP7Br2q2OlLGVChDp8JcIMXrHiHKOfmDv7Asncg3o9Qj3
	oFSulogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7USJ-00000009VCt-0pDA;
	Wed, 23 Apr 2025 07:23:39 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKF-00000009TT6-1Pdz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39d83782ef6so419600f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392517; x=1745997317; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0bNDTv+LkOZiuFXKOWgCql95LZI/mk8z3mrtaxkHEY=;
        b=vpCK3sAJSq2mrmenbSYe5lqY7Tfc6tF23arrrSAKc6M5WAvECmEhXvCvVq5d3x8XlI
         ME7/CzeKXRq6JPwKOnCUoQq09te5QDwTVJaG7CtIxU8VqP/UG5h1a/9LeNSgg5O722HQ
         ZF3E3jHaJW6LftKY9X9fgfCj1NFiha/Fmd5t1lrQ75sjXieHEiJ1kRRgphm7a3ma2H5k
         8AiAyUYFp55HsAeD1YK+U8Kirx/+5eHLvCx2yzSs/7MJSXYA0+LAC+iJJYYm7ElyltEf
         hLcnLjh+8I0bXzuwr8YfbbcvnHPAM91aP6GyGOTR2gek8N0RO+wd1HdjuJo4tn8oVghQ
         Hypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392517; x=1745997317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0bNDTv+LkOZiuFXKOWgCql95LZI/mk8z3mrtaxkHEY=;
        b=N/M5TIny2eaTSLvdGDLfddrzI+55MKb/RQHzP63/Cm2iOq2zmNgIuH/62BOYSVDnAv
         9Ds7uKnSH+awDI3iTFNe5arKfpUhhqxBVWYvyJo8AGisDpLSlLrqNzqa5dUWbrGPOPMi
         s3uhmX3rkCet8nsuw/Mjye8R3JFrYW6mL+N5VGubr+y+ko1jkpVOVbwxaF8sbWasDeHH
         IFI1jgDgWGE+rNTHftHZf7Tg4QIiRw6dkHPhbnoo+GYqeu4XWMwuRYc1zmQ8S5AZc98m
         zu+cE38j4YuqomyCiewN1ztSaGy6+2SsHmI44RcTwL6U6C53KAUOsplD02srRQjjnuPA
         GCVw==
X-Forwarded-Encrypted: i=1; AJvYcCWBIvQk/yIiqHeFQVln1Yln3GReidpGvq56OWRsvSYzwYnAco96vpc96LyVXQKndCJueA7/deP+vadQ9fDaMmag@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpm8xN9Fr1Z8GniaozbneBZYsrSmNjAvBwUj8UAFO8/u7vyqU0
	Gj4JmBKRTtGatBl04hBripzkN6/6kAA8clKzLhNogdseJuKzpn2N2k7J5kidn5o=
X-Gm-Gg: ASbGnctFdgARVooAHyUgQYdnrswfHv/TeRwgW1Gd9hZxkYn59x8vqaM2r2nY/5ElmFo
	ZGdyHgIQd5u7iPKSuHwFOwNWEbiJ7NkAWW6IDrKHY7Z4XuR/zb9gp4+3ZNiFZvcbRxpyebborfI
	CPzFGxkxiFSohw3S3Pxx7J6rBwSAIX1NPMtJ3NkAJBF2xNzSl7EYDQPdCYxE36PWS2X7as+b99a
	L/4ckLXZproX4AGKCqNXzHfNgKgXd5Bs5wJHJ6cgD8+toaehT14uYMQ/r18F6DWohw+YVH4yTqJ
	U+Ompqxby4mg4YC2TZHlwtbYfXXM0SozQQ==
X-Google-Smtp-Source: AGHT+IH9m7S47Z/jCJ7Q3TFpGFMrRhaPorWIcAZkoI6/0ohfBThJXsrLnX1OsA7yjjcCF0WIrr4Zhg==
X-Received: by 2002:a05:6000:1a8e:b0:39f:d0a:5b23 with SMTP id ffacd0b85a97d-3a067243e1emr1216191f8f.17.1745392517460;
        Wed, 23 Apr 2025 00:15:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:03 +0200
Subject: [PATCH 01/12] gpio: imx-scu: don't check the GPIO range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-1-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sDwXikOtbtT66flaRPMOQLEk1wgtXlmWPUc5xrs2aGM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOAJtVfy51LcVaIdW/Da1I0wLQ4NQEa0Ef9t
 G5TUun9q2KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgAAKCRARpy6gFHHX
 cle/EACTYLfKBloBbJL+EzHJRUixJm8o1vusIAehFajv6F5jqFGdV1ieqz/FHdEKoul2HSfpboN
 B/VwA/JclRFH+9K71ISjvlxdHUOXVWAeC79M8RCXb2sjR1SL484Vi7SATqK1heYF6HyqgLi5DU9
 x5I+yC8SJhMmPkzCqsxF+6jMOZJamDy7JMJpu+6scjGlhAJRpx+mtulebQRcP1MzXS1vxOzfwQh
 3HSHO5/1pxJBi8sKMdmSJC0CWJkNWvPbFdcU9QHZTd4QgQjKnmLXo+vSp1zDwt8ZKveMOMkEfuw
 tXCYwfV6yDWn6AzenUdyisI7KrqI7jPLO573nh25LJpw/XODieasvx10z4wEKC4Kxru84R27Rko
 4cxtTyxZ2PaXsKERURrnq573AU1Utt1jpkAazgPp7UCOqwJ4hKBWEz21qTP1Mz+EqupY8X/pgC/
 4vGCUNQ3VMb9eo4dDzS9X0LPH8yzcpC9or77pBIvatjwyn86D/o3wFctdvh+vFuZVDMyA3/MSPH
 /0vY5IpKOzCtFt4Ba2qHVQ4SnprInqtEYD0kNt3RnB12yFauaAuFcMXTTGlAyheOUDHN68AAIn8
 tSoCKbhVVSrrbS2ctGybfv148pl38wC/byXGntzu5EwOvAca2IlqfIyzzJoMBEBZYlA0yeDQhpi
 DDM1nncdH9HwCPw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001519_409579_40145B3A 
X-CRM114-Status: GOOD (  10.46  )
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

Core GPIO code already does this for drivers, no need to duplicate the
check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 13baf465aedf..403d03f18122 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -37,9 +37,6 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	int level;
 	int err;
 
-	if (offset >= chip->ngpio)
-		return -EINVAL;
-
 	mutex_lock(&priv->lock);
 
 	/* to read PIN state via scu api */
@@ -60,9 +57,6 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
 
-	if (offset >= chip->ngpio)
-		return;
-
 	mutex_lock(&priv->lock);
 
 	/* to set PIN output level via scu api */
@@ -77,9 +71,6 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 
 static int imx_scu_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	if (offset >= chip->ngpio)
-		return -EINVAL;
-
 	return GPIO_LINE_DIRECTION_OUT;
 }
 

-- 
2.45.2


