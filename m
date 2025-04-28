Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC57C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLGFE4jWdVqehv02FfXRMamFv946mVo/oPig2GMtSpQ=; b=QSYzhJv2VYdarlKoju0zL9DRJZ
	n+aVZRBros7Agm72uDODxTM5/YuwP+5elXmXblnYQRVMarkga1LLiYyN/c1RvmsBMHgHimj0hwxT5
	9YwYH8ufvs0+qxZ5LL9uVGWoh+8xdee0UvtWMDtlLVMQ+4GrsOhJGhUh4oxJfcOvBVLJbLkA/cndn
	QzoIWYf2fzy3Nz4pRRAZNi/VpM2jukiFCKZSu69LYKdLizevURUC2rIjJaYI11XgfqMYaTF5MkdzP
	g1iOpnKpWXt1bReuCnmlna0ujiQtpX+3mGqO8pAYTjQL7MPDxNTYuxXRPkzlT4hFyxcptgRHwe5UC
	A3K6+kag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VGp-00000007Uex-3Giw;
	Mon, 28 Apr 2025 20:40:07 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V1V-00000007SIb-43fD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:24:19 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3feaedb4085so3688350b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871857; x=1746476657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLGFE4jWdVqehv02FfXRMamFv946mVo/oPig2GMtSpQ=;
        b=UhR7ytJqjVX1BJ5xK1xU3tMkzwj16/oZhLShbe2hQ9IBXsmp1GHKSkqI269c83JVH5
         tfyrW+mIGWDToKPWsNWH3ax+PzknlIlolsgEwzgbKwEcwyWU3L/a7a008DzmZjOAAW3A
         J/tsjOn69yI/qydMsTqutiRamb4I49x3ZIPBr4zWy6ri+zW4cRouhHWo4kxK5yhsIpj5
         AgiuXvmxi5NpP9BimI0NCP9CvVWCqdLISx2gjeDGlcGAh8CofT2jpkNkogYOCdYGtQWe
         lq+YuY5POJI+9InVfFIBdMZOj4Cqxo2/ANRVUVDmE+x1OF09q5ipPjWu6DAk1xvBH24c
         Qa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871857; x=1746476657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLGFE4jWdVqehv02FfXRMamFv946mVo/oPig2GMtSpQ=;
        b=U4ZqEDmW5I6ETH3fh7BKk5t60PtYMH0rCppliXehB+2L7+3LSb0VTsbjuqxU64MxCS
         ig25FWPkhSBxyMdvdElfTpnG0+Oj/FMd9bqwZV8Genp/m8n2dEYw3mfpZqJs8fsGPooV
         xZQqdaO6ePZKHI2ZBRvYpiPYiKsrwmCLI47nULkS7DPVHtML0tY6Bu2Y+ukmSbybeOSV
         ff9/X1PyT+19OANP6j2ucpQPPUkvBGkctUYLkTNRzPHEsMlQ6oMMwQxEyKxC7HPjDZRI
         Y/55QrmVNWM57Dz/7Jjn2snSQqaT56+oruYRm6r02Ooc2XxqeH/R0Hg/Yp8VrGkjxiu/
         JHxw==
X-Forwarded-Encrypted: i=1; AJvYcCXd0nnQkoiI7WyefcL5CGoDFZ/gcBDEvaMCRCbgG2H01Qagc77C5yEXF1ZxPil/iFQZq4P+Zhfwe6pTzz5vYlWe@lists.infradead.org
X-Gm-Message-State: AOJu0YzlZb6HIu0zEbOLlrglJRksfwY99LJDeO+Cm8gfqIVjGWidiViv
	Ms97r/dhmo8c6cdM/TDzl30B0nQk6Z/Xov5gVg79HmfuYH7uwAXm3bhgoDCi3yc=
X-Gm-Gg: ASbGnctR9j6pgkyg1StwVy8Du6sfFIRkK23eNMnsviwQzHTl1uAu5s1z30xDfRYMiRG
	lVTN3xlFSygaKMCDffqksb1PUCv9f/XO4FzU+AZ8prHS5gt5f82KucnleFjXXed1vz3ZmpayNG0
	6q/7bTZJLakvsTHb7wEsrAXqEs27jCP0hSf9h2rpxjQ2Vzzo5X5ZVUHplFuzgGjN3rAlheY487h
	4UGDJqPiWrWgdxbX/Rum+mq2PXS2LaRyJYMBq8+vaFlKpC5h1OZzaTT17rHk36Zk94pQR7L1ZIc
	/Ht+GoxcAwexDQK2x0cGcFJV8ZqbVN/XLBIH2q/jCrdWcMQ=
X-Google-Smtp-Source: AGHT+IH8dlw0ehMbgO7QpiThtCrPLkett8/hqgxlIDqGeXzMuHImTBnndaA0YhdIbBTxOtiX9weCIw==
X-Received: by 2002:a05:6808:22ac:b0:3fb:49cd:6bf5 with SMTP id 5614622812f47-402116118d5mr181018b6e.32.1745871856950;
        Mon, 28 Apr 2025 13:24:16 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:16 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:09 -0500
Subject: [PATCH v4 7/7] iio: adc: at91-sama5d2: use
 IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-7-6f7f6126f1cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=0ZROZIYuD1zVkkOa3PNcABnV8cSDGoSdT6l8Emh427M=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDL4H9/qOSxxJUC0We2S07QzezJ67119YrJbTCBQWHfa3
 IfLlnds6GQ0ZmFg5GKQFVNkeSNxc14SX/O1OTcyZsAMYmUCmcLAxSkAE1nZx8HQaj/NyyrO4M9V
 286Ze+pFsrgZNzAE7LTuNWJ6If864qfJ1GWuMZfv5etfnO7+LHa/YPf0mp/1bKnWYSnie63ab2r
 0xBkZWXdo5t3IqhA+uzThdzbzpxQPznV3+wJ+zHQRzp/qVf/qXOefRbnLtKzCTvyYlT6bx2G7ld
 vixFSLiz2dpro75BMesvzWquvbJ1nxeXli0kTNt+EMgTveSUnPkQoO0MiV5JI5m6e/4+OMlsDLp
 qa22oVqvRl8a0TrTJeJpfy1TZMOWlcpZnsot7lnhYS6QL5s0I2d3+Tca8qEZevC1nO4/D21WHVC
 aR2bhhHvi88S21yanvrbZayUYHweXnBlWt+GFWqm56QB
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_132418_000247_9CE98B68 
X-CRM114-Status: GOOD (  13.61  )
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
This is an alternative to [1].

[1]: https://lore.kernel.org/linux-iio/20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com/
---
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 414610afcb2c4128a63cf76767803c32cb01ac5e..4ebaeb41aa4568e2461506471af0540af9d1a041 100644
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
+	/* We assume 32 channels for now, has to be increased if needed.*/
+	IIO_DECLARE_BUFFER_WITH_TS(u16, buffer, 32);
 	/*
 	 * lock to prevent concurrent 'single conversion' requests through
 	 * sysfs.

-- 
2.43.0


