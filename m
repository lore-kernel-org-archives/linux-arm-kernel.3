Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419AACF65F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=361jl3ZBvPce/bZFSyo9F3iPIRY3ChB06KKYWGi1P08=; b=TWL4ryxNIcG9I1+4DAFkuljiu1
	JqCy7WokrjhwlD6HqLG5S+nDzKQYNZzGr9TkWbMRm7w9w8ytxwZWfqmAc9ez4pWiDxUV0/JKFs4OU
	cbW7Dc8luUO5+BI0lnGJKkpq2hNwgwmf6Ofmjh5JnsctNaP8PAerdAOO1IAD3pB4iPYiGeRAeLYxK
	LAfU22M+0n9ARcBxN8gViFH+QMZxaaPaJnHQJ2+SWp5+HS6BSM3JjX+QP+RImvuoxQFAVxGnQ9cQx
	obQ5EKO4WubTVTgG0xdtYe+RJhtZLtndDoqXHHWHaN2wc0HGbWX4mRslhu4cNTR+NHf1rohpHv6rZ
	tHofEveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLoY-0000000CYCL-1bAF;
	Mon, 26 Jan 2026 12:35:30 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLoV-0000000CYAX-0Bwg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:35:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=361jl3ZBvPce/bZFSyo9F3iPIRY3ChB06KKYWGi1P08=;
	b=gkXtVwkesS1P2D2hVqSMKXMD55Dhaypv5o5ehoLZ3vXTu82yrNUDJPWNFfISxN+TnIl1buG9f
	BOgU4GFk1hb/44Vdv9LNBqYouApYmGPDPHjdPHJsyHLqJY42PKJkB3qj0K6QQpdhU6qG7RVjupV
	GVUvp3eG6tFnSGi8bZT/H0o=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f07Ff0zPxz1prMx;
	Mon, 26 Jan 2026 20:31:50 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id DD55E40571;
	Mon, 26 Jan 2026 20:35:18 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Jan 2026 20:35:18 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 26 Jan 2026 20:35:17 +0800
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
Subject: [RFT PATCH 3/7] perf-x86: iostat: Change iostat_prefix() to static
Date: Mon, 26 Jan 2026 20:35:10 +0800
Message-ID: <20260126123514.3238425-4-wangyushan12@huawei.com>
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
X-CRM114-CacheID: sfid-20260126_043527_457400_A8A49BE0 
X-CRM114-Status: GOOD (  13.74  )
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

Change iostat_probe() to static function since it is not used outside.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 tools/perf/arch/x86/util/iostat.c | 44 +++++++++++++++----------------
 tools/perf/util/iostat.c          |  7 -----
 tools/perf/util/iostat.h          |  2 --
 3 files changed, 22 insertions(+), 31 deletions(-)

diff --git a/tools/perf/arch/x86/util/iostat.c b/tools/perf/arch/x86/util/iostat.c
index 7442a2cd87ed..83be505955c8 100644
--- a/tools/perf/arch/x86/util/iostat.c
+++ b/tools/perf/arch/x86/util/iostat.c
@@ -332,6 +332,28 @@ static int iostat_event_group(struct evlist *evl,
 	return ret;
 }
 
+static void iostat_prefix(struct evlist *evlist,
+		   struct perf_stat_config *config,
+		   char *prefix, struct timespec *ts)
+{
+	struct iio_root_port *rp = evlist->selected->priv;
+
+	if (rp) {
+		/*
+		 * TODO: This is the incorrect format in JSON mode.
+		 *       See prepare_timestamp()
+		 */
+		if (ts)
+			sprintf(prefix, "%6lu.%09lu%s%04x:%02x%s",
+				ts->tv_sec, ts->tv_nsec,
+				config->csv_sep, rp->domain, rp->bus,
+				config->csv_sep);
+		else
+			sprintf(prefix, "%04x:%02x%s", rp->domain, rp->bus,
+				config->csv_sep);
+	}
+}
+
 int iostat_prepare(struct evlist *evlist, struct perf_stat_config *config)
 {
 	if (evlist->core.nr_entries > 0) {
@@ -396,28 +418,6 @@ void iostat_release(struct evlist *evlist)
 	}
 }
 
-void iostat_prefix(struct evlist *evlist,
-		   struct perf_stat_config *config,
-		   char *prefix, struct timespec *ts)
-{
-	struct iio_root_port *rp = evlist->selected->priv;
-
-	if (rp) {
-		/*
-		 * TODO: This is the incorrect format in JSON mode.
-		 *       See prepare_timestamp()
-		 */
-		if (ts)
-			sprintf(prefix, "%6lu.%09lu%s%04x:%02x%s",
-				ts->tv_sec, ts->tv_nsec,
-				config->csv_sep, rp->domain, rp->bus,
-				config->csv_sep);
-		else
-			sprintf(prefix, "%04x:%02x%s", rp->domain, rp->bus,
-				config->csv_sep);
-	}
-}
-
 void iostat_print_header_prefix(struct perf_stat_config *config)
 {
 	if (config->csv_output)
diff --git a/tools/perf/util/iostat.c b/tools/perf/util/iostat.c
index b770bd473af7..a68ab100780d 100644
--- a/tools/perf/util/iostat.c
+++ b/tools/perf/util/iostat.c
@@ -37,13 +37,6 @@ __weak void iostat_print_metric(struct perf_stat_config *config __maybe_unused,
 {
 }
 
-__weak void iostat_prefix(struct evlist *evlist __maybe_unused,
-			  struct perf_stat_config *config __maybe_unused,
-			  char *prefix __maybe_unused,
-			  struct timespec *ts __maybe_unused)
-{
-}
-
 __weak void iostat_print_counters(struct evlist *evlist __maybe_unused,
 				  struct perf_stat_config *config __maybe_unused,
 				  struct timespec *ts __maybe_unused,
diff --git a/tools/perf/util/iostat.h b/tools/perf/util/iostat.h
index a4e7299c5c2f..820930a096d9 100644
--- a/tools/perf/util/iostat.h
+++ b/tools/perf/util/iostat.h
@@ -35,8 +35,6 @@ int iostat_parse(const struct option *opt, const char *str,
 		 int unset __maybe_unused);
 void iostat_list(struct evlist *evlist, struct perf_stat_config *config);
 void iostat_release(struct evlist *evlist);
-void iostat_prefix(struct evlist *evlist, struct perf_stat_config *config,
-		   char *prefix, struct timespec *ts);
 void iostat_print_header_prefix(struct perf_stat_config *config);
 void iostat_print_metric(struct perf_stat_config *config, struct evsel *evsel,
 			 struct perf_stat_output_ctx *out);
-- 
2.33.0


