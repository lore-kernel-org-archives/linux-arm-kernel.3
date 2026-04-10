Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668ADE99064
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 09:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASxunNUXGSJJZD348DA2S3TTm5bdoy8jwQBI6RlCbrQ=; b=vy+NwXX9bJtrbA4Qk04+CHjy7V
	x84OfI9XEqa4uoewW+J1pVVnnUJL4bum/J41mBFSM+MY9wNCLs00ep4Fvny/LaYE8PUCDJRcf25Wf
	lnpF6HsKEGXiYJk61IhucJwADyiW3owlUkCpj57UsikAP6Dm2p3xP6UFR7swCJnroXEirDbvS5ZLY
	hqIhTqFHLNnLRhowWt0jxZx3WnAfCVexCR+HPS5PUFFaVYxoBjCyViX6iaWpG4ZqAlqSIvpWrM5+6
	1b68+vwOjbB+e3q8+UOdujEA79blutdcXpGpStFvXrdEJlNA1Z7PTcI7c+/BSKIa98EBmRM3VanT3
	PR5Y5Fzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Fe-0000000Bv63-1saV;
	Fri, 10 Apr 2026 09:34:10 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Fa-0000000Bv2w-0nMd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 09:34:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ASxunNUXGSJJZD348DA2S3TTm5bdoy8jwQBI6RlCbrQ=;
	b=TH+XxIR0Dd+KSV7xDZAHZ7tE1N3RKF41oSg8ounYclJ2kN/4kopzACd7U9atyEdqEWt49p+4W
	W4bngGoD0FExSNqcXTYv/jhmCzFO4pzbg6SgZGFj/AH4l57jj0m08rNAi2LMRtKnBE3nnGbcteM
	n5CfrsporjQYQ2UHbCOcfSU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fsWg26FWfz1K99S;
	Fri, 10 Apr 2026 17:27:42 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DEAE74056E;
	Fri, 10 Apr 2026 17:33:55 +0800 (CST)
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
Subject: [PATCH v2 3/6] selftests/resctrl: Refactor the initialization of IMC's perf_event_attr using linked list
Date: Fri, 10 Apr 2026 17:33:49 +0800
Message-ID: <20260410093352.3988125-4-wuyifan50@huawei.com>
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
X-CRM114-CacheID: sfid-20260410_023406_530626_B055A756 
X-CRM114-Status: GOOD (  12.40  )
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

The initialization of perf_event_attr in iMC is refactord using
linked list. Removed the initialization of the global variable imcs.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 60cda2214c13..ce675d349a6e 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -42,20 +42,18 @@ static struct imc_counter_config imc_counters_config[MAX_IMCS];
 LIST_HEAD(imc_counters_list);
 static const struct resctrl_test *current_test;
 
-static void read_mem_bw_initialize_perf_event_attr(int i)
+static void read_mem_bw_initialize_perf_event_attr(struct imc_counter_config *imc_counter)
 {
-	memset(&imc_counters_config[i].pe, 0,
-	       sizeof(struct perf_event_attr));
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
 
@@ -292,15 +290,17 @@ static int num_of_imcs(void)
 
 int initialize_read_mem_bw_imc(void)
 {
-	int imc;
+	struct imc_counter_config *imc_counter;
+	int ret;
 
-	imcs = num_of_imcs();
-	if (imcs <= 0)
-		return imcs;
+	ret = num_of_imcs();
+	if (ret < 0)
+		return ret;
 
 	/* Initialize perf_event_attr structures for all iMC's */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_initialize_perf_event_attr(imc);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
+		read_mem_bw_initialize_perf_event_attr(imc_counter);
+	}
 
 	return 0;
 }
-- 
2.43.0


