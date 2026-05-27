Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2096FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uMqAYy/NdQZ0dbTb3sXUqWwu6ba89aldS/C8BcXDmE=; b=MpyuIAEMxkJkS+x7vxWbCYL6zX
	Qph+zQdVgcVvPFgtAyLenMJg/2pwtDNZO3uLI61TcFgRw+jBmpC9/Dasu2DyTBSSELl4axfF95dKf
	cboKLClzFCqM4Z5+Y0OqDgwbJZ+zspDn/qNCWyPEBSRKhN++vewTW//xj0cEoiMFBc5p/nDccdV0e
	ltrqxrbnMZAMDzBDmo1ppaZvOO4cW8GmosYgg1UTyhitokb6By0ZekVXTksS9puwxXaOnQMmuIQpF
	WAUk/X2n1CUOXdI9MfAJmNNZuqoO+Cs5AoHkg8QmikESpuyOz4AOAa3D5c6TSA09LMoKMVY94Spya
	6ObmVPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBo7-00000003xRC-12X5;
	Wed, 27 May 2026 10:48:15 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBnz-00000003xLf-14uu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:48:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45ebafde87cso3159993f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779878885; x=1780483685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uMqAYy/NdQZ0dbTb3sXUqWwu6ba89aldS/C8BcXDmE=;
        b=LMogHlC24aSnDiy1eI3hL+9Sg8WcT8+pPfskEqQZjBzJ27xs9vSh3EXYHmFe6Z+tfK
         5zgV5VMeeTfTubCOyQTIwvoDBRZqAg6XFMP0gIYeRv6hMvSdNvAkKhDeW/FFMgTHIh3W
         6LQQlYr8XHc9+WMV27hdeKHCh4AHWzsVXJKz9RYv4Vx5u92EhR0fCXUedB++NjlDHwZi
         3a2XJQuk9NuLJN7ZkENgGFKqAff5owwuJaqAzSTNgsrV3JHkB65VzKDHMzGH99GSqV9U
         6fimpnr1DJTfYRFkaJmOeamsd3bcNhel/Is5O39m9j7YMtXqM8ppY23U9GQdfzbEAKYe
         Hmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878885; x=1780483685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6uMqAYy/NdQZ0dbTb3sXUqWwu6ba89aldS/C8BcXDmE=;
        b=poiAkdwyRs3qQWXW0J6xk4cB/qn2yeA5M6M6qWbRFUf67Y5R/1vgqfbRXVf90E9LZ7
         diKja6+DaKTdTjT/idSs00iWH4WTDyGvTIspQMf2mnepRQd51wi3qbi58BVaJLyIIL9c
         FhYp0RaaSdSnfxEdMfXRTDDbbBry993lC0rtEfTvZ8hQynFcfkCJzwmC02oDnc5D/XvS
         zlchX7vNw1LxWGQfjYiUoyzgnlityGP8WMxIP9D36ZoHF+olVML2iVgyyGtAz4KNwanL
         gmYzSVurI8LvbcWcFkM9VHX5IRHINchkx8uHyGwtyRCD1pK81fWPrMmlwAqPYGIThAKD
         KthQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cCbahd9pzFdLa62BfVWOZdT51CJDRpiWy2y+G6geU0in6hv1ZKV/8A02rKnuGM2/NYCC2q2D53Tn24LTguNIJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2RDpIH0XmUzU7NfMUU8jcuaKT/ytCj+dvElhZQ6fYG5QwYLvI
	gZNFUUsnM9B7KwLmppqDdSQGY1Z5j8Wf8BJ9x6Mn4xyB0BA3jPkX72JJqANriEt0mYg=
X-Gm-Gg: Acq92OEY/AVTdAsiZQQkoQ8HUmeC7ALpXJ7+td8XL7mVWu0be/hyNB4gM879pTkX8r4
	ZPlJ/IhbvGoiVkF2zhzK25IkjWo/s3vcZ0Opc/l9lBdtloWIJLlGyV/ocoAprSWWZIF+axSLDJT
	/UiwnzD6W7lnOE39k2qc1uRWwSJGr+ehcfRfJkUH6tROYnKfSWQF/YK5asaI4TDaD0H6i708xbp
	3m6837x6Qf9dGWDm8ifFfAyNT9eFAQT8iuTwa4xyDb1KQNYGELfN6gQtTyVNSNiHp5AvQtcj7Cs
	wv+S4CwCR6fvxPVepqoF8VfMp6mmzoxxm4ksTRNdcbo6R8q/4BFGoKcCxMpNZ7ktEFsIdzKycgk
	egoh6N1fgPU+ZEqpKtgwFVW1bsZsZJbBDfWeUnZt47OxCduycE79Hx1l5Shtv9X8l0IXhrXCJFg
	2gPQ9ejYxuK0FHljU2NdFXnFNYjb2fmYM2Jtqsw/5fx2mxndR6c10u7rVc2O00qHgxmSryYvZ6u
	GK9r4v29n6ds2Yzp0AZ6MPztw==
X-Received: by 2002:a05:6000:144c:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-45eb3692577mr37040941f8f.9.1779878885224;
        Wed, 27 May 2026 03:48:05 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb5b1a28sm5195367f8f.26.2026.05.27.03.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:48:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v1 1/3] regulator: Drop unused assignment of platform_device_id driver data
Date: Wed, 27 May 2026 12:47:44 +0200
Message-ID: <613cd1bed263c2bf562ee714595f6d57f442804d.1779878004.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10220; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xYfigDtZq2pBPbj7YsS6TXzKLKqcf4xWEsO/edRfWw4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFsvVAXrNs9XSGlW4W7s3dAE55jD79QBWWREDb SLAmGUEgRGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahbL1QAKCRCPgPtYfRL+ TlP4CACyb9zVjOZFfpcQ0Cx83+n63MR0B5bbBpy4vwgPezWT0D9iDD69hNRRE7NzLHwm2APlysu 64/e2tCsMZUIn8XkEXlf1M6SlPV+KNfpGWSsO98yvTn2x8KyzXtI/jYe/gj8wz+6truOCNakVSr Fnlc7p1pKJRgCwnkuolFL7ETeIN9M38KkpQ9qlJGntqntpEURm2vbDFyG6FJTFfcDJUY89uIpvs BD8wQMDXXPVoeP5XRe6Ou1do4diqWvvcDZt4/dynuQqYlCK1aQfHuInaBxgsTsa35SwcuuIaV7g oUJAFR2Oo+L+qFNKtD9Nj1lMHxGZDvtiYtufMLC1T8VuTqhs
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_034807_359164_94D43B3E 
X-CRM114-Status: GOOD (  16.12  )
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

Several drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments.

While touching these arrays unify spacing, usage of commas and use
named initializers for .name.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/regulator/88pm8607.c           | 4 +---
 drivers/regulator/max77686-regulator.c | 4 ++--
 drivers/regulator/max77802-regulator.c | 4 ++--
 drivers/regulator/max8997-regulator.c  | 4 ++--
 drivers/regulator/mt6323-regulator.c   | 4 ++--
 drivers/regulator/mt6331-regulator.c   | 4 ++--
 drivers/regulator/mt6332-regulator.c   | 4 ++--
 drivers/regulator/mt6358-regulator.c   | 4 ++--
 drivers/regulator/mt6359-regulator.c   | 4 ++--
 drivers/regulator/mt6360-regulator.c   | 4 ++--
 drivers/regulator/mt6370-regulator.c   | 4 ++--
 drivers/regulator/mt6380-regulator.c   | 4 ++--
 drivers/regulator/mt6397-regulator.c   | 4 ++--
 drivers/regulator/rt4831-regulator.c   | 4 ++--
 drivers/regulator/rt5120-regulator.c   | 4 ++--
 drivers/regulator/s2mpa01.c            | 4 ++--
 drivers/regulator/s5m8767.c            | 4 ++--
 17 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/regulator/88pm8607.c b/drivers/regulator/88pm8607.c
index e6c436955e25..969554725a67 100644
--- a/drivers/regulator/88pm8607.c
+++ b/drivers/regulator/88pm8607.c
@@ -371,12 +371,10 @@ static int pm8607_regulator_probe(struct platform_device *pdev)
 static const struct platform_device_id pm8607_regulator_driver_ids[] = {
 	{
 		.name	= "88pm860x-regulator",
-		.driver_data	= 0,
 	}, {
 		.name	= "88pm860x-preg",
-		.driver_data	= 0,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8607_regulator_driver_ids);
 
diff --git a/drivers/regulator/max77686-regulator.c b/drivers/regulator/max77686-regulator.c
index c7b270fd9e0c..3a0156f4d6e7 100644
--- a/drivers/regulator/max77686-regulator.c
+++ b/drivers/regulator/max77686-regulator.c
@@ -517,8 +517,8 @@ static int max77686_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77686_pmic_id[] = {
-	{"max77686-pmic", 0},
-	{ },
+	{ .name = "max77686-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77686_pmic_id);
 
diff --git a/drivers/regulator/max77802-regulator.c b/drivers/regulator/max77802-regulator.c
index b2e87642bec4..4c05cc9c4bd2 100644
--- a/drivers/regulator/max77802-regulator.c
+++ b/drivers/regulator/max77802-regulator.c
@@ -546,8 +546,8 @@ static int max77802_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77802_pmic_id[] = {
-	{"max77802-pmic", 0},
-	{ },
+	{ .name = "max77802-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77802_pmic_id);
 
diff --git a/drivers/regulator/max8997-regulator.c b/drivers/regulator/max8997-regulator.c
index e77621b6466c..e48ba694a906 100644
--- a/drivers/regulator/max8997-regulator.c
+++ b/drivers/regulator/max8997-regulator.c
@@ -1152,8 +1152,8 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max8997_pmic_id[] = {
-	{ "max8997-pmic", 0},
-	{ },
+	{ .name = "max8997-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, max8997_pmic_id);
 
diff --git a/drivers/regulator/mt6323-regulator.c b/drivers/regulator/mt6323-regulator.c
index b43da848a06e..bac226812b0b 100644
--- a/drivers/regulator/mt6323-regulator.c
+++ b/drivers/regulator/mt6323-regulator.c
@@ -401,8 +401,8 @@ static int mt6323_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6323_platform_ids[] = {
-	{"mt6323-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6323-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6323_platform_ids);
 
diff --git a/drivers/regulator/mt6331-regulator.c b/drivers/regulator/mt6331-regulator.c
index 0059f88c6fd7..eed9dda0481f 100644
--- a/drivers/regulator/mt6331-regulator.c
+++ b/drivers/regulator/mt6331-regulator.c
@@ -487,8 +487,8 @@ static int mt6331_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6331_platform_ids[] = {
-	{"mt6331-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6331-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6331_platform_ids);
 
diff --git a/drivers/regulator/mt6332-regulator.c b/drivers/regulator/mt6332-regulator.c
index 8d8331a2aca5..949fde37617c 100644
--- a/drivers/regulator/mt6332-regulator.c
+++ b/drivers/regulator/mt6332-regulator.c
@@ -402,8 +402,8 @@ static int mt6332_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6332_platform_ids[] = {
-	{"mt6332-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6332-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6332_platform_ids);
 
diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 2604f674be49..f2bb3c1523ca 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -724,8 +724,8 @@ static int mt6358_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6358_platform_ids[] = {
-	{"mt6358-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6358-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6358_platform_ids);
 
diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index af0e0339fbdd..7bda382ddd81 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -1130,8 +1130,8 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6359_platform_ids[] = {
-	{"mt6359-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6359-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6359_platform_ids);
 
diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 24cc9fc94e90..ed25e9603b2b 100644
--- a/drivers/regulator/mt6360-regulator.c
+++ b/drivers/regulator/mt6360-regulator.c
@@ -446,8 +446,8 @@ static int mt6360_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6360_regulator_id_table[] = {
-	{ "mt6360-regulator", 0 },
-	{},
+	{ .name = "mt6360-regulator" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6360_regulator_id_table);
 
diff --git a/drivers/regulator/mt6370-regulator.c b/drivers/regulator/mt6370-regulator.c
index c2cea904b0ca..a4ac4a42c108 100644
--- a/drivers/regulator/mt6370-regulator.c
+++ b/drivers/regulator/mt6370-regulator.c
@@ -371,8 +371,8 @@ static int mt6370_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6370_devid_table[] = {
-	{ "mt6370-regulator", 0},
-	{}
+	{ .name = "mt6370-regulator" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6370_devid_table);
 
diff --git a/drivers/regulator/mt6380-regulator.c b/drivers/regulator/mt6380-regulator.c
index 83e50df7f7c3..da901a75137a 100644
--- a/drivers/regulator/mt6380-regulator.c
+++ b/drivers/regulator/mt6380-regulator.c
@@ -314,8 +314,8 @@ static int mt6380_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6380_platform_ids[] = {
-	{"mt6380-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6380-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6380_platform_ids);
 
diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index 92a2d92f84f9..e68df86ca4d9 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -392,8 +392,8 @@ static int mt6397_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6397_platform_ids[] = {
-	{"mt6397-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6397-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_platform_ids);
 
diff --git a/drivers/regulator/rt4831-regulator.c b/drivers/regulator/rt4831-regulator.c
index dfc868a24056..5c47fd57fdef 100644
--- a/drivers/regulator/rt4831-regulator.c
+++ b/drivers/regulator/rt4831-regulator.c
@@ -186,8 +186,8 @@ static int rt4831_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id rt4831_regulator_match[] = {
-	{ "rt4831-regulator", 0 },
-	{}
+	{ .name = "rt4831-regulator" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, rt4831_regulator_match);
 
diff --git a/drivers/regulator/rt5120-regulator.c b/drivers/regulator/rt5120-regulator.c
index f0d3efd160d4..a2a13ce2e67b 100644
--- a/drivers/regulator/rt5120-regulator.c
+++ b/drivers/regulator/rt5120-regulator.c
@@ -401,8 +401,8 @@ static int rt5120_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id rt5120_regulator_dev_table[] = {
-	{ "rt5120-regulator", 0 },
-	{}
+	{ .name = "rt5120-regulator" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, rt5120_regulator_dev_table);
 
diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index c22fdde67f9c..8171503861c1 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -367,8 +367,8 @@ static int s2mpa01_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mpa01_pmic_id[] = {
-	{ "s2mpa01-pmic", 0},
-	{ },
+	{ .name = "s2mpa01-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s2mpa01_pmic_id);
 
diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index fe2631378ccd..2794245d4042 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -916,8 +916,8 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s5m8767_pmic_id[] = {
-	{ "s5m8767-pmic", 0},
-	{ },
+	{ .name = "s5m8767-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s5m8767_pmic_id);
 
-- 
2.47.3


