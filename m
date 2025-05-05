Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8148C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WROtiMI3JkznTuCCsJN7sUPb4kZ+J9D+lR0Z1bHz4c=; b=rqTaEd8yIuiw9jf5vYMsQg/n3X
	rV2dFdw1zzvsyX4X1eYmXTisFxWhfZZHzFI4gxQAFiKChabCjoUFQ0LB/S16yI7LcpSifqXw0As7b
	QDoBGkg2ZxTX+Lq2/0sONPaznmp80I8lJXraLP3yRUKQ0U74o5wQoCG9HLax3uhvR6ztjOGffBKuQ
	MFNScujkLk5w3IeVM3hIsc0lmk7jZ+FMEpq4gqXHRcncDOGAjj424FSqGNIJOcH+A1vrZWtxKBi6x
	HOHr7/zl7i+CiLxYLYvr9rdwMRERTOov+iKe1sn9mavOh/mHBLEWvxcoMpkzElMTqt+715+b09dzd
	T08/WHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByzx-0000000839U-2JBY;
	Mon, 05 May 2025 16:48:57 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBykH-00000007zwO-1w2E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:32:46 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-40356cb3352so1451566b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462764; x=1747067564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WROtiMI3JkznTuCCsJN7sUPb4kZ+J9D+lR0Z1bHz4c=;
        b=o8L61fcTwm7Lj2amwAcfgB24Rx62x2y/L1z7e3Y/37ZQe/aJ1p8BX7sbqfa1q84nTO
         m42T3uG1q94xBrOr2Gedfmn2w9yrgvpzkkVnEU+XsdO+iO0H5S/PuTloRZHgIdqC4VUb
         Cw0swBsa8yMSTDGXS4ATcgfj0w4rRmSeVP0XYg+hAx4NeuUTHFW3iHYJuP0gIx3mwymk
         Ucyb9gxJ05xqh66Wr9JUFXqfQLqxdIHcNlVJXIqxX7J6ED8dbzEeV7mB2Ld/RAorSwxt
         ZXXvwaaUx+GEtAToG/PPvPcBI4FdQcpB1o3EnP4G47kAOhMShehnVWshF/MDYa+ns7Hh
         FJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462764; x=1747067564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WROtiMI3JkznTuCCsJN7sUPb4kZ+J9D+lR0Z1bHz4c=;
        b=TCW3VWND/x5mPiApnzmHuD+tjpGLDVHosBuaWSftCovLjRk+dvYF/2fzzuNxL727pJ
         h0RJhYcWJbr25EUOkupWvzhCOCetTOAf+51+Dj5jYsFVx14o5n9DWaYHIEk8p1vwgDVn
         ANC2ikNeFvf3WqfB4OGfED4H2Z9K64C9zbmmCyr6dWon51yfDIUTm7EGWzHTi7KEGLUz
         LiNsIOEtZg8iQd0kh/PEmZi1yAt/RTgkA15NB9MKWEDjzOA36Ab8vgLH+0WIWFjR/vEC
         S9Eiz7GLmM/JuXFQXOJ4p285zJK9vUEqU4r/o2KmMZmk5gqo1lpVCfc4x72Fw1F92dOu
         2qfA==
X-Forwarded-Encrypted: i=1; AJvYcCU2piBTPAyujC578RFnsdMyJfcdHqf1TbDiTUX4DTWiC5hIZoIm4m7aD2iVaRuWY1+2YQjttTmJrfwft1GCBVDc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+VBcEYV4UJ8aoNVkUQ99phCvpIp1dKHaoxqOv4vkJqrnx3M0S
	BhQ5bcJgEf3bnsGCrMltOadhsO5v7LJThptTEyKMzFo/nyyrzGU9fxOlsjIS1xo=
X-Gm-Gg: ASbGncuGe+ZNQ4zaC1SrhNo9BBpXcCL0BUDh0pAxNF61orori2AYGu6tcwtdVxU1WxE
	jX3TtIqfmFoV0583CGkudT8nfzrDXXA4M9z7XtzIHsM/256D56MIvuz10O2fTyqgLUhY+Fetpmn
	PcX59r68xioQyqYJLVaOAuMQK1X1/xWeyIQuJtvg4v8furs2AvYVIKEKCa34072J44GANONXHgX
	P1BsCg/PZ9gDLu7VgB0GyNURha2EkR9FLfrZ65nSX4D134e1Jeo6bebasqra2AqusLOwcrMSaEL
	vNbpx6FZAx25QW1+pd+s5hmxvWsOjgxq7Ii036IfTTONDQ==
X-Google-Smtp-Source: AGHT+IH4vRVlspiASheOc+rcVxaOiPunx6fBx8WC6lVUIUaD6fiU25D8/3I8EBIEW8Ys5r+61fqW/g==
X-Received: by 2002:a05:6808:22a9:b0:3f6:a851:fe85 with SMTP id 5614622812f47-4036883782fmr91855b6e.14.1746462764436;
        Mon, 05 May 2025 09:32:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 11:31:43 -0500
Subject: [PATCH v5 2/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-2-814b72b1cae3@baylibre.com>
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
In-Reply-To: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4179; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=GqiFVLFxgn+LBBWQlIorwUyITU4RwfalpSjWWDvcdCo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGOf+Ep/O4CcQfg5E/1xbTSnTa0LnJINU/61Bq
 JnFrh18IZaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjn/gAKCRDCzCAB/wGP
 wLpcCACBNPKqIY74BOKllvhWFKdD323FZ7oXSTwtI2y67stm46e4owBkZHCPcibWab2zgd31LdN
 ACchPsBpYGJXX99sZIZnt35PumsAo7QlwvGPaAfa7CHGsc72prktudnAyu7WPtzLf65ls710pME
 QFeZY2xcjPxTZQ8ScbtBNdlvJ4XEs/qlo1d9ZEufQX+pq7joJ6wF7D++vNtcAj63PaLexc+m5BF
 CwYchx1Iz86maVtt+QVKFe+LNLJSyy7n771W48FxK2ZYvrCNknwctl7jrBxOOaYmzZlM5pnyuhn
 Go5Tsa+atkz/BAktK95G0godMRFp+uFmqp1muRBEUqrB1Yuk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_093245_521857_19D08F45 
X-CRM114-Status: GOOD (  19.75  )
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
index 7e1e3739328d103262071bd34ba5f6631163c122..703ade71483803c0a335343d5a7ecaefd8bc93b6 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -7,6 +7,7 @@
 #ifndef _INDUSTRIAL_IO_H_
 #define _INDUSTRIAL_IO_H_
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/compiler_types.h>
@@ -787,6 +788,37 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
 #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
 #endif
 
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


