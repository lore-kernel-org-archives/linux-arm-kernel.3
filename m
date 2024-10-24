Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1F5D0BB7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpXwrqa5mh4an1VW52USOlgjMJ2X4POeKu7/qnEQ85Y=; b=U7P6A2muu7+YX/DDDAEa7PI01S
	d9jPgbPguXKdj5Qgs/GUqKrscfhQYAwdJsMUVsH9FTfrfZqx7XAHLKgi8rj8t1BMqQ5lV7WgJHVPP
	cvmQCUm6R9bPttQpc5srzpEE5QairW+8hDANUU6+JPdi1igc8O63K19rcJDVVu8IAqvyIGD1ExE9B
	oC5W1P/3VIbNXnFUvdZw4pln48HG41lZnxZNjkdif3UC8yh8HP7XyaOxWoNGECHH5R3qSOLB3rhEY
	csHeCIFP2/jSzyp2ql6XlCB9tVC+BDz+xGVUza260RCmxYFALs1ia3zYbjswFpawCFfdx4KZ5Sxfd
	ytCsV/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3u30-0000000HRFc-24Vt;
	Thu, 24 Oct 2024 09:22:26 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ttn-0000000HPPd-0P2P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:12:56 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539fe76e802so803555e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 02:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761173; x=1730365973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpXwrqa5mh4an1VW52USOlgjMJ2X4POeKu7/qnEQ85Y=;
        b=LYw5rY2ERbbh68zvb0Q7g9h6YpdxnkB80Bxx025CW+DSLsTmaJddAvmgAzrySb3is0
         YmSiKDXQDFgQZPlEE+abmLTEbrxO2dUIBtsMY3UNqU+HBQq/gKjhlYRAceR9oVBmywPU
         9UOu1nenvc/sNy66KChfljNxfczpdxtky5Vt79fqo2AN6MzHA/HgAyC6tyP5n8kF/sdg
         XLxeLgg+PuzWEG7oHCj+cmjzoCTNccmA/fb3N8XJWN5f1DO2kWCoWKddY+iN8CeennJ5
         Xk4X/xK/zYQtyD/qYhHUWO66n+MoaVhyObdvo7URspBHrUdcXK82fKiCDDqyUPEYnLYw
         gKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761173; x=1730365973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpXwrqa5mh4an1VW52USOlgjMJ2X4POeKu7/qnEQ85Y=;
        b=bneapqVQsnpFRjaDbxLia4h3jrQ2aUD6JcHQpLtN+utbWkjbBdMw5n2Y/nyJrM3byN
         ou7vTs16cDdLuyZCgn4AFvaOloIsAaK1zgkca3cQZFwJb8aXjnY1OiaXAui46x7CRNc5
         ZLp2Qi49vhgwgZua2+iJnH8/g4G/VzgjllHEiNoT5sJ1qWyX0ijCBCiQEcdTBP8Fjpml
         BTNgMEPZrtBbrFZd/1npaJIXEqAfaIY7Pncywlo35Wdr1TQgTalMTfmspp0UtkxiCVl8
         8eNflwvlhVRsuxXDdW9BLImS5HDBnP+ojh1lHOLaAfvxqXvH1UDwKbhuPsOgvL0gH+2V
         4cfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKOCmHph3/13FjXwMDCwbx/q+zPbs7OhRyYFAzf26w/pekXixKlIMQFy7gdalrGeCP6JZA4+u2A26xRoGVNVyr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2gBWtw2ZswSQs7zMX9RTp+INQpMUdLnSGLLp9y2RBKE+hWtW2
	qF7CNecOyX4+8NSGvNzN4wzfSNfM7djsuCGyonKLtveEG8HbqlvMLd2LfARuoyvgBGiTvX4DNJA
	t8IV0Gw==
X-Google-Smtp-Source: AGHT+IHjMTzdOejYpXdaJTcSXe71t6xMLTv/MupAWuwwaYamFeQSYvZEYBgJNNUbqbvWU86WqzOMBw==
X-Received: by 2002:a05:6512:3a82:b0:539:8b02:8f1d with SMTP id 2adb3069b0e04-53b1a3392bcmr2894072e87.30.1729761173024;
        Thu, 24 Oct 2024 02:12:53 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:52 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:27 +0200
Subject: [PATCH 5/7] iio: imu: inv_mpu6050: simplify code in
 write_event_config callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-5-7d29e5a31b00@baylibre.com>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
In-Reply-To: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
To: Mudit Sharma <muditsharma.info@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Anshul Dalal <anshulusr@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Ramona Gradinariu <ramona.gradinariu@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Dan Robertson <dan@dlrobertson.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Mariel Tinaco <Mariel.Tinaco@analog.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_021255_175121_FFE40B56 
X-CRM114-Status: GOOD (  12.24  )
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

iio_ev_state_store is actually using kstrtobool to check user
input, then gives the converted boolean value to the write_event_config
callback.

Remove useless code in write_event_config callback.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 7 ++-----
 drivers/iio/light/apds9960.c               | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index 5680be153127711777b6074da18a7a0f86211d6c..21ebf0f7e28fec302cbf8ab890fc53a3de6f36cd 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -1176,21 +1176,18 @@ static int inv_mpu6050_write_event_config(struct iio_dev *indio_dev,
 					  int state)
 {
 	struct inv_mpu6050_state *st = iio_priv(indio_dev);
-	int enable;
 
 	/* support only WoM (accel roc rising) event */
 	if (chan->type != IIO_ACCEL || type != IIO_EV_TYPE_ROC ||
 	    dir != IIO_EV_DIR_RISING)
 		return -EINVAL;
 
-	enable = !!state;
-
 	guard(mutex)(&st->lock);
 
-	if (st->chip_config.wom_en == enable)
+	if (st->chip_config.wom_en == state)
 		return 0;
 
-	return inv_mpu6050_enable_wom(st, enable);
+	return inv_mpu6050_enable_wom(st, state);
 }
 
 static int inv_mpu6050_read_event_value(struct iio_dev *indio_dev,
diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index 3c14e4c30805e1b596ef2380f94e6aa3e92082b1..3a56eaae5a68f2891d061871c7013f0b5447bb47 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -762,8 +762,6 @@ static int apds9960_write_event_config(struct iio_dev *indio_dev,
 	struct apds9960_data *data = iio_priv(indio_dev);
 	int ret;
 
-	state = !!state;
-
 	switch (chan->type) {
 	case IIO_PROXIMITY:
 		if (data->pxs_int == state)

-- 
2.47.0


