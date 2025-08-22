Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB89DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqrtxAz9cctGN9u8jlxCJdnxps3sEfbBI35+GThZJ5o=; b=3mPe4uLl52GBAngXv2Z/Lujmny
	hbGkDdF7yZ90+CvC3hoB2m6uQ1GCbAVo6WzqEUFtB79iBAlmPz6KgPbm129IrM7bjMyuj0LRnqUZl
	fWO8FKHfViUjJ4twCX1MkqSd1EVyq/g1xyBd03OwOCT9AgvN6QB7m7MFCMqzlMbJBScOtsIkUglnd
	uQH3RACyHA56gYBSQKX7+GaICs2YoMQ+lzYFnb0Tg3FSNpFXzjBdiamTirJTt9m/5bir8bZigP01y
	kQY5dUhwXsclXf6z826/8tGKx+Ysh4URbMkFbocSueCacU9IcywPNITc3I8V8xd44oq2n6HgaN4me
	TmDjBTNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyJ-00000002Ujx-24qT;
	Fri, 22 Aug 2025 12:34:19 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIo1-00000001Rgf-3e1V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:51:11 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-323266b2368so1126125a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834669; x=1756439469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqrtxAz9cctGN9u8jlxCJdnxps3sEfbBI35+GThZJ5o=;
        b=EZmjnnT1bHJJLjffDtyaFv1hnaLi3gh+6BlHAXGCAztOpPkoE9w0yhQLB13hh2BSZT
         +Klrea9R1S31Xlg5dUZ4O5Mww/JavyejwGkwhqafvwUa1pn6Fox0NsJhknIdC5UXN7Up
         xqyDyHszh8BGF8EaRvSgoz6MVYnDpCLxE3h2wprbaHLQ4IGT3bT/Jp1xwa0IGmKwWkJV
         c03hOkH78nEzIfiL6HFzM6vfRUhXuMxXZicRx3qGT/6uB3zON26zi23b07JQ0CPhTeC4
         5Dx452SIt4vK2GpRIf1G5tvb9B900lyop3B3aJ1O8rJOEOOk6Ik3VummXiIFtXX9Kftt
         jzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834669; x=1756439469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqrtxAz9cctGN9u8jlxCJdnxps3sEfbBI35+GThZJ5o=;
        b=oiqEF0HTXFIMLE84uB+AUNE82ECHPzjMlieofGGjgJ/Nfo6R1MiX9O6MDPUyifiFWD
         Dwn7y2FsqNeftL2AB+JULXDlqHygRtLUM3UecaQNLCV43yn9J2v0fZ7iCbTCQZqwcNm0
         tGiJsZ6OiHS+LqmS2MIxj9kTF0grk0LM9RRShQ6SRy8urxC32a+rPk7OvIQjZqtKrLFB
         z9V5T6Vj6HHZXvd0De56BqXTWz/GR3Nh2wG6XWBSknIt7ru9zTGbXHQyvPw6QhJ3Jn99
         UwXhnmwqdjDvEeq1WE6zS/Qz3s1F+wcD7u3DggTW2dSSbWqV2zj4DCuXbaTPMCe3hK/X
         8Ujg==
X-Forwarded-Encrypted: i=1; AJvYcCU2h9nheTJ+9lcspFHr3QWJFdKFuZY/eVAswVSXy9H4MleZimXlqoA6Ks2vbqhS8pDjMJf0oMoFA6vTWY+I2yJm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5Sipv0fNc5NDmD7ZKBUH+b6NcDTMqmfO19k2ni3ecAqXswR5J
	IgNnx+PVcnnlfw2r2uHcZ1yZsok38WGBet4adLLjdRGtYDbHUX9l1epK
X-Gm-Gg: ASbGnctCad+1Qe6JvsRgJrBG+q3CPDCKKZMqP7ZRAe9VOLmf7umEGOQESiwjgxzqyWf
	7oeGRvQkzX2+HOSxatXx74/ytkCHaM96wWkiAqYXipbNaPLiuMMjuAYh7l00KEKjw7Cu6qgP9qn
	pS4drEbFtoW7M+nyL0lONh0ubx6UJZRF59H13BTx9tTIbukCwrJbEcMIafKh488LyIMCUoIU0IN
	uhONF6RWAeAyR5R8oTeewQ/BXWT+t87HF43pljPEwg02nC5D9mWYYH6FMPxtC+BbHggnH0Z/K5t
	J++Q1BfEaIdrslZ4W3Gsd3hSckdwNy+OJb9/XWEdUY+Et8LAZE3X/TP+tBQhdbj5rYjsm87ggN7
	lOOa77Amgh3RS2qeSGGzYh9+/lW9U
X-Google-Smtp-Source: AGHT+IFlyHvge1r2eEDywa691vO3EH8Zw57rYlejYo//N9dseDi4JFrUwk2dU+AEjPu1HGJfNaSDAg==
X-Received: by 2002:a17:90b:278b:b0:323:7e7f:b8f4 with SMTP id 98e67ed59e1d1-32518b80cfamr2288523a91.37.1755834669027;
        Thu, 21 Aug 2025 20:51:09 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:51:08 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:53 +0530
Subject: [PATCH 05/10] iio: humidity: Drop unnecessary -ENOMEM messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-5-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Dixit Parmar <dixitparmar19@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=1404;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=c8hX9rvl6rr2dhjjNLkJgB0+zkmehac1mQEbRhCM7pU=;
 b=ZgaeM24zC7IN3+he8TY2T9s8YSEkwL7SoNKuSaTSjAtLL/67LBM7qENhJcDRsU+1mIQixXTl8
 Ul2eMZUGNU4CG0gfDDCnLldXt5ixt1iTh4jFKaiKgitF507++7QKEdv
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_205109_919910_44C651C8 
X-CRM114-Status: GOOD (  13.56  )
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

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/humidity/am2315.c | 4 +---
 drivers/iio/humidity/dht11.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/humidity/am2315.c b/drivers/iio/humidity/am2315.c
index f021c3e6d886..02ca23eb8991 100644
--- a/drivers/iio/humidity/am2315.c
+++ b/drivers/iio/humidity/am2315.c
@@ -224,10 +224,8 @@ static int am2315_probe(struct i2c_client *client)
 	struct am2315_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/humidity/dht11.c b/drivers/iio/humidity/dht11.c
index 48c59d09eea7..cc8f02f3b763 100644
--- a/drivers/iio/humidity/dht11.c
+++ b/drivers/iio/humidity/dht11.c
@@ -296,10 +296,8 @@ static int dht11_probe(struct platform_device *pdev)
 	struct iio_dev *iio;
 
 	iio = devm_iio_device_alloc(dev, sizeof(*dht11));
-	if (!iio) {
-		dev_err(dev, "Failed to allocate IIO device\n");
+	if (!iio)
 		return -ENOMEM;
-	}
 
 	dht11 = iio_priv(iio);
 	dht11->dev = dev;

-- 
2.43.0


