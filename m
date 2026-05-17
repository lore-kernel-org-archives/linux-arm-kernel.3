Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24923CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECANKKg4MTkRxfSENzBkwIS1NPIhToNwg5GYCZ/bh6o=; b=tPnMythX2bTGBSVb0En0toxZi1
	H1LG06NvirIFP9FmrM2yXi6EAL5VskUpwpRKBI6mPYtKtaQizBqX1ejsdudexFOydqpS4yIrffyf4
	Q5fxKc8SccUlcEJIKj0rZ0eoUzHbU8YYy86zMr0T3luKDRoVbtXKuIoeIQ6h2A185o7r4hHoUfS+V
	dhIgID5o+3oajhDH/1MqgkK3SZoCjhpcnnp+2Aa7XsSCqkxwi8dojJgRG7VBKf0/9LehtkFuO99gB
	SoG0q72SxWb4dmkwXA7ag2rtYyplecv5wlnmDmQzpbDHQo15y+PcH9bAgsl/ccqeQHgjGSA61jWQC
	28pz/qiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4P-0000000DCRl-3das;
	Sun, 17 May 2026 18:18:33 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4L-0000000DCPB-1fs3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:18:30 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-484ba8bc89eso707964b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041908; x=1779646708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECANKKg4MTkRxfSENzBkwIS1NPIhToNwg5GYCZ/bh6o=;
        b=KZpHYXCJ6H7mwQIrB/ksJqe7NbcogspAzouZSoALUg0SyyAkdHZkPubB8WnSJWQ+Z+
         mxejhQqCGkM3wyBTxtiq0XtEMy+7lvnybJENcpo1kNltkf7SFWkMQErdrEi6U2NuuHPq
         7Vw3OxYhZQxMAzexVipTjN9Q5jcJplSnuDPQHgXG0OLXBxpdXGjHf+A/56piyjGr2fbz
         3+9e8ddc9lT0zm3eX7qqt1sbcmkzyrtasywGXHDhu/KVy+cZQdCRFjoSJT6T7h71Lr0k
         d7Vq9pAXRwlwbUsAza8XKaycEZQ1bvA4qszecCETZJIF7ibpDR9kV6nzoA3385Y1414G
         kMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041908; x=1779646708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ECANKKg4MTkRxfSENzBkwIS1NPIhToNwg5GYCZ/bh6o=;
        b=M8m+nUTn5M6MTH4f6fZYl3Pfm7fYYcTDoXQJPSfjuWsSP3pkiditiCSbLT8hXeF9cs
         QKRalAvvKZC/fjYImouv/j2XbMcL7a5Zv7j3sFhaaPk/FWepUeowslh/7/xf+DWCuCRV
         ajavUAnqg42BldUFKd5fMaUlj7AD4o4Tr9OBXPiqI3IAH7QFYnvcnAZXGFM125wdTBhl
         qOuT3AtK5Pd24B/2SzOxV1biIu8YJIfoSl/Bq/eWxg0M8i1vijTnQqCX1gqJzgMc2Ckx
         rZ3ViVctdKzitmkeR/YZ160+/1ibM3Ax4PpDdwPWmJX4utkbnNHM/d9gbvjCRbZcOrs3
         yo/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+DkmVNNNAeEdGGpngxnVioKIhf+BjbsyGtDycc26kS8vQNV2FxGZjedfKN0fNEMP4eoFxSyPUe1WTTF5ijUBXr@lists.infradead.org
X-Gm-Message-State: AOJu0YxQaqflq7Njgl55llT3t31NudB4/XDqhtH+3O/WEMgZiUPOHoNY
	sV6CdowGkMzuRZduukPARjH6bm1jCQyTeN8P7Ld5Wmu9H+bikbRi63QsUjxw1xkOpz5EzInlldA
	yQ96KGho=
X-Gm-Gg: Acq92OGy3P9vlVspnFoCnGy0zXf84bc7Ka7sDSMHMvrGH4wow2J1oEMbXaTvD+jtlgq
	w0T3UirKEfwEUU68YxFhI1K/HYZZBtUG2RtUsC6AVIr21H5m+fr+M6EAWBpyzgWCC1c1iM6Kh49
	20dv9E6HpUK9nbH0MbLlu3Xrv8KgQmRo6I7kGZMDhbhBoBcMA/6Ql7XtmseiW8HiCqxBtC7lP7z
	DvaNSwfmTbRyYI8gVML4dhD5nJU61MPk0dbCqplVJreecpuWIuxl9ERz23dwt0zRQoJ6frwP7FD
	DJxw9j56wvh908JQMlQhH507k8PY/Jokz1NUhXi8KLQ5bjYSd9/S59s/lM0noW4A4KxzitpGJs5
	T85gg/O7sMUHN1iwur95CJ/vAMilP0FzHVYdGbjUObBlCTJb4ZexIIxrAdba9A4nv+QBcJVDwlt
	ERd+hEJfAfdrTXhcNndK/Qc+2vO5g=
X-Received: by 2002:a05:6820:20e:b0:696:7697:647a with SMTP id 006d021491bc7-69c942ef628mr8599698eaf.16.1779041908361;
        Sun, 17 May 2026 11:18:28 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:28 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:20 -0500
Subject: [PATCH 3/8] iio: adc: at91_adc: simplify timestamp channel
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-3-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=C48Abd8eNikDaFfFId0eSCBHL6bq+0x5TvEL5GoFu8w=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZDEZ17zmDQ4U89aCy+DcS8oW4YodZ7dhEf8
 0qbBK+H7XGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGQwAKCRDCzCAB/wGP
 wJFGB/9B3fVze53U8lx+G9ghHy0Zh5HQ9zTEiq/MOyWnB+E6PZoNL92fCoc4WMGniCoaEyd6UCT
 S8/2ofgAd0JD6A+5gZ4A3Z6ioBLYgUhJB1cHu1KUM29AIBLuDxp4xU/9MsG4PhsURfN/lRehJMA
 TIBIIL84aV7F9kAT9F1FpaGDR/nQSJxXDhoEa8ITP6iA442nNGUPY34z1zkTKtuuSPA77R7r8+V
 RIzxuL++W+LZLHPnaWA91BW32quPK4BG2mAgCxFA5La2kmd/mk/1EYpzGp93fuc89AhgdccUHvZ
 2XE8TzX6pT/qCvLiY0eYEtpxXW7n17P6PId2jHScku1P7KKe
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_111829_448866_59DE0F5A 
X-CRM114-Status: GOOD (  12.00  )
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

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/at91_adc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 6e1930f7c65d..260e3e0c09fc 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -481,7 +481,7 @@ static irqreturn_t at91_adc_9x5_interrupt(int irq, void *private)
 static int at91_adc_channel_init(struct iio_dev *idev)
 {
 	struct at91_adc_state *st = iio_priv(idev);
-	struct iio_chan_spec *chan_array, *timestamp;
+	struct iio_chan_spec *chan_array;
 	int bit, idx = 0;
 	unsigned long rsvd_mask = 0;
 
@@ -519,14 +519,8 @@ static int at91_adc_channel_init(struct iio_dev *idev)
 		chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
 		idx++;
 	}
-	timestamp = chan_array + idx;
-
-	timestamp->type = IIO_TIMESTAMP;
-	timestamp->channel = -1;
-	timestamp->scan_index = idx;
-	timestamp->scan_type.sign = 's';
-	timestamp->scan_type.realbits = 64;
-	timestamp->scan_type.storagebits = 64;
+
+	chan_array[idx] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	idev->channels = chan_array;
 	return idev->num_channels;

-- 
2.43.0


