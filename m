Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F5DD0BB7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIQ2MP5pDvvYrbfNGj0xV8zPitW4RS++GGpHycvY1/k=; b=JP6n7qInlQHc0Jz9ZkI7lCeUp2
	t0OwjoYYJc9A0uBbcs0oOcQS+ieiKYW0fuvUfgEU89QmEFicQuBa3tMpWuBXUrWZ/FkmzRwRtpXlM
	79SORZEV16vsuVBokPN0VYHXkxfkC7XUCoYk+gO4sjQqHHeytGNAC5hlIArRuCukvtD4Sef+a+jqd
	eR118Xyf6wkY7MiEB08eWiS1uwNISPlQcImkm7QQQsslgNW6Eg08SuCd5AX483zRBzlcIUNlPS7LI
	o1MMr4xpd6fwgHY2t8ce2w5tKNUvffPbnUMysAQwS1P/kALoA7DZ8PN93vNS/IWoG2ZIgVLlnxfQO
	8KWm+4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3twu-0000000HQFw-0xmV;
	Thu, 24 Oct 2024 09:16:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tti-0000000HPMo-1AXj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:12:53 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d3ecad390so1278967f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 02:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761169; x=1730365969; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIQ2MP5pDvvYrbfNGj0xV8zPitW4RS++GGpHycvY1/k=;
        b=08FxjyNqfZX6VpfnJrtEPlYX+KtwQrM1as2sIRIS9DEwArPsk2uq/yuMXFtb4iaNfR
         CxmYoKjDFrcM/FdKv53tlVQ1ka74pbsHSDSujC4rOBcI46XcnpztKJ2Jv+wLC5X7jbDo
         DoU2dsUR5r+0mApqutORAQRHGCWgmP0/FKnVR1jexhV69W2VL65IC65cuvDdjA/izyto
         UptCS7DXFmqZPseBEKnXiaLO2Iib8Ls6M48bQGhCpZ/n3TAg9PJa9pFIhUOQ15/X5h7T
         EKInbmDCyR10sWA5EON6Nxv0hqjCxfiGKFDig+4maeLyuREt7yQySB2j/R/R4ULrsblr
         56zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761169; x=1730365969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIQ2MP5pDvvYrbfNGj0xV8zPitW4RS++GGpHycvY1/k=;
        b=nNIylzN1gMTkFqkY7q6XocWwF/XOt2WVr3HeBMPIK/ja5k5PmB+tb6000JuO0qmAkO
         Ji1tmeKQJdnCj5LmpW9w7T+2Xig6BbAlPmEIlBJ64iS/NUijC83bFHiLfZ6W+ByIUnTm
         vedHaT2O3KMj8+rd6Idvl1TO7ROSMdkC8YFxRlAoHj7Q/BCav/Hz6Svwm3rAttAriSg5
         yKuL068JUsjRCEGWHM+gpQE8IB8pJY1c2rREMC7LvBNtD4s0I7dI8d2h1SbTOVLiS++J
         REqd0E1aDD2/BMQvksLyKMDRiSYGdStj8aHYMeC9ZGdtdb01sXH6IxMWj5v0nYFqfZgU
         bf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfTlTzVvVECvJKEHbE5qH/RFGb9Ihlc0/vFhrq/fvwgJ2cvJFKXelYPyt0y3Is0We+cX7jj9Jn48QdiRj4zQ8i@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7+saBJhlSdC4jD5dClSX2w5t1zOAopCKQTtNSQFFEOGN+WI/P
	eEmeI6/sAXcZL3N4goJhciH2GP+CFumJrday/bTQ7i6wc5DMf3wpALb5Y9yuXAw=
X-Google-Smtp-Source: AGHT+IEntWBLa/5dqURskXL/ARSqsAtqEzMl2o5Iyp6sjz8yTHvxrX3rp+R1PtjRMJFP/N8oYDaypw==
X-Received: by 2002:a05:6000:c8b:b0:37c:c4c0:4545 with SMTP id ffacd0b85a97d-3803abb4947mr832029f8f.10.1729761168701;
        Thu, 24 Oct 2024 02:12:48 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:48 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:23 +0200
Subject: [PATCH 1/7] iio: light: bh1745: simplify code in
 write_event_config callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-1-7d29e5a31b00@baylibre.com>
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
X-CRM114-CacheID: sfid-20241024_021250_606818_8C03D29B 
X-CRM114-Status: GOOD (  12.42  )
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
 drivers/iio/light/bh1745.c | 48 +++++++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/iio/light/bh1745.c b/drivers/iio/light/bh1745.c
index 2e458e9d5d85308fb6a13d9dbd845fa03b56a40e..fc6bf062d4f510886f909509d8115f0cf892f3c4 100644
--- a/drivers/iio/light/bh1745.c
+++ b/drivers/iio/light/bh1745.c
@@ -643,41 +643,37 @@ static int bh1745_write_event_config(struct iio_dev *indio_dev,
 	struct bh1745_data *data = iio_priv(indio_dev);
 	int value;
 
-	if (state == 0)
+	if (!state)
 		return regmap_clear_bits(data->regmap,
 					 BH1745_INTR, BH1745_INTR_ENABLE);
 
-	if (state == 1) {
-		/* Latch is always enabled when enabling interrupt */
-		value = BH1745_INTR_ENABLE;
+	/* Latch is always enabled when enabling interrupt */
+	value = BH1745_INTR_ENABLE;
 
-		switch (chan->channel2) {
-		case IIO_MOD_LIGHT_RED:
-			return regmap_write(data->regmap, BH1745_INTR,
-					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
-							       BH1745_INTR_SOURCE_RED));
+	switch (chan->channel2) {
+	case IIO_MOD_LIGHT_RED:
+		return regmap_write(data->regmap, BH1745_INTR,
+				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
+						       BH1745_INTR_SOURCE_RED));
 
-		case IIO_MOD_LIGHT_GREEN:
-			return regmap_write(data->regmap, BH1745_INTR,
-					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
-							       BH1745_INTR_SOURCE_GREEN));
+	case IIO_MOD_LIGHT_GREEN:
+		return regmap_write(data->regmap, BH1745_INTR,
+				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
+						       BH1745_INTR_SOURCE_GREEN));
 
-		case IIO_MOD_LIGHT_BLUE:
-			return regmap_write(data->regmap, BH1745_INTR,
-					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
-							       BH1745_INTR_SOURCE_BLUE));
+	case IIO_MOD_LIGHT_BLUE:
+		return regmap_write(data->regmap, BH1745_INTR,
+				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
+						       BH1745_INTR_SOURCE_BLUE));
 
-		case IIO_MOD_LIGHT_CLEAR:
-			return regmap_write(data->regmap, BH1745_INTR,
-					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
-							       BH1745_INTR_SOURCE_CLEAR));
+	case IIO_MOD_LIGHT_CLEAR:
+		return regmap_write(data->regmap, BH1745_INTR,
+				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
+						       BH1745_INTR_SOURCE_CLEAR));
 
-		default:
-			return -EINVAL;
-		}
+	default:
+		return -EINVAL;
 	}
-
-	return -EINVAL;
 }
 
 static int bh1745_read_avail(struct iio_dev *indio_dev,

-- 
2.47.0


