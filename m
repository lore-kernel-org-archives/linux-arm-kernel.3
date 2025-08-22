Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73764CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zktb9gNCV40fpMD00X6p5W7la95jm4sktu3txkhmc0k=; b=ZQSYvah/QSXNGV1xzE8WIn9NIr
	fP4AEglY/wAfdm2pSSUMt9t4uhJprluKwKkIjvL6sFcEm9WUUOVYrFzt6OgfqjlFj8NdnLYTk+9X6
	qVWKks+o8SUKtBxLDHRfMgq6Ur3r0bxNmU4Be622zsp8gI/grTTjkrpjJMi/o9QIjAH0LU7AiLK4a
	EVGy2fC/g+B/7Ac5bKAzHKqHVQINTgU0vbR391/ujDESxmmlyp/mn/I49YEiFhCQ4mtokBrtlrLGo
	MnbW4r1zfh47erbRUzlc7I/Yg3V1gIpA4UIPSN3o1kFSyiixJFhVxX7cbL2XuqLiBzJy3IfQmP/OD
	1QPK8NxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyG-00000002UhF-41Zr;
	Fri, 22 Aug 2025 12:34:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upInM-00000001RYM-0tcD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 03:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Zktb9gNCV40fpMD00X6p5W7la95jm4sktu3txkhmc0k=; b=NaWDQ++C8W4xYsI9KzQWUQPWUf
	jcIaDHwanCezVy6kmDnPt0a3qljhe3FtpVgtzrsAfNgroRxBflCvCbwXHiRa53Z4y7T32oTqfIP5c
	Cf1WuCbfmAWLtxJdc4qBHigoUFV2Oluv1p1ZfOeoLIXn9tdd6M/y2xRY8ZIHNzaWPM/WM6a223gx8
	S/gQN21LfLXGGQPa1YLGtDiMB5/YFcNayJtZQdPQHjuSrCVjXGc1lmVr3PwRjax+SJllXfKbWxJk0
	53gTx4R5KLPHQvwkO82V85IHnsuTQdRorZAf+kuLklxNKxf8fupA4xAMSCVq7R9SRc73YGWRbKFdd
	elB0YRZw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upInI-00000000nY6-2Mlp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:50:26 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2eb6ce24so1452625b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834622; x=1756439422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zktb9gNCV40fpMD00X6p5W7la95jm4sktu3txkhmc0k=;
        b=jUSacLOoW5dnUTzzQ13Kdx/WPe/adiGtdhFpIUcw5NRJMkN7pC6m6Nz/qYPu/n5Oc7
         GZFvTypBZibtfhz9RwDVxeGuUbdUyql6A3qJwr//wR8Ddyp/YRcbtDeC+FQbWTNGmfo8
         grx0KGojQ4kLfHpvDFZbggs4C0TaYh78V1YxfQOLF6smuvMqz5ehsxW4p2zfZSGDLhAV
         BB4lT3tPvItxFv5dXQY5p5qJrPYl+WzoFfTXS6PtzeZtWoVkyds9rElWtFEYFKHgU7UA
         jNWeGeTkqcmoImEHA4nODUdyuiTEpsPdJRTY/8dB6bGOXNJT6p5gqF3Kd2vGyK3zHSfb
         tQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834622; x=1756439422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zktb9gNCV40fpMD00X6p5W7la95jm4sktu3txkhmc0k=;
        b=ZcZp+woXKei7YurHvcc18hg0hHd41tjqIr7MxIuh/RIE4ArDG4EPxMSmJNuwFLJljM
         w9S8fnjcELMlCKvuDac9fgroPMHfb51z1GJIt7t9MPa6iqESOKY+Wkq9Cv1OmYtqvoAT
         3+fF/pC8Bn0cTyfXkiLpuqdoFglgyZCGnimSdhQYEk8xeNYAwhpxwKIV0GVo77j01/fS
         YWy4cKQpmEmId2Asfxz7zuoMHiMluNHGnaALhmfdZKyCys1ARevl1hAs6NYs3xAw6YVG
         82CaiH+1DS9bkEDQtiS8qiJabQnF2sNhRdUiz+vVZgjMIRgk8Wm/FR12eDzHncHl9KfI
         LLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHScA/CkAVFK8ztOVS03lppBHNbUcvimOj76Xddx/1W8mQYPtq+iN7RjomdeSYT9X27fZv0wsKcYXNs5+lLjHR@lists.infradead.org
X-Gm-Message-State: AOJu0YwGkNbz0TmQOFTxM8VVKq5iekw/B73idpzOPbuD8SHHEWq/s0xY
	1BfVl9a4anckxIVyzHqn686uy/xE2xrFjhraRNtOac3eVKfVUgwPClsS
X-Gm-Gg: ASbGncthCx4Sxd0PTNpyFM4PxOq+Ut3Vf99CnTvV8PzyuB4YaJ0ELWS1Nll+VOLzr0g
	+tvOm+kPoz4W9UMmkpkWDJt5YVKR5onFycYmE1GZbX6TllWClRTKZ+OLhI8Uo0xDLV5IygXNOjy
	k+vPpll1GlCcDMvULfFgcWva8E6X48cQ+WZ2edD7FkT5EznuPetSswwYqe7HJW/aVW3aiDtfUz1
	RVjRzOFuOouwujt7NEVJkJYIdC4zq5iQwraDrHRElAuPnTwJLFmVJ4mAXDBx28PL4oMUmWS/KaH
	cvjEQUWbLjply9D0emPqJL7gTRprwIr3ptoszecqnaczY7LxYrTezpgGUz22x0xSV8bhU3ZijKw
	vo54wWWQNpzQsEnW9BwENIIbwSc/3
X-Google-Smtp-Source: AGHT+IFDoZyIz0WRIUaxN7FXYxLo2r7HqUuxevy2n8ltiyBxZUhzirU0KHdL7UEIoextymafrEyd3g==
X-Received: by 2002:a05:6a00:858e:b0:770:3663:d7ed with SMTP id d2e1a72fcca58-7703663e373mr162150b3a.8.1755834621826;
        Thu, 21 Aug 2025 20:50:21 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:50:21 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:49 +0530
Subject: [PATCH 01/10] iio: accel: Drop unnecessary -ENOMEM messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-1-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=4894;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=AwWtPL38y1r0iJuhWRg453I1C8i8OfauDf6niMfJUko=;
 b=HyArtRPdcLffakDtLhClwxTdP+mH4OjolmAEC2kl0Ef9kkGBHqmafuOPvQlafSR3649vcC4lc
 /gRsKN/en8vAYGKTMMFbugkLJ14LDuKTxUNJK79Mcbj67+WHGSq6Qtv
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_045025_190885_41131245 
X-CRM114-Status: GOOD (  12.05  )
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
 drivers/iio/accel/bma220_spi.c | 4 +---
 drivers/iio/accel/dmard06.c    | 4 +---
 drivers/iio/accel/dmard09.c    | 4 +---
 drivers/iio/accel/dmard10.c    | 4 +---
 drivers/iio/accel/mc3230.c     | 4 +---
 drivers/iio/accel/mma7660.c    | 4 +---
 drivers/iio/accel/stk8312.c    | 4 +---
 drivers/iio/accel/stk8ba50.c   | 4 +---
 8 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/accel/bma220_spi.c b/drivers/iio/accel/bma220_spi.c
index 38f7498431ee..01592eebf05b 100644
--- a/drivers/iio/accel/bma220_spi.c
+++ b/drivers/iio/accel/bma220_spi.c
@@ -255,10 +255,8 @@ static int bma220_probe(struct spi_device *spi)
 	struct bma220_data *data;
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&spi->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->spi_device = spi;
diff --git a/drivers/iio/accel/dmard06.c b/drivers/iio/accel/dmard06.c
index fb14894c66f9..33f225d73e7b 100644
--- a/drivers/iio/accel/dmard06.c
+++ b/drivers/iio/accel/dmard06.c
@@ -137,10 +137,8 @@ static int dmard06_probe(struct i2c_client *client)
 	}
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*dmard06));
-	if (!indio_dev) {
-		dev_err(&client->dev, "Failed to allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	dmard06 = iio_priv(indio_dev);
 	dmard06->client = client;
diff --git a/drivers/iio/accel/dmard09.c b/drivers/iio/accel/dmard09.c
index 4ec70ca6910d..d9290e3b9c46 100644
--- a/drivers/iio/accel/dmard09.c
+++ b/drivers/iio/accel/dmard09.c
@@ -95,10 +95,8 @@ static int dmard09_probe(struct i2c_client *client)
 	struct dmard09_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/dmard10.c b/drivers/iio/accel/dmard10.c
index 71cd1928baa6..575e8510e1bd 100644
--- a/drivers/iio/accel/dmard10.c
+++ b/drivers/iio/accel/dmard10.c
@@ -191,10 +191,8 @@ static int dmard10_probe(struct i2c_client *client)
 		return (ret < 0) ? ret : -ENODEV;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/mc3230.c b/drivers/iio/accel/mc3230.c
index e2853090fa6e..3e494f9ddc56 100644
--- a/drivers/iio/accel/mc3230.c
+++ b/drivers/iio/accel/mc3230.c
@@ -169,10 +169,8 @@ static int mc3230_probe(struct i2c_client *client)
 	}
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->chip_info = chip_info;
diff --git a/drivers/iio/accel/mma7660.c b/drivers/iio/accel/mma7660.c
index d0a16f227903..be3213600cf4 100644
--- a/drivers/iio/accel/mma7660.c
+++ b/drivers/iio/accel/mma7660.c
@@ -192,10 +192,8 @@ static int mma7660_probe(struct i2c_client *client)
 	struct mma7660_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/stk8312.c b/drivers/iio/accel/stk8312.c
index dfac2e44191f..305d88b1ae0b 100644
--- a/drivers/iio/accel/stk8312.c
+++ b/drivers/iio/accel/stk8312.c
@@ -505,10 +505,8 @@ static int stk8312_probe(struct i2c_client *client)
 	struct stk8312_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/stk8ba50.c b/drivers/iio/accel/stk8ba50.c
index 05d4fd540eb2..0f984b72a35b 100644
--- a/drivers/iio/accel/stk8ba50.c
+++ b/drivers/iio/accel/stk8ba50.c
@@ -386,10 +386,8 @@ static int stk8ba50_probe(struct i2c_client *client)
 	struct stk8ba50_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;

-- 
2.43.0


