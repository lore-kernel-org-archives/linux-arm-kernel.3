Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A717DC44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5tm53Wh5ljVEJMF/yE7yx8lvckk6MSR3QTqJKQvyQU=; b=ApePMVgapBCTF/3lFUrudihz+w
	RyOsatMtTUT8tMJVlEBMb1nvXAlr6wENpesoNTAWyNRCVRJu3PORg7UonlEZxduiSKAvT0trZj7+U
	MuuLt/VeIFsPxHihSq6uoSCO4rWndPqJokWFo5ufjckcwVYf+4Oqsh8DhLUmmrVOemsvs6usnkZVO
	KuaCvacvJv33Y7aqrmKyzKHhvvOYQ6xV1SA8+q5+PyDb7BN8YpNxdYHMiY2iiaT1GQjU/+ikMYnoe
	K+C/gRPJ1zdzaXXsDWgv4kI9kVRL1N6km9erbP3MQ8kRExyazvtJNhhWnoTDrnjnoo0yGUBxkaX0Q
	qPgxCwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs71-000000035FR-3lpi;
	Thu, 09 Jul 2026 17:00:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6x-0000000359y-3Hsq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:00:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493b7612475so126835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616430; x=1784221230; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5tm53Wh5ljVEJMF/yE7yx8lvckk6MSR3QTqJKQvyQU=;
        b=fDRUKp5sowdhZXmAtbBTlQaXSWfPzlKQdZLMJ6Fet8yVkQUUfI7SHA9ty44hzFhfqi
         j9gzUH6rVIx8cCHoSe77Xg8MmCmTIBLA+Bn89YjmK02w6p5O1GPmmd5MwPrdhBXNk4PG
         IhiQpivkkCeajZZ1bIjIR3S75ZnpKISDpFrGQfTZV3aeDwEnUUYUHZycooFvSX5fqBPd
         KfA7JrecWXBKLjcl+CfY257MmgIn587iRcOy/+qcA9hzVrfz8ogKP+rE4m05brRofGPM
         Dn4dN6PC51TvAr86upGvnGWnarDTNqxE7T86MmoKDKQAG1PE4YsTH+f2yrkmmZpBbGk/
         LPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616430; x=1784221230;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5tm53Wh5ljVEJMF/yE7yx8lvckk6MSR3QTqJKQvyQU=;
        b=c2njyY5Hhmf7SpQhvrvhF4okxoD32cNUrSNwIf9Y4KaEfIbmz2oDZnufqdz4Gb8XEI
         IsX0wQ4LeTjHYi7+J2s61QKTxct7QPs9Y72mfC6SlD2pi1HBy1mqWE3Cz/dla9hHBuBn
         78Eg1xbB7Y4YXzti2lG8x4fl1nZaJFfqV/8ETWMPc8/1BUo6KH4zL65JsWacGNR/FBtm
         WHAAHrow63WOWvyR9LXHK1pEVGzwS/6P2tkX2rgsjPnWtQeWuKvI5J62mU125/QtgDZO
         f0TCYk2s6kfPY24mnX/P+3RFm2bYXgy8pfp1euuSJ6LxiA32Tvq+JevQ/8DjfiiOJVM2
         FfJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNMn9cpn+Mz6EaBTtsKHaVIhZbPtIG8w5zcWa4vLF2KeE+NVGaSw135WtemxRvc6Ahbu5ug785FlB1g+uCXhRR@lists.infradead.org
X-Gm-Message-State: AOJu0YxRSV/IVFnH6/FsewVyp3U1lJy8mUSD+dA4Cm/i+hfBu3DboWkf
	yc58h98qXBwLyRTFxdSDUVLYe4dwIHJEgwHJc585nX1axPW3tRV2audt/RD1QFmY224=
X-Gm-Gg: AfdE7clhdWhKw/c7TGNiCaJRkV0MnRrUZZkutw3px+MEuih1BjdUPgFb2Gk6K7utnXC
	WjYDrmkfu9GA2Ee9lj+524eZXYReDOCO/ywJvK4r8rbRXn0OXLRGpRKomyYRPACHA3o0/uRmZ+Y
	NTj9cI8WxvV2HTNILSwqa0k5PFmWF83NOG6uBOlpvIN3qkdaedaof0oAyJfiNsneMLVGqdDrsqn
	TRqGrl8xVux8frIE9ymnjf3+1SVTtfk+wMZvaFLawwE0B4LYk9AQC85DMQIFkv35v9aab3Lgxzy
	xS/aSC9AFanrlyShWuVyIqJnsTmnl0MNdEHVqqM3YtB7JWNIRyHYmE5p0ZsllMyhOPcPwrwVxlb
	ymuIrunr+avvUlCI8nOZlyrnHx0haq2KeORXkbZ7QCeYlrAiCDHd0q4SKG+R/TTC8fMmpHwgC1i
	q/4r7vGCSKIpK0HCweVyiuBBU709g9X1kbpHnt5zxMc6OSPQD9jdk4wX/qFPq38TowTLZtXvrZn
	5WL
X-Received: by 2002:a05:600c:6286:b0:493:e53a:8982 with SMTP id 5b1f17b1804b1-493e68643ebmr79528625e9.23.1783616429757;
        Thu, 09 Jul 2026 10:00:29 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e582d4f7sm130150785e9.2.2026.07.09.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:29 -0700 (PDT)
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
	Colin Foster <colin.foster@in-advantage.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	patches@opensource.cirrus.com,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 17/23] mfd: Use named initializers for arrays of spi_device_id
Date: Thu,  9 Jul 2026 18:58:36 +0200
Message-ID: <d758f5b2b861fad11a3e90ef2d44e8aa3c817ec8.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9158; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=fHu8p1/UogKtizmJccP+7S56UMfTT1qzheFADHKU4CQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NcadZ3btNANNe2nvN3xJL+QYVE+XEMtZHIx buHCvrVosyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TXAAKCRCPgPtYfRL+ TteqCACnDDlWupdwa60CmVg/Fp209eIroh/t13VAvis2RhW6NTstBrI0UTzX7Xq094Ddud6lyMM gokMOZ2m2KN2RQQDHRcfOsYBYlwtiuI+mkUZYj3S+/PTSG/Gh3t+TPIFZ3xY6dtiYgMKkvppXOQ BQT4p5Qx7kjhP1zoIB8qAWUMqfCRmxYrCdRaGNxfZadl0NUcxUZ5CJRKXxf0+wijgdEnKEu9Hna H1npxOYKAKAWJm98uwYXk1w4nzaDlxznvLH4tJyBUQ1gEps/KKKvtuwJfTnPxMfCT4Y6QSVTCxF fanZ2gjAOUJz6YQiBwTv6fD8pTtn3X7jDtBH7wytLgOE6yT8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_100031_876057_885128C6 
X-CRM114-Status: GOOD (  16.01  )
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

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/arizona-spi.c       | 10 +++++-----
 drivers/mfd/cs40l50-spi.c       |  2 +-
 drivers/mfd/da9052-spi.c        | 10 +++++-----
 drivers/mfd/intel-m10-bmc-spi.c |  6 +++---
 drivers/mfd/madera-spi.c        | 18 +++++++++---------
 drivers/mfd/ocelot-spi.c        |  2 +-
 drivers/mfd/rk8xx-spi.c         |  2 +-
 drivers/mfd/rsmu_spi.c          | 12 ++++++------
 drivers/mfd/stmpe-spi.c         | 12 ++++++------
 drivers/mfd/tps65912-spi.c      |  2 +-
 drivers/mfd/wm831x-spi.c        | 14 +++++++-------
 11 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index eaa2b2bc5dd0..bbf520bd2eda 100644
--- a/drivers/mfd/arizona-spi.c
+++ b/drivers/mfd/arizona-spi.c
@@ -255,11 +255,11 @@ static void arizona_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id arizona_spi_ids[] = {
-	{ "wm5102", WM5102 },
-	{ "wm5110", WM5110 },
-	{ "wm8280", WM8280 },
-	{ "wm1831", WM1831 },
-	{ "cs47l24", CS47L24 },
+	{ .name = "wm5102", .driver_data = WM5102 },
+	{ .name = "wm5110", .driver_data = WM5110 },
+	{ .name = "wm8280", .driver_data = WM8280 },
+	{ .name = "wm1831", .driver_data = WM1831 },
+	{ .name = "cs47l24", .driver_data = CS47L24 },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, arizona_spi_ids);
diff --git a/drivers/mfd/cs40l50-spi.c b/drivers/mfd/cs40l50-spi.c
index 53526b595a0d..2d8f0dce3494 100644
--- a/drivers/mfd/cs40l50-spi.c
+++ b/drivers/mfd/cs40l50-spi.c
@@ -40,7 +40,7 @@ static void cs40l50_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id cs40l50_id_spi[] = {
-	{ "cs40l50" },
+	{ .name = "cs40l50" },
 	{}
 };
 MODULE_DEVICE_TABLE(spi, cs40l50_id_spi);
diff --git a/drivers/mfd/da9052-spi.c b/drivers/mfd/da9052-spi.c
index be5f2b34e18a..2a08481432e3 100644
--- a/drivers/mfd/da9052-spi.c
+++ b/drivers/mfd/da9052-spi.c
@@ -63,11 +63,11 @@ static void da9052_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id da9052_spi_id[] = {
-	{"da9052", DA9052},
-	{"da9053-aa", DA9053_AA},
-	{"da9053-ba", DA9053_BA},
-	{"da9053-bb", DA9053_BB},
-	{"da9053-bc", DA9053_BC},
+	{ .name = "da9052", .driver_data = DA9052 },
+	{ .name = "da9053-aa", .driver_data = DA9053_AA },
+	{ .name = "da9053-ba", .driver_data = DA9053_BA },
+	{ .name = "da9053-bb", .driver_data = DA9053_BB },
+	{ .name = "da9053-bc", .driver_data = DA9053_BC },
 	{}
 };
 
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
diff --git a/drivers/mfd/ocelot-spi.c b/drivers/mfd/ocelot-spi.c
index 3c8260c7f8fb..d3ab4868a523 100644
--- a/drivers/mfd/ocelot-spi.c
+++ b/drivers/mfd/ocelot-spi.c
@@ -270,7 +270,7 @@ static int ocelot_spi_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id ocelot_spi_ids[] = {
-	{ "vsc7512" },
+	{ .name = "vsc7512" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ocelot_spi_ids);
diff --git a/drivers/mfd/rk8xx-spi.c b/drivers/mfd/rk8xx-spi.c
index 95749a89f092..bb85fe60518f 100644
--- a/drivers/mfd/rk8xx-spi.c
+++ b/drivers/mfd/rk8xx-spi.c
@@ -104,7 +104,7 @@ static const struct of_device_id rk8xx_spi_of_match[] = {
 MODULE_DEVICE_TABLE(of, rk8xx_spi_of_match);
 
 static const struct spi_device_id rk8xx_spi_id_table[] = {
-	{ "rk806" },
+	{ .name = "rk806" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, rk8xx_spi_id_table);
diff --git a/drivers/mfd/rsmu_spi.c b/drivers/mfd/rsmu_spi.c
index e07f21482439..8b2e7cb401b5 100644
--- a/drivers/mfd/rsmu_spi.c
+++ b/drivers/mfd/rsmu_spi.c
@@ -239,11 +239,11 @@ static void rsmu_spi_remove(struct spi_device *client)
 }
 
 static const struct spi_device_id rsmu_spi_id[] = {
-	{ "8a34000",  RSMU_CM },
-	{ "8a34001",  RSMU_CM },
-	{ "8a34002",  RSMU_CM },
-	{ "82p33810", RSMU_SABRE },
-	{ "82p33811", RSMU_SABRE },
+	{ .name = "8a34000",  .driver_data = RSMU_CM },
+	{ .name = "8a34001",  .driver_data = RSMU_CM },
+	{ .name = "8a34002",  .driver_data = RSMU_CM },
+	{ .name = "82p33810", .driver_data = RSMU_SABRE },
+	{ .name = "82p33811", .driver_data = RSMU_SABRE },
 	{}
 };
 MODULE_DEVICE_TABLE(spi, rsmu_spi_id);
@@ -254,7 +254,7 @@ static const struct of_device_id rsmu_spi_of_match[] = {
 	{ .compatible = "idt,8a34002",  .data = (void *)RSMU_CM },
 	{ .compatible = "idt,82p33810", .data = (void *)RSMU_SABRE },
 	{ .compatible = "idt,82p33811", .data = (void *)RSMU_SABRE },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rsmu_spi_of_match);
 
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
diff --git a/drivers/mfd/tps65912-spi.c b/drivers/mfd/tps65912-spi.c
index 78f9b6015902..2442a2e67d67 100644
--- a/drivers/mfd/tps65912-spi.c
+++ b/drivers/mfd/tps65912-spi.c
@@ -43,7 +43,7 @@ static int tps65912_spi_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id tps65912_spi_id_table[] = {
-	{ "tps65912" },
+	{ .name = "tps65912" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, tps65912_spi_id_table);
diff --git a/drivers/mfd/wm831x-spi.c b/drivers/mfd/wm831x-spi.c
index 54c87267917b..4cdb6e0734c4 100644
--- a/drivers/mfd/wm831x-spi.c
+++ b/drivers/mfd/wm831x-spi.c
@@ -77,13 +77,13 @@ static const struct dev_pm_ops wm831x_spi_pm = {
 };
 
 static const struct spi_device_id wm831x_spi_ids[] = {
-	{ "wm8310", WM8310 },
-	{ "wm8311", WM8311 },
-	{ "wm8312", WM8312 },
-	{ "wm8320", WM8320 },
-	{ "wm8321", WM8321 },
-	{ "wm8325", WM8325 },
-	{ "wm8326", WM8326 },
+	{ .name = "wm8310", .driver_data = WM8310 },
+	{ .name = "wm8311", .driver_data = WM8311 },
+	{ .name = "wm8312", .driver_data = WM8312 },
+	{ .name = "wm8320", .driver_data = WM8320 },
+	{ .name = "wm8321", .driver_data = WM8321 },
+	{ .name = "wm8325", .driver_data = WM8325 },
+	{ .name = "wm8326", .driver_data = WM8326 },
 	{ },
 };
 
-- 
2.55.0.11.g153666a7d9bb


