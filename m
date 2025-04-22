Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AE1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=; b=oWZWmP4XYDguG+FluOtolFos6F
	VjCa0wiMGTaxZIl8Fch8d9e7Cs1eYMtJHkU+CeMI72DbIZyAMN9UnZeeExu2BEhDns32N1+oANw5o
	RQRI9aFtW9L1KNP0+RWeqH7l1EgmB8+JZG6MlMAqwYcGU9jioSuvzYHzJ72my8qcoF1com/5dfBeC
	P6Ez8cKkCEQQuc4qLZhLTvU5S51EEcY/YiCtGjJV+tzXfuGh9VFVdF9oxnb9aZ0YYoICVrJ4tBr1x
	HKwUhWpe8A5yF8TBXYe6TofALLENq2jV9QEfsmHVwNOaw4KyylLSTQsAFcEpTXdZNNHUu49KeP0je
	OIZhyxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Lx2-00000008h9p-1FMC;
	Tue, 22 Apr 2025 22:18:48 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LnL-00000008fo3-0bEb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:08:48 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-727388e8f6cso3392701a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745359726; x=1745964526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=;
        b=2/ixDkx0YJPkWaFvA8Rm1BEHJjjDNICenUDuy2vfQDclVJdfyThZVzV1/5Bt0/VoFc
         zgqEivDD75+YlvFyYxjUVNaLJ+mWeTyOPCuKoIEZWd8zufZGwap7dG0Dfz3kVTiKy1Ef
         tXRB7n4jlcnoPXYf2xbLPh8LKZe22LzcTRxZO1zfB1rrv6sLOPAwDRcvAvqbkz7hwLqk
         YEFlGbIP8bmbAHaiXbq38wDObuNY5WlYDdA4ncjHUgcF0mmkyN2gDtYuhyZp/8Nci7si
         XhUbWsuW4jhfo1WaKfwFkqs1aUZGuk8djF/GULKgJPqePJdGpLRG6L9tgxXFWWGDpxsY
         2DYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359726; x=1745964526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=;
        b=rZK4JLw9XfA0k8e+Vsdi7/jac91pz5t62CMLEqIKzIxB5onTjPtTdCBDNCM4iTbNre
         lkUJzCgaXZlYEJyGBSV1VU88zjdWrvm/DwWSCmqyE+025Owoo4T12kW/3zFF/81dCpNn
         yZq5AyWAxzNDMJxf53b5LwxEeOdCegEGnAK/ut5QqkfhgniWQ4pKCL7UimqX4nzpRrWU
         cE8GDKXmrQkX+EzJVzy6mdN9HN60drILzUg3N+c42PrnetHOLVq9utXuKO5LkN2n5lWX
         gONVSMsIaz78WpNl/LPivgP6jgj+ZU+Ppwvd5dnEmCabWr84ACbp0FP0KwDhtS7anlB/
         0qqg==
X-Forwarded-Encrypted: i=1; AJvYcCU52owNkSZ3gqJiqKBD6WjnblaxgPPmKQ2t1SgODMLFrFUZwbOcJQeh5MkmmlsgURfwBK48YLxQHyrrDlEB95Lj@lists.infradead.org
X-Gm-Message-State: AOJu0YwMiA9tSRz86LSmWl49Hgw/uBaCgf/Hnfy4WRVMiURoxhqC+HRM
	yX0QL8M0dlEL65UMg8Gzf2XmaXgBHF+RnEeJuIoJIufWFQACmUGja9PPbmMkeVQ=
X-Gm-Gg: ASbGncsdVE8JFZLvKRydJgis+AcN4o4PBCofGzHK/mQSt+zTRlelGeM395ZHYEAlvFI
	aUr45PfcM+5OeW1SgqfmH4HP+HJBcxcRzrKHQSqX+G90dymcSEqEOc8ZD7HJvYkhDmx9kKsSXJN
	L5x8l77sEd1y4benABqzFhyGum6K/SzY60dToeHqT66IKCKvQ8ovVlC4KCYuhmvRyM2Eh1LfLGK
	55bCgI4ab+zC3J/+7lr5pZFp8dHDk4zyWBr4boy32Ui3gvqqYkttDbICT0PIaXNOwAiQMDXvixi
	E6gFCJfmos1xG36ETsbBFRJ2AwgbH89U63SQRTUsizphXZk=
X-Google-Smtp-Source: AGHT+IGFNJO8mza9AqNofho5qSYBgvNp+Om7GG3O2Gt9GY/65S+lLd+LZcwXnwmwWqXB1V0j4m9iVw==
X-Received: by 2002:a05:6830:d89:b0:72b:f997:19c4 with SMTP id 46e09a7af769-7300633746bmr10719999a34.26.1745359726102;
        Tue, 22 Apr 2025 15:08:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730048848dfsm2265938a34.52.2025.04.22.15.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:08:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 22 Apr 2025 17:07:47 -0500
Subject: [PATCH v2 2/6] iio: adc: ad4695: use u16 for buffer elements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-2-3fd36475c706@baylibre.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
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
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoCBNEF8NBH0RqMMLTfdFHjCNvkxbyizvXzbZOT
 2HLvY2UrbKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAgTRAAKCRDCzCAB/wGP
 wNwyB/9rs4fiIS3OMnMGfruRlEWMmXyGhafV1CQnLWK3hgPBA4IaLbeHMxHscn+SRfkt3I9izF8
 Q8UWmSNooqT9zexYI/fpo7YhisDh9lWY91+Ru9+btIYsKwdZ7kI/4NpprLyDDqaKFr7AqtqjnAz
 fRhs7v0HUAi+Kq8sxshNAPdN5DcjIfOZ2szwGmrhNZl/b7x7Cse+4Y4TNXucPW2SPhYF7SKl1n/
 xBRPIVI+pDMV6g++uaysZeJ3AwhAQ+ZLI1YUL9U+jp2I5sx01IUB+XuF8Kl6WEq/rXhiFJ2CN/c
 7fjUlT4VnU7YwQrTrN7oOxOA/VPZfoMIoRPGRuzDsIUhOdJ5
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_150847_183411_5D4632DB 
X-CRM114-Status: GOOD (  17.06  )
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


