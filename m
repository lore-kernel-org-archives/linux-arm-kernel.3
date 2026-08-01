Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DEAC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POLTv/dSyD6twt28Ah7GVbTOpw4mdCruwE8K2OjsAjk=; b=Lo4RYSEGRd+4xryKfqDhiL/Azn
	T/2NHaOuqOBgS9j4M7g06aIfl2Mid7jvfqaPf+475YQ9IQaG9jsWTiyHliU+JWy8IF9pEmqSyHRcE
	AtvTMhVOrcVf+GlCtP7UtMD2vUPgw1stIXjwc3dLEV4i8so4/cpceOEObromK1MlS5zVY8CokSKU3
	b7fYBHLvRiviRxb+bWlwyi5071ktaaVl+PhRt8DntQfRfHkfyQ6X515YXVwD5L+XLkaj2b6jxRriY
	EGrA/Emd6lbH9yxcs9kuRv5l/xCEap//4J36T+O3HQJRLNginmH7mYJ1FAZ/clClBppyKE9200RM+
	okudOXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5xX-0000000E8PP-3I8Z;
	Sat, 01 Aug 2026 09:24:47 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5xU-0000000E8NU-1KSF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 09:24:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=POLTv/dSyD6twt28Ah7GVbTOpw4mdCruwE8K2OjsAjk=;
	b=KnR0cgimq8mz/8eni2Ztl7+tofLt9gMAAssWaGhzrk+B9QRwGuwbaSdRaUEX0sKH5vAdPnJQN
	R4J7b3rgWthhheme1l/71yklrd3mY8Bsd70wKE7xISHjX5gtN4ZCvGgvxJLv10zTvJnFDJVPfcM
	xHszFCBFv4S3fWF0eJPr4JU=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hBy2G65mJzLlTg;
	Sat,  1 Aug 2026 17:15:02 +0800 (CST)
Received: from kwepemo100012.china.huawei.com (unknown [7.202.195.139])
	by mail.maildlp.com (Postfix) with ESMTPS id B003F402AB;
	Sat,  1 Aug 2026 17:24:31 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemo100012.china.huawei.com
 (7.202.195.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 1 Aug
 2026 17:24:30 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<zengheng4@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <prime.zeng@hisilicon.com>, <wangyushan12@huawei.com>,
	<xuwei5@huawei.com>, <wangzhou1@hisilicon.com>, <xiaqinxin@huawei.com>
Subject: [PATCH v4 1/3] selftests/resctrl: Introduce linked list management for IMC counters
Date: Sat, 1 Aug 2026 17:24:27 +0800
Message-ID: <20260801092429.533956-2-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260801092429.533956-1-wuyifan50@huawei.com>
References: <20260801092429.533956-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo100012.china.huawei.com (7.202.195.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_022444_670814_1FCA57F4 
X-CRM114-Status: GOOD (  17.01  )
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

The static array approach to managing IMC counters has fixed size
constraints and limited compatibility and scalability. Introduce
a linked list-based dynamic management infrastructure to address
these limitations. Add the core data structure definitions and
memory allocation and cleanup functions for dynamic counter
configurations.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/mba_test.c    |  1 +
 tools/testing/selftests/resctrl/mbm_test.c    |  1 +
 tools/testing/selftests/resctrl/resctrl.h     |  2 ++
 tools/testing/selftests/resctrl/resctrl_val.c | 27 +++++++++++++++++--
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 39cee9898359..4bb1a82eb195 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -166,6 +166,7 @@ static int check_results(void)
 
 static void mba_test_cleanup(void)
 {
+	cleanup_read_mem_bw_imc();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 6dbbc3b76003..68c89f50a34a 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -125,6 +125,7 @@ static int mbm_measure(const struct user_params *uparams,
 
 static void mbm_test_cleanup(void)
 {
+	cleanup_read_mem_bw_imc();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 175101022bf3..a7556cdae0de 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -24,6 +24,7 @@
 #include <linux/perf_event.h>
 #include <linux/compiler.h>
 #include <linux/bits.h>
+#include <linux/list.h>
 #include "kselftest.h"
 
 #define MB			(1024 * 1024)
@@ -183,6 +184,7 @@ void mem_flush(unsigned char *buf, size_t buf_size);
 void fill_cache_read(unsigned char *buf, size_t buf_size, bool once);
 ssize_t get_fill_buf_size(int cpu_no, const char *cache_type);
 int initialize_read_mem_bw_imc(void);
+void cleanup_read_mem_bw_imc(void);
 int measure_read_mem_bw(const struct user_params *uparams,
 			struct resctrl_val_param *param, pid_t bm_pid);
 void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index f20d2194c35f..a72dc4ae61fe 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -28,6 +28,7 @@ struct membw_read_format {
 };
 
 struct imc_counter_config {
+	struct list_head entry;
 	__u32 type;
 	__u64 event;
 	__u64 umask;
@@ -38,6 +39,7 @@ struct imc_counter_config {
 static char mbm_total_path[1024];
 static int imcs;
 static struct imc_counter_config imc_counters_config[MAX_IMCS];
+LIST_HEAD(imc_counters_list);
 static const struct resctrl_test *current_test;
 
 static void read_mem_bw_initialize_perf_event_attr(int i)
@@ -113,6 +115,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 				    unsigned int *count)
 {
 	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
+	struct imc_counter_config *imc_counter;
 	unsigned int orig_count = *count;
 	char cas_count_cfg[1024];
 	struct dirent *ep;
@@ -126,13 +129,13 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 			    imc_dir);
 	if (path_len >= sizeof(imc_events_dir)) {
 		ksft_print_msg("Unable to create path to %sevents\n", imc_dir);
-		return -1;
+		goto out;
 	}
 
 	dp = opendir(imc_events_dir);
 	if (!dp) {
 		ksft_perror("Unable to open PMU events directory");
-		return -1;
+		goto out;
 	}
 
 	while ((ep = readdir(dp))) {
@@ -167,11 +170,17 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 			ksft_print_msg("Maximum iMC count exceeded\n");
 			goto out_close;
 		}
+		imc_counter = calloc(1, sizeof(*imc_counter));
+		if (!imc_counter) {
+			ksft_perror("Unable to allocate memory for iMC counters");
+			goto out_close;
+		}
 
 		imc_counters_config[*count].type = type;
 		get_read_event_and_umask(cas_count_cfg, *count);
 		/* Do not fail after incrementing *count. */
 		*count += 1;
+		list_add(&imc_counter->entry, &imc_counters_list);
 	}
 	if (*count == orig_count) {
 		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
@@ -180,6 +189,10 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 	ret = 0;
 out_close:
 	closedir(dp);
+out:
+	if (ret)
+		cleanup_read_mem_bw_imc();
+
 	return ret;
 }
 
@@ -303,6 +316,16 @@ int initialize_read_mem_bw_imc(void)
 	return 0;
 }
 
+void cleanup_read_mem_bw_imc(void)
+{
+	struct imc_counter_config *imc_counter, *tmp;
+
+	list_for_each_entry_safe(imc_counter, tmp, &imc_counters_list, entry) {
+		list_del(&imc_counter->entry);
+		free(imc_counter);
+	}
+}
+
 static void perf_close_imc_read_mem_bw(void)
 {
 	int mc;
-- 
2.33.0


