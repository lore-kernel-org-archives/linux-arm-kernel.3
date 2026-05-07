Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B90CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 06:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vylduoRqDFT0UfMrXqN7Cq3Y6aHaFoZdwPyFBkNlNc=; b=lTbtIxbnXeo7dShs+wBy4BgErn
	thbqCCabjDtn6Nz/Cyj0fMFZCa9steQf5ktlSTuhlOHPqZyku4sw78yMJYfw2eauK0muNPJ/5ImFc
	U88Z5N7NeWuN9SoXbkzNnFstKLCDoxrxUdCBapLjAjBCRrWFoZHe4jLb04Oq4qU+g8y33PZYiwQ+w
	v6Pal3afdSZrkMoOpXjkMjqmUYBBAYSxbwBl1rzrCFPk8mWLpPQZyuE55p5/XEuRNBRgJ5PZ3XIj9
	kRS+ACRzt0I0J3V5b5+qD333YQoRsN3ax8KVJeDVmw8gzo/7duxYCsU6K9fw2k1XnbISeGZya2gsl
	39ec2DAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMm-00000002uiR-3CBL;
	Thu, 07 May 2026 06:37:48 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMl-00000002ufJ-0wv6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 06:37:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7vylduoRqDFT0UfMrXqN7Cq3Y6aHaFoZdwPyFBkNlNc=;
	b=SF/6BwytKNbEng1rjg9RClqKxkiniUMzMR7duX9fWb1/Z4m8nFu4+Q6D1ixRo24BKb5lmMXah
	Qfi5iqGThupAa5s9yDTunjXoN2Hz7myl89mOhD2ebidVKp/N5PWuMvjeKQnBBD5dXUXR1OIiqP5
	MgKI5fAyKsE1XgOQaSgXJ1o=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gB2ST0t05zpSx8;
	Thu,  7 May 2026 14:30:49 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id D10AC40561;
	Thu,  7 May 2026 14:37:39 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 May 2026 14:37:39 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 7 May 2026 14:37:38 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <james.clark@arm.com>,
	<john.g.garry@oracle.com>, <will@kernel.org>, <mike.leach@arm.com>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jic23@kernel.org>, <leo.yan@linux.dev>, <robin.murphy@arm.com>,
	<linuxarm@huawei.com>, <hejunhao3@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RFT PATCH v2 2/7] perf stat: Save unnecessary print_metric() call
Date: Thu, 7 May 2026 14:37:32 +0800
Message-ID: <20260507063737.3542950-3-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260507063737.3542950-1-wangyushan12@huawei.com>
References: <20260507063737.3542950-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_233747_577737_2CCCB425 
X-CRM114-Status: GOOD (  11.41  )
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

The patch listed under Fixes removed the other branch of iostat_run, and
changed num to 0 since it is the default behavior of it. But during
iostat_run, default value 1 of num is required to avoid print_metric()
call later.

Set num as 1 to avoid redundant print_metric() call that causes
unaligned blank printed.

Before this patch:

root@localhost$ ./perf stat --iostat=0000:20:0f.0 --timeout 100

 Performance counter stats for 'system wide':

    port              Inbound MWR(MB)      Inbound MRD(MB)      Inbound CPL(MB)     Outbound MWR(MB)     Outbound MRD(MB)     Outbound CPL(MB)
0000:20:0f.0                 0.00                                      0.00                                      0.00                                      0.00                                      0.00
                            0.01

       0.100138030 seconds time elapsed

After this patch:

root@localhost$ ./perf stat --iostat=0000:20:0f.0 --timeout 100

 Performance counter stats for 'system wide':

    port              Inbound MWR(MB)      Inbound MRD(MB)      Inbound CPL(MB)     Outbound MWR(MB)     Outbound MRD(MB)     Outbound CPL(MB)
0000:20:0f.0                 0.00                 0.00                 0.00                 0.00                 0.00                 0.01

       0.100127590 seconds time elapsed

Fixes: b71f46a6a708 ("perf stat: Remove hard coded shadow metrics")
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 tools/perf/util/stat-shadow.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index bc2d44df7baf..0056444523d6 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -326,8 +326,10 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
 	void *ctxp = out->ctx;
 	int num = 0;
 
-	if (config->iostat_run)
+	if (config->iostat_run) {
 		iostat_print_metric(config, evsel, out);
+		num = 1;
+	}
 
 	perf_stat__print_shadow_stats_metricgroup(config, evsel, aggr_idx,
 						  &num, NULL, out);
-- 
2.33.0


