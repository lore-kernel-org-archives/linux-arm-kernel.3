Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF3CD10DCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qh1QkoQ3W2XAf5pRg9K7JdHn+q4D9FY3pngqj7JhPEA=; b=QxYtaUon/GmSuorMwlcIAd2e2q
	zG1eRPFoQHC6JLITdfINeb4ooZJjslHWI2lTq0jLpyzjxf/niyDMvb7u8disGSQtvIH7TOji5LpAd
	osFq+ZBg7mxAJ5OAB3nAtyiif0UTkX/v5I7L9BvmWI6DvfPtGWKfGNAcsiuhzWZnevjPQn779Kb3s
	zriN8L42hPEfXztDqX07Y0+p/IU1JW9d2Jwku0TvdIglWbhdbaaoZ9WaB4uwZql7WLxppvHmXYfDC
	uDEfVKJfMk+cWh9VFnWgLe7ZMZrGHGQWZfmtdyQ3HkLk9wPFKHymaBO/g7mIC1Fza3hgDzextrGPL
	1CKSe6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2i8-00000005Z6z-0ayp;
	Mon, 02 Dec 2024 09:27:20 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2gB-00000005Ygo-1CcZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 09:25:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Y1yxY6wgfz1T6GY;
	Mon,  2 Dec 2024 17:22:57 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id BF55018001B;
	Mon,  2 Dec 2024 17:25:12 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 2 Dec 2024 17:25:12 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
	<james.clark@linaro.org>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH 4/4] coresight: tmc-etr: Decouple the perf buffer allocation from sysfs mode
Date: Mon, 2 Dec 2024 17:24:19 +0800
Message-ID: <20241202092419.11777-5-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241202092419.11777-1-yangyicong@huawei.com>
References: <20241202092419.11777-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_012519_656679_E8A70BA2 
X-CRM114-Status: GOOD (  14.71  )
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
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 29 ++++++-------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index d382d95da5ff..d8b005d0bf05 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1307,9 +1307,7 @@ EXPORT_SYMBOL_GPL(tmc_etr_get_buffer);
 
 /*
  * alloc_etr_buf: Allocate ETR buffer for use by perf.
- * The size of the hardware buffer is dependent on the size configured
- * via sysfs and the perf ring buffer size. We prefer to allocate the
- * largest possible size, scaling down the size by half until it
+ * Allocate the largest possible size, scaling down the size by half until it
  * reaches a minimum limit (1M), beyond which we give up.
  */
 static struct etr_buf *
@@ -1321,33 +1319,24 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
 	unsigned long size;
 
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
+	size = (unsigned long)nr_pages << PAGE_SHIFT;
+	if (size < TMC_ETR_PERF_MIN_BUF_SIZE)
+		size = TMC_ETR_PERF_MIN_BUF_SIZE;
 
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
2.24.0


