Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CC9C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5Nrq8vzcfz+EFBHkAeCo3MqUNhANOtEHSIPQJ/9lRE=; b=BfZu2LJ2/TRF2BB18CdH13fy2A
	xxrQyv4oreO41QoqzyzBPp41r2DxIDLB+PfcFtJVC7QKkP6jj5ogkqC8wHPYGd10/idajLfD5mRc4
	Rc50pIu3oyvVaftMrHIvqduvXI2sVj9kMLChCycKovgc+2+7puicVPXgz89MBYabndxe0agKGg8T5
	rc7eH9UQWJ/xUkyNjZZ2YltTIMr49TznT2unHpO1TcEMjwaaX997CuUb2YpsM1v/O09ZMJmgv29NE
	CTZohY1Orpyiwhiu8kXavSgAGc/iyAWRDV1uwrSS87JaI7H4QWgzgkhG+9XE7uvM7DmGJPZPFL9Rc
	qwf/DUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Si6-0000000DmJd-0Csb;
	Thu, 17 Apr 2025 17:07:34 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUl-0000000Djij-2CEY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:48 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-72c40235c34so305057a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908826; x=1745513626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5Nrq8vzcfz+EFBHkAeCo3MqUNhANOtEHSIPQJ/9lRE=;
        b=L9LdmWYBriLrHGF14Jnkhg3eivG0z1pjqmo0id0PyxfLNT22C/is1WfAeXCvEJ5wwg
         JKUyFEEtvZnRf9/38qV+azr9V/tso4X/8YkQ3LpravLv0a0P2egzwY3Nnsw3dkzaAPXS
         HSZ3zEOEBGfZCxU3HVN+bgokCFSbfdGK+cWq4qUQFaEXmNaIGRXdFIBV+esoduVpeawa
         RtqEx0uvaSzq1l0Mdr/kNTBN9nrdAETXXe2LNIHRd3OV02NJa5FWRSX/lSZoc4OQ1DaG
         9ZZXMRVlm1mf1BoAGB+EfwWZ/tdl0/aZonrfS5SzJazdKoQm0Lhaif1Q0dICfOIzLY++
         YGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908826; x=1745513626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5Nrq8vzcfz+EFBHkAeCo3MqUNhANOtEHSIPQJ/9lRE=;
        b=f0+S+98WmxUpWNV5OJnIW4I7pDyPHoz3Qc7MtfcqiuF264xmk3yb0LimVuxkp4YYfG
         K/sPwjZiRz7YS6OoIGa+fHP4lXXW2yjUNNGpkbaB+Sbkzgcurt9QF3+znsdQotIFMsHk
         ZR7BvGBxPBnyTy7rnYQDWFFPWBu6zgkXrmNSdtrEr6mwLp2Bo3joSncCMeVVEt7LTTvY
         EfxWVC4DKWGllEAPrsr50u+Lib8JfEYUAKjBvDpUtdGfhqG+d/J/AuXfQkGVXU1UpSFa
         lpam4LxOgRIr/0vekTjKeLkq7U2L5Fyip39vEcMFRlEpVahc4N7aYDQQ1uUpA6p8zmPV
         3MEw==
X-Forwarded-Encrypted: i=1; AJvYcCXJoDP0lVdOUwCgZrWHog6jhxvEa/ERMACLles8tup3lhJz42ptwmpSlkbLVA0XNxfz7NFr91KMvk5Nqk7hKSxL@lists.infradead.org
X-Gm-Message-State: AOJu0YxxyZLa8LV1Od4Ud/miXOCkg7Eb5ZMLYS6K1K3NTL8FN7cs5Q0X
	z1sAqiQV/tcuOEMZM+OcUyk5Ue7ABCjBQ2VgN7mhCqT7eMgRAwckrSOTEV4miCI=
X-Gm-Gg: ASbGncsQkpmN6t+OTNvabREzl/DWJiDMrFtueJtmS3m4s0fM0FVWK/4cGV7wcU4O/+1
	AgywqcuBQlTPGECDN8ziLcjUsU7bMk1y4deFD1rTpptjJg/JZRkLOO8JrtSbgsspr3QbCHROB7m
	jximlhioNdLeh4AZxJj2bTVURli8AB6GjwVaqKCVYKAQrxZ0mdxL0jLhKhfA3ZNRMO6UEbZ4j7w
	njw8Z4avLKuY2x+DmrowCoO5l/mQkAQ21Hq1VBCDhesD5jSLuaw8ace81IYyTTLNYNEeVWDQ/Wm
	ZZbN2z61mm2MfXVXZCoHmt3oflxXuT1NiCLrHPhMPwLvs6TAd+/LL8TPRQ==
X-Google-Smtp-Source: AGHT+IHmOxwxeLTqlsojdjpuPG4A188GY1qTUHeyx1ubjxlX5E2Wi9qeVbAG8c3V6wD+0sRgMw1M9g==
X-Received: by 2002:a05:6871:5b21:b0:2c1:9a53:83c4 with SMTP id 586e51a60fabf-2d4d2d25103mr4718196fac.26.1744908826565;
        Thu, 17 Apr 2025 09:53:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:38 -0500
Subject: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=AFJNlLXsHh9BXOAhnBjIC5cwi3XBep4QhbIvlXS8quw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATH6e80MC8cebAk9/XyMJns4mNmoR4XlpZvAU
 HLW+5/PewyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx+gAKCRDCzCAB/wGP
 wFaJB/9v53vyNRV637CJXAFuM6viMOUQbTVVQV74CaXFCutdFctnVJn/WI3JoemgSbu2oRTqbeG
 P3lnHkDd4rmKcUfkI0rWJONtRWzxU6HakQyxrZN8xnEXl0548q5KvocyrNyIb9spm3YQ/Nnd2YR
 bkeTkMJx65tgHhz+Hg4qeNM+aHJbclsUEjCsSEJ51tzYj03BY+t7dImKthXIXDXM5ooLzyGxEXl
 07DAuQl46yL9zsKlOzapY1Q7zfeXubLjk4Ul5TdTlxlQIQoAoN+gky0z5FYdQPrYxvqtGSYJKPG
 GH+zlFi7Q9CWtB4jxfifTOh6JUQuRTcC2HW1QQKEQU6nD21b
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095347_559169_C4C7F96E 
X-CRM114-Status: GOOD (  13.19  )
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

Align the buffers used with iio_push_to_buffers_with_timestamp() to
ensure the s64 timestamp is aligned to 8 bytes.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/accel/bmc150-accel.h | 2 +-
 drivers/iio/imu/adis16550.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/bmc150-accel.h b/drivers/iio/accel/bmc150-accel.h
index 7a7baf52e5955b4cdaef86aeacf479459b76fe94..0079dc99b2c3fba927f73bb3ee8bdc0ea049833e 100644
--- a/drivers/iio/accel/bmc150-accel.h
+++ b/drivers/iio/accel/bmc150-accel.h
@@ -63,7 +63,7 @@ struct bmc150_accel_data {
 	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
 	struct mutex mutex;
 	u8 fifo_mode, watermark;
-	s16 buffer[8];
+	s16 buffer[8] __aligned(8);
 	/*
 	 * Ensure there is sufficient space and correct alignment for
 	 * the timestamp if enabled
diff --git a/drivers/iio/imu/adis16550.c b/drivers/iio/imu/adis16550.c
index b14ea8937c7f5a2123e4097dc5b8260492044d1b..28f0dbd0226cbea67bc6c87d892f7812f21e9304 100644
--- a/drivers/iio/imu/adis16550.c
+++ b/drivers/iio/imu/adis16550.c
@@ -836,7 +836,7 @@ static irqreturn_t adis16550_trigger_handler(int irq, void *p)
 	u16 dummy;
 	bool valid;
 	struct iio_poll_func *pf = p;
-	__be32 data[ADIS16550_MAX_SCAN_DATA];
+	__be32 data[ADIS16550_MAX_SCAN_DATA] __aligned(8);
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct adis16550 *st = iio_priv(indio_dev);
 	struct adis *adis = iio_device_get_drvdata(indio_dev);

-- 
2.43.0


