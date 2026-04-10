Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD11E99063
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 09:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLLBswuP5vM3z5lAacgS6ua4SOqTqK53UTCgIoBMBEo=; b=JipEBiw//8YtRjE6jlUS+PC/NZ
	19tvqLkwGmNF4op9ztcLrUlV0zpXqOeLGcc+SK1MFb+9E7WG/2dG57Jm+DFR/mzVk//gO3lflojkA
	kxW9AmtoYmMs2xuoDTQtuHDKvKRw330KAR888tYglGG/ZUDOybgQl4dI8/AcQmzYSBMcVtHPJA8wk
	hKMTTy82PAwTTEStrjBbZXymaNe+m1ypErvdafYoca89iViWScA1Vb6YtFg7znXwlsr2Sqfd2sFLa
	ZakWjVk0B8MhU3Tos18IBH3wNAU6IgfPeMmwRYv2Y4vQ7NmnLLlw1lA/cWgDpC6YQYuJ8bpy0oN5b
	Ged7uXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Fp-0000000BvDc-1gnS;
	Fri, 10 Apr 2026 09:34:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Fn-0000000BvBN-30uI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 09:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DLLBswuP5vM3z5lAacgS6ua4SOqTqK53UTCgIoBMBEo=; b=gzoCJdctaR0nn0N+GrQ/JhBHim
	11sEvqXzBcc0pGYrNd5PktnU3XN6u56jMHs7FE5wb5fwuwznLWXMUywdL8XdBMlFFeiO/cHw/M8xq
	0/OMfFFgx+JcxJ25DfiTEUZ3B7oMDGAk/0qEr1MJHyCGifaWHmE37T9kYtlNLXQXQd+TysVA2t9e3
	8Ap9pUhi9SWdgTTUluw6cJhcyb1FUgx70Ht9hN2NA3fzGKjwM1c0GfhqexvRFQ3k8HwTrL2HrB0fy
	PGYTU/KYI7ztKfUC/4YvT/MjMtCNTWx/prieqlaI30i9Pto02hE4nw8wTaG/COB2kEotRssBpT/JE
	pkd5oovw==;
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Fk-0000000DBfx-0REu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 09:34:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DLLBswuP5vM3z5lAacgS6ua4SOqTqK53UTCgIoBMBEo=;
	b=2kQJBhYcCAUSFJz0qMblYLUswiA7EtkYi9er+gxjSkCI4+1m7fgnghStdHTgKu2J5O97d3vLL
	gTnndwLN2qiMWG0MMXQMoYIhmENHG7WdZC1ujaSHxmzysk515XJCCtYycbqk5g59ZdwQj6Rm4kK
	zFJM235wAHiQz7pl8ymnHGc=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fsWfy4J6Pz1prKv;
	Fri, 10 Apr 2026 17:27:38 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A8FC440571;
	Fri, 10 Apr 2026 17:33:56 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 10 Apr
 2026 17:33:55 +0800
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
Subject: [PATCH v2 4/6] selftests/resctrl: Refactor perf event open/close using linked list
Date: Fri, 10 Apr 2026 17:33:50 +0800
Message-ID: <20260410093352.3988125-5-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260410093352.3988125-1-wuyifan50@huawei.com>
References: <20260410093352.3988125-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_103416_753428_FEAAF3AE 
X-CRM114-Status: GOOD (  10.94  )
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

Using linked list when open/close perf event.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index ce675d349a6e..ce5f96d5457c 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -93,15 +93,15 @@ static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_con
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
@@ -318,11 +318,11 @@ void cleanup_read_mem_bw_imc(void)
 
 static void perf_close_imc_read_mem_bw(void)
 {
-	int mc;
+	struct imc_counter_config *imc_counter;
 
-	for (mc = 0; mc < imcs; mc++) {
-		if (imc_counters_config[mc].fd != -1)
-			close(imc_counters_config[mc].fd);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
+		if (imc_counter->fd != -1)
+			close(imc_counter->fd);
 	}
 }
 
@@ -334,13 +334,14 @@ static void perf_close_imc_read_mem_bw(void)
  */
 static int perf_open_imc_read_mem_bw(int cpu_no)
 {
-	int imc, ret;
+	struct imc_counter_config *imc_counter;
+	int ret;
 
-	for (imc = 0; imc < imcs; imc++)
-		imc_counters_config[imc].fd = -1;
+	list_for_each_entry(imc_counter, &imc_counters_list, entry)
+		imc_counter->fd = -1;
 
-	for (imc = 0; imc < imcs; imc++) {
-		ret = open_perf_read_event(imc, cpu_no);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
+		ret = open_perf_read_event(cpu_no, imc_counter);
 		if (ret)
 			goto close_fds;
 	}
-- 
2.43.0


