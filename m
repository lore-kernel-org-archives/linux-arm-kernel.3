Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799A7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA5wKEOMg5V1lPLar9LIe6EawbGpNn0L81biqXV9tTw=; b=gO6iYMjFYaIm8DoqBmRUYguJLC
	85UmQ0Q8Jqw3uX5RzKQlPFnLsowthxnGVb3Y2BytoeQKJ/foTzQKRJ/rM5517Gbez1JggyKoEWHwy
	fH7yqS0hCjqCivJgubcJjuqOHZXh970rjhpsEkdwt5Z0P/agijEVW/zI2KhX6XRqDJUVv+BiaqeKN
	ns76MCYsxdwjoeakUC+3Z4sea6rdJju24h1YGJdp2ISZKteOdwCdtl2kCw9x2HU35K+0eB0toqWIA
	TQjdlIb0mHe7yhn2ZhEO4xVOx8/4z5CQIKZdvX4Qk28LGFh1vxBNFivLpDg5e9WMlScTOZF3tIih1
	qCY6H1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQH9-0000000Gyzc-1hzK;
	Wed, 08 Jul 2026 11:17:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQH5-0000000Gyuo-40Dn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:17:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4629051c9d1so310877f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509426; x=1784114226; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NA5wKEOMg5V1lPLar9LIe6EawbGpNn0L81biqXV9tTw=;
        b=pAMHkFOWLSVHmfDIU85xcZryM/cLL7nHEXiacHaqPChBCIftsiSRyzMCK/HcjkFJKl
         zLEWS6s2K4IzAjpsrLxA8HwS2qLNdKi7lZZD36KaHp51GKYDdI2fIFPoFB3Xgb6rlMqN
         janpcCBoAtKCeGHXX2lj6Ad3yx0HB6rnIMLaXvfVUYdlWIpXE9MAQj9zteqYKg03u5x5
         c/Kl4oG+UHcQFN7t31TJfD2yNuGRurmHQocDQBypdVJRBK/XwPOSY9SgDkd1hekxmNR9
         l7jQmlz8nsXcWHeIMrjEiwRBFyWgSFTC8wRX5vhsjsktJ3tkl78KyE4Me4alFjJEb6V/
         SZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509426; x=1784114226;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NA5wKEOMg5V1lPLar9LIe6EawbGpNn0L81biqXV9tTw=;
        b=dIizFPvxBI5QIqMQz9bwgIXpF2O8mH/Cwfl9XFrz3gdmDPPxO6AWC5Ca5MYtoFJdEZ
         cd1zIXT/y18os8f4onEbxE0tp9xn/S7qpksEdkF5rXXnsbkWZ+daAZXgEvbWyGzDmbuD
         JfzxjGgS6SZpvTl3HmFjL4ojEqAJIb6nq2CpnHnZzEJNl/SWAyg4aWb4rLzaxUy5Qa86
         50rw45r1VaaNRvSLSkGQEZfg4jKwql0+l4oiliTP9x0vSHtw78xeaaVj+PX1hCgl4QpK
         6f+hDkljFdSfB9PL1hArTi2D/f2V3/E4Fk185xg8pXythdVlJHHRgT3MYDjWLWlbc7Z/
         LwZg==
X-Forwarded-Encrypted: i=1; AHgh+RoP/OnxZIockQa6LgDAL43ozcpcsRZuYxyRlgRBbceprWDIziXAx+GnLrX9tI/VtKUCMua7cnkV6TkAJMiakhzM@lists.infradead.org
X-Gm-Message-State: AOJu0YxXiD8i9b9LIt137AFu9S2SOOE1mR7h+EAaqIt8TCPpWLtaUb1G
	74FKUYVHnH5C+wZsQS/WBoij2Ucj7MM7FzW5/R3LWBHBrWxsWlghzGju8b07apUZnYo=
X-Gm-Gg: AfdE7cmX7okD4wpcrn3pSf7aoyUv7xgTtqogsy74955NBzNuXk124IBs844HzmqtSAk
	69uWoW8s3bU5WhpKcZ7wlbZci0OAKeU0SI5wE2Ti5AbHiWRZW4qjO+Yy7NWpRCUecr4SZf/+uqj
	LHPeORblCdQl5ARXNig+QZ21/IEkGPBIloHsKiN+h9VAGDLXKky9hvscesKdBioXQ/McvTTzesj
	EW2EujE3j5gk132owB+UwLxWbMfsQR/jLTDHP2CCssS4QF8YgOedTJYDfhpB0XOem8qEjfuopiJ
	8icgw7zS+fqXBTlXOnSnY8/Dw8hPO7LpNkTuy5zchhKhCPEU5lWvE/4IEM5zzoPVMSjfOR86bKd
	U8euaiuLHBsLvLooc1y1ClW28HNfP6cehLZskQ2VruytO9ewb+iUKv6FNDik80iVkcf1DXt1Vcx
	o5mnNyPmaTSJUNmoWNq+0Djywha0zwV5kLVVANaY3fPyR/5SkJIWR3Qdzcc/iCMgH7zOfCiwYY1
	CM4
X-Received: by 2002:a05:6000:5ca:b0:472:55a:ef8b with SMTP id ffacd0b85a97d-47df07ae2fcmr2326891f8f.16.1783509426283;
        Wed, 08 Jul 2026 04:17:06 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960634sm42728802f8f.26.2026.07.08.04.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:05 -0700 (PDT)
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
Subject: [PATCH v2 17/23] mfd: Use named initializers for arrays of spi_device_id
Date: Wed,  8 Jul 2026 13:15:24 +0200
Message-ID: <005f42dc5bbbd8879edd7fb3cbd62d6ebe38f39f.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9097; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xcSJlo2roPwQylQsQ10ydaig85+7qykWegnVWbK9Zdg=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGpOMXqhg0QoropnNpHz2gebCTocTZqZJXt1DIsrbE/yu4rbs IkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJqTjF6AAoJEI+A+1h9Ev5OfBMH/0RZ MnI5W0ySFXXR9Npd+YDaFOI7RFq5zdqIJ9M/CEOtOAdE1XocA48mbvYZCvcCHZO75r8pnbG/Blb qgNeZLhet0fWLunJcAOSlWbcWACsl7VJ/IXsL4zybn1Sf6f9F2+nmrIwCboHAKXr/OY+wx2Ohyz ljY3JJeOtNLuYOv72tj9fVmbgPvDUhGEMvwqtGLQSI5F77u+njxkEnneYznXqHlt8wqqOHDQkx6 gwZ8NdCzK/o4FGtc3vLwtF4dxYUqVRUZ1jxjXntCXXXrM+W20O4TPPi9C+f9cSBO5Cxc3iGDZQw qFxNk5peq0y72rGj1wNkQhsmv/eNr279hpkx2Pg=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041708_060091_CEDAB438 
X-CRM114-Status: GOOD (  16.63  )
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


