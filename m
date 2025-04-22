Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B94C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9K2B+Xay9TH+WRl+WF3lyeO5h1JwZugbslpoI+5AHg=; b=RPoBkfRiWNgACs2ag/+QfB/LF5
	MsSQE6wHjh88D0TlUuSMitaPGM6FxyDYa8xCo78Att0YnStgsG1YykHWRNiDF0EW9FgBCSh4dNl1n
	SBKacTOKljf49Omr+zECW0HgO+A4RCFoxEDrF/5plki2vbrUrmCU0hkz0x+UtYtRJXEBZNGYH+xUI
	7gs5Z/nC5i4DQdj4pFXQQE0XpLqPwuUaeU/UkYGfV2qm2H++RCwOYl6CP3+d6a0Y7uz4UrXFcPfNc
	dNOyde3nyjSovEpK7+fBCs9TZ4RPHfqpriXMCnW4d0xThlWeJkmIW7owV2E0fu2ClMQsoTBomzYEQ
	7PJ5KbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LvB-00000008h18-2Lsc;
	Tue, 22 Apr 2025 22:16:53 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LnK-00000008fnn-1Nno
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:08:47 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-72c7336ed99so1692201a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745359725; x=1745964525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9K2B+Xay9TH+WRl+WF3lyeO5h1JwZugbslpoI+5AHg=;
        b=HZEsc2AHrol4aVlmRLjUj5R7SiS7XwmZVHJoZWkdd+foglmlBv7pnAxz+LrEcQzXH9
         2ad0Ll66Z/2HYcwgu1Pic7copUcMqNJ2OR3+3/L5seXTveYugq/m4QOUdZFLkF88OUNU
         ND3bu8yHZqlz2wGlzO1wLzlHBxperyNPp+y1xnS2RWZAIuwaY+ue3cRO6MupJgposJfg
         b7SmyIEVcb/qlQijdUx+d4cEF7YgRVwFYgg80XGjR3viOBo08EE/WOo6Iyf85lgRjmrX
         ZoF3mphUhoAHbL/S1gPBQpWXvCjNRtD17WnGmPF+MtwRDnsjlNEqZKkyyD0mrWzFrs+x
         /ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359725; x=1745964525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9K2B+Xay9TH+WRl+WF3lyeO5h1JwZugbslpoI+5AHg=;
        b=t+D/+bv0rJTtlL1dEtmbgZQkHIh265vodtIFBfwEf845MxEOtNwd2pIIEv/wnxF0m4
         oa6YfiMBuz0yiLkQLxdEFwmI7sFFrmbc4LWsWIMVg4Az1lAWEEYG6bzBG/1U8ECApMiW
         Dt9FIMSE8e5aLv8Fs7GpMcF5YVHjvW6F6zC/BXFL+5whJou4bu7ekDQIfvOYyl1dAEfY
         OkBilmplPJ7Vh/ubj+/elr86gcSSOdJzFHzsuZ1q83zzy3UdNpwpkmd2lh+5e5TRfmRK
         A2o00GDpyBalgPkPurGFKwsnLVRXGNG1oCgXFl017B/RFgzLwbycgnq5WS1Vz/MijkWe
         ssBg==
X-Forwarded-Encrypted: i=1; AJvYcCVWWyeExCg2efNF18uvfGxr3ekP7Nl1GC7iOjH7XUIvrQg+dNjsLmLXAredp9yBrWjWZ/gsms+GanfqdwOjCQ67@lists.infradead.org
X-Gm-Message-State: AOJu0YweQKPmnLpKgNvgXjpB+mDA7UgdP9VnA9gNxt3y7mYP66R5Pm15
	CGwGbWCfZycPb/XdAIOtlmCFI1+cmBuLuXTmpf4yfqnAN5Y/Gt0UqGbOI27ZG1c=
X-Gm-Gg: ASbGncvnOdoKWlXKDQhT4Fe0W9wbKi/0DMdt+IFd1vuMirwohEKCvNUZt4PkaaVCgRf
	B/dJb33QLZtBj9qnTZEyE3nnanDfLlFD0Kq3dJfGu47BCOBlipOYbcUrUHOhvqYT4gztcB0Y819
	IjnqlWB/OgUSkSyAsa+ZHjyQOhU+xcGIuCQdb2httkwlNohcBD7ZHELvfoN5q5quvl3p3ysUW5M
	YBS9sYClDSeVtvcgCtdRLu4a9IW4tcTUiXR1Qiy9HdSXl8+yCBjUWCqP0ZBIw8W0CF9DThiZBt9
	DDtbktD6DxrM+1jeWHQrtoPTd+U5ltvTkaAX8BoK79vLUXg=
X-Google-Smtp-Source: AGHT+IH9UlcMwP6SptMTSFVihJ/iz9gBXiP46PQmSgYR0lDL6OqVr1KITJanla834aaysMRXitqaWQ==
X-Received: by 2002:a05:6830:3813:b0:730:da:1165 with SMTP id 46e09a7af769-7300632c65dmr13414959a34.21.1745359725278;
        Tue, 22 Apr 2025 15:08:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730048848dfsm2265938a34.52.2025.04.22.15.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:08:43 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 22 Apr 2025 17:07:46 -0500
Subject: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2962; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=nCzR1/emrbeUL84tCt3IiYuUEVzi1rCzDn2Z6fqJM44=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoCBM9pXsoFeECQODQSXKUf+R+nqAiwzg2R14di
 eSX7AycMvuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAgTPQAKCRDCzCAB/wGP
 wDU/CACaaPDIIK7yQ4QaByRNrsGGx3mAq/LvHL9GakyNv998abhnWQTZ0Ue2ye4vTXEsv/ERja0
 vlcjBv6HxuJ/mPV8MzNx6Rah+WZIAe0rcTIuBx4J7i+Mso7eGGVDp/LjMLePye3PYnumWKpavRy
 Yk0p1RqkgEIhIqTi+GggQYvsJVZ6h5ngl02BhN02xRtAKV46VjQci66m0EaYvmApDuqg0UPNjcZ
 M96Ap1ZaJxoNNvdMht3X9sIr5zcqG31wGiAQDSdCcdJTM4HYBVdPFlkIcpCGmnytcviPQmjjsxC
 /8f8RJrpl5Ip4TJfX7L/LddlhzV8vamiGUCUTqizsRvrrldk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_150846_368625_FF801D7C 
X-CRM114-Status: GOOD (  15.98  )
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
alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 include/linux/iio/iio.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..4dd811e3530e228a6fadbd80cfb2f5068c3d6a9a 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -7,6 +7,7 @@
 #ifndef _INDUSTRIAL_IO_H_
 #define _INDUSTRIAL_IO_H_
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/compiler_types.h>
@@ -777,6 +778,41 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
  * them safe for use with non-coherent DMA.
  */
 #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
+
+#define _IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
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
+	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
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
+	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(IIO_DMA_MINALIGN)
+
+_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
+	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
+
 struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
 
 /* The information at the returned address is guaranteed to be cacheline aligned */

-- 
2.43.0


