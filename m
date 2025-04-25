Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A12C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY1aWIkNQr9/WlVdM/imYDbUDJ4FCN12j5sBaq8Ups4=; b=lTsENoDKICaZPYODENscJ3b3CC
	iXP478qqehODjvnWdeXr9oTikrIe3RvDS3d2C1vUdWjRAtrhgSEAyjlGHb6qQJKqTB7cduIyFK8H3
	PLvxcgxuIKIlqIb6RgAMjfFol0c9rHsKDVNfr33gzUp7zbOJCkgYS87fx2j9K83iv+AjtAokeFjQK
	eAHI8Do4/MYTn1eaAWOLH3MgcdtUQeByBY7PhwY4/9q2y+DkuvCBOYOoQqnwwFtGGRwZr4ULP62S0
	7wJEyxlVXMAgNBaWk7s/C7YvQB8RsO98dvxwWATOIxLH+8eaggifGT0UJrkOdn8yRddz6LhnZ6hCk
	VRN/gbGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QP3-00000000uDa-0Mps;
	Fri, 25 Apr 2025 21:16:09 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QIm-00000000tFl-1FJC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:09:41 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-2d5e5e21b92so1756554fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745615379; x=1746220179; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BY1aWIkNQr9/WlVdM/imYDbUDJ4FCN12j5sBaq8Ups4=;
        b=pkA5HuT5AmVq/nQp5jp+39gzIsBq6Tr3wvsVjpustFHPd6CiY0CJgNm84LY5WOeDKN
         u1N9XRksK9q71tN1Dp1Snp9U9h6opDrs0pCWzw7b1odaQ4XPkX54csyWgA+XDr0lIGDJ
         laeTUbxsU0gehYRNmhZKPUlVt5RtKjgXtjyK7uDGZZCQglD+aKwNKpwxFhpBnHPpJdvc
         t5r9J5yP4AZfVgOtkQk6LWvcsyS3cSfNh69YkKjcx1N9ls+t+Bk1RUelrshUXG1uPdDG
         4gwqswIlBdaK1TzdnuSivmnAagHRGTgpaSf3TJDbzXs6XrffR0Isw5dNScXU0Dfbv7z1
         O5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615379; x=1746220179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BY1aWIkNQr9/WlVdM/imYDbUDJ4FCN12j5sBaq8Ups4=;
        b=TdRBligX2Fb/S3+vJj2f9xpc8fRrfWg2nuEBHFRZ5cShwmRNIKAIwQZfmGUkylA1TM
         uDTBHv0qkwIp7FEatYM//M62PavldGppW1usyDWu0LE/mK2SvqXEltRf1kp2FxuDf0C/
         jrv7aCdDkvTr+Wa+20pXcWsjIEqIRPAyzNf0Pd/C5vkljHgwpcsG+p4YbiKlS2qddyRG
         q8bnuPHYu3zK4dQO/v2OiKRCco9+UNnvhWRUs0soy6QtFNdW5AOoult29b/JllShqYCj
         66IvsMNQ8t9pBEYF+fECPD5NGgS7aKxkgR1/Q0LUFplYQn3tMuZ0hvdDckbqP4m7x8u3
         G07w==
X-Forwarded-Encrypted: i=1; AJvYcCVQEcP4zI4IWKIJPPVRKtm/K3FC82sOhyd/30nWURXLatSz4iwBcvD7755oeg/K8stXsykplSRXp58GHVhcBHDc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3+eqNLrnz1Gc85DKEVrqRRU1qQhwJkKE9uYk5pQAesxQwKUu8
	kIA+WTjaV32U/euILYkdhFGRfkM58eKDK9xudmaOJ6okqRlFCTaCGOlIujmm7LI=
X-Gm-Gg: ASbGncu61LOMFAWuN8WPvJ3P/ca+upAZLfVtGQUqXm5H11nM4/N9M/Co5hR1WwDyIPx
	HWGGQt0f5i1O8/AZuB2qXn3w47eew1i1dantn3MswmBwk9EALFHqP/9SynIga1ayEj/o2UZYNPN
	pXC1kjrlErVjHixyi49pXe/OK5r46lB/xgTNGHpL1IL7DwTpbnwdDUMr+vEBnxjXMJWZoWsOX7G
	QTp7w0lun7Oct7oTI97IvZ0XXJkWlE7P4CQfai3uqxj3hjjeFGJ4CYd/H2TPcRl+rjibADciRGF
	fEmGhzfEehyOkhbRyseGPj9yUEZZDDbsFx5KsfjK960jE7j8l0tlkxA=
X-Google-Smtp-Source: AGHT+IHgoMZkBfZXhz5aqoIzlRTV+NaG/N/wVFvnLQMLS1D8aZCmMXkvEWmf1mqpeRfkisZn7+z95Q==
X-Received: by 2002:a05:6871:792:b0:29e:4ba5:4ddc with SMTP id 586e51a60fabf-2d99db25561mr2208324fac.24.1745615379304;
        Fri, 25 Apr 2025 14:09:39 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f188052sm847673a34.8.2025.04.25.14.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 14:09:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 25 Apr 2025 16:08:43 -0500
Subject: [PATCH v3 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-1-f12df1bff248@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3719; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=S9yyrbbGceERU79hEYcii6LVQfguSKjlkyu5n+UlTsA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoC/nm4JmFy6kPkiyqKsDPXMzKl5mRSVcD8MkmU
 knBSH8PgtKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAv55gAKCRDCzCAB/wGP
 wJSvB/9gSprhYoKqm17uZXVZ6jJRFmsaX8jyoqQBaLCQeqXZdb0j74O/nlC316k+qfISf3o34yh
 /ZAovdK45qS71p3Y20kH3CqNKHpCUgnttFXhEdWcgNjsFcFr/UMUQw/M5T7sQTpYgxl/8sD88KJ
 f4tZd53Vyn5wkQq2ELL4SUF4oVvta5WyOAK5S7/tCmuGLWyJqC1j9ihqeiifuzZRZf+ypJPu4oD
 GxQdYZxyVLx+fmM0y832hdBwp/gcd4J4TH6K3ll5OlYcCJvk7n8SPI0Hjl3egeYyk196dIcMKzf
 B6ZjyRXK7+EJ+iq2t/OBgh4tZOCC5h/5hli4azVUGDAMwFoA
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_140940_337635_A41F5A51 
X-CRM114-Status: GOOD (  17.00  )
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
 include/linux/iio/iio.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..1115b219271b76792539931edc404a67549bd8b1 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -7,6 +7,8 @@
 #ifndef _INDUSTRIAL_IO_H_
 #define _INDUSTRIAL_IO_H_
 
+#include <linux/align.h>
+#include <linux/build_bug.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/compiler_types.h>
@@ -777,6 +779,42 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
  * them safe for use with non-coherent DMA.
  */
 #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
+
+#define __IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
+	static_assert(count); \
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
+static_assert(IIO_DMA_MINALIGN % sizeof(s64) == 0,
+	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
+
 struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
 
 /* The information at the returned address is guaranteed to be cacheline aligned */

-- 
2.43.0


