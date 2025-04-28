Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A9AC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9tdKCqfhNi/JvvQ3LXajpm7vHRn6watP93o/+t4rnHA=; b=4O2AlswSVuY3yq
	dXquIRCiGqhlt1+rdloSjJw93BCRC+SW/S91rFF0q3V2ZtAmL22CQfaPhX86mUKoC8MLDZZgTgSNq
	Dd+/ylz594DH5jBGtNXtpVQqiLU08PMuEfX/ULXsLpACmK5iPBphMYV9OLDDGVmJEw2RyUmXvJ+2a
	lxvtviL0egFRuSzFd75ViOdJUlC6llhMCjHmkYF1ix4gZg2hZJgP6ua+Ji6rEg+ZfMvHdoMv7yyRE
	VLullT9+DpOSR+Uz5RKcOq9PHRBFIIgkppgJcleagx2SlzaiM77ZBCejGE6ZSBNvhFnEfTWTKqC21
	s+JXxjmkHyPxMkGtm8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V3H-00000007Sdn-3A5U;
	Mon, 28 Apr 2025 20:26:07 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V1I-00000007SCi-1BFy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:24:06 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3f9a7cbc8f1so1666998b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871843; x=1746476643; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tdKCqfhNi/JvvQ3LXajpm7vHRn6watP93o/+t4rnHA=;
        b=ACWaZMOLt4+wVcvl1r0OxWi+0Qw1meNJP83b+xxxE7NRG3+ppame7LVPjuCh1trquX
         GeA3TW69pWXzT/S3jUup/fxUw+JL0J6UjTNdUdSiYX9Gy2ItGX60S+ldG1390EszhJt/
         2Tdv93TT0Wch5BhwJCBaVOQleFfTC7GiCaI/8qHmrp/wE1AT5p1x3Vyc8undYAcZhucE
         eip11FQxqP2BeRVdwuQ5L3qorssVJfAHRi9o1IRW0nX+l5ZLxX1lB2EpRGCozZfZYj0L
         NrB/XdP7EmgoTivuBrqbhKRfC7Z3hdCGNxAlOEMf6ULW8LxqR8e5bVnXCKYeS5Xby16t
         wV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871843; x=1746476643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tdKCqfhNi/JvvQ3LXajpm7vHRn6watP93o/+t4rnHA=;
        b=EBpZBPHxkF8KvOqJhbqZasWTCx7uqIR21OIErnkJ8J3yBwM2zURsPZlzgcy8omhXQ7
         cYIHIcO+VOjDtC3d4HZQJoW3RSw4Rk2HlkKJ+MNgODc8+OklC/AOtb+i0fSs0A9o2Pfw
         625aXERHkp0Rgs4FNonzxkCVMN8l0LPCxBPdlMky3hQWG+1y23uMK+DZLkN/VuRtcsWc
         HFGx3k6PkJI405FVPK+gKPeIp/8ngQjUyi98XN/5A/RyPMwsdm26067V7Gk5CHLqOfgn
         NCMlbR0Wjesen3+TV968J5bSMCE8SyQ+avDltZ9Alz7hCY8echiIGH+pa47CUrbDvjZt
         gN2g==
X-Forwarded-Encrypted: i=1; AJvYcCWmiNeDQrqtOhvYJvU8WSwA1AtE0b6/+B46nqJVHEJ0GlvmZYy1JtB5Ah5QQMWGfuxv9u30uLdUiVhtVPiLSE7k@lists.infradead.org
X-Gm-Message-State: AOJu0YzCHcJ60m7ioW0v7AyF6YC+7y3P7WufeFRIUUEmN3TC/vIwu/7r
	KHfPS+Uk9c+KdBLidBiqVzIeC4rQJzHQJ8Z6idLIg4fqN9pz16C6dHJEQu0Z6Mc=
X-Gm-Gg: ASbGnctbCZ8TANP9izzu29G4S4idP6FgyEWJrrOPRN4xBkDzyR5Z+K8iGy3GUKMQc+4
	M+VA7Btlmm6CHkhYe6Zoz4F1I+n7gatzAuVWcQzCH/ntW5MK6FIzs6uHd3x7GO8kQCIEubE0Osk
	aCt9slV84vxLRRnAPPRJ4dAsHEGg/zYZSy9Cm8SaB/KuJ57oN0Da9yxvCcWOE5j/7y9GS13tkcz
	5H/EED45o3WPb9P8bQ1aB7YKcEx2qLXsLIClJmvESrOIB0J7OtukAK0NAaQ65rIvCJdLgfwM/Vd
	718+H7DtCYAkaWDt0FdVcYz26IOQIwL+0itHifx2iyfdmmU=
X-Google-Smtp-Source: AGHT+IF1EuPjn/DEf1QhC+aDlZPSIxSeXzD/o5izMSvjBsPrlYnTcW9R+2F3oqNl0RUDxTkvTw1Hfg==
X-Received: by 2002:a05:6808:45e8:b0:3f9:28b9:7013 with SMTP id 5614622812f47-402116321bdmr140283b6e.39.1745871842781;
        Mon, 28 Apr 2025 13:24:02 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v4 0/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Date: Mon, 28 Apr 2025 15:23:02 -0500
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbjD2gC/53NQW7CMBCF4asgr+vKHidx1FXvUaHIsWeakWiM7
 CSAUO6OwwpVbGD5v8X3riJjYszia3cVCRfOHMcS1cdO+MGNvyg5lBagoFaVbiVzlDxOKYbZ41Z
 dQH9wCbt+JsLUnXgauilLoNZaQza40IjCHRMSn+9XP/vSA+cppsv9edHb+sbJoqWSiMo34Ixxi
 r57dzlwn/DTxz+x/SzwYAO8YEOxDQXTVLb2VjVPbPNo1y/YptikIZDuiaBq/9nrut4ASKi+Y5s
 BAAA=
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3246; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=a8bJv4lOvUcgV41/KJzOF4OaGq1VqvfSWIwe6HuDGqE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+OqjReq+BhspuUVtz0EMsqRO/lA3U1zBWnP4
 ZDmhDleszeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/jqgAKCRDCzCAB/wGP
 wJ8ZB/0dhW1BDI5dhJvZZQbIpgkQVXzm3FHw7pEzQ4dLhe+9NyHNfV+/EvpQ02GLQZoBB3LMG26
 KPUin42QdiNYuFXDQ0G2WIVSQAXEpPU7gpIdKCKH+XECYH2eEG0byEGcvqVR//BBsxWnMyMT6ht
 6WGTgzJqMciiPE4RJrZ2iN4197LY3qvKppTRqh4tde/4eKKI5wcUQ+YSkuWsHPwm6sbgMZi/50s
 NplZKQIQJgrrP/5AyXbECJqkEvuQUy3QxA/h/bRYYwo2LT61TiYYCsGAaWro+il1pXb+WPTly19
 k3S/4+j0KA/nqaSvHpyqhAVj0FQsJtWPfJfOOGxk+/P+Qedq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_132404_591527_FCC800FB 
X-CRM114-Status: GOOD (  19.21  )
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
      iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
      iio: adc: ad4695: use u16 for buffer elements
      iio: adc: ad4695: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
      iio: adc: ad7380: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
      iio: adc: at91-sama5d2: use IIO_DECLARE_BUFFER_WITH_TS

 drivers/iio/accel/sca3300.c        | 18 ++----------------
 drivers/iio/adc/ad4695.c           | 16 ++++++----------
 drivers/iio/adc/ad7380.c           |  3 +--
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++-----------
 include/linux/iio/iio.h            | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+), 39 deletions(-)
---
base-commit: aff301f37e220970c2f301b5c65a8bfedf52058e
change-id: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


