Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D440CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 06:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0ggBqVmcw6Sz5ULd2AGvpHsgqkgVFigalO47pfKWvo=; b=NKgIeJNLzQid1/CmiiLgC/920g
	NLtbZvndBdhnFUMtiXx7PRzjYgc0py29+06fz8i8VTYcGIDcxT7QsXKtaJJi1TR7aLML9CQ209VnA
	Nql80oXSh2K20mNw4PtrRvmpl0BcBgGU7vN2eUVUMQUdDyk1OCQjQB2rwOR/YzgxQchpaRIQbIdGx
	Z14qVUQXir8n0G1NkciZJu6JBM1ohiuhZHmxdPpE0CYHHa/4NC1LdOnAdCC4wC4MSdM9f26O74iGi
	97wbI7dAJc5ZQoqBEzyKRbxs4o/wFVh230dIniBGa+O4jtuEky/Bfmfz0Vn0HqG0RzugRj5ql6vga
	zGkho4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMp-00000002uk5-0Z2E;
	Thu, 07 May 2026 06:37:51 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMl-00000002ufY-1q1X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 06:37:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=a0ggBqVmcw6Sz5ULd2AGvpHsgqkgVFigalO47pfKWvo=;
	b=jOq507Nx+rCyT+fTYeHHq2e9Y57CJKlJkuJ+HlX/j7LX+vFjmh0l9Rtxct0NVhgeYkjzkF/md
	+QgTElBZEAN0kIocDOFdInP0KEQA+OVU6tv2/pH4plc6H7XLbzETBDXkB7a+O7ZiDkQHC91xOs1
	FbfpmPXaZU2LgZjSvWV3/nA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gB2SW5s33zpSxL;
	Thu,  7 May 2026 14:30:51 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 8876C4056A;
	Thu,  7 May 2026 14:37:42 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 May 2026 14:37:42 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 7 May 2026 14:37:41 +0800
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
Subject: [RFT PATCH v2 6/7] perf-iostat: Make x86 iostat compatible with new iostat framework
Date: Thu, 7 May 2026 14:37:36 +0800
Message-ID: <20260507063737.3542950-7-wangyushan12@huawei.com>
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
X-CRM114-CacheID: sfid-20260506_233748_161541_9C7BF67D 
X-CRM114-Status: GOOD (  15.14  )
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

From: Shiju Jose <shiju.jose@huawei.com>

Change the original x86 iio iostat supporter to be compatible with the
set of iostat frameworks.

The matching function of x86 iio may not be correct.

Signed-off-by: Shiju Jose  <shiju.jose@huawei.com>
Co-developed-by: Yushan Wang <wangyushan12@huawei.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 tools/perf/util/iostat.c     | 26 +++++++--------
 tools/perf/util/x86-iostat.c | 62 ++++++++++++++++++++++++++----------
 2 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/tools/perf/util/iostat.c b/tools/perf/util/iostat.c
index 90607d1cf3fa..6c51f4a521af 100644
--- a/tools/perf/util/iostat.c
+++ b/tools/perf/util/iostat.c
@@ -13,7 +13,7 @@ static struct iostat_pmu *iostat_pmu;
 
 enum iostat_mode_t iostat_mode = IOSTAT_NONE;
 
-__weak int iostat_prepare(struct evlist *evlist, struct perf_stat_config *config)
+int iostat_prepare(struct evlist *evlist, struct perf_stat_config *config)
 {
 	if (!iostat_pmu)
 		return -1;
@@ -21,7 +21,7 @@ __weak int iostat_prepare(struct evlist *evlist, struct perf_stat_config *config
 	return iostat_pmu->prepare(evlist, config);
 }
 
-__weak int iostat_parse(const struct option *opt, const char *str, int unset)
+int iostat_parse(const struct option *opt, const char *str, int unset)
 {
 	if (!iostat_pmu)
 		return -1;
@@ -29,33 +29,33 @@ __weak int iostat_parse(const struct option *opt, const char *str, int unset)
 	return iostat_pmu->parse(opt, str, unset);
 }
 
-__weak void iostat_list(struct evlist *evlist, struct perf_stat_config *config)
+void iostat_list(struct evlist *evlist, struct perf_stat_config *config)
 {
 	iostat_pmu->list(evlist, config);
 }
 
-__weak void iostat_release(struct evlist *evlist)
+void iostat_release(struct evlist *evlist)
 {
 	iostat_pmu->release(evlist);
 }
 
-__weak void iostat_print_header_prefix(struct perf_stat_config *config)
+void iostat_print_header_prefix(struct perf_stat_config *config)
 {
 	iostat_pmu->print_header_prefix(config);
 }
 
-__weak void iostat_print_metric(struct perf_stat_config *config,
-				struct evsel *evsel,
-				struct perf_stat_output_ctx *out)
+void iostat_print_metric(struct perf_stat_config *config,
+			 struct evsel *evsel,
+			 struct perf_stat_output_ctx *out)
 {
 	iostat_pmu->print_metric(config, evsel, out);
 }
 
-__weak void iostat_print_counters(struct evlist *evlist,
-				  struct perf_stat_config *config,
-				  struct timespec *ts, char *prefix,
-				  iostat_print_counter_t print_cnt_cb,
-				  void *arg)
+void iostat_print_counters(struct evlist *evlist,
+			   struct perf_stat_config *config,
+			   struct timespec *ts, char *prefix,
+			   iostat_print_counter_t print_cnt_cb,
+			   void *arg)
 {
 	iostat_pmu->print_counters(evlist, config, ts, prefix,
 				   print_cnt_cb, arg);
diff --git a/tools/perf/util/x86-iostat.c b/tools/perf/util/x86-iostat.c
index f8d4c9718594..778655cbc2a0 100644
--- a/tools/perf/util/x86-iostat.c
+++ b/tools/perf/util/x86-iostat.c
@@ -332,9 +332,9 @@ static int iostat_event_group(struct evlist *evl,
 	return ret;
 }
 
-static void iostat_prefix(struct evlist *evlist,
-			  struct perf_stat_config *config,
-			  char *prefix, struct timespec *ts)
+static void iio_iostat_prefix(struct evlist *evlist,
+			      struct perf_stat_config *config,
+			      char *prefix, struct timespec *ts)
 {
 	struct iio_root_port *rp = evlist->selected->priv;
 
@@ -354,7 +354,7 @@ static void iostat_prefix(struct evlist *evlist,
 	}
 }
 
-int iostat_prepare(struct evlist *evlist, struct perf_stat_config *config)
+static int iio_iostat_prepare(struct evlist *evlist, struct perf_stat_config *config)
 {
 	if (evlist->core.nr_entries > 0) {
 		pr_warning("The -e and -M options are not supported."
@@ -371,8 +371,8 @@ int iostat_prepare(struct evlist *evlist, struct perf_stat_config *config)
 	return iostat_event_group(evlist, root_ports);
 }
 
-int iostat_parse(const struct option *opt, const char *str,
-		 int unset __maybe_unused)
+static int iio_iostat_parse(const struct option *opt, const char *str,
+			    int unset __maybe_unused)
 {
 	int ret;
 	struct perf_stat_config *config = (struct perf_stat_config *)opt->data;
@@ -392,7 +392,7 @@ int iostat_parse(const struct option *opt, const char *str,
 	return ret;
 }
 
-void iostat_list(struct evlist *evlist, struct perf_stat_config *config)
+static void iio_iostat_list(struct evlist *evlist, struct perf_stat_config *config)
 {
 	struct evsel *evsel;
 	struct iio_root_port *rp = NULL;
@@ -405,7 +405,7 @@ void iostat_list(struct evlist *evlist, struct perf_stat_config *config)
 	}
 }
 
-void iostat_release(struct evlist *evlist)
+static void iio_iostat_release(struct evlist *evlist)
 {
 	struct evsel *evsel;
 	struct iio_root_port *rp = NULL;
@@ -418,7 +418,7 @@ void iostat_release(struct evlist *evlist)
 	}
 }
 
-void iostat_print_header_prefix(struct perf_stat_config *config)
+static void iio_iostat_print_header_prefix(struct perf_stat_config *config)
 {
 	if (config->csv_output)
 		fputs("port,", config->output);
@@ -428,8 +428,8 @@ void iostat_print_header_prefix(struct perf_stat_config *config)
 		fprintf(config->output, "   port         ");
 }
 
-void iostat_print_metric(struct perf_stat_config *config, struct evsel *evsel,
-			 struct perf_stat_output_ctx *out)
+static void iio_iostat_print_metric(struct perf_stat_config *config, struct evsel *evsel,
+				    struct perf_stat_output_ctx *out)
 {
 	double iostat_value = 0;
 	u64 prev_count_val = 0;
@@ -452,24 +452,54 @@ void iostat_print_metric(struct perf_stat_config *config, struct evsel *evsel,
 			  iostat_value / (256 * 1024));
 }
 
-void iostat_print_counters(struct evlist *evlist,
-			   struct perf_stat_config *config, struct timespec *ts,
-			   char *prefix, iostat_print_counter_t print_cnt_cb, void *arg)
+static void iio_iostat_print_counters(struct evlist *evlist,
+				      struct perf_stat_config *config, struct timespec *ts,
+				      char *prefix, iostat_print_counter_t print_cnt_cb, void *arg)
 {
 	void *perf_device = NULL;
 	struct evsel *counter = evlist__first(evlist);
 
 	evlist__set_selected(evlist, counter);
-	iostat_prefix(evlist, config, prefix, ts);
+	iio_iostat_prefix(evlist, config, prefix, ts);
 	fprintf(config->output, "%s", prefix);
 	evlist__for_each_entry(evlist, counter) {
 		perf_device = evlist->selected->priv;
 		if (perf_device && perf_device != counter->priv) {
 			evlist__set_selected(evlist, counter);
-			iostat_prefix(evlist, config, prefix, ts);
+			iio_iostat_prefix(evlist, config, prefix, ts);
 			fprintf(config->output, "\n%s", prefix);
 		}
 		print_cnt_cb(config, counter, arg);
 	}
 	fputc('\n', config->output);
 }
+
+/*
+ * FIXME: pmu name prefix match might not work for x86 iio.
+ */
+static bool iio_iostat_probe(struct iostat_pmu *iostat_pmu)
+{
+	return perf_pmus__scan_matching_wildcard(NULL, iostat_pmu->pmu_name_wildcard);
+}
+
+static struct iostat_pmu x86_iio_iostat_pmu_list[]  = {
+	{
+		.pmu_name_wildcard = "uncore_iio*",
+		.match = iio_iostat_probe,
+		.prepare = iio_iostat_prepare,
+		.parse = iio_iostat_parse,
+		.list = iio_iostat_list,
+		.print_header_prefix = iio_iostat_print_header_prefix,
+		.print_metric = iio_iostat_print_metric,
+		.print_counters = iio_iostat_print_counters,
+		.release = iio_iostat_release,
+	},
+};
+
+static void __attribute__((constructor)) x86_iio_iostat_pmu_init(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(x86_iio_iostat_pmu_list); i++)
+		register_iostat_pmu(&x86_iio_iostat_pmu_list[i]);
+}
-- 
2.33.0


