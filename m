Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzSqK4qY9zcb2u1Jy55Elop5xlKMZ/WslrYn6ETdgHk=; b=dzIUr6/BT1pz2rUyBbaBS9KDu7
	UjPpB2yvtlk/9UlN+0xu255BxPvAeQuY22+66q0OidI2iEi4e6951kIZlooKtKLaHDo9TUWEys+7K
	htsiA3SyaITWQhI1HP00PrFYKAvbBDiMd8c76/dywIZroGY2aoW6KsvyOJLX59AphijqrM9hA5H33
	3PSAleIzmR5Nu6sY6m9riI9oY+Sjx5HyPRdCxIDE0qzDTVxtyFRpTLIBU8kynz8Mw06KOxloMzPVO
	Hjs8logEOJQU2fFaKaAiPKEaJAzK81QprZtEe79bl/FZSM2vaIYB0/U3U32w4veGDtXY64bB2iAnr
	HdOKEIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5s3j-000000005ti-38xn;
	Fri, 18 Apr 2025 20:11:35 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsR-000000003wS-2tAY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:59:56 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-72ecc0eeb8bso481429a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006394; x=1745611194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzSqK4qY9zcb2u1Jy55Elop5xlKMZ/WslrYn6ETdgHk=;
        b=oxgJ5cI5DXLtOixfvbP1gH18W+84dPmNl3S9csh+aquZ9DcRGyzISGjbaX0Ght2zfR
         lizX3M7OY4bmsGgxph8JcKT8dxpZ8nnG1GFiKqrKeGHLBymW2FDaYXwjBO6pN7uA60Cx
         TES8lof3wWSo9ozhTtuUvmgXUARVq11BGdE3XVgvarha1tPoJpK2Qchgg9yyrRrL97Cs
         b62eenOqRh4nR0GrZ5jivJM66mNEAPwR54AGajwOzXTHuOp2lbFCIUL+BGPMcQqe7BxZ
         kyWmfIdmgfD3B3NSdWtxlO1d0SkfIyyv4RD16Sbbp7gM/LaYFKJ4TD0CNbtTLCZf8Uq9
         aR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006394; x=1745611194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzSqK4qY9zcb2u1Jy55Elop5xlKMZ/WslrYn6ETdgHk=;
        b=vYgh6L5fRN3q8h8GBa6LKVfzX5BlD/pXbSkZP+9goZt1P+JXTsoWVYdOQREoNooqTz
         gzKFzLJCkQ8ejmsWGz/Jb4y+00G68fxbbvwad098K5pppZa+jfDekuDEUi0G+TeI+BT3
         qI23Gd7jjoJ8kq/xXatNPhpGs8NiU+QYGJaus0ojKyWZS55D3U2KSWEV27pZqF8l1l7K
         ZYYP4iZUKPZWgmJg8/B9wufPMrqMq5KlagqXrHzh8oMywyOabLeHtw5xbv/C4Vpb/3uy
         RNsAvX9ibuKK2lpnUgJB8aMvzETcIFc7Fcu94Wxw4Zz40DPZiXMhGOaLxVcLm5rtZk0l
         F0Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUXGLP3uGKN5YB5dCOLRwhT1cb/JkPCEXDxGWTZz6c7+YgMDRpsvru7s0fHMaGkKlkuLz6vsr42vocYt7wxGeiO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk7rOuW0IBnU7p22DFmxnXtVVYvRSjq8OgUlrmmfQV5K7TmaSR
	p8HXx8OD8HrdDQiaO+JsQTmIj2XLg7KacrjHk+m/ZAMErbD9RFv5n3TZMDRQz0Q=
X-Gm-Gg: ASbGncs3uhoMsXvrKb60ocOa2Spzh+l1ojoq1sXgRR2UxlB1feVwaIbBq2KLA+6QQQC
	FXeSZymhY7ERisT8PqlL2S/LbOxvfYYkqAHeLNNccOcc3jyzAmM4vQLCu/efAoqxr8Lq3Yvnwtn
	qJRBPDFeFifncxBZ8hMMDILI+tGaDjaLdTmKSyo05AShsq4s2fk88fw5U/kYYPcWoS6rrstP+u7
	kXu+YxENWtE+dve2iD/SkYr8O/KgP/i1FK//gmkyFSFN0Bppana0C5RM2+npykWq81KwD7iPWP3
	5wjdcmqUgYxSebgoB0MOogEHIXblYQXiSfFFbSBi+JPMhqU=
X-Google-Smtp-Source: AGHT+IHI4O5x+wPPGV+94eQGC4Hk/EXR2vmceT21i5pvhTSn8o+7MxvxGNT6vfB1NACqkNwl8RvUag==
X-Received: by 2002:a05:6871:7286:b0:2c1:4146:c556 with SMTP id 586e51a60fabf-2d526d6841amr2433872fac.31.1745006394498;
        Fri, 18 Apr 2025 12:59:54 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:53 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:24 -0500
Subject: [PATCH 05/10] iio: adc: stm32-adc: use struct with aligned_s64
 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-5-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=lY3P/BHYMrMzt2KYi0LGUhjMzgl6dv5K0V1qFBaK3Yg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8EXey7ghkTICKkPtv4/67AoklbnfdqMoKh7
 TTWqGpmphSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvBAAKCRDCzCAB/wGP
 wHs6B/4sTJvHSSz6HmN4Jpf1hTnTzsCIHEnlOXlpjG7Pghs62u4n3Ku3uOCaSRMJmW8aPzERMxP
 EjQlPRX6KJhN02AzJJoLomnrGGAlKj7GTMshKYPld4I1xWH/wO+bvbTFWweAMtCYcz4wQfNoFMg
 cwyrNg/zAqQRG3mlYiQnk4s2TJ5+eite0qbnYZPq7xEU7Ky8GDlFTjYDwSgQ10AeOc0vqOIzsB8
 kR71fIXS76ZP1eN+CPrzVIJrpUKXC8rZ7myCL61/wGjr6qdg4OINWKinpTupJdCvUVcKhD3/6GE
 fMhBvDLohiP4ePwyNH53ZIr20gZKjtDb0cKa93njGvhC4hl0
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_125955_733620_3BD04E1A 
X-CRM114-Status: GOOD (  15.97  )
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

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 5159908a2a6100b62e5e64b2b469378ad778c35d..81df0d45784553c87c92995934884138939ac899 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -27,6 +27,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/types.h>
 
 #include "stm32-adc-core.h"
 
@@ -261,7 +262,10 @@ struct stm32_adc {
 	u32			offset;
 	const struct stm32_adc_cfg	*cfg;
 	struct completion	completion;
-	u16			buffer[STM32_ADC_MAX_SQ + 4] __aligned(8);
+	struct {
+		u16 data[STM32_ADC_MAX_SQ];
+		aligned_s64 timestamp;
+	} buffer;
 	struct clk		*clk;
 	int			irq;
 	spinlock_t		lock;		/* interrupt lock */
@@ -1447,7 +1451,7 @@ static int stm32_adc_single_conv(struct iio_dev *indio_dev,
 	} else if (time_left < 0) {
 		ret = time_left;
 	} else {
-		*res = adc->buffer[0];
+		*res = adc->buffer.data[0];
 		ret = IIO_VAL_INT;
 	}
 
@@ -1559,7 +1563,7 @@ static irqreturn_t stm32_adc_isr(int irq, void *data)
 
 	if (status & regs->isr_eoc.mask) {
 		/* Reading DR also clears EOC status flag */
-		adc->buffer[adc->bufi] = stm32_adc_readw(adc, regs->dr);
+		adc->buffer.data[adc->bufi] = stm32_adc_readw(adc, regs->dr);
 		if (iio_buffer_enabled(indio_dev)) {
 			adc->bufi++;
 			if (adc->bufi >= adc->num_conv) {
@@ -1858,7 +1862,7 @@ static irqreturn_t stm32_adc_trigger_handler(int irq, void *p)
 
 	/* reset buffer index */
 	adc->bufi = 0;
-	iio_push_to_buffers_with_ts(indio_dev, adc->buffer, sizeof(adc->buffer),
+	iio_push_to_buffers_with_ts(indio_dev, &adc->buffer, sizeof(adc->buffer),
 				    pf->timestamp);
 	iio_trigger_notify_done(indio_dev->trig);
 

-- 
2.43.0


