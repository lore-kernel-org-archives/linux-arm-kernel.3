Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5599FC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTje6aj5o1aqilClKP/XjHDRm21nPtMuz4RymFa7ygU=; b=bIS0yeDyIy1SB88sfbBUa/E6Fx
	eSe5xK87J49/QHw6Bwiel8Vu9SJ6aIlladFpqwvYsrNuYayGLJ/KnoD7GIvefHITIYdQCKWgUzGXy
	vG1qiH8SPDctuOWOBCLaHzXAY5Ltw69mu//iVZdAYUtXstFucoe00tB4/tm4E+stWd+914fK05S8W
	KGHdLrHV7k5zS3ggf6T3NB5qd28PBPG3h/weJWcgvNft9npIID+hgVQLjc5MZ08GwmP8eQOnTurkD
	mP+mP65YmJmOMPSAtLyX4UNoYVTQccyIUn3D1mUG8m+WU8HqJb+0kNs/PDlOjD/Iq9T+tGGcF+8IW
	PeSuqjDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QSi-00000000uby-1b8p;
	Fri, 25 Apr 2025 21:19:56 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QIo-00000000tGR-0G0m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:09:43 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-72c14138668so802071a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 14:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745615381; x=1746220181; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTje6aj5o1aqilClKP/XjHDRm21nPtMuz4RymFa7ygU=;
        b=opGywQACRWEhItZKDCxzKlQIB86erAFq2XIpsGLAapuIfuXU3aNZn1mBcMhlpE7BjO
         mXUq5nHsE/xYMMgezr0GqYR6Vn57o23e1DlgmwAQgDjahv4RVtS8NjsslnCmydqXNIdb
         TM74a5rlm8PuXW1Csi4V/kLTTwIbqLzPzKJWD9gbq502vV2DZytrk0+y/3JC8I8yRh6m
         ziweMnHR0sQMrHovsh7gYgtPXAeyheJ2LJW4Muj9RoqpMusHqShH3q+CTjaViMNX3nlW
         g9SwNMbt9K0BT7cjXZJSGU8pV2Tw/jz1zji8s3NmmPg6sCIsKtWsJ8IyK2v2/mcWIN2M
         p2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615381; x=1746220181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTje6aj5o1aqilClKP/XjHDRm21nPtMuz4RymFa7ygU=;
        b=etkd9K1A+eDTMNpXuPR4+W6Rn/+hv9QWlfoIE/BEpj4abCuSmu0G+W42Nrl4/43Bp9
         +8xzgJg20MsvurTWtAxJkWtPD9Pl0l12xdlFYBRBb2Ok9AIPtUrJaOinyqgpDsEhEAnP
         AOEBtDWX/E1sO5w2Wgqsa2dkmZnC1ff90wpT/KyL9kT4ZdweumQIw/h3kTcJn+dsXQWE
         B7c63UdkCwKvg5Jy4vp5ZDpvlRVa2M7EAUhgGQx6GOYJTkOVHlDp8ee91orkVlkpWQ4k
         HJsqQmgcvbcdzmoAMKF/iy3gLAiPP1Pb6z4eR0CG49gPHRcisoc6bPkB8Qt8LzM9vqJH
         TC9w==
X-Forwarded-Encrypted: i=1; AJvYcCWya0qAEi+6K3kASyIHv9vrRLD0s630gwX2hPllduPuaTLaYTB7gDIsCZc9IRMXcvR/MrIuYHokML45okz6Nqa8@lists.infradead.org
X-Gm-Message-State: AOJu0YwvJaOZanWtfsJ4Tw1cAfOyjB7hWXV8ajsHV1uBSkE/6tuIrZQ8
	8zUGLf3F/rxda5AbDhpad9j6vRElVfznklgOTMaXXwhNUDHOE1pAakelZqzWw9k=
X-Gm-Gg: ASbGnctKhfQxggk8BwQGN4mhv7nHAtpOyFBR5G6p924EB25r3Fuq1FUbbr/gU5UTG7N
	9Rixo8rfVAnBasQetpairvmDfmkVxjMNrUsPmkqB3Zf5YV81t3og44rdkBX7Ivicd0ZdtPl6y0w
	FNioJmZzLxDTqIInOQNXp3ErR46x7bzaYWNyUiJNjfj4IfTrA7/mYjoEX3qGxZUgZrJe5xRn9Cd
	NReI3/Bx6DDrVLnJt4leVz+Zio1Y3cBXHdD7+ws348tULdcGx5RUrLl/oE7BNHwkLLNIkMa5qao
	QLv6p5hVqhSAs3+6BbQhU6izBOolenSm0Ls+VK5nLR3I
X-Google-Smtp-Source: AGHT+IEcQjGHfz0Vi3BvNBX48+ecmEcPhmsk9/MYoCP6D6pdFOSfKrM1FruQndnBcm94B+h/H2rZ2g==
X-Received: by 2002:a05:6830:6c16:b0:72c:3289:ab9e with SMTP id 46e09a7af769-7306528fbbamr856930a34.27.1745615380993;
        Fri, 25 Apr 2025 14:09:40 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f188052sm847673a34.8.2025.04.25.14.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 14:09:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 25 Apr 2025 16:08:45 -0500
Subject: [PATCH v3 3/6] iio: adc: ad4695: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-3-f12df1bff248@baylibre.com>
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
In-Reply-To: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=J4aWhg+jCqZDPjq8gAC6cdfS6rEoLENhaBlAy0BO4RQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoC/n0uazZp0mcIAzLz3ELaYXnTAaEE8b6z76v5
 3lgVH0/dBSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAv59AAKCRDCzCAB/wGP
 wE0UB/wO2o0M3Ij2ucEK4asG4o5GLQvawEfQD4eAcTlSfGKy0hEFnUV2QpnV3Dirc1dIuIPdPfE
 3/JAM7GHw/EnVXqb1DGA7rO7sRns+9orKw98lIt2llIRHyzUrxlbqMxdI7Ujxm3w99YhuStdHh3
 DOkCSYK9azmC6DfAIcC04TxnvXBa/Bq9RjfXy5LDvFTBNOcf9W52RI9sLIlO49GmBpFlCcN9o8H
 Mncbxr/fGo0L+38XEIcYXHUOCnx/MJozw0Wg+hLA8HOhm9r5JlJFln2hfBI9cJ3qwNp0tSJdW57
 0hTAqvyhB/HJX42GIhLlbj/8qnhuv4PcrCZ0t4oaZCsdAUTV
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_140942_103611_E422A532 
X-CRM114-Status: GOOD (  12.09  )
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

Use IIO_DECLARE_DMA_BUFFER_WITH_TS() to declare the buffer that gets
used with iio_push_to_buffers_with_ts(). This makes the code a bit
easier to read and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4695.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index 0c633d43e480d5404074e9fa35f1d330b448f0a2..992abf6c63b51dee222caf624e172455fb9b9900 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -160,8 +160,7 @@ struct ad4695_state {
 	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
 	struct spi_message buf_read_msg;
 	/* Raw conversion data received. */
-	u16 buf[ALIGN((AD4695_MAX_CHANNELS + 1) * sizeof(u16),
-		      sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_CHANNELS + 1);
 	u16 raw_data;
 	/* Commands to send for single conversion. */
 	u16 cnv_cmd;

-- 
2.43.0


