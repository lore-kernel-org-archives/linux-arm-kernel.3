Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAE2FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 02:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sE3kgNN3imuWW8hZNcKI+XXyp7KMJ221snrHqXZwehc=; b=IEOkB0jd7PuW1TOncb1416lMXJ
	MsC8KzbtnYAnkTTIR34kRCCZjXSgf/d4NJI4gafmvuP81U71R54q0MDnAwJ5O0fDd28h9hgY9O5BK
	2Y0Y0XS9FzNhSYFcePGBySJIkNPHCourA1cqZ4AFVkXTNY0ePtMi7Q6Pkol56IVL99MVixpU6oARG
	cphTiIGMsOKCxEUcVG9KIEDT005/o8H4doNkuX0ODlMn1cA3KYVT11vVnCitXb911def9wHkQl2mL
	BE9IcWBp21OfIMc4vC9sS4MFYICkCiUoC2iVbcZdCvqU4C3FSoxP4f1WcS/6sW1Jt1OTZrn5LHjtB
	HhtyyKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBvP-0000000G4F6-1kD5;
	Mon, 27 Apr 2026 02:42:19 +0000
Received: from jpms-ob01-os7.noc.sony.co.jp ([2001:cf8:acf:41::7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBvI-0000000G4CB-3wF8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 02:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1777257733; x=1808793733;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=sE3kgNN3imuWW8hZNcKI+XXyp7KMJ221snrHqXZwehc=;
  b=NT5ITC2q2gxof/eLwuGpEQFUADLNtepiRzPHw/Y4Tui3Th7W5r9CmMZH
   SuHo6pNgaHFrggIuFRKIFWqf6boOAayTuW1pvPL83kSWl2jZT4gH9/mgU
   YpcMRevi5uJThwtN9xSO/HidiQVur2+qV4LdED6T7rvrBb6n7RZOtsZB9
   FiWMYx9loJEDKNQzb+JQaEMr7kqnW8u0G4GWVIxeE7YmutqatLkn1N/Yw
   MPjxp9jOBmP6dgrnqqWJ9uM2Ws7JGsKwKI2RuNgmdGY9KOK8ZNXoTb7bo
   jh3dwLh0RRBJsOztVKcqw8O20JuAAy3xj4g82V6/XO6OqsRHbtX6YdBWc
   A==;
X-CSE-ConnectionGUID: xA5umoQBSwqS5dEw6xXpOg==
X-CSE-MsgGUID: ACFU0IcxQbaJ0+WYoYjOeQ==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 11:42:05 +0900
X-CSE-ConnectionGUID: 7HUeG7JaR32fPxS0uugJNQ==
X-CSE-MsgGUID: eOsZfxyWTs2J2kChy1QIog==
X-IronPort-AV: E=Sophos;i="6.23,201,1770562800"; 
   d="scan'208";a="52275256"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 27 Apr 2026 11:42:04 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 27 Apr 2026 11:41:22 +0900
Subject: [PATCH v4 2/4] coresight: pass THIS_MODULE implicitly through a
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpi_mod_name-v4-2-22b42240c9bf@sony.com>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
In-Reply-To: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 linux-modules@vger.kernel.org
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=8244;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=McKmRd1+Lo18DKCybZFxap3kme/nTmBld+wIUrdjyzs=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsx3Z34yPONbtepKVIh3pMbDW2YcLw+qfL9xbkfIXMePh
 wXn5Tt5d5SyMIhxMciKKbKUKlX/2rsiaEnPmdeKMHNYmcCGcHEKwER6qxgZzgr/rWPk7mUod53R
 xWF3gf/afmnG6GdS/AfuHuELUTdYxcgwcbkrbyy3yIRpGXf5ctefnvJK9Ovz9GP/K9K7tovoHXr
 IAgA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_194213_217904_0A0F5F57 
X-CRM114-Status: GOOD (  12.19  )
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

Rename coresight_init_driver() to __coresight_init_driver() and replace
it with a macro wrapper that passes THIS_MODULE implicitly. This is in line with
what other buses do.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 4 ++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 3 +--
 drivers/hwtracing/coresight/coresight-funnel.c     | 3 +--
 drivers/hwtracing/coresight/coresight-replicator.c | 3 +--
 drivers/hwtracing/coresight/coresight-stm.c        | 2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 2 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       | 3 +--
 drivers/hwtracing/coresight/coresight-tpiu.c       | 2 +-
 include/linux/coresight.h                          | 4 +++-
 11 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ce71dcddfca2..0c8698c8fc5e 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -706,7 +706,7 @@ static int __init catu_init(void)
 {
 	int ret;
 
-	ret = coresight_init_driver("catu", &catu_driver, &catu_platform_driver, THIS_MODULE);
+	ret = coresight_init_driver("catu", &catu_driver, &catu_platform_driver);
 	tmc_etr_set_catu_ops(&etr_catu_buf_ops);
 	return ret;
 }
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..4ebcbd95b7fb 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1694,7 +1694,7 @@ static void __exit coresight_exit(void)
 module_init(coresight_init);
 module_exit(coresight_exit);
 
-int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
+int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 			  struct platform_driver *pdev_drv, struct module *owner)
 {
 	int ret;
@@ -1713,7 +1713,7 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 	amba_driver_unregister(amba_drv);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(coresight_init_driver);
+EXPORT_SYMBOL_GPL(__coresight_init_driver);
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 629614278e46..3a806c1d50ea 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -757,8 +757,7 @@ static struct platform_driver debug_platform_driver = {
 
 static int __init debug_init(void)
 {
-	return coresight_init_driver("debug", &debug_driver, &debug_platform_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("debug", &debug_driver, &debug_platform_driver);
 }
 
 static void __exit debug_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3f56ceccd8c9..0abc11f0690c 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -412,8 +412,7 @@ static struct amba_driver dynamic_funnel_driver = {
 
 static int __init funnel_init(void)
 {
-	return coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver);
 }
 
 static void __exit funnel_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 07fc04f53b88..2f382de357ee 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -418,8 +418,7 @@ static struct amba_driver dynamic_replicator_driver = {
 
 static int __init replicator_init(void)
 {
-	return coresight_init_driver("replicator", &dynamic_replicator_driver, &replicator_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("replicator", &dynamic_replicator_driver, &replicator_driver);
 }
 
 static void __exit replicator_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index aca6cec7885a..4e860519a73f 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1050,7 +1050,7 @@ static struct platform_driver stm_platform_driver = {
 
 static int __init stm_init(void)
 {
-	return coresight_init_driver("stm", &stm_driver, &stm_platform_driver, THIS_MODULE);
+	return coresight_init_driver("stm", &stm_driver, &stm_platform_driver);
 }
 
 static void __exit stm_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index c89fe996af23..bc5a133ada3e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -1046,7 +1046,7 @@ static struct platform_driver tmc_platform_driver = {
 
 static int __init tmc_init(void)
 {
-	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver, THIS_MODULE);
+	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver);
 }
 
 static void __exit tmc_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 96a25877b824..9e8de4323d28 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -344,7 +344,7 @@ static struct platform_driver itnoc_driver = {
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver, THIS_MODULE);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
 }
 
 static void __exit tnoc_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index eaf7210af648..8464edbba2d4 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1563,8 +1563,7 @@ static struct platform_driver static_tpdm_driver = {
 
 static int __init tpdm_init(void)
 {
-	return coresight_init_driver("tpdm", &dynamic_tpdm_driver, &static_tpdm_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("tpdm", &dynamic_tpdm_driver, &static_tpdm_driver);
 }
 
 static void __exit tpdm_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index b8560b140e0f..7b029d2eb389 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -310,7 +310,7 @@ static struct platform_driver tpiu_platform_driver = {
 
 static int __init tpiu_init(void)
 {
-	return coresight_init_driver("tpiu", &tpiu_driver, &tpiu_platform_driver, THIS_MODULE);
+	return coresight_init_driver("tpiu", &tpiu_driver, &tpiu_platform_driver);
 }
 
 static void __exit tpiu_exit(void)
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2131febebee9..b9ec5f195907 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -691,7 +691,9 @@ coresight_find_output_type(struct coresight_platform_data *pdata,
 			   enum coresight_dev_type type,
 			   union coresight_dev_subtype subtype);
 
-int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
+#define coresight_init_driver(drv, amba_drv, pdev_drv) \
+	__coresight_init_driver(drv, amba_drv, pdev_drv, THIS_MODULE)
+int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 			  struct platform_driver *pdev_drv, struct module *owner);
 
 void coresight_remove_driver(struct amba_driver *amba_drv,

-- 
2.43.0


