Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7BEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=; b=kF0Yo5fzgPLt0bq+dzKncY75mk
	f6Bh+QtE1XIKxzx12YOsT4hzbOTWlX+3hyaoGwC3DJgx0Y/Uo5kwXxdRj14gAs7CIZ18p7OucCzBf
	SQns2qw+wA7/M/N8I3iW/QiQVsKADIOU4xoMWjUDbjKCg+/xrGEsGi06/WRimUMCPShg/6F/kBL3+
	qMD1t0r8GBxHbBS+yDliFNhCT7jK/4FGPUcDQlIKM6h4gPQIkubFE3wSAPn+V0zG6Ez7klrOj5dS9
	kR+xj72l5L2FCKx8T2dyToPDHDqwNDyAn/zmk7x98A+dssL+MEEnlCOm14U0WlDRYmS4RwQNsdSFo
	hn3LrLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QUY-00000000um0-0XDU;
	Fri, 25 Apr 2025 21:21:50 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QIo-00000000tGl-3EeQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:09:43 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-72c172f1de1so1699292a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 14:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745615382; x=1746220182; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=;
        b=B6PTME0CbgbfzOUVWduCFObDVM9uoJEOrE9YSJd8fx5NonN2aGBHFsEepEDOm0htLP
         +9agYxlZCvJR40eW+yLkm6+AtCoy1HLp/aHaQk/YhW2l2bS0hiQiW+nmhBLQAVFq6WoS
         cQ7b3nsqem8May9yWzozk7lrAiWmBAJYNou2GWLeNTb4iy3+mvTzWJDPkxJL/VkQXMc0
         VCj5zaIu+8Xabs7CE3v/G4PQDGg7lIdzEC4nZi97WUAtucW/j2rUYsC1bREKhxTfSI0R
         oeZf973Ug03ZqBP5Zxiw53YUjFj7840ojvNZPnRn8bI2d8EffwHE5WEO915Et4zgTQ19
         exLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615382; x=1746220182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=;
        b=km6j114Q+E2WapGe8wjFH5IZ78SkWmuN2llEgEmW2Sz2sB3g/6PtWg9vtc/f5hW/RM
         tQb1jDFXNi8nh6cCbM6ToXC3i0V6FspuTzZhv/pgrL6P+HkPHtcSELU4KoQ/TgMNM8i3
         qBiUorfBEB+tXSZrSPjxxtbJc/QPhmGCfuQxO3GyxwBf42xjF4BU/rUpQZDQ5LqMf4K6
         WMgA0mtDVgvlcCBkzeshv2tndoerOCouteDiLCIvvYMSLEFJRqxQD8YSy31UvvmWfR3T
         JbspDrEQeDInjAgDot/e9dIEum5YjrE+5XTnO2NuHqEZGlSF6mhh7heVGLYXP5Sa6gPL
         rlLw==
X-Forwarded-Encrypted: i=1; AJvYcCUMxxFhs8JQwnai1llXzwbyt+G9MipeRM3tbVuhTUDzyrGFnh+7YnOvW/O4ONSFrIVXw//W28PZotjMXonu68be@lists.infradead.org
X-Gm-Message-State: AOJu0YwYLIbxtHJvbm6m74hfMMNt6QXrf2Wn6jbNYMpb5/82schZ+mQe
	WzrKw+aY3FoIk/UeHW6OP1rap4MJ1qVIU3zhnPJ3bREd/oC0PgVihJgzPEY/zkA=
X-Gm-Gg: ASbGncszJEPoMadqTfIwG7Vl9x7qR6uNb8pM+YQ4iniZl7TaaKhFouFwvbbIOsVpG41
	40o7KY9ZB9NZd3W3JPHFveFSLuUhpwnpvdvhsXdqyWFnIkRCIvnLMaewrefUeixcUJbGfCBq5Ux
	HtycIBTg0+HNXsUm7b/di4Wrw0E262Aze8BulHdR1TDDlvg2eZQlZgpIeGD7WGGeeFXUCaC/fJ9
	wwlJTyCps0hXhiy6YIYijEmyEa49UXpShdmPZbQFp2Udrm3H0vKPJg9AX12gbsAt+zcHreL6T4P
	oXj6PjBdMQxVm9shYIFBRwxT65XvCdNTgjcWFDT1sh24
X-Google-Smtp-Source: AGHT+IFwss8X+LYquqRQKkNZMlIU9cSEM6k0mCA5Laa6xLd+BG1valjceigoU4pMW6TLwZRzhyDhZA==
X-Received: by 2002:a05:6830:3903:b0:72b:7d52:85b with SMTP id 46e09a7af769-7305c8c5f3bmr2177788a34.16.1745615381827;
        Fri, 25 Apr 2025 14:09:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f188052sm847673a34.8.2025.04.25.14.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 14:09:41 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 25 Apr 2025 16:08:46 -0500
Subject: [PATCH v3 4/6] iio: adc: ad7380: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-4-f12df1bff248@baylibre.com>
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
In-Reply-To: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Vr9wDkA3SNoSLT9FCnDYkBa0JumGawTzg2ZkCcTYUYM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoC/n7nD6/HmRUEekDdufnRBs06xB+EFaZcg9cW
 13ajpadrTqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAv5+wAKCRDCzCAB/wGP
 wGnMCAChmYyO/9wpFZGWSnd3q7aKAUh84O17VLdiX8nlnneXQRtE/XeKj3zCS3AC46VHYMEJIUG
 fmoVgWPPhlUvxtkOVVkjmYcNQlDXlumos56vpQ+W5cO/6ZwpuMeIlvTWa+02VyjECcwByliHBVk
 tzTCme1/iQJyUbYMafDFiMw+2xlofm37ALqOL8P4E7Ri5fHnYLcWkZ7+FMJZ+vdWwxl5udW9JVh
 py3CvafsBETqRBUyG8V/olwIXDZpyPcqV4MjVjqPNbnEygm8/gmk421rwh353l1oBd5YNo1svyL
 2OQF/zEycb4m9UL/L5UPiJWX85ICOf3+5MWsIgOvgDI2c7mC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_140942_810935_F8B35BFC 
X-CRM114-Status: GOOD (  12.97  )
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

Use IIO_DECLARE_DMA_BUFFER_WITH_TS() to declare the buffer that gets
used with iio_push_to_buffers_with_ts(). This makes the code a bit
easier to read and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

As discussed in v1, this one stays u8 because it is used with both 16
and 32-bit word sizes.

v3 changes:
* Use IIO_DECLARE_DMA_BUFFER_WITH_TS() and drop __align()

v2 changes:
* None (but I messed up and there was supposed to be a change).
---
 drivers/iio/adc/ad7380.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index f93e6c67766aa89b18c1a7dec02ae8912f65261c..ed5e43c8c84cfcc9c4ce1866659a05787c1d6f5e 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -909,8 +909,7 @@ struct ad7380_state {
 	 * Make the buffer large enough for MAX_NUM_CHANNELS 32-bit samples and
 	 * one 64-bit aligned 64-bit timestamp.
 	 */
-	u8 scan_data[ALIGN(MAX_NUM_CHANNELS * sizeof(u32), sizeof(s64))
-			   + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * sizeof(u32));
 	/* buffers for reading/writing registers */
 	u16 tx;
 	u16 rx;

-- 
2.43.0


