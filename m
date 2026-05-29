Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAABCD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4zSRLTrRKREVH9IqS8el7yHWyFDWA9l51ZOzDmK9sI=; b=et677XgUPteghIFsSOSTASCXrg
	f1kDRkCbPtI0GT/3TK3Vu+uNKUTwKWi3JpF3/hukAsTLs0dKjmgfGLyakzNzqLjS5/Kmho6ZebVju
	kMCfQjDNCaoztEHY5QvoggWn0OgYjO7tt1IILjesRa1vKRVQKm9kBMnpoliCusmyCe08VtAbD4PPV
	5xwRGay7P4q+Wn2heMKR6xjP+58FmTL4Up24lnvMghnoEMNdBJIQoMPFrXFP9KbN2/vlB93Qi9K7/
	8P9+KBB40QU/wrqGhxbMbUMDjvZyk417GTMmkZ/mfTjMh+IHclNz8YAtKK2WCWp0FCui9jdmblJeB
	rmBkmFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIk-00000007ANs-37na;
	Fri, 29 May 2026 10:18:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIg-00000007AHN-25tU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:18:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49039a8851fso81461055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049924; x=1780654724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4zSRLTrRKREVH9IqS8el7yHWyFDWA9l51ZOzDmK9sI=;
        b=fAUbDSchbLJ9qIHQLxHZIIBkOaRFYuE+rvO3hkT91ozfIE4uXMIZEfMxRrIWd0jjcc
         KnUhvYJnyQEsQ8stWABt9CMe7JmrLVA6YOXZ6o/gxMyh+RLXWr27hgi/aqkipWnc7GDU
         aDGQgxasVaDjSSL7IVJo764eeHAEHRVFSUViEqZCt4kkceQdbwCUwVJqH3l3UYx3+3Wl
         s+KOdeBIcdrfMLjLJ+/eNZFvLYPEexUNPdcBMbCDDTemkmTu1Sqs2WcXMqKpuY/8evvl
         eylscmZokUMLqY8hsqOEcb691AlYZwpzhHtUPkM29MAqFCtnf+LHl2zNxXHGT9BJwrdZ
         M6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049924; x=1780654724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4zSRLTrRKREVH9IqS8el7yHWyFDWA9l51ZOzDmK9sI=;
        b=T44bN3GhxZ2AuiPYAodzQo8XHKnZlYARh3Uxxhh1fE7ROBg3I9/tDCPOSdw+FnLk/L
         UYg6q+x+WFyKs6repRR99yFsGUZtYVDIEXfuoNyYdRiVn8It24chr0rfafr9y9kLDJrW
         H1fPxLDv6jzMUsKMmhVbMypuaY7qCOs6eWMnl9HaEGCzOQa3S1mZFicVKGu9rczQiA4z
         Qv1ODCzX2m1aX7rMM+vKbzcp8i+EJOHNF21PoMOcqCW5PP35B2wU/EGGesgA2UY25aDu
         icqWP+OERcpKr7xaIKNv4ADfl7SUdA+J5BsAoKK8V0HqQ4FCB727xuMLbbOtnAmxpqPj
         z4Bg==
X-Forwarded-Encrypted: i=1; AFNElJ/yewzFpZRc4p1HbswGUTlNG4gc8pQdZjvkiZmqYTbqwHmV/GS/pLZV+VaN0MU3p0H3qITw2nF68utvBj3PrHvd@lists.infradead.org
X-Gm-Message-State: AOJu0YyYjMBswrzaJ+MeL1PejBPMWGDLOIT0HEd1AGTbj1K8XYk0/Qcl
	IR3X7oj0DV3ZGfufeDDxqd0jDo2pjxzsjifDmXcZU4KZ0NdcNrp92/JmOc/nVihzK+U=
X-Gm-Gg: Acq92OFP9Aa83073Epqp01H7ooVUisb3+uhrWHFiRPKFX0nz6QMl1k7ATkqnjDrTDOI
	stGsMqpFeCQH8qq7t/j1Ze2TEq5WKnXThh5aLx/krUiTdrKc94nygNEAHQj9GLTkAk5onjSxIWO
	YjdFDNzycU/h1jlEP0kslzGXGPCCNJguPVjN1VnsDoQRhN3awhLyjoZMcWQPnJ22feqNUVS2l/0
	85lNIt3zIt4PmXZpC86fuA28vnUvEy5eLKw0N3D4yrRnrVYltj3b7K8+BXO5BRL5rv60ZXJvZrL
	r6oDWwNaH9hxiKQ8lz7hVGN/6PnNqmUXfV7e3ZOuCBKo4hYOuP7N+iG8JrnJ0Y4KN/9cGx5TPLR
	ODXpIIJoVfAOgJxMHXRT7yT7aGUSZsbn99CZgc/CBxtKGbdEjNK9Zfd6xi5K5YzXKLWecEc1Jl+
	sMpi+iC/R4wjVZQZXef8D7IBZ6N01G1g6zG5O9wrvSzUgYz6dzt4R59Hv7BqXw5khUOKCtng4tZ
	teJ9ZjtRDAFw7DXh2aEGiCL0A==
X-Received: by 2002:a05:600c:58ce:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-4909c0b546cmr30191565e9.24.1780049924381;
        Fri, 29 May 2026 03:18:44 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909c0ad269sm11855695e9.11.2026.05.29.03.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Samuel Kayode <samkay014@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v1 4/6] power: Use named initializers for platform_device_id arrays
Date: Fri, 29 May 2026 12:18:19 +0200
Message-ID: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5348; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=W9xT+mzvNTBez1lAU3xkbd8dVtQp/hVdeRLR+vfLdCE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWfy0bX/m5kq8Arlyt5XE8Z+Ge+pZiRLveebn 4cklmt0zVmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln8gAKCRCPgPtYfRL+ Tgj4CACZl/QxMesCrrIl4aNkVxWwxHLc2F2zJNbXP7mUNUZy6iSAQRmCPv/wrBPSa2TyyvCYd7T zCUw3L9LezGtcTAcu4AT6betYFrT3vdx2aMXWqk/lunJew9bTfAOihdCMJcA3jLt0SHECHUBYCt 8ibifSKnMpS9cmgT1+nXA/3x0Zp26IE6mNdFJai3hgNrNtpW+8MKMX2tBk/3VT6uv4nv3bzs5JR DZ9/1h8ng6iT+z6mSE3NjM83dSCzN+fkhK6EXTAZ8k0GaxqyY4TdqZSyZdPCeFum1xeDSRiVunl YedBpxql0w3n64ysMOen1PE+PCNSTxrCd0ATCblCqdxOqrhO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031846_600437_42ABC845 
X-CRM114-Status: GOOD (  15.38  )
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
 drivers/power/reset/spacemit-p1-reboot.c | 4 ++--
 drivers/power/reset/tps65086-restart.c   | 2 +-
 drivers/power/supply/bd71828-power.c     | 8 ++++----
 drivers/power/supply/macsmc-power.c      | 2 +-
 drivers/power/supply/max77759_charger.c  | 2 +-
 drivers/power/supply/max8998_charger.c   | 2 +-
 drivers/power/supply/pf1550-charger.c    | 2 +-
 drivers/power/supply/rt5033_charger.c    | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/spacemit-p1-reboot.c b/drivers/power/reset/spacemit-p1-reboot.c
index 9ec3d1fff8f3..84026b042ea2 100644
--- a/drivers/power/reset/spacemit-p1-reboot.c
+++ b/drivers/power/reset/spacemit-p1-reboot.c
@@ -70,8 +70,8 @@ static int spacemit_p1_reboot_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id spacemit_p1_reboot_id_table[] = {
-	{ "spacemit-p1-reboot", },
-	{ /* sentinel */ },
+	{ .name = "spacemit-p1-reboot" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, spacemit_p1_reboot_id_table);
 
diff --git a/drivers/power/reset/tps65086-restart.c b/drivers/power/reset/tps65086-restart.c
index 6976dbcac74f..37d248a9df17 100644
--- a/drivers/power/reset/tps65086-restart.c
+++ b/drivers/power/reset/tps65086-restart.c
@@ -41,7 +41,7 @@ static int tps65086_restart_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65086_restart_id_table[] = {
-	{ "tps65086-reset", },
+	{ .name = "tps65086-reset" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65086_restart_id_table);
diff --git a/drivers/power/supply/bd71828-power.c b/drivers/power/supply/bd71828-power.c
index 5e78faa0a4aa..5ab514ff5c65 100644
--- a/drivers/power/supply/bd71828-power.c
+++ b/drivers/power/supply/bd71828-power.c
@@ -1184,10 +1184,10 @@ static int bd71828_power_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd71828_charger_id[] = {
-	{ "bd71815-power", ROHM_CHIP_TYPE_BD71815 },
-	{ "bd71828-power", ROHM_CHIP_TYPE_BD71828 },
-	{ "bd72720-power", ROHM_CHIP_TYPE_BD72720 },
-	{ },
+	{ .name = "bd71815-power", .driver_data = ROHM_CHIP_TYPE_BD71815 },
+	{ .name = "bd71828-power", .driver_data = ROHM_CHIP_TYPE_BD71828 },
+	{ .name = "bd72720-power", .driver_data = ROHM_CHIP_TYPE_BD72720 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd71828_charger_id);
 
diff --git a/drivers/power/supply/macsmc-power.c b/drivers/power/supply/macsmc-power.c
index 33ca07460f3a..ced07f71e0a8 100644
--- a/drivers/power/supply/macsmc-power.c
+++ b/drivers/power/supply/macsmc-power.c
@@ -834,7 +834,7 @@ static void macsmc_power_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id macsmc_power_id[] = {
-	{ "macsmc-power" },
+	{ .name = "macsmc-power" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, macsmc_power_id);
diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index 9bb414599f16..c606d7bafcb8 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -754,7 +754,7 @@ static int max77759_charger_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77759_charger_id[] = {
-	{ .name = "max77759-charger", },
+	{ .name = "max77759-charger" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77759_charger_id);
diff --git a/drivers/power/supply/max8998_charger.c b/drivers/power/supply/max8998_charger.c
index 418b882b163d..b0eda2b51e7f 100644
--- a/drivers/power/supply/max8998_charger.c
+++ b/drivers/power/supply/max8998_charger.c
@@ -188,7 +188,7 @@ static int max8998_battery_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max8998_battery_id[] = {
-	{ "max8998-battery", TYPE_MAX8998 },
+	{ .name = "max8998-battery" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max8998_battery_id);
diff --git a/drivers/power/supply/pf1550-charger.c b/drivers/power/supply/pf1550-charger.c
index a457862ef461..41036f4cb64a 100644
--- a/drivers/power/supply/pf1550-charger.c
+++ b/drivers/power/supply/pf1550-charger.c
@@ -622,7 +622,7 @@ static int pf1550_charger_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id pf1550_charger_id[] = {
-	{ "pf1550-charger", },
+	{ .name = "pf1550-charger" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, pf1550_charger_id);
diff --git a/drivers/power/supply/rt5033_charger.c b/drivers/power/supply/rt5033_charger.c
index de724f23e453..536ab29b657d 100644
--- a/drivers/power/supply/rt5033_charger.c
+++ b/drivers/power/supply/rt5033_charger.c
@@ -727,7 +727,7 @@ static int rt5033_charger_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id rt5033_charger_id[] = {
-	{ "rt5033-charger", },
+	{ .name = "rt5033-charger" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, rt5033_charger_id);
-- 
2.47.3


