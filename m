Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98605D41D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7wU7M4Ptimw8PGOw+mLlRlglx7N9Aty1r1jPUgKLjYw=; b=lDlC+htBi8VadlfwVGEh0j0ayT
	nmgP/arTKgEWykMhNbdFuXtJ5/8dny+uWL68vyoB9qH/6Q2XHcx+inimhvtCPmDlb6vtqqxZS8m13
	SSkvgi3jE6mdpZsJCEGTjPuIkZJRCIxtm6iIHLtpcXwHTPITNYt8pWZ03cg/EgTmWgKOglLeN3GAR
	Pv4PxaM+wkIj7qaPp0ZO8lOUNsgYOUY3K3oswIInHWf5cd0K3evSPrBOpvYP8kinSmeLIorOx/hry
	KECeJI5zlQCWQnLagvD90CQuzHN2qbUisZrWckjFGD7YKTXN2q763RxMLOkC2BCfnPNQiDAYowVDw
	1ZIZVAHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmPB-00000002f0v-14Y1;
	Tue, 12 Nov 2024 08:37:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmNN-00000002eeI-0dXK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:35:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so5042374f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400551; x=1732005351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wU7M4Ptimw8PGOw+mLlRlglx7N9Aty1r1jPUgKLjYw=;
        b=XWuYerTTTUQQwrqxJGYqLj75fFZ95fdSJ/fmDbZK02wP1zaIYnX6sQ9cjBqKflMHGv
         EjuptH+ri0BgsjHLW9mF2ytJ8jp0mSdNg8VLvFeQJWLe0iliaXg47hbonIjtNsfjwkEZ
         uyEpOW2iA1UcaXvITVXu50Y5eCSUO//rx0y1NiECk0pzu40fyIwcGkXWb8ZcH8ElkItS
         Nth6eitm6mx8OD4QBgjFhFDRdUR/TRwxW/A3S72YigbTzZIWT2QHVaUhuhcpKgbVyCWo
         BNWx1JvEEHd4HryAAAsVm/WSCvXouHZJDdC51kLeFTuyKvtxMMopqskMLkisRDMGaRyR
         GWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400551; x=1732005351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wU7M4Ptimw8PGOw+mLlRlglx7N9Aty1r1jPUgKLjYw=;
        b=GItNtc1RfgRh+NcKdnVYcl9GskrzrwyaMrr+u+LDv4Q9rQsyYiVHB8bHILwNg6tx+x
         Zq1GUUFpeKXMAQtrrA/cGcL1ya2BGjWtmpvXQwraPidOONbNZjsHKrFEuqYCRU5ZZ2Oh
         Dpz6veemKjqJtn/I1XII6NhMFlzE3+K7gOchTfG+CPIxuQ1/GsnAI462eEvJNCnpSnkx
         Za2GNvS9MGGGOdhjHoUlWKvDn2/2DhpCE+r/v7wQ4wKDcapRzvIN2Ucnv2HTLIXo++kG
         l1RvujHR4+Wf0t4gXpiJuy1klmmVJjA/70IzyAXLt3dClJQ+deKlMWMukg2F4bR0tKip
         Opxg==
X-Forwarded-Encrypted: i=1; AJvYcCWx00Y6gkfJz+MmYrwepwjpx7sk2DmRmDMh0NutQrdE48qbCRuYNwGz99pu6zQwumgere3V2vdIFsoVpcBZxSAd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlajv5Qg2VPBaMt5km2qw+SziwONGEZkeXwpANvWmRVH0Hwo7Q
	yzSZffEwQXcBbEwkee4jYy2dmWGrZsrfR/a9TUjZgw6U5kup405jm05I9fL6yhA=
X-Google-Smtp-Source: AGHT+IHiFASzlr7spoTUNhVJtwwvwJNa1Lv5GSiKW/D3V+iLqOWluUwxVMhT7WDK0J0Ds2e3n2yiJw==
X-Received: by 2002:a5d:6da6:0:b0:37d:4b26:54ca with SMTP id ffacd0b85a97d-381f186bd00mr16726556f8f.14.1731400551110;
        Tue, 12 Nov 2024 00:35:51 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed998e6esm14903634f8f.55.2024.11.12.00.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:35:50 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Ben Cheatham <Benjamin.Cheatham@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Avadhut Naik <Avadhut.Naik@amd.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] acpi: Switch back to struct platform_driver::remove()
Date: Tue, 12 Nov 2024 09:35:18 +0100
Message-ID: <9ee1a9813f53698be62aab9d810b2d97a2a9f186.1731397722.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7340; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=+YPn1qX5gaP+IdqhSdmwHbc0JIseY3+jbrKnjK8DzKU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnMxNI/ZbTVUEOBpYGZ8q7MY0VkhJKOMG4wkSjl hXt4aXh0BOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZzMTSAAKCRCPgPtYfRL+ TinZCACtViGxq/dG3QLNiGorxdJ9IV6j7DdeESdB/ykTYWapaxcagWWW/ptzn4ok3Btpt0OOzPn aqeZX44HlEzLsBo6rmHiBi9wExApLnPZY+Zb8C7hu2oRQQkrNNv6eiy/vktIz50C/iyBR3EIcST 7e5utVxD6ep0Zyq/V5zakt5wKGSYOmTh2V+YaurjC2ZozvGe+8+b5SMskGKtX+xxfu5a3NfXuaM cXV95X642noXUMIjdciLLQrRF/9GXrLig4vB8+5QDAaxR+a7fRBF2QEMO1v0EuCJaZl1JWNbKIo V15vNofDu/bvkAlNYG6CDPM64deSBjCDvuuTk9wVvncFEwwo
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_003553_219665_F4BC0D10 
X-CRM114-Status: GOOD (  20.96  )
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

Convert all platform drivers below drivers/acpi to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/acpi. While I usually prefer
to do one logical change per patch, this seems to be overengineering
here as the individual changes are really trivial and shouldn't be much
in the way for stable backports. But I'll happily split the patch if you
prefer it split. Also if you object the indentation stuff, I can rework
that.

This is based on yesterday's next, if conflicts arise when you apply it
at some later time and don't want to resolve them, feel free to just
drop the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/acpi/ac.c                 | 2 +-
 drivers/acpi/acpi_pad.c           | 2 +-
 drivers/acpi/acpi_tad.c           | 2 +-
 drivers/acpi/apei/einj-core.c     | 2 +-
 drivers/acpi/apei/ghes.c          | 2 +-
 drivers/acpi/arm64/agdi.c         | 2 +-
 drivers/acpi/dptf/dptf_pch_fivr.c | 2 +-
 drivers/acpi/dptf/dptf_power.c    | 2 +-
 drivers/acpi/evged.c              | 2 +-
 drivers/acpi/fan_core.c           | 2 +-
 drivers/acpi/pfr_telemetry.c      | 2 +-
 drivers/acpi/pfr_update.c         | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/acpi/ac.c b/drivers/acpi/ac.c
index 7c5b040a83e8..1f69be8f51a2 100644
--- a/drivers/acpi/ac.c
+++ b/drivers/acpi/ac.c
@@ -290,7 +290,7 @@ static void acpi_ac_remove(struct platform_device *pdev)
 
 static struct platform_driver acpi_ac_driver = {
 	.probe = acpi_ac_probe,
-	.remove_new = acpi_ac_remove,
+	.remove = acpi_ac_remove,
 	.driver = {
 		.name = "ac",
 		.acpi_match_table = ac_device_ids,
diff --git a/drivers/acpi/acpi_pad.c b/drivers/acpi/acpi_pad.c
index 42b7220d4cfd..4ec20fd56985 100644
--- a/drivers/acpi/acpi_pad.c
+++ b/drivers/acpi/acpi_pad.c
@@ -462,7 +462,7 @@ MODULE_DEVICE_TABLE(acpi, pad_device_ids);
 
 static struct platform_driver acpi_pad_driver = {
 	.probe = acpi_pad_probe,
-	.remove_new = acpi_pad_remove,
+	.remove = acpi_pad_remove,
 	.driver = {
 		.dev_groups = acpi_pad_groups,
 		.name = "processor_aggregator",
diff --git a/drivers/acpi/acpi_tad.c b/drivers/acpi/acpi_tad.c
index b831cb8e53dc..825c2a8acea4 100644
--- a/drivers/acpi/acpi_tad.c
+++ b/drivers/acpi/acpi_tad.c
@@ -684,7 +684,7 @@ static struct platform_driver acpi_tad_driver = {
 		.acpi_match_table = acpi_tad_ids,
 	},
 	.probe = acpi_tad_probe,
-	.remove_new = acpi_tad_remove,
+	.remove = acpi_tad_remove,
 };
 MODULE_DEVICE_TABLE(acpi, acpi_tad_ids);
 
diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
index 5c22720f43cc..04731a5b01fa 100644
--- a/drivers/acpi/apei/einj-core.c
+++ b/drivers/acpi/apei/einj-core.c
@@ -880,7 +880,7 @@ static struct platform_device *einj_dev;
  * triggering a section mismatch warning.
  */
 static struct platform_driver einj_driver __refdata = {
-	.remove_new = __exit_p(einj_remove),
+	.remove = __exit_p(einj_remove),
 	.driver = {
 		.name = "acpi-einj",
 	},
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index ada93cfde9ba..a2491905f165 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -1605,7 +1605,7 @@ static struct platform_driver ghes_platform_driver = {
 		.name	= "GHES",
 	},
 	.probe		= ghes_probe,
-	.remove_new	= ghes_remove,
+	.remove		= ghes_remove,
 };
 
 void __init acpi_ghes_init(void)
diff --git a/drivers/acpi/arm64/agdi.c b/drivers/acpi/arm64/agdi.c
index f5f21dd0d277..e0df3daa4abf 100644
--- a/drivers/acpi/arm64/agdi.c
+++ b/drivers/acpi/arm64/agdi.c
@@ -88,7 +88,7 @@ static struct platform_driver agdi_driver = {
 		.name = "agdi",
 	},
 	.probe = agdi_probe,
-	.remove_new = agdi_remove,
+	.remove = agdi_remove,
 };
 
 void __init acpi_agdi_init(void)
diff --git a/drivers/acpi/dptf/dptf_pch_fivr.c b/drivers/acpi/dptf/dptf_pch_fivr.c
index d202730fafd8..624fce67ce43 100644
--- a/drivers/acpi/dptf/dptf_pch_fivr.c
+++ b/drivers/acpi/dptf/dptf_pch_fivr.c
@@ -158,7 +158,7 @@ MODULE_DEVICE_TABLE(acpi, pch_fivr_device_ids);
 
 static struct platform_driver pch_fivr_driver = {
 	.probe = pch_fivr_add,
-	.remove_new = pch_fivr_remove,
+	.remove = pch_fivr_remove,
 	.driver = {
 		.name = "dptf_pch_fivr",
 		.acpi_match_table = pch_fivr_device_ids,
diff --git a/drivers/acpi/dptf/dptf_power.c b/drivers/acpi/dptf/dptf_power.c
index 8023b3e23315..3d3edd81b172 100644
--- a/drivers/acpi/dptf/dptf_power.c
+++ b/drivers/acpi/dptf/dptf_power.c
@@ -242,7 +242,7 @@ MODULE_DEVICE_TABLE(acpi, int3407_device_ids);
 
 static struct platform_driver dptf_power_driver = {
 	.probe = dptf_power_add,
-	.remove_new = dptf_power_remove,
+	.remove = dptf_power_remove,
 	.driver = {
 		.name = "dptf_power",
 		.acpi_match_table = int3407_device_ids,
diff --git a/drivers/acpi/evged.c b/drivers/acpi/evged.c
index 11778c93254b..5c35cbc7f6ff 100644
--- a/drivers/acpi/evged.c
+++ b/drivers/acpi/evged.c
@@ -185,7 +185,7 @@ static const struct acpi_device_id ged_acpi_ids[] = {
 
 static struct platform_driver ged_driver = {
 	.probe = ged_probe,
-	.remove_new = ged_remove,
+	.remove = ged_remove,
 	.shutdown = ged_shutdown,
 	.driver = {
 		.name = MODULE_NAME,
diff --git a/drivers/acpi/fan_core.c b/drivers/acpi/fan_core.c
index 7cea4495f19b..3ea9cfcff46e 100644
--- a/drivers/acpi/fan_core.c
+++ b/drivers/acpi/fan_core.c
@@ -448,7 +448,7 @@ static const struct dev_pm_ops acpi_fan_pm = {
 
 static struct platform_driver acpi_fan_driver = {
 	.probe = acpi_fan_probe,
-	.remove_new = acpi_fan_remove,
+	.remove = acpi_fan_remove,
 	.driver = {
 		.name = "acpi-fan",
 		.acpi_match_table = fan_device_ids,
diff --git a/drivers/acpi/pfr_telemetry.c b/drivers/acpi/pfr_telemetry.c
index a32798787ed9..32bdf8cbe8f2 100644
--- a/drivers/acpi/pfr_telemetry.c
+++ b/drivers/acpi/pfr_telemetry.c
@@ -422,7 +422,7 @@ static struct platform_driver acpi_pfrt_log_driver = {
 		.acpi_match_table = acpi_pfrt_log_ids,
 	},
 	.probe = acpi_pfrt_log_probe,
-	.remove_new = acpi_pfrt_log_remove,
+	.remove = acpi_pfrt_log_remove,
 };
 module_platform_driver(acpi_pfrt_log_driver);
 
diff --git a/drivers/acpi/pfr_update.c b/drivers/acpi/pfr_update.c
index 8b2910995fc1..031d1ba81b86 100644
--- a/drivers/acpi/pfr_update.c
+++ b/drivers/acpi/pfr_update.c
@@ -565,7 +565,7 @@ static struct platform_driver acpi_pfru_driver = {
 		.acpi_match_table = acpi_pfru_ids,
 	},
 	.probe = acpi_pfru_probe,
-	.remove_new = acpi_pfru_remove,
+	.remove = acpi_pfru_remove,
 };
 module_platform_driver(acpi_pfru_driver);
 

base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.45.2


