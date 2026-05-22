Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7F4CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNhtQynUSMX8CBylWZqil3jgv21dIBg3EJ4bjxpLHvc=; b=P7fE72tPZVVoRYfuQWzepU0K+v
	eZRbfW6A3aaI78XV6691CjRhW0Ru/E+H5utqvVAOLpKsUlHkwSJsbAe/FcveU8++ySDryNNawcAhJ
	Y/DKzKixI8qSpuCl2gn98j5eGuJvk4UasLr54pXqJLpixCqlFmQMpFQvKgU7M/YLIsvr5tOu7riRx
	Lcl9ExQnWbodkIxNGtZXamFftaqs39Jse4v2kd3USdA6MmeHKy3WIFaNKjPr/bi0oqe3NzbhDG+Ir
	EAUwp/0fbt5M5zjGp+FongbQuO6RA+g18WBuEVrjBvZ/2QxavqQUBtooAG5O56rHbduesBOBGhRK8
	KT1LK8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLpT-0000000AGcT-3moH;
	Fri, 22 May 2026 09:06:03 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLpK-0000000AGW6-0PEb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:05:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UNhtQynUSMX8CBylWZqil3jgv21dIBg3EJ4bjxpLHvc=;
	b=J5Y5fsWHgJASf1qHmTo/jX639skQry9E+gSc7ahMEqkpWeCbKku33EB6xbq/LcBKF5sw5bskq
	y2rQ3hr04RoDWmv1aaEo3eUDfKwLDDYfZVAPAv6Y1ekGyE14p1T56/ineQIZEerf9QLbGGkYSgc
	ARowT8VpOrokHb9UbN5B7iE=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gMK1N4pqvzLlSh;
	Fri, 22 May 2026 16:58:00 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D47A340539;
	Fri, 22 May 2026 17:05:42 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 22 May
 2026 17:05:42 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <shuah@kernel.org>, <tan.shaopeng@fujitsu.com>,
	<fenghuay@nvidia.com>, <ben.horgan@arm.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v3 2/3] selftests/resctrl: Replace counter index references with pointers
Date: Fri, 22 May 2026 17:05:39 +0800
Message-ID: <20260522090540.444554-3-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260522090540.444554-1-wuyifan50@huawei.com>
References: <20260522090540.444554-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_020554_474830_3DBBDFC4 
X-CRM114-Status: GOOD (  13.45  )
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

Replace direct counter number references with pointers to remove the
dependency on fixed array indexing and enable the use of different
data structures for counter management.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 62 +++++++++----------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index a72dc4ae61fe..3d2b6919717a 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -42,40 +42,40 @@ static struct imc_counter_config imc_counters_config[MAX_IMCS];
 LIST_HEAD(imc_counters_list);
 static const struct resctrl_test *current_test;
 
-static void read_mem_bw_initialize_perf_event_attr(int i)
+static void read_mem_bw_initialize_perf_event_attr(struct imc_counter_config *imc_counter)
 {
-	memset(&imc_counters_config[i].pe, 0,
+	memset(&imc_counter->pe, 0,
 	       sizeof(struct perf_event_attr));
-	imc_counters_config[i].pe.type = imc_counters_config[i].type;
-	imc_counters_config[i].pe.size = sizeof(struct perf_event_attr);
-	imc_counters_config[i].pe.disabled = 1;
-	imc_counters_config[i].pe.inherit = 1;
-	imc_counters_config[i].pe.exclude_guest = 0;
-	imc_counters_config[i].pe.config =
-		imc_counters_config[i].umask << 8 |
-		imc_counters_config[i].event;
-	imc_counters_config[i].pe.sample_type = PERF_SAMPLE_IDENTIFIER;
-	imc_counters_config[i].pe.read_format =
+	imc_counter->pe.type = imc_counter->type;
+	imc_counter->pe.size = sizeof(struct perf_event_attr);
+	imc_counter->pe.disabled = 1;
+	imc_counter->pe.inherit = 1;
+	imc_counter->pe.exclude_guest = 0;
+	imc_counter->pe.config =
+		imc_counter->umask << 8 |
+		imc_counter->event;
+	imc_counter->pe.sample_type = PERF_SAMPLE_IDENTIFIER;
+	imc_counter->pe.read_format =
 		PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
 }
 
-static void read_mem_bw_ioctl_perf_event_ioc_reset_enable(int i)
+static void read_mem_bw_ioctl_perf_event_ioc_reset_enable(struct imc_counter_config *imc_counter)
 {
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_RESET, 0);
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_ENABLE, 0);
+	ioctl(imc_counter->fd, PERF_EVENT_IOC_RESET, 0);
+	ioctl(imc_counter->fd, PERF_EVENT_IOC_ENABLE, 0);
 }
 
-static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
+static void read_mem_bw_ioctl_perf_event_ioc_disable(struct imc_counter_config *imc_counter)
 {
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_DISABLE, 0);
+	ioctl(imc_counter->fd, PERF_EVENT_IOC_DISABLE, 0);
 }
 
 /*
  * get_read_event_and_umask:	Parse config into event and umask
  * @cas_count_cfg:	Config
- * @count:		iMC number
+ * @imc_counter:	iMC counter config
  */
-static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
+static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_config *imc_counter)
 {
 	char *token[MAX_TOKENS];
 	int i = 0;
@@ -89,21 +89,21 @@ static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
 		if (!token[i])
 			break;
 		if (strcmp(token[i], "event") == 0)
-			imc_counters_config[count].event = strtol(token[i + 1], NULL, 16);
+			imc_counter->event = strtol(token[i + 1], NULL, 16);
 		if (strcmp(token[i], "umask") == 0)
-			imc_counters_config[count].umask = strtol(token[i + 1], NULL, 16);
+			imc_counter->umask = strtol(token[i + 1], NULL, 16);
 	}
 }
 
-static int open_perf_read_event(int i, int cpu_no)
+static int open_perf_read_event(int cpu_no, struct imc_counter_config *imc_counter)
 {
-	imc_counters_config[i].fd =
-		perf_event_open(&imc_counters_config[i].pe, -1, cpu_no, -1,
+	imc_counter->fd =
+		perf_event_open(&imc_counter->pe, -1, cpu_no, -1,
 				PERF_FLAG_FD_CLOEXEC);
 
-	if (imc_counters_config[i].fd == -1) {
+	if (imc_counter->fd == -1) {
 		fprintf(stderr, "Error opening leader %llx\n",
-			imc_counters_config[i].pe.config);
+			imc_counter->pe.config);
 
 		return -1;
 	}
@@ -177,7 +177,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 		}
 
 		imc_counters_config[*count].type = type;
-		get_read_event_and_umask(cas_count_cfg, *count);
+		get_read_event_and_umask(cas_count_cfg, &imc_counters_config[*count]);
 		/* Do not fail after incrementing *count. */
 		*count += 1;
 		list_add(&imc_counter->entry, &imc_counters_list);
@@ -311,7 +311,7 @@ int initialize_read_mem_bw_imc(void)
 
 	/* Initialize perf_event_attr structures for all iMC's */
 	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_initialize_perf_event_attr(imc);
+		read_mem_bw_initialize_perf_event_attr(&imc_counters_config[imc]);
 
 	return 0;
 }
@@ -350,7 +350,7 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
 		imc_counters_config[imc].fd = -1;
 
 	for (imc = 0; imc < imcs; imc++) {
-		ret = open_perf_read_event(imc, cpu_no);
+		ret = open_perf_read_event(cpu_no, &imc_counters_config[imc]);
 		if (ret)
 			goto close_fds;
 	}
@@ -373,13 +373,13 @@ static void do_imc_read_mem_bw_test(void)
 	int imc;
 
 	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc);
+		read_mem_bw_ioctl_perf_event_ioc_reset_enable(&imc_counters_config[imc]);
 
 	sleep(1);
 
 	/* Stop counters after a second to get results. */
 	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_disable(imc);
+		read_mem_bw_ioctl_perf_event_ioc_disable(&imc_counters_config[imc]);
 }
 
 /*
-- 
2.34.1


