Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59BAC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDO3BrucMxULVTP7wxmNOUlpxABCLZ8/GfNo16L3AFU=; b=YJMjfKBdx/QntLf2z0LD7B4Mht
	44tGEgdAQXKs7D8+V49jSZOj7nn8bq0yPWUG8vAShzv/PCKC0It2/FXjdwfVgL5ff3CTfi+86GXKY
	jjbH/4R4c2eq/h/gFCm5B0bl/OHW65sj5hWuJOi0QW5qVjFGoEPgwH+/o/UwwdyLDE30uvOZ1scS/
	sxFuiZHVnIgs1tCyo5sVxz/OD3aO9Ew57BO0rMWYFsrC5yhs9nY19Hw+I15Vd+ctebbxaISjxj4NL
	1aky6QSStRVkQEuX2RPWkD/OkL/DgygDWjuhq3XQxrSIrI70n77DZYOwyMmFQ/LeKWwq8iwtSd8aE
	Do5mePyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V5D-00000007T1c-1lVR;
	Mon, 28 Apr 2025 20:28:07 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V1K-00000007SDl-3Oth
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:24:07 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-400fa6eafa9so3910461b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871846; x=1746476646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDO3BrucMxULVTP7wxmNOUlpxABCLZ8/GfNo16L3AFU=;
        b=biwc4JGeoEuJfqTNhpujW3mTuCsppaUa8sP4PArVB3EFmIivu7HD99JLISUk+RvU8i
         LcPHrA8PpIQv/ld9/2KUk6duZzdSjaqCbe7i4SCLbPde9lCBXMmg63bMG/LNSwLXAw4D
         16pf1nXkcj8KW0k/X5BvUcIEMPlrD77+znoSTiZjVXT1ktx4wwI8WcbgyatGUKjh8DiS
         v3wx/wV2jFi93cyxdNuWV+8KtEkZwU6MbnF7H6JkqUJrWZhiupmDQRBFllNxcdth1+Em
         5qtEnt+6spz6R4EwAafVyLy/ETTO+7Ph6t1G4HzlJueDeBVGd01Hlf6OFlZ40psiOON+
         Svng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871846; x=1746476646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDO3BrucMxULVTP7wxmNOUlpxABCLZ8/GfNo16L3AFU=;
        b=nK+KCS3+UDorRiR8juYXHwjUj05wJOnaHThYEyLJDMo5Z7PweDMulNify4Srq6yjJN
         VQ8fqsr1LRM8DiAzuKwgFWOyiYlB7e3RvsOT0UiIZ+b+xpOKFzt94/MRDNkFZY+pyvYo
         0bg1NCLNelho+EWJA85+kiqwbeisdnvc9GCwA2pRYMhxcruIxX0tDqi9lOtM74xiqX1G
         94wl0MwfyP2KDDaoKM+WYJHHSPWnYHHyP3e4d5uYum6kNzAQHNa9lfasrWBoGGnEj6fE
         GJGEvCEN3eBu/lrHNTEAdNisF9QVLmXatZCxtGfsVdO8AoXbwSWNba2S4hv9ZU/YLyo5
         i20g==
X-Forwarded-Encrypted: i=1; AJvYcCVnOShtB1LvRKyTqxRfQ5FqDzjKE5LXHuHo491GEaYkN4vYLTbOrP5r+LtOtcon7G5yExX/LhiQWMFmS0CPt3xd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx3eRvGYMzldn8AFLjwSRZ7/lWekIxzUGUAA9Zl2NzCK1rm9d6
	JhaCUUl5KTOUkHbEC5so4A3Z4IKIXX4q+9jkMcFxm+eE5T998S5sVjxZJ15hgWM=
X-Gm-Gg: ASbGncue2m09KTo6/7kbWshyNwJZ9ltQmyzweU2djjrAbJsL5K0ZxMEgWL0rt1mGApP
	IKqqcWlv3Teg9jy1AQXZLFV8rh97jjvVFcqH0aTG4iF8xmhnZwipFct3CjM/21ymw8v4/GBhubZ
	2PtssvaKP2X7zLvt6IgO2+PpGhp2CjPYM/93HnjTsSvS9OsjeaAUAkFnOwZrAKaG+fy/4ypH9Sj
	fLHG5rMfmDJ36L4v7yvVz+lrDqwWnMhP/ivqZRchjhtQ5P6zY7+LgKRSLFzVOYxvFUmB6zfO3oD
	t6nF1ANxoxrwq1pjyTDQqMFNBWGJF25uElswyAABmom0UwY=
X-Google-Smtp-Source: AGHT+IEIb+/7jwFycj6Lxs0AIAmOXJEQMNM+ExPcVNff3F0TuKaEDFx36DEm3NSKVEONbWj2NvQzbw==
X-Received: by 2002:a05:6808:1597:b0:3f7:6824:5839 with SMTP id 5614622812f47-402115793e8mr196510b6e.19.1745871845666;
        Mon, 28 Apr 2025 13:24:05 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:04 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:03 -0500
Subject: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4338; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NbvlMBP/8hkPgeT8KG8PAd/JVAGx954UfPXMpF7Wv10=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+OxkAV7kbZhJxHC4iKN/xmbZ/Lc7pauhbWdp
 +DmlLR4dguJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/jsQAKCRDCzCAB/wGP
 wJ72B/0UaG/hbNwQmC2jqV8Rbj6GBpaWfbcJAA1elDDGhYuyJ64XSLue9cdWjFH6yHyLS6A9xFI
 +onUBUrKMut5HCGv9SdkQo5a9imJSUAXjTv8Ybl5c/tk6Jrsq1URo3qjRmbmL4/kH4L5gv27bQ3
 oKMt+m/912KVXfQxhD3WgV75N+7lUB6G8GJd2hyhlVFrkcXqVi1yB0ynX9s39mqfcundWaczazG
 qfz/2+xNtm9ozLVPvaRf0fREtx5UaYGSOj9W/fkpXMbpysJW8cmG1acPjbDyoAKZ4nDBw/g+Jig
 dXM8MBCBPdgtaLwMqGWw6SdzKM6WU8EmTzGIqtMyx16s0Hpo
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_132406_856252_97C9937C 
X-CRM114-Status: GOOD (  21.17  )
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

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

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
 include/linux/iio/iio.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..95d90740b4ffb3ebd819d03ad2bd05ecf40d4384 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -7,9 +7,12 @@
 #ifndef _INDUSTRIAL_IO_H_
 #define _INDUSTRIAL_IO_H_
 
+#include <linux/align.h>
+#include <linux/build_bug.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/compiler_types.h>
+#include <linux/minmax.h>
 #include <linux/slab.h>
 #include <linux/iio/types.h>
 /* IIO TODO LIST */
@@ -777,6 +780,40 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
  * them safe for use with non-coherent DMA.
  */
 #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
+
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
+#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)	\
+	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count)		\
+	/* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */	\
+	__aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))
+
 struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
 
 /* The information at the returned address is guaranteed to be cacheline aligned */

-- 
2.43.0


