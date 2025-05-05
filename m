Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1DDC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=; b=p+FprHBdJ8175Gyz8D/wvn1GWE
	mvf8ZJawtbvENa4fwv8lgDzHlOP4HLCy0A6i9inYQ5jnj0iGmp3Ur8s/b6Nl3V4A9GboD8Jbag1/f
	AhNDdRBtYCGbifOu+FHLrmsXmeLvZ4dxD0Z7Z5zGg/7fuGAlANCN17dF9famzEEoiYJulkJTwaIWR
	vAWWT3vZpY73qdWfECLqG/pjZSnKOCC+LarYM3MbZAH/WoJPosPxD8smc4YpjrcENwBwF0hHMh6QQ
	ueB/9gM3ivqYQfCCZbyxXfyebDPd1XO6pusnrA1qTrGx+V1opkfOgTjtZaaxOYxF/YvBfsxI2Ch7o
	IS628N0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBz3r-000000083iO-47Qr;
	Mon, 05 May 2025 16:52:59 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBykJ-00000007zxu-2eFL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:32:49 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-401f6513cb2so3167546b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462767; x=1747067567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=;
        b=fS0Mmusxu2L+nmczPCaAVq92taU3uUtHxON001JCppv6qNYBX9upVYJQ9RtAggRv76
         FHg1fxnkTL/74OZMIRqd7A7Sl+KUrBDuyjzKv6BNOYWw5dZlm8+5WHfHI+q95MqRhwbF
         Hm2mObIfCL9VUoUC+FZSgehcmQg0zhJLhuj4W06kPz9m+xK7+0ElbddUDGIvnpekJdL0
         dbodQPh6ZmLDfsV8UsiTENFczxDPlJC6/9Iaf4cqs3FjmysrPuDw1rmMtSHH8CtP02le
         b5Dcp9LcXvxjTr3GFte/3MCRpTBvcPiqTqXwnWAOa0nLgEUatklDv5GDij6CZIzcOVZF
         pe8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462767; x=1747067567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=;
        b=j2oHV0AzDxoq3K+DacO75y2vRC/qCsRKsnKDRcaxICQJZrXsHOxzp7FY1S2/CxU/Yg
         qeIdwZyT1ENMDkG4tEVVMSPMI1BgXEZyIbxMluvAv/G1gKp5BAjGYjbxS8nnNWzGr37R
         CpSUl1CrHkAEvO0IPBqWbLiY8TSGi5sVPIRLy35KSqsx4BisAUx91lg/ULhIkyz4WHYK
         HfXrqAFjc/9zISACgZNnvZzeyLeqO5N9tkQf/LimVsBUyabDaLXEAGTccEZ7FvsqZkB3
         FXI3HIS9ktiQ/Ye0v9RazwBS8O6T3eXxFByJtNyjcwezGCL7O70vN2PUy9rC6+EKi9ou
         gN9g==
X-Forwarded-Encrypted: i=1; AJvYcCUbt+u1/5LgQok24+9hAiH7mJgwyKEF8X+AIGCaOFsf3aNDsnS9XdyIKLRTQpMA4lT6579SYXn/ikOyhzgNuvCt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7sn2yfNQQYFabZiUG3TQXyVhOsyrPyk/oxnKC8aHsTYC8EDaY
	byr3jGSH8buXT9UnZzYE54MLsuoiWVcivoS8j9sKV3GXvZRYvzavayFbkzsCb10=
X-Gm-Gg: ASbGncvHAZuNIsbenZaNKwRLgjAv/SV1Rmxu+rPq+w3n9Xk5WooNgzkn7o3R5BvS0Fi
	LHXXCIwAhj7CVcX4/IzV8Ow4rxncf5d6+XL+VAuZGNyJRpYj5mZhDTiQ74g7vRM6fVkIgEww34S
	cTDa50seKVqEy/t55LqsfBgo5SSIj7kvT7QCLlpoP4gSB8EV56VyYTnWRPpe0LD1L7pESyHGmLi
	nutrUdsj71WIje2G29sbwz5rs7aFB2zMRk5sPXo6LW8MAlrQ5RUaCvgCGkvJ7dHpUbZmW+S2UOr
	bzo5fahs5SmuwKpM0a7pcV6/HZsVhyL5hRcZ0Rd9mnl9TA==
X-Google-Smtp-Source: AGHT+IFozkxNYc+TkZ/Dl7Rtx6+wVKGzltkaPmqSwC5J4g3ybHlUKPIa71hZXXNMAqeUFbgBk2ljNw==
X-Received: by 2002:a05:6808:2217:b0:403:3192:385 with SMTP id 5614622812f47-403687eeba7mr98841b6e.4.1746462766974;
        Mon, 05 May 2025 09:32:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 11:31:46 -0500
Subject: [PATCH v5 5/7] iio: adc: ad7380: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-5-814b72b1cae3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Vr9wDkA3SNoSLT9FCnDYkBa0JumGawTzg2ZkCcTYUYM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGOgTCR6lEzYtZByvCH+u97cNW3EB5n2Er5uth
 2EUH5CDdrWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjoEwAKCRDCzCAB/wGP
 wPbbB/9F7PFPzkzoQ0p3LiG5VHOqbAw7G90nYahGDdDEobzVJ8JTUEsMqCWq+ewG5pPXhgKRTwf
 ORcWEUcY3IzIs48HpY3THjfD8eJlJ+VdJIkSw4II3q8KfyQyJErBr2p5xtd/2bV+HdpptcIg6M0
 uDEWtTj8NSd3vFiZodyhdFToWiiXAgJnvkIbwJnzHNDSHq9ufyj9m/nM6xgV1ia6jnlhybT9NEf
 TCUj5HDyM7+ZrzFk/WnrcvO9lv93/9xCEeqmJ0sGTz0hdDvWnIy0nek77Mrk/If+7NwNr0/waZK
 VAm35vK0LffyNySOEDgC11RS5l0RxFLHuDgltBidEC+zewSb
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_093247_672049_A7E03F18 
X-CRM114-Status: GOOD (  13.03  )
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

As discussed in v1, this one stays u8 because it is used with both 16
and 32-bit word sizes.

v3 changes:
* Use IIO_DECLARE_DMA_BUFFER_WITH_TS() and drop __align()

v2 changes:
* None (but I messed up and there was supposed to be a change).
---
 drivers/iio/adc/ad7380.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index f93e6c67766aa89b18c1a7dec02ae8912f65261c..ed5e43c8c84cfcc9c4ce1866659a05787c1d6f5e 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -909,8 +909,7 @@ struct ad7380_state {
 	 * Make the buffer large enough for MAX_NUM_CHANNELS 32-bit samples and
 	 * one 64-bit aligned 64-bit timestamp.
 	 */
-	u8 scan_data[ALIGN(MAX_NUM_CHANNELS * sizeof(u32), sizeof(s64))
-			   + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * sizeof(u32));
 	/* buffers for reading/writing registers */
 	u16 tx;
 	u16 rx;

-- 
2.43.0


