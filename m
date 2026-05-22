Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18994CD5BBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwP1TF7NDrWi/kVnVYhZYtclyhtFTXoBjciS6AkRDbs=; b=JVCR7LzLKnjUlc6K1HG8L9gn/B
	yLd01CS4QTruWM180b3/a1zL2hzGq+YB2vZ/SSfnssSTwSu6pBWwIWemc4EgcCuVmHrKCVgoC5jze
	e+soWapEB3HcukfyGj8xjcE1vlLEcojw8wfexMQxCqGGVJdk8sVyhxKz2+Mvg0hmwwP05DoO46lOC
	3Z+Jgl38GCWHzzPTi6k6XA0m67J/qfzJXRoj4ocq+dvqcBuFaBo2bGnOWOMSNO4r1T7t6z+61blDV
	LjsaFVIZw5jmCH48GOXBUjtl1pQ/v0kEDxsGjx/HDJCkZtOE+HyJ685rxgwm96/5YEF/CYINuAc26
	bg4t0vdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsU-0000000CAUL-2YBg;
	Fri, 22 May 2026 23:02:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsQ-0000000CAO0-1LFE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490402da691so822335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490916; x=1780095716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwP1TF7NDrWi/kVnVYhZYtclyhtFTXoBjciS6AkRDbs=;
        b=SAHbl69rKrmwqp0ke0Gd7zYR6isj+/lL4+rw9Bh/eWD2pyAtPQMFkLX2z5k21STfb1
         JCUv94y+EmmLrU3CoknxoZEbbq20ZqxCBH4oWIQSJGRruF63LWZyGf/93h6A8IqEAIQ9
         m8K6YiJPutK3VQC6juDfhEmPkzIKajrZAfHgpXrnwwaXrVeq604gnuPZ1r/zrwWEyAkx
         6xF0XojzIt0w6WbGpsS/YX4Kmf/40usdlf5ZCDJ8JOWUtyCOsPnLinFfC1b3REFuh6T8
         ZQOE/6aqnZong+EuyyTs5MR1SftHuticEZg4UsrshYa7+TMUoGShjVju7FPv5GkNUy07
         k/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490916; x=1780095716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwP1TF7NDrWi/kVnVYhZYtclyhtFTXoBjciS6AkRDbs=;
        b=iWJqd1wO6pTnHxAomBOnwzVs0UY2+FS2smezcT6Q2fSNxUhDvYLKW05MyxEiOKG95X
         4gFTcX81mh32LDykY0JZVU90lEVS0V8ZRkDKgUgRymW1y99QjwtItKe11gV/aVhURecA
         TDxZmYZ83et1ZCinu8qZATT1j0qXFATtDpqP59TEKFgUHBfAOaH1qEaDTRvXURwReNZ8
         ennmcBCn1J2wYsU4tPh+DiJ6zrwe2ZpFuvl31erktT0/yj+mWDVMvvv/MeVcLKmFcDfp
         4CBgwvxwjrQIhF3eEE8teusJf3ZujSbs5m9JQi2nrD6t74USRNvCBpRDf2b11GZt95qQ
         QJyA==
X-Forwarded-Encrypted: i=1; AFNElJ9WeD2gIyy1Oca0mCtxHQEv0ZixwuEJkp9iTetf++8huTKOM+7Z09be0Z5pqYqv2rG0kJ1qs66wRU4WFx260YQK@lists.infradead.org
X-Gm-Message-State: AOJu0YzHQadI/jAN8Mr7dIyPrH6H1Tos8K5YsHw8kmwh0mzVlOv1QjNC
	MStbSXw9h1iG8kCzB+TMozYCznmiSzZ8/wRoTdrrAkqwAOjC23xTZWus
X-Gm-Gg: Acq92OGK9SxcC++h03nZ0WUKldlE2jBnY1d5Q8vqqrS8fb7XHe8wvLe4QvzZEiIRAVh
	IIlcQv7umXfX5RQVd+d8Who0JYIN6RQ1nWsg4niuWW5EA5gzqJTpN3f/6A8gpdvCDKGMbBGR6CW
	xSv6ozZDOFJI3jgFTeQzxd5KHMQRsTduIpYsE0lSvy/nUZpzi/fFoIGVhwUaTH6vdxV1qtbW5sJ
	0X4ZtF9ghGSuSSRElUJaSme7IC5hDTsxmP3zcrB8n4KCmx2+KJ1V3cBex+DaDJ8/YtGh8/17kBb
	Ayq28disEMU/IgAN9M2o/AM5IGpEzPH1EeUrLNFH2rScI+52CfVdYLLy1Yz44BQwBDZRkbkgO5C
	7tqfFgUVlcY74Ja0MuL2lgvJtvT+hc62rXxSXl6y1Jv4fLSxt8KItXpPKQeYqO9mkrJcn+K8IiV
	2bEWmP8mJ00O9jHgeux4txUNyOffGG4ae7+K8qv7b5qVlgHkWRvuvjT9kMSNMnRBAf7uel5cKvg
	Q==
X-Received: by 2002:a05:600c:8484:b0:48a:56d4:7274 with SMTP id 5b1f17b1804b1-490428ce814mr38170445e9.3.1779490916058;
        Fri, 22 May 2026 16:01:56 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:55 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v4 12/12] crypto: atmel-sha204a - switch to module_i2c_driver
Date: Fri, 22 May 2026 23:01:34 +0000
Message-Id: <20260522230134.32414-13-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160158_365097_AA542718 
X-CRM114-Status: GOOD (  10.73  )
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

Replace explicit module init and exit boilerplate functions with the
module_i2c_driver() macro helper to simplify the driver registration
path.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 86a68f2a27e0..74f91e176713 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -257,18 +257,7 @@ static struct i2c_driver atmel_sha204a_driver = {
 	.driver.of_match_table	= atmel_sha204a_dt_ids,
 };
 
-static int __init atmel_sha204a_init(void)
-{
-	return i2c_add_driver(&atmel_sha204a_driver);
-}
-
-static void __exit atmel_sha204a_exit(void)
-{
-	i2c_del_driver(&atmel_sha204a_driver);
-}
-
-module_init(atmel_sha204a_init);
-module_exit(atmel_sha204a_exit);
+module_i2c_driver(atmel_sha204a_driver);
 
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_DESCRIPTION("Microchip / Atmel SHA204A (I2C) driver");
-- 
2.39.5


