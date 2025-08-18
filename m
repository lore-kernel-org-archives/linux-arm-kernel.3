Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A546ECA0EF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1cKJg1leAQkn5SFZ03cksxBCadmm+87j/rc7N/GKAM=; b=jr1QDfMkznCKEYgx6ww5Zy5NBm
	jb7K2odBdlOQVzs6PQ2+7wtymOw/qn2V0uGp4i/PGultTZWx7ifaqzwUizUJMNHJ7Wu6vXN/e2Ctc
	s/HxwY71vTTyxWoa51lc51oqQuf5zFzxA8wGMOH027c/3DQUt63gDAJdm2gMy3QV5ozC7oXOdddx7
	71Iww32twEvCipWYtTvnmia0haoUUEmUbJbUM28KSPEzOXRlGkkozAmXuA61Jbxm3kryOGzR8ghiU
	DEhgdEoip/TkGZRbIuwgoDHMXbehYJLTNAwMyG/2eoewHSBxoe8OIes70FcXCw/CHJV6FM2Do2Xpk
	Fn0F68lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03E-00000007Tug-2bnr;
	Mon, 18 Aug 2025 13:37:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unut8-00000006uRQ-0kHk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 08:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g1cKJg1leAQkn5SFZ03cksxBCadmm+87j/rc7N/GKAM=; b=Ls9Grk/kr3/iFpNucdw1nVhHfy
	DiwqUVrRfsvNLyFm2HGyL5VF0s7tovZNjq4xttqGA4A0ipxOVkSKY/FAKVhatCjSV+MfliC52lG/B
	JbF17iLfIRpHp5LnpMRqtqftC1tErbu8kZLPasik516tc2HlhOvnPoMOafAg9/XifXHHMw7YQ393J
	ty0yrAEzy5sKmr/grUOl0T/ZL+P9XxHjfL0fY9/36YXzkETo5RshQBSmeoAfEBLpSKnwPyjFuUMh0
	PVo8tSDB8U2YQomLi6q5QhRyY5tuOySn/Lubw1yxn/3sI33sjRMrLpN+D1CAJjb2S+u183kXa6hUn
	321HPN8w==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unut4-0000000HJVN-0YFP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:06:41 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4c550X2DM3z3TqcJ;
	Mon, 18 Aug 2025 16:07:08 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EC60140259;
	Mon, 18 Aug 2025 16:06:03 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 16:06:03 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 16:06:02 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>, <leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>
Subject: [PATCH v3 3/3] coresight: tmc: Decouple the perf buffer allocation from sysfs mode
Date: Mon, 18 Aug 2025 16:06:00 +0800
Message-ID: <20250818080600.418425-4-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250818080600.418425-1-hejunhao3@huawei.com>
References: <20250818080600.418425-1-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_090639_089698_536548E2 
X-CRM114-Status: GOOD (  15.29  )
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
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 30 ++++++-------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 06c74717be19..af12d6b98030 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1344,9 +1344,7 @@ EXPORT_SYMBOL_GPL(tmc_etr_get_buffer);
 
 /*
  * alloc_etr_buf: Allocate ETR buffer for use by perf.
- * The size of the hardware buffer is dependent on the size configured
- * via sysfs and the perf ring buffer size. We prefer to allocate the
- * largest possible size, scaling down the size by half until it
+ * Allocate the largest possible size, scaling down the size by half until it
  * reaches a minimum limit (1M), beyond which we give up.
  */
 static struct etr_buf *
@@ -1355,36 +1353,26 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
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


