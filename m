Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413ECCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMUE3/7kINiPQNa3IbX9MLqOrJoUgIbbeots1aiBMpQ=; b=ZdShZL3QajEsiLHmDc9bvj+Wze
	VWWzsrVtAtWZAJ9ROrLATDBzjWueTZTrjOi7TUAIYbCA/CCl7c7BH/8nk7f4uiz+RNPmvuWkeJ0uM
	orAR1G2QdsNpGEtSehrju1x8+WS/B/W7Q7qEOghNaBeCF0EQKxtq3HcHTNXNoNIYPnuB3GpNc+B8k
	DyewZkOjpiMTw3r/xNqtKezY2llLS/jhxzHgDa+AL5iTTDwEy/lxYr0pLWZzonYZBus+ijVQODF+2
	hCKiw5eRfhd4Nls//p6Oez10D6ACm2gAzVDBPsKoCpYp57d7C6bqZL29dnQnUa+x4ty0JmMvwLWVU
	AsDhn9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIM-0000000G1lI-1YWp;
	Mon, 25 May 2026 01:39:54 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKII-0000000G1ib-2hyI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:39:52 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7e5fe62fc87so2427596a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673189; x=1780277989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMUE3/7kINiPQNa3IbX9MLqOrJoUgIbbeots1aiBMpQ=;
        b=KOxGfiZDmh1zHCIv7Ny4xN/U1VbD0n4GG6z6LNxXynCG7XfRxEOP0GnsyUrdAfAgPC
         /v/h11ovGf7M+dplryImrLyEH9F2eZ3azKS/Cgqiu9M26g762ZF3VVyyCxy4ar4kQNZM
         0YpN5yIMRLK1rlPYicNYWFYPvcg/cBSpLGzNfriaWyfQtnZ4Mu7BmSaa7zQ6Vq0VnX1E
         irJHIB5N0wFyzn6Ax+/ayVQQszFmaR+0HMqOiVc9cTi9VC157oR0JrRCxZkxAqbCKb/h
         8ctTr/uf+W+wAjvYhsMQzAlo83NfIpLRtu/f81Gc1od/wjFeWvYn3p5+wyGRxMBUP3WS
         O5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673189; x=1780277989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OMUE3/7kINiPQNa3IbX9MLqOrJoUgIbbeots1aiBMpQ=;
        b=VM16y9DqMYAmili/+KujO32MQj987tJQwSEs8J++4fg5x7qGi4o4G05GLkI7dJ5S/I
         Nu9dwZmqvvu0+k5gUbAI9GVojAh1DVFrSTny1dod40WdY9PVvlrBmjUc3yhvagh0o09A
         iaYfaFUc0MsX5/fnBW/gofXJk5eEJnele2TRw9S9rZQa99VUd1vYPRwid0p0qwlbeK06
         Ze4ZWfXlbBWzuSI8+TTAX1kcmd8dORuKExwIiY/mx2nPl3+EcGs6nIiqkWkkcL7/QFBb
         HrlSLvnBbIVV80s5FN7jy7TLChF26kiqeaUdTMen4F2iK4VJwdLYwpkx9oEZmfj2pU/C
         QG4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Vme+2aNKHTGOrLvgYnBme987HNhkacBl6/mHZx9mOQMtP5apGLHunuh/u2xRdKit8bt0gvTHUgQyx6SACXr6b@lists.infradead.org
X-Gm-Message-State: AOJu0YwzNUH/x8jxu/S4cR7TxFzP/cyYoBhRU+6zhk7SZyWGMomoovCU
	VICXn2nI2h2RIoWKXaLhq3l3hSQOFXVyKJSijGgsaYPRzmXpEQ3qew+6Qrae90lhOwP/idsX26b
	FWc4GI4s=
X-Gm-Gg: Acq92OF9+V3Rlb+0P60JIfm3YvenxCksH3UHQWwcbzqokFbz61p3rA2AaA4DEHLZNii
	RQrfnrfVVptKyZTjZCenyNkK+rmjS45nmY4fVsbMYReV3GiaAz8XdEuE9ZnZu8WFvsfccVevGNI
	C0S+tAvynKaRBJyIe6OonpVxf2pQdJlFB2+Km/GPHG9wqA0KG0IYlGDytARF1XlTwWC04hDnFyX
	IrXuYSiG/HdrBqcQzcEC0Rwo98BEgvDsyznCn8JNyYJ4jH0GNeYl8sD+fYQKladCf8lvfIhiB6m
	Bpat5DfEUPIHTcazj4lsrkWYBWKMoZO1UUpcsfwn4AnzwFcHuUnVgu5Gdz5m3PmbeVRQFIEo9vF
	5uMFzxtO636OGa2KNfOjGwHxxSMYP56sS/rCR2K2uOzUKVNnbt1qRolfsb+xnOhe/H6VHHaNjxl
	OTP2biGhN0Zyzw6r8RwreXSOCV8dw1krlAfMuvjeqFsjzRJMkZJw==
X-Received: by 2002:a05:6830:438e:b0:7dc:db3c:1d63 with SMTP id 46e09a7af769-7e5fef8778bmr7211293a34.24.1779673189590;
        Sun, 24 May 2026 18:39:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:35 -0500
Subject: [PATCH v2 3/9] iio: adc: dln2-adc: simplify timestamp channel
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-3-c37c9408b7f7@baylibre.com>
References: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=au3KpLqYbepgVrQAt2RX8cSSLgzx8HL8SFAfmcOoutc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gxGpINpNsbfXFkHrF+BjDlueBxKNBZdolVS
 wzGu4LBeumJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoMQAKCRDCzCAB/wGP
 wLvKCACg/4GawBxVUGhqi1U/lCBImoTuAHgKA58qiBGlLscoWThFgoEqehSdU1vluTATvJPVJ/K
 NVMe+3HlBGTZh6GZAkNWuxDKm9UU3/i7rMdPqRprTryF7XmJRy7erIWRS18FKuuH28SSwe5PqTH
 pI1+U6/YZwgRhnxI0QItWzNlicfPd++Q4bY0+NYUpeiUw6X1UI5+4c5Nk1+nOen0W9Dp02eJN86
 1ZFb3HpwxHPCUDld5p/mxWNeOgNQ2WqmCRdbUW1LsUBwRtXoVdrvXl7Dp3gGzlrDoEZpQXG+06a
 Mj8/bPi9uEawWuM+whYNIKUpoNvmPLjYStWdmvzai+z5laQk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_183950_705009_B8E932E3 
X-CRM114-Status: GOOD (  12.76  )
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
 drivers/iio/adc/dln2-adc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index eb902a946efe..b01c6f5a73b1 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -444,16 +444,6 @@ static int dln2_update_scan_mode(struct iio_dev *indio_dev,
 	lval.scan_type.endianness = IIO_LE;				\
 }
 
-/* Assignment version of IIO_CHAN_SOFT_TIMESTAMP */
-#define IIO_CHAN_SOFT_TIMESTAMP_ASSIGN(lval, _si) {	\
-	lval.type = IIO_TIMESTAMP;			\
-	lval.channel = -1;				\
-	lval.scan_index = _si;				\
-	lval.scan_type.sign = 's';			\
-	lval.scan_type.realbits = 64;			\
-	lval.scan_type.storagebits = 64;		\
-}
-
 static const struct iio_info dln2_adc_info = {
 	.read_raw = dln2_adc_read_raw,
 	.write_raw = dln2_adc_write_raw,
@@ -614,7 +604,7 @@ static int dln2_adc_probe(struct platform_device *pdev)
 
 	for (i = 0; i < chans; ++i)
 		DLN2_ADC_CHAN(dln2->iio_channels[i], i)
-	IIO_CHAN_SOFT_TIMESTAMP_ASSIGN(dln2->iio_channels[i], i);
+	dln2->iio_channels[i] = IIO_CHAN_SOFT_TIMESTAMP(i);
 
 	indio_dev->name = DLN2_ADC_MOD_NAME;
 	indio_dev->info = &dln2_adc_info;

-- 
2.43.0


