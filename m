Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AADC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 20:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ea7uCdhGnEj8qcXLckX/RL8NIFSONfFcF7ytuzsLJww=; b=xHTbjOSuby206G
	MGur67HAasYMppXjjWUm/82YVQjWtCyfljhDHVUySn2BCCTjEHXrGPTLjqjw3YvH4dqHyjOnt7CsA
	b6cO/LMWgfQj3B0lUUC+KT8h7mzpMgVk3oqygM+TSiHiYugdthlg68sxIdfIYgWnFw5Wrsr86SKXm
	Q2N/pSW6FsQ8nmxI23DNijMFoez39chwzt6JZr7DrUMPbBIXj8Uh52U+wj8ENWoU2dzFVf/UzYa0f
	dSowJga+EECTM07YFUGs/FUMBq9PIU3NdfjhM6fbLUyutNsaAuyrLqZWBmnSu3qLl5VpwSD1liesY
	N7YtGqW0SRMHo8Jx0Z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClk1-0000000GjPa-3F0X;
	Wed, 07 May 2025 20:51:45 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClcN-0000000Gi1x-06fV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 20:43:52 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-86135af1045so22648939f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 13:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746650630; x=1747255430; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ea7uCdhGnEj8qcXLckX/RL8NIFSONfFcF7ytuzsLJww=;
        b=HvB5q9xLxPYPqjypnf/B5cNjhsbox09TNP6kLMPEHGMaqDbLFUNCgvVBhfig0nz7YA
         1WkrHNj2GWUJ1Ez/ZcnW9cB3UD8H52sNcRAERvhWLsGfPLN0bdlWED+6MVqbA+nNfv+e
         GtlWgEF/0unNIlyZDXPIUbXeYy/rLQ2iMD1p+MooY5KjfD+iUtr+mbws6emjflbnYYL3
         ySJi0tEl4cIKGvT5wtE9KKmJnx0+5CnaS8Yn/eMVJfRjXa0XZtQuuqR3kWA2RVQP8Vhd
         RuuJq/yy1S1MijXi1PmiP/IkUdfuLk8cUmkujI1VVke50hVLTAEkO5DTbYFoiZFIG81Y
         /vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650630; x=1747255430;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ea7uCdhGnEj8qcXLckX/RL8NIFSONfFcF7ytuzsLJww=;
        b=LUQuNKLWGlLR1dZmi0Wm9jcW3CyjUE5q94ZDXrVL6vxKoF+pvXkdkwuHKuIZ7aSC2C
         of2Smg/rKGpo+srYeej+IqOx9AI+ubZIru5paMqvN9MYj91WxdRealAzIdxPl84lWnBx
         BaUaZIi7uq+Xq8SxSWxs0EElZtbkXKVuKxcwqcvZzNozapdS8fr5fxiavwfhd+kmLc3E
         /JBeRTIf2b9dgBjcIl80YyGuQQwOWb8Gzo5Hi01K6YgI7um8u21B7Rq5qOwoqwnCjFE/
         oMyRE+s86OnAvnIkRa9u7hmXzBi3J+0lCwzbO6HZ99ZOolQmsIE47ldpBr+gXAx84Pgq
         CLVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgnlOVoxj/WMjGMJXksAjFlDmoP238IclpUS650GrfTOHMH84CMvNYk+xUYqroBXekXjSr/C9pK5JxKSPWvj0V@lists.infradead.org
X-Gm-Message-State: AOJu0YxAKESzq3JXfXmdEe+JPWkE++BlwjqQOmCOmi7lkuworj07r3Ty
	4Z/WIxADD3rxCpMESf4h1MdR1SAr7zj+tPsa37NpdjHskV16hbtU2UNbbjdYZpJKgaH4nZEEofy
	s
X-Gm-Gg: ASbGncttoBzv7tCi19W8fhpcyA3kv+xhMf+PKkC7q/gefZFebkDB/zZb/Iud4nI298m
	VuoPTdDiWZtgrhVejQ62n2QJ00gbqd/s2dPaYqFNYkyshL+DsBXvY3NZ0lyXMjjIADGhjWJmmU7
	OAzvwmN1KID0FE0YndLchBgdo4yjvO0jJctohWJd1QewJwriAzxkoDv/ALr4x+Ypn8LovMLznN+
	s0K3is74tJIh+2YIuWXdq7rvpRlDdMbvq5AM3PfOXp5I78iirZzCQ05MDC/zBCF1p173JRQyohs
	g7rME5EZJTyjsxeo6AzaQl1wxryVnpjgoB8ZfArKoMC6Xg==
X-Google-Smtp-Source: AGHT+IHOWRSdg3a/2AZGQ7l833TO2pNrBV9BWQuruB0TiAOKL0pY4WL4XdsmCG0EFCkuCjZMiTzKKw==
X-Received: by 2002:a05:6870:8895:b0:288:2906:6882 with SMTP id 586e51a60fabf-2db818b658amr766018fac.29.1746650619421;
        Wed, 07 May 2025 13:43:39 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5cd716d3sm898642fac.21.2025.05.07.13.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:43:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v6 0/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Date: Wed, 07 May 2025 15:42:39 -0500
Message-Id: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/FG2gC/53QzWrEIBSG4VsZXNeiR6Ohq95HKcGfcxphGgeTS
 TsMufea2TSUbFJcvWfxfOCdjVgSjuzldGcF5zSmPNQwTycWejd8IE+xNgMBjdCy5Sllnoap5Hg
 NuFYXMZxdwc5fibB0X2nqu2nkQK21imx00bDKXQpS+n5Mvb3X7tM45XJ7LM9yvf5jZJZccEQRD
 DilnKBX727n5As+h/zJ1p0ZNjbAARuqrSgqo20TrDA7ttrazQFbVZskRJKeCHS7Y+utfeRPdLU
 NWTISDMngd+zm167vgN1Uu5XaW/AyOFR/7GVZfgDiAqsJUwIAAA==
X-Change-ID: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3770; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Lg4SA4pn1vW9GdQo7AmI2OXd4PURSfvMzZplZ0zuKts=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoG8XFf7OJQjk4XzTL7Gi/BDJ4Zxv9Du5DjtNat
 5HHapaBrt+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBvFxQAKCRDCzCAB/wGP
 wPp2B/45XuzuB8PxMSO68COi3/YnHDlzMOyQdiruBMJdAoTO+6qXwmD/hAE1+WC+GnrpCHoNjh1
 hY8J/XDoIAKlv16uFNH7AOCMLmM0HaTGUcSlPL7V4Fp4xhvO7VJIlQ1Vfp46VvpAQQYjorP7Aek
 RHeL1klVqL7nhkHYrBgKW75GKALooI50FD7YJcBm5EtUJYSzVQDVX2bwU1AjYf6EnNa2Rd3jX2v
 Mo+H58YCX+O9oCx/T0xzGk3ppy9T5ZznHe+2XM2Uvr63GVgxHDPIkwvcX1JR+dXOXlQJsn64qx4
 jIYvhcSoHwAB4Kye7yND7rdWEFvGR1JsS56ueH1iw5YV21dv
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_134351_083139_E47D1DE3 
X-CRM114-Status: GOOD (  20.06  )
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

Creating a buffer of the proper size and correct alignment for use with
iio_push_to_buffers_with_ts() is commonly used and not easy to get
right (as seen by a number of recent fixes on the mailing list).

In general, we prefer to use this pattern for creating such buffers:

struct {
    u16 data[2];
    aligned_s64 timestamp;
} buffer;

However, there are many cases where a driver may have a large number of
channels that can be optionally enabled or disabled in a scan or the
driver might support a range of chips that have different numbers of
channels or different storage sizes for the data. In these cases, the
timestamp may not always be at the same place relative to the data. To
handle these, we allocate a buffer large enough for the largest possible
case and don't care exactly where the timestamp ends up in the buffer.

For these cases, we propose to introduce new macros to make it easier
it easier for both the authors to get it right and for readers of the
code to not have to do all of the math to verify that it is correct.

I have just included a few examples of drivers that can make use of this
new macro, but there are dozens more.

---
Changes in v6:
- Rework IIO_DMA_MINALIGN to work around clang compiler issue.
- Link to v5: https://lore.kernel.org/r/20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com

Changes in v5:
- Add new patch to set minimum alignment to 8 for IIO_DMA_MINALIGN.
- Adjust IIO_DECLARE_DMA_BUFFER_WITH_TS() macro for above change.
- Drop one ad4695 patch that was already applied.
- Link to v4: https://lore.kernel.org/r/20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com

Changes in v4:
- Dropped static_assert()s from the first patch.
- Handle case when IIO_DMA_MINALIGN < sizeof(timestamp).
- Added one more patch for ad4695 to rename a confusing macro.
- Link to v3: https://lore.kernel.org/r/20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com

Changes in v3:
- Fixed a few mistakes, style issues and incorporate other feedback (see
  individual commit message changelogs for details).
- Link to v2: https://lore.kernel.org/r/20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com

Changes in v2:
- Add 2nd macro for case where we need DMA alignment.
- Add new patch for ad4695 to convert buffer from u8 to u16 before
  making use of the new macro.
- Drop the bmp280 patch since it was determined to have a better
  alternative not using these macros.
- Add a few more examples to show the non-DMA case, both in a struct and
  stack allocated.
- Link to v1: https://lore.kernel.org/r/20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com

---
David Lechner (7):
      iio: make IIO_DMA_MINALIGN minimum of 8 bytes
      iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
      iio: adc: ad4695: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
      iio: adc: ad7380: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
      iio: adc: at91-sama5d2: use IIO_DECLARE_BUFFER_WITH_TS

 drivers/iio/accel/sca3300.c        | 18 ++---------------
 drivers/iio/adc/ad4695.c           | 11 +++++-----
 drivers/iio/adc/ad7380.c           |  3 +--
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++----------
 include/linux/iio/iio.h            | 41 +++++++++++++++++++++++++++++++++++++-
 5 files changed, 50 insertions(+), 36 deletions(-)
---
base-commit: 7e9a82ab5b861d3c33c99a22c1245a5b262ee502
change-id: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


