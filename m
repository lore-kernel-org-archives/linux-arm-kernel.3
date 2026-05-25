Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808BCCD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAuC+S48oKndwyYOp8JJtJ7EFoaTestnDBoMKOxyMfY=; b=iFwWSJBOyqUUH92xr6hkRBzv3q
	FqGuG5mz9tbR4l3SzKfqwy2U2vwBzqWm3XJSShmTZc/epLrXCHOJWkHwmFGbeWbNM/mX4g3pOd95F
	Y2AU90Y0xZiR/gbb7cOVZKcKKrnRxAphrXF1VRS82ee9/3tJ/klWzKN7x/wRNvTl5DAaJU9mvtIAN
	Kk8ohLGwiRYvzsiGozyGRaSDJaDa2p2H4l6fNdFlFJW3hVRV2nQPjStMGBVrrCHkLN5WEdoQ6K708
	iMBHGthkYv73NiQuOjmKpvtcYmciSjuwJI3vpXmeluRIm2bEEBxXY2qYsobWkqiwa47zs89gp/OUz
	myOgAGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKId-0000000G1xy-47cL;
	Mon, 25 May 2026 01:40:11 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIT-0000000G1qv-1EbX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:40:03 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7e61da76fd9so1073349a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673200; x=1780278000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAuC+S48oKndwyYOp8JJtJ7EFoaTestnDBoMKOxyMfY=;
        b=jpAMRoRHGeT4YR6hyXUyZ+6QzH84s6rgRMUJtCQIbP1w563J3YSd12Mn9SzgRfIz6V
         jie70rx7pMIHr1K1+vKsw0wYDRF/LG1bdrBrCVWe5ullD5RabaQPg1n6UVH9jiW11rNi
         XhHpF8qWWOIuyxubRtj+nElNBIvnXHrrAddGntuP12N4YX69tkOMUSNltnYqLETDPYRy
         D5z9sjXq/DbE4jkxd3CDsAFq1MMegUgedY2BJGIo8UoP/LEEd3M5rMsQDCqSAySoSfzY
         yem2Ltbe0kgQkh/+kwMi+/KV42wF5zqTeCThccKMbkjtMp2IecyjDWviF6/3Jgwt2zym
         FNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673200; x=1780278000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qAuC+S48oKndwyYOp8JJtJ7EFoaTestnDBoMKOxyMfY=;
        b=qtf4XfodRRmZmt2niDwkE9kSDZI0lC52i0qsysHUp1tIr5uBKuEzl7ztJpiW+GugiQ
         EljdrFNIDx5GFpUHtVrQC2IiGjK412F70ITwHB/yisuwhZ/8Fjdlcni/z2ASAZIt8kzm
         bW8DdDEmN8bwlyfF6tVJ0uRNngYii5ymjLHtMGZ1vUi+I4wMKh/ZDHUCRLwz68mGcBUv
         uu5IMYLGHJdoWFoBUOl5tL2WkHg/tvxqBiplScd6ZypPVYiULnzsbfL7ivTouuddN2+8
         MiDGocRE1JpHBvBXuBGsEW/hIEpFZuYvPhJMW5Vsy8pORqo/gFy8FhSUvnh/T0FavEHz
         wAOA==
X-Forwarded-Encrypted: i=1; AFNElJ95cstIFoXAeZxeqZhetxvo8O6O/MGCArGrF7jOLR2AgGQmMDxBn2/NN2AJcymY+l0f9jrBShJnUejrN57dZxqN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/u5ZgQ05qfKEpJDeBB4HrUnRHf+NoWh/U3ZfLkrSzs82a0Aig
	9BmACZ9WCI5Jj5EQyb8uibP+xsj7PILflTWvs5cZmvUl3J3qfOeWVlCc0tKfFns2u0Q=
X-Gm-Gg: Acq92OGx3Ku+8qYHGX3xMTOerOxBEgTjBdXAyUBAmSA0Mjw/tWk4+DirN0jZuabAdZt
	FQzn0cznCuChoZtV1k8JnSVDA3d+5eqsMQNqe8hj0LZDACm/qzC93iXuSbqT0f8i/x/EhoSB2Th
	QB2Zz01ub0wh3gNsVO5coHOaqrjT/UNQ7ggPm4I1UYCu49gGha13YnPioaqZsAu5EwKk2P1+1Rq
	qY0kPhz8TCNz3RqOyro1a59+ziNTaSc1GeQkB/5CGEZ8GmNzE4QoKri2EuvwhoZ/9E7AMT84Osr
	04HPUB7NlpbSZ7MDGM/4u2mrIdspKROyxKDP8ebFsAY3RitqFSckwFd9sM474OVcNRrenqtfUz+
	NfYCjeqmdSIAUQAMQswuRbkZL4jALzMZnDw/Z3f0P29bRF3L20+ftzBv+RqubKFzrD4mHWQG8h8
	8Om0lZcGyBA29K9rWMCAktedqkqUpYH9OacrIZy9A=
X-Received: by 2002:a05:6830:6182:b0:7dc:cd0b:58ac with SMTP id 46e09a7af769-7e5feda98ccmr8635037a34.9.1779673200405;
        Sun, 24 May 2026 18:40:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:40:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:39 -0500
Subject: [PATCH v2 7/9] iio: common: cros_ec_sensors: simplify timestamp
 channel definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-7-c37c9408b7f7@baylibre.com>
References: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=ZT+q1uIcB6+NTxZJlpCOAl/a9R7GwZgj1SBW0pmx/qQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6hM39CnRhd7ZB2gP19BJ4GLnYKluJq5+aC4X
 i8XRKRITNSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoTAAKCRDCzCAB/wGP
 wAskCACfNSL5Vz4Cx1MbQaKk90iMp4pl1QLQYrJOWI95BPLFaXenWsYkLPkTMIjVPhfG9LBUqi7
 BIIzwLhw03+63ZtMhBxMIK8+lf/QcMewhBjifvxlt35sb49gsX+MVkKjUhZf3NYHeBjw49PiCEo
 2ek/mmaAv2Q4Y768kMkOKz0BjszAZSWygmYZBUKEO1pYKXECEBGTz+eeGwEuHrqcyw/kb1nCQ/Y
 a+oX3tZKu7pSI2yIoR8FPd9ue+uDqxisYZFGiifQgGkD+WoXw07zgBvRLEvYmJ9WocRMkN+iq1w
 GG6J7I+0XDN9HYbw17EULER6YA+vgzT6NaSrOGJYjEogLbRM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_184001_896366_9F9A3BDC 
X-CRM114-Status: GOOD (  12.26  )
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

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c | 8 +-------
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c  | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
index 6e38d115b6fe..6762685e6876 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
@@ -279,13 +279,7 @@ static int cros_ec_sensors_probe(struct platform_device *pdev)
 		channel++;
 	}
 
-	/* Timestamp */
-	channel->scan_index = index;
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(index);
 
 	indio_dev->channels = st->channels;
 	indio_dev->num_channels = index + 1;
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index f34e2bbba2d1..651632ccfe0d 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -279,13 +279,7 @@ static int cros_ec_sensors_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Timestamp */
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_index = CROS_EC_SENSOR_MAX_AXIS;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(CROS_EC_SENSOR_MAX_AXIS);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_SENSORS_MAX_CHANNELS;

-- 
2.43.0


