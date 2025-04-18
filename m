Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3610C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlEEHDv/JjD6VH/F564VEg6t5ixWWwDpak4BAWMlBsA=; b=LpOpWnT5ZzP0E4H3T/1m+gqm5g
	TEnBQ3keAyLqp5friAjNHvqQLiq1FLGr0DKM0ns7u7kqmw81ZPf7oZC7FUPTMm3u61wDxkU2aNDvn
	yRo+ULYNmuwMsMloZrt5JV97WEAl/ykP0NWGcJne8TLNUTy3ek0lfVAUxjfOaNUWmZCEzrpksIRfc
	4QANTK94R8KZom/y0pyQSK43ZptB3Zn7AzsmT0hkJ3oiVtiHJyKGAXcvh2UWtk82YHhab4og12la5
	k93QKkQN7CyJNv9AzAF6kILHNFeCus335rm9w6z8MapY5yRXDEPJdzBZywtjE3tzg/a5ENcWyjtmI
	Xi+AUtTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5sDH-0000000085Y-2GNE;
	Fri, 18 Apr 2025 20:21:27 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsf-0000000041o-1waQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 20:00:10 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2d522f699bcso512953fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006408; x=1745611208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlEEHDv/JjD6VH/F564VEg6t5ixWWwDpak4BAWMlBsA=;
        b=s4NledaV12LPR14oq9Usu8s2xS0RiBWSL+KFBTGE0ZCQOw1ElLJjywJ99Bcwib5Vfm
         /ELAPxXeqaXqdE0/qk4Nv8RLNZae6KCjJXBrVMXoBEPKnKffKu4NWlHThVc0P3DJqESF
         CHfT+5HKeo1FyeqSoBkJmjnZ7dO7J4lvd67Jb28U7a2w9tfWgRPIZWWlw8xZvi5BjmgN
         7zOOhDSMcAEV9nv3Sz1EW1uIOTAX4QS1Gh5BBO1wFTh0zRFHYX8e/fot3Cc9lNp7coul
         DIMvKLdJEmMCVd7rQPKOpwicKRjRl6hnLKyxfyThmvAuwfIsa/Bo3tfk+8Wf4nDbAoyI
         bPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006408; x=1745611208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlEEHDv/JjD6VH/F564VEg6t5ixWWwDpak4BAWMlBsA=;
        b=roGN6++CAL1u0OfWeNaaPyQEr/Ljm+aZKCfOZnF3TzgrWn9I4hBZP6K4oOZBoh3cng
         i880z4iZ+W6WNV9qlw63JUAnFlhDTQwK+NFtu0V/DlVYA/RUhv6TJN5mijrloHIySUNU
         tc6wa3a8+F11OgjD3PUN3mX30ppWmRCYE1Z5HqEqT5IdOD0ONCsL8QYjNAYTz+rsB/E5
         IEhG2lShxVAZLrpzxUwbGfux9MFJ/EnEwpehKEnJ+NFNxYIr1clqnlTQOogNyQdIQySG
         n0uE37cKounTwpIsK3RczYHZrSPMOqNknGW2L9yhMMTjhr3x5H/YMglmPEZC4IgKft+v
         /6Og==
X-Forwarded-Encrypted: i=1; AJvYcCWcDkpKeIn6sEMTYAnrJHWcJKXKjIWzyoljEsry99mKPHpZLLch3DvwKorhS4XqzbFYu8XIcjo+kOdadqS6D8Wl@lists.infradead.org
X-Gm-Message-State: AOJu0YwPEFsGNSfVqK1VjtwHoA7OSXhJvkdPLvVf72nBDnwP4kFUMJ8V
	m3QNXMzh49C+y9xC2KcJaJfrzSFI2FgT8vjAJHnP5vZycZ5zp2dZwCU75RTbTT4=
X-Gm-Gg: ASbGnctMkr2Wl16OBmPkirbYaFRHXCoHLifz1eXk4zN2xvDjqJwKDXvaTQOXFChDY18
	zgsQRwS5NNL6LMBzK6gZ3WVI65iQG8Z/0XGOaGCMUdWQedeUW1Qx+ZgWLjTJiGB25FhU06iML6q
	3c/fmlZrBhnXp0HjMc7N56INaj/5hfaCQOk2GICuih+kEh+idUunuoVZjvMJTwzaH67kQIltDd5
	k2wjMWG5PaRCFJa9zXAzJcGyjlAEV2Y65bfTYslvPuuqNxIhoV1RstwJlBPttAiYwy/AyTfYoW4
	rBw8P02pjwrE3C7tLkwEknnc73rq+Utr7vdRU2JBJgLnV/4qadBWeIi+yA==
X-Google-Smtp-Source: AGHT+IGr6jWJlv3BH4w4Ps2j1330V0WmKydx70JnXcNoazpPHvVerIJTYwy+J7D4DhPX9Wk8OvfSYw==
X-Received: by 2002:a05:6870:ec8e:b0:2d4:c55b:199a with SMTP id 586e51a60fabf-2d526af63cbmr2074229fac.18.1745006408488;
        Fri, 18 Apr 2025 13:00:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:00:07 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:29 -0500
Subject: [PATCH 10/10] iio: chemical: atlas-sensor: use struct with
 aligned_s64 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-10-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=anywE7XPQeNCDKeK0PUagrE9N3D2Cd5D3ok+OCQfyOY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8nzp0+Cmfo0t99KU1QNh1dT37rrLQG2SzNH
 U5outJwJB6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvJwAKCRDCzCAB/wGP
 wKuNB/9sC6Bs/gHTswHlJCsOQM/Cjv9JBeFqLqwPG/EH6lPVnuMM2r0CjXLaKZ6Sod/kwk+E4pt
 PNtFh4rt+VvxCpXg1H0wPTud1mMFV0tkDA7sJwxDGX3Z94mw+p7WvzEoCCCx9HSBkorH5YUMaBP
 FCGeNDyvZQ9+L3skA4biUuoQKswoX/yqxNlCaGcY5dG++zXclH3PsId+6ITHnGlrGoHnpFcs0Tk
 2lRJbQaIhxof9SiZNt0q9xABQZsm6NFC63JdQGq9OgxSD7qaa/0W45hSH8XuZCCJndZw/VVEDwj
 Yi1sy0l4M68NpXKzIiV1vXzyy+beWErhT1Jlka5PNTGLOmpl
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_130009_510026_6A8A0734 
X-CRM114-Status: GOOD (  13.66  )
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
 drivers/iio/chemical/atlas-sensor.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/chemical/atlas-sensor.c b/drivers/iio/chemical/atlas-sensor.c
index cb6662b9213740f4a88b8412e6a0f01bc5a314d6..a67783ce7f1b68135e05d3afc05533d400d4a052 100644
--- a/drivers/iio/chemical/atlas-sensor.c
+++ b/drivers/iio/chemical/atlas-sensor.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/trigger.h>
@@ -91,8 +92,10 @@ struct atlas_data {
 	struct regmap *regmap;
 	struct irq_work work;
 	unsigned int interrupt_enabled;
-	/* 96-bit data + 32-bit pad + 64-bit timestamp */
-	__be32 buffer[6] __aligned(8);
+	struct {
+		__be32 data[3];
+		aligned_s64 timestamp;
+	} buffer;
 };
 
 static const struct regmap_config atlas_regmap_config = {
@@ -455,10 +458,10 @@ static irqreturn_t atlas_trigger_handler(int irq, void *private)
 	int ret;
 
 	ret = regmap_bulk_read(data->regmap, data->chip->data_reg,
-			      &data->buffer, sizeof(__be32) * channels);
+			       data->buffer.data, sizeof(__be32) * channels);
 
 	if (!ret)
-		iio_push_to_buffers_with_ts(indio_dev, data->buffer,
+		iio_push_to_buffers_with_ts(indio_dev, &data->buffer,
 					    sizeof(data->buffer),
 					    iio_get_time_ns(indio_dev));
 

-- 
2.43.0


