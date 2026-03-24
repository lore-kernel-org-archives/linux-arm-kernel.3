Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10839D58CCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIuCbAbKu7kNYu1ZZRlrYWiiyCn0PY9hwvPkx8mbFIM=; b=TFLHafipqGf26zoK6xA1A/EIEL
	PTrrMCTfnUmQUe1/SjNK5xMM11zWu1PdXoEHy8UdUjMQNryuXaMSJsvS+cRSHnVACPx9+QutRJGtI
	Mfox6Zl+S3cewfqyWjgxO8e8H0tsoiYmbnkbwpEkydTbUhuLWNZRyq9bgLKziqbj87gH+YVHiI970
	PCymxn3r4Sdr43/64HK2gAmw7XjCOlQOBJEQXKARLP5tqqVOjYkMGIc+n8TrEzWLiNagNT+u1ohSF
	HlmaYKPjTq8T3GxcIMasc+r3iyK/myrBzlOV4VQa5/zqEI5kG413wjxKm1fP0BtzHW1YHO4SGjlZ9
	iG2l0TxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Dp-00000001R4z-2tyq;
	Tue, 24 Mar 2026 12:51:01 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Dj-00000001Qzi-3SNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:50:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SIuCbAbKu7kNYu1ZZRlrYWiiyCn0PY9hwvPkx8mbFIM=;
	b=Qe/WPNGhmzdxIAlsb49zn0p4EuElA8IG/GzRsvveUIDc3T5s1V+CddX6mAM5Ov+WUn8f22RNd
	kdkCtYOz27uvxsYYhP3kKG0GQ0A3zaMVGEcsopVUnkGec0fIECrQ3KX+ovDOs5VHvR4dc8Yt/2l
	4nGS9QO9A3FtFit07oCycLc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fg8qz1tL8zRhRB;
	Tue, 24 Mar 2026 20:44:31 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B9354056A;
	Tue, 24 Mar 2026 20:50:36 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Mar
 2026 20:50:35 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<wuyifan50@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH 1/3] selftests/resctrl: Introduced linked list management for IMC counters
Date: Tue, 24 Mar 2026 20:50:32 +0800
Message-ID: <20260324125034.1509177-2-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260324125034.1509177-1-wuyifan50@huawei.com>
References: <20260324125034.1509177-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_055056_667599_E2CA0D31 
X-CRM114-Status: GOOD (  13.79  )
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

Added linked list based management for IMC counter configurations,
allowing the system to dynamically allocate and clean up resources based on
actual hardware capabilities.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 tools/testing/selftests/resctrl/resctrl_val.c | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 175101022bf3..29c9f76132f0 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -24,6 +24,7 @@
 #include <linux/perf_event.h>
 #include <linux/compiler.h>
 #include <linux/bits.h>
+#include  <linux/list.h>
 #include "kselftest.h"
 
 #define MB			(1024 * 1024)
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index f20d2194c35f..ac58d3862281 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -28,6 +28,7 @@ struct membw_read_format {
 };
 
 struct imc_counter_config {
+	struct list_head imc_list;
 	__u32 type;
 	__u64 event;
 	__u64 umask;
@@ -38,6 +39,7 @@ struct imc_counter_config {
 static char mbm_total_path[1024];
 static int imcs;
 static struct imc_counter_config imc_counters_config[MAX_IMCS];
+LIST_HEAD(imc_counters_configs);
 static const struct resctrl_test *current_test;
 
 static void read_mem_bw_initialize_perf_event_attr(int i)
@@ -235,6 +237,7 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
  */
 static int num_of_imcs(void)
 {
+	struct imc_counter_config *imc_counters_config;
 	char imc_dir[512], *temp;
 	unsigned int count = 0;
 	struct dirent *ep;
@@ -263,14 +266,23 @@ static int num_of_imcs(void)
 			 * first character is a numerical digit or not.
 			 */
 			if (temp[0] >= '0' && temp[0] <= '9') {
+				imc_counters_config = malloc(sizeof(struct imc_counter_config));
+				if (!imc_counters_config) {
+					ksft_print_msg("Unable to allocate memory for iMC counters\n");
+
+					return -1;
+				}
+				memset(imc_counters_config, 0, sizeof(struct imc_counter_config));
 				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
 				ret = read_from_imc_dir(imc_dir, &count);
 				if (ret) {
+					free(imc_counters_config);
 					closedir(dp);
 
 					return ret;
 				}
+				list_add(&imc_counters_config->imc_list, &imc_counters_configs);
 			}
 		}
 		closedir(dp);
@@ -303,6 +315,19 @@ int initialize_read_mem_bw_imc(void)
 	return 0;
 }
 
+void cleanup_read_mem_bw_imc(void)
+{
+	struct imc_counter_config *next_imc_counters_config;
+	struct imc_counter_config *imc_counters_config;
+
+	list_for_each_entry_safe(imc_counters_config, next_imc_counters_config,
+				 &imc_counters_configs, imc_list) {
+		list_del(&imc_counters_config->imc_list);
+		free(imc_counters_config);
+	}
+	INIT_LIST_HEAD(&imc_counters_configs);
+}
+
 static void perf_close_imc_read_mem_bw(void)
 {
 	int mc;
-- 
2.33.0


