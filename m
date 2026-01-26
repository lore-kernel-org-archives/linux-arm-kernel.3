Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB32CCF65F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh7I96I1Ye56LgCNCTflwomet+0JXYgpPPw8AKqRQrY=; b=PgHBqVARPdKyWCq5ifhfvx/kWH
	rF5IVdvE0Y2hGYQ2f+eoTU8AHResZUeaPAe7S6xyg4oWemmb8YkAMNWZxZYlesOcEe2Wwj9zlpscd
	q8NM2yY1Iuw/tiUMVyLbZ6n+TVI2wM2a8qKxFTltiyPkBROvpsi3oGZu3tzMqj1Bm++Zsa/e75gc+
	K+/mbP/LPVKqjZoVMFEhX7se5He/Jf0lB0N5wTP3skGfCyFyxIs2nr9VHs76o2gMwp134v0t6q63L
	GVphJksNr5MA0NdBR4aCH57xwzHigs+P+cJJpKMCI7XVIVrR4VDmPYtw/rlhvkEs4VY6xC9/J9TRw
	WMWb8XCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLoh-0000000CYG3-36rI;
	Mon, 26 Jan 2026 12:35:39 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLoW-0000000CYAY-0Xbm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:35:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Rh7I96I1Ye56LgCNCTflwomet+0JXYgpPPw8AKqRQrY=;
	b=PcLFxT4BZfMrO4YwTr9I1st2Bw+UPdUyFjLgMqwsMUdByDNkY2wiDFrfB2lD7rVFPMYpdqfY2
	19E6751n77Fo8boc6i1fSgEz/XGU9p+x9Rh90RQDPOJrrwLNODsJ1KJQmv6iBg/GC8PsiaaMct/
	0EwnkU1645kK7Qmp3uXOjT8=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f07Dt5sYszcb29;
	Mon, 26 Jan 2026 20:31:10 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 5381C4056A;
	Mon, 26 Jan 2026 20:35:17 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
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
Subject: [RFT PATCH 1/7] perf stat: Check color's length instead of the pointer
Date: Mon, 26 Jan 2026 20:35:08 +0800
Message-ID: <20260126123514.3238425-2-wangyushan12@huawei.com>
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
X-CRM114-CacheID: sfid-20260126_043528_545350_18FF13E6 
X-CRM114-Status: GOOD (  11.58  )
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

Color string returned by metric_threshold_classify__color() is never
NULL, check the presence of *color will always return true.

Fix this by change the checks against length of *color.

Fixes: 37b77ae95416 ("perf stat: Change color to threshold in print_metric")

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 tools/perf/builtin-script.c    | 2 +-
 tools/perf/util/stat-display.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 62e43d3c5ad7..9fe90f564c69 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2100,7 +2100,7 @@ static void script_print_metric(struct perf_stat_config *config __maybe_unused,
 	perf_sample__fprintf_start(NULL, mctx->sample, mctx->thread, mctx->evsel,
 				   PERF_RECORD_SAMPLE, mctx->fp);
 	fputs("\tmetric: ", mctx->fp);
-	if (color)
+	if (strlen(color))
 		color_fprintf(mctx->fp, color, fmt, val);
 	else
 		printf(fmt, val);
diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index 6d02f84c5691..91c0c1020f4e 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -474,7 +474,7 @@ static void print_metric_std(struct perf_stat_config *config,
 		do_new_line_std(config, os);
 
 	n = fprintf(out, " # ");
-	if (color)
+	if (strlen(color))
 		n += color_fprintf(out, color, fmt, val);
 	else
 		n += fprintf(out, fmt, val);
@@ -607,7 +607,7 @@ static void print_metric_only(struct perf_stat_config *config,
 	if (mlen < strlen(unit))
 		mlen = strlen(unit) + 1;
 
-	if (color)
+	if (strlen(color))
 		mlen += strlen(color) + sizeof(PERF_COLOR_RESET) - 1;
 
 	color_snprintf(str, sizeof(str), color ?: "", fmt ?: "", val);
-- 
2.33.0


