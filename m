Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0113DEDEC03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e3J4SJFkd0Yz/4xyMUebZW0UW2z89TjGNLD0gGCcfR0=; b=JMOmFXWOsn45ZQiPG7S8tYsmQ2
	T19b65EnTJPhq5ZL6B+sOsGHis8uTcAxX1nby5UTcyQ/q9/5U0XaYrtMfawwQt+KXBKnD+LC2KsdQ
	/u2nUfg/tRCuhyydsPFgOyAt628uvfwd00llaXFNFot8A1bh2lVx0q7RjyxEgiGg6HYTUhlMvteRV
	nyei/hz133Z+cyr0ydS7aX49iiNnuP89g7u3TYl1kRMoUbGZB8Qhm6hfuLtPmpG0Pn2tpYkbCY9ta
	slwNhzUWTze6Lhk03aQiLgloq/NJUu2pp1sZyaWPedpVEIWrgCA7yOtpvaS5VLpHD4sU39SgjmmF4
	F6y8z7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdhR-0000000GQrc-3okz;
	Wed, 04 Mar 2026 04:19:05 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdhQ-0000000GQrD-05GH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:19:05 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-797ab169454so63255917b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 20:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772597943; x=1773202743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e3J4SJFkd0Yz/4xyMUebZW0UW2z89TjGNLD0gGCcfR0=;
        b=KJUXNTqn0e1Z0ZmxpMVSfFYF+MHs82d9ZFz/42Sqkpg811BvAm2QUOPVxbGYe9paSS
         FkUWtlSjYSV9vFHBoYR5DawddYk7ZYsSrdjy2BynVfv6ylVB6+j7NWeNDh2CkJrfrrZW
         7gkos5lO0qA0u2vTgOTQ5+jPNxJHcdpMhypZkjbErDrUohu9IazTBarRhkVfdvGOK5ky
         096Qkzy1P3lK0hnEvKovR3D4KVM9CC6Ki7auXDNCa3aPsSLbMtYCmcpS8w4HhMObjhpA
         bSszDdlN8U4HkxvSsMVNJw9+PnESkEqW/DVrT3T1ZpzkzIekUuu8AGrDHbDh8EipSYn5
         bDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772597943; x=1773202743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3J4SJFkd0Yz/4xyMUebZW0UW2z89TjGNLD0gGCcfR0=;
        b=fw1tSfpKNGzwj+O3Sh21oBbMOT2ynkODSIkPHkry68sTtJnTFCcekgWev71Yv4j23T
         aAuqir9niA/dm5A0/3LfVmwzrsmZXzpV2LubEaVhXSiqhQMjZvELMk5zygO49g6ls05x
         Uu4AArZ59qZxsCLOqAl8nACWQJTbPVyS0LMFguCjB19BdIKI2NJOcl0jW8/Q+5Tto2bJ
         mLefAS+zQZld6B03DImUdX06H5H0wv2vVoNQdZyaJEMei7P5QP3pVhJYgKgSOJO41LdU
         kHDuCs+gSObKn83xZGzFWMtQ3x8CdkMnlMylMiknJ/jTgIZ9Ioy3UHwjRqCiymxJ5dQ3
         9A9g==
X-Forwarded-Encrypted: i=1; AJvYcCVEd4trMSBammgw0G6roLgpTgaq0ik5fBulCIkma+fs7bt6hYFA02ZJAaOXBvwXKJHE4OU3W6wUMGFm05KZIEY+@lists.infradead.org
X-Gm-Message-State: AOJu0YzhVlDLnn1XTPMbk9DyH673P07P7lV98RQOeMUClvvbFUuCJosT
	55FBTEneU+PSTQP5BPouzNmr3EoKfT+iBjcuHQ4xw4rm4P5Wgb1rJqfA
X-Gm-Gg: ATEYQzzCjL95lVosT+9UMaChrvHjLoDfsXXeye88IM9TkL8Tch7+kb8SYng0P7RYq0V
	IBalTuuQfj4MxzdZHznxmogqdWNdmOt0poKua4P1yVYwaWxiSfJFAoNa1tc4ZRwFskgoFwZ6lCx
	FBXrC/QrdakmbE9HP4l36gMKUooZjOfFcXYBA1CcY+wJMoozJXrgNT4znqHjEbY7rjaR+lm18Uh
	XwXrv8oBchlULQgere8EqjMrV13X5mKlkivChFYmVh8Suw4QYKgeU1dF7r/UqjdLYHqd5vmozK/
	rTn5KGa/A70+PcT1H76L/a8lDvHekBMFb7SLHInn0nbEhWtVSPBqXWjqHJsc8FAkIs0qSrbvb6w
	dy0J3diuRSLtlsBOD4/4LzHNAIcLqhlCI7JuHeqB5ZaWB3ezJpqQiJVh0XUpr3jCbc4IDVvhcdj
	U15xthKp0+WYYFykXWlSXPaQBqM/SmysjtZzwUZa6VfICcZLLOWxPEcKZS44qIiYQ5
X-Received: by 2002:a05:690c:c513:b0:796:3236:7e2d with SMTP id 00721157ae682-798c6be0a5emr6473207b3.15.1772597942730;
        Tue, 03 Mar 2026 20:19:02 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a8db33sm71465357b3.4.2026.03.03.20.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:19:02 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Eugen Hristev <eugen.hristev@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iio: adc: at91-sama5d2_adc: no devm for nvmem_cell_get
Date: Tue,  3 Mar 2026 20:18:43 -0800
Message-ID: <20260304041843.7709-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_201904_060703_3F3D5315 
X-CRM114-Status: GOOD (  10.48  )
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

There is absolutely no reason to pospone cleanup of this post driver
removal. Just do it immediately.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 69bb49434f90..255970b2e747 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -2259,7 +2259,7 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 		return 0;
 
 	/* Get the calibration data from NVMEM. */
-	temp_calib = devm_nvmem_cell_get(dev, "temperature_calib");
+	temp_calib = nvmem_cell_get(dev, "temperature_calib");
 	if (IS_ERR(temp_calib)) {
 		ret = PTR_ERR(temp_calib);
 		if (ret != -ENOENT)
@@ -2268,6 +2268,7 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
 	}
 
 	buf = nvmem_cell_read(temp_calib, &len);
+	nvmem_cell_put(temp_calib);
 	if (IS_ERR(buf)) {
 		dev_err(dev, "Failed to read calibration data!\n");
 		return PTR_ERR(buf);
-- 
2.53.0


