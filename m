Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13D2CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqTeTmuPyRyJ3pkNoYGDtSBuc00zqnBTdwwG/CzasEM=; b=On5xWDKeBu/yNEeV7NKzrqTBT3
	CrF8edVKoGROAJUiYtpexMhXIRnaFTQv8gzxbPSqhxgcIPgR80LS6F6oOCp6rd626jOTiD6EcfVkA
	24ywHbhJLeZ0Qgq3AeK+QbaO63i8PPAQ8SznLxwtaLzZZXUWXmaQf6AQ/Z+0jiXCH2CedeMM/WG2A
	dT+qlV3tRP0eznqgQ4WvI28XtE5IxsxfefGIENWGFcG8Th7n5MNWtHzfgMtxqThAJQGe2+eHN0THK
	FtXa4+xfV+PvSFyuwjhb8D/u4xGUmThpBkyWdsUVID1/oZxpBdvULdaF2V5rdMMkkjU10z1PpP+2r
	FvPhoSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyH-00000002Uhg-2JUq;
	Fri, 22 Aug 2025 12:34:17 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upInS-00000001RYj-0IrK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:50:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76e2eb20a64so1933744b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834633; x=1756439433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqTeTmuPyRyJ3pkNoYGDtSBuc00zqnBTdwwG/CzasEM=;
        b=hDPmSwwr2IWs1SFQuZSPJgBUIcsfjvUVK83AQ3BYIWsaHfKdNrd4LS2/tLFsq3vy13
         PLTCe2eLSOyc8rUn/UdqHy+2dhGp4dKpR3h3JeecpZ0BOb2dky6yIYMV7Rm2o6NbUMwT
         enkRfMxOhPN+Rz7wJ7Ak9s+5DNHnCuvYBo4fimGzdo4j7CM+0zfGb3DS395LKpxmXEJp
         Q57JgSsonrUZ7YvZZgJby7dsifEkGc34LoxMsZokV/SDvEyjR6E3K33ibo1BAKhJgTkz
         BRiSulALqXxoRAw3FjaRI65i2oU1R8G5Em4TbpPgrdTgmWn1fYMjL7+BYj/A8EuI7SOg
         Z4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834633; x=1756439433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqTeTmuPyRyJ3pkNoYGDtSBuc00zqnBTdwwG/CzasEM=;
        b=K1A025Uc6C0XjD/0oykxSiwVAYgcwP2YrX2SmI45bEyumu4w8KBJkLm/1t1bVBG/pg
         EIqfVbCuVGo8NGSh+eA36ZeC/wWDQzttZ0S7hN0FiiXUM8rtWoLh34uiIB0uibzxbE9S
         T3oPOlku5h1TnlWkMb12ySBoblafvOxNQtQI2hA1M3jx7p88iJ4b3wXAdKasyvy+LsaO
         A2L6Ppw1TvW3uN/EiCzUzGyRzPG9sg0RejWILfl16jy9qB9Vz3m7wq56iZd2zG+ecEnJ
         L0TS90K/QC/PMTMKV/HiXM68sb8I0vgNnSPZx6MK2GRCYRPQ9CZUq51flKT4MpkbWVEf
         6wJA==
X-Forwarded-Encrypted: i=1; AJvYcCVA6+HPKYy/jwNdXE8sk9f/Cn8ibYwMs/N6YnLFAsNR1XJIOP+vX94QYXX9AZwRklwv3tKUkXtwa3JlhbOzL6Nz@lists.infradead.org
X-Gm-Message-State: AOJu0YwHpFP++VBNRYRe+ugckhkX9FVvU4ND4Rg/TgT5HeEVJjut9Mwj
	J2VBqcRb3Z8IG8MBwGg7v/p7xdr+rbYJSbfweG92xT7sID9ISQRFwMWO
X-Gm-Gg: ASbGncs17Wm4ZDh/rrVuqPTI2yZVcFpFObw+4kSnkdl4afG2Dk57RccaLJbPthQDcUA
	OXODXSViQpMIueZorZ+hKLm5+oGGM9FiBV/EkvpBM0OFM/RCkAbXj7hN+s6dtUzHY+eAHoWvXHJ
	TwLh5tvodOoMcDP8WMpv9hn4Ak9+Yu1qOc44PIPkJqfOWGfBI4nyJMJljKv4v42pz74c5OrkXRE
	puB3BAPkMzfTx52Ca5oSqzvkAhxR0qzENF71G0tehrkfuoocu4UiSOe0WGRitnI0IIaZM+MrE6M
	5yQ4BlEgN1SYvC+pGk1+ABub3oExj8YGBHD2QT+vaEFNegHthoKt5eDwABBiiulu4nJXJfChWnW
	SvyyUHFXt7IlUhEAYI1ziwKa16q7Z
X-Google-Smtp-Source: AGHT+IERxoDtaVf+dbrrvbv5pjZ4KSfLrglqW2Pvw+HdC3IHQrRaPUrXlowMN+IZs1D9wMCBHplfUg==
X-Received: by 2002:a05:6a00:bd12:b0:748:2ff7:5e22 with SMTP id d2e1a72fcca58-7702fa057b7mr1767050b3a.10.1755834633167;
        Thu, 21 Aug 2025 20:50:33 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:50:32 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:50 +0530
Subject: [PATCH 02/10] iio: adc: Drop unnecessary -ENOMEM messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-2-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=11663;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=AGu9ZkRHfhF6t137X8zXcHpvsGhVHMDMV1L9x/K150I=;
 b=hqMnjGHFYKykrgn5xbxcJprX4HQtBsNcj5+80fgC7kDWczGc3DTikdedYtP4NDO6fK1WjM8Zu
 VyzP4w7grMLBiK5eg6NuTBqN9ITKDUplHn5PYIrJsgtmxIdUR2wy7HO
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_205034_127178_C7BE4482 
X-CRM114-Status: GOOD (  14.00  )
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
 drivers/iio/adc/ad7949.c          | 4 +---
 drivers/iio/adc/bcm_iproc_adc.c   | 4 +---
 drivers/iio/adc/cpcap-adc.c       | 6 ++----
 drivers/iio/adc/da9150-gpadc.c    | 5 ++---
 drivers/iio/adc/dln2-adc.c        | 9 +++------
 drivers/iio/adc/exynos_adc.c      | 4 +---
 drivers/iio/adc/imx7d_adc.c       | 4 +---
 drivers/iio/adc/imx8qxp-adc.c     | 4 +---
 drivers/iio/adc/mxs-lradc-adc.c   | 4 +---
 drivers/iio/adc/palmas_gpadc.c    | 4 +---
 drivers/iio/adc/rn5t618-adc.c     | 4 +---
 drivers/iio/adc/stm32-dfsdm-adc.c | 4 +---
 drivers/iio/adc/stmpe-adc.c       | 4 +---
 drivers/iio/adc/ti-adc084s021.c   | 4 +---
 drivers/iio/adc/ti-ads131e08.c    | 8 ++------
 drivers/iio/adc/ti_am335x_adc.c   | 5 ++---
 drivers/iio/adc/twl4030-madc.c    | 4 +---
 drivers/iio/adc/viperboard_adc.c  | 4 +---
 18 files changed, 24 insertions(+), 61 deletions(-)

diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
index edd0c3a35ab7..4407828b4fc5 100644
--- a/drivers/iio/adc/ad7949.c
+++ b/drivers/iio/adc/ad7949.c
@@ -317,10 +317,8 @@ static int ad7949_spi_probe(struct spi_device *spi)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*ad7949_adc));
-	if (!indio_dev) {
-		dev_err(dev, "can not allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	indio_dev->info = &ad7949_spi_info;
 	indio_dev->name = spi_get_device_id(spi)->name;
diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index f258668b0dc7..6426c9e6ccc9 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -511,10 +511,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev,
 					sizeof(*adc_priv));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed to allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	adc_priv = iio_priv(indio_dev);
 	platform_set_drvdata(pdev, indio_dev);
diff --git a/drivers/iio/adc/cpcap-adc.c b/drivers/iio/adc/cpcap-adc.c
index ba7cbd3b4822..d9ee2ea116a7 100644
--- a/drivers/iio/adc/cpcap-adc.c
+++ b/drivers/iio/adc/cpcap-adc.c
@@ -953,11 +953,9 @@ static int cpcap_adc_probe(struct platform_device *pdev)
 	int error;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*ddata));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed to allocate iio device\n");
-
+	if (!indio_dev)
 		return -ENOMEM;
-	}
+
 	ddata = iio_priv(indio_dev);
 	ddata->ato = device_get_match_data(&pdev->dev);
 	if (!ddata->ato)
diff --git a/drivers/iio/adc/da9150-gpadc.c b/drivers/iio/adc/da9150-gpadc.c
index b99291ce2a45..625e3a8e4d03 100644
--- a/drivers/iio/adc/da9150-gpadc.c
+++ b/drivers/iio/adc/da9150-gpadc.c
@@ -308,10 +308,9 @@ static int da9150_gpadc_probe(struct platform_device *pdev)
 	int irq, ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*gpadc));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "Failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
+
 	gpadc = iio_priv(indio_dev);
 
 	gpadc->da9150 = da9150;
diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index 9dbd2c87938c..a6f3746b6f13 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -586,10 +586,8 @@ static int dln2_adc_probe(struct platform_device *pdev)
 	int i, ret, chans;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*dln2));
-	if (!indio_dev) {
-		dev_err(dev, "failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	dln2 = iio_priv(indio_dev);
 	dln2->pdev = pdev;
@@ -630,10 +628,9 @@ static int dln2_adc_probe(struct platform_device *pdev)
 	dln2->trig = devm_iio_trigger_alloc(dev, "%s-dev%d",
 					    indio_dev->name,
 					    iio_device_id(indio_dev));
-	if (!dln2->trig) {
-		dev_err(dev, "failed to allocate trigger\n");
+	if (!dln2->trig)
 		return -ENOMEM;
-	}
+
 	iio_trigger_set_drvdata(dln2->trig, dln2);
 	ret = devm_iio_trigger_register(dev, dln2->trig);
 	if (ret) {
diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 4614cf848535..32cfc4002b1b 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -798,10 +798,8 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	int irq;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(struct exynos_adc));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	info = iio_priv(indio_dev);
 
diff --git a/drivers/iio/adc/imx7d_adc.c b/drivers/iio/adc/imx7d_adc.c
index 09ce71f6e941..039c0387da23 100644
--- a/drivers/iio/adc/imx7d_adc.c
+++ b/drivers/iio/adc/imx7d_adc.c
@@ -482,10 +482,8 @@ static int imx7d_adc_probe(struct platform_device *pdev)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "Failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	info = iio_priv(indio_dev);
 	info->dev = dev;
diff --git a/drivers/iio/adc/imx8qxp-adc.c b/drivers/iio/adc/imx8qxp-adc.c
index be13a6ed7e00..427ee9f24408 100644
--- a/drivers/iio/adc/imx8qxp-adc.c
+++ b/drivers/iio/adc/imx8qxp-adc.c
@@ -315,10 +315,8 @@ static int imx8qxp_adc_probe(struct platform_device *pdev)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
-	if (!indio_dev) {
-		dev_err(dev, "Failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(indio_dev);
 	adc->dev = dev;
diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index 92baf3f5f560..dda5182a5076 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -697,10 +697,8 @@ static int mxs_lradc_adc_probe(struct platform_device *pdev)
 
 	/* Allocate the IIO device. */
 	iio = devm_iio_device_alloc(dev, sizeof(*adc));
-	if (!iio) {
-		dev_err(dev, "Failed to allocate IIO device\n");
+	if (!iio)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(iio);
 	adc->lradc = lradc;
diff --git a/drivers/iio/adc/palmas_gpadc.c b/drivers/iio/adc/palmas_gpadc.c
index 7c01e33be04c..3f433064618e 100644
--- a/drivers/iio/adc/palmas_gpadc.c
+++ b/drivers/iio/adc/palmas_gpadc.c
@@ -885,10 +885,8 @@ static int palmas_gpadc_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "iio_device_alloc failed\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(indio_dev);
 	adc->dev = &pdev->dev;
diff --git a/drivers/iio/adc/rn5t618-adc.c b/drivers/iio/adc/rn5t618-adc.c
index d6f6b351f2af..f78fc795b69a 100644
--- a/drivers/iio/adc/rn5t618-adc.c
+++ b/drivers/iio/adc/rn5t618-adc.c
@@ -199,10 +199,8 @@ static int rn5t618_adc_probe(struct platform_device *pdev)
 	struct rn5t618 *rn5t618 = dev_get_drvdata(pdev->dev.parent);
 
 	iio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc));
-	if (!iio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
+	if (!iio_dev)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(iio_dev);
 	adc->dev = &pdev->dev;
diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index f583924eb16b..92e5159793eb 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1763,10 +1763,8 @@ static int stm32_dfsdm_adc_probe(struct platform_device *pdev)
 
 	dev_data = of_device_get_match_data(dev);
 	iio = devm_iio_device_alloc(dev, sizeof(*adc));
-	if (!iio) {
-		dev_err(dev, "%s: Failed to allocate IIO\n", __func__);
+	if (!iio)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(iio);
 	adc->dfsdm = dev_get_drvdata(dev->parent);
diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
index b0add5a2eab5..8e26c47edc08 100644
--- a/drivers/iio/adc/stmpe-adc.c
+++ b/drivers/iio/adc/stmpe-adc.c
@@ -267,10 +267,8 @@ static int stmpe_adc_probe(struct platform_device *pdev)
 		return irq_adc;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(struct stmpe_adc));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	info = iio_priv(indio_dev);
 	mutex_init(&info->lock);
diff --git a/drivers/iio/adc/ti-adc084s021.c b/drivers/iio/adc/ti-adc084s021.c
index 50a474f4d9f5..a100f770fa1c 100644
--- a/drivers/iio/adc/ti-adc084s021.c
+++ b/drivers/iio/adc/ti-adc084s021.c
@@ -200,10 +200,8 @@ static int adc084s021_probe(struct spi_device *spi)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*adc));
-	if (!indio_dev) {
-		dev_err(&spi->dev, "Failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(indio_dev);
 	adc->spi = spi;
diff --git a/drivers/iio/adc/ti-ads131e08.c b/drivers/iio/adc/ti-ads131e08.c
index 085f0d6fb39e..c3bf0ed46690 100644
--- a/drivers/iio/adc/ti-ads131e08.c
+++ b/drivers/iio/adc/ti-ads131e08.c
@@ -807,10 +807,8 @@ static int ads131e08_probe(struct spi_device *spi)
 	}
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
-	if (!indio_dev) {
-		dev_err(&spi->dev, "failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	st = iio_priv(indio_dev);
 	st->info = info;
@@ -841,10 +839,8 @@ static int ads131e08_probe(struct spi_device *spi)
 
 	st->trig = devm_iio_trigger_alloc(&spi->dev, "%s-dev%d",
 		indio_dev->name, iio_device_id(indio_dev));
-	if (!st->trig) {
-		dev_err(&spi->dev, "failed to allocate IIO trigger\n");
+	if (!st->trig)
 		return -ENOMEM;
-	}
 
 	st->trig->ops = &ads131e08_trigger_ops;
 	st->trig->dev.parent = &spi->dev;
diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_adc.c
index fe1509d3b1e7..99f274adc870 100644
--- a/drivers/iio/adc/ti_am335x_adc.c
+++ b/drivers/iio/adc/ti_am335x_adc.c
@@ -631,10 +631,9 @@ static int tiadc_probe(struct platform_device *pdev)
 	}
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc_dev));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed to allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
+
 	adc_dev = iio_priv(indio_dev);
 
 	adc_dev->mfd_tscadc = ti_tscadc_dev_get(pdev);
diff --git a/drivers/iio/adc/twl4030-madc.c b/drivers/iio/adc/twl4030-madc.c
index 0ea51ddeaa0a..fe3b31ec976e 100644
--- a/drivers/iio/adc/twl4030-madc.c
+++ b/drivers/iio/adc/twl4030-madc.c
@@ -758,10 +758,8 @@ static int twl4030_madc_probe(struct platform_device *pdev)
 	}
 
 	iio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*madc));
-	if (!iio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
+	if (!iio_dev)
 		return -ENOMEM;
-	}
 
 	madc = iio_priv(iio_dev);
 	madc->dev = &pdev->dev;
diff --git a/drivers/iio/adc/viperboard_adc.c b/drivers/iio/adc/viperboard_adc.c
index 1028b101cf56..9bb0b83c8f67 100644
--- a/drivers/iio/adc/viperboard_adc.c
+++ b/drivers/iio/adc/viperboard_adc.c
@@ -113,10 +113,8 @@ static int vprbrd_adc_probe(struct platform_device *pdev)
 
 	/* registering iio */
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(indio_dev);
 	adc->vb = vb;

-- 
2.43.0


