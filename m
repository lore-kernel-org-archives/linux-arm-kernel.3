Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750DACD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zy7L9tmuyHwxiGGTZsJP9P4FkDNJKuKhgUpt1VqiYIk=; b=uVeONgUCIFSmGyDD3CI9hMkX99
	eUJCQWsa34p5nIPFaslufsKHNM85ttWMpJF1xvuqI5wNg7Fdl7uYLGzWUEoI52WvUMG0mpfILzeuj
	OYCB08mNqsgOnmEB45dHrSJ+0LbDRsOwU8D1CvUTgvSHABixGE5ObeXALCMgTArKKNEZOKpGSaiyc
	OS/pWLe8eg1s+h39rBZZhhIFyIDDat63lotjVcAiVOphOeEsWAkGL/bmdVTkGluIfKbykS0kPWbta
	P4KBvoPvuTjxHZ5XnkQdPoJlzUQzo9+YT6LzRcmFf30+0pFl9TKbwXp+U5v1aTVNAJV0tkhkz0UFs
	HE0cp7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIf-00000007AHw-1QYI;
	Fri, 29 May 2026 10:18:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIc-00000007AFA-1AFk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:18:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45eee266c6cso865021f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049920; x=1780654720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy7L9tmuyHwxiGGTZsJP9P4FkDNJKuKhgUpt1VqiYIk=;
        b=j41aj7firTZAXqKYxGsoWJ8dKphiCf3jcWBptpUAeZONlDwq86lXagKfOSOyT3cS6B
         UsBCowVT2vqnVA2hrrrlXIZcw/Ku0EJwL2rbqXVw9g2wBvVTA+UqxDSZEyoMw9egXtUJ
         H3978Dzs4GOwlfEjgMpiOnHMNFIW/eApkTc0u9lfxNyb3SnMzlEsCNNmKipW8HzyXJMK
         5FsFiA4YDndQNJadTluk2TBPUSujvb4gcdMgKq9oW+a4aRNHH8chXS0IyJ3tuKV1blGE
         dgnTrN1uhNSi+ibp60zw5+haWU93LW+9ib4unkcVYzEcwmzPhHUP37/OsdrkQE+l1Tu7
         06gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049920; x=1780654720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zy7L9tmuyHwxiGGTZsJP9P4FkDNJKuKhgUpt1VqiYIk=;
        b=KtKNBJR7fHfRo3uN2+j/BlXYsgeacF4mSoH25pF8pfVpYxm3AGmAvArUrpi8nfOpLr
         kbn/56I4j4t4UxzTlj1y6znSv+GxHnKTm60mDKvdT3SHsh52kPWnyx6lx4GyDGbC9GOd
         XXQcZnuiFcTbuv9kPUQ7vsEBGHOByBHPzFJfpqMwEIZlViG2CkmZSM1/TUlyUQeAuIbw
         Pe+rjSaGwJYzRnmBsuz3GuM594ilro/t1lJ3OeDzGRmQH7Px0x0ElX25qf2XpoF+XHpg
         TFUn/1NejQAPYXzlg/+GozgUUgB9t3KoLBG337sWJ+CPu4Z7BRZhGcUqSK9tP0QrNymM
         atdg==
X-Forwarded-Encrypted: i=1; AFNElJ9TY9hA6ePQ+HVMyJ7erKNF+VqBlkCA7Eq25epipPXCHTR59bjYp1e3uYzah63rdw9sqVX6xP+39TRHlaLl1xkD@lists.infradead.org
X-Gm-Message-State: AOJu0YyBhZn4xR8pFgT/xEe3sPHcDPw8KOJ7UAoD9SPtlXYxj0Np5/WZ
	eYsR5XcQMbL1craumZ1lnZnbrudsSastnLa+AgFOTA+JBoB9sR7AGMoKIrjLrfDFQp0=
X-Gm-Gg: Acq92OEMFjf/YI8R99w2RhP7WZ3ZIdXKRk/OWdHL/ZJe5EDHrcLH07f3i23TkkpB9BM
	u3MMiBde5OI+0Sce/egLSy7C5Ck58sqSvUOw1x+DYjZNRPTjvqaP6/AOotCEH3bGOlfTnOd6lkN
	zDjLaDc44R+ehJamlyUDbAPzXFP6VzZrDpQl4N/dYW4oW/elY+j+gEO24mrowNqNrMSw4z7FIET
	bpC3taXZMAnZ1vlYsHwfOmR1lZVTms53/K689ViGerHtoa/iZNyWJ7YuuRD5DlVaR2/Y66KpnwD
	x5PhNiPO4rcDyXi9X8RzOkI/BzO8qM+rqASzM4r4s/4Q2JaEDzxwvLaR+ox7O+PIL1k4QXsKZgz
	UZRG64f75tzqxwJUa31g09HhKPBN5h4PiwbmoNjKJmZy0Vl+YZqMMNSBbwsYjg0zku9GHBqRQBE
	us2DP64joFjcPwCPnwd3RjXJDLsWNQ7g7c8PgayZMTKYPArI8GQR8h6FpWmHThRnCDCXJl7D4JD
	d8qEOHVBip2C8AEyW+iO0xfTDmdEaSamLUx
X-Received: by 2002:a5d:59c8:0:b0:452:11f9:bc40 with SMTP id ffacd0b85a97d-45ef13fdda9mr3781185f8f.2.1780049920296;
        Fri, 29 May 2026 03:18:40 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef34b7d6bsm2713604f8f.10.2026.05.29.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/6] power: Drop unused assignment of platform_device_id driver data
Date: Fri, 29 May 2026 12:18:16 +0200
Message-ID: <ba3589f74a12d86fb02ecb9fa2e89532188c22a0.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5195; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ZGeJDqlQ5zn3sDwaZY5Ll8gY7osGz8I1jAxqo5Bjml8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWfqtfq+9A3frNKKJCHEbGuIcYTcFXCF2IHyc kqICPrBt4uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln6gAKCRCPgPtYfRL+ ThgQB/0SfE9NuMu7Hd3egut28Uzkkhz9VNhori5S7ABqbeVTWxqb+jUq/TBLBj/5pw6lSBgy3Qz cgzdMp0Z4as+qcuVdCLEf1Vx9Kw7QLHEfEN67xWIV19vtfkQKBzTW/eVYE3Mvk7uRHi88Yf2xc/ ISOMROlVD0YJH0HMpWnlmT+JcSFH9VRMMWZN5ijf0iwLw5P9jmZzvQCbxP7OnHbhQI2bOrcklBo VCLTD6+DS091zAY12+nLJcdNWPQ+ecoroE4BejwRFKfdH1WAOlcZPn8tlsj7c/tmCfoBlFfjR4z gJd3h2J+BsSB749HYL7PAg/+OCFMcYkyBlIu5J51njvCBZ9h
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031842_346787_2CA9CD2A 
X-CRM114-Status: GOOD (  16.44  )
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

The driver explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignments.

While touching this array unify spacing, use a named initializer for
.name and drop trailing commas after the list terminators.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/power/reset/qemu-virt-ctrl.c           | 2 +-
 drivers/power/supply/charger-manager.c         | 4 ++--
 drivers/power/supply/cros_charge-control.c     | 4 ++--
 drivers/power/supply/cros_peripheral_charger.c | 4 ++--
 drivers/power/supply/cros_usbpd-charger.c      | 4 ++--
 drivers/power/supply/max77693_charger.c        | 2 +-
 drivers/power/supply/max8997_charger.c         | 2 +-
 drivers/power/supply/mt6360_charger.c          | 4 ++--
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/power/reset/qemu-virt-ctrl.c b/drivers/power/reset/qemu-virt-ctrl.c
index 01409dfe2265..aa8355270b2c 100644
--- a/drivers/power/reset/qemu-virt-ctrl.c
+++ b/drivers/power/reset/qemu-virt-ctrl.c
@@ -103,7 +103,7 @@ static int qemu_virt_ctrl_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id qemu_virt_ctrl_id[] = {
-	{ "qemu-virt-ctrl", 0 },
+	{ .name = "qemu-virt-ctrl" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, qemu_virt_ctrl_id);
diff --git a/drivers/power/supply/charger-manager.c b/drivers/power/supply/charger-manager.c
index 1b0239c59114..fa7518e9d72f 100644
--- a/drivers/power/supply/charger-manager.c
+++ b/drivers/power/supply/charger-manager.c
@@ -1649,8 +1649,8 @@ static void charger_manager_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id charger_manager_id[] = {
-	{ "charger-manager", 0 },
-	{ },
+	{ .name = "charger-manager" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, charger_manager_id);
 
diff --git a/drivers/power/supply/cros_charge-control.c b/drivers/power/supply/cros_charge-control.c
index 53e6a77e03fc..b489325be816 100644
--- a/drivers/power/supply/cros_charge-control.c
+++ b/drivers/power/supply/cros_charge-control.c
@@ -320,8 +320,8 @@ static int cros_chctl_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_chctl_id[] = {
-	{ "cros-charge-control", 0 },
-	{}
+	{ .name = "cros-charge-control" },
+	{ }
 };
 
 static struct platform_driver cros_chctl_driver = {
diff --git a/drivers/power/supply/cros_peripheral_charger.c b/drivers/power/supply/cros_peripheral_charger.c
index f132fad288cb..9f67a6dbd94e 100644
--- a/drivers/power/supply/cros_peripheral_charger.c
+++ b/drivers/power/supply/cros_peripheral_charger.c
@@ -369,8 +369,8 @@ static int __maybe_unused cros_pchg_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(cros_pchg_pm_ops, NULL, cros_pchg_resume);
 
 static const struct platform_device_id cros_pchg_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_pchg_id);
 
diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/supply/cros_usbpd-charger.c
index 7d3e676a951c..308e1d4e6dd8 100644
--- a/drivers/power/supply/cros_usbpd-charger.c
+++ b/drivers/power/supply/cros_usbpd-charger.c
@@ -707,8 +707,8 @@ static SIMPLE_DEV_PM_OPS(cros_usbpd_charger_pm_ops, NULL,
 			 cros_usbpd_charger_resume);
 
 static const struct platform_device_id cros_usbpd_charger_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_usbpd_charger_id);
 
diff --git a/drivers/power/supply/max77693_charger.c b/drivers/power/supply/max77693_charger.c
index 027d6a539b65..76c58b32a374 100644
--- a/drivers/power/supply/max77693_charger.c
+++ b/drivers/power/supply/max77693_charger.c
@@ -788,7 +788,7 @@ static void max77693_charger_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77693_charger_id[] = {
-	{ "max77693-charger", 0, },
+	{ .name = "max77693-charger" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77693_charger_id);
diff --git a/drivers/power/supply/max8997_charger.c b/drivers/power/supply/max8997_charger.c
index 1ec3535a257d..19da9eff0372 100644
--- a/drivers/power/supply/max8997_charger.c
+++ b/drivers/power/supply/max8997_charger.c
@@ -268,7 +268,7 @@ static int max8997_battery_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max8997_battery_id[] = {
-	{ "max8997-battery", 0 },
+	{ .name = "max8997-battery" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max8997_battery_id);
diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index 77747eb51667..69955f255091 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -841,8 +841,8 @@ static const struct of_device_id __maybe_unused mt6360_charger_of_id[] = {
 MODULE_DEVICE_TABLE(of, mt6360_charger_of_id);
 
 static const struct platform_device_id mt6360_charger_id[] = {
-	{ "mt6360-chg", 0 },
-	{},
+	{ .name = "mt6360-chg" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6360_charger_id);
 
-- 
2.47.3


