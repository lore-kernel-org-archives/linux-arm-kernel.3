Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94755EDEC04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwKQfDZLKns5if9ynjLe+4Lfv8JmZHnCssBKf5Eyipg=; b=FuFE50HK6HU7fAOBPx+7zz2W8w
	fWYCFg4F6/weB2iS2d1ksncBOia27W7vxN0hlLe5p0IF96L2QlOzt3o88JG8wXt0a9/R80br33lJn
	6NLHPVJpsi2mj9086KoS9USpL8ReXZFjH1oPKFNRgY+yln5SkXFtNxbLHz4gw3jjbVBa73FR4NieS
	h4DaKvMYfODI0718VHTrWRvx69MnLNpVaWwuiuVONpzriDOJuzcmyT5iPWGzVawchC7dyDkUV8xCk
	8SUfweqqF+xSVTeUyi6Zo2Qy9qTuaSwnjBGA9j5jM1onQQC8I4TiA5/lFVhHHja5uir48iSVVAMQq
	gH+VgsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSf-0000000GPGi-0zW0;
	Wed, 04 Mar 2026 04:03:49 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSc-0000000GPES-1hp7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:03:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bwKQfDZLKns5if9ynjLe+4Lfv8JmZHnCssBKf5Eyipg=;
	b=WAg4xjzRmfHY89Eo0ZszbpSH/Z2W0H4GnS6RJ1qjD2esE8tihbU8WDcQqs3f6f+gYmq1UIcKB
	YlA8LYI1alqaz1jpfUZclwBo4nw7IcbTfuibltU4kr4YbSyxkoRYZ1r4wljqiZJk9bGpTGoN3bH
	iJIhERqdlLMmMRD+nEL/ilU=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6Z0MSnzLlSL;
	Wed,  4 Mar 2026 11:58:46 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DDF8A40562;
	Wed,  4 Mar 2026 12:03:36 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:36 +0800
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
Subject: [RFC patch 2/9] selftests/resctrl: Refactor resctrl_val.c for vendor-specific mem bw measurement
Date: Wed, 4 Mar 2026 12:03:27 +0800
Message-ID: <20260304040334.765860-3-wuyifan50@huawei.com>
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
X-CRM114-CacheID: sfid-20260303_200346_893131_6824F8FC 
X-CRM114-Status: GOOD (  16.78  )
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

Currently, the resctrl_val.c is tightly coupled with X86's uncore IMC
counter, which is inapplicable on other platforms like ARM.

This commit refactor resctrl_val.c by introducing a structure to support
vendor-specific PMU, event and scale. This allows the test to dynamically
select the PMU based on the detected CPU vendor, paving the way for
supporting multiple vendors and architectures.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 48 +++++++++++++++----
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 85ac96c7cb8f..b0570c615aac 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -10,10 +10,7 @@
  */
 #include "resctrl.h"
 
-#define UNCORE_IMC		"uncore_imc"
-#define READ_FILE_NAME		"events/cas_count_read"
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
-#define SCALE			0.00006103515625
 #define MAX_IMCS		20
 #define MAX_TOKENS		5
 
@@ -36,10 +33,30 @@ struct imc_counter_config {
 	int fd;
 };
 
+struct membw_read_config {
+	int vendor_id;
+	const char *name;
+	const char *event;
+	double scale;
+};
+
+static struct membw_read_config membw_read_configs[] = {
+	{
+		.vendor_id = ARCH_INTEL | ARCH_AMD | ARCH_HYGON,
+		.name = "uncore_imc",
+		.event = "events/cas_count_read",
+		.scale = 64.0 / MB,
+	},
+	{
+		.vendor_id = NULL
+	}
+};
+
 static char mbm_total_path[1024];
 static int imcs;
 static struct imc_counter_config imc_counters_config[MAX_IMCS];
 static const struct resctrl_test *current_test;
+static struct membw_read_config *current_config;
 
 static void read_mem_bw_initialize_perf_event_attr(int i)
 {
@@ -133,7 +150,7 @@ static int read_from_imc_dir(char *imc_dir, int count)
 	fclose(fp);
 
 	/* Get read config */
-	sprintf(imc_counter_cfg, "%s%s", imc_dir, READ_FILE_NAME);
+	sprintf(imc_counter_cfg, "%s%s", imc_dir, current_config->event);
 	fp = fopen(imc_counter_cfg, "r");
 	if (!fp) {
 		ksft_perror("Failed to open iMC config file");
@@ -176,18 +193,18 @@ static int num_of_imcs(void)
 	dp = opendir(DYN_PMU_PATH);
 	if (dp) {
 		while ((ep = readdir(dp))) {
-			temp = strstr(ep->d_name, UNCORE_IMC);
+			temp = strstr(ep->d_name, current_config->name);
 			if (!temp)
 				continue;
 
 			/*
 			 * imc counters are named as "uncore_imc_<n>", hence
 			 * increment the pointer to point to <n>. Note that
-			 * sizeof(UNCORE_IMC) would count for null character as
+			 * sizeof("uncore_imc") would count for null character as
 			 * well and hence the last underscore character in
 			 * uncore_imc'_' need not be counted.
 			 */
-			temp = temp + sizeof(UNCORE_IMC);
+			temp = temp + strlen(current_config->name) + 1;
 
 			/*
 			 * Some directories under "DYN_PMU_PATH" could have
@@ -328,7 +345,7 @@ static int get_read_mem_bw_imc(float *bw_imc)
 			of_mul_read = (float)r_time_enabled /
 					(float)r_time_running;
 
-		reads += r->return_value.value * of_mul_read * SCALE;
+		reads += r->return_value.value * of_mul_read * current_config->scale;
 	}
 
 	*bw_imc = reads;
@@ -469,6 +486,21 @@ static int print_results_bw(char *filename, pid_t bm_pid, float bw_imc,
 	return 0;
 }
 
+int initialize_measure_read_mem_bw(const struct resctrl_val_param *param, int domain_id)
+{
+	unsigned int vendor = get_vendor();
+
+	for (current_config = membw_read_configs;
+		!(current_config->vendor_id & vendor);
+		current_config++)
+		continue;
+
+	if (!current_config->vendor_id)
+		return -1;
+
+	return 0;
+}
+
 /*
  * measure_read_mem_bw - Measures read memory bandwidth numbers while benchmark runs
  * @uparams:		User supplied parameters
-- 
2.33.0


