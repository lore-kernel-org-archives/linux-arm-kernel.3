Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F187CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1DoSbZfG7H4Ei1TfdvUW7X/sPaGi5bqrJwAmd5q/gRM=; b=uA4O2/wjEznzGOHAeayIp7A6HM
	DCTMqPbY+L1CyQvrpPRCIMEVIzwRIhpm+uEeYi2bdHNSGCFo/0fYvqb41LRZwYCZ5j5u/Ged1AiKu
	lHIlUDmdHjzXssKpiz4KVBxwQmNkpVtwjgTUyIeTdAhUY5MAw2t6v588NsDd5ETRB5NRqsTSRNgiB
	mK+2hp55I00zqYSf44wUTCMF4zMoAwQQcfnlL0a7Tuzw75zSeoV3KR3HwEDu8L1LL3TJ6JLgwkEYO
	KKsNz9baRxCyr5X68nR0hs7R+RX+y7sW8uOWLoLjLKc+XcWOBr6EFfvfgRjCe9zcnd+yrp3ZD/pS4
	zlAw5tkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSXnR-00000005Zsb-2QPb;
	Thu, 28 May 2026 10:17:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSXnO-00000005ZqY-16SC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 10:17:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45eebccc346so221592f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779963416; x=1780568216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1DoSbZfG7H4Ei1TfdvUW7X/sPaGi5bqrJwAmd5q/gRM=;
        b=Wv+4e8+QxCmgaujmE/5m5YtSExGCLUL4+Aw+MT8i/kb7UoJFy/4kaDpvjZiugmWYki
         00pXmopD1sWQvDDgAoMje0mA58xK1iwWtqYyyR5KyhaUHoX/4sUYly+wUqisBEY2Df24
         M6fL+iWH/t0jgp2EqmWQNdsc8PwPLN33pRg5zvFU6wI2UrwXUN+tUcgA0nJifHW2hqIt
         eHHmHwu12wlWNI96H3J6P2Ww+MsfFvCQWmftFgtHnRlLiNAw7AhpdcaH6fg9PBPcsyYY
         PJdwWlEzrAOxaez+LtWneebeUgkk9Pl6NHHRV8AZe34ttyy+3sNcsLr/b9CttzEM2S+o
         9gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779963416; x=1780568216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DoSbZfG7H4Ei1TfdvUW7X/sPaGi5bqrJwAmd5q/gRM=;
        b=E9T9hyKiVcYHD7dx6B4rXLv/Nt3MiMwEVUPXXg6S2EzT4b7o+7tKY4FdOJlUGKoi0c
         8ZdenVcGBMmzT+LjYkD8crdMiE4ERGFcwm1SgL2JTEWD8uVBj+DkMtaVRjVAJstVqoOT
         OBizzXSYdvD08GFX0serUWsfW3KN14pKxAdYCi2MTA+lXEY34o8xAhxbdcLszaUZaqcG
         xcz9j+As/kmwmVS1WmR6imJguEOWlXmSTPocEYCY8KRzst6Csen+dEAQYDyGOaw0Clr0
         9yj+vEmAfn6i9dM8jvaB6JP15dXzPJv+k3qQv0xBf+BQwB4qyrF0XOluvbFwQRA1PrTp
         7Dog==
X-Forwarded-Encrypted: i=1; AFNElJ/1Qzbt5odGJIV/9EQhKVGNBCnDjDeyBWA6n+aCmvJ0VoC2QzxI2MWy3BkYmBDp8uWcZFd+HQ7VSq03+SimQOsh@lists.infradead.org
X-Gm-Message-State: AOJu0YxQeS0wTlaJih4raGuPV1FL/JJ5bmgmE8ZKH/z/yoiGaHwUnQeb
	ZDTtmiHh3tX/s46JyxZ3Ppveo62q78DpHURRkxOvb1jX/kVRG748OQcUE0G8JFV7WDY=
X-Gm-Gg: Acq92OF1E6qk3IhDqjcfgyliKrv+OkYPZaBLfjydEPcJ10tyIAjZWv+CQVa5yy6iXYs
	JrtSlhzAuuKp4t1cKbwMusx0b8mnTseXU5v1+V5tjxevEmhynWK6IfGWJyVOwMENoGnQc2wELz/
	jp2WIaLaXw2TqHM7wl4a/3AA+/zQ82eWDZRJGDIDj0zmyoPj72WZsCwgZqmlLDRw/2gmDGQMYXq
	OENv8c0JQuWtFn4g8SPWvN7QGEQ4+2WYrmr+3sZs5CjfHc1lwad1X1y5hKifT4gkVZ/Q/aVzHzb
	nnC9v6rp1R3wA0ySBBto8Y57aVzDR0tJv83YJiG7z5JxZOaVwZDS8mnx3zCOz1i+S/o8tLKaUlX
	rN0MU73nuOY5YQabzcmAYy+xKC75Jrr2l2OafAeFqvVqALWkC2NM4Cjtv/93ExJCJjq4ZbNk7gg
	DIzsybG8UztuwcBJ48tBTvYuWI9Q+R1k3sGSKHPJ7MJ9Jh7Uv6q9U7Xv7SBDBBA1+m+KHRleeq1
	TkSyGyu8F9rphAzQCTxjbMF1Wqh1AgQy2YB
X-Received: by 2002:a05:600c:3106:b0:490:6889:1ff with SMTP id 5b1f17b1804b1-4906889025dmr231608125e9.28.1779963415894;
        Thu, 28 May 2026 03:16:55 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4908d80952asm20830595e9.1.2026.05.28.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:16:55 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	David Lechner <dlechner@baylibre.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1] iio: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 12:16:49 +0200
Message-ID: <1a45a4aade700448d7b1c702210ff147aaf21f90.1779962510.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2568; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=x4stweEjQxppyPVctumRNhEzYCy0dzoef5jpr4KI7/o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGBYRW94t166W07+K+D6+FcH6eSGvxuhaoJ2PR jJmgidiFGqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgWEQAKCRCPgPtYfRL+ TgmuB/952mpqmszKxSoYMJ8I4cWrjlwjrB7qfIwSgQaQkvnSUjb6aWlmZNN8GZo1gMcb5kwBg6K CIr/lBH/Pbw7F/J1tbO6DzhopmzjPfaU7tNxCBVzI8AhjcWIoVRQr74VA05XBWypHMwdWAfZBq8 7Bv3NpBGkBlfF9k46ASmTqbJi/Xli3p98O7afScfz6+LCv8Y4I4NiiG0uZxbPdAx4uo9/U0IEtk mOK9grOwXEJ3pNU23HedR7bDSjgo25VwZJ6FZmDNBCTeZxyuHQE0ZbYeii642Fc8Qmt9v+xKtDE 3Z4RPVUP1LmbsrUEu2CtnUGG+22YwlA/HIGTnhJ5x82D0AIO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_031658_322728_3381B0DE 
X-CRM114-Status: GOOD (  14.72  )
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

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

I recently sent a similar patch for i2c_device_id arrays. This is the
respective change for platform_device_ids.

Best regards
Uwe

 drivers/iio/adc/88pm886-gpadc.c   | 2 +-
 drivers/iio/adc/max77541-adc.c    | 2 +-
 drivers/iio/adc/sun4i-gpadc-iio.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/88pm886-gpadc.c b/drivers/iio/adc/88pm886-gpadc.c
index cffe35136685..4435f3d5e2b8 100644
--- a/drivers/iio/adc/88pm886-gpadc.c
+++ b/drivers/iio/adc/88pm886-gpadc.c
@@ -373,7 +373,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(pm886_gpadc_pm_ops,
 				 pm886_gpadc_runtime_resume, NULL);
 
 static const struct platform_device_id pm886_gpadc_id[] = {
-	{ "88pm886-gpadc" },
+	{ .name = "88pm886-gpadc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm886_gpadc_id);
diff --git a/drivers/iio/adc/max77541-adc.c b/drivers/iio/adc/max77541-adc.c
index 0aa04d143ad4..013da014bccd 100644
--- a/drivers/iio/adc/max77541-adc.c
+++ b/drivers/iio/adc/max77541-adc.c
@@ -175,7 +175,7 @@ static int max77541_adc_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77541_adc_platform_id[] = {
-	{ "max77541-adc" },
+	{ .name = "max77541-adc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77541_adc_platform_id);
diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 479115ea50bf..203459ca9907 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -679,9 +679,9 @@ static void sun4i_gpadc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id sun4i_gpadc_id[] = {
-	{ "sun4i-a10-gpadc-iio", (kernel_ulong_t)&sun4i_gpadc_data },
-	{ "sun5i-a13-gpadc-iio", (kernel_ulong_t)&sun5i_gpadc_data },
-	{ "sun6i-a31-gpadc-iio", (kernel_ulong_t)&sun6i_gpadc_data },
+	{ .name = "sun4i-a10-gpadc-iio", .driver_data = (kernel_ulong_t)&sun4i_gpadc_data },
+	{ .name = "sun5i-a13-gpadc-iio", .driver_data = (kernel_ulong_t)&sun5i_gpadc_data },
+	{ .name = "sun6i-a31-gpadc-iio", .driver_data = (kernel_ulong_t)&sun6i_gpadc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, sun4i_gpadc_id);

base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
-- 
2.47.3


