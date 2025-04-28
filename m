Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575EDC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcGVfBKy10j7lIsh3ZFh6lbZwRCfi9c6uNEy2I7W1UA=; b=e9AXtmg3loK/aISx79pSjdp8Ct
	NDzIPN2WJTZSyoL1FApFosMb2y9d4L2YXM9mIN+WRflKruM0dmZvNup2BGu2rTsvBNXDq9Lpmu8He
	T/OZ8bxtauImPneJITi4JSmC6syRmXJanh4yf8+QhTu9YNzLuMhBsvjuLGu0dehjcUL8O3kom90li
	3jcSv9VIzlBpgpkfFqpq8KxcpFU7RRFmlmocgUZ8tKzzphD2l+BvlioxYxS3F3rBxGXHHUNCSr3jT
	3IPWcKJvWNPWGj/U7AdTY339VZfr15TnQXSAJLrmaRMLTDHIBQAq+qRntoesNak21p1LnYub6zbyD
	pV9nkDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VB3-00000007U7n-2kVl;
	Mon, 28 Apr 2025 20:34:09 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V1Q-00000007SGm-1Q3k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:24:13 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3feaedb4085so3688273b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871851; x=1746476651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcGVfBKy10j7lIsh3ZFh6lbZwRCfi9c6uNEy2I7W1UA=;
        b=FcIiNYVgXLVTbm0ME/Q64oijKaAatCJc5n0UrccQWnqqAcGhcpDRqUdINxQuIRbG23
         HHqvzPIhg8y7cigmAZL333URmj4DtPLBQ1TMaLIGetr0PYYewJFu7tzWgMp4qTtgEetA
         04jC5Ro862aCKwQ0oO11arQM7Gis56y3DGAowXVFJ4wj8i5BTYcVfKlBiu3dcnHB/k3Z
         3E8KvTNGNE5qIl6NLZNcmAgx5hfpXewj1h2tLD0iRD4GDys1xkfBuKE9ID2Ddf9HIj94
         eFY3V6kty9P22QjbKYBS3aYaQ7A8P6U+Zi0vh3s13f+7crPp9Z3KYpeUrk8oVSr6h7Zk
         Dwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871851; x=1746476651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcGVfBKy10j7lIsh3ZFh6lbZwRCfi9c6uNEy2I7W1UA=;
        b=uQZvhftCZIMRWuPDkNAbr5HA/LgsYmqqfuk2Ku056M6RymmhdjmhOE+amWErk8HwkP
         GzNRWXbR0C83wYZcLbVY2Ocy4WPltSOtajff7W+DeT7FRm0u8+0RwwK8CdHi1zzYyJs4
         /r7pb5uAaAmBvNvXCZc8ey/p84xMoD4aetYlloFjf7ocnSpRObQvNrtTIEoNWaRgzj5A
         3HRdxuQ5r9PVjU/rnMijCsHhYmcG180Gw8zOfOr4zestDdOHO26viHTyDZJu1aoQ6MsN
         IUZcohnT/ck/iXFxY71KcjotHhQXpsMCDHRBmRCiJnxZej0bJCPycOGnJYL8bvEW8KlF
         31Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVgBjSgCnWa8IBnkWayF8je5eIAhl/rEn+SWutwbdgpireu8Kkoy0EjxGQDB35kvE+OjZI7JTjRqeV4955EqpjB@lists.infradead.org
X-Gm-Message-State: AOJu0YzU3FQ8cy1tNr5ltQsu2EoJAhgn7MNkaLwwRGSKSLmtf8ZIUAMI
	/I6UU4xHqlMOtMViJGrSrv/uGjYwxwtoZKHF9NBYw0zEoKqOuFM/dXOS1JW1uyY=
X-Gm-Gg: ASbGncu8a2jgzIS8+48idbrWR2rG8013cgXM3d5B2xsgWNWVowEhEONIXAovyaahQfM
	NC4X4RUYRjiPWdCXuGcb5PdfO6XvE1WOFX3W2H7lwBltckNfHCHccSPC6nm7PnPzT7SFCNhGcqG
	k4rLUCAV89H9kuUJbc4sVALDCLWU7nh2yzrJojvO3+5ZZR/S1mMZFXv1s5XI3vwBzAF8vrM/vRE
	y/tA/TE1wMt3kcAJdzjgjf+ZjQ3REstVAmDDgbC7DK/nlZZKIBK/Z2mkbo4RZK1vX3F5P+hU12d
	TJb8uL7/tyOAMlewoEYKzxcHxjorT3XsYVLDQ1THvJchmkY=
X-Google-Smtp-Source: AGHT+IEb+KKxDX5mBvLXoNVemqhE3XcX7CF3Y6nuncxEYl228EfBM3oiBSyxB3e3mBnNUjlF+VK9ZA==
X-Received: by 2002:a05:6808:1649:b0:3f9:c0f6:2163 with SMTP id 5614622812f47-40211563838mr157747b6e.12.1745871851251;
        Mon, 28 Apr 2025 13:24:11 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:06 -0500
Subject: [PATCH v4 4/7] iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-4-6f7f6126f1cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=nanWm12O8sWEDAW7A9yQbxbSGH+6NrUboS0jgt5GWKA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+PFy0bVmPGBbjG6xCEDLcT/qRJBTQFi0pLJm
 ThYX0Otc9iJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/jxQAKCRDCzCAB/wGP
 wNKJB/9Vu1Hc/echPMZS5/e8T2LKm5suaZENLfRduq8jeTJvcZFBSsRBKspHIEWX8Ym9s+sT5M+
 L8HvpP4kDkzsdAuuyIituDXw6GUBw3yVBo2hFjMg3HyWSmw1XqGfF0RxBYNH2s479Q4FO4myQlI
 jIuupvmNum/EB7umVxyFyiL7MbGJjQfSkNt31O4lKqo5fmpuuNyqGkFj5OcdBw7x8KFLAOe5IEz
 inhZgvoB4krefxIHtMDvXiqJHy9V/U7FDW9E7lFs1+PEGCNXetM8bzc/JwXfU0MBmlUPSlL6nih
 hiDeS3XeNJaxEjX9lrUXiYfu8AqdntMb5hO+ixArISTEiHGi
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_132412_382717_DCA803AE 
X-CRM114-Status: GOOD (  14.32  )
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

Rename AD4695_MAX_CHANNELS to AD4695_MAX_VIN_CHANNELS. It has been a
point of confusion that this macro is only the voltage input channels
and not all channels.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4695.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index 992abf6c63b51dee222caf624e172455fb9b9900..cda419638d9a88debb3501d05a513b17a4ecde95 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -105,7 +105,7 @@
 #define AD4695_REG_ACCESS_SCLK_HZ	(10 * MEGA)
 
 /* Max number of voltage input channels. */
-#define AD4695_MAX_CHANNELS		16
+#define AD4695_MAX_VIN_CHANNELS		16
 
 enum ad4695_in_pair {
 	AD4695_IN_PAIR_REFGND,
@@ -143,8 +143,8 @@ struct ad4695_state {
 	/* offload also requires separate gpio to manually control CNV */
 	struct gpio_desc *cnv_gpio;
 	/* voltages channels plus temperature and timestamp */
-	struct iio_chan_spec iio_chan[AD4695_MAX_CHANNELS + 2];
-	struct ad4695_channel_config channels_cfg[AD4695_MAX_CHANNELS];
+	struct iio_chan_spec iio_chan[AD4695_MAX_VIN_CHANNELS + 2];
+	struct ad4695_channel_config channels_cfg[AD4695_MAX_VIN_CHANNELS];
 	const struct ad4695_chip_info *chip_info;
 	int sample_freq_range[3];
 	/* Reference voltage. */
@@ -157,10 +157,10 @@ struct ad4695_state {
 	 * to control CS and add a delay between the last SCLK and next
 	 * CNV rising edges.
 	 */
-	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
+	struct spi_transfer buf_read_xfer[AD4695_MAX_VIN_CHANNELS * 2 + 3];
 	struct spi_message buf_read_msg;
 	/* Raw conversion data received. */
-	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_CHANNELS + 1);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_VIN_CHANNELS + 1);
 	u16 raw_data;
 	/* Commands to send for single conversion. */
 	u16 cnv_cmd;

-- 
2.43.0


