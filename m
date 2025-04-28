Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12882C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=; b=gkoWkldn5Wx3XjoHSZ0n7KJVVG
	ZMw40tUxmDR16kiGTr33OYCPCC+d1r8Mt18lc8nD5W+FvvnG7s+LMdBYPGjOpLgetkU5XLd9X6LEu
	VLDUizIYOqeaivzYXZ9cniv8NlT6FlFoGR51Vo0biKtk3Sw4vCd7Pzh8VcqSeCHGps09Ur1M7lPCF
	NCb4LDzsgpqGt6Ulgm7+IAccNn0d9bS4tvs0WxuMcezHSegLrE1tzApohamXpHJr+akPhHGqvI4OA
	MjFeVUDFAPkBRMfdeMpkgn5l9t9ABhlhia6zj9NoU/0p5N50kyvoQ0jTFcdyCRNVfALZESAjx2bkM
	+HLM4KKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V79-00000007TUa-0XRm;
	Mon, 28 Apr 2025 20:30:07 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V1M-00000007SEe-23kN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:24:09 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3f8df49e75fso1164132b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871847; x=1746476647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=;
        b=Zvxz4mlCW3Ul+AS9s5ivQ6D2IXfbypsBxhH3KBKQpGgCf2An3/Kdd3FeNl9h0IzkRD
         5YTMEAY8yLZH1rNaLlnUKMdzwk0ewluRo0F+C8BoOzDZOOcBNhXNLNz6ulRk1gwHSr4r
         6bqXVC0Hqz9NiJ1IxtcowuFX+PpDf+WPkbXPE62rhPTa3gj4IWV2CgzOUwdAVaZBXWlm
         uhhJ7E9tLt/JnWmzHEUvfN308Wm49l6JyEnnWCguxhbMqKp9ijqrR7+AQdffwHbpAz8B
         35ydJwN4lb8l7ryiuuS8p9PyGdvP538hmnOBE8nUxKvrmxts4kGhsgiplzVcGuQOb13c
         j+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871847; x=1746476647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=;
        b=ZTxG+owJ4lKA0eH2c22p9zqlnhPxjvB2mUkaVKOTAJQYFZlKHwUCaVvta6TR4RM7Y7
         JxwCCuDUOIdXmeve5JdaurPEYNNkTe2KyNi7Aj0pq80XswzKJ3KG5eiCbfSuPQmovYn6
         14+diXSewPaoTB7JsS5jxFkDSSB8N611HiuvsC1ui3X/CRUmcIY+hny8OY+t1DRIdNqB
         NLDw62mx0MPnQG+8VhoGrCXa7d/0AjEh6tv8DjS7a+fsbtfW9sX2OKBuv/lAWUK0aEn9
         wqiwLXodny3hCUJP7zL+fK89359j/b2R5f53dzbpTX29xdd9cxpMeBRD30m95IH/arn2
         zo6g==
X-Forwarded-Encrypted: i=1; AJvYcCWkbXHoMpNzVufueKjdF750vggeKQXj+UBL9s4rPVWK0Zs/YirN6FnV89h9TUBXtwmwE8uKdfYbZtQplx8fRhIh@lists.infradead.org
X-Gm-Message-State: AOJu0YyAKJCkrIOZ+Hh+robgDGd6GOylAS4YBL8WRSSlgqQmpJNzH48w
	UAUWfCt+P4VcYTZv4aqCvtFOPlRN7wn+J1k2w9Il2RtnMwAssJFQBW9iGa2drlk=
X-Gm-Gg: ASbGncs/TMtQ2CIlnUBfd0MWyRhk/tKCLMdj/A01ATe6pMsxnJ7BFO5sj1llAvhDVea
	EioPwnMM+D6XHGs9IceIc8pCRT+j04rKtg6R4P5hCEtEDcSbiGxb0nhxN1l+l21RE3By0ffCYkd
	gohUJ+djAWUpM9HePuNB8ApfkdNAmxEQhOcv3CkMBAe7TtTtAE/upNlTg36uZGH5HgAPO3RfPLY
	V4+VJaHo18cpVgxjyr/NTwUI5UEVrrPP9AirUIxDmUbT33iuxrb3Hn3bNul4188y1gzvNzM3egE
	fNaBKfwdMinNOYDC4z8AoisZfkaQYP6fe+Olrk2i/BRmw0w=
X-Google-Smtp-Source: AGHT+IE2t1mIKjTbfLOxxHnPGtF5EANZEhBUSNDmzIqx7nof0PYr33NBqzeXXAMHb0wVBbQ/ZHOTBg==
X-Received: by 2002:a05:6808:3386:b0:401:e7c0:62b7 with SMTP id 5614622812f47-401fd6e2ff3mr6007281b6e.1.1745871847483;
        Mon, 28 Apr 2025 13:24:07 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:04 -0500
Subject: [PATCH v4 2/7] iio: adc: ad4695: use u16 for buffer elements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-2-6f7f6126f1cb@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2149; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NLK9rHWGxHgHc450e6JA3Kx5J3+N1Fpz21XOi57G4v0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+O4WpNLbL3CYKCp+PPUsjmA9mnQKptP+x5eq
 ren3YBYwRWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/juAAKCRDCzCAB/wGP
 wAtvB/4vVUEBo0j0lHeSRNlDndrnUGlRw/RjDbtLEEZfSuKleOliq3a7xcyqLmSE8l85l1qeMND
 eLCSL522/2esSp4tE5jPHvqeLOokuWiy8HrX0U8V79et+AQSe4Q178E9j1qgV+HJ/kxSMtuxSZy
 DwXsfcULwYiB7aLCyGKdgDKkjXBmLGDVNLU+ooKF8xABky2jX+R8g1clxwuUKk1aWN8c5GZpUzc
 aD+jYlThFlC/yF5p9noGzD8oD+RfSYC0AlpuI2cUIJVQqei6XeDO6E8xMd3uIj1ouPdmohMu0JD
 5O45phj5sO9zskocZ99/2RyH1ZnmderDB//fPMXwIbcNufJP
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_132408_523717_EF2C5DC9 
X-CRM114-Status: GOOD (  16.92  )
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

Change the type of the buffer elements to u16 since we currently only
support 16-bit word size. The code was originally written to also allow
for 32-bit word size when oversampling is enabled, but so far,
oversampling is only implemented when using SPI offload and therefore
doesn't use this buffer.

AD4695_MAX_CHANNEL_SIZE macro is dropped since it no longer adds any
value.

AD4695_MAX_CHANNELS + 2 is changed to AD4695_MAX_CHANNELS + 1 because
previously we were overallocating. AD4695_MAX_CHANNELS is the number of
of voltage channels and + 1 is for the temperature channel.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4695.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index 68c6625db0d75f4cade7cb029e94191118dbcaa0..0c633d43e480d5404074e9fa35f1d330b448f0a2 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -106,8 +106,6 @@
 
 /* Max number of voltage input channels. */
 #define AD4695_MAX_CHANNELS		16
-/* Max size of 1 raw sample in bytes. */
-#define AD4695_MAX_CHANNEL_SIZE		2
 
 enum ad4695_in_pair {
 	AD4695_IN_PAIR_REFGND,
@@ -162,8 +160,8 @@ struct ad4695_state {
 	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
 	struct spi_message buf_read_msg;
 	/* Raw conversion data received. */
-	u8 buf[ALIGN((AD4695_MAX_CHANNELS + 2) * AD4695_MAX_CHANNEL_SIZE,
-		     sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	u16 buf[ALIGN((AD4695_MAX_CHANNELS + 1) * sizeof(u16),
+		      sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
 	u16 raw_data;
 	/* Commands to send for single conversion. */
 	u16 cnv_cmd;
@@ -660,9 +658,8 @@ static int ad4695_buffer_preenable(struct iio_dev *indio_dev)
 	iio_for_each_active_channel(indio_dev, bit) {
 		xfer = &st->buf_read_xfer[num_xfer];
 		xfer->bits_per_word = 16;
-		xfer->rx_buf = &st->buf[rx_buf_offset];
+		xfer->rx_buf = &st->buf[rx_buf_offset++];
 		xfer->len = 2;
-		rx_buf_offset += xfer->len;
 
 		if (bit == temp_chan_bit) {
 			temp_en = 1;

-- 
2.43.0


