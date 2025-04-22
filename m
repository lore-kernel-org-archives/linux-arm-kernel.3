Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87BBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GV/JKg4cCCUHZO4DcegT8p+GY8kK4vHWejOXinE1p04=; b=rC2EwgPQKepq+IwZiCfCqF/VVn
	WvFkZSUd/k1nMEdB43o97VdaJZGfk/gr3qRu1ECIYFnJhrCc7qGBifl/rBVDcND+/Nt+8eWL5eTiT
	os0j3C+TbwNeyQrtTIDvTv4AYv1vAejRwQfNADq2ZBFENqOFDlmfO1w9/Sbe8B8YKiTncz892a4q0
	RwQ2f7cv7rUjagF5rZq9zLhzJwXB/clhg8baJQxVJy1dYbzmlicdLU+sMhhYU7lxEObW8T6rUJrb5
	0Gw1YgEavs8o1YHnauxKTAdg4Rzd0ZIAxQVeYA/ndjyp+e/4GHgQbujYSMY1KzV3gL8BceYSoQ4kB
	MpvMOZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7M0j-00000008hfQ-2zaF;
	Tue, 22 Apr 2025 22:22:37 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LnN-00000008foo-36A9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:08:50 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-72bb9725de1so1290536a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745359729; x=1745964529; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV/JKg4cCCUHZO4DcegT8p+GY8kK4vHWejOXinE1p04=;
        b=zGpAMV7l5uuEKNesNgruz+PFG8ahjRXBp0zMfKnFh/DKTGSugkLtniJR/1eegLOr6o
         id+WqPLgIpVqDdskLrdMTZ9W2xrC/SHHD5as8JdewXlQp9u1IsstMusYLGazJrzhE1qm
         LdA+Z6/IRAOjpLOwk4krMAvrkQs76nXXp75dYuc7Dyv7j+h0385Ra2H76MgcrDqw6WKr
         tdmReAMt9YCB0bARL5esFCakytkEqB1DTab2XHgGm5eWbwVWM9JcV78A/6pVp/bpHO4w
         gAxJQuvjxe3MC2yDhNNvmHDidF4vLsIw8yiQ5vGu/zkRlWmjXsAEh5jsAFNE+hk0dkj2
         B9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359729; x=1745964529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GV/JKg4cCCUHZO4DcegT8p+GY8kK4vHWejOXinE1p04=;
        b=i1ga08Qlgcp/CM2IxvI/AXmQhrNhgtRjoG7JheB+WgS7F+qfF2gEfOmUv9faOqOmqT
         ubX63jqJjaf2Cu9LAIYWkwVGh29/gMQPi4u9Kv4ApoaANEsQ16mpbx4ZsD+Es0ceTZbS
         SPrhPEnArEPoD2RNwxqmjaleNravuDUF6fS/3Tw1fvNSsQKSV8oiNcSKbXtyokGiANXE
         SZe+aDaUKabXU9HIr0Lpx+2tqD7U8q6VJOCRlRY+6oLn3GdhPiSCr9nJuT4Swd3O4tE9
         uc65S4eUCXa5I205LaaU3XvWkmzpHTjShZBFpnTFkc9TbZL3nawGqy6QTH/JJ+M2OWJ8
         Fljg==
X-Forwarded-Encrypted: i=1; AJvYcCVtQpWChsXtaxFrSaSNAJI+vG5eD3f9g8gzuP3YXiRBLiXYwV5EzYkTd2ZCbo1V5Brnvo5OA2KaKBBTirqbZvk0@lists.infradead.org
X-Gm-Message-State: AOJu0YytfpXhG5archW6q2/pJWAkviPV8IURihwdJ8ekrFIUGupaVqye
	hgBlpEGtwXvc9QJwtgVfO0NFj9k9toButDa4jWUQJ/jFGajCpKEOsnRb5pxE+E8=
X-Gm-Gg: ASbGnctXeyBh06aZ+EaBRHsnatyRyvJmAc9Z1p1f8rcU5XHDNSfeiaV09BS+tfvoNQo
	j4Pj5/LxuDcX/HQ30p323+n3lHU+zagb6Z5bGmpfSAEfN2PS3n41Fe3TYkDluguyFqjH1ljM0a9
	NExuScCn45/cZ8eupMeIVlPLDObItwZE3Acb+x/POt4HWSbAyZMfQ1G6sxZ4xqi+8gcjMbcktd5
	asMyhc3nDz2X4RrflcZ54VD9ssgvO0mWZNLWcHzXTTU21uVgiSFQzan3UJFeKdszI4eGGBJkSNA
	370t/6F4a8oEnx+4jeheX0pgRxiYH7yCrU5T5/9G7GJXre0=
X-Google-Smtp-Source: AGHT+IE7FZA50BnSF8oJmn4vSYvHiYeflUDA8NfUYzI4hEr4A9R06F1OXjWW8PDV78GuxROjjrL/nQ==
X-Received: by 2002:a05:6830:6606:b0:72b:9de0:891 with SMTP id 46e09a7af769-73006222b11mr11700069a34.13.1745359728753;
        Tue, 22 Apr 2025 15:08:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730048848dfsm2265938a34.52.2025.04.22.15.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:08:48 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 22 Apr 2025 17:07:49 -0500
Subject: [PATCH v2 4/6] iio: adc: ad7380: use IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-4-3fd36475c706@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=KW72H2rhOsjzvWAD/gfaompbIwAhtAiVxmdxvtY6glI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoCBNUYLKuoL2l8v5qYxFzyitlCg/RLQk56/h0w
 bWbsz80RzqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAgTVAAKCRDCzCAB/wGP
 wOFTB/9YeOb2rt8UjFsVZfIlZEmMagVgNxYObu4fQAmL0GyrRub+pif2Ln/S81nDJAOw8uvfdYl
 JH4+CkLnoCMaiuj5bsrR2T3kVhyAuD0L2zqmYyZLMvrHBnkBUzn6c6+6MxfiqzDxMegf312U0UC
 I0QHm7GNU7Q1HqSxBojySMCGlzL9vQi1FtuZ3nw3q86r3fP05Tw9Ycgj6mG8tJKirKk5O5on141
 YD5UgkTJuyRaXIY7lVs7VtewokCoo4aJv97l6WeDdyDiwU3iinkFo1hl26Ozjx2Z55qh85CZxAZ
 Z24lYaIyx1Gy8mL2VGG0INwPKSuHd25sZraxcL2r30GDs1X4
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_150849_781416_C9DC4BBB 
X-CRM114-Status: GOOD (  13.71  )
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

Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

As discussed in v1, this one stays u8 because it is used with both 16
and 32-bit word sizes.
---
 drivers/iio/adc/ad7380.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index f93e6c67766aa89b18c1a7dec02ae8912f65261c..f89b195c644024151c14977fd43e279a67439fb1 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -909,8 +909,8 @@ struct ad7380_state {
 	 * Make the buffer large enough for MAX_NUM_CHANNELS 32-bit samples and
 	 * one 64-bit aligned 64-bit timestamp.
 	 */
-	u8 scan_data[ALIGN(MAX_NUM_CHANNELS * sizeof(u32), sizeof(s64))
-			   + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * sizeof(u32))
+		__aligned(IIO_DMA_MINALIGN);
 	/* buffers for reading/writing registers */
 	u16 tx;
 	u16 rx;

-- 
2.43.0


