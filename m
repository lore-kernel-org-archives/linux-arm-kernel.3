Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A91CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+jteav4D9x2DTms4TQD/M+YamV282bUUh/ZNE5/JHw=; b=uaS4DjyAfmLJcL534JHSh5/wQI
	nEsMglVZfn5nkUHH7cXNJzwMzLVv6GxD32U7Va91ExpJ6Zr5x8fXz/wJEG6PSyidHLtn5d3CclH2C
	FPwhblAvvtfUCFmLVpNGVkjk5TpidDRyqg735SqWpFb3M1DRbr0/90fuMN5ZxwQzP56I1mH8z0w3Q
	JW/xPdbKToXR0MKlvf/otsQ1sZnFafTsWwoZ1JRSRqTE82MFIm4uqZSA7V9hnzC8OqZp2NkcNp9WA
	2i2eEyvHC4/AjY2VkfKmghVXrVbGSIMcJsxYfh7iRQBEhoUFnv4SUuNFfTSt6EdhDhwJHa8YU2G/t
	NwcFsS0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBoC-00000003xVh-2h0w;
	Wed, 27 May 2026 10:48:20 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBo1-00000003xMR-19jY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:48:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-449de065cb3so11359270f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779878887; x=1780483687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+jteav4D9x2DTms4TQD/M+YamV282bUUh/ZNE5/JHw=;
        b=F+Tgc+OLwGYtVopNpnYgU8U4FJ7uDEoHlRZZ3VaLADAKGF8BeiIvhZbS3/2S5Tot6u
         L1pAcs01eOrbd/JVDdXFtv5lEbdgqOqIjbFZaRP+mpJeOIyoVhN0HQ2rJNzMOqFs4cj8
         b/eeaoyGXsnrkaWXOUxUO8fe7yYbcNAGH+UJFAkCxFvFFVqi/ofu1ATjXDsAlt2gmhGO
         1CgCdIlpy5pIpJ7gB5uv+6mQd/nK2lvDCeTIqBTJMLEzf68xyPAUDuiA9T0yPZ9WQ+QE
         ow/4kg49NpF281gtgIwKva156AT/zyqlmnR2mMW2yaCJc9jq1MyO/Q663BjwuWyjQDRf
         u9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878887; x=1780483687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h+jteav4D9x2DTms4TQD/M+YamV282bUUh/ZNE5/JHw=;
        b=l4PBdKBahFIbZeqgYIH+sZIrWDTYSMPMUeKrgsCFXMHhy+Jl7Ta8cs0pWipnb4C6wf
         WEW33q4z1JjIiKFBZvSja/bpHGyfX2lMVaSMGPS4u96an4x0trP9NRAiorCEpR4/gj0H
         LXmWi2FL+KCxoa/zprqHyQyKwYo+w9S+6ZVFJeX7WqBthI1mXVjUDmdVBIaW90N1t/3v
         Z6Qp8czsD9WZT0yAJ4C82xdxEvB3llbngzqZUtu/VphBhuSU/nQXIr3t/bt+jodeYg2O
         YsolboBIR0oclzEGBA1xqpeFv/0EWZD+hCU3FQpGRMQJnF5F4eT+2Z5Fq6WjkZgx4Y97
         NMXw==
X-Forwarded-Encrypted: i=1; AFNElJ9HjidZcsM9CXnEZjttyXi4bxecBNls/x0ySw+L5M0JF0AnvdhwF0j8u020Y8UOsZ1PugHZCtBzwlvJ+4A+RZn3@lists.infradead.org
X-Gm-Message-State: AOJu0YzludrRi9da5VWdMmLR2IPL0uK10fprKyM0XDSjQ+MLsiNLdY6A
	4KYMA1QyJP2g5SkICkt5SqBPUnykzNtcg4D5aj/Ww2ivH2/BC6cVxXaHz9ZgMpF3RL0=
X-Gm-Gg: Acq92OH8EhMEZTEjtlLTw+6dBpnoxCjU3CemXD8qtWA0X1BYUOv/elTfK5fog/RZspv
	Yfol6I7wtjBPgnLm751BJq5Jn3vr9uDaq/mCNESUbufSnOsoto9tIzXZb/aFNwemBzJtwG+m29r
	QNUktWmsKbiBS81bJK+Ze4XpN4hhH7OBGGpSZ0zZMI9Qz2NioZsy3rO1ZPmVzh1KNrfhPcmSvJ4
	bjw6LzPtH2HcdOYJj8gj6xGYJklNW14VQtnE8lxH3mb3w0mLVCdHAc8mPALw76CmZWF7+/TCizw
	YkG8UDETQafd0PHNOVGDWqbqbql9R2qC1qHyus80WpNUxXneuVUN7qKhuayloKk1mTN9J0CbgDs
	V9ea0bUvhezHzUzE1SsU0UxtGqn6F/Km4eJ1mdibUskAGBv4Qcd8vA+l8sUJEHdqEdj6N18cwxL
	m0qr3tZeeS9U18XKwRX19t8FbnZlObAS6aOStdboUyjdoFIFWdKsDDqAIE6ndzjm7IT1RmclN3d
	Nkv2T+pe84MPaoCMTyivP5cQA==
X-Received: by 2002:a5d:64c2:0:b0:43d:7868:21f0 with SMTP id ffacd0b85a97d-45eb3670591mr35823238f8f.9.1779878887204;
        Wed, 27 May 2026 03:48:07 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb5a2a7esm5127229f8f.20.2026.05.27.03.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:48:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Samuel Kayode <samkay014@gmail.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v1 2/3] regulator: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 12:47:45 +0200
Message-ID: <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=17156; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=7DqkJbY4i6aJTN+FctTn+7O5Txxjpa/eNUwHqPhTnZM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFsvY9VSNlPmyuU2BUhmWIf/tQhQJT3KgtA/6z vyHUdR3F0aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahbL2AAKCRCPgPtYfRL+ TqiUB/4mxAjGpMQxNdUFWcdXldTmS8VPJEdH+Jn6TvpBFRb/T1S3m7k6pNzfNektk5KGTPSFk3L jv5N+0mqu81KEzY/D87V71RKMLENUgB2XMeIZB9tWqBi3HEDqPfgdXo3nWhZ3S3LP4Dwh4VPGPU +aAlBy1jCZa8gF1SaDtERkA/i878+sVQcYmQBmJq5kuCIEy9QFHCLEjtKTaaFNtQIEdrVvmKNly Kx47VGcPiGW4MuqbhvII2JmHPs70dlwzfOv2D4D33PkNt0Wu/vezGPSTIRqPr4vtxGNGfXc7WFf zZDGJ3ceqZyWlrs7DGqmxx7J0fYSeB4ulT/lsodx0FJb2nTs
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_034809_483280_879BCE4C 
X-CRM114-Status: GOOD (  16.45  )
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
struct platform_device_id replacing .driver_data by an anonymous unit.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/regulator/88pm886-regulator.c     |  2 +-
 drivers/regulator/bd71815-regulator.c     |  4 ++--
 drivers/regulator/bd71828-regulator.c     |  6 +++---
 drivers/regulator/bd718x7-regulator.c     |  6 +++---
 drivers/regulator/bd9571mwv-regulator.c   |  4 ++--
 drivers/regulator/bd9576-regulator.c      |  6 +++---
 drivers/regulator/bd96801-regulator.c     | 10 +++++-----
 drivers/regulator/lp873x-regulator.c      |  2 +-
 drivers/regulator/lp87565-regulator.c     |  4 ++--
 drivers/regulator/max14577-regulator.c    |  4 ++--
 drivers/regulator/max77541-regulator.c    |  4 ++--
 drivers/regulator/max77693-regulator.c    |  6 +++---
 drivers/regulator/max8998.c               |  4 ++--
 drivers/regulator/mt6357-regulator.c      |  4 ++--
 drivers/regulator/pf1550-regulator.c      |  2 +-
 drivers/regulator/qcom-pm8008-regulator.c |  2 +-
 drivers/regulator/rt5033-regulator.c      |  2 +-
 drivers/regulator/s2dos05-regulator.c     |  4 ++--
 drivers/regulator/s2mps11.c               | 18 +++++++++---------
 drivers/regulator/sy7636a-regulator.c     |  2 +-
 drivers/regulator/tps65086-regulator.c    |  2 +-
 drivers/regulator/tps65218-regulator.c    |  2 +-
 drivers/regulator/tps65219-regulator.c    |  6 +++---
 drivers/regulator/tps65912-regulator.c    |  2 +-
 24 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88pm886-regulator.c
index a38bd4f312b7..7328cd1cf265 100644
--- a/drivers/regulator/88pm886-regulator.c
+++ b/drivers/regulator/88pm886-regulator.c
@@ -373,7 +373,7 @@ static int pm886_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id pm886_regulator_id_table[] = {
-	{ "88pm886-regulator", },
+	{ .name = "88pm886-regulator" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm886_regulator_id_table);
diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 668714f35464..4c2b20d1b284 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -607,8 +607,8 @@ static int bd7181x_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd7181x_pmic_id[] = {
-	{ "bd71815-pmic", ROHM_CHIP_TYPE_BD71815 },
-	{ },
+	{ .name = "bd71815-pmic", .driver_data = ROHM_CHIP_TYPE_BD71815 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd7181x_pmic_id);
 
diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index 473beb4399d9..bd61caa8284a 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -1691,9 +1691,9 @@ static int bd71828_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd71828_pmic_id[] = {
-	{ "bd71828-pmic", ROHM_CHIP_TYPE_BD71828 },
-	{ "bd72720-pmic", ROHM_CHIP_TYPE_BD72720 },
-	{ },
+	{ .name = "bd71828-pmic", .driver_data = ROHM_CHIP_TYPE_BD71828 },
+	{ .name = "bd72720-pmic", .driver_data = ROHM_CHIP_TYPE_BD72720 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd71828_pmic_id);
 
diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index 1b5997c8482e..9cc29b9409d0 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -1816,9 +1816,9 @@ static int bd718xx_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd718x7_pmic_id[] = {
-	{ "bd71837-pmic", ROHM_CHIP_TYPE_BD71837 },
-	{ "bd71847-pmic", ROHM_CHIP_TYPE_BD71847 },
-	{ },
+	{ .name = "bd71837-pmic", .driver_data = ROHM_CHIP_TYPE_BD71837 },
+	{ .name = "bd71847-pmic", .driver_data = ROHM_CHIP_TYPE_BD71847 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_pmic_id);
 
diff --git a/drivers/regulator/bd9571mwv-regulator.c b/drivers/regulator/bd9571mwv-regulator.c
index f4de24a281b1..5bf02dc0d20e 100644
--- a/drivers/regulator/bd9571mwv-regulator.c
+++ b/drivers/regulator/bd9571mwv-regulator.c
@@ -344,8 +344,8 @@ static int bd9571mwv_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd9571mwv_regulator_id_table[] = {
-	{ "bd9571mwv-regulator", ROHM_CHIP_TYPE_BD9571 },
-	{ "bd9574mwf-regulator", ROHM_CHIP_TYPE_BD9574 },
+	{ .name = "bd9571mwv-regulator", .driver_data = ROHM_CHIP_TYPE_BD9571 },
+	{ .name = "bd9574mwf-regulator", .driver_data = ROHM_CHIP_TYPE_BD9574 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, bd9571mwv_regulator_id_table);
diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
index bf5f9c3f2c97..fcdaaa56e356 100644
--- a/drivers/regulator/bd9576-regulator.c
+++ b/drivers/regulator/bd9576-regulator.c
@@ -1117,9 +1117,9 @@ static int bd957x_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd957x_pmic_id[] = {
-	{ "bd9573-regulator", ROHM_CHIP_TYPE_BD9573 },
-	{ "bd9576-regulator", ROHM_CHIP_TYPE_BD9576 },
-	{ },
+	{ .name = "bd9573-regulator", .driver_data = ROHM_CHIP_TYPE_BD9573 },
+	{ .name = "bd9576-regulator", .driver_data = ROHM_CHIP_TYPE_BD9576 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd957x_pmic_id);
 
diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 129b20c33bad..308279b31fd3 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -1329,11 +1329,11 @@ static int bd96801_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd96801_pmic_id[] = {
-	{ "bd96801-regulator", (kernel_ulong_t)&bd96801_data },
-	{ "bd96802-regulator", (kernel_ulong_t)&bd96802_data },
-	{ "bd96805-regulator", (kernel_ulong_t)&bd96805_data },
-	{ "bd96806-regulator", (kernel_ulong_t)&bd96806_data },
-	{ },
+	{ .name = "bd96801-regulator", .driver_data = (kernel_ulong_t)&bd96801_data },
+	{ .name = "bd96802-regulator", .driver_data = (kernel_ulong_t)&bd96802_data },
+	{ .name = "bd96805-regulator", .driver_data = (kernel_ulong_t)&bd96805_data },
+	{ .name = "bd96806-regulator", .driver_data = (kernel_ulong_t)&bd96806_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd96801_pmic_id);
 
diff --git a/drivers/regulator/lp873x-regulator.c b/drivers/regulator/lp873x-regulator.c
index 84a134cfcd9c..7e837ddfa236 100644
--- a/drivers/regulator/lp873x-regulator.c
+++ b/drivers/regulator/lp873x-regulator.c
@@ -180,7 +180,7 @@ static int lp873x_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id lp873x_regulator_id_table[] = {
-	{ "lp873x-regulator", },
+	{ .name = "lp873x-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, lp873x_regulator_id_table);
diff --git a/drivers/regulator/lp87565-regulator.c b/drivers/regulator/lp87565-regulator.c
index 1259b5d20153..34e7a5d323d7 100644
--- a/drivers/regulator/lp87565-regulator.c
+++ b/drivers/regulator/lp87565-regulator.c
@@ -229,8 +229,8 @@ static int lp87565_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id lp87565_regulator_id_table[] = {
-	{ "lp87565-regulator", },
-	{ "lp87565-q1-regulator", },
+	{ .name = "lp87565-regulator" },
+	{ .name = "lp87565-q1-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, lp87565_regulator_id_table);
diff --git a/drivers/regulator/max14577-regulator.c b/drivers/regulator/max14577-regulator.c
index 41fd15adfd1f..c9d8d5e31cbd 100644
--- a/drivers/regulator/max14577-regulator.c
+++ b/drivers/regulator/max14577-regulator.c
@@ -235,8 +235,8 @@ static int max14577_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max14577_regulator_id[] = {
-	{ "max14577-regulator", MAXIM_DEVICE_TYPE_MAX14577, },
-	{ "max77836-regulator", MAXIM_DEVICE_TYPE_MAX77836, },
+	{ .name = "max14577-regulator", .driver_data = MAXIM_DEVICE_TYPE_MAX14577 },
+	{ .name = "max77836-regulator", .driver_data = MAXIM_DEVICE_TYPE_MAX77836 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max14577_regulator_id);
diff --git a/drivers/regulator/max77541-regulator.c b/drivers/regulator/max77541-regulator.c
index e6b3d9147c37..f2365930e9a9 100644
--- a/drivers/regulator/max77541-regulator.c
+++ b/drivers/regulator/max77541-regulator.c
@@ -133,8 +133,8 @@ static int max77541_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77541_regulator_platform_id[] = {
-	{ "max77540-regulator" },
-	{ "max77541-regulator" },
+	{ .name = "max77540-regulator" },
+	{ .name = "max77541-regulator" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77541_regulator_platform_id);
diff --git a/drivers/regulator/max77693-regulator.c b/drivers/regulator/max77693-regulator.c
index 72a67d0c5f1e..a8b3a2058d34 100644
--- a/drivers/regulator/max77693-regulator.c
+++ b/drivers/regulator/max77693-regulator.c
@@ -271,9 +271,9 @@ static int max77693_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77693_pmic_id[] = {
-	{ "max77693-pmic", TYPE_MAX77693 },
-	{ "max77843-regulator", TYPE_MAX77843 },
-	{},
+	{ .name = "max77693-pmic", .driver_data = TYPE_MAX77693 },
+	{ .name = "max77843-regulator", .driver_data = TYPE_MAX77843 },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(platform, max77693_pmic_id);
diff --git a/drivers/regulator/max8998.c b/drivers/regulator/max8998.c
index 254a77887f66..cc85fbe8b77c 100644
--- a/drivers/regulator/max8998.c
+++ b/drivers/regulator/max8998.c
@@ -752,8 +752,8 @@ static int max8998_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max8998_pmic_id[] = {
-	{ "max8998-pmic", TYPE_MAX8998 },
-	{ "lp3974-pmic", TYPE_LP3974 },
+	{ .name = "max8998-pmic", .driver_data = TYPE_MAX8998 },
+	{ .name = "lp3974-pmic", .driver_data = TYPE_LP3974 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max8998_pmic_id);
diff --git a/drivers/regulator/mt6357-regulator.c b/drivers/regulator/mt6357-regulator.c
index 09feb454ab6b..815ef7d3e5be 100644
--- a/drivers/regulator/mt6357-regulator.c
+++ b/drivers/regulator/mt6357-regulator.c
@@ -431,8 +431,8 @@ static int mt6357_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6357_platform_ids[] = {
-	{ "mt6357-regulator" },
-	{ /* sentinel */ },
+	{ .name = "mt6357-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6357_platform_ids);
 
diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1550-regulator.c
index 1d1726528460..610eac9bb9cb 100644
--- a/drivers/regulator/pf1550-regulator.c
+++ b/drivers/regulator/pf1550-regulator.c
@@ -409,7 +409,7 @@ static int pf1550_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id pf1550_regulator_id[] = {
-	{ "pf1550-regulator", },
+	{ .name = "pf1550-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, pf1550_regulator_id);
diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 90c78ee1c37b..9c9b8be2e15a 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -180,7 +180,7 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id pm8008_regulator_id_table[] = {
-	{ "pm8008-regulator" },
+	{ .name = "pm8008-regulator" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8008_regulator_id_table);
diff --git a/drivers/regulator/rt5033-regulator.c b/drivers/regulator/rt5033-regulator.c
index 2ba74f205543..3aeab9a57871 100644
--- a/drivers/regulator/rt5033-regulator.c
+++ b/drivers/regulator/rt5033-regulator.c
@@ -116,7 +116,7 @@ static int rt5033_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id rt5033_regulator_id[] = {
-	{ "rt5033-regulator", },
+	{ .name = "rt5033-regulator" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, rt5033_regulator_id);
diff --git a/drivers/regulator/s2dos05-regulator.c b/drivers/regulator/s2dos05-regulator.c
index a1c394ddbaff..6e25f663496a 100644
--- a/drivers/regulator/s2dos05-regulator.c
+++ b/drivers/regulator/s2dos05-regulator.c
@@ -146,8 +146,8 @@ static int s2dos05_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2dos05_pmic_id[] = {
-	{ "s2dos05-regulator" },
-	{ },
+	{ .name = "s2dos05-regulator" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s2dos05_pmic_id);
 
diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 81cfd60460f8..0fb54617b8a7 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -2266,15 +2266,15 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_pmic_id[] = {
-	{ "s2mpg10-regulator", S2MPG10},
-	{ "s2mpg11-regulator", S2MPG11},
-	{ "s2mps11-regulator", S2MPS11X},
-	{ "s2mps13-regulator", S2MPS13X},
-	{ "s2mps14-regulator", S2MPS14X},
-	{ "s2mps15-regulator", S2MPS15X},
-	{ "s2mpu02-regulator", S2MPU02},
-	{ "s2mpu05-regulator", S2MPU05},
-	{ },
+	{ .name = "s2mpg10-regulator", .driver_data = S2MPG10 },
+	{ .name = "s2mpg11-regulator", .driver_data = S2MPG11 },
+	{ .name = "s2mps11-regulator", .driver_data = S2MPS11X },
+	{ .name = "s2mps13-regulator", .driver_data = S2MPS13X },
+	{ .name = "s2mps14-regulator", .driver_data = S2MPS14X },
+	{ .name = "s2mps15-regulator", .driver_data = S2MPS15X },
+	{ .name = "s2mpu02-regulator", .driver_data = S2MPU02 },
+	{ .name = "s2mpu05-regulator", .driver_data = S2MPU05 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s2mps11_pmic_id);
 
diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 551647bc1052..c44c445ea139 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -147,7 +147,7 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id sy7636a_regulator_id_table[] = {
-	{ "sy7636a-regulator", },
+	{ .name = "sy7636a-regulator" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, sy7636a_regulator_id_table);
diff --git a/drivers/regulator/tps65086-regulator.c b/drivers/regulator/tps65086-regulator.c
index 2d284c64eeb7..94bf96856d10 100644
--- a/drivers/regulator/tps65086-regulator.c
+++ b/drivers/regulator/tps65086-regulator.c
@@ -399,7 +399,7 @@ static int tps65086_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65086_regulator_id_table[] = {
-	{ "tps65086-regulator", },
+	{ .name = "tps65086-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65086_regulator_id_table);
diff --git a/drivers/regulator/tps65218-regulator.c b/drivers/regulator/tps65218-regulator.c
index f44b5767099c..8df81ceeb845 100644
--- a/drivers/regulator/tps65218-regulator.c
+++ b/drivers/regulator/tps65218-regulator.c
@@ -341,7 +341,7 @@ static int tps65218_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65218_regulator_id_table[] = {
-	{ "tps65218-regulator", },
+	{ .name = "tps65218-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65218_regulator_id_table);
diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 324c3a33af8a..a667c3f44bb7 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -541,9 +541,9 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65219_regulator_id_table[] = {
-	{ "tps65214-regulator", TPS65214 },
-	{ "tps65215-regulator", TPS65215 },
-	{ "tps65219-regulator", TPS65219 },
+	{ .name = "tps65214-regulator", .driver_data = TPS65214 },
+	{ .name = "tps65215-regulator", .driver_data = TPS65215 },
+	{ .name = "tps65219-regulator", .driver_data = TPS65219 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65219_regulator_id_table);
diff --git a/drivers/regulator/tps65912-regulator.c b/drivers/regulator/tps65912-regulator.c
index 7ff7877a2e09..4317ec62f18f 100644
--- a/drivers/regulator/tps65912-regulator.c
+++ b/drivers/regulator/tps65912-regulator.c
@@ -142,7 +142,7 @@ static int tps65912_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65912_regulator_id_table[] = {
-	{ "tps65912-regulator", },
+	{ .name = "tps65912-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65912_regulator_id_table);
-- 
2.47.3


