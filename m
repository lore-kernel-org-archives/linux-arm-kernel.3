Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9772CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdo6EW50u1yXg+GVeHLwl9An8gN2KPQ5xyF5/s/7kS0=; b=Eui4MElFaP0xDpab/paNWOY4t+
	t73nwndJK+vh1gM6EJlr5oYg3LcoOwsxXIr6vQ+M9Se12LpNetr5+bOUepvGr8dCVOW01ccvuINiN
	rLR0Zf2FNYu4MJCh0lqqcyljzSnSxo5dpGpmP6XkDuO3xiKZs3CKZHJlWSfkRE3J1oW8pvuIV18th
	D4bAXeOiJiMobTQDtG7uH7CTbubbzwfNINhYHR+RFOr+CquOSyqwjxoStJwIr3lXFsunYgrk3dH1B
	XkmYbKvHdLJR03K51Z1aJb5FuSwnoShOydDxtQZejWUIExmCOJj8YOrEeHKpMM7KBc19bVyyr3ND+
	QUKZ1uuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIno-00000004jeQ-0B57;
	Thu, 02 Jul 2026 14:54:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfInl-00000004jdM-1b4V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:54:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-474303f3c72so1252658f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 07:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783004043; x=1783608843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdo6EW50u1yXg+GVeHLwl9An8gN2KPQ5xyF5/s/7kS0=;
        b=fqBwZuGguUrY/TQtD/qQ3hFLQWHWFoxb/IJXfDH4AEyyZxZ/gFrGxarfW+U1W2WauK
         tJOR56/G1Jasl/LhqhRT24F6Hjw9TZz65+8AngpbiIi2Z0o/x0OGGV5qgcNqJqbKAY9p
         XgBcS6QhVIavfGp8r1jPkxOaUVG16iDJFHzQzISnSA+76Hrc80Dlei7ynk4YOuepG3h3
         81mw+fJ66n7o4Jl3NhJmG+w63mTm1qWId7v9i+ee5t+pUdItDKA5N925F8nWfXYqbV7P
         08lY4NIoZMGvOWhYUExwZ5RZFXvfIaIr8UkTGmkgLjGtrkxc2h4rEG5jZfB9TWnsEZTX
         b2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783004043; x=1783608843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pdo6EW50u1yXg+GVeHLwl9An8gN2KPQ5xyF5/s/7kS0=;
        b=BJHddVWucUS9W3UM638W9TvB/EJ1ZGBjpZVOGo3bpJLPTzZPTMTeMp5UwHQaUO8sZb
         l79EpjRyMZNKsywP3oSaNIpQ6v7ZcG9CgOWBQVNbZ9eP5Bttrgz4H9IcL2UJ4wwYs05A
         bBKro2W3BbecRDji21A0LF8PgqGtPk/0fwxvY4H2qIhzLyGO1S0lNs8JmsTydAMF+fPt
         v8DDOComhxEo7i0zvQNP3vxUCtX/4xbTo4CUOf44R0OJGasPXlUfNQy09qmwH9gjZZUY
         w24cuFl8pC82liwZkAQTCEGsd8AVt9qFQbH4yCHK2XFgR1lMW8Oluvere8vwsEn7XsHV
         hCBg==
X-Forwarded-Encrypted: i=1; AHgh+RrJOmcv3PLV66K5UVXLRHAk2d+0OTlH6CLdRq5QV7s+4jmv8EVQDtCm/Ef2n7PmoLT7U3/fAbP0vPf5naLSRVnk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcia/ZwqXwKdXI8+7qRrNbW10hcLKOSE0PZBaTUiGPRtj9Y1+R
	nbfY4eo8G8vpy2r1DN9t+2Yt+S69scF3FuE+sEq6D3EFathVNA54hVTj28HmU/MmRiE=
X-Gm-Gg: AfdE7cks2xxPRlemT/vAc+p50BU9dXFeFrz2Zcae5Z6bB1uh8Jbew3pPBwqS1cljkvT
	H6Js7F8kqlVD13xQ8KV4T/JapDd6RKlHQpseU5GugMnCOuLP5UD/fQLKypEO604kDXQfgSsPx+E
	FgM3ZzhTWWVUbWSW0AyrdpHu76IuudFvZQ3ZCG7HwBxT1g1Vyl8W70diIkwhYjkOcBPxPryMH0m
	4NEEiGdddAUA2EE2wh+n62ka9J8X1k1f5u0lxQ+AY03ykJnpF5PrSXimK/iE+nWn2zJcEsADqFF
	PgIUKBoz8LT5u1tVnKWmzKSvME0YuVIQ6As+GVPeyTo8xPKfzk41Otmu2kkRsL6gxZbDDMVC687
	Ag3ZBx95XKWawzGmAKLBmBeUbv6hqIBL/y7+/G5rTMOxbOUbaE5oVCVJTm9QfeYseZwoqnhBauU
	ebz0Xo110eNQtVp5hMnOVb0vntKM28FfhGWNXmDZWwS3rAjsZ6T3L4w2CUCGh7srFK+CVWbQbKQ
	vCT
X-Received: by 2002:a05:6000:230f:b0:471:c76f:332a with SMTP id ffacd0b85a97d-477573b7906mr9238829f8f.3.1783004043377;
        Thu, 02 Jul 2026 07:54:03 -0700 (PDT)
Received: from localhost (p200300f65f47db04bdb9899c6dd79ae8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:bdb9:899c:6dd7:9ae8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477db8a450bsm10150079f8f.10.2026.07.02.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:54:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/3] mfd: Initialize spi_device_id arrays using member names
Date: Thu,  2 Jul 2026 16:53:40 +0200
Message-ID: <f83c8292e7e3ba9425792591fb136d4ae1468215.1783003256.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
References: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7533; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Es7SsSn8e0HRgyV3Fx080mF6R5iQ/dMdO440YIjWaMw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqRnt49Rz8hQwyuGLmQ4QsBwmREUTlRIsCEdHWu r+Z8AGHldyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakZ7eAAKCRCPgPtYfRL+ TpUVCACBgWaEVYajAsPuzKuv5cAHxaubBHVn6YEDEX0YWIezmG6ryGtnVJIdcVmFPF90vztkjiH wg0giaTrzet84juyBYlNLPI5zFMr4wTfgiq3X9224pJCGrjb9X6CCmzCP8Ah3wkjodikr1HmoVt BcAyR/wukQBEFujmCCQ+cxEiTOSKeNBRuOuMIXbsHMdccguSRtOaKJxaRvXH4IOeXVvpHAZcGDK 7dkPVEZAozZvG/vnBomhpyYjUTJ4Q/24bPx+XyI6kinjNhJ6GiPDvGAwTgbcDqSA9YoS7zlkPUr 55jU0eAiuAFdlZldot+CUniGvTlp9Jq7xlYb3VOi5R5BmAxq
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_075405_470920_919528BD 
X-CRM114-Status: GOOD (  14.98  )
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

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
spi_device_id that replaces .driver_data by an anonymous union.

Also adapt spacing and usage of commas to the most common style.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/arizona-spi.c       | 12 ++++++------
 drivers/mfd/cs40l50-spi.c       |  4 ++--
 drivers/mfd/da9052-spi.c        | 12 ++++++------
 drivers/mfd/intel-m10-bmc-spi.c |  6 +++---
 drivers/mfd/madera-spi.c        | 18 +++++++++---------
 drivers/mfd/rsmu_spi.c          | 12 ++++++------
 drivers/mfd/stmpe-spi.c         | 12 ++++++------
 drivers/mfd/wm831x-spi.c        | 16 ++++++++--------
 8 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index eaa2b2bc5dd0..04baf5a1c652 100644
--- a/drivers/mfd/arizona-spi.c
+++ b/drivers/mfd/arizona-spi.c
@@ -255,12 +255,12 @@ static void arizona_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id arizona_spi_ids[] = {
-	{ "wm5102", WM5102 },
-	{ "wm5110", WM5110 },
-	{ "wm8280", WM8280 },
-	{ "wm1831", WM1831 },
-	{ "cs47l24", CS47L24 },
-	{ },
+	{ .name = "wm5102", .driver_data = WM5102 },
+	{ .name = "wm5110", .driver_data = WM5110 },
+	{ .name = "wm8280", .driver_data = WM8280 },
+	{ .name = "wm1831", .driver_data = WM1831 },
+	{ .name = "cs47l24", .driver_data = CS47L24 },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, arizona_spi_ids);
 
diff --git a/drivers/mfd/cs40l50-spi.c b/drivers/mfd/cs40l50-spi.c
index 53526b595a0d..a635951ca6b7 100644
--- a/drivers/mfd/cs40l50-spi.c
+++ b/drivers/mfd/cs40l50-spi.c
@@ -40,8 +40,8 @@ static void cs40l50_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id cs40l50_id_spi[] = {
-	{ "cs40l50" },
-	{}
+	{ .name = "cs40l50" },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, cs40l50_id_spi);
 
diff --git a/drivers/mfd/da9052-spi.c b/drivers/mfd/da9052-spi.c
index be5f2b34e18a..29cf2c17fde1 100644
--- a/drivers/mfd/da9052-spi.c
+++ b/drivers/mfd/da9052-spi.c
@@ -63,12 +63,12 @@ static void da9052_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id da9052_spi_id[] = {
-	{"da9052", DA9052},
-	{"da9053-aa", DA9053_AA},
-	{"da9053-ba", DA9053_BA},
-	{"da9053-bb", DA9053_BB},
-	{"da9053-bc", DA9053_BC},
-	{}
+	{ .name = "da9052", .driver_data = DA9052 },
+	{ .name = "da9053-aa", .driver_data = DA9053_AA },
+	{ .name = "da9053-ba", .driver_data = DA9053_BA },
+	{ .name = "da9053-bb", .driver_data = DA9053_BB },
+	{ .name = "da9053-bc", .driver_data = DA9053_BC },
+	{ }
 };
 
 static struct spi_driver da9052_spi_driver = {
diff --git a/drivers/mfd/intel-m10-bmc-spi.c b/drivers/mfd/intel-m10-bmc-spi.c
index cfa620f0c70e..94b9c99bb4f8 100644
--- a/drivers/mfd/intel-m10-bmc-spi.c
+++ b/drivers/mfd/intel-m10-bmc-spi.c
@@ -160,9 +160,9 @@ static const struct intel_m10bmc_platform_info m10bmc_spi_n5010 = {
 };
 
 static const struct spi_device_id m10bmc_spi_id[] = {
-	{ "m10-n3000", (kernel_ulong_t)&m10bmc_spi_n3000 },
-	{ "m10-d5005", (kernel_ulong_t)&m10bmc_spi_d5005 },
-	{ "m10-n5010", (kernel_ulong_t)&m10bmc_spi_n5010 },
+	{ .name = "m10-n3000", .driver_data = (kernel_ulong_t)&m10bmc_spi_n3000 },
+	{ .name = "m10-d5005", .driver_data = (kernel_ulong_t)&m10bmc_spi_d5005 },
+	{ .name = "m10-n5010", .driver_data = (kernel_ulong_t)&m10bmc_spi_n5010 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, m10bmc_spi_id);
diff --git a/drivers/mfd/madera-spi.c b/drivers/mfd/madera-spi.c
index ce9e90322c9c..3fffa21ceadc 100644
--- a/drivers/mfd/madera-spi.c
+++ b/drivers/mfd/madera-spi.c
@@ -112,15 +112,15 @@ static void madera_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id madera_spi_ids[] = {
-	{ "cs47l15", CS47L15 },
-	{ "cs47l35", CS47L35 },
-	{ "cs47l85", CS47L85 },
-	{ "cs47l90", CS47L90 },
-	{ "cs47l91", CS47L91 },
-	{ "cs42l92", CS42L92 },
-	{ "cs47l92", CS47L92 },
-	{ "cs47l93", CS47L93 },
-	{ "wm1840", WM1840 },
+	{ .name = "cs47l15", .driver_data = CS47L15 },
+	{ .name = "cs47l35", .driver_data = CS47L35 },
+	{ .name = "cs47l85", .driver_data = CS47L85 },
+	{ .name = "cs47l90", .driver_data = CS47L90 },
+	{ .name = "cs47l91", .driver_data = CS47L91 },
+	{ .name = "cs42l92", .driver_data = CS42L92 },
+	{ .name = "cs47l92", .driver_data = CS47L92 },
+	{ .name = "cs47l93", .driver_data = CS47L93 },
+	{ .name = "wm1840", .driver_data = WM1840 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, madera_spi_ids);
diff --git a/drivers/mfd/rsmu_spi.c b/drivers/mfd/rsmu_spi.c
index e07f21482439..cdb0f9797ec6 100644
--- a/drivers/mfd/rsmu_spi.c
+++ b/drivers/mfd/rsmu_spi.c
@@ -239,12 +239,12 @@ static void rsmu_spi_remove(struct spi_device *client)
 }
 
 static const struct spi_device_id rsmu_spi_id[] = {
-	{ "8a34000",  RSMU_CM },
-	{ "8a34001",  RSMU_CM },
-	{ "8a34002",  RSMU_CM },
-	{ "82p33810", RSMU_SABRE },
-	{ "82p33811", RSMU_SABRE },
-	{}
+	{ .name = "8a34000", .driver_data = RSMU_CM },
+	{ .name = "8a34001", .driver_data = RSMU_CM },
+	{ .name = "8a34002", .driver_data = RSMU_CM },
+	{ .name = "82p33810", .driver_data = RSMU_SABRE },
+	{ .name = "82p33811", .driver_data = RSMU_SABRE },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, rsmu_spi_id);
 
diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index dea31efface6..22a3da062dee 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -121,12 +121,12 @@ static const struct of_device_id stmpe_spi_of_match[] = {
 MODULE_DEVICE_TABLE(of, stmpe_spi_of_match);
 
 static const struct spi_device_id stmpe_spi_id[] = {
-	{ "stmpe610", STMPE610 },
-	{ "stmpe801", STMPE801 },
-	{ "stmpe811", STMPE811 },
-	{ "stmpe1601", STMPE1601 },
-	{ "stmpe2401", STMPE2401 },
-	{ "stmpe2403", STMPE2403 },
+	{ .name = "stmpe610", .driver_data = STMPE610 },
+	{ .name = "stmpe801", .driver_data = STMPE801 },
+	{ .name = "stmpe811", .driver_data = STMPE811 },
+	{ .name = "stmpe1601", .driver_data = STMPE1601 },
+	{ .name = "stmpe2401", .driver_data = STMPE2401 },
+	{ .name = "stmpe2403", .driver_data = STMPE2403 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, stmpe_spi_id);
diff --git a/drivers/mfd/wm831x-spi.c b/drivers/mfd/wm831x-spi.c
index 54c87267917b..1e519fd9a9e1 100644
--- a/drivers/mfd/wm831x-spi.c
+++ b/drivers/mfd/wm831x-spi.c
@@ -77,14 +77,14 @@ static const struct dev_pm_ops wm831x_spi_pm = {
 };
 
 static const struct spi_device_id wm831x_spi_ids[] = {
-	{ "wm8310", WM8310 },
-	{ "wm8311", WM8311 },
-	{ "wm8312", WM8312 },
-	{ "wm8320", WM8320 },
-	{ "wm8321", WM8321 },
-	{ "wm8325", WM8325 },
-	{ "wm8326", WM8326 },
-	{ },
+	{ .name = "wm8310", .driver_data = WM8310 },
+	{ .name = "wm8311", .driver_data = WM8311 },
+	{ .name = "wm8312", .driver_data = WM8312 },
+	{ .name = "wm8320", .driver_data = WM8320 },
+	{ .name = "wm8321", .driver_data = WM8321 },
+	{ .name = "wm8325", .driver_data = WM8325 },
+	{ .name = "wm8326", .driver_data = WM8326 },
+	{ }
 };
 
 static struct spi_driver wm831x_spi_driver = {
-- 
2.55.0.11.g153666a7d9bb


