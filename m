Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF484E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7BNxMzvyJQq1OSf1JXsrJtur5eicGSEc5DxJyV8C/PE=; b=WZTWOBmM26xsr56KTbQx4nFEMz
	ySeQsUSDiqg+WdIsl87vjA5SlS9F8pk+q4NONpNdKxY9Q9qVPzZFMthEp7ika2lvCVMGUNyug3Bfx
	BYbGuNSRvbDUREMBNtStojX8fbaVR1jHeGJE/K+xw/z+TkURbK259uqD4oyhtQ4QvzNN+yJfYD+KA
	UIkHaKtlxaueDLalbWxvwLwT/S0CAL4SEL9cBihB2RkjO1RU9EJHvkd5EGEddv5I+OZed9y/f4PbY
	3KqE3KR8GSwboCzr/Jx4m83S1TkpC6wRykfhlLSZiFdqBm4oA6tCT5VIxlgKksiYH03tTLEazrD8s
	sVYl0RxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNb8o-0000000EIHJ-1pWW;
	Tue, 17 Dec 2024 17:13:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNb7i-0000000EI7I-26lZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:12:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso54478895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 09:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734455561; x=1735060361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BNxMzvyJQq1OSf1JXsrJtur5eicGSEc5DxJyV8C/PE=;
        b=sbpjsBZ9zdcll8YTeogPb5aK7H+U964CnNItdZGwUvaxBm+RIDqR/BQnlvU4dnZEbQ
         +ZPwBxS63TZJQd3Svcwmj3tNac9Q7ZFgzHmwaOgR9cIbKLLrWR3/1/GGyz2+Z+UX+dBO
         QFqOrEuKAHfIE6eZ2xi6DUQAlt0MYYkspcNpsV0bVOoY9hBFM9Svmm4DNAvZR9yAemFz
         rLp4pceoj5rvnVsW47i5WwAccN4I814Le3vLTw0oTxioXcKDu0iyBCEnBcxuMDSjFEM6
         F8FmFSt7N0/FPxoGXleMEpDaaaGSJ/Powd3NoWWeqyGsBBE8JOs2egqTqe6SucwPxL5L
         AT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734455561; x=1735060361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BNxMzvyJQq1OSf1JXsrJtur5eicGSEc5DxJyV8C/PE=;
        b=jkawDsHRI83qDujFbLcNqNgNWKXLO38gbGBoGzM51NR7giW1kfejpHgfq3jjwASRcn
         NPX7N9qo9uduzsLli7siVltdCyZtKVLWejJNwgGUImeZEiQ9Mrylpna3PaTxVJCqcaho
         NzQ126dIFtLQhW92zgO3t1hyi5a1ZkqvmYx3ZevDwFPu7sv3nIpvEg1o95g+4gZId48C
         1C/fT+TXo804NAv57aVqZgyg2ZtK3kNgcOAnrlk1/XvTcUWHNEj+wEGye3M7UYnYSM//
         uuK9NrqLftVSJAvXiVI7i0OWqqnT1hwP9WeKS7or8gO7cv1mxihD2B61aNtPUksujdDw
         rhnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdDc7KFKNuV9SIiXNsuYZze1Fd7hxSb9EFHNyLTQxg9KU0Y3KLJJBJvcKy/gprT+BaZCxPH5QvhVB9nBgGvq41@lists.infradead.org
X-Gm-Message-State: AOJu0YzdUrOkRlwbpiAJNAWKnzAG5lXZvH1QVTnXMI5eH40PlmPZ90S6
	K0PatO07a2yDNXIeShivG2JUx1ephqY/CYZ5+cHOpeDFmrK6Bb0RD6fK+nPuZi4=
X-Gm-Gg: ASbGncvSB/jE1nvhZKbq7eoUEQE16IHKeSHocOv5A73u1xKN/tjlgsObdNZ8Gf1k97c
	WdWFl/ZpyWduaddIrW8mnXL1M+Jrx+Wx/eb/goMOT6eP4hmZtdspw+nBJGuS/khK4XAVHP3W570
	tst2WlDVJN+kfikiWyr+zGFX8BrI8BMVvbI3kF359LFpljjznQEL6QOlBCKqW9NKQgQEX79fJvH
	wYe/j+Q497drVpLfnEvoq1XnewFgekNVA9L/PdKMuW4mVcrbaXmV1EV
X-Google-Smtp-Source: AGHT+IGSiqAXtYo/k8MN0k8v0TOiO3K7Mj9/v3WC0hPOafHJZMJVxrDNJwoO8nu2w8km+EC2EBgFBQ==
X-Received: by 2002:a05:600c:1e0d:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-4362aa27057mr155476905e9.4.1734455560865;
        Tue, 17 Dec 2024 09:12:40 -0800 (PST)
Received: from pop-os.. ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4363601574bsm122566915e9.7.2024.12.17.09.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 09:12:40 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org,
	scclevenger@os.amperecomputing.com
Cc: yeoreum.yun@arm.com,
	James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] coresight: Add a KUnit test for coresight_find_default_sink()
Date: Tue, 17 Dec 2024 17:11:31 +0000
Message-Id: <20241217171132.834943-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_091242_552951_F40E96BF 
X-CRM114-Status: GOOD (  17.66  )
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
 drivers/hwtracing/coresight/Kconfig           |  9 ++
 drivers/hwtracing/coresight/Makefile          |  1 +
 drivers/hwtracing/coresight/coresight-core.c  |  1 +
 .../coresight/coresight-kunit-tests.c         | 90 +++++++++++++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-kunit-tests.c

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 06f0a7594169..056d04bc540a 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -247,4 +247,13 @@ config CORESIGHT_DUMMY
 
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
index 4ba478211b31..c170a41b3056 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
+obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ea38ecf26fcb..ce63b68d5503 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -869,6 +869,7 @@ coresight_find_default_sink(struct coresight_device *csdev)
 	}
 	return csdev->def_sink;
 }
+EXPORT_SYMBOL_GPL(coresight_find_default_sink);
 
 static int coresight_remove_sink_ref(struct device *dev, void *data)
 {
diff --git a/drivers/hwtracing/coresight/coresight-kunit-tests.c b/drivers/hwtracing/coresight/coresight-kunit-tests.c
new file mode 100644
index 000000000000..d022bacc8357
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
@@ -0,0 +1,90 @@
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
+static void coresight_free_test_device(struct device *dev,
+				       struct coresight_device *csdev)
+{
+	devm_kfree(dev, csdev->pdata->out_conns);
+	devm_kfree(dev, csdev->pdata);
+	devm_kfree(dev, csdev);
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
+
+	coresight_free_test_device(dev, etm);
+	coresight_free_test_device(dev, etf);
+	coresight_free_test_device(dev, etr);
+	coresight_free_test_device(dev, catu);
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
-- 
2.34.1


