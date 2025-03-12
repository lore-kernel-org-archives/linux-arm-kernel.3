Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80498C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sZlYkby+d99WJO4NkP3kGBlnCGizroPklc0vRuBvEQU=; b=s4lwkAY8g3YvQndkYxHhPnhEBR
	Ou9B5MYu7TAtakx3Bglx/Cqq51cVnE1upgKhCoKw7vw2oPL5+ECeMEvAk45O4ZoApNN2Yi72PB+7H
	qQTgEK+5SgtiK4ezUeMBYzkglentH/WETttceTT58l9jti3goUzJ8SaJ7LMQE1VgNcUoWgcjLxKiQ
	YBtG+bGJ3Hrb/+/RimpdV0tm8y8qcI565tG2+w+JWO7AUviWKRCe4mZsbRR08/JSrsQprEsrN+cBL
	RRpbVF7L3qCC3/zLTbeTGE5cj8U2XAWSYTBpBxG3PkwcRrAYrr/tfSYXusBB2kdhjN/l9xBSRWQC0
	TcIkbEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJ7v-000000085Md-0RQZ;
	Wed, 12 Mar 2025 10:15:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJ45-000000084wk-38Az
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:11:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso31461085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741774312; x=1742379112; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZlYkby+d99WJO4NkP3kGBlnCGizroPklc0vRuBvEQU=;
        b=oMeXh84DGzsfdXwuNB2pJB1pXw7k4dXwzBC9b5qPId7D59IgBi8HgkhbV36v6nOor3
         spFVDKZ9HlW4ZXUDqFB/JPxxzskHfjDxN6gGlkgO7z114JWzCKxF9rhJGArs1c/OCiZM
         j17c7IDKmciTXix4nL5ZieMn+cXOsHDiSzx8TBQKB0By+kQTO3LTmpZvtHUsYea2Ulo8
         eygc9Nv9GFnDu70g4b4DiacWnYQ8WeEGEwS7jyaERbwMSoWxaE8jfTDevzvzxsNHZvTS
         i2L5v+RoUCos7sFIQbjmLbnDdrBUB4MlPWWqYsZXmV2HsemH94YiLr5QZbrj5limw/cj
         gTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741774312; x=1742379112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZlYkby+d99WJO4NkP3kGBlnCGizroPklc0vRuBvEQU=;
        b=B+NLvmvefgDGwYcq4tN66+lUk7uEtB1Kk3sX2AXPwWbeMOeiElZksONf5sKTo/yPtN
         RWbDZcxPiJi21sGcSZOPvaGydJOUsxcl0AukLq+6/86huTBzdwY0cs3QEMTI01xS1p8w
         8trtsRY8LGa3fG6KkuTy8qqHkKajVY7ulsIaZxbAV01naqO7kYcmzVgotIz5EYLwUzHB
         ECatXUnOlFMLuFhCgJrUs4fFyMWZbcPn9RK8fXymSaeIRb9CGz0g+R83e31GRv/TSrRx
         z6UdA/xeipznnfqPek68zshk0LX2TeY9pcgytDbYOS6q6utW0CV5gjiIO78qOXFD6306
         OVpw==
X-Forwarded-Encrypted: i=1; AJvYcCXdqdi64pRAy3iU3s0o74wJ2ek1f1sN88D81NrHTMi1SIQCXSuqWL9D8PBcfk5Lzzawy2uPtdgRQJnl3/3S27E6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlgk0SP4qdZVzl7NcgzKdKSnwZj1EFhEHNYw4x7EGYkCWIhp/3
	SbmNEKXSXM40VtQ5yohMnEylZaHdWJTcDlgOvI+GoYDkxSEMV+8FJsxgzBPTrJI=
X-Gm-Gg: ASbGnctOesUtOd3KShygraumDw8gPH5gmn3legZ8dinNhCPYvzUsudGsbtBjKpB0I7G
	fihp/AGW6twIsMmTgYFyQbmrM4i59E6CXMbM1PgbZGcOR3vnPcrX7wap38KSDEl5lmTBgbQTDLr
	jo4nAIyMm51yme+z1TqAlhvGnT507HZj3h5z9U18vewMJEPYB/6tiS0T2YzWKLU5JFnT4GI6GyV
	smZ49v09DvHBTrXTqWDiwd7lcQ9vgvhOGInQfhyd0WkMAsMMLnSr3eiZDfxIKAMtX/OvxVmAzzk
	0KC8dPiKRJbPAEsnmeRbTOFV2JoccpGnrECJXP0Ut1NUddc=
X-Google-Smtp-Source: AGHT+IEyqbXNIu5wRSJYhj/1fQ2mgsIresA2gnO6jS+UIi0uHFNrXyMS7z2i3K6uTFq/1oJ7VnktOg==
X-Received: by 2002:a05:600c:524c:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-43d0b32419amr11170515e9.3.1741774312077;
        Wed, 12 Mar 2025 03:11:52 -0700 (PDT)
Received: from pop-os.lan ([209.198.129.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a74c2efsm16243635e9.9.2025.03.12.03.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:11:51 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Mar 2025 10:11:29 +0000
Subject: [PATCH v3] coresight: Add a KUnit test for
 coresight_find_default_sink()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-james-cs-kunit-test-v3-1-dcfb69730161@linaro.org>
X-B4-Tracking: v=1; b=H4sIANBd0WcC/3XOQQ6DIBAF0Ks0rIuBQVC76j2aLlBRqRYaoKSN8
 e5FXTRddPkn+e/PjLxyWnl0OszIqai9tiYFdjygZpCmV1i3KSMgwAkjHN/kXXnceDw+jQ44KB8
 wkx1tO8gJVQKl5sOpTr829XJNedA+WPfeRiJdr7sHwKnIBasyDlDkFNOdz5pJuvE8aSOdzazr0
 apE+Db/fRIhGSWrpSihrgrR/CDLsnwAusQmm/EAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_031153_804955_6C01E346 
X-CRM114-Status: GOOD (  22.14  )
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
- Use CORESIGHT_DEV_SUBTYPE_SOURCE_BUS type instead of the default
  (CORESIGHT_DEV_SUBTYPE_SOURCE_PROC) so that the test still works even
  when TRBE sinks are registered. This also removes the need for the
  fake CPU ID callback.
- Link to v2: https://lore.kernel.org/r/20250305-james-cs-kunit-test-v2-1-83ba682b976c@linaro.org

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
index 000000000000..87439769207c
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
+	struct coresight_ops_source src_ops = {};
+	struct coresight_ops etm_cs_ops = { .source_ops	= &src_ops };
+
+	etm->type = CORESIGHT_DEV_TYPE_SOURCE;
+	/*
+	 * Don't use CORESIGHT_DEV_SUBTYPE_SOURCE_PROC, that would always return
+	 * a TRBE sink if one is registered.
+	 */
+	etm->subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_BUS;
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


