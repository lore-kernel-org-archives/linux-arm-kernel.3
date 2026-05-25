Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F628CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcM+8coPu4v1e9MEXIssy6i1P2Q9YXTHeGPSK4NKRC4=; b=F0hRw3PvuWVPMruC+eJNt1r1h3
	UwLepMGakrygSLhf+uknrjX1o3r8zOOkezha2qHWlvxAUT8onrM8hfeZqcpdcvCCUN5lQAZrMs1o7
	b/spcmMvsYa7LNDE6/TgukYQXALun73hh5zw6mYfmOH8mj7H81RZ5zDjOBCynuLAiFhQEkC8s+m9Y
	5DYRoLnxTeBw6vnOOa+h/olLDpO5UpmVtqnP538iG15rFzPzhZhyAtCveq9YOAf5glq9/qIif1E/Y
	ESR0i5aXB069VCiKVHnORdHGRhIH8OmPZsxHzmvO3iGfqYLOddD5s3ATKlGLe93irDJka3KYkeV4i
	yrkfgqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIM-0000000G1lT-251b;
	Mon, 25 May 2026 01:39:54 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIJ-0000000G1jT-3ask
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:39:53 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7dcd17e19b6so5104642a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673191; x=1780277991; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcM+8coPu4v1e9MEXIssy6i1P2Q9YXTHeGPSK4NKRC4=;
        b=I7PQnl3bhOWC/bsaggUdc/0pUvd0pCR1UapgaoyWslQ4+W9HQ1WwTqTeizhEBUdsdI
         s1QE4smWFYC7g2GKcPseooQY5Dv57y5dP/DqL61zjyzhoJbbiJe5PuIp3DHVVkENkRDG
         dzvujkk7c76RPeEZrl+9ySLw0xreGay2r/IiqpfUISK6tW7OQQ/QZSlaZ8kHcIrmsSEz
         wWzoo19P+l+SaDw52C6iBiO7mc8EaeNAMAxsuvEGTy/G9q7aIJt/2XZNbNQaS/7soezM
         ojLhwoENM6rEua7sGTeaHmNHOHh5TGe/c6HNqgfHnAv80bKmXhT7mV0c9Im1mCvJxFVy
         DxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673191; x=1780277991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qcM+8coPu4v1e9MEXIssy6i1P2Q9YXTHeGPSK4NKRC4=;
        b=AklFb62dfSs5izzI1xD3p4Gx4JsKXdCcL0ZEQNStDJD08XRJ8DIUgkmk2jzX8gXLdj
         TfJYZcDI4yr1nEZ7LWXSmlauXKHbM7+mpJvTb0vjDnAZtGpMJilU8x1Ht8ZTUCFXu8xj
         MmeZFUvpX1r9G8zm+f4F3Am8/9R91fBKDBFULdKkgcpxAXl62fe5Mcs8neRmoPsvwjh5
         h2fsC00A5ZjUVEaLyd0tVlZzwQ5oH3MHd56DdfdznHBDBd7keKFNe6Xf3vUEdpYKg+lD
         Yt3QbUhfbfRCj7fv6Vx4ke5rfoAWl+/KxkoHcH7jBf2yls52a8u1wFcwieyCZMaBJqtY
         MhXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bATySYixyoLwdqbWlKwlfiIpwW4dZ56lJ6xMLyHT4fExMjj/4fr5Yao10xXGJf/zHaUJFwlj0+T7aQKA/PnAQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyqqoXVUlyl58PXouoHqTq4C6kILIIOm2PeFTcQVG3WPoCr3SzR
	sG4F5rz9tbJ62R7McXPmpdk9B2rOnfcXVF2eza4xu/t9WORE/qb1aR0quCHzfhwf02w=
X-Gm-Gg: Acq92OH3ed6gYobE4PUNRcpxkofPFiXhSlcPBWHmi9RKoNHsUSyAdSrEOsINOQ3lgXD
	H7CT3I3/9GxrpdkWsJ+PsXJGKvPNIBhJwWcfbiED+V/0kpPYTU7xstAj87iJ17qH1MXMGr5ihBK
	fmz0/NB4rW2dY1G1DvSHJDrFGNezRH1HE9TdVzP6iN/VQjsgZ37kt7DG+Fv35MXA9gnffOhWNxS
	Sm4AtTYrarF3gV51ga1hwUZ18eFNzhPRn/dlSAeD++CqNlhXlh/735cgbv4iJeKftsJQu/oxdn6
	hasl7PN3f/ZDNtI25jIevV+oKlBf+OPatFXJiKn4LAqQNc5iebyhAEZYQ6a9tFNnxYIk1dUHkXk
	lFawULoLB0Uu0FD9+78FvxOimk/nYjK8TOxPQE7vxFx8LDwqXADwwBXjq/2xDpUsDxe8TFgukpc
	hErvlpNpKjTtsmBFngiqDfGodCeTa4
X-Received: by 2002:a05:6830:6d0c:b0:7dc:d99c:c441 with SMTP id 46e09a7af769-7e5fedc8241mr7219838a34.8.1779673190623;
        Sun, 24 May 2026 18:39:50 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:50 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:36 -0500
Subject: [PATCH v2 4/9] iio: adc: at91_adc: simplify timestamp channel
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-4-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=kT7iBeb9XCkWmH0M5c7AuCVAJn+S9r0mo1T4JiYsl94=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6g4ZzvN+pLtbr0EtlFMYHDp7WfJxXmMKDzwC
 v9MYmHcbzCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoOAAKCRDCzCAB/wGP
 wM4kB/4oMi3qMB93dUQsrGEQKP3Ylxt+25M4VOOtJqdg7N8vJaJ1C6Lmi5F/KK6qCauA/lzIV4X
 si8btQlgwRRXDQ6XKwu3cWj/ai0R3djV9ReHCVfEGuiQQ0tUgB2QROHEnXiC0F4tBS6FWCVUlYJ
 I6DBZOM1nFp9tt6ap6GXFJ3BcwoZ7V/n5Z3GOC+N2BdEyABMsqK6hVrc8Db1ksyYyjbzIhaETVj
 tIJsfrSn2JjVJ5299p8Gm7hdyOXXZh/t2uRbe9QEeahWGaTwcNWvv9HlO4izEY1uM+pkipAIoh7
 Sdf1+Nlh+iWCpQuVbssgfyPaZxlw0P8K6guLhv28vVycI7U5
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_183952_150789_6EA96883 
X-CRM114-Status: GOOD (  12.48  )
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
 drivers/iio/adc/at91_adc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 6e1930f7c65d..f610ad729bf3 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -481,7 +481,7 @@ static irqreturn_t at91_adc_9x5_interrupt(int irq, void *private)
 static int at91_adc_channel_init(struct iio_dev *idev)
 {
 	struct at91_adc_state *st = iio_priv(idev);
-	struct iio_chan_spec *chan_array, *timestamp;
+	struct iio_chan_spec *chan_array;
 	int bit, idx = 0;
 	unsigned long rsvd_mask = 0;
 
@@ -519,14 +519,8 @@ static int at91_adc_channel_init(struct iio_dev *idev)
 		chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
 		idx++;
 	}
-	timestamp = chan_array + idx;
-
-	timestamp->type = IIO_TIMESTAMP;
-	timestamp->channel = -1;
-	timestamp->scan_index = idx;
-	timestamp->scan_type.sign = 's';
-	timestamp->scan_type.realbits = 64;
-	timestamp->scan_type.storagebits = 64;
+
+	chan_array[idx] = IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	idev->channels = chan_array;
 	return idev->num_channels;

-- 
2.43.0


