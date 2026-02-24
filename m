Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FA7F4BB6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/f7wXLxrYRGqTC9JgfLqmQkwlwuQASOsJtyL6OXD1jY=; b=db2fYeP5ofYLMbnIUCYY7ggcHc
	MIr1oZWBK8sSZTQ7d1LRI+K1z57yeajQA3RY4KxYeHshkSzEHGolasG0gxlW6SwoW+DA5RBWxB4z2
	OWSReyqwpTLPHOcGg7P+jQ1caMeZghN3AgCZIV0zpsrzzeY61FuSdX6Ss5z4xv8nBAIydY92IUxM8
	luC5XbwnL3tU9fnpqEmjlA42Ez6PQtcc+vWijBGsW3Hmafi6lHR5Yxdd0CChot5dLLpOqYFE3nPkS
	N+aLzADs2Rgm20GTGuZnDkKhwU8DDdJ0HadowU/2J9wGiKPxECIyce0lxzvXKvWAQnGroiMP/Qt6z
	L77hAOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwhB-00000002YeF-06GY;
	Tue, 24 Feb 2026 17:59:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwh4-00000002YVI-3PNw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:59:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E94D1595;
	Tue, 24 Feb 2026 09:59:27 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08D303F59E;
	Tue, 24 Feb 2026 09:59:28 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v5 23/41] arm_mpam: resctrl: Add kunit test for rmid idx conversions
Date: Tue, 24 Feb 2026 17:57:02 +0000
Message-ID: <20260224175720.2663924-24-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_095935_064917_EF09951B 
X-CRM114-Status: GOOD (  10.14  )
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

As MPAM's pmg are scoped by partid and RDT's rmid are global the
rescrl mapping to an index needs to differ.

Add some tests for the MPAM rmid mapping.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/test_mpam_resctrl.c | 49 +++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/resctrl/test_mpam_resctrl.c b/drivers/resctrl/test_mpam_resctrl.c
index b93d6ad87e43..a20da161d965 100644
--- a/drivers/resctrl/test_mpam_resctrl.c
+++ b/drivers/resctrl/test_mpam_resctrl.c
@@ -296,6 +296,54 @@ static void test_percent_to_max_rounding(struct kunit *test)
 	KUNIT_EXPECT_LE(test, 4 * num_rounded_up, 3 * total);
 }
 
+struct rmid_idx_case {
+	u32 max_partid;
+	u32 max_pmg;
+};
+
+static const struct rmid_idx_case rmid_idx_cases[] = {
+	{0, 0}, {1, 4}, {3, 1}, {5, 9}, {4, 4}, {100, 11}, {0xFFFF, 0xFF},
+};
+
+static void test_rmid_idx_desc(const struct rmid_idx_case *param, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "max_partid=%d, max_pmg=%d\n",
+		 param->max_partid, param->max_pmg);
+}
+
+KUNIT_ARRAY_PARAM(test_rmid_idx, rmid_idx_cases, test_rmid_idx_desc);
+
+static void test_rmid_idx_encoding(struct kunit *test)
+{
+	u32 orig_mpam_partid_max = mpam_partid_max;
+	u32 orig_mpam_pmg_max = mpam_pmg_max;
+	const struct rmid_idx_case *param = test->param_value;
+	u32 idx, num_idx, count = 0;
+
+	mpam_partid_max = param->max_partid;
+	mpam_pmg_max = param->max_pmg;
+
+	for (u32 partid = 0; partid <= mpam_partid_max; partid++) {
+		for (u32 pmg = 0; pmg <= mpam_pmg_max; pmg++) {
+			u32 partid_out, pmg_out;
+
+			idx = resctrl_arch_rmid_idx_encode(partid, pmg);
+			/* Confirm there are no holes in the rmid idx range */
+			KUNIT_EXPECT_EQ(test, count, idx);
+			count++;
+			resctrl_arch_rmid_idx_decode(idx, &partid_out, &pmg_out);
+			KUNIT_EXPECT_EQ(test, pmg, pmg_out);
+			KUNIT_EXPECT_EQ(test, partid, partid_out);
+		}
+	}
+	num_idx = resctrl_arch_system_num_rmid_idx();
+	KUNIT_EXPECT_EQ(test, idx + 1, num_idx);
+
+	/* Restore global variables that were messed with */
+	mpam_partid_max = orig_mpam_partid_max;
+	mpam_pmg_max = orig_mpam_pmg_max;
+}
+
 static struct kunit_case mpam_resctrl_test_cases[] = {
 	KUNIT_CASE(test_get_mba_granularity),
 	KUNIT_CASE_PARAM(test_mbw_max_to_percent, test_percent_value_gen_params),
@@ -304,6 +352,7 @@ static struct kunit_case mpam_resctrl_test_cases[] = {
 	KUNIT_CASE(test_percent_to_max_rounding),
 	KUNIT_CASE_PARAM(test_percent_max_roundtrip_stability,
 			 test_all_bwa_wd_gen_params),
+	KUNIT_CASE_PARAM(test_rmid_idx_encoding, test_rmid_idx_gen_params),
 	{}
 };
 
-- 
2.43.0


