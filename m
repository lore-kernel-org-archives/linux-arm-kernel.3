Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E90D2E9D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 11:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JeDyppQr/52qjjY/sVCNOM57E5CoacIekvSQbtIZVSg=; b=ARJjxs6Dr5ypM+qW9E0qZfN06d
	J25FKmT7B7EDFT1phzV9wykrZaZntPSYVkK9YP7chFN0PVNVFlgs2TYZ7h52BvVAkK+S49nCdh5iQ
	1ZuVp+Rg7PA8/qBZ/HPXTmLKwKyK98P4Yh2W3Y7J8Ty9sD4KzTG8kwnIzuevd94stxcxV5FMz4HNL
	IY0XqH8btdH+5cjQBVAn6qcA2V3ggkinFkLj9Ewq99xNu/4W0r/GDiJH59gOvfaNYbfrKPJJW0Mtb
	uKT4xuSc4AGq5w8HsyvoPkSugrtlkmnNPQKYpHGM32bVRF8cIb4MsSuuV2hzh2TkI+AsXPTvUO4wW
	tA6L++Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASKM-0000000HOtI-48sJ;
	Mon, 11 Nov 2024 11:11:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASIa-0000000HOdh-0qw0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 11:09:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so55519735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 03:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731323373; x=1731928173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JeDyppQr/52qjjY/sVCNOM57E5CoacIekvSQbtIZVSg=;
        b=nqhLIWy8prMDjmFzWXCk1trGjCkOMUKDZPupzMIT+uzTM5wKuCDC1LandCxC55aGsm
         0148lSXyrALxE2lJDMYJ8MsBOv/yyLBz3NOy3/UZjMPw6fleeSY55uuMbt3EMuB5wg13
         zqITA6aeJCLksBli9AHWO5UsZeBuJb/zzqjc5ax7zB/+faoU/DrAG39z93XG4NU90vQZ
         lChPSH/8HqsSF9a6z29cwBWN9a3bhT3oKeQbSOKWTHxtbozeQTJZH1vplkXmlXW+y8kU
         myvBi4O98ywRN4qtuuN4/j/lyf84nUjolg0J+GIYdu/CeiKSW3/lkK2jO4oMhbyGHalR
         0Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323373; x=1731928173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeDyppQr/52qjjY/sVCNOM57E5CoacIekvSQbtIZVSg=;
        b=UpxKeDkgiUxSCtfIy0+ixYIWqEM7XUyqys3v77Dl2dd/qk7gleN6kykel3IC3tA9l4
         jJSrl5yehvbKG7BSwKXOLXi7vwnEZPgU2Cf+fcROW/OEFHHkJOP3vQ/LYMEd4ixQrlq5
         BSo25vGCosj3XV9dctint2SNkXdp36NaLKmiJaq//QA/IpMqqj7nHpT0PA8oUlRV02kV
         ZUeQ04b0SsA7PSKrxTemhqpB8wNHP6/lKY/f8v1Dj2ihkjeYC43fJ2Ba4sWZULl0PSaR
         fYaoNI+WUQ6opntkZyHh1aXgmTlCYsszXSec2mWVb5lECzL8nrH/TRiZtyuzvqtaTcGN
         69wg==
X-Forwarded-Encrypted: i=1; AJvYcCUhMOvPreyt2eLWBfKVpivCXp17WmaTsQk/wfQgkehLM3W47ru2k/q/wUjvTth9lAXEWxSRD2YIBgcE6fWjF89w@lists.infradead.org
X-Gm-Message-State: AOJu0YyE5RMclDVlfafTBbIsABJ66HyZyt2dQUvSm1TNcAQZorbwtlUp
	xJ/sQ03ovTyTnsC8UQXWTlYmMrCj2+M4XDnnaUZkvWGNf7NL1+dxhONVqFXHvoM=
X-Google-Smtp-Source: AGHT+IGNNcgbDl4Gjze/hD2NJqFaWQ3onyE4s6CpeGAHpgde3gbIZHMy/7KJHU0Z+5MjV8yVvVXtrw==
X-Received: by 2002:a05:600c:190e:b0:431:5465:8072 with SMTP id 5b1f17b1804b1-432b751f555mr131405445e9.31.1731323373228;
        Mon, 11 Nov 2024 03:09:33 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5e56sm213656485e9.2.2024.11.11.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:09:32 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] hwtracing: Switch back to struct platform_driver::remove()
Date: Mon, 11 Nov 2024 12:09:21 +0100
Message-ID: <20241111110922.334610-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9497; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=RnJDEX+e8M1SKac+t/KfkBTvvWb4921UTTN3vtqwVQI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnMeXicyreSYH3tGtlKi+QoIjeO7ZecvhVykXhv 5iZNPi4+9WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZzHl4gAKCRCPgPtYfRL+ TlZvB/4ongM8ev2nzjBonTl6LHFPWH/dW4XaKq06lslOITmSCMFUOjyvunGbOsvH/We2gE0AReI rEgypT1beQyxxZtkHnX9B/KL0aMbsQ/z5z8K3wvwjs49X7vCfMg39GRSreQVaE6D2pAupua3NO5 gqAdIlK/B1ulQCbckqk/CoKbOOHzVNiKUXlKgycwXSL8Jexb6yfMFHGSdmT3siTzoFr7vHLQloJ NpOvGGa+h14rW1BOFTxpb229KI1mWdcmW/LXYeMn8ngNm0AmPELvuydGuMXhR3jENb4CvFYltg+ BevQ8rf5/OL4qFNtbN5ajj2T0fQi4T/95/gj6K36xXgaGD84
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_030936_272357_BDA4D132 
X-CRM114-Status: GOOD (  21.50  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/hwtracing to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Also adapt some whitespace to make indention consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/hwtracing. While I usually
prefer to do one logical change per patch, this seems to be
overengineering here as the individual changes are really trivial and
shouldn't be much in the way for stable backports. But I'll happily
split the patch if you prefer it split. Maybe split for coresight vs.
intel_th? Also if you object the indentation stuff, I can rework that.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/hwtracing/coresight/coresight-catu.c       | 2 +-
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 2 +-
 drivers/hwtracing/coresight/coresight-dummy.c      | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
 drivers/hwtracing/coresight/coresight-funnel.c     | 2 +-
 drivers/hwtracing/coresight/coresight-replicator.c | 2 +-
 drivers/hwtracing/coresight/coresight-stm.c        | 2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 2 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       | 4 ++--
 drivers/hwtracing/coresight/coresight-trbe.c       | 6 +++---
 drivers/hwtracing/coresight/ultrasoc-smb.c         | 2 +-
 drivers/hwtracing/intel_th/acpi.c                  | 2 +-
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index bfea880d6dfb..fe2412f83452 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -689,7 +689,7 @@ MODULE_DEVICE_TABLE(acpi, catu_acpi_ids);
 
 static struct platform_driver catu_platform_driver = {
 	.probe	= catu_platform_probe,
-	.remove_new = catu_platform_remove,
+	.remove	= catu_platform_remove,
 	.driver	= {
 		.name			= "coresight-catu-platform",
 		.acpi_match_table	= ACPI_PTR(catu_acpi_ids),
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 75962dae9aa1..3ac2b4a81694 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -763,7 +763,7 @@ static const struct dev_pm_ops debug_dev_pm_ops = {
 
 static struct platform_driver debug_platform_driver = {
 	.probe	= debug_platform_probe,
-	.remove_new = debug_platform_remove,
+	.remove	= debug_platform_remove,
 	.driver	= {
 		.name			= "coresight-debug-platform",
 		.acpi_match_table	= ACPI_PTR(debug_platform_ids),
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index bb85fa663ffc..fca219c0bba1 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -144,7 +144,7 @@ static const struct of_device_id dummy_match[] = {
 
 static struct platform_driver dummy_driver = {
 	.probe	= dummy_probe,
-	.remove_new = dummy_remove,
+	.remove	= dummy_remove,
 	.driver	= {
 		.name   = "coresight-dummy",
 		.of_match_table = dummy_match,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 66d44a404ad0..dd8c74f893db 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2399,7 +2399,7 @@ MODULE_DEVICE_TABLE(acpi, etm4x_acpi_ids);
 
 static struct platform_driver etm4_platform_driver = {
 	.probe		= etm4_probe_platform_dev,
-	.remove_new	= etm4_remove_platform_dev,
+	.remove		= etm4_remove_platform_dev,
 	.driver			= {
 		.name			= "coresight-etm4x",
 		.of_match_table		= etm4_sysreg_match,
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 5a819c8970fb..33efe1acbef7 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -377,7 +377,7 @@ MODULE_DEVICE_TABLE(acpi, funnel_acpi_ids);
 
 static struct platform_driver funnel_driver = {
 	.probe		= funnel_platform_probe,
-	.remove_new	= funnel_platform_remove,
+	.remove		= funnel_platform_remove,
 	.driver		= {
 		.name   = "coresight-funnel",
 		/* THIS_MODULE is taken care of by platform_driver_register() */
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 3e55be9c8418..0fba87de6d1a 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -389,7 +389,7 @@ MODULE_DEVICE_TABLE(acpi, replicator_acpi_ids);
 
 static struct platform_driver replicator_driver = {
 	.probe          = replicator_platform_probe,
-	.remove_new     = replicator_platform_remove,
+	.remove         = replicator_platform_remove,
 	.driver         = {
 		.name   = "coresight-replicator",
 		/* THIS_MODULE is taken care of by platform_driver_register() */
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index cb3e04755c99..93080849a1dc 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1036,7 +1036,7 @@ MODULE_DEVICE_TABLE(acpi, stm_acpi_ids);
 
 static struct platform_driver stm_platform_driver = {
 	.probe	= stm_platform_probe,
-	.remove_new = stm_platform_remove,
+	.remove	= stm_platform_remove,
 	.driver	= {
 		.name			= "coresight-stm-platform",
 		.acpi_match_table	= ACPI_PTR(stm_acpi_ids),
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 3a482fd2cb22..45a94d5d995f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -730,7 +730,7 @@ MODULE_DEVICE_TABLE(acpi, tmc_acpi_ids);
 
 static struct platform_driver tmc_platform_driver = {
 	.probe	= tmc_platform_probe,
-	.remove_new = tmc_platform_remove,
+	.remove	= tmc_platform_remove,
 	.driver	= {
 		.name			= "coresight-tmc-platform",
 		.acpi_match_table	= ACPI_PTR(tmc_acpi_ids),
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index b048e146fbb1..a7510122c6dd 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -307,8 +307,8 @@ MODULE_DEVICE_TABLE(acpi, tpiu_acpi_ids);
 
 static struct platform_driver tpiu_platform_driver = {
 	.probe	= tpiu_platform_probe,
-	.remove_new = tpiu_platform_remove,
-	.driver = {
+	.remove	= tpiu_platform_remove,
+	.driver	= {
 		.name			= "coresight-tpiu-platform",
 		.acpi_match_table	= ACPI_PTR(tpiu_acpi_ids),
 		.suppress_bind_attrs	= true,
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 96a32b213669..eca0801206ec 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1556,13 +1556,13 @@ MODULE_DEVICE_TABLE(platform, arm_trbe_acpi_match);
 
 static struct platform_driver arm_trbe_driver = {
 	.id_table = ACPI_PTR(arm_trbe_acpi_match),
-	.driver	= {
+	.driver = {
 		.name = DRVNAME,
 		.of_match_table = of_match_ptr(arm_trbe_of_match),
 		.suppress_bind_attrs = true,
 	},
-	.probe	= arm_trbe_device_probe,
-	.remove_new = arm_trbe_device_remove,
+	.probe = arm_trbe_device_probe,
+	.remove = arm_trbe_device_remove,
 };
 
 static int __init arm_trbe_init(void)
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index ef7f560f0ffa..dc3c9504dd7c 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -600,7 +600,7 @@ static struct platform_driver smb_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = smb_probe,
-	.remove_new = smb_remove,
+	.remove = smb_remove,
 };
 module_platform_driver(smb_driver);
 
diff --git a/drivers/hwtracing/intel_th/acpi.c b/drivers/hwtracing/intel_th/acpi.c
index 503620e9fd10..d229324978bd 100644
--- a/drivers/hwtracing/intel_th/acpi.c
+++ b/drivers/hwtracing/intel_th/acpi.c
@@ -69,7 +69,7 @@ static void intel_th_acpi_remove(struct platform_device *pdev)
 
 static struct platform_driver intel_th_acpi_driver = {
 	.probe		= intel_th_acpi_probe,
-	.remove_new	= intel_th_acpi_remove,
+	.remove		= intel_th_acpi_remove,
 	.driver		= {
 		.name			= DRIVER_NAME,
 		.acpi_match_table	= intel_th_acpi_ids,

base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.45.2


