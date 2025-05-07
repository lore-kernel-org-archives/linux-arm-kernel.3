Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3E4C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 20:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9C6eh6cD17EJef3d5HM9D4tHLrLT86syKoOQcjPQwA=; b=GXqunr4DIjLnOiC5qhX7/w4/zq
	9J4wGYddX8ktj03Atl6NABa8Js69wkK1TjdQm0Ys3oRH91n9j6vdXR0KLzT7NMWl7vlN0thbCAnbW
	YaMdlSOHcXSKHl2eIPso6e0SMayzMaU57ImtIuaIRXilSi+bwgpQOYbEV6a6b6sgfRlxFxEBKy2/6
	r7MNiWMQh9dCelIEQuboOAIzzZJhkTuysYdkX3cF/sMRY1pob56IOWNGOG5xOhNTrmfyh9GAuhd3d
	EYxlOzxoY6MXdE//E9bs+qQK4Xh8MdsU4Y5O8k5WBfiCZwedV0yGJfb2TAuOnXP06AhQ/ZJbf3S/q
	5+sroHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClgA-0000000GijU-1KEh;
	Wed, 07 May 2025 20:47:46 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClcG-0000000Gi04-36fl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 20:43:45 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-72a4793d4e2so178463a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746650623; x=1747255423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9C6eh6cD17EJef3d5HM9D4tHLrLT86syKoOQcjPQwA=;
        b=lkyqkg45nKy1iZapc40J1gBEMjmx5fiDiCeLVEYzzEzJtYabFyyNjSIdntsUBwanU9
         jFAN4KWgjy6kFW0LfM2DRtAmKH3hq6pSqNFoaJkwbQR+1Rnf/QA5oomKpEWtHMljOV/i
         BeQ0djKoDfPGL/5odM2EPBrvdtsoo9EnIadHD6zEiJDVt0C6uSa6rjj8RUqSESYliRJG
         2DSPcJY0W+rB/CI7faW2QxUMdqZ64HEHkX6ic8/TU4FTwesnAIm48gneR+kFjcLQPD1V
         IpZKB+5o9knapXrB0YmiqX9/D5udpGr6RIuUi3kUETy+o6wtLclpy50vEIvBbHb9hans
         rVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650623; x=1747255423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9C6eh6cD17EJef3d5HM9D4tHLrLT86syKoOQcjPQwA=;
        b=WmXenzzoSauCwusA8wX6IRrbQWVv/lLz6FxUSQa9MULsA6UL46OkRxJ70NzdJSCOgs
         +k1pVK2taRCyCabNhn51s4z4UF9YcFHNKzCLwHtx3KTTqwJ54ifhtuTRlLTA0mo59Vvw
         QKw1BgiQeAeJ8X0uVdNeGIWonQLp4Ip8wXjO2VOQApe1fJ9dCEKf1nBB51GZvy2/7WMC
         IOl9Di5kevdei6iIvWmPSHKYeesPP9WVaTWU1BPtjD39XV9W0PnhGW12H+Ou1zqWFNrV
         o8sjo/85jm8Uc1komZp+fyuHimmvTHRe+4FQfE0r/jEuCal+i46SuA1kmoQ/MAWVnBOo
         xlkg==
X-Forwarded-Encrypted: i=1; AJvYcCVOVUvOmPs1faE2u6FHp9oV22V4ku4BgLS3TeRTiEMAMz26jzVKrTunaNpBdT1Hp0k7PqLhXbwruAkFa7wSQl+9@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ6vitRMLVZ3UIrmMEKruCVuEMJzNx1zjpglBpgUEpkpjizE9r
	GMwu4YpyROPkR6089V7EQomfuLPBbx8ar0VfleXjGjdUibbzBDTQj2rnSFMa2P4=
X-Gm-Gg: ASbGnctMLl3U/FBv0eO9HVbN91ATvLd73ALCXK8cAxFpVmtRveSCIYGcJnVAntLc8DW
	Xy/tMLIoH4xNMWSKrNp9eQBsCExf71AUrXu4kQhWdLTHcD91XJWxBkqandgwgEOCewvxe3pTj48
	bl37WaXi5HVXyYATLj24dH1J3G7VSArvyuxuzNxcquKBImztm9XAlpYuMWB0vPqa9N6XIggqVvR
	dnE+yda1s9ZA51C6n1GnprwMGSLIRZBYZ2mEryjF3TjJ6EZa6qbhmHD1qiPu+Rm5pyIwCUMdEOs
	h/KftLB5zsX1BLlhOCCwFKTB0/QmFopTqZsyo9KBuS3TGSyIrbbYwyO+
X-Google-Smtp-Source: AGHT+IENPH7fJFVZWI+5hLQbltsb6uPLojsgCu0d4mLuhreNgObStagGp6+xSfl6IozpO/zVgnEYcQ==
X-Received: by 2002:a05:6870:a7a0:b0:2c2:3eb4:e53 with SMTP id 586e51a60fabf-2db5c126f05mr2877972fac.37.1746650622970;
        Wed, 07 May 2025 13:43:42 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5cd716d3sm898642fac.21.2025.05.07.13.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:43:41 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 07 May 2025 15:42:41 -0500
Subject: [PATCH v6 2/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-2-4aee1b9f1b89@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4238; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Qkz6TboWaI7MFHoD3asvbEdknvmftSA+W8rgLRn7UjM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoG8XSBGqWPSVzxaO0ZMnShg5EsgNFTw6d5cS5L
 syZI6ewvIOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBvF0gAKCRDCzCAB/wGP
 wB0AB/9zqie1eENWSL0OQQqBATpe+2eVgIQGMFWAEa7WJHYw07K73zYwEpmZbJvfjFhPZzv57ot
 hxvzp7Y94iu/G1vwtc/vQ88etn1VI36o5jAMreTZHcLTQEhizFV1b217USh5XdaWNhEYc+3aHu5
 y+sIQtY93SDTnbG0utUX24FNFXmUwc1+s0KjcsA3Ccdyp/nlLLsL2ufTNdYMu0uVT5IrcGrLKiG
 KOX1enYu/mmX0alZqmCPeQulRunaS+JiZe6EeUveJb6Wqj+9exstphlnAZk+J1y77ZE2e1AuOhh
 Fa5k0E3X+cmHL3E+zO/B5ZHV3CpOoDUzaQRcCKPJSOUO2vMG
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_134344_779737_EC72ACAB 
X-CRM114-Status: GOOD (  19.70  )
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

Add new macros to help with the common case of declaring a buffer that
is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
to do correctly because of the alignment requirements of the timestamp.
This will make it easier for both authors and reviewers.

To avoid double __align() attributes in cases where we also need DMA
alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().

Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v5 changes:
* Revert back to __align(IIO_DMA_MINALIGN) as IIO_DMA_MINALIGN now has
  a minimum of 8 bytes.

v4 changes:
* Drop the static_asserts(). Some 32-bit arches were triggering one, so
  we had to address the problem instead of hoping that it didn't exist.
  The other made a multi-statement macro, which isn't the best practice
  and didn't have a way to make a really helpful error message. The
  condition we were trying to catch is still caught by -Wvla.
* Changed __align(IIO_DMA_MINALIGN) to __align(MAX(IIO_DMA_MINALIGN,
  sizeof(s64))). As the build-bots found, there are some 32-bit arches
  where IIO_DMA_MINALIGN is 4, but we still need 8-byte alignment for
  the timestamp.

v3 changes:
* Use leading double-underscore for "private" macro to match "private"
  functions that do the same.
* Use static_assert() from linux/build_bug.h instead of _Static_assert()
* Fix incorrectly using sizeof(IIO_DMA_MINALIGN).
* Add check that count argument is constant. (Note, I didn't include a
  message in this static assert because it already gives a reasonable
  message.)

/home/david/work/bl/linux/drivers/iio/accel/sca3300.c:482:51: error: expression in static assertion is not constant
  482 |         IIO_DECLARE_BUFFER_WITH_TS(s16, channels, val);
      |                                                   ^~~

v2 changes:
* Add 2nd macro for DMA alignment
---
 include/linux/iio/iio.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index a574f22398e45cad1ea741d20d302f88756a1b13..d11668f14a3e17654fcf17a4e853d4b493205019 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -7,6 +7,7 @@
 #ifndef _INDUSTRIAL_IO_H_
 #define _INDUSTRIAL_IO_H_
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/compiler_types.h>
@@ -784,6 +785,37 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
  */
 #define IIO_DMA_MINALIGN MAX(ARCH_DMA_MINALIGN, sizeof(s64))
 
+#define __IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
+	type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) / sizeof(type)]
+
+/**
+ * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
+ * @type: element type of the buffer
+ * @name: identifier name of the buffer
+ * @count: number of elements in the buffer
+ *
+ * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts(). In
+ * addition to allocating enough space for @count elements of @type, it also
+ * allocates space for a s64 timestamp at the end of the buffer and ensures
+ * proper alignment of the timestamp.
+ */
+#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
+	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
+
+/**
+ * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
+ * @type: element type of the buffer
+ * @name: identifier name of the buffer
+ * @count: number of elements in the buffer
+ *
+ * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
+ * to ensure that the buffer doesn't share cachelines with anything that comes
+ * before it in a struct. This should not be used for stack-allocated buffers
+ * as stack memory cannot generally be used for DMA.
+ */
+#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
+	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(IIO_DMA_MINALIGN)
+
 struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
 
 /* The information at the returned address is guaranteed to be cacheline aligned */

-- 
2.43.0


