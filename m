Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E09EDEC0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0uaACBVh1x7LkH20bvlUt3ZEiQsV/Byfo7bO3qkE0U=; b=vatqeXS/4TOlzcDl3eAhWDm1Vz
	T/nWnbDYSO3uWnsSNx6XdtQ/Qc0N1S4OO6nvPNlXAIGomW+whe0Z4Sa//IfGv/1WTdRJ17ybWryd/
	M/uYi6lA2qTUgARwmSIfuy8rWvKfbyEXLqH7vo1Y/yNZbGQYns8lBv5UPKdWYjiPwL9GdqfdpdVVh
	FrToc08+rz9BMFS0XlNXJkMNz1BYfGQ6JFmbzFMhBiQ5NB1kmE1Q2MdB2gJraxjxNvFZK4+NquLn4
	wiFifSwQyPXFYe/kx0mTqyLS3PzEESRHNpdJsECZ687VrElW9QBA/Sn3+CNP1H3Owd0krh3dejEra
	zfa5HgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSj-0000000GPK4-3Zsp;
	Wed, 04 Mar 2026 04:03:53 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSe-0000000GPEX-16ti
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:03:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=K0uaACBVh1x7LkH20bvlUt3ZEiQsV/Byfo7bO3qkE0U=;
	b=z0l1/gC9C8fHpD4xjAvIMvKGXxoOytCuapn5GmNMDZb9WF9e6mc4zbYQy3ckjswNFTFJepDPK
	yPSL0Pp/ezRdfyHCbJIDa6DvypwLeHzNxeQNgZOk+FVRQ2GCE+EzLsyn+kbFBRvm/UXKVqkQVik
	6AQId4aQF+t9axYm5JAa0Qo=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6h1jBYz1K9Bt;
	Wed,  4 Mar 2026 11:58:52 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D87D940561;
	Wed,  4 Mar 2026 12:03:40 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:40 +0800
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
Subject: [RFC patch 8/9] selftests/resctrl: Add support for HiSilicon MBM/MBA test
Date: Wed, 4 Mar 2026 12:03:33 +0800
Message-ID: <20260304040334.765860-9-wuyifan50@huawei.com>
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
X-CRM114-CacheID: sfid-20260303_200348_641683_ABC62ACD 
X-CRM114-Status: GOOD (  13.41  )
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

This commit adds the support to check and test this feature on HiSilicon
platform.

Specifically, this is because on HiSilicon platform, the mbm_total_bytes
counter for MBM/MBA is located in the MB_MON, which is distinct from other
monitoring paths.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/mba_test.c | 24 +++++++++++++++++++---
 tools/testing/selftests/resctrl/mbm_test.c | 23 +++++++++++++++++----
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index c41914f6a2e6..ebed2d2d6ce0 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -202,14 +202,32 @@ static int mba_run_test(const struct resctrl_test *test, const struct user_param
 
 static bool mba_feature_check(const struct resctrl_test *test)
 {
-	return test_resource_feature_check(test) &&
-	       resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes");
+	unsigned int vendor = get_vendor();
+	bool feature_exists = false;
+
+	switch (vendor) {
+	case ARCH_INTEL:
+		feature_exists = test_resource_feature_check(test) &&
+					resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes");
+		break;
+
+	case ARCH_HISILICON:
+		feature_exists = test_resource_feature_check(test) &&
+					resctrl_mon_feature_exists("MB_MON", "mbm_total_bytes");
+		break;
+
+	default:
+		break;
+	}
+
+	return feature_exists;
+
 }
 
 struct resctrl_test mba_test = {
 	.name = "MBA",
 	.resource = "MB",
-	.vendor_specific = ARCH_INTEL,
+	.vendor_specific = ARCH_INTEL | ARCH_HISILICON,
 	.feature_check = mba_feature_check,
 	.run_test = mba_run_test,
 	.cleanup = mba_test_cleanup,
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 1d4ef268db5a..44bb450398e7 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -161,14 +161,29 @@ static int mbm_run_test(const struct resctrl_test *test, const struct user_param
 
 static bool mbm_feature_check(const struct resctrl_test *test)
 {
-	return resctrl_mon_feature_exists("L3_MON", "mbm_total_bytes") &&
-	       resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes");
-}
+	unsigned int vendor = get_vendor();
+	bool feature_exists = false;
+
+	switch (vendor) {
+	case ARCH_INTEL:
+		feature_exists = resctrl_mon_feature_exists("L3_MON", "mbm_total_bytes") &&
+					resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes");
+		break;
+
+	case ARCH_HISILICON:
+		feature_exists = resctrl_mon_feature_exists("MB_MON", "mbm_total_bytes");
+		break;
 
+	default:
+		break;
+	}
+
+	return feature_exists;
+}
 struct resctrl_test mbm_test = {
 	.name = "MBM",
 	.resource = "MB",
-	.vendor_specific = ARCH_INTEL,
+	.vendor_specific = ARCH_INTEL | ARCH_HISILICON,
 	.feature_check = mbm_feature_check,
 	.run_test = mbm_run_test,
 	.cleanup = mbm_test_cleanup,
-- 
2.33.0


