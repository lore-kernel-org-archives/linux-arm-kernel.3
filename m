Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32CBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VpoMnDgu+7UC7RtrUCDJGErjf4myIlSL18Se8Lkjx+0=; b=CvdwypvOK8UnAM
	H7d+oV/1xxz4CYF4eXK2Z+ZHUbgFCLn4bgOl/bwkX8oBZMY+bWMZ5W9eyDjmUvpHpmhwaXug4jt9Z
	PEux+Lk020r155kgivagAM5+bYOmTnltUKvXoyW5KIweOh1xh9f7wP+kjdeZj/6GBeafd+y0epD17
	MFFW1cGFpOdNMX96UrSJrGbKwCJdD8vyhvfKfjVNm8GvRl5VULKjZo+Ve/ZQP0vtubtr857EnUY2V
	nC7lkniaK66TTP2Q64RCFmZKvsSBBKodklROWm3I3D3hKxsKkp/WqBXqaEoMRc35CfmBGsdl1Bn5a
	xA0HvuNRK2GQT3QkdWMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QND-00000000u0h-1Xe4;
	Fri, 25 Apr 2025 21:14:15 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QIl-00000000tFU-00vt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:09:41 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2c7f876b321so807856fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 14:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745615377; x=1746220177; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VpoMnDgu+7UC7RtrUCDJGErjf4myIlSL18Se8Lkjx+0=;
        b=eqPc+8ZB+4cT0qk+ehdfVW7zHr6gc3x3DCUTTz1f30t9cYhej45Vk7epIgqHXzy9YS
         o0cR36gfteYYI73PB5OKfX2gyB6WqNKum0Uynjh2rawhTGficOukSgvzUkH0j/NvWv5y
         ul26yzXZbE8g/kW2He9iO6EfFXLHvM+37ImLeHAzCgiKbsqMDLLmpGfMs4ONqCR7ZhMb
         v7QYkhni9qLK4yTqlrowcJc6xe1jP8SaSaMi+bD4om3LHmThoNtJss3jE1vRT+00iWM6
         GnGL29Im+/K5zZoGNPF1elx0trohPLUfxWwIIRefFYl/GDUk2ZitCRRqn/Ph/4LCo9w9
         Q9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615377; x=1746220177;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpoMnDgu+7UC7RtrUCDJGErjf4myIlSL18Se8Lkjx+0=;
        b=obhjUv15uvBzttGLqx8COMJCeuv4ll51vYX2i5X/3qaDqHYUanXhtroqzsfwvwmCjm
         E7l6wgXrzYd4/6Ww2UXC+Ld/LYLN+PWQxDiZx5rCNe9j6ZXIV0tLtsVpE9UDtO+WJ8nJ
         GGnVsLTFC5P0jvrtl/m7XoMbecdo7/totgRSCfe8gl2htA2Gfew0fIKTOlvHAColcm9B
         7WXBcK3SLOPvgFAM8HjX0/pfN9/AQG73ITM9k+NqjyOk6AkVBxA14v9Z7cDusvWMYP2F
         q+IjlhqJ9bu8UzkXVKW4IV0BMoIQVONDR1NJTsBRu6f/pVzaTzOUUuLX/YcMKHts66OJ
         Sb4A==
X-Forwarded-Encrypted: i=1; AJvYcCUHgqayddWsabgvMEVNgrAzDaTsHr2VUslk9y0tY+CJDxqEPMMxOkSSu8xlIUaeB08hTpvW83LnopeMjtJ4PqXS@lists.infradead.org
X-Gm-Message-State: AOJu0YyOa6ivpOss8oVe1bgvk2lIRHck+GLz+pz/n7456RmgAYO6rNKU
	RbRH7HWmYZXn3CsCLzM3IJwlepU5Ano3eNiZp3O0WX0nriIgp8JLnWRCNcLHpek=
X-Gm-Gg: ASbGnctcLv0QAWG4zC2YI5/TTmB7gFJNh2wbqwTTH9y4XBcSVjCvRTXKN0gSj+XYP/L
	J194KuY3LbdUaa8JhqS8gGcAtuuRLtIktVTNdTV9OOKQGgxFQNSsRS6A7jhMX1apzewzb21E/Ol
	DRJvbCSUkfC8Hse1rIUAl4+LxtzDNeHQkQeb6v4K4vfcsa8YopFcUBEhVMFKv4Q2yzdXW1S/gBo
	LPc+ApNR7DATxPEM3g6SJnq3/uiSIHmLxQ/seHqJSoRa1McGsc+VABy6nfxmr9A2ziWz1C2/UeE
	Q37GOEn4k8oOYlSBvdCwRD2YHfuZXxjW4bTu334f20kn
X-Google-Smtp-Source: AGHT+IHyxrjoVl0KXbSfTLDYg+CfefqZM8U73y5ZfAGM3b42y6FXuX1DXtEWNsTF1iIIW4wUhTqhCA==
X-Received: by 2002:a05:6870:4595:b0:2c1:62ba:cd7c with SMTP id 586e51a60fabf-2d9be58e9a7mr562692fac.15.1745615377396;
        Fri, 25 Apr 2025 14:09:37 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f188052sm847673a34.8.2025.04.25.14.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 14:09:37 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v3 0/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Date: Fri, 25 Apr 2025 16:08:42 -0500
Message-Id: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANr5C2gC/52NsQ6CMBQAf4V0tqa0QImT/2EMKe2rvASpaQtKC
 P9uYTJuOt4NdwsJ4BECOWUL8TBhQDckEIeM6E4NN6BoEhPOeMmKvKaIjuIQvTOjho0aA7pXHpp
 2tBZ888TYNTFQbmsphZVGmYqk3MODxde+ulwTdxii8/N+nvLN/jGZcsooANMVV0IoZs+tmntsP
 Ry1u5PtM/GPNuc/tHlqC2tEVchSS1Z9tdd1fQNOGb/UPwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2871; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=o7BcIIIYtQBUHMADOGXaeTJA+HEbSY/NkKPNVQoDqrs=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoC/nfUdqmW0DVoD+FZo9SUw5csNWXEkaFoqBui
 bDyBU03m8OJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAv53wAKCRDCzCAB/wGP
 wLHkB/4wQyGYDFJQjZBiYUgnhQdUEp7hWNlwqnEMYH7bFvPguWYt69E7pqXyv/o8AcRNpyFNwz7
 u+Nipjjojviqe1z+4YYo2BZksKHhnD+lVzRMc3bXv6KePvl+P2mYERNI+/Tf11auIDjhSuL7rH8
 KPBmB3NxXecOJdOBdP5QUUYXQPHCraoXxDz59qmN2nxo3WrGKrc24+lYx5Dl2AjX+2h1lS0vLOU
 bW1wWQVh+tNBUPdS0Gw6eM8I6mvVSSIGSyJkPBJdJfx/5YXub2e9puPgxGWGWugNQjiRkDsCNQx
 v8dZdYryvHvoLQcKJ4YsKxnSMdkJxVZpvCJGqoyCyfNk+jSC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_140939_312501_B1AB7F21 
X-CRM114-Status: GOOD (  18.20  )
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
David Lechner (6):
      iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
      iio: adc: ad4695: use u16 for buffer elements
      iio: adc: ad4695: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: adc: ad7380: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
      iio: adc: at91-sama5d2: use IIO_DECLARE_BUFFER_WITH_TS

 drivers/iio/accel/sca3300.c        | 18 ++----------------
 drivers/iio/adc/ad4695.c           |  8 ++------
 drivers/iio/adc/ad7380.c           |  3 +--
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++-----------
 include/linux/iio/iio.h            | 38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 45 insertions(+), 35 deletions(-)
---
base-commit: aff301f37e220970c2f301b5c65a8bfedf52058e
change-id: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


