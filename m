Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EDDEDEC0B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQ9wWnEAwMMv/g7eRzDnV2DW+8y/+QLCcLxd0GCgf84=; b=Ao3oG/owcFq55yvTZAsnVxInPh
	whW1DvD/kQZgrmAGxIinQ8mIcBAulz8GtNZk+T9r0ycdOMEoehbCyZchT0hw2xm4ZqP576t03Ofxc
	V+sLkBUnqAkOliEegOwIR5pla/HkULU+A/yotOCkDlwz2jB8h+YHlSqS510DdBBbx1EYYchLn/MCL
	YDbz0uuhQ/S18bDCvY+vTBBEvdsL27QovQITJ4bMHr3KuQfY5U4opjFpyHuUuopiA28JWTVlcd0XX
	RokQ9XzRKU1RlPKSLPBHU/rGLFV4Pks1l9lOfk6Dli1XZmY8VdsEEHoZbZWKnGc15ifNNK2etUX4J
	MWvyf0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSj-0000000GPJL-0weq;
	Wed, 04 Mar 2026 04:03:53 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSd-0000000GPEW-0gbP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:03:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZQ9wWnEAwMMv/g7eRzDnV2DW+8y/+QLCcLxd0GCgf84=;
	b=QF297jFbKvG1asuxqe3FXJJ0t7oZhg/SxBhetaFCJg62EqP7B94mII5r2ni+5pc2HP4X5F3wS
	N5ikcTKs9EWzPtA91tFEVCqA16kKrAmyUG+2/Y6J7kZUr3hwvSdvY9GlBVcyCkX5BxPHbPuvZG+
	gH3LIednybvjzVIvmqHgoMc=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6T1C0BzpSwC;
	Wed,  4 Mar 2026 11:58:41 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 301C240569;
	Wed,  4 Mar 2026 12:03:40 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:39 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [RFC patch 7/9] selftests/resctrl: Add support for HiSilicon memory bandwidth measurement
Date: Wed, 4 Mar 2026 12:03:32 +0800
Message-ID: <20260304040334.765860-8-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260304040334.765860-1-wuyifan50@huawei.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_200347_542048_E0F555B6 
X-CRM114-Status: GOOD (  24.38  )
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

This commit adds support for HiSilicon memory bandwidth measurement by
introducing vendor-specific implementations:

1. Counter Discovery for HiSilicon: A new function num_of_hisi_ddrc()
is implemented. It discovers the HiSilicon DDRC PMUs in the PMU path,
dynamically creating and linking counter structures into the global list
for each one found.

2. Support for config Perf Event Attribute: To adapt HiSilicon's perf
event configuration, struct imc_counter_config is augmented with a
__u64 config field, and get_read_event_and_umask() is updated to parse a
"config" token from the event files. The perf_event_attr configuration
logic now uses this config value if available, falling back to the
event/umask logic for Intel.

3. Resctrl Domain ID Discovery for MB: A new vendor-specific logic is
added to get_domain_id() in resctrlfs.c. On HiSilicon platforms, when the
resource is "MB", the domain ID is discovered by reading the NUMA Node
ID from the CPU's topology path (/sys/devices/system/cpu/cpuX/topology/),
as MPAM's Memory Bandwidth resource is scoped to NUMA domains.

4. Bandwidth Calculation Adjustment: The measure_read_mem_bw() function
is modified to handle the fundamental difference in reporting between
vendors: Intel's resctrl reports a cumulative historical delta value,
which must be converted to a rate division by MB. HiSilicon MPAM reports
a real-time value, which is used directly.

These changes collectively enable the selftests to accurately measure
memory bandwidth on HiSilicon platforms that implement MPAM.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 67 ++++++++++++++++++-
 tools/testing/selftests/resctrl/resctrlfs.c   | 20 ++++++
 2 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 75a3d359f16b..2c3df653e6ce 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -15,6 +15,8 @@
 
 #define CON_MBM_LOCAL_BYTES_PATH		\
 	"%s/%s/mon_data/mon_L3_%02d/mbm_local_bytes"
+#define CON_MBM_TOTAL_BYTES_PATH		\
+	"%s/%s/mon_data/mon_MB_%02d/mbm_total_bytes"
 
 struct membw_read_format {
 	__u64 value;         /* The value of the event */
@@ -27,6 +29,7 @@ struct imc_counter_config {
 	__u32 type;
 	__u64 event;
 	__u64 umask;
+	__u64 config;
 	struct perf_event_attr pe;
 	struct membw_read_format return_value;
 	int fd;
@@ -39,9 +42,11 @@ struct membw_read_config {
 	const char *event;
 	double scale;
 	int (*num_of)(void);
+	const char *mbm_path;
 };
 
 static int num_of_imcs(void);
+static int num_of_hisi_ddrc(void);
 
 static struct membw_read_config membw_read_configs[] = {
 	{
@@ -50,6 +55,15 @@ static struct membw_read_config membw_read_configs[] = {
 		.event = "events/cas_count_read",
 		.scale = 64.0 / MB,
 		.num_of = num_of_imcs,
+		.mbm_path = CON_MBM_LOCAL_BYTES_PATH
+	},
+	{
+		.vendor_id = ARCH_HISILICON,
+		.name = "hisi_sccl%d_ddrc%d_%d",
+		.event = "events/flux_rd",
+		.scale = 32.0 / MB,
+		.num_of = num_of_hisi_ddrc,
+		.mbm_path = CON_MBM_TOTAL_BYTES_PATH
 	},
 	{
 		.vendor_id = NULL
@@ -71,6 +85,7 @@ static void read_mem_bw_initialize_perf_event_attr(struct imc_counter_config *im
 	imc_counters_config->pe.inherit = 1;
 	imc_counters_config->pe.exclude_guest = 0;
 	imc_counters_config->pe.config =
+		imc_counters_config->config ? :
 		imc_counters_config->umask << 8 |
 		imc_counters_config->event;
 	imc_counters_config->pe.sample_type = PERF_SAMPLE_IDENTIFIER;
@@ -114,6 +129,8 @@ static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_con
 			imc_counters_config->event = strtol(token[i + 1], NULL, 16);
 		if (strcmp(token[i], "umask") == 0)
 			imc_counters_config->umask = strtol(token[i + 1], NULL, 16);
+		if (strcmp(token[i], "config") == 0)
+			imc_counters_config->config = strtol(token[i + 1], NULL, 16);
 	}
 }
 
@@ -248,6 +265,49 @@ static int num_of_imcs(void)
 	return count;
 }
 
+static int num_of_hisi_ddrc(void)
+{
+	char hisi_ddrc_dir[512], *temp;
+	unsigned int count = 0;
+	struct dirent *ep;
+	int ret;
+	DIR *dp;
+	struct imc_counter_config *imc_counters_config;
+
+	dp = opendir(DYN_PMU_PATH);
+	if (dp) {
+		while ((ep = readdir(dp))) {
+			if (!strstr(ep->d_name, "hisi") || !strstr(ep->d_name, "ddrc"))
+				continue;
+
+			imc_counters_config = malloc(sizeof(struct imc_counter_config));
+			sprintf(hisi_ddrc_dir, "%s/%s/", DYN_PMU_PATH,
+				ep->d_name);
+			ret = read_from_imc_dir(hisi_ddrc_dir, imc_counters_config);
+			if (ret) {
+				free(imc_counters_config);
+				closedir(dp);
+
+				return ret;
+			}
+			list_add(&imc_counters_config->imc_list, &imc_counters_configs);
+			count++;
+		}
+		closedir(dp);
+		if (count == 0) {
+			ksft_print_msg("Unable to find PMU counters\n");
+
+			return -1;
+		}
+	} else {
+		ksft_perror("Unable to open PMU directory");
+
+		return -1;
+	}
+
+	return count;
+}
+
 int initialize_read_mem_bw_imc(void)
 {
 	struct imc_counter_config *imc_counters_config;
@@ -382,7 +442,7 @@ static int get_read_mem_bw_imc(float *bw_imc)
 void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
 			       int domain_id)
 {
-	sprintf(mbm_total_path, CON_MBM_LOCAL_BYTES_PATH, RESCTRL_PATH,
+	sprintf(mbm_total_path, current_config->mbm_path, RESCTRL_PATH,
 		param->ctrlgrp, domain_id);
 }
 
@@ -579,7 +639,10 @@ int measure_read_mem_bw(const struct user_params *uparams,
 	perf_close_imc_read_mem_bw();
 	fclose(mem_bw_fp);
 
-	bw_resc = (bw_resc_end - bw_resc_start) / MB;
+	if (get_vendor() == ARCH_HISILICON)
+		bw_resc = bw_resc_end;
+	else
+		bw_resc = (bw_resc_end - bw_resc_start) / MB;
 
 	return print_results_bw(param->filename, bm_pid, bw_imc, bw_resc);
 
diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index b9c1bfb6cc02..01b775cfe849 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -139,6 +139,26 @@ int get_domain_id(const char *resource, int cpu_no, int *domain_id)
 	if (cache_num < 0)
 		return cache_num;
 
+	/* On HiSilicon's platform, the "MB" resource domain is associated with the NUMA Node. */
+	if (get_vendor() == ARCH_HISILICON && !strncmp(resource, "MB", sizeof("MB"))) {
+		struct dirent *ep;
+		DIR *dp;
+
+		sprintf(phys_pkg_path, "%s%d/", PHYS_ID_PATH, cpu_no);
+		dp = opendir(phys_pkg_path);
+		if (dp) {
+			while ((ep = readdir(dp))) {
+				if (!strstr(ep->d_name, "node"))
+					continue;
+				if (sscanf(ep->d_name, "node%d\n", domain_id) == 1)
+					return 0;
+			}
+			closedir(dp);
+		}
+		ksft_perror("Could not get domain ID");
+		return -1;
+	}
+
 	sprintf(phys_pkg_path, "%s%d/cache/index%d/id", PHYS_ID_PATH, cpu_no, cache_num);
 
 	fp = fopen(phys_pkg_path, "r");
-- 
2.33.0


