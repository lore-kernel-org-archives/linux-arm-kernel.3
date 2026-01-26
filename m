Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C94ACF65F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyxGEjK43IBO809vlSyubk6zG/VpmcHMAUt9BPPqHyU=; b=i3oCuVYOdisCAvv85nsvxpfTdC
	/S3bd4Lt6XbRSuWBh7Ww8ojmbebaghfSBD/91gOGjkwnnjdWJnO1TX4nUrD3tLvGmaJnxs9HjujWV
	gJT0oJ8RV7/iUefgOFBroQfVA9AeiJXwOqDEnUm20kWdFd7ombKHNHKSTeFwtJDfZSS7POWLlSDmQ
	8T1SL2SLsTHNF6Y2n55lp5d5Z7DozG1TXX2FJgZ5pBWnBRsaWVv4/ReHXZMHHJa4qSyLBLZrjSPMR
	eRgoi8JjRxzTNnzYF4RZV99eiFW5gZ3CAtHVDycipqwra3lQA02iMFbbU6YXnXCodnXlkNouux+Fw
	91ah5eoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLoi-0000000CYGT-0CEc;
	Mon, 26 Jan 2026 12:35:40 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLoW-0000000CYAW-00J6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:35:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nyxGEjK43IBO809vlSyubk6zG/VpmcHMAUt9BPPqHyU=;
	b=2okf4cl24LZ2DZGjdWeM2ZtyXvXfg46WQGyT+boldFUrZbFVOT2XNyzdmYj0m7hN/waIPvVjc
	qRD/B6OCIlJmxA0u0nA5uRSqE0zdX3lWWlCyfURFMaEK+QZkjjFqjeg65/ykE5aybU4Hdy7+Pji
	E+3uv2ipUwKMNWNl/hOGeh8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f07Fg6gjlzLlXY;
	Mon, 26 Jan 2026 20:31:51 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 29AB14048B;
	Mon, 26 Jan 2026 20:35:18 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Jan 2026 20:35:17 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 26 Jan 2026 20:35:16 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <mike.leach@linaro.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <peterz@infradead.org>,
	<john.g.garry@oracle.com>, <Jonathan.Cameron@huawei.com>,
	<shiju.jose@huawei.com>, <will@kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RFT PATCH 2/7] perf stat: Save unnecessary print_metric() call
Date: Mon, 26 Jan 2026 20:35:09 +0800
Message-ID: <20260126123514.3238425-3-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260126123514.3238425-1-wangyushan12@huawei.com>
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_043528_209693_7105A702 
X-CRM114-Status: GOOD (  11.51  )
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

Patch [1] removed the second branch of iostat_run, and changed num to 0
since it is the default behavior. But during iostat_run, default value 1
of num is required to avoid print_metric() call later.

Set num as 1 to avoid redundant print_metric() call that causes
unaligned blank printed.

Fixes: b71f46a6a708 ("perf stat: Remove hard coded shadow metrics")

[1]: https://lore.kernel.org/all/20251111212206.631711-8-irogers@google.com/

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 tools/perf/util/stat-shadow.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index 9c83f7d96caa..9439baf8002f 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -319,8 +319,10 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
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


