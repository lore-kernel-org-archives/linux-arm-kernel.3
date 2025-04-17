Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFDCC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1F+vlOB53N+GaZN9iKzvcz7MEqEzLVUIiy6PF/59Ng=; b=ZHPAVmxt8heviASaBB2eRiKx74
	trh6grb8+/c3dfYXkMhedyVvKqprwPKRLe2K0kFfxWMc0lt/DePTsBm3w8X3/zb4OdkQEJ9DqhebP
	TnWG5x3UpKhRD3AhY5YQsIbgQPgOYSJ6IkaRMHJR2yqRsulPLQBRYaiA6+IUzFQKkm01XlyHZf9ZT
	3nC9KDHHOwRKlUprc6pwWLOFDZPxexQ5o67CxlRcbV0BHbGF37Qsfg2domdFF1JY3I6WruksFGZv3
	mxulSJU7a7XyclKJJrAS11GMrKDDwPAyRyF+9qaUJfkQ8VR+Xl70FSS2n8//Fv90lsrTFAq3tMafk
	HGVD7edw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SeR-0000000Dlgz-0l8j;
	Thu, 17 Apr 2025 17:03:47 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUi-0000000DjhU-2vC8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:45 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6049acb776bso445734eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 09:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908824; x=1745513624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1F+vlOB53N+GaZN9iKzvcz7MEqEzLVUIiy6PF/59Ng=;
        b=fsAkyjvfMkWrD1eElm9EkON/wlGC6xeJOe7mTDQm1zO7i7IAqeQha1ZBd3s9cFD65q
         j3WQJwVrl9Ehl49i9aLgwLOixPLvk59lkqOWedr5AzQ33zPjrJkJAiMytaIvYMmRd1We
         qg6JWEG4koJZheOT9Akt+lBPeG3cGeDtEFQhM36sqXVOOcTKCTyc8cELuoTz5mp9XN4C
         iBd9tidjbCsCyA3y0MuT6cEcwHqhk+uvxzVzVhlEwdUi5oPXGTOCwVAvLfdZ8RlxvpDR
         17AOa6alDNFGF4Mfg9kOy5iOgCWDtMzP3QISkB1+5ozrQ9C2xM2wQIW3fcDZMpCSHIJX
         WGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908824; x=1745513624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1F+vlOB53N+GaZN9iKzvcz7MEqEzLVUIiy6PF/59Ng=;
        b=M7imm8aYDnpXPzvEUr3To5kcx30nRnLl+j41JpX/2zYYGu6zf1JH2UyB5NKCnAD25q
         2GT+AKdnvilvPTM3g9cFU5uexsimlc4p9zuM69Zcga0UgGMYVZWrz4j+1+2ajQdj4FpU
         nwLg4RJeGuP72hmmfCa1rx0L2TfAPz0PqtDP7msIJJxVsMlzcYLvkkd/b/f5cIfdQO+g
         0TP2HMvcHY8V5sImrNH5zPKPtpBcTCclxHQvuGrN6rXV5k1lrRHc+RXpCY8ATRcrHwVb
         PAJP4mXhZyWnppVxm6WScXsHiBrzaDkFvCe90FMlMu+ro0LrsDkJcJqvOU3dYywCC7uh
         Bb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXH/9i67AvWK050xKaqwlp+XSDp06910am7z4UGrWm6hoJTM4s0SyOv6+AnMVVZiXVzL6IMAs/sz/SrYRfo1/sK@lists.infradead.org
X-Gm-Message-State: AOJu0YxedsX2x4flieZrPgSra9R4kFssFmMgX/YtFsmlN+kcbYRcF7bA
	UtACcEvhwAL9aqKC0F8e6Uf/V/P4jxTFZ6Jk7jWS66tdmpZMBVO4oT2Ad1KT11s=
X-Gm-Gg: ASbGncsb3g88ACOi/r4Zu4Du3uh8VixPKxiyb21EFv0AHdiFxEURPasrY/ZMeNHyn6D
	1/bKvK8B5vblkicKvGV7SMJ94RMaf4G8uIrUzDJm1GNEMCG1YPuAfgu/FSdeK8q2DdjoWss1ai2
	L0Wo2lPCEG6pVH/57E/QnNuLYhCwPjFHf44/5JC5w/f1Ti4zrqm8hsh6YI3cwe94MLZWJsmZHp5
	+VDEEGDuOSVZ28wOZ5DcxYVf0tvaX08IuFQaEI7ICbfkVnH4nPV/QMLu4V4+T/sytQORhr+RPKj
	B6lfd3xE+AGaf7nQyQSaz4235FkPm4LST6xQpBZWYNL0rJY=
X-Google-Smtp-Source: AGHT+IEKFwTdIVXn18X0mqQJTNwR4Yk4UGM3aZEZT7fmXlltGNReQaAJ+kElPt73dhfKHrVg0VWtdA==
X-Received: by 2002:a05:6870:1708:b0:2bc:7d6f:fa86 with SMTP id 586e51a60fabf-2d4d2d58f98mr4604470fac.35.1744908823626;
        Thu, 17 Apr 2025 09:53:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:36 -0500
Subject: [PATCH 4/8] iio: chemical: pms7003: use aligned_s64 for timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-4-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Be+VG80oZRFA77m6Gt8gOSL/Nfe6cNHnZZZ4OXulHq0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATHtmXXnfyB5zOEBfzyoHuG/ltoONKqIKZ4Di
 d4P0WmcMFyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx7QAKCRDCzCAB/wGP
 wIxICACdc/mCCcb81hretoFsihU80lPcVXFy8V1MRYpADv7qyT8rw2ZaOKBT6PmnabUtyxkC1WX
 zmjyOWxpfiX4jLkNDrcLJE9x52qUTJDYy5RcyB5fq9a2ekDQ+2C28Kgb+XiqJlK9SvIwOMQJgQf
 S3Ov6qj1Q/QvrRrsEg6LQFwlifspnOVIYXWmhzlrKb5LmITB7lRM2RxdN/VFeP2rjr4nRjJU8CT
 nKXM8npO+jClZzs9AsMAl6dn/iYQSr0+toMwTe0sz0fX4riLCS9LGqRasAudxP7QROpdFLpFSlW
 aABPICumbovD+w351IASkkwdw+h7FJ7nMElFz8CN30NLd0Fh
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095344_734377_E1B363F6 
X-CRM114-Status: GOOD (  13.40  )
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

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. This will ensure that the timestamp is correctly aligned on
all architectures.

Also move the unaligned.h header while touching this since it was the
only one not in alphabetical order.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/pms7003.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pms7003.c
index d0bd94912e0a3492641acd955adbc2184f4a11b3..e05ce1f12065c65d14b66ab86e291fab47805dec 100644
--- a/drivers/iio/chemical/pms7003.c
+++ b/drivers/iio/chemical/pms7003.c
@@ -5,7 +5,6 @@
  * Copyright (c) Tomasz Duszynski <tduszyns@gmail.com>
  */
 
-#include <linux/unaligned.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/errno.h>
@@ -19,6 +18,8 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/serdev.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
 
 #define PMS7003_DRIVER_NAME "pms7003"
 
@@ -76,7 +77,7 @@ struct pms7003_state {
 	/* Used to construct scan to push to the IIO buffer */
 	struct {
 		u16 data[3]; /* PM1, PM2P5, PM10 */
-		s64 ts;
+		aligned_s64 ts;
 	} scan;
 };
 

-- 
2.43.0


