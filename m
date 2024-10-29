Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0F8D2AB11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zRN2Q2s1tXUlBpPwz2Gezq5YzOvyUe388g/hG6wINCo=; b=BCyikR3R0B7XMaqxxqi/eVY8YC
	JAoKPTkENNYflAM1aeWPIDCbecQlNdj++iDODhydxnYIP1deVuJHqis28BK4q172rWRKeaPTYal97
	OqfhbT0W+hmqEmH2UIscXZJnzFPX1Q1F2FJ0PP6z7QJWTq7gYf+eq3l2afUkxHUAXHUdEZawd2kuk
	a2nRIEeFp0/E+zj3PyWi2Z9v/ffwJBjo5RIC9rlL51UAHiKkyPKk7tHY4S0q4mmW/FAx3mp5wilIn
	Ot6/qtYWe3+83Vikvc34wcJLUq6ZWmT+9+bidjOeOYrfpxH6PSSm0PEzZ77b12q6Izv+bJtHBFHTx
	iNGdSj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5j9Q-0000000Dz7u-3yvr;
	Tue, 29 Oct 2024 10:08:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ivb-0000000Dvrz-0spo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 09:54:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c693b68f5so56008475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730195658; x=1730800458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zRN2Q2s1tXUlBpPwz2Gezq5YzOvyUe388g/hG6wINCo=;
        b=NSIwfYSMdeHOtU1wU0QXHvu3gvojh6URbJlE15InZGHdBLzvJPxS+xL5d+TXlkmcrc
         a5k17L1y5LN8Fn9Ev8qhptPN3o5k0WYXuLdwWLMFF1mWRKzvX0U+beZm7LnE41v7/Uyq
         HUpivP3VAf/rxbFNm3AiSD7DFGWWBHE0GO3/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730195658; x=1730800458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRN2Q2s1tXUlBpPwz2Gezq5YzOvyUe388g/hG6wINCo=;
        b=nCN9BqWEut5jveLmQ0FIJEeylBAwHpKKgyT3VP7xKxIPLBR8ZM3oC9pXT4uRXO+Ymd
         NYxyyNEc5BRa6GXuKyTqcGlkPfEOmp6bVS0G7DIbhvjVgyx3jsQC1G/VSIgPUHwVahDD
         66fm7IohYfC2hSpl+WnWNHZxVCM/Y6RQ4KsfWUYheJO+CMbNyMTcOMtW6yW8vDOcD5Ts
         4kBqMETAaTMc1ejXSoqp3v5yFi3EYqdeD7igtCqckwPPkIbpOGsMbn2P0ETvNp2ZjQHa
         v6Cw/1hSjTflRTQLM3ZYuopAd7tmuyIZeY0EAMyvlbVsbrPARkM4bjHCq+nGgwhk2zB+
         obgA==
X-Forwarded-Encrypted: i=1; AJvYcCVmQBLQXvTFYopHHUCtEe3HmwCHTavzLkqgvz8Llj7QFs1WdSHeUIC0dNNgv6RJEhk9o8OQ5EDgt6FA8sz4MBOh@lists.infradead.org
X-Gm-Message-State: AOJu0YxBvTDwFHejjUMJpypHZTYSUzWAXet8/GrP52qgaGNJOxizDrsm
	MFr5gbeVlTyzvc5I5ubAJbCqb+MEvkuFKsJoHwn9WOOjtGDVTpyZn0wa4YzxTA==
X-Google-Smtp-Source: AGHT+IGJKLBeHml2mgw0fqam5oO7OYmdphXyqZ72BkhYs4KBfI3AcNJBCtRzWfdnOR4KM6obA5v1sA==
X-Received: by 2002:a17:903:2289:b0:20b:7ec0:ee21 with SMTP id d9443c01a7336-210c68cf5a9mr165968125ad.19.1730195657831;
        Tue, 29 Oct 2024 02:54:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1fef:f494:7cba:476])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02efb1sm62901235ad.221.2024.10.29.02.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 02:54:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/bridge: it6505: Fix inverted reset polarity
Date: Tue, 29 Oct 2024 17:54:10 +0800
Message-ID: <20241029095411.657616-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_025419_305424_6010B2AD 
X-CRM114-Status: GOOD (  15.85  )
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

The IT6505 bridge chip has a active low reset line. Since it is a
"reset" and not an "enable" line, the GPIO should be asserted to
put it in reset and deasserted to bring it out of reset during
the power on sequence.

The polarity was inverted when the driver was first introduced, likely
because the device family that was targeted had an inverting level
shifter on the reset line.

The MT8186 Corsola devices already have the IT6505 in their device tree,
but the whole display pipeline is actually disabled and won't be enabled
until some remaining issues are sorted out. The other known user is
the MT8183 Kukui / Jacuzzi family; their device trees currently do not
have the IT6505 included.

Fix the polarity in the driver while there are no actual users.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 7502a5f81557..df7ecdf0f422 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2618,9 +2618,9 @@ static int it6505_poweron(struct it6505 *it6505)
 	/* time interval between OVDD and SYSRSTN at least be 10ms */
 	if (pdata->gpiod_reset) {
 		usleep_range(10000, 20000);
-		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
-		usleep_range(1000, 2000);
 		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
+		usleep_range(1000, 2000);
+		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
 		usleep_range(25000, 35000);
 	}
 
@@ -2651,7 +2651,7 @@ static int it6505_poweroff(struct it6505 *it6505)
 	disable_irq_nosync(it6505->irq);
 
 	if (pdata->gpiod_reset)
-		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
+		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
 
 	if (pdata->pwr18) {
 		err = regulator_disable(pdata->pwr18);
@@ -3205,7 +3205,7 @@ static int it6505_init_pdata(struct it6505 *it6505)
 		return PTR_ERR(pdata->ovdd);
 	}
 
-	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(pdata->gpiod_reset)) {
 		dev_err(dev, "gpiod_reset gpio not found");
 		return PTR_ERR(pdata->gpiod_reset);
-- 
2.47.0.163.g1226f6d8fa-goog


