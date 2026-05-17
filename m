Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A601BCD4F4B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsMbxEfC0uMa+kHsY4taTb0VH/LIItEw6BfVK+qBf2E=; b=dc1ekeVXwZH2qxXqrTgWac6l9n
	159A3pM0MDuPsVH7B3LgkUPBAuy3OiSoML2mmDNBqyk1NH90CobIS9zeve7lzlGVUnr8hnarBBVjy
	52o7+o6xbVsOsSxDcyg8xRvtHndeHHYyP3Fo0lEJN7xWN2joKn0wQqEXGkUFjrrryapRC74fA1/tu
	0JjhUcfjYUaPNrlhbfRwEovi2Q270XOrV+dHh27rNJwQoe+qlCZox6jmJEdlyxfV1KFxqmXWFAmn6
	DODybRpKjD9aPMWfnaUAZRBm3oJAwAIAqDx7EVm/DS+5nRd+yHRLM66O9CrCs5hF/oCDXZEFmOaRt
	mPVZqrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4V-0000000DCWV-1B3Q;
	Sun, 17 May 2026 18:18:39 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4Q-0000000DCRd-189e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:18:35 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7e4de538f83so921168a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041913; x=1779646713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsMbxEfC0uMa+kHsY4taTb0VH/LIItEw6BfVK+qBf2E=;
        b=qtUcQ53Mc3xifF3hKsrodIRxYVnzIPt8GvhIMvdG0YwDKDFHIv2s5VChNTOBl6PHsW
         P2LNu12pBbkv6sKlIPCZlt1VlD8chBnEekmq3EOf53P/UA7DYT5PTqzmCuuTg/+PNN6k
         bozyVDsXyAN5uEQOKPx5I6MusNP8vzH11p9HQ5huh9FhNpoXlzeuvNudHbsLvuza2/bj
         U3yH7AOUub9h4syu8+m/KK/iCYGme1IhrxNYKTgRwvtQ0JmN7YMuCtrNaTPHBr1FRsa1
         7UN0lvQz9NLq8bmSHXG0fFKG9ONn8T1/V5AQqY1tJIQeAKMu2kGdC+u6k06xboGNDyD3
         KEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041913; x=1779646713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsMbxEfC0uMa+kHsY4taTb0VH/LIItEw6BfVK+qBf2E=;
        b=AFuQZWB2Rgh8IuHo4crFg8jceaxsFi6+TKxQbJUryrNiQfsqnoN3qOnP84IQrcGmnl
         FdTgZRhmXBVnYjwWV9VQXZxoMEipc88h2lcDFlOq24iJu2HnV39tJC/jY/JKLdzyHkqL
         0ZSkq4lgeYSL6cEAmpg+hhQpZUshybLLBz9wfxX+yXchbmxba38hdpkfl/FLFNUhUm56
         5gUwWOTqSfjaKz6UnbQckFIIpWbvyY+wgSPQXPV4EcQp9FcEDp+6WyuuBk8iOaBhPxcT
         amc/2frM3c8Xi1/g7YS5xhjjuYAfunSIPSBY5bdpAVxDZm9SYycwg/tJ99xz+YtNpU2A
         KEug==
X-Forwarded-Encrypted: i=1; AFNElJ/qpeUjQnrk1cOUNsJYZZs4eq5yNdmTXn5FrWHy2NymgaCnwAT8OsL2YbIIChh8Hfj+UyBD3GLlKWZw/F8FvKI2@lists.infradead.org
X-Gm-Message-State: AOJu0YyL4SWE3Lh739kl4xmU9bOVKS3zhMNhZZ/Yh0otBDUR+BYGPTE+
	c2CyuWsVnb2hTbwibu8kg7jo1Cx68EOzkc/gh8uKC0iFrI6RCkHSCeh/WWdr8Y/eAGE=
X-Gm-Gg: Acq92OHYOGICFeh/M28tOsLu1zr2S4Kd6ECulsDoOx++mkgnIVX3QdiTePzvJLsLf6Z
	PhjRkfcZZbqFiaTfG68o/n33iIPmZJikVzP1wWvuS/iDAKgZBvJMNL1aPj5mlC3zc6aZnY2JJvR
	M+cmo9+LsNh4XsRr5VXd5wkCoYzf8++hQZLTrf3UUAttYgCsOUMhD2/fjQGfJRj9rHN9/paw105
	1GuX9/Vqq/VlfvuPTkEMZtMgkFojIwdoR9jyezwIFVoX5aBpJKVxGV/FT6/tHGfDz7gB87Yp1Ms
	zXzfdxXErpyz+NbbppIBvf5RjI94H69251BrpGr0ndIFnMkRiRnihNn+LWbzXGyVYTthQg1zVUG
	XR9wQpk8q3chuOkod0D9QU+8oiCbrWh7Rhh3cB0sSVGSZbjcl+y0dj/UhQGg5D9kezkeqQQijwf
	SVNBgBVELzXzl0BpLDgetRv+upv4k=
X-Received: by 2002:a05:6820:16a6:b0:69b:196a:de62 with SMTP id 006d021491bc7-69c94377590mr7647901eaf.27.1779041913148;
        Sun, 17 May 2026 11:18:33 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:31 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:22 -0500
Subject: [PATCH 5/8] iio: adc: stm32-adc: simplify timestamp channel
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-5-61fb908c11c7@baylibre.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=G7Szwiws6C+kXgCk6xisivu6OlVDwdV0dSr7Bj27sJk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZRVFRaQSBdSkHoxJ6yR/B8XlsRDlUP3cMKz
 CVIMrFdEM+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGUQAKCRDCzCAB/wGP
 wOtRB/95xIxW8VGaKMif9Izi7JG162j0YqsXHso5T7C3wBxKCbha4uf4X+4lM2uAPDCUAIYTa1e
 hRZUTSXFWZfvnvqS+25laf5z31Wa+ybT61fYxb87EXbWlhwPPlfS/BvXjYKeWljsJNw+/VvC5cE
 DY5MR93FTBEW0Oy51IA+PzInlkVDYO5NvhgDF4UBBXxQw9UdzVO1dcHe5f2Uv2NRgPokVx8OX3G
 +70ao6CG97J+tL6sk0SbhbajYAYyM3KBEQ0JsuymiWfyKo5HvxpGtSjjB6wk9WjOYQ+sKnsnxv4
 YmYMoLuBNLjDgWWPLV1doL8ycCy/rp+0lVvXbLzXCC9R0pJh
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_111834_336046_F8CF1089 
X-CRM114-Status: GOOD (  10.93  )
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

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 46106200bb86..bf68f28e7c3a 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2443,14 +2443,8 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
 	scan_index = ret;
 
 	if (timestamping) {
-		struct iio_chan_spec *timestamp = &channels[scan_index];
-
-		timestamp->type = IIO_TIMESTAMP;
-		timestamp->channel = -1;
-		timestamp->scan_index = scan_index;
-		timestamp->scan_type.sign = 's';
-		timestamp->scan_type.realbits = 64;
-		timestamp->scan_type.storagebits = 64;
+		channels[scan_index] =
+			(struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(scan_index);
 
 		scan_index++;
 	}

-- 
2.43.0


