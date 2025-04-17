Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3ECC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BMsi2WwJ6hjhub+TfZ/EQK2V+POxMxNiG2BzOtIkvYw=; b=35COyPFNE3ITbH
	2p9f3Wf4Ffzfu4kNngTmL8ogSqOBfT5zhVmOt+pEMpV5HNcwnNdXPW51O02gGae4qvuGJhOq+jhMF
	LHf9ZtjE+Sakm6Q+kEWIQh6plPFbvwf46U5IdwryBeH/ZJbveJ+Ih5zS0+eRlvwEau8K1Imqgivmn
	tOQr14efGtWRJX3QUGcQ835j3n+NyTEtPcTgLbKsHZPSFBrUVPd30NTlonnqKZLYTL7jwW8VG8mIr
	mAgcqZJyWLIDtwXtBXYbd+WQ4VYTsWATfcOhgNha7lNOSeKKAMqvKHGcubE+k0Dp6hXGKaCN5er+z
	5Heco8mXViRRVbgjtYVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SX5-0000000DkLj-4B0V;
	Thu, 17 Apr 2025 16:56:11 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUa-0000000DjdB-3JAs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:39 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so1148406fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908815; x=1745513615; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BMsi2WwJ6hjhub+TfZ/EQK2V+POxMxNiG2BzOtIkvYw=;
        b=UeF7sr/BCu34xyLxgV1JrubJ+8c2Pc3/WA1Eod8I7T0fMxVL7Kn3ce+AeVhT5DPqPs
         aioPUEtYbIq7D5opIG141dymAFk+iJp5hume9MVDuzJEW4nicim/uNui3X1WirhtmJIX
         tI34qpFyqd+XlxMMHjSNPcTR/+ZhbF1CPdvKETqjhXdRKOaSGaSTpW/XGCv+pNL+N29Q
         vTnKjNdgnLzD7FYO/HyqEHg9YsT6J2c5RRkdW/IiGR1jx0SAi/81FD6k5gDaK03i8dw2
         ssH6OYtl+KKeAikyOEn8wqAsrrpPrhdwRLsFDyfhKAobJlw+9vQbnYkA/6sG+mdglqfG
         Ij5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908815; x=1745513615;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMsi2WwJ6hjhub+TfZ/EQK2V+POxMxNiG2BzOtIkvYw=;
        b=tY8Q7ELIk5HF611OoWoEJlrBK8iF17R/G4ywoong8hJeJFj59/+GZhEwH9DZrr9i6e
         DBP0Li4s306WW4pZzcKDbr9L+rT5I9QPunOfP51LQiw4SxIfqJsWavG/BlRb9hO8V/Mt
         TGbS80bZU+gE+qVSg4L9R0sDkISRYiEk4bULqiiond4FkgkcxY6lj5rkAkQ8kvkTuYxi
         5KJHYkcpfYDfYv4pBELFJiJOf3I3PCqYtDPHaC0wS8JUmEp7MBEb7LPcKF6RaLtp6+ml
         AmnPdaAf6dfsxvFhoCnRJd9lygJSYnkvi2jIKicawZ+NgYpZ/Xf5TqXLdMUM8IW73yWJ
         SUCg==
X-Forwarded-Encrypted: i=1; AJvYcCXA3UP7ZPKiO56guPDfnuHPIIKnxob7bpZGULWZpo5+MwOANr/hYI7ef0coZ1e2W3G8eqU1/s2E3xwt9k3a8zMq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh/W+tsAOaAdnq3RbxSTZh2sEFpJ86TD+4CV1b4D29+/vqyScG
	zJPxTmPvlP5WZ+I7XYr/djJWXUtJcqXVYZPy5WkLtGGgNc3jD7pgaU2sB1a1X/Y=
X-Gm-Gg: ASbGncujqRUkorNPMcBT2WbcHDFlJhNALQs1Q9MdmV9Sc9YuGy0FP6bN4Nbf+Dw5RNg
	RV3ZQDwKPL5V9QLaLgRGKTyhRxnRXhanFA6jdwRnVuE3RS73smVN81daz6HUqa9vlnAsxkAAnt+
	2DkTh+TL3l7inzWjAvCkeDXroSqfWc/uf/V61ogCMqLuJ4NEzJ9mlO/Quk57b0fEdS5cwGmBX8c
	XrJhb7cOw2V/iEk5qZE/3wikLjngmrjucGGRTAPwYDtiRUuLp/OGU4RlIUpGOf0ystp4ICUhQBA
	A0ewWfjpeYCYk6nLy/ZUeg4A1nDl9BYseoPv7xCZ6pZ3Ywg=
X-Google-Smtp-Source: AGHT+IFY/vO7y8M2CG7Oo5TX+7MViwzoQKB+pziGqNMOOxstSmF5iwhAC/aDMXMw925f6TrhRA+Olw==
X-Received: by 2002:a05:6871:71c1:b0:2cb:d32f:2f18 with SMTP id 586e51a60fabf-2d51df2a8f2mr362900fac.16.1744908815275;
        Thu, 17 Apr 2025 09:53:35 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:33 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/8] iio: more timestamp alignment
Date: Thu, 17 Apr 2025 11:52:32 -0500
Message-Id: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANAxAWgC/x3MwQqDMBBF0V+RWXdAxVrpr5QuRn21D0wiSSgF8
 d8Ncldnc3dJiESSZ7VLxI+JwRc0t0qmr/kFyrlY2rq9113TKxnUhQjNdEjZ3Ka2cvEOPms/lWx
 4YJxNymKL+PB/7V/v4zgBSmlh324AAAA=
X-Change-ID: 20250416-iio-more-timestamp-alignment-6c6c6a87ebda
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Sz+7sWlyolxS4Zl/eEi8a9e44hyD2IGfO6dXn8EDJGw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATHTMUD0F9owkDNUGccr2O9643S49NzTkqNd8
 qD0QXO+JF2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx0wAKCRDCzCAB/wGP
 wPrkB/44BUumGHVPTUE3N/as04EvFSkdabzEdJ+zuY8Gv7nu0W0unpkR8WIuN6freUelK+lDnsz
 aoZzHpnCJbmaP0oogKGJpWPhmUGK8+ubL5bCgkevBCpizO9+B2P7PmmH+QRI1YJYk/nTwR03+Be
 tys5+hxNRkMNHrz1Vi3ORz04S579JM0cyJnUMg2HcI0jYNC4YWvPBxy5UQTMUVcdmLshiV+seAv
 6oSaxrXmLE0I55TicHv9sP3uNkJuRCZJMEjb7AM1yl3wpkStx0bTjU7SzSkI01INwxLmBRzuj5/
 2u2+9LvXToRIZ5CF/BHCR3JX5yD4lKx41QwRgNWsXt06XUpE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095336_833796_480630E1 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Wile reviewing [1], I noticed a few more cases where we can use
aligned_s64 or need __aligned(8) on data structures used with
iio_push_to_buffers_with_timestamp().

[1]: https://lore.kernel.org/linux-iio/20250413103443.2420727-1-jic23@kernel.org/

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (8):
      iio: adc: dln2-adc: use aligned_s64 for timestamp
      iio: adc: mt6360-adc: use aligned_s64 for timestamp
      iio: addac: ad74413r: use aligned_s64 for timestamp
      iio: chemical: pms7003: use aligned_s64 for timestamp
      iio: chemical: sps30: use aligned_s64 for timestamp
      iio: imu: adis16550: align buffers for timestamp
      iio: imu: inv_mpu6050: align buffer for timestamp
      iio: pressure: mprls0025pa: use aligned_s64 for timestamp

 drivers/iio/accel/bmc150-accel.h           | 2 +-
 drivers/iio/adc/dln2-adc.c                 | 2 +-
 drivers/iio/adc/mt6360-adc.c               | 4 ++--
 drivers/iio/addac/ad74413r.c               | 5 +++--
 drivers/iio/chemical/pms7003.c             | 5 +++--
 drivers/iio/chemical/sps30.c               | 2 +-
 drivers/iio/imu/adis16550.c                | 2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c | 2 +-
 drivers/iio/pressure/mprls0025pa.h         | 2 +-
 9 files changed, 14 insertions(+), 12 deletions(-)
---
base-commit: 3159d40a2ca0ae14e69e1cae8b12f04c933d0445
change-id: 20250416-iio-more-timestamp-alignment-6c6c6a87ebda

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


