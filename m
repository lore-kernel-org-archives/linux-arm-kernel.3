Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A19CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYS6cUYbaBrYBqtuCBw04MHvPS3IithG0eILiPsNDuE=; b=iPT0z2n6Pu8jVEJPSBnm8c0JGF
	7LqKXjvlQBQiXyyt9+HueLODqHzIpOJQNmMZ3+RaDK8LBuzVcUKXEALtaihK4ZU0063Br2dth665m
	vl4jYB/R2LXINZvvThl08m2XZv6c1N4Ql9RPF5yFNT0o4bHv+3FzlmoPtrq2wo9lLL/VZENSP6fsA
	Qsm/Ge5vCfTlZpknrBJmd4/MdCXg094Rm8YIGhHz/AVdhnwNy0efj1Vn1k7QfX8YCiUmxeKZ3DKmZ
	+ifgdehexGs8F8vjv+r59Q5TwVkZRFdCzHWHfhuGVkuh7qrJCnf6iUkmIR4EU1C4bBrd3KdnxogUr
	7R/HuXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInO1-000000079sd-1d1T;
	Tue, 11 Nov 2025 12:22:13 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInNu-000000079pF-1kQT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:22:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JYS6cUYbaBrYBqtuCBw04MHvPS3IithG0eILiPsNDuE=;
	b=D3yIxMCddptLlUBQdnNB3tKYWITzCH5GN1PsjoPQafWeO0bEDwgm7eIQQcA8Voh0hhYxxs2EA
	uMe8Cg/nwZuMsYI1RTpL2djHxJdO+IfZQNXoTdZYA3EEtwZAB5kXBDI8Er+CADpOi8Hd/Wpk30K
	Gs5qeHh+i59TzQfVyzTjO9Q=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4d5QbB4N9Nzcb16;
	Tue, 11 Nov 2025 20:20:06 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 7AE75180B5A;
	Tue, 11 Nov 2025 20:21:54 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Nov 2025 20:21:54 +0800
Received: from localhost.localdomain (10.50.163.32) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Nov 2025 20:21:52 +0800
From: Junhao He <hejunhao3@h-partners.com>
To: <suzuki.poulose@arm.com>, <james.clark@linaro.org>,
	<anshuman.khandual@arm.com>, <yeoreum.yun@arm.com>, <mike.leach@linaro.org>,
	<leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@h-partners.com>
Subject: [PATCH v4 3/3] coresight: tmc: Decouple the perf buffer allocation from sysfs mode
Date: Tue, 11 Nov 2025 20:21:49 +0800
Message-ID: <20251111122149.1981162-4-hejunhao3@h-partners.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251111122149.1981162-1-hejunhao3@h-partners.com>
References: <20251111122149.1981162-1-hejunhao3@h-partners.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_042206_894695_899A7BC7 
X-CRM114-Status: GOOD (  15.22  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Currently the perf buffer allocation follows the below logic:
- if the required AUX buffer size if larger, allocate the buffer with
  the required size
- otherwise allocate the size reference to the sysfs buffer size

This is not useful as we only collect to one AUX data, so just try to
allocate the buffer match the AUX buffer size.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Link: https://lore.kernel.org/linux-arm-kernel/df8967cd-2157-46a2-97d9-a1aea883cf63@arm.com/
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Junhao He <hejunhao3@huawei.com>
Signed-off-by: Junhao He <hejunhao3@h-partners.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 30 ++++++-------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index fe1d5e8a0d2b..c2ba004a25fe 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1327,9 +1327,7 @@ EXPORT_SYMBOL_GPL(tmc_etr_get_buffer);
 
 /*
  * alloc_etr_buf: Allocate ETR buffer for use by perf.
- * The size of the hardware buffer is dependent on the size configured
- * via sysfs and the perf ring buffer size. We prefer to allocate the
- * largest possible size, scaling down the size by half until it
+ * Allocate the largest possible size, scaling down the size by half until it
  * reaches a minimum limit (1M), beyond which we give up.
  */
 static struct etr_buf *
@@ -1338,36 +1336,26 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
 {
 	int node;
 	struct etr_buf *etr_buf;
-	unsigned long size;
+	ssize_t size;
 
 	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
-	/*
-	 * Try to match the perf ring buffer size if it is larger
-	 * than the size requested via sysfs.
-	 */
-	if ((nr_pages << PAGE_SHIFT) > drvdata->size) {
-		etr_buf = tmc_alloc_etr_buf(drvdata, ((ssize_t)nr_pages << PAGE_SHIFT),
-					    0, node, NULL);
-		if (!IS_ERR(etr_buf))
-			goto done;
-	}
+
+	/* Use the minimum limit if the required size is smaller */
+	size = nr_pages << PAGE_SHIFT;
+	size = max_t(ssize_t, size, TMC_ETR_PERF_MIN_BUF_SIZE);
 
 	/*
-	 * Else switch to configured size for this ETR
-	 * and scale down until we hit the minimum limit.
+	 * Try to allocate the required size for this ETR, if failed scale
+	 * down until we hit the minimum limit.
 	 */
-	size = drvdata->size;
 	do {
 		etr_buf = tmc_alloc_etr_buf(drvdata, size, 0, node, NULL);
 		if (!IS_ERR(etr_buf))
-			goto done;
+			return etr_buf;
 		size /= 2;
 	} while (size >= TMC_ETR_PERF_MIN_BUF_SIZE);
 
 	return ERR_PTR(-ENOMEM);
-
-done:
-	return etr_buf;
 }
 
 static struct etr_buf *
-- 
2.33.0


