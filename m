Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221FAC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D6QMJxSvYb+DoZksUxOYwXqaCXAwRl1Ug30Nn9yKcK4=; b=5ETBNkKSgnWI9X
	uuRUhyWwmydQYHjy3AnX/EV+y8FY59R4nw/BiK9ExpuDr33y7kdh99b1BlEuBUK0l8CB8RtFDdSe/
	PjZdBhSewLNGqr9reyyHYMDBOnqaAl+a5xn8/6vpZ63WwkozyDnaB0GvxRZWMni0gOlqTntgMz6+j
	U95THyPp3h/3FNRy+kyPXGKBYMidtFCBmUBcMY701fLoAFkJ6DlfhXSoQ8OPBT4umAieJ5xtcDyhO
	qa2x8rCqGd5VBsGjLbY9a8fQb4V7yDeFjV4O9fe3DWEBr50DgT6vNOpjD1g7SwNIMNZOVBvt0K8yk
	y4uq/b7fyqJBkXizsHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByxz-000000082s1-3LCS;
	Mon, 05 May 2025 16:46:55 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBykF-00000007zvN-0vqP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:32:45 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3f9832f798aso3348234b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462761; x=1747067561; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6QMJxSvYb+DoZksUxOYwXqaCXAwRl1Ug30Nn9yKcK4=;
        b=tmUxbtDkgTW+RqBxmKFZxcTNBUqC8MFNqWga5Uy9tfQKmlQlcf4LQhxqTomqvbWCty
         sTJbGN9hPqxKvqx5lZH/6yUAsp0gq9ja3rQeLJDk5JUH3o57bKuV4fBcOErA4BzrOWxV
         3u0Uph5SfurKmPyqfVX+T77ecdQO3n41aZV8YD7Bp8nwV8s3urJOvLvMoEjmB6xtOKgj
         ffaT9VQuHZli3chRB1jRCcuM2UgNc6GZVbLvBbiyWH+HWrTBi5NJ2iQpaa2Y/2ktNAqJ
         2TuD5BDIDppxPWqKGZoyd1Yu2/JNOV85CAvchhS+1Za680IjiaTSvNAVz5Twpb4dcphE
         /4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462761; x=1747067561;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6QMJxSvYb+DoZksUxOYwXqaCXAwRl1Ug30Nn9yKcK4=;
        b=BIFectoQ/81fx7Etb4w1DghuMO/3LQu/jE8SQYahrkTNEFh18INmpey+6Xq5Z7x2cN
         IbBLcZQRlWG/TihdXO03XhZL2vrrIYzTvDPa7p48EOucH/4fACvelI7sG5wEv4+Njs4y
         RZ18jTa17MyjVzR4a1mhLnpvlNmbK7a0ka1mCLjyDD/OCdwDTydOEj4cVLzJKWWYnwb1
         mUKZZpe/5AXVSi9Y9piH9VG42HdFzMDQWhWG4WdYED8itRm1lZchFoUxyV4vqDNkKC3b
         AT5pgs+3Rrse3IA9BirpNk7xsrKeFuaRzua6AKAOpwGUD1/GPOgGi8GhWrfmO45H3cIA
         En7A==
X-Forwarded-Encrypted: i=1; AJvYcCURLZtweeQ/ItwTfAOsb+4LM2hM5ugLe9l6LOCPxxxsCcCwj9uF4jAvotwikuwHRp86CvR3r53E8N1lCZaT7K6K@lists.infradead.org
X-Gm-Message-State: AOJu0YyzxnnpXDOPW++xH11aL0MOtMJcJy0jRp5eSqiwOxBhrUdmDgOI
	qvNy9uzrDqDkBve9RSTqZU9GFmzFmOBTHW9LilFHTE5yA92g8KxjS747zRYRq0s=
X-Gm-Gg: ASbGncvgpwwZP3tnVJmXmVs3IzGxP2bN8RYNO4PKRLpMKKaKr5jH+c3oSYBW9eyK3wP
	JQHFRKYloTjSNKspzdejVOcGQz9JWQYavzjH0lxmcMJ4dZXX82F/hfgkv8j51iB7CBwGYRKhR/F
	krVn0F7N0CWg1vO6eu2O89clTnvfrqUp79ZKBJnyZXmYI2CdsrHyw5PP2D7BETQBswlQE08u6gt
	bq5Ai9/rQiwQno6RFfPlDm478NeGQjq6v9GcdlylIijaOSQ5xX8a7jYAAZ9OgBYUxmIMOFX8wjs
	hCRR3OJGJuzGbGZxZPRwf8oc4vAxEfZ47JlBKHPK8994cg==
X-Google-Smtp-Source: AGHT+IEAb7wN6Xj4gTxhIaHaxaX2lbTLyAAaizSD3Tpvtgd3KpcAkDDkzsvRIGIEg/4Ozb6SlOjBug==
X-Received: by 2002:a05:6808:2292:b0:401:e6f0:a8d4 with SMTP id 5614622812f47-403419aad82mr8804825b6e.5.1746462761622;
        Mon, 05 May 2025 09:32:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:41 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v5 0/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Date: Mon, 05 May 2025 11:31:41 -0500
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3nGGgC/53QTWrDMBCG4asErasijWTJdNV7lGL0M1MPpHaRH
 bch+O6VszIlG3f5zuL5YG5iwsI4iZfTTRRceOJxqNE8nUTqw/CBknNtAQoaZXUrmUfJw1zGfEm
 4VZcxnUPBLl6IsHTfPPfdPEmg1ntDPofsROW+ChL/3Kfe3mv3PM1jud6XF71d/zGyaKkkokoOg
 jFB0WsM1zPHgs9p/BTbzgI7G+CADdU2lI2zvkleuQe22dvNAdtUmzRk0pEIbPvAtnv7yE9stR1
 5choc6RT/2Ou6/gIRNcyr9wEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3565; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=hYnwKldeyCYR/JIL/xowr6X7GeHBTR1A13sTV64gYGA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGOfw0KmlDYseVpAgaaAgy5RQ/GQPoLBAF23yB
 m7Yv0pwF6mJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjn8AAKCRDCzCAB/wGP
 wAirB/wO+qf8Ih7G7JqFC/x8axX3O9pv7JgHrlVRxYTW2iX82uIBHyaB+pyjKn8DAt3M3VGaXL4
 2vWJvZxdyWBKypNi834Cm1qOExB5ROp69bUOoy+DWrKscujGXl46Ehh3Jl19nyeNaIcnHv0XBHn
 aQZHqWzPktGxHlfC2gkqo7rttCldK2Bu0dWg7fnTHCKDyMf8VuDoDSgZ+tS7f4rb1PlBe3iFD6K
 UpYjfHcNb4jn3zLjGB+0Yv7mwiGp+OG+A8nGQU/OtVo+xvnqIy+5e3zPg+ydpFXpf6hJcmdypSQ
 +1EZbXUQi+6l9n1s7j99XrLql9fs4vJVH2AqXBkF4MWQyOls
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_093243_274058_E8F22B6D 
X-CRM114-Status: GOOD (  19.68  )
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

 drivers/iio/accel/sca3300.c        | 18 ++--------------
 drivers/iio/adc/ad4695.c           | 11 +++++-----
 drivers/iio/adc/ad7380.c           |  3 +--
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++----------
 include/linux/iio/iio.h            | 42 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+), 35 deletions(-)
---
base-commit: 7e9a82ab5b861d3c33c99a22c1245a5b262ee502
change-id: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


