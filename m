Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4B3C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0tUPLfk0qB9TEQDgsmyN9s8JFQ0WNrnYmkvAH5dfIO0=; b=3MFyB0YWE9BL139qFffwggDXDi
	yOuyeCbrMSlXMRZYZmndfo9wz9jm2P4Uj3ugrJAzIhbUt/riOamG0Fc95r3YOWqQNj88gjRnPLfm0
	HZeQCqFC/o/dWggCx1cZRBjcd4aG3vbbjH6SKZ4Xy6yeXXn3KM9ZWVRM4OZFEBEb/UZvBLWpnXW/L
	+FMEAOKFrUB+5Lz5zEtyLz5ZjI17+Kp+hOMYMcEROO2VlguPlVZzJGaaShcXjCg5GSChBRF/I3aQa
	60rWVuilyS6gCsVzIVkebS+4mJ9b4OqL5+EqSA74Kf8SxcIgIp/4OthKy8JsBW2e58vtZwFHtRqZL
	EMwoPs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9dh-0000000Fd7x-1iHv;
	Fri, 24 Jul 2026 06:44:09 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9dd-0000000Fd74-2Oms
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:44:08 +0000
X-UUID: 08186bd8872b11f1aa26b74ffac11d73-20260724
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ef21e5e6-9b74-4a55-af3f-0237518c86a9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:75935e37cc42a9d55808542a3ac3b1d0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 08186bd8872b11f1aa26b74ffac11d73-20260724
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1917070976; Fri, 24 Jul 2026 14:43:51 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH] coresight: Handle errors in KUnit test setup
Date: Fri, 24 Jul 2026 14:43:46 +0800
Message-Id: <20260724064346.2440065-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_234405_909728_D936D69B 
X-CRM114-Status: GOOD (  10.17  )
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

kunit_device_register() returns an error pointer when device setup fails,
and the devm allocations can return NULL. test_default_sink() currently
uses all three results unconditionally, so setup failures are reported as
unrelated crashes.

Assert that device registration and both allocations succeeded before
constructing the test topology. Fatal KUnit assertions stop the test while
the managed resources are released during cleanup.

Fixes: b104a941a94e ("coresight: Add a KUnit test for coresight_find_default_sink()")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 .../coresight/coresight-kunit-tests.c          | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-kunit-tests.c b/drivers/hwtracing/coresight/coresight-kunit-tests.c
index c8f361767c45..a4e55bc9dc4c 100644
--- a/drivers/hwtracing/coresight/coresight-kunit-tests.c
+++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
@@ -6,14 +6,18 @@
 
 #include "coresight-priv.h"
 
-static struct coresight_device *coresight_test_device(struct device *dev)
+static struct coresight_device *coresight_test_device(struct kunit *test,
+						      struct device *dev)
 {
 	struct coresight_device *csdev = devm_kcalloc(dev, 1,
 						     sizeof(struct coresight_device),
 						     GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, csdev);
+
 	csdev->pdata = devm_kcalloc(dev, 1,
 				   sizeof(struct coresight_platform_data),
 				   GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, csdev->pdata);
 	return csdev;
 }
 
@@ -25,12 +29,16 @@ static void test_default_sink(struct kunit *test)
 	 *                   | default
 	 */
 	struct device *dev = kunit_device_register(test, "coresight_kunit");
-	struct coresight_device *src = coresight_test_device(dev),
-				*etf = coresight_test_device(dev),
-				*etr = coresight_test_device(dev),
-				*catu = coresight_test_device(dev);
+	struct coresight_device *src, *etf, *etr, *catu;
 	struct coresight_connection conn = {};
 
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	src = coresight_test_device(test, dev);
+	etf = coresight_test_device(test, dev);
+	etr = coresight_test_device(test, dev);
+	catu = coresight_test_device(test, dev);
+
 	src->type = CORESIGHT_DEV_TYPE_SOURCE;
 	/*
 	 * Don't use CORESIGHT_DEV_SUBTYPE_SOURCE_PROC, that would always return
-- 
2.25.1


