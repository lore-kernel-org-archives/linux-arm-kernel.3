Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A55AC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 20:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M71PJ7VtKfkJnKGztH25+j4j9U1WKWdC9Y0jHLrJYIc=; b=NfZ1fFzkiS4xJOFYIi0P3Urs9T
	hVJ0JsHA8yua5IFcTuWa1Bx2UwkAaeIks8eFqhfbM7A8qlrLDeq0AvWrfonWB6LFeB2k2S7UJVmkf
	TSQjugAcmx1V+vf/wAdqWJLg18YGwjuW9FYfO2FBN9aU2YCaVj3VaFAe64WIbH7HNhOi374PRdTSQ
	OJ1upZW5lSqEPeV7zSigWWhpzzHNvJxJymGux2cq1tOuKND+yhZLk6HDTD4mVH3SoFgfWQU8AUOV0
	4qmDxd7t5eJvBx9kFEan24hC1AffF/x/KsoxlBABIX4lbNA4i2dq6oWC/8jeOjCkaOwp7uqVvmUzd
	ggWFdS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCli6-0000000GizP-06ZH;
	Wed, 07 May 2025 20:49:46 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClcI-0000000Gi0h-2Wu0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 20:43:47 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2c7e5f7f0e3so140671fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746650625; x=1747255425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M71PJ7VtKfkJnKGztH25+j4j9U1WKWdC9Y0jHLrJYIc=;
        b=YgpUyn9MPaqWCZH/TfOBCBz0MfrT2Y0j+FHoGKmAVTbXLiPJ1JiEIfwZhQJwR629Q7
         5CT2RFpKJ2Y5E28GNIQPCgTsIEgVQZJvmEflIzwwALqlIkp+ISoE/9GGXUr8QqhZlHI+
         iuhYVUx4PBqbMC50kJuZCXJd3zENWG6wQtTuSnlu74fDcs1Q+E0mqn2Ld65tjyaMyhtf
         k/LlSJ7Aa8v2YYQrl7WvU9R64TTz3tAzP2oVzjeLHK8q3C4B4hd/xvCKV8Q4BNNfTo6p
         9rdBUOCLl96mRSPqZwCfDRTtmvdOXt+jygJmvijvF0uYpVKneMgsfX6zhjJwK3Abp2EY
         9OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650625; x=1747255425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M71PJ7VtKfkJnKGztH25+j4j9U1WKWdC9Y0jHLrJYIc=;
        b=EvvoOmEfYN5tcGGZPxh0eDl6SjOmK5Y05P+ab2oCxC02rWCGjBcKS/7Z8AAxAjkNlJ
         1RDMt4O+dUfpk/XmXQmNtplcf0XAOWgl992k+QRxEGU2rzuxpjqwHhMoBDDMd9aUoH3F
         /wa2R9TrdBWQCwvyWVgcT9bFzmtS/f3HyfGls3XvpCAZMWKXmNE84RYQgq1G7eSuyGNp
         UGLVhMLnB19i/hX3nPbXksxtyi7pYtwiVVgdqbx+3H6NG8CWi6aQ1BvyU9XRRnVxKYJp
         alyn4cPvlw6QKNhHEsM8vM6l5onwvrKnYSWpkEeNceMUUKuRD7Q2+yms9gbAYzoZ8mXq
         IAyw==
X-Forwarded-Encrypted: i=1; AJvYcCX2PRaKaVPeUswUOKUrDAlJZ5hywV2OxEhxRmFzt5hICYCsKWOxnp7ia/y4ElRyGcap+qD2a+pe7QoAbD7njYOv@lists.infradead.org
X-Gm-Message-State: AOJu0Yybx6Ht5B5IzvhDRy7QUn3Dvx9eIRIsZxAmWLGDTI5TjaUkyhud
	AR1kIWP1AI5jiVgtyZwtQT9lcIhBW+vAmkZmIa8LT6OvF8YA/QTUbZonExiOYgc=
X-Gm-Gg: ASbGncvKRWW/R9SGdrjuCv358u39JM9Qf1WUdNQY1uOewgN0jgjS0DknDuBh0fyeUWt
	KXu/z6z85Z/Fn65opZW4cyk78CktdzBlfEBf8HJX9zBY1z1zEL4asjcrPWEkPAz1m3VrFvd34xH
	58JF2n7VatyKcEn+KW3GvOrz78M84RGEhI62DvuRSQ9yANYNUIu7W1bSr2q+CneyUDpAxllUqTx
	XKMn0UoTR+xg2hT95ytyuSI8VpdYVPL2Qb/FwiBoEDn+HoYQ+kGmjIyVOxDNk8koddngKQeqw5h
	i4NGay/F+VY4ym7JTMDLawqdUnqGhdRQA1W4eSkHHGb0Ug==
X-Google-Smtp-Source: AGHT+IGS5PMAI+KEXQKldp5GePhVTN6wjk/dkrFbe+bPctRj3wkBCKD/uHIlHK8DVJazvFjRCYZKIg==
X-Received: by 2002:a05:6870:5246:b0:297:2376:9b17 with SMTP id 586e51a60fabf-2db5beb9803mr2860430fac.19.1746650625566;
        Wed, 07 May 2025 13:43:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5cd716d3sm898642fac.21.2025.05.07.13.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:43:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 07 May 2025 15:42:43 -0500
Subject: [PATCH v6 4/7] iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-4-4aee1b9f1b89@baylibre.com>
References: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
In-Reply-To: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=dYl7QDWnMJdjHkS6Trycc+ojlEKZD6od1/EKbXvOHQU=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoG8XfmG4GSRwHhO4k5Xnu6UTAM2KXs49zHopNQ
 MTp8SUZxyyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBvF3wAKCRDCzCAB/wGP
 wNJcB/0U6S29hjeNRGS09dG5ez/9bJJ40VCUhk8q3UOeKsPlTU/w1YytSw5Bw0w3EuHvaAAVdY/
 gUggcI4EcAp4Vt/4nxknyAoo202s77qiFZwB2q6rwdgpR3YwlJ3fidz/Dl6QFKRvPJZeJgnIIx4
 ilCsxvPKWwarTrp6o+clsBtp2xGc+IdrNGVTYL3N1SvtGiFALJjgEisiBnbDLn0s+2IWrLUs7ps
 DAD8ETakvbGbS7FOWb62oo2+13gwy3dBGAxQ2T/MRIXitJtS8HCowyXnab/3q3eri21ahmZxOiw
 fDjLxjf/0RkLfl+iCqiN4eiAQgVsfvQYX1RXPnIg+fhZErPr
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_134346_640577_FA9687B2 
X-CRM114-Status: GOOD (  14.08  )
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

Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
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


