Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C41C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoTdUTbEoyHl0+vrXiyaUVCxUuEGKzeZRmULGNvEl7M=; b=X2RTEi/woDVNVboglscG4Yh+F+
	OpXuOuai0CvmpsrZY46FZY57jvk305Jo8/3426soHw/arWGuJVj6Hy3ks982yM34RewkB3ZlXoefC
	VGRbTyv8lnNuLy8LqwImYHJiG2YgdoKDTCGKD5z/cgPuDPq6WKf1Fx754DEl3nAmDg18TlM5+OhlI
	2iPtWIyjRLTV/8Jtl/EhgQpjrhMuXdR5XTzuwNmJOLeKFrhVozrbS1lskhl1f2nzkCls53p/PSpms
	d3AD6UquKdxu1FJ9e/Gi/QlJ/Lyzj7p++5fMUu6InSFzhJ/u200udC6vJiE0FftjwdB1bF5dlvoju
	PC4PdBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBz7n-000000084Qs-1xP9;
	Mon, 05 May 2025 16:57:03 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBykL-00000007zye-2qyS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:32:51 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-72c47631b4cso2739781a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462768; x=1747067568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoTdUTbEoyHl0+vrXiyaUVCxUuEGKzeZRmULGNvEl7M=;
        b=L+ovBAC8l+J1xlLttOXpzBZYbO9xUqTuP8S3WWHV3g43FiEkiOIlmq7mV1ZAFOaoiz
         0OftAtjbWIYaqrWFZ6EasVXtx/9LYkUpPyMTWSXaX062A60KzedNbQjUJ06ZnsYwo/eL
         NEVOI/F1ijlnD2xwE8a5wHr9taWV4pg91KDSALRS24bd0Q8hENRctSUfZ+gGiGFgYzV8
         bd+Se/bwQnj17RxJaSbBi4B51DIxDQurNpoEhiC+csY1N2HCNhYy21nh8x83nmOF2PUA
         L4WI7KqvnTCaQUrwm1DuOOq7KFnM/Igjz/xkb26H+huSWLj5hs9wmP0gliZ0286cS8Me
         63AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462768; x=1747067568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoTdUTbEoyHl0+vrXiyaUVCxUuEGKzeZRmULGNvEl7M=;
        b=hnStFDPdJiTkkDSDoH/1BGAIHKvnhehp9FbZt66IqfurnmTBwX/64/f7iQoPCSriHv
         +GjA4T23ppO1VQMNJiu8v2yrRNS9cfNYYP6/CMPZvjkrV55GA0cFp5IUCPWkQRMei4oW
         M9gvUjrFD9HLqToLDXjA713Woj3bx3nJlv75bWfLrTE/H4CR/TfPOrp8oImEoRWfyqQ4
         VrDwttFF+CRkdLT6YTdnlryVJryPeeGYY2z2ouqykWu1NAkIfQ/RI6ndEkMRskoj94++
         vlAz+7ejshyz4qq0p1b2ZWOJ5TLRML/PVgIrgKfcsWX7DhLNtbvHKBZEdpw/ZM9ccPCM
         lYNg==
X-Forwarded-Encrypted: i=1; AJvYcCU0sZJxv2yNK5DKtfBuTB8X4KnV/ANfmyWhyhxh/6omeze0fXcreG9isqcbZqcBRJfnpb9qZdNgIiYMgfwaUgFY@lists.infradead.org
X-Gm-Message-State: AOJu0YxdJCvSYjHaVu5EAcjLmjHxf0e7kwOKZ+6oCZnLnNWGEkJdToRs
	08lXzcv32xHWQI+QEQwV+u9lnt1OVIDqAZvv557BJRQsIVpe+sxL1QXFsc6J7no=
X-Gm-Gg: ASbGncuEyOCBw2L4GTq+5yUplDoUoQKWT2k+1Y+JhmLpN/82EkDlyWGJbw34fUAncRC
	41c/StK/e1nOm4MXK75x5gnCwVAFLQg8733srTE5ruXARXmpqQVuYAlS/lLqUJ/dU0LTNdH0cwe
	Yr6zM/brOn3NxIZRv8KdNaCPwVXwacpo+bjCZU3fAP6EWLzFqoahMe0avQRGoelTe+4NBEG5A6B
	ofZk1Syk41ht7EnENXXBNFtMS0wgyKEH3Qqq+obJx0P6y1ifGggrvy245OiaDfGrLVEnsiS3DlT
	ccJA0eCW+25/QuNzIQZ+sVZiIYXo2CMemi/Dg+GCdaBCJQ==
X-Google-Smtp-Source: AGHT+IHi1BqJMwn2+ePu/bE4tm+OAhNfcyLxdr7TQkYJqCf+3YKLVqRO9ann0RXlkmT0oNmwsKWWAg==
X-Received: by 2002:a05:6808:444c:b0:3fe:aecb:5c49 with SMTP id 5614622812f47-4035a584bcfmr6037754b6e.21.1746462768685;
        Mon, 05 May 2025 09:32:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:48 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 11:31:48 -0500
Subject: [PATCH v5 7/7] iio: adc: at91-sama5d2: use
 IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-7-814b72b1cae3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=eFnLQvdsVmKraQh8aq+xo4eSFo2W/BSjPzBiG7P/W9k=;
 b=owEBbAGT/pANAwAKAcLMIAH/AY/AAcsmYgBoGOghEdJgEI8ojT+f7QjlFDY6MQvZNWiXIAZEE
 nX4deedFwCJATIEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjoIQAKCRDCzCAB/wGP
 wHgbB/ioLShqxO7D+Edwq5N6S/xksypDEeWYWgeqd58uDkS3sWFGok58Ummx8bHd+QSXm4fmNLt
 7RczIGWSscvNnlTnqXVve8vv0hxKCkoT0oskVJ2J9/6WdrjU69XMJRbOSZn2YcgGTgOQwaWHmHo
 f4Xq9kbDYbkW+QWFtIJ40Ox7fqCK2Mv73rsCrsQeyc0riR7qbsCL2LO/PrZCzRxv08PNHrXvMY4
 gflzTcE8HvZsw9KILWQRiL8HL1U+5ztA97fs7ofw6HmkxalS0rny0fPxaf+e+/j12vO/JaW7ka1
 ROOR8pSMG+DyiD1+fL4zz5CkIQTdQqo6LpT/eXDllIwFABk=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_093249_725150_AE40BFEA 
X-CRM114-Status: GOOD (  13.78  )
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

Use IIO_DECLARE_BUFFER_WITH_TS() to declare the buffer that gets used
with iio_push_to_buffers_with_ts(). This makes the code a bit easier to
read and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v5 changes:
* Fixed missing space at end of comment.

This is an alternative to [1].

[1]: https://lore.kernel.org/linux-iio/20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com/
---
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 414610afcb2c4128a63cf76767803c32cb01ac5e..c3450246730e08cdacc975ed19f46044dc76848f 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -586,15 +586,6 @@ struct at91_adc_temp {
 	u16				saved_oversampling;
 };
 
-/*
- * Buffer size requirements:
- * No channels * bytes_per_channel(2) + timestamp bytes (8)
- * Divided by 2 because we need half words.
- * We assume 32 channels for now, has to be increased if needed.
- * Nobody minds a buffer being too big.
- */
-#define AT91_BUFFER_MAX_HWORDS ((32 * 2 + 8) / 2)
-
 struct at91_adc_state {
 	void __iomem			*base;
 	int				irq;
@@ -616,8 +607,8 @@ struct at91_adc_state {
 	struct at91_adc_temp		temp_st;
 	struct iio_dev			*indio_dev;
 	struct device			*dev;
-	/* Ensure naturally aligned timestamp */
-	u16				buffer[AT91_BUFFER_MAX_HWORDS] __aligned(8);
+	/* We assume 32 channels for now, has to be increased if needed. */
+	IIO_DECLARE_BUFFER_WITH_TS(u16, buffer, 32);
 	/*
 	 * lock to prevent concurrent 'single conversion' requests through
 	 * sysfs.

-- 
2.43.0


