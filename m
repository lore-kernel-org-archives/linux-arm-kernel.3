Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA639F3ED5C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 19:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGIk18dSjHKSjMBfr2zRSzrPhhMb1Wy+tDs49j3GVxc=; b=KAbTFnkZJEHsTgNvYecCGt8Wg+
	5nud6XwJrhFhTQoxKwQ7FOLh6+OJFU8ei99oUGd0dBpv4kQ1sUHhBE6sTC7XjJ7NaPViBQMYFdJ4H
	nl67LHL+btccZ7YExv8aHpuGyAhG1D/HLAuBxN/d/ds5dQAhQpbpoP/SFO6ZVyjFvZl2TsIAd2j6b
	5dPEF/P5du7ze9Nj6uQK4yyKJjdMlPL7IZydlXiNOEKYBmttQF+HiRHPTwyY5yA02HQOBRXvVoQrz
	r6x5bigN2BehGhSqOiLUcHwHTbDGUqMLrBp/YyR23/GZg5aMDbqqAMIm1lMnVpqbbr/PO9aZJ8ekx
	EykyjUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBdcM-0000000DjGF-1tlx;
	Sat, 11 Apr 2026 19:03:42 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBdcJ-0000000DjFm-2brj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 19:03:40 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82cd6614a90so1492834b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775934219; x=1776539019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGIk18dSjHKSjMBfr2zRSzrPhhMb1Wy+tDs49j3GVxc=;
        b=PY+2ncEVJVbkSafBmU/VcTCV3KMyOT7TJoGRWtud1HMFwabvJ2xqzurjOY8x2dYF15
         1eg9WC3toeoS4xQkdrVWXZONkh+E7PEGOHZ+kH+R4wuRz9Nb2DLDexNr0cre6j+3TeQW
         lMy5NDJfnARKz3fNctubRhsB3LgXBmm0sxvlAaZjZKpL4FPGf4Cs6DSeBNqGwyNySSRj
         Fed+0lc1bxGwrEKpOJgtl8kw6McxNf+YxTs4BmihGBZbMge2phNP95/JwGmWpzXyjoXB
         VbT3yQlVn2fn8mDNrdADZxZ4fCsn/iG4wFa6HoysLDYYJ/boNbxfvnFsk2ttVOTb4e+S
         heyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775934219; x=1776539019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tGIk18dSjHKSjMBfr2zRSzrPhhMb1Wy+tDs49j3GVxc=;
        b=YAAVbhO40DHXMlfhoqqVAzMJpXCSKkLtddQFEspGaFTS7o51ZRzwtptw3CHDDJZWMB
         i4Hu6+zhLJf0I/oMVj3dZaD+RbdGrptGcbVpBka2vvwR1gdbC+SCqkZ8RSsNbCZxjXy9
         /ny3skJBTmNQYwmof7bFGOoQz4ryMGnAgu8m49ZphLk9KpWBrl4pN+DCr/KIOyAFuve+
         UqOIGVEstHkGmnrnApMCbFgZzqOZxbA26nS64fGkMtl0LA0hnyDaBNayV7quR3ZRT71A
         k36S20z4R0Cb/FbqVQdEE9KlgACVnRmcFaKF204IPmtP0CnnXGBR9yE6py/VNzihtuts
         bzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXywPpXZEKLLffTKDV5Dcj8vUdU6R26p6ZsAdWG9Mv8CWeIvCiXnG8hSUK//4PnHuHR9xdJOKraF66en0HM6KYq@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp4E/wgZ1JQKZSdaiATL0/vO2fLgqTWSV1z2S4M1rV3VLGYOtP
	kpPpy4FebOlZZE+4Mhskv44V3ye6eyiJLMhMyP+JGy/oANhndOE2oaRN
X-Gm-Gg: AeBDievihZb4/91IdJFwfX5DrzPatfE5t+8QKNeYOirCxCYvLbtEKKRdTYhnRvOQOrO
	LrMx0TaAWANet3/H/pMAy7DEiqz0nxT1eZOzlOXCShJuobEEpfB5IvG4h4sFyDr/g6jo/Ajq4wp
	Z9ijokILgqL0KzNmyG4GgKtMsoE6Oel7Jn46e7rSoc9JLNQXYSn7b/yTrD5PomgjU6CZh6fUiXk
	0/FNA8YTb2gifFGxnFDFlySy+wMEAl5YqHOfmiDXcw7qK+6rhlLQe1KlH6ai2MMXXovZRyTBl5g
	KNuDCtCTK+1t35+2qze3srzYBjxHTILxOnTVJ6s+BRO9mP/ZmLL5Obe2HXyrokJHZsEBAvvgZUd
	kJj67rvnQ6cGySJmuvyX/czq5KKyDWCCIeLS3tOP9it/z/F8M809/ZN6yMrcPwNO5Dj7RYGn10Z
	75HLcDqBBovMxfHUlTmD+HsOkF+uORG+pedF2fJrabIZZM0wcOPYYBjfYk0YzR5KMtpzgf4nN+R
	HI5b5bgEQ2rYQtx1zzb
X-Received: by 2002:a05:6a00:4507:b0:82f:120:fd6f with SMTP id d2e1a72fcca58-82f0c0faafemr7383565b3a.0.1775934218598;
        Sat, 11 Apr 2026 12:03:38 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c338dafsm7058962b3a.17.2026.04.11.12.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 12:03:38 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 12 Apr 2026 03:03:04 +0800
Subject: [PATCH 2/2] thermal/drivers/imxl:Fix runtime PM handling on early
 returns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-imx-v1-2-cc3b45d63811@gmail.com>
References: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
In-Reply-To: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775934187; l=1725;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=6RaDDsGnWQW8DuDWURtJZzjEsjLR60hKYlROb26NIUM=;
 b=4BLCl7id57T/9qyuxB+Ons1cJ9eYH6GtrniSvJYEyQhYBOSdzQdtJxj+AGj/GX768L8KTU3Jk
 6v7hShaEIfWAOZx3KDCW/X/UvqA2JHhNFWhD2XBRFeFw7gejFAC9ZC/
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_120339_667748_502DE606 
X-CRM114-Status: GOOD (  11.88  )
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

Use PM_RUNTIME_ACQUIRE() in imx_get_temp() and imx_set_trip_temp() so
runtime PM references are released correctly even when the functions
return early on errors.

Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/thermal/imx_thermal.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 68f9ce41a670..9d9ae7871068 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -260,8 +260,9 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 	u32 val;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(data->dev);
-	if (ret < 0)
+	PM_RUNTIME_ACQUIRE(data->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
 		return ret;
 
 	regmap_read(map, soc_data->temp_data, &val);
@@ -302,8 +303,6 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 		enable_irq(data->irq);
 	}
 
-	pm_runtime_put(data->dev);
-
 	return 0;
 }
 
@@ -337,8 +336,9 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz,
 	struct imx_thermal_data *data = thermal_zone_device_priv(tz);
 	int ret;
 
-	ret = pm_runtime_resume_and_get(data->dev);
-	if (ret < 0)
+	PM_RUNTIME_ACQUIRE(data->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
 		return ret;
 
 	/* do not allow passive to be set higher than critical */
@@ -348,8 +348,6 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz,
 	imx_set_alarm_temp(data, temp);
 	trips[IMX_TRIP_PASSIVE].temperature = temp;
 
-	pm_runtime_put(data->dev);
-
 	return 0;
 }
 

-- 
2.43.0


