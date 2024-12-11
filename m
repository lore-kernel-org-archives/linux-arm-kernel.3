Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD568E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoYTxKIN+xa5B1OH/ejn5xfQpSaxCFnsi2/bPSTrz2Y=; b=Wp9MNd1oDb4hOBKhabXFk/JXxz
	p7+n41Kik4YncBwgGhj6QF1BepfOguh/6ZwuLipPXxAy0DozD+tcjQWe3is0O8RgOb/CY1eqYeeYP
	/82qNm/WRIZ2yySCRPeNXQ5mleT4EcQaKD7Aqgge2TGrij0fw26YDDNOHxH4wAc5IjWZnFa2etHjc
	xGWtvgXgJns1nHM31cX6yVZa7YlsXjriSi8zH++u1EKBnM7Hd14ZiyMvDnrET9SvB8EhjpbXC12Ia
	WYOmWYorYCbcC+CEhaqlqVlQH4CdGYIgdXK7qRxkeCC3Wfr6nHEPWFpC+2cZ9KwBgpQQ9PsOVbuxu
	Ctg3aTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLK0b-0000000EaJc-15zb;
	Wed, 11 Dec 2024 10:31:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJsk-0000000EZD9-2ioh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:23:51 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-434f80457a4so2855835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 02:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733912628; x=1734517428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoYTxKIN+xa5B1OH/ejn5xfQpSaxCFnsi2/bPSTrz2Y=;
        b=E3okqYcQNllK1Vu2pK5NbTrvJ5MCgb3LiXnbe4PL0FB7Z8RDsmVvNNghdeLxEJrYel
         L+oLj9M2mHJl3OgMPHqCueGS96SR2II7KM1LyoG0EM2uCV11LGj7meqQ0RWI8QZxnxHa
         aHRSDlj85FbAoGttAWouYsfxSTRpJKTg7h1XL61Q+3KI/9trbF0QUqthYnQlvvyVh+0/
         gBwnyhTTmIVeioHw7+0t4ZGUsmT1YGhC+Bd00yNTif79hprdAXGrxSYHjjRdw+er+7Y/
         3u9qJgnGBoq/H48xKx4fvcDa9BbEBHvFnWPlQeQUfkFd2ezpcXvfNfeOphLnbrTRh9sH
         V3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912628; x=1734517428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoYTxKIN+xa5B1OH/ejn5xfQpSaxCFnsi2/bPSTrz2Y=;
        b=jGKIKbVJvjsmmw9m5k6n2lo/g6mxSCh+xSxnzHajTNISzxnCP62oP7s2nr4/4GMCMB
         J0Vg8G17BcPGH82NeXZirCsiVDTCDXr2lS3p3wM81js0JL9FX8Ok/Zl+lO3hcb+8k1UL
         R+qz9Lqmaf8j3Jy866s8jidRneGHU+27/PH4thiL67CxYb4rH5E5n7R5jXTFQMuBym8p
         orFcjhK8vD+zzmcA/lYA/yZN0Jur39ibwwlI+1QuGyU5N2fr3eJHpnhXvI2RqrDb1PZn
         sH749chzVpm2a6bpDkQtJb6Kpb9AEHYTqrQKCGmq4vthC9c8D+sArrq85UAOxMqZVFBZ
         2d3w==
X-Gm-Message-State: AOJu0YxD9y+ruVPRjnr3gdCpkMeLmRkkpnyx3pohvDaQ6ATTjYwgpQTL
	U2kKjUegdFN5oy+CajOIcX04nEhDbPW8Iffj3K4cJ6eH+yccXA3tq6QDZedDbbaxOqII+/NEOK+
	6
X-Gm-Gg: ASbGncuyb2ecK0wHUGozUfOMkDnRNbruLP2BKiaJLrz0dAhqBhLA4SXYY8GQYDmMwnY
	2XvILhwDw4+iLjd0HRRfhy42NUtsQ8mcQIcI71LOSGMMWznlUzwbbTV11zX8RxRHXBznj4772B1
	KGdeeKGO7hXK1k7lptvxm9hS0ONfuCvwaELmVrnPngu960QvEvdEC4fcqfy4b7le+wkrKV0v9yO
	LiNI7MeWu/o8po3kwOgSJCMpz7DAaax5Uw1nlFjtyczYm4P9smY5A==
X-Google-Smtp-Source: AGHT+IFbH76aSaMWfUWSLsltMf1aj67sgeQOV+1fX/o5OmT9HfAeHOm6psOWA85iumCSEI4DBs/c8Q==
X-Received: by 2002:a05:600c:1511:b0:434:9ce6:3ec with SMTP id 5b1f17b1804b1-4361c5b1b37mr13444565e9.7.1733912628390;
        Wed, 11 Dec 2024 02:23:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d1b3:c106:bf71:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514da2sm935137f8f.66.2024.12.11.02.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 02:23:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/3] i2c: davinci: use generic device property accessors
Date: Wed, 11 Dec 2024 11:23:37 +0100
Message-ID: <20241211102337.37956-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211102337.37956-1-brgl@bgdev.pl>
References: <20241211102337.37956-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_022350_684755_56AF5F11 
X-CRM114-Status: GOOD (  12.83  )
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

Don't use generic OF APIs if the generic device-level ones will do.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/i2c/busses/i2c-davinci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index bab9f785eeec..6a909d339681 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -23,9 +23,9 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 
@@ -173,7 +173,6 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	u32 clkh;
 	u32 clkl;
 	u32 input_clock = clk_get_rate(dev->clk);
-	struct device_node *of_node = dev->dev->of_node;
 
 	/* NOTE: I2C Clock divider programming info
 	 * As per I2C specs the following formulas provide prescaler
@@ -207,7 +206,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 		psc++;	/* better to run under spec than over */
 	d = (psc >= 2) ? 5 : 7 - psc;
 
-	if (of_node && of_device_is_compatible(of_node, "ti,keystone-i2c"))
+	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
 	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
@@ -811,7 +810,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->algo = &i2c_davinci_algo;
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->dev.of_node = dev_of_node(&pdev->dev);
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;
-- 
2.45.2


