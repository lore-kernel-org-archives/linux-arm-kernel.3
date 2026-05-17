Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDB5CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nI9W/EpiOktwEYbn/tmzmd85CheUFzZnXvaR6Dsbb6c=; b=hjBB7wb3pL1gJzlbGQv5dyYXMk
	H+RRP00VPVS96oGLY//ZEGyNHiBVe/urTsn+rpolZZmCgkIQVA7eDS/nu7oZ6ybqvpoaGuRVpjc6k
	j7dIaxtt65OV8PVrnp/7Myd4xCuScL7HPaglaTXjkpISPBmCDVuwle9trmABBm/3EVkkRcza4L1Z7
	kB4PdYllDaVBxbyWRbVHb9WVK1OU64FCqbEak5+OnakMHHn6WskHnOD7iRq1QEtHsUuJCx3h/Cg8A
	UuA+OS6ye146FKmXUP08orTRwG/RZvQjK5lP68znsZdc8uHg6kCGY4yUloWeLw3aobVGmjmUsyE8R
	fLpV+JZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4f-0000000DCgl-2pWw;
	Sun, 17 May 2026 18:18:49 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4X-0000000DCYp-489E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:18:43 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-69d37777215so5287eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041921; x=1779646721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nI9W/EpiOktwEYbn/tmzmd85CheUFzZnXvaR6Dsbb6c=;
        b=gxPwMcY0Oc4ANgPKiqvpFVJoZ2MUtySE+g3Cvkmh+rhqASgYsK0HuCRM66Akb0q5lf
         KZKPBR5U2mzrKatrer1YSxk//JU9Y7PyQRBoiy8mV99IUhiwHWRxEWL1yMI25Q0VNlJv
         jdEn96dYlGCXGBmKu01SboysoziElfseH7VKd9uWdx6Z4CciugPl3/iS08H0qmpfJgS2
         yyY27dbA3PlH3FUBJxawEozNoCNqXcliDYOk2Ti9SkYfkbmGm0lHPSZVhum0E8EGo2Ks
         dICJpGqejV9InPaXh4lkHc74wLIW8DT0JckB16/sZToroVcRQNpqzTLP/zsUIoe2iM2M
         dX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041921; x=1779646721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nI9W/EpiOktwEYbn/tmzmd85CheUFzZnXvaR6Dsbb6c=;
        b=hRSNwYw4uxnBUiPNewozIpEGBmhp5NGRF5UxSxRnxlhR4uYzMccwuQAfLQXpwwd8Bt
         7Lff6ckLfFQ4bkZoUO8O2ZYuqn/SWzLK1Xrmub4L4fmNE2nkqki+uSs5fXbaif/4bCyL
         mD9OJcwq0Uy5waZ2iACIGuN+1BJwT42no5+nvzcoj1xPmW9v9Gl7vvNBBxYvCy+hhseg
         MXAWAQim/o7tAkYNn/WbcZ0i18HCSSF7/zuDfPTkczOo+5P76E+64Qmx1yY1buToMFpZ
         XBcyiIG4Cno0Bvvk3iDwZoT/6BDdDAdLJGIeDY1RKQHEUV1TveWHvFn9OJKX6BO64QCB
         PhtA==
X-Forwarded-Encrypted: i=1; AFNElJ/g5YUoBJkZudNmY5K3smqosOpvxnthK+cBFgIi/S+CUyQ2WDYaSPu+ONgKNEYR/IReCmzuEzk/9Tgt6l3uZtaI@lists.infradead.org
X-Gm-Message-State: AOJu0YwvU4dues7gNSXoeyuXg18G064TOzf+q7yxijg6LFsIEF1PSnZN
	M7qvqU+iDSAKEuTHgC7xSvWNgBRkuf3RpoR0+5MXy6ROOs4YEzVjTminWCVRKE61IF4=
X-Gm-Gg: Acq92OF40/xyfFU01mjFNa9rxU8q1NbI+Y/jwwviF8rQ6XvP0VcW11XR54H+etJV/NA
	GGtbCe4EiekrSB5+OgRPSjfWnaoKivPMfOAssljbY5BrbRgEuuoUzVdtNZK9H6l/o+aFXGep9/4
	LDOG83btqnYWUzQVBpSfBiVNE6Q/MaKKTTNiTNXMbt8kjxqD8GNUm+DnDX6tXwWYoRQ/v/r2Mv5
	PXO6tn+mHIVS7/xodiB41MjHsmXxeV6YKac8ZGBiQWn3QJqABuTLI0J8P0VKQQkGY+oU4h/cJZ0
	zErK/YQfRUsBqUIGTE06F48dOnFu0wtuWLtXM+V0bw/VG2W+kJJudC7ZcFmA214GwaSksGCpjI+
	TuPdeTJztCnNMkxdTFTZMAJ9Hcoh4ijxnAfyLpkcWOBA2fFB5hKmYdDcUEf0H0Hi9s6CmegAILB
	jaIhNnLyQNWmtcdycJuUORy5ZZHdo=
X-Received: by 2002:a4a:ee08:0:b0:695:818c:e552 with SMTP id 006d021491bc7-69c9c05b9c9mr7284877eaf.55.1779041921012;
        Sun, 17 May 2026 11:18:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:39 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:25 -0500
Subject: [PATCH 8/8] iio: pressure: cros_ec_baro: simplify timestamp
 channel definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-8-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=wEIJJfBuuiW6SgTlxZD7EP4tAEv7nIycNrSYwH0kNGo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZl3bTfr9cKcWM0WeSP7fcRq1+d7XYc1F4Xo
 RfDj35AQXSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGZQAKCRDCzCAB/wGP
 wCfGB/4t+2/7CSmhBVt8beV0zuarKfbCi7dFgQWBJMcDXDyATSw1geVjvr3oVWj41/EraJRsc0P
 yP14hy3N7EI9S4MtFZO1OXirmeuqdzAruQ9YsX8BXEsAkb8yxjRm9aLhx1ODw/swqjMF0rO1+qL
 VG14aCHgmOlFOlZNgT1MirGmj7wCjcn0FMGLgKR6eCLrMrceSAwZNlPjf2YLbtjvaKCBZT29m9h
 /oqz7p7LzT5A5Ipa5T9JKMUP4Vv9pMZRknOKxy2FqV3G7JTWU9YJn+ZkV/sfs/QhIzaKfYuh3F2
 kIvTmBUeRS3JujorXrnp7PVwsJ9fsL/CjuCUrNco4EmKWYp6
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_111842_037760_030AD9AB 
X-CRM114-Status: GOOD (  11.20  )
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
 drivers/iio/pressure/cros_ec_baro.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
index c6b950c596c1..87eb9359928c 100644
--- a/drivers/iio/pressure/cros_ec_baro.c
+++ b/drivers/iio/pressure/cros_ec_baro.c
@@ -170,14 +170,8 @@ static int cros_ec_baro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Timestamp */
 	channel++;
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_index = 1;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_BARO_MAX_CHANNELS;

-- 
2.43.0


