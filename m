Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B193C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yT+d5B3DzOfQ1A2yZzKZbhntYkBCfJHpxkupFuJwOC0=; b=TgY8weI/0tXi8PCd26t5c/IZ3L
	+tGmg9IqQNH8qii8PehuQ5IBOoAX6ylgzHTYu4uQxdhCqDR0719lfsX1N9e6IYPmfOQlJWlDMj/Oc
	KaxxMo6pL9vIYF7N2C6v8eP+cectpQc2dmW+CV52F57O6poLgcP0cUB0dGbo2VrqGub//2L1jVTih
	AMTQG6EMMR1fRR0smtYoCl2Hsf2OCQMmGMWYq6hEz+YmnsiGueLSNLCoRUU3y/yS8/0UfKVwUE7b9
	BQq3yDu4ifpp25mKL6ZJNX6yhrTRr4m3DZEvppZqQxEPNKkuazns4ywSRn7BMIcaxkZXCLtDeckoR
	hHpGqdMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqNG-00000008UAc-42F2;
	Wed, 05 Mar 2025 15:09:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqLh-00000008Tz1-0eMW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 15:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=yT+d5B3DzOfQ1A2yZzKZbhntYkBCfJHpxkupFuJwOC0=; b=UKJN63/OWlmR1T9EHtjcD2IGEw
	ntxcrbsdDqxndllW911Kso6UWZM+sfPbGiKB1G4eF2uv9l8VRtSG5TkcnZJ9nuh27Z/MD+I57cLKc
	/kag7LfntwNAbtsBUiRT1kD6LK/2oHuTtPMmZtjLlFlMY1ujAp0qbp3teWK54QODtr/1EF43Fq+cb
	hBU3845J865zH8M9ozX2ySalUWSC9hEU5afTh+oRb6mv6hzmi/iHJbqtPLcP9+Ld+Y3LfKsm398hk
	pgtQ4Gc5Oe3VpTAv61ZbiO/iKFByfmJJ6AVayDxfRfbT+F1nj9x1rezt+hLifzeXd22R2Pq5hNkSb
	eSflTSSQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqLe-00000005jeS-050Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 15:07:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394036c0efso44230345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 07:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741187266; x=1741792066; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yT+d5B3DzOfQ1A2yZzKZbhntYkBCfJHpxkupFuJwOC0=;
        b=z1StP4oKMBrRuiFThR5ssU7pAjk0hO6N35HtypwA9zCVqPF163SxdHp0P0M4TdXX/1
         EsQfTXGJlHs0gsa9w9wiGPSr5ZkL57Zbf+CxnKuUEgFPAlArZE766QHdRe2HUhfjGhrI
         dKNyX142FOF5arzcp6PzHV+QaAou+w3MCV8wY2fOXId6cmFej8iVyEFCUwSugs1pBzje
         ouwdpQ/Tou2fYqaXE62ASiSqsbZumAEQStgFH4vsX/JxOzkTll/zcc049AsCqn4WI1zU
         /hEfOrMpcnnsp51szFxPtnmznonguPkK/HyiysJRz2EmvIH/fwOGqc9ksGeCgwgA/ffC
         3rRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741187266; x=1741792066;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yT+d5B3DzOfQ1A2yZzKZbhntYkBCfJHpxkupFuJwOC0=;
        b=RMMjL/XcIX4xnkPAObR1MqZu7E1TypALT0r4HYy+4cztb3hjNMRq8K3oicfGP6He37
         AZQ331FeFgsEWl/eNdq0jigrZjtFaIg5WjBAuU3iHQh6ZU3iWD0mAIkXexjRoAob6vpm
         v38C8nNlU2lX72+TXIY7rBv1o+TVb7Xn8wUuaG8vZcKFC6OQzV3JhX14mrrR+c2CsRRa
         FCQ4/kPiCya0xQgb113IlcT+mMK7EE6/88w2+pYuQClSc082W4V7HNft1vnBwisM1Oj4
         miit3T1bK/v3SHiaIckkh4ReGkuFS7Ad33rAbD6v/+nblpqNJIsLdQq94FsvCtHvbavP
         o2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBC/JZ6MmAki760hMoKyIiogmGdjYtTeOb4oKLQrHblvmYfq1ZIYndZay6XIrrqQomlbRN8X43fY1UJxcjc4CY@lists.infradead.org
X-Gm-Message-State: AOJu0YxjApJlVJvQXHNXH/X8avq7Y/bTkNOXutsXbFiOw2oFbUPaXV0K
	b26RcOXG1Plxj4SwSODjpH2BiYDr1d0MF2LwaXy6xonQVjWVW4S9VwzkVr2r+jA=
X-Gm-Gg: ASbGncsCA9M+0ol2iKHgNk67pdMZQhnV1ki9ysy6RRJmTinjDaNYEzYiJdRTS7mjciF
	ZGOyifQM9wpkYMlYUz1Sy+31mhHxAlbyyaZaDmyR/aRK7iIx242KVcEYlTbwzJFQ5zsOyM5wdec
	fkwlPLOHlN4sThR+a6IelZZbNvcru4S40/FvyM9wddv3gWrdJOsOfC8y6K2AF6KAcHOASzM5x6J
	7AYMIvQBBeEDOw05G/YYVd6+pCquhKJjDSz8aw1xghzIqjA7T0I0X8GRYg/7//NcBu3JYk1XRQg
	XO85lbi5Vr3fdnrF7Vii+Zk+cNMxhFOgxSMZsydlDwOznERV
X-Google-Smtp-Source: AGHT+IHzIPW0COtsbKy6olSoxC0NNJSd1yTzQfzQ9tFbnZt+lQ9G+iYYH4v0xt6Hk5YVZ6vJEql6xQ==
X-Received: by 2002:a05:600c:2e48:b0:439:98ca:e3a4 with SMTP id 5b1f17b1804b1-43bd29b4cdbmr26703275e9.19.1741187265872;
        Wed, 05 Mar 2025 07:07:45 -0800 (PST)
Received: from pop-os.lan ([209.198.129.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391288b54cbsm155121f8f.28.2025.03.05.07.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:07:45 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 05 Mar 2025 15:07:19 +0000
Subject: [PATCH v2] coresight: Add a KUnit test for
 coresight_find_default_sink()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-james-cs-kunit-test-v2-1-83ba682b976c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKZoyGcC/yWNQQ6CMBBFr0K6tqQdKEZX3sOwaGCAEWxNpxIN6
 d2tsHwv+e9vgjEQsrgWmwi4EpN3GeBUiG6ybkRJfWYBCoyqlJEP+0SWHcv57SjKiBxlZQfdD1A
 rjY3Iy1fAgT579d5mnoijD9/9ZNV/e/QAjG7qprqUBuBca6mPfNktNsy3hZwNvvRhFG1K6Qemt
 o2JrAAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_150750_063389_F2AF2693 
X-CRM114-Status: GOOD (  17.10  )
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

Add a test to confirm that default sink selection skips over an ETF
and returns an ETR even if it's further away.

This also makes it easier to add new unit tests in the future.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Let devm free everything rather than doing individual kfrees:
  "Like with managed drivers, KUnit-managed fake devices are
  automatically cleaned up when the test finishes, but can be manually
  cleaned up early with kunit_device_unregister()."
- Link to v1: https://lore.kernel.org/r/20250225164639.522741-1-james.clark@linaro.org
---
 drivers/hwtracing/coresight/Kconfig                |  9 +++
 drivers/hwtracing/coresight/Makefile               |  3 +-
 drivers/hwtracing/coresight/coresight-core.c       |  1 +
 .../hwtracing/coresight/coresight-kunit-tests.c    | 77 ++++++++++++++++++++++
 4 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index ecd7086a5b83..f064e3d172b3 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -259,4 +259,13 @@ config CORESIGHT_DUMMY
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-dummy.
+
+config CORESIGHT_KUNIT_TESTS
+	  tristate "Enable Coresight unit tests"
+	  depends on KUNIT
+	  default KUNIT_ALL_TESTS
+	  help
+	    Enable Coresight unit tests. Only useful for development and not
+	    intended for production.
+
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 8e62c3150aeb..96f0dfedb1bf 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -51,5 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
-obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
-coresight-ctcu-y := coresight-ctcu-core.o
+obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index bd0a7edd38c9..b101aa133ceb 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -959,6 +959,7 @@ coresight_find_default_sink(struct coresight_device *csdev)
 	}
 	return csdev->def_sink;
 }
+EXPORT_SYMBOL_GPL(coresight_find_default_sink);
 
 static int coresight_remove_sink_ref(struct device *dev, void *data)
 {
diff --git a/drivers/hwtracing/coresight/coresight-kunit-tests.c b/drivers/hwtracing/coresight/coresight-kunit-tests.c
new file mode 100644
index 000000000000..a136af05eaf4
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <kunit/test.h>
+#include <kunit/device.h>
+#include <linux/coresight.h>
+
+#include "coresight-priv.h"
+
+static struct coresight_device *coresight_test_device(struct device *dev)
+{
+	struct coresight_device *csdev = devm_kcalloc(dev, 1,
+						     sizeof(struct coresight_device),
+						     GFP_KERNEL);
+	csdev->pdata = devm_kcalloc(dev, 1,
+				   sizeof(struct coresight_platform_data),
+				   GFP_KERNEL);
+	return csdev;
+}
+
+static int coresight_test_cpuid(struct coresight_device *csdev)
+{
+	return 0;
+}
+
+static void test_default_sink(struct kunit *test)
+{
+	/*
+	 * ETM -> ETF -> ETR -> CATU
+	 *                ^
+	 *                | default
+	 */
+	struct device *dev = kunit_device_register(test, "coresight_kunit");
+	struct coresight_device *etm = coresight_test_device(dev),
+				*etf = coresight_test_device(dev),
+				*etr = coresight_test_device(dev),
+				*catu = coresight_test_device(dev);
+	struct coresight_connection conn = {};
+	struct coresight_ops_source src_ops = {.cpu_id = coresight_test_cpuid };
+	struct coresight_ops etm_cs_ops = { .source_ops	= &src_ops };
+
+	etm->type = CORESIGHT_DEV_TYPE_SOURCE;
+	etm->ops = &etm_cs_ops;
+	etf->type = CORESIGHT_DEV_TYPE_LINKSINK;
+	etf->subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
+	etr->type = CORESIGHT_DEV_TYPE_SINK;
+	etr->subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
+	catu->type = CORESIGHT_DEV_TYPE_HELPER;
+
+	conn.src_dev = etm;
+	conn.dest_dev = etf;
+	coresight_add_out_conn(dev, etm->pdata, &conn);
+
+	conn.src_dev = etf;
+	conn.dest_dev = etr;
+	coresight_add_out_conn(dev, etf->pdata, &conn);
+
+	conn.src_dev = etr;
+	conn.dest_dev = catu;
+	coresight_add_out_conn(dev, etr->pdata, &conn);
+
+	KUNIT_ASSERT_PTR_EQ(test, coresight_find_default_sink(etm), etr);
+}
+
+static struct kunit_case coresight_testcases[] = {
+	KUNIT_CASE(test_default_sink),
+	{}
+};
+
+static struct kunit_suite coresight_test_suite = {
+	.name = "coresight_test_suite",
+	.test_cases = coresight_testcases,
+};
+
+kunit_test_suites(&coresight_test_suite);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("James Clark <james.clark@linaro.org>");
+MODULE_DESCRIPTION("Arm CoreSight KUnit tests");

---
base-commit: eeafe6a8790ea125252ca2e23c1a2469eaff1d9a
change-id: 20250305-james-cs-kunit-test-3af1df2401e6

Best regards,
-- 
James Clark <james.clark@linaro.org>


