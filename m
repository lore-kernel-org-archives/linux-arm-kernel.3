Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A563FEDEC0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1o2MhPh9+ZeE7u/z+qBXrIbJ3flY0UMRQ5CbaMHY31U=; b=WNtHKE9G2mM7EQ6jNvGM3e1y2u
	5R5LELvfM3h3LPsiOlnPqTK4Wb/x5ekrhFMkkOLrvOCipW/c53x1a5W6083Q9/jI6hDgms4dR62b3
	l6viKZfrIu3Grokz7rYqj56ZFRMg/JeBwafi2QDhNZOSW+eRH6Iy9FkbMDrgZJY6sslBTit9vARAj
	JT52w/n1kci637bRNMCi4Z37ih0AV/3ZOZfdbGHH73AjttZ4VKL5u6QN+2nRsn0Cxf8W/afNIVanS
	805nROXL5XqJk81xy7aSNHd4TkP05DveDfhAk6j1EQijYo5jJL2L0pgOrc9a0qzQXOTOJgctGq/3T
	xE6qWliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSk-0000000GPLF-3HcS;
	Wed, 04 Mar 2026 04:03:54 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSe-0000000GPEb-3jgt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:03:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1o2MhPh9+ZeE7u/z+qBXrIbJ3flY0UMRQ5CbaMHY31U=;
	b=DCATHUJpULTz7dfsn5qUeqoLLAroUULOdj+2CCV6u74+I/mE7+TnRMoqyoDUac591cTZhKckm
	sSImPZ2kTA+chgVVy2XNDchJZcdH9b+7323FeEs8bh4l3NTPnNb7GdDz+xymsp7iW4mAOEdrfQm
	VNU7ZpRa5wkvRPuxHu+n8+M=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6D2VJxzcbMV;
	Wed,  4 Mar 2026 11:58:28 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7EB14202E6;
	Wed,  4 Mar 2026 12:03:41 +0800 (CST)
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
Subject: [RFC patch 9/9] selftests/resctrl: Add support for HiSilicon CAT/CMT test
Date: Wed, 4 Mar 2026 12:03:34 +0800
Message-ID: <20260304040334.765860-10-wuyifan50@huawei.com>
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
X-CRM114-CacheID: sfid-20260303_200349_224598_1E90280A 
X-CRM114-Status: GOOD (  16.71  )
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

This commit adds support for HiSilicon CAT/CMT test by adapting the
HiSilicon-specificed implementation.

1. Handle Cache Masking on HiSilicon: On HiSilicon's platform, all
cache are shareable, platform-level non-contiguous CAT is not applicable,
and the test should default to using the full cache.

2. Extend Non-Contiguous CAT Support: HiSilicon always support
non-contiguous CBM.

3. Specify Mount Options for HiSilicon resctrlfs: When mounting the
resctrl filesystem on HiSilicon platform, specify "l2" option.

4. Adjust Perf Event Attributes for ARM: ARM performance counters
do not support mode exclusion.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/cache.c     |  4 +++-
 tools/testing/selftests/resctrl/cat_test.c  | 18 +++++++++++-------
 tools/testing/selftests/resctrl/resctrlfs.c |  5 ++++-
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cache.c b/tools/testing/selftests/resctrl/cache.c
index 1ff1104e6575..798aefc6cb29 100644
--- a/tools/testing/selftests/resctrl/cache.c
+++ b/tools/testing/selftests/resctrl/cache.c
@@ -13,7 +13,9 @@ void perf_event_attr_initialize(struct perf_event_attr *pea, __u64 config)
 	pea->read_format = PERF_FORMAT_GROUP;
 	pea->exclude_kernel = 1;
 	pea->exclude_hv = 1;
-	pea->exclude_idle = 1;
+	/* ARM performance counters do not support mode exclusion */
+	if (get_vendor() != ARCH_HISILICON)
+		pea->exclude_idle = 1;
 	pea->exclude_callchain_kernel = 1;
 	pea->inherit = 1;
 	pea->exclude_guest = 1;
diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index f00b622c1460..e5365665a6d3 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -245,11 +245,15 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
 	ret = get_full_cbm(test->resource, &full_cache_mask);
 	if (ret)
 		return ret;
-	/* Get the largest contiguous exclusive portion of the cache */
-	ret = get_mask_no_shareable(test->resource, &long_mask);
-	if (ret)
-		return ret;
-
+	if (get_vendor() == ARCH_HISILICON) {
+		/* On HiSilicon's platform, all cache are shareable. */
+		long_mask = full_cache_mask;
+	} else {
+		/* Get the largest contiguous exclusive portion of the cache */
+		ret = get_mask_no_shareable(test->resource, &long_mask);
+		if (ret)
+			return ret;
+	}
 	/* Get L3/L2 cache size */
 	ret = get_cache_size(uparams->cpu, test->resource, &cache_total_size);
 	if (ret)
@@ -292,8 +296,8 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
 {
 	unsigned int vendor_id = get_vendor();
 
-	/* AMD and Hygon always support non-contiguous CBM. */
-	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
+	/* AMD and Hygon and HiSilicon always support non-contiguous CBM. */
+	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON || vendor_id == ARCH_HISILICON)
 		return true;
 
 #if defined(__i386__) || defined(__x86_64__) /* arch */
diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index 01b775cfe849..7567d3b31efb 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -69,7 +69,10 @@ int mount_resctrlfs(void)
 		return -1;
 
 	ksft_print_msg("Mounting resctrl to \"%s\"\n", RESCTRL_PATH);
-	ret = mount("resctrl", RESCTRL_PATH, "resctrl", 0, NULL);
+	if (get_vendor() == ARCH_HISILICON)
+		ret = mount("resctrl", RESCTRL_PATH, "resctrl", 0, "l2");
+	else
+		ret = mount("resctrl", RESCTRL_PATH, "resctrl", 0, NULL);
 	if (ret)
 		ksft_perror("mount");
 
-- 
2.33.0


