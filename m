Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17DCCF65FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQBIvjZPRygTR+KqidewsTuGin+HJsCKVIPd1KjVIv0=; b=umv7TjFErVrzoHm99BEAz2CkG8
	f6+crGlLMEZtzcum6YUGX6LDYxI1rY1v1471I15NDKL8M0j0BYjiW7ZtGEhmH0MS6k3J6HpysILDv
	eiyCiFMYxC5VxMK7YUk6BTYR/xnwQ7i3qciRC9PKYB8k2godSPO9ydJXmRMwEvIkafGFciMM4cym3
	sqe13ZFsgL2ky+8cE9LtRn50JaOwLDVRQhP9AdsSVyn81YCzvSwH2SV74m4QbUAEU1EZZmKaGXYuB
	9pY/N27Oqc96WA5rLo91x83LqfMVnf688+K6Z1vbz0vy9zR9lfOtFyb9QEJ43X4+TOML34netT1DX
	x06SGAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLqU-0000000CYri-1uHz;
	Mon, 26 Jan 2026 12:37:30 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLqR-0000000CYAb-1NaD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:37:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mQBIvjZPRygTR+KqidewsTuGin+HJsCKVIPd1KjVIv0=;
	b=YR4trii41UjRp+hs+BFiXHfQNNonqCtHAwn34cDsQRio80ag4k/VDEsKddOGCLLvpLdFl43iO
	A7uPm1TNpWQD4Y8BOhf/r2fnhKk7ivLI7kjH2xcCx4n3IpgJZNvbi3wBlV1yM1NvCCXYkJFNKRq
	FIyYYkrzK4zA4mVo2XcRnfE=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4f07F81NZLz12LKh;
	Mon, 26 Jan 2026 20:31:24 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 895FD2016A;
	Mon, 26 Jan 2026 20:35:19 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Jan 2026 20:35:19 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 26 Jan 2026 20:35:18 +0800
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
Subject: [RFT PATCH 4/7] perf-iostat: Extend iostat interface to support different iostat PMUs
Date: Mon, 26 Jan 2026 20:35:11 +0800
Message-ID: <20260126123514.3238425-5-wangyushan12@huawei.com>
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
X-CRM114-CacheID: sfid-20260126_043727_754169_71B04CEF 
X-CRM114-Status: GOOD (  14.96  )
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

Currently, platform-specific iostat code for PMUs is implemented as a
common iostat callback interface and linked during build. This approach
limits support for iostat across different implementations of PMU of the
same architecture.

To address this, extend common iostat interface to provide support for
different PMUs by allowing each PMU to register itself and receive
callbacks to its PMU-specific functions through the unified iostat
framework.

Signed-off-by: Shiju Jose  <shiju.jose@huawei.com>
Signed-off-by: Yushan Wang <wangyushan@huawei.com>
---
 tools/perf/util/iostat.c | 78 ++++++++++++++++++++++++++++------------
 tools/perf/util/iostat.h | 19 ++++++++--
 2 files changed, 73 insertions(+), 24 deletions(-)

diff --git a/tools/perf/util/iostat.c b/tools/perf/util/iostat.c
index a68ab100780d..84ab92d8f0b3 100644
--- a/tools/perf/util/iostat.c
+++ b/tools/perf/util/iostat.c
@@ -1,47 +1,81 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "util/iostat.h"
-#include "util/debug.h"
+
+static struct iostat_pmu_list *iostat_pmu;
 
 enum iostat_mode_t iostat_mode = IOSTAT_NONE;
 
-__weak int iostat_prepare(struct evlist *evlist __maybe_unused,
-			  struct perf_stat_config *config __maybe_unused)
+__weak int iostat_prepare(struct evlist *evlist, struct perf_stat_config *config)
+{
+	if (!iostat_pmu)
+		return -1;
+
+	return iostat_pmu->prepare(evlist, config);
+}
+
+__weak int iostat_parse(const struct option *opt, const char *str, int unset)
+{
+	if (!iostat_pmu)
+		return -1;
+
+	return iostat_pmu->parse(opt, str, unset);
+}
+
+__weak void iostat_list(struct evlist *evlist, struct perf_stat_config *config)
+{
+	iostat_pmu->list(evlist, config);
+}
+
+__weak void iostat_release(struct evlist *evlist)
 {
-	return -1;
+	iostat_pmu->release(evlist);
 }
 
-__weak int iostat_parse(const struct option *opt __maybe_unused,
-			 const char *str __maybe_unused,
-			 int unset __maybe_unused)
+__weak void iostat_print_header_prefix(struct perf_stat_config *config)
 {
-	pr_err("iostat mode is not supported on current platform\n");
-	return -1;
+	iostat_pmu->print_header_prefix(config);
 }
 
-__weak void iostat_list(struct evlist *evlist __maybe_unused,
-		       struct perf_stat_config *config __maybe_unused)
+__weak void iostat_print_metric(struct perf_stat_config *config,
+				struct evsel *evsel,
+				struct perf_stat_output_ctx *out)
 {
+	iostat_pmu->print_metric(config, evsel, out);
 }
 
-__weak void iostat_release(struct evlist *evlist __maybe_unused)
+__weak void iostat_print_counters(struct evlist *evlist,
+				  struct perf_stat_config *config,
+				  struct timespec *ts, char *prefix,
+				  iostat_print_counter_t print_cnt_cb,
+				  void *arg)
 {
+	iostat_pmu->print_counters(evlist, config, ts, prefix,
+				   print_cnt_cb, arg);
 }
 
-__weak void iostat_print_header_prefix(struct perf_stat_config *config __maybe_unused)
+int register_iostat_pmu(struct iostat_pmu_list *pmu)
 {
+	if (!pmu || !pmu->probe)
+		return -1;
+
+	if (pmu->probe(pmu))
+		return 0;
+
+	iostat_pmu = pmu;
+
+	return 0;
 }
 
-__weak void iostat_print_metric(struct perf_stat_config *config __maybe_unused,
-				struct evsel *evsel __maybe_unused,
-				struct perf_stat_output_ctx *out __maybe_unused)
+static void unregister_iostat_pmu(void)
 {
+	if (!iostat_pmu)
+		return;
+
+	iostat_pmu = NULL;
 }
 
-__weak void iostat_print_counters(struct evlist *evlist __maybe_unused,
-				  struct perf_stat_config *config __maybe_unused,
-				  struct timespec *ts __maybe_unused,
-				  char *prefix __maybe_unused,
-				  iostat_print_counter_t print_cnt_cb __maybe_unused,
-				  void *arg __maybe_unused)
+__attribute__((destructor))
+static void iostat_exit(void)
 {
+	unregister_iostat_pmu();
 }
diff --git a/tools/perf/util/iostat.h b/tools/perf/util/iostat.h
index 820930a096d9..58225542e49d 100644
--- a/tools/perf/util/iostat.h
+++ b/tools/perf/util/iostat.h
@@ -31,8 +31,7 @@ extern enum iostat_mode_t iostat_mode;
 typedef void (*iostat_print_counter_t)(struct perf_stat_config *, struct evsel *, void *);
 
 int iostat_prepare(struct evlist *evlist, struct perf_stat_config *config);
-int iostat_parse(const struct option *opt, const char *str,
-		 int unset __maybe_unused);
+int iostat_parse(const struct option *opt, const char *str, int unset);
 void iostat_list(struct evlist *evlist, struct perf_stat_config *config);
 void iostat_release(struct evlist *evlist);
 void iostat_print_header_prefix(struct perf_stat_config *config);
@@ -42,4 +41,20 @@ void iostat_print_counters(struct evlist *evlist,
 			   struct perf_stat_config *config, struct timespec *ts,
 			   char *prefix, iostat_print_counter_t print_cnt_cb, void *arg);
 
+struct iostat_pmu_list {
+	const char *pmu_name;
+	int (*probe)(struct iostat_pmu_list *iostat_pmu);
+	int (*prepare)(struct evlist *evlist, struct perf_stat_config *config);
+	int (*parse)(const struct option *opt, const char *str, int unset);
+	void (*list)(struct evlist *evlist, struct perf_stat_config *config);
+	void (*print_header_prefix)(struct perf_stat_config *config);
+	void (*print_metric)(struct perf_stat_config *config, struct evsel *evsel,
+			     struct perf_stat_output_ctx *out);
+	void (*print_counters)(struct evlist *evlist,
+			       struct perf_stat_config *config, struct timespec *ts,
+			       char *prefix, iostat_print_counter_t print_cnt_cb, void *arg);
+	void (*release)(struct evlist *evlist __maybe_unused);
+};
+
+int register_iostat_pmu(struct iostat_pmu_list *iostat_pmu);
 #endif /* _IOSTAT_H */
-- 
2.33.0


