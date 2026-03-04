Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FCEEDEC04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffq+ffv2AEW6XoO4gokHEtGBQnh5vVWTy9dBnVUZO6c=; b=qy6ZSGQPAK6XugJ6uz2gn5A5V4
	akeXYsw8rAQsAlurB/+rJfpuL6PZXjDNsI7fyQhIbYiDYYohiQsK5isSvXyBWJokwgz6/0t3uEPTv
	d0VGu80IBX726DFSQTdkQn7I7edmgnsxRYVQ7LqRZzfk5NUpFo9Falq/6crl9YFXmc6T/+x3k+gsD
	b/PRLkU9UnQz+kSzWPTplZFi4EPlvf+Ea89QZ0FR2PZYhlYidvZC3dOc1IOlZDma3XSjaqPYjDpan
	Kw0l2amnCaKILN2ipEX9X1xBj7W3kjwK0hTEIcLMcD9DU2KN90NuAJzoXVhYxmv8MmTlxXa6vmOo3
	Hrj4jJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSk-0000000GPKR-0hbN;
	Wed, 04 Mar 2026 04:03:54 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSe-0000000GPEd-1nUS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:03:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ffq+ffv2AEW6XoO4gokHEtGBQnh5vVWTy9dBnVUZO6c=;
	b=TiP32JKAkclrZflA0AxrMU2liHLl2vMgh/tED2yzwJl5dwqMbFr32EgBJxeONevUt08Ufsob9
	tpf3FcOzFvoYh8NnaXk2GAKJcDwLdHQY5oG1brMx2eQlU0OpZ2YmX0h6G4tkVW1MswpG7kVEJuw
	pUecLwUTKdF2tRHDcDfdQds=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6b6jdbzRhTQ;
	Wed,  4 Mar 2026 11:58:47 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3544A202E6;
	Wed,  4 Mar 2026 12:03:38 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:37 +0800
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
Subject: [RFC patch 4/9] selftests/resctrl: Move memory bandwidth measurement init and cleanup to resctrl_val.c
Date: Wed, 4 Mar 2026 12:03:29 +0800
Message-ID: <20260304040334.765860-5-wuyifan50@huawei.com>
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
X-CRM114-CacheID: sfid-20260303_200348_800069_5FD55FA2 
X-CRM114-Status: GOOD (  12.16  )
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

The initialization for memory bandwidth measurement was duplicated across
mbm_test.c and mba_test.c.

This commit move the memory bandwidth measurement's initialization
to resctrl_val.c. It introduces a new common initialization function,
including the new vendor-specific configuration setup.

Additionally, a cleanup call has been added to the test teardown routines
to ensure that resources allocated during initialization are properly
released.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/mba_test.c    | 11 ++---------
 tools/testing/selftests/resctrl/mbm_test.c    | 11 ++---------
 tools/testing/selftests/resctrl/resctrl_val.c |  8 ++++++++
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index c7e9adc0368f..c41914f6a2e6 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -19,15 +19,7 @@
 
 static int mba_init(const struct resctrl_val_param *param, int domain_id)
 {
-	int ret;
-
-	ret = initialize_read_mem_bw_imc();
-	if (ret)
-		return ret;
-
-	initialize_mem_bw_resctrl(param, domain_id);
-
-	return 0;
+	return initialize_measure_read_mem_bw(param, domain_id);
 }
 
 /*
@@ -164,6 +156,7 @@ static int check_results(void)
 
 static void mba_test_cleanup(void)
 {
+	cleanup_read_mem_bw_imc();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 84d8bc250539..1d4ef268db5a 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -85,15 +85,7 @@ static int check_results(size_t span)
 
 static int mbm_init(const struct resctrl_val_param *param, int domain_id)
 {
-	int ret;
-
-	ret = initialize_read_mem_bw_imc();
-	if (ret)
-		return ret;
-
-	initialize_mem_bw_resctrl(param, domain_id);
-
-	return 0;
+	return initialize_measure_read_mem_bw(param, domain_id);
 }
 
 static int mbm_setup(const struct resctrl_test *test,
@@ -123,6 +115,7 @@ static int mbm_measure(const struct user_params *uparams,
 
 static void mbm_test_cleanup(void)
 {
+	cleanup_read_mem_bw_imc();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 68e46c863474..75a3d359f16b 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -520,6 +520,14 @@ int initialize_measure_read_mem_bw(const struct resctrl_val_param *param, int do
 	if (!current_config->vendor_id)
 		return -1;
 
+	int ret;
+
+	ret = initialize_read_mem_bw_imc();
+	if (ret)
+		return ret;
+
+	initialize_mem_bw_resctrl(param, domain_id);
+
 	return 0;
 }
 
-- 
2.33.0


