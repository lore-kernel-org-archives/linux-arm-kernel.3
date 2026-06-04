Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85C9CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+NJl+VOtJmF26AH7Q6wbNKM2etWMSqxxrEhElEZ90kc=; b=2CryXwG4Mw7L6ZeAhqLuCXlaaG
	RF4QdYydZ/QKc1MWYwCn+OyB4y9esDJOUqOooLPagufS+32IFQ8/B7ATaCZo2NpuVR6BRb2hg47uw
	onKZFlfLMahAlIfVaO1oCKdhuKBMG327z8jY2HWWbBpkA+wmTea1T23oqflX2phBbD6bbnRxOVheC
	0YFrGNNInPEq+owsaVcAIjKmKVtLNxp7LGXlx/BN9twMpf0LqPZgJSn9Paf5T7Y+da6E9aP77qk1T
	wEPkE+2LykOJaCDN7S7mb2w+vwkudPiXPmc8i1mST8aLnwVTD3Xwna4MkCHnvUI+1U+IYYEsVyud2
	ZsWXquqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVF6L-0000000HIYm-13rD;
	Thu, 04 Jun 2026 20:55:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVF6H-0000000HIYO-2RZL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 20:55:40 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-46015dc517aso1000301f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780606535; x=1781211335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NJl+VOtJmF26AH7Q6wbNKM2etWMSqxxrEhElEZ90kc=;
        b=WAU0OoEmac6Rjl2hjxMbaqW/T+Y0wQ8ajtvZfSd5xciGv0hCy8JLlhMTQsBOAH+O7N
         M8RUTUXpB+IA9tQhyi7l5BUZFs3KBS6PzHEoxQZc3hqwjVWblS5cqYi4z5P5lm6H6RC2
         4UgsV3anSmlMxYNiKDLE1gtEPqVS60Jha4RVkcrJlsXsrBGVVtFXeSgVR0AvipRXm1vM
         3NQ3ExQdyqkPtde/QjHJHBGwPm08hEzppqqAN1VrrAx5Ipx6kk4WQa8FLX/jTRIoKi8K
         qbJWp2AovVc+3cMeUu/vVK+ihQ09pLY1cYO8p3yAH9jU1t6qoRo/WLZHZeUj6GsK7eCe
         SxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780606535; x=1781211335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NJl+VOtJmF26AH7Q6wbNKM2etWMSqxxrEhElEZ90kc=;
        b=BElwmzPGCs0P4ncSTDBpNfBZT6RuD8/lNnXQ6el2hGIKk4yAXmPFtJ2QLWGM6xG1gP
         W4SYm36Pz3IKDfNGTLTo0hekHuLHhChBDOIdM8DdV7yN7UiK0ZOgMansKOoB74js8DoW
         svoZ5j6AEMLKOyGylR61TZTjbWV2fRKcWkyv/ZkwXYKwD5brOe3f28eloJ0yaD234qGq
         aMStNLNJU/ZyH+Wodtbs2VJy1xU4jYdN1acpdgvkJolMU6pu+W1IEqYPHohsmPSTHK9N
         igz37EuleUVog8wAFLfHwK0WRTxhDBtnGOFM4os9UpMqRBVdo8NuwQ5kxRQIi8eFvGa1
         esXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DB4zpWCIcmUbD0fIRLClOW2ShwI2AYGBjuxKBLI6RNXKLL/PYNun4uEkyc56abCY7hELkpDUqubmM1c0xsq8V@lists.infradead.org
X-Gm-Message-State: AOJu0YyXjMBdEO4+CakSi92X8O9nf4tQNW5t90KM2AJYdQxitEOcKBj0
	+fbfzQyYMdb/zA75zSvu29mQZlOhcrdDDz5nJPjoJdC9W4iVWEkYQcF9vwSEPUDkAsM=
X-Gm-Gg: Acq92OGH0bqRLkpFrO30fK1Oi9sTG+8EkF7d9qUk48Iq8BQTyCy0uqNyKQwtWJLKvrM
	qm3Ajy/Ct1QlL8WttaIcepddUG0Ya2tkvkwT3dUMU5+Lk+ekFo9LUchzI0IZR9fzaB7+73XpaMk
	AIe8Mjtq3RpsgPWScqklLZMPOAbmc6UC1XICB1olRfFaYwf4qqw61ThuHGfvlwSw1Af98mQ2zOV
	T1NmTJ19HeODDJc4T3Y/nhhNqCMBPy4xBq6vhc3aqQ74HY3OsFNUdUgPLmqKYkR9JlFQbhkwB1/
	NIPT0T2WKJ/dXFm4RNLTiiw17YGkKoewQI+leg2n3rSNE/rckAbBtW5NHHIOzBkErHrwcnrr+lz
	G9irmgQHNms+6Z4ARTy0cK57JXfWf/0vJiD1/exbtN9SAOBVZt8SySPfzhyT7wSguqMQ4thbj5D
	RWKnlsnbkwk0LU3+wObFN19PELQMOzidhmP9hXy1dKopB53VXSMxR8DYyeQLiPVM0uRaXTDdfh8
	Gx93OyfwpU=
X-Received: by 2002:a05:600c:8b83:b0:490:b106:4fe8 with SMTP id 5b1f17b1804b1-490c25e268dmr4427955e9.33.1780606534635;
        Thu, 04 Jun 2026 13:55:34 -0700 (PDT)
Received: from localhost (cust-east-par-46-193-69-147.cust.wifirst.net. [46.193.69.147])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f345209sm19050059f8f.17.2026.06.04.13.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:55:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jonas Gorski <jonas.gorski@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1] spi: Use named initializers for platform_device_id arrays
Date: Thu,  4 Jun 2026 22:55:26 +0200
Message-ID: <3fcd432a505bb1bb7f8ef0fba9162243200b3347.1780606153.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4127; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ea7cuzjVH8l4WaNc0d4fbb0kmTQLbO6kPFR9OFprAfk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqIeY+OnML+6BoYUWkNCcBW4CCesKWtAUwtH7M1 CmI8V/tdnuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaiHmPgAKCRCPgPtYfRL+ ToUeB/9Ds3iuojuAku3iJ0znnvPHYZeMZmNwhkINjPq7CaINJ7JSSTyEpswyNm8rlz0f3IVltgG X9FN32hGno1eod3IWEdXziUvimgNDfm+qys7MJ19RMbC6O9cM0qWH6C9itsGBh65JGITdDOy1BT rq/uQnuBCGD3Jtmj40WqMfGiAyWwFXPTlg6bKMl6D50jYoQRL6GtCnS7jwJiF3jazUVHOmWkbKR aOUfXFLmbLIUxNMXk7A1eK9qDN7j6YP1DwbM8tPr7aDcibwnH4SQtyO/44gnPf9NNktZivcxQMu RDWOo7FyPzJwfsbv35FnUs3qqloZfoa2bHv7I7dqpjHrMANr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_135537_649601_ADCBE12F 
X-CRM114-Status: GOOD (  15.81  )
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

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

see e.g.
https://lore.kernel.org/all/cover.1779893336.git.u.kleine-koenig@baylibre.com/
for details about my quest to modify platform_device_id.

Best regards
Uwe

 drivers/spi/spi-altera-platform.c | 4 ++--
 drivers/spi/spi-bcm63xx.c         | 3 +--
 drivers/spi/spi-cs42l43.c         | 4 ++--
 drivers/spi/spi-rspi.c            | 4 ++--
 drivers/spi/spi-s3c64xx.c         | 6 +++---
 drivers/spi/spi-sh-msiof.c        | 4 ++--
 6 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-altera-platform.c b/drivers/spi/spi-altera-platform.c
index 3ee5d3480bb4..3de7df73f216 100644
--- a/drivers/spi/spi-altera-platform.c
+++ b/drivers/spi/spi-altera-platform.c
@@ -139,8 +139,8 @@ MODULE_DEVICE_TABLE(of, altera_spi_match);
 #endif /* CONFIG_OF */
 
 static const struct platform_device_id altera_spi_ids[] = {
-	{ DRV_NAME,		ALTERA_SPI_TYPE_UNKNOWN },
-	{ "subdev_spi_altera",	ALTERA_SPI_TYPE_SUBDEV },
+	{ .name = DRV_NAME,		.driver_data = ALTERA_SPI_TYPE_UNKNOWN },
+	{ .name = "subdev_spi_altera",	.driver_data = ALTERA_SPI_TYPE_SUBDEV },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, altera_spi_ids);
diff --git a/drivers/spi/spi-bcm63xx.c b/drivers/spi/spi-bcm63xx.c
index f8cfe535b2a3..43d7b54e3ae8 100644
--- a/drivers/spi/spi-bcm63xx.c
+++ b/drivers/spi/spi-bcm63xx.c
@@ -477,8 +477,7 @@ static const struct platform_device_id bcm63xx_spi_dev_match[] = {
 		.name = "bcm6358-spi",
 		.driver_data = (unsigned long)bcm6358_spi_reg_offsets,
 	},
-	{
-	},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bcm63xx_spi_dev_match);
 
diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
index 68f208ef1e01..6961e36b89d1 100644
--- a/drivers/spi/spi-cs42l43.c
+++ b/drivers/spi/spi-cs42l43.c
@@ -438,8 +438,8 @@ static int cs42l43_spi_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cs42l43_spi_id_table[] = {
-	{ "cs42l43-spi", },
-	{}
+	{ .name = "cs42l43-spi" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cs42l43_spi_id_table);
 
diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index a0c77e02bc90..38df676774ee 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -1377,8 +1377,8 @@ static int rspi_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id spi_driver_ids[] = {
-	{ "rspi",	(kernel_ulong_t)&rspi_ops },
-	{},
+	{ .name = "rspi", .driver_data = (kernel_ulong_t)&rspi_ops },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(platform, spi_driver_ids);
diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 37176e557099..28c56b06fa99 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1613,10 +1613,10 @@ static const struct s3c64xx_spi_port_config gs101_spi_port_config = {
 
 static const struct platform_device_id s3c64xx_spi_driver_ids[] = {
 	{
-		.name		= "s3c6410-spi",
-		.driver_data	= (kernel_ulong_t)&s3c6410_spi_port_config,
+		.name = "s3c6410-spi",
+		.driver_data = (kernel_ulong_t)&s3c6410_spi_port_config,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s3c64xx_spi_driver_ids);
 
diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 070e16bc764f..f23db85a1889 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1310,8 +1310,8 @@ static void sh_msiof_spi_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id spi_driver_ids[] = {
-	{ "spi_sh_msiof",	(kernel_ulong_t)&sh_data },
-	{},
+	{ .name = "spi_sh_msiof", .driver_data = (kernel_ulong_t)&sh_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, spi_driver_ids);
 

base-commit: a225caacc36546a09586e3ece36c0313146e7da9
-- 
2.47.3


