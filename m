Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40BCCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWhZhPrOG/QAlgX04rUzc0hrbfIiVcVzkp3PRYw6Qbs=; b=un54NEflElGUogp/6UiZve+u2g
	K+rvnt5aLAqHTFoJUgX9HitM4HzXbtMVEsy+TZPUReCoRXYZECx34V/k1boitOLTmxHYqOeiAGcwc
	tkl7ucbiUTCIr3YA0d6BP6GNVb18oLNjbMHHau3ydn2u+asUdZa3WFvcbHLdxN9lWIN5aF9f+vHcT
	AZI9l4CsCOSucgNmsQh6p7ARxB7r6DGlQISTYTD4ox3225XitVaxwsoLo0Wa0HhgoERCwu2aSvp66
	gZ//zKL6ec0BkGaeDA3vw7AtL4QmBUllxMO3Xj1BWCIwJVC+dATODpmgY0srSTeb1SHMSw0Qs667M
	y9tFiJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyI-00000002UiT-0inp;
	Fri, 22 Aug 2025 12:34:18 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upInd-00000001RbM-27A8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:50:46 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1657821b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834645; x=1756439445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWhZhPrOG/QAlgX04rUzc0hrbfIiVcVzkp3PRYw6Qbs=;
        b=M1QcfMkYZTO2kEcjWQCCmyoswVGkk1YCu6cbwCuyRHRVNaCRLd5uOW025h+O7/L/I9
         ML70lJteLac4n4AeROqzQ5dfNj4NycXyEDoSMAyJhGmkzH1ZEwXWbwPS2ISEFhLv5gGF
         +fjG3ZEPbBSu/5x4D2Ptf8cDtfXMj38wyUFYSuT1nllvWKU/x4f4CaIhgOSRscn48pMD
         W73fmyv+l729fAOqLVQQRKEkJAxBiOO7luLvXBpjwOQL09QQZKEAhzDwtl/DIAseN+rR
         CC6Ymiq7X/p8xuL/cMyQKKm/Y86NI0DnPH5jQRuhgyZs/X4cO1GgR1OcO5TSybrTTvJu
         TGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834645; x=1756439445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWhZhPrOG/QAlgX04rUzc0hrbfIiVcVzkp3PRYw6Qbs=;
        b=xDS4QGXwwd29pg/Uy7Gq6x+D7+fg++l2D+nKFC/nMmGFiXI/KTb3H8apvCQH0vrSTa
         NUL456hXaWgxK6FD0Lm1bI9jkrZlBw5kEHz/AUkRxx4TggqOKAj4pvszXyUY1Ueye6d1
         n2ER593x66OlQKNJRWYGJMR+hzVOZDjsoynnj2Sc7aRRlU+gaBqR/81qQaly2WmyDO0g
         7V5clF+Zn0nDR8jjBliQxbdCrm64oTntZ9CHQCBtHemEuhYoDa/RNhTNg92/60hB9lxj
         Rqk1t94rS6V3MumdMPg01Q7hV7yDBiMdX1EB2h5e9ClzahXB2tWcJXxG9gIvPx2a5SYg
         byng==
X-Forwarded-Encrypted: i=1; AJvYcCVbxYEuiL8+aoY+ua9e0eCeUhIrewvdai4BYW9mUiI0DZEXkQgyOdyuIzzwRt8tcgrROUNUX8BYeesxm7hQ8m3L@lists.infradead.org
X-Gm-Message-State: AOJu0YwDnA63db3kEEQv0xGWtPyTl8q8/+sdsKOcPIK/aUWbsczYY8U9
	sfuZhSUoheV8MAJtw17HVKXx7+wP8jbV+OCPnf3GiB3s2Zi81OkEeHa7
X-Gm-Gg: ASbGncvJKnMe3+mTzMCqjuVRnGhwOmJmAr62fv34IrvfrVEhaJBj6Nd0UfkqagRWD1K
	vkyZ/bxP4AEyWx6wT+tQXYlUn3UXRM5tQ9BJylUd8aU3SaF6zh6l8c8YhTFW9yWq3B5RKd3VIMM
	YYYfuWi+czzpCttIjCdmY4vUoPJ4Y3Mm5M9ytNdFG2Q7/a/vEZ1N6caQGVO+5Ru9IUFE5GSewh8
	KBAm3kJ9+1YpE/3uydfAPoR8P1EoCTGPzVpA0sr/9lUGtB2XQFqIM58W6YgK8sVcU2Zh4N5mlcn
	24tbAk3KQVde4Qb0s8C6ui1KvZ6t0tcQp3Grs+LspVJA3/m9ZfDmWPRjd0L90VuRH7z4RGRp0XP
	GMWMkkOMHZAsbNEYbdZ/lMN9opDAU
X-Google-Smtp-Source: AGHT+IHkP7IcI6b0w4x7HvhyRCGL8lDQ0eb2HC3aGo0CeMkwIFIX7qo+gbx+sa5/Xre12VY1dmNs5g==
X-Received: by 2002:a05:6a00:8ccb:b0:76f:73be:5c40 with SMTP id d2e1a72fcca58-76f73be5d38mr3282271b3a.0.1755834644500;
        Thu, 21 Aug 2025 20:50:44 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:50:44 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:51 +0530
Subject: [PATCH 03/10] iio: dac: Drop unnecessary -ENOMEM messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-3-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=3064;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=1K93tVeoPiLj/0fP86BU3YSmIy3OX+Xeg+DZkIsbkCY=;
 b=JROXYfDq1SqDL2ylheHeUCGY4etunQkZ/BgczFT/HiSsDjSgLfD+vVQv/PUGbpM0DntA8c+rO
 /vK5LfYFZBAAFXCYy4qQHdS9WRP7YF9lw/jPh6v3LyPjytsGbwnqVdv
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_205045_550668_521317D1 
X-CRM114-Status: GOOD (  13.97  )
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
 drivers/iio/dac/ad5380.c     | 4 +---
 drivers/iio/dac/ad5764.c     | 4 +---
 drivers/iio/dac/ds4424.c     | 4 +---
 drivers/iio/dac/ti-dac7311.c | 4 +---
 drivers/iio/dac/vf610_dac.c  | 4 +---
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/dac/ad5380.c b/drivers/iio/dac/ad5380.c
index f63af704b77e..ffb8c676c7a8 100644
--- a/drivers/iio/dac/ad5380.c
+++ b/drivers/iio/dac/ad5380.c
@@ -371,10 +371,8 @@ static int ad5380_probe(struct device *dev, struct regmap *regmap,
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
-	if (indio_dev == NULL) {
-		dev_err(dev, "Failed to allocate iio device\n");
+	if (indio_dev == NULL)
 		return -ENOMEM;
-	}
 
 	st = iio_priv(indio_dev);
 
diff --git a/drivers/iio/dac/ad5764.c b/drivers/iio/dac/ad5764.c
index 26c049d5b73a..fbbd7105a80c 100644
--- a/drivers/iio/dac/ad5764.c
+++ b/drivers/iio/dac/ad5764.c
@@ -278,10 +278,8 @@ static int ad5764_probe(struct spi_device *spi)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
-	if (indio_dev == NULL) {
-		dev_err(&spi->dev, "Failed to allocate iio device\n");
+	if (indio_dev == NULL)
 		return -ENOMEM;
-	}
 
 	st = iio_priv(indio_dev);
 	spi_set_drvdata(spi, indio_dev);
diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
index a26a99753418..a8198ba4f98a 100644
--- a/drivers/iio/dac/ds4424.c
+++ b/drivers/iio/dac/ds4424.c
@@ -221,10 +221,8 @@ static int ds4424_probe(struct i2c_client *client)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio dev alloc failed.\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	i2c_set_clientdata(client, indio_dev);
diff --git a/drivers/iio/dac/ti-dac7311.c b/drivers/iio/dac/ti-dac7311.c
index 3d2ce61f0db6..5c1c5213962f 100644
--- a/drivers/iio/dac/ti-dac7311.c
+++ b/drivers/iio/dac/ti-dac7311.c
@@ -242,10 +242,8 @@ static int ti_dac_probe(struct spi_device *spi)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*ti_dac));
-	if (!indio_dev) {
-		dev_err(dev, "can not allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	spi->mode = SPI_MODE_1;
 	spi->bits_per_word = 16;
diff --git a/drivers/iio/dac/vf610_dac.c b/drivers/iio/dac/vf610_dac.c
index b30ff7bb4400..b7ee16ab4edd 100644
--- a/drivers/iio/dac/vf610_dac.c
+++ b/drivers/iio/dac/vf610_dac.c
@@ -178,10 +178,8 @@ static int vf610_dac_probe(struct platform_device *pdev)
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev,
 					sizeof(struct vf610_dac));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "Failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	info = iio_priv(indio_dev);
 	info->dev = &pdev->dev;

-- 
2.43.0


