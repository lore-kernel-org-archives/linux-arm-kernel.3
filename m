Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA1AC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 20:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsDoH9wedifhugPM5JBN/pxKp+uLG0gE7R6WQkp6CbY=; b=0xRfw3qoWzuHINWfyReStbyvHa
	ZwNlBgntS6hsU7MKmD95elgizOXh5ULmcVbe/FuByD1XGCFyTP32Sd/eaB9pzmbXPgepFo9YbPuTJ
	/3K4LfROzUgaAMYhS/q7SenJytOrINzvMWExOSBk1HKKJheOgx/5DpP42DcBPLSc8nz8FC61GnmEj
	ukcuTi92zASZbUAJi/z8SxKxPTF+qGe7wY37KmWIYhFejCqZERPaQqLdzpMihYlKwpvwmoB+pfZB6
	RqfidxNiz85QxdwuKaYsisX8UvUss1IGdrUkn74yt97gWkRu0wy7eaYePlqj8zYxp36p7KKLRp5f4
	fSQp63BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCleD-0000000GiLp-2WDC;
	Wed, 07 May 2025 20:45:45 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClcF-0000000Ghz6-1JXn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 20:43:45 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2d54b936ad9so169482fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746650622; x=1747255422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsDoH9wedifhugPM5JBN/pxKp+uLG0gE7R6WQkp6CbY=;
        b=kz55gTokwmY+tD22wprPz7+eV7z5AKYTGWHs+xBYPoQAvMCqnUizmMQ1Zlik32XjjJ
         fxR5gihyWyhkgzOigi5OIOYMZ6MyLhHAf6dwjR0MtsBVVGGP2+0e1PltyZMzy99SWVef
         TegurUefiW177y1nBGFRwDCsSGdO4y24NqAe7Q4vc/mNYwDNbgWM5Hcc+fgSgYvdE2qy
         hKQ75Z+wzeXqdeTVwZYrulCGRQiOjyjIpudHd8dQiIEE4ItkwgrrpenkeOw8Ep3Cqn+x
         iHhO8iTEKAZcg/QkBuiGeY9zis7pqb/AUCtxXjpJ+ScBp2mKcMq6H/0zPGNrQx4mhyvd
         kgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650622; x=1747255422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsDoH9wedifhugPM5JBN/pxKp+uLG0gE7R6WQkp6CbY=;
        b=tON3XPfFb3q/EDvlcz1vD8Nb1CfF3Pj7zTCmmjktUoRdGaBZxzd1uMbQvPg18qvXDq
         SPlY2uJipo47S9YffZcRCPTDTIAaH38qsTJ8DctcMF9AkvDj18hRLeRUnnHSfRm5ZjJO
         rV5RyS8ARcIuIGHW74cNRwmtnLITnYIm4YQsc7v9I7xHTWbUh0vxhVuF3NNpGEEdhffG
         EVJj2BrSORx2iSWr0he5ZGz9pTAMhUy7Maq6yLDxc+4JKgrEmlQZFUoztk9tV3JmxZnV
         lH7201xF5883DHXnTOjzCIEYYz9DfebxiT+Jumuf8fJUKW49AGTZf78nEfg3E7JElTKL
         rAlA==
X-Forwarded-Encrypted: i=1; AJvYcCWNHMqLMWUBAOypgnvwzQqcgtzalI69VBZfL+rlmKp8mYG27lNKJJHO7lbwm13Y5PGrG+hDlsI9Gm2iyrlYpXbV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxx9750D6SSJhp9TsE7GC5B3BQLJ9ORTqFElttjN8S3rEYXtUD
	agQk/hzERR4oOWn55IqFQ+ibdSX6YrM5T5k5iNGP41MJJ1SmeRoQGwk2T5TfgPs=
X-Gm-Gg: ASbGncsxVg3piyF+U75/GNzcs47I4ONDI+tfY+vq5dzSJbZi5TbwWRpVULjzaAcIkSq
	curHBRrY2BU3RBg+omNxzrkNPXGWC5DFBHIdI0HS6xlYz9yBzVm1+F8dfuunPf4m5k3ZCnoO9uZ
	4MC/5r2wCJjNjgtOfrHRCraZ/OXfDLBMIYeOWL9KmxkjzaS6/BbrTfIdSimCWwgFYXTteMROgh4
	qAIPzJlVRka22EsDYJfL3IwdqlZp1rMVM362IYeVyYXwY7aTRAUf8BNmdCyBtvl0SgsNnzR2nU8
	PYL5JweF++mVgrYTVZzRCFuBTrqRIJn+Imqc3iSaUSplPQ==
X-Google-Smtp-Source: AGHT+IGuMbSopsw0kPB3BOKdZwGLMyA4fTqZkg1sp+VqbZBKSh74y17YUdx5+VNzA+Dlkjgu5EqA2g==
X-Received: by 2002:a05:6871:692:b0:2d5:d5c:a851 with SMTP id 586e51a60fabf-2db5bd81d15mr3352825fac.6.1746650621211;
        Wed, 07 May 2025 13:43:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5cd716d3sm898642fac.21.2025.05.07.13.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:43:39 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 07 May 2025 15:42:40 -0500
Subject: [PATCH v6 1/7] iio: make IIO_DMA_MINALIGN minimum of 8 bytes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-1-4aee1b9f1b89@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=KXhEzNu9vMA0LlJD+DPGW7NGscBEnrm7VeMGbRK9U/g=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoG8XMenAMAnq7gPRRFS22x5xeEEEtJEsUd6xym
 y6ke1GkKsKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBvFzAAKCRDCzCAB/wGP
 wLngCACRoGSeRFy1n5EjP/iotCrHZcEvDzkEXMr6F/ZItm2ApnS+GHg2GEuOB5DOqzcUTIIXHCL
 9KQ+3veOSVxITb+z1+PHlVLj6hf79gLTAyV7h9dW3x8s3rY3fCT58TNwyK7/Se70eOlNThdaIu2
 pkXyZHdfmNZPSjbfvTMxxLG4PsvkaX1byJZXk40WocOq0pqQXFzD/5+jvGeNRfsUHhrhPN0HCJL
 Eg2YmfnUHvbYbWafrR8i25s9cd+kPm+MKU9xU3mEjale2EtU96Ej0fX4fvekuvWL8X0rClfwM3S
 cdjsFjvGtSkBlUpbBSnj3SZSLZBce9MRNi27B3UPREc1YOcX
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_134343_508567_1729E65F 
X-CRM114-Status: GOOD (  15.28  )
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

Add a condition to ensure that IIO_DMA_MINALIGN is at least 8 bytes.
On some 32-bit architectures, IIO_DMA_MINALIGN is 4. In many cases,
drivers are using this alignment for buffers that include a 64-bit
timestamp that is used with iio_push_to_buffers_with_ts(), which expects
the timestamp to be aligned to 8 bytes. To handle this, we can just make
IIO_DMA_MINALIGN at least 8 bytes.

Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v6 changes:
- Removed the #if and use MAX instead since apparently clang raises an
  error that __alignof__ isn't defined when used in a #if condition.
---
 include/linux/iio/iio.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..a574f22398e45cad1ea741d20d302f88756a1b13 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/compiler_types.h>
+#include <linux/minmax.h>
 #include <linux/slab.h>
 #include <linux/iio/types.h>
 /* IIO TODO LIST */
@@ -775,8 +776,14 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
  * to in turn include IIO_DMA_MINALIGN'd elements such as buffers which
  * must not share  cachelines with the rest of the structure, thus making
  * them safe for use with non-coherent DMA.
+ *
+ * A number of drivers also use this on buffers that include a 64-bit timestamp
+ * that is used with iio_push_to_buffer_with_ts(). Therefore, in the case where
+ * DMA alignment is not sufficient for proper timestamp alignment, we align to
+ * 8 bytes instead.
  */
-#define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
+#define IIO_DMA_MINALIGN MAX(ARCH_DMA_MINALIGN, sizeof(s64))
+
 struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
 
 /* The information at the returned address is guaranteed to be cacheline aligned */

-- 
2.43.0


