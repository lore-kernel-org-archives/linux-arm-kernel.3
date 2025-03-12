Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E40CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MLNYJfrGVFfqNPfPze2ZbdlHRTv6KQKhBtISRpzv4Gk=; b=KUC9DC85IvsG/YBP2meTGU+4y9
	QFGNeSd6yJAKB83G/JIKQWvzTalJkRUOQYRuB6WkXYA0QUs/uQQnTdFBjGNgXTNrYsfeGTDrBEvqw
	8U0MSzSyghpV1/jubt6wc7RSM5N8j0Ol+ztWc0qAlkrz9i62iLsubYKTqlPuGEEGrPrHs/itdlCRL
	MiNsMSBSM6WRJ7W4LDFQlwk3gdoJvES5k4l11JZ/rOzHIf7ZpA1f4YZki0uznKi8E6tD4gZLsUNwp
	IGfFzO0amhhjIgheYIBXWvzlNcdwW8WlCfetBtPgEIy+asWX4Zi06WsfZWIejdFRNZuor7UrLbDt0
	3M39cK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJPy-000000087Q0-0XRn;
	Wed, 12 Mar 2025 10:34:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJOI-0000000877q-1GqZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:32:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3913d45a148so2802924f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741775563; x=1742380363; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLNYJfrGVFfqNPfPze2ZbdlHRTv6KQKhBtISRpzv4Gk=;
        b=P9U+yT3aCILEs//PrDAgNrWhOxjWAeA+gTUSgvlYIWBdL90qp+bvJGpAQMXBqKT/os
         nOmSrFC379jujAxjGOxT8NwGzDpqcDMxNnHDnh9mZLn4yZkbpCIN5ROubA2Qo364zEen
         wjKr/mMf+ve/TCpLEUOBQFcfrUfONc9stUmWxN29t8J3h17g1UsF3v317v+uH0jIjd00
         jdg/XdZyK5Aak6KQ+6rWWQ8uQW2qzoCwoaCs9/WZP8ff4Ma/ab0i0iouSA7a5ynPYPvS
         WfkWGZps3idolWX9oOhKegRbXxN2GnT+LqOKo3KUBmKyYfy08/SU4ZEW+pSgc1js54Bf
         HXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741775563; x=1742380363;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLNYJfrGVFfqNPfPze2ZbdlHRTv6KQKhBtISRpzv4Gk=;
        b=RxGlgE1dAbS5NBIfPd9xE7xa0Or+FONzXR+vI6ExGPGmD9PNwIaKnjjDYAuoeZbIAh
         8lLZsEA69k6crXDooRYGSWpfKIyCHI02hDMB9SMM5ANll1nfcyFK1un6wEV48pNrMvC4
         0AMEWS2dXsChEN7xg8B3AqBZxQvjvyJtI0ZOxlhNJ3zxHaaNTvs4NoeRNz3YuzV11UlP
         1qDfu4soYbT24B4QBBrgcvIHyGsqpZBpv11J1tlnXOQDh6HnyOnk8/sguRhiVMJnD7pF
         /SZ2lkIf+XYWGq1F8cXv13FqazsKyr9ayKYX4NOuJAymK58KzUrxgrvP4XjNPceWV/qg
         Gs4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn66q1HpRrm/WPnnVgJ0HNa4IkmdahDU90W/YlvBBFSpK07Y6zQ+M1Nf3yKPShn8lWXPqQTaMj0VVpZzUlaX2q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4i4cFG9oA9FdYGkDmupmu0++RZolsJWPrTbDeFFeYUhq8/BVF
	todTc4SxIi8G85yyBJtPeuLDAo5r9mezW07cAoEgsMcxMD/FTajXaStpLz4qvUA=
X-Gm-Gg: ASbGnctTbH2gyZbePawshq5arMVxS54HYhHuruXdYouLtElz/h/j9cJiu06H2okqiCh
	KoSdD1By7+waJXv3nQbPUVhk1+kNaRL6DNVkd6/4Ug4ElEz+yiKiC8bCH2m4fYDUut0R3BKIu76
	1Z0EgCo9Xkm+SFGKkUYtJHL73DL3MfhROz65LycLyA3dmYdDpBCymDqPIauHkFSFAdx5x8hXh+5
	eMGzpSGJiHGMj/tHW/oadZxZuhcv8UqMQmnNIY9tc2HbfgDNzPhVUSxWFA/z6GfQQNHz7R5jwxP
	v8W9iuxr/uXig6IbHookzwjlAcksPQoQdCG4OoyVQpF6dMg=
X-Google-Smtp-Source: AGHT+IFstWyoNbU2Br602U//uo/eIeA/3WTixN2oQDEHm/zr4ekh3UaCUO2yHxeImVG1RDIzlOdHjA==
X-Received: by 2002:a5d:64e4:0:b0:391:4889:5045 with SMTP id ffacd0b85a97d-391488951femr9589432f8f.36.1741775563279;
        Wed, 12 Mar 2025 03:32:43 -0700 (PDT)
Received: from pop-os.lan ([209.198.129.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfca1sm20313128f8f.22.2025.03.12.03.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:32:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Mar 2025 10:31:57 +0000
Subject: [PATCH v4] coresight: Add a KUnit test for
 coresight_find_default_sink()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-james-cs-kunit-test-v4-1-ae3dd718a26a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJxi0WcC/3XOQQ6CMBAF0KuQri3pTKGAK+9hXJRSoIJgWiQaw
 t0tsFCjLv8k//2ZiNPWaEf2wUSsHo0zfedDtAuIqmVXaWoKnwkyjBlnMT3Li3ZUOdrcOjPQQbu
 BcllCUWLEQAvim1erS3Nf1ePJ59q4obePdWSE5bp5iDGISPAsjBGTCChsfKhaaZtDazpp+7C3F
 VmUEV/Nf5+M6I2U51KkmGeJUF8If0MAfyPcI4Uqc5ElnIGAD2Se5yfSVMziNgEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_033246_381346_B3B6F465 
X-CRM114-Status: GOOD (  21.59  )
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
Changes in v4:
- Rename etm to src now that it's not CORESIGHT_DEV_SUBTYPE_SOURCE_PROC
- Remove the now empty src_ops too
- Fix a rebase mistake in the Makefile that removed CTCU
- Link to v3: https://lore.kernel.org/r/20250312-james-cs-kunit-test-v3-1-dcfb69730161@linaro.org

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
 drivers/hwtracing/coresight/Makefile               |  1 +
 drivers/hwtracing/coresight/coresight-core.c       |  1 +
 .../hwtracing/coresight/coresight-kunit-tests.c    | 74 ++++++++++++++++++++++
 4 files changed, 85 insertions(+)

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
index 8e62c3150aeb..4e6ea5b05b01 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -53,3 +53,4 @@ obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
 coresight-ctcu-y := coresight-ctcu-core.o
+obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..47af75ba7a00 100644
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
index 000000000000..c8f361767c45
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
@@ -0,0 +1,74 @@
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
+	 * Source -> ETF -> ETR -> CATU
+	 *                   ^
+	 *                   | default
+	 */
+	struct device *dev = kunit_device_register(test, "coresight_kunit");
+	struct coresight_device *src = coresight_test_device(dev),
+				*etf = coresight_test_device(dev),
+				*etr = coresight_test_device(dev),
+				*catu = coresight_test_device(dev);
+	struct coresight_connection conn = {};
+
+	src->type = CORESIGHT_DEV_TYPE_SOURCE;
+	/*
+	 * Don't use CORESIGHT_DEV_SUBTYPE_SOURCE_PROC, that would always return
+	 * a TRBE sink if one is registered.
+	 */
+	src->subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_BUS;
+	etf->type = CORESIGHT_DEV_TYPE_LINKSINK;
+	etf->subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
+	etr->type = CORESIGHT_DEV_TYPE_SINK;
+	etr->subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
+	catu->type = CORESIGHT_DEV_TYPE_HELPER;
+
+	conn.src_dev = src;
+	conn.dest_dev = etf;
+	coresight_add_out_conn(dev, src->pdata, &conn);
+
+	conn.src_dev = etf;
+	conn.dest_dev = etr;
+	coresight_add_out_conn(dev, etf->pdata, &conn);
+
+	conn.src_dev = etr;
+	conn.dest_dev = catu;
+	coresight_add_out_conn(dev, etr->pdata, &conn);
+
+	KUNIT_ASSERT_PTR_EQ(test, coresight_find_default_sink(src), etr);
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
base-commit: 3eadce8308bc8d808fd9e3a9d211c84215087451
change-id: 20250305-james-cs-kunit-test-3af1df2401e6

Best regards,
-- 
James Clark <james.clark@linaro.org>


