Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BAFCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2YBZV5VY50zazhprv+CHf43mI977/3cuLsJa6SWAdE=; b=FyxIW9PNhaeB4s3dMlxyyqQJ0L
	kxg6BxSncvfD3vvWjtDFEn7Va3xGCH90G4TaYggsNm4UL7Pk9jzToQIhHifLbEBvzgQojZiOMjFnW
	a+IQjO2zQkNH0YyfVd9QzYqitd+BzRNiVK4jWRi2N59KXGfOL7qD+Y8n2Q1kMSv6GT9+h/IL4Je8x
	o+e807Ghaz/X6mINNf4EsakUAaMAv/x/bxqX73LK+m0rOSDYElH4UIN6ykZkQvPqFfFPlHdeqiP4h
	hTIR/VbogQ0RhwvHhjgsgZB9suTsxBDsv67cusKh9idWP6ay8Pr0niC2QbcNNrUHB4fFv4hXap3cV
	/JtyIUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4V-0000000DCWr-1fYe;
	Sun, 17 May 2026 18:18:39 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4S-0000000DCTc-0AUO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:18:37 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-439c00ed7e0so1458898fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041915; x=1779646715; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2YBZV5VY50zazhprv+CHf43mI977/3cuLsJa6SWAdE=;
        b=wQFMA2bAZM6PezQetiBaoFHaHQ8KuTaD7T9nzOKJQdv799SEWWgpc7Q5sSw7wsvU5W
         /5HPAVCno49+dyLHs40LKFTKOTGjKVFU5PUGKPvdnjn/0Y9mC2quZCRI1dfVsMXnsFWP
         oVfblqmKIS5tn5pdD55Kp5ndO36aNL9LP7ZG/6cG3jU9SYuQQzis0EgcnSDL4MJvJnWV
         LjWvZpKeO45fVaqwFZhQ8SltrPToOOVHKXuKqVz0mWVEZFTXeuSyz8PIijG1TZOsaC/I
         0fFOo+9zsQTlZaIH5z1BOINUspam6mnkfE8usgOrdMPmb18Fgjk52sQpgx7/oNZAw+/P
         pO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041915; x=1779646715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I2YBZV5VY50zazhprv+CHf43mI977/3cuLsJa6SWAdE=;
        b=Zsy0O2CxBZD4mWa7u+W1RfiUAmk+igR23QtkVHJJuWAySOWDOt2YXx7huK3V8D3URu
         aH9LQcvGcu7XznWysaBCsvD7ElKhVNIaQU6rdC82Bt5BqtYcVH/I6j1Wg1S4W+4YFmv/
         hvgXbffdSjJu/G6TiWLF14+3StcDaiFEidFHFeDzw9vxUS4dH/KjBaLu1YZBR2G1pf56
         6nHFW1FYLWKM6cAw5oekniCJdxpctID79MYOSoZDzcx8PspSIt8V/x9zvVCkkYdD1aXT
         3XsOzGUCfbrr1bkFwFfHf2lbHx+akYuu4LWA91AoPbErQb1qiINfB2cnbFEpVSqHSq9t
         /dgg==
X-Forwarded-Encrypted: i=1; AFNElJ/h4crJilYrInmjClvQs9PSxA0YuJ/4WNDNqPEBbtI+2I1M/scS9XZ5+35mxlrnz2t7ysCLtLXgOvv3Z+XMiX32@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9wZFefw3GPmO2mNnv93xUl8aEk0HdrD1mJp/2c3lcyGOqHgx6
	n7zbikPaq4rn0F3URjHeSDtaSsWr/VsSCig2BXABMRd8LqhagXPdpbRQrMRFdALxZAA=
X-Gm-Gg: Acq92OGIerZw6Hw8ef/kQkrDkiN8Dt7cyKUtoL/SzNr1c6OJZ7IkKOIip2zzjRpeSo7
	Kv+6YVSR30E2KJ/drs+cecj1yebfKEyOeTJyln8afIjkVVV44hNOSSW2aysKWGh01EXgKBio8/w
	vsRVXgtJXbnNqfA3eUP1rfmXnJfCFKPj9lpD+spRFFLqrbbfkm3OqjHsmMB6qyD5IeY+BDasLr1
	Ix7NvpcprnQ1EqwM/lplezRwqPmC+swB5NeUDH4MwLjcnmOVN+aZ9T+j9baA8vxz/Si9GkZuXPJ
	nHsfKVAyqjEbIKgZVvCCRgGIGcXgJgzfvmXxWwukRnF6p/wblXjcpegnBWuxtc7jGLgpNdmD9+3
	g38WO1AklORSllfnKEmj7Tiv5ctCa/WNvFGTyfULb6m1GDEnfNw2ZuqDmrDlw4sXi6mJNRnVitx
	Pij8a9dho/0N3wxYHrwubrerXX8Qc=
X-Received: by 2002:a05:6870:249c:b0:439:cf80:6393 with SMTP id 586e51a60fabf-43a2d9e7bfcmr7616057fac.14.1779041915129;
        Sun, 17 May 2026 11:18:35 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:23 -0500
Subject: [PATCH 6/8] iio: common: cros_ec_sensors: simplify timestamp
 channel definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-6-61fb908c11c7@baylibre.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=iS4Jf6/jCwjgAYz7f9Ed6IRXIvpMwekq5NKW96Q/f8c=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZY5lNWSWQqxQfk4uVR1kmyHsPoVsVNYqIx+
 qnGwFvJ+n2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGWAAKCRDCzCAB/wGP
 wPePB/9RG04S1WGAlHEaFY+gM7XX9kJzGfYQvsVLrnb9HziWNIBAox4TGSaD20qYJkSvGsvZU9u
 1Sl57NFRld907Z4ohEajFprIB5hxn76yqOQFag/p4BnUDTBIokjTMi/SQ7+FIy6EK9/q4oT0wCq
 RRZQWdwIjdANiLo+eUBFPSDrslKvprqg6kgLwku9TCLrwbplgFed/uOiDPdZEBoGtuMq0N/CMkA
 FABssCiGug7FzwbCfnfJW8Z5c+Q+DPClR63Xbc2tWTRYdFtuKVf+SIJHb0QMaazTaRHX9ew7IzN
 bI2icbiholgNnAiJFhgHwR6XOd7ByyqUTiseleiH1zZWvil4
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_111836_117090_2706C277 
X-CRM114-Status: GOOD (  11.79  )
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
index 6e38d115b6fe..802c811dcf75 100644
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
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(index);
 
 	indio_dev->channels = st->channels;
 	indio_dev->num_channels = index + 1;
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index f34e2bbba2d1..bf49453fc051 100644
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
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(CROS_EC_SENSOR_MAX_AXIS);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_SENSORS_MAX_CHANNELS;

-- 
2.43.0


