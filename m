Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E9DD374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWAYB9lFHvPH/zEtuNFLdnlJL+nC6gYqMKbHVtQrqic=; b=X0BjvwFBZs1OPmITyLfQHsSbLZ
	fCWeax4T+qMwMKb9G0rQ/Tw7abHIbnuqPZgkpW8o3c6sA5NQlpU8Se7sCVtbV1FCzfY03aFEIw7oz
	S6UMuopFilL8zixfPUghDIsyUYPvNPM4BLMfBovy+GB0/lH60oq/NSg3CA11WxuLZZFupg/7wsDQ3
	3SKBiekHWph2DUr0xosZMYXRON/8cN4IOizWarn/UFgtmlzgLRAKItIgV4sN2JfSMzEcpWKkEIY2k
	8VYZI9Hy0R2wYMPFQbLfZAD8xGF876cZumZAmOPV5s6nRHMEXcjQAwc/f+7BBgsBxIaqGkvLGIMNX
	uZAuVEmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrK-0000000A6Fk-1HGU;
	Fri, 05 Dec 2025 22:01:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrH-0000000A6Bx-3XFP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:01:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99DCF1AED;
	Fri,  5 Dec 2025 14:00:50 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38D443F740;
	Fri,  5 Dec 2025 14:00:54 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 22/38] arm_mpam: resctrl: Add kunit test for ABMC/CDP interactions
Date: Fri,  5 Dec 2025 21:58:45 +0000
Message-Id: <20251205215901.17772-23-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140100_194412_0B870E13 
X-CRM114-Status: GOOD (  11.98  )
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

ABMC exposes a fun corner case where a platform with one monitor can
use ABMC for assignable counters - but not when CDP is enabled.

Add some tests.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/test_mpam_resctrl.c | 62 +++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/resctrl/test_mpam_resctrl.c b/drivers/resctrl/test_mpam_resctrl.c
index d0615aa7671c..c83d54f21fa0 100644
--- a/drivers/resctrl/test_mpam_resctrl.c
+++ b/drivers/resctrl/test_mpam_resctrl.c
@@ -293,6 +293,67 @@ static void test_percent_to_max_rounding(struct kunit *test)
 	KUNIT_EXPECT_LE(test, 4 * num_rounded_up, 3 * total);
 }
 
+static void test_num_assignable_counters(struct kunit *test)
+{
+	unsigned int orig_l3_num_allocated_mbwu = l3_num_allocated_mbwu;
+	u32 orig_mpam_partid_max = mpam_partid_max;
+	u32 orig_mpam_pmg_max = mpam_pmg_max;
+	bool orig_cdp_enabled = cdp_enabled;
+	struct rdt_resource fake_l3;
+
+	/* Force there to be some PARTID/PMG */
+	mpam_partid_max = 3;
+	mpam_pmg_max = 1;
+
+	cdp_enabled = false;
+
+	/* ABMC off, CDP off */
+	l3_num_allocated_mbwu = resctrl_arch_system_num_rmid_idx();
+	mpam_resctrl_monitor_sync_abmc_vals(&fake_l3);
+	KUNIT_EXPECT_EQ(test, fake_l3.mon.num_mbm_cntrs, resctrl_arch_system_num_rmid_idx());
+	KUNIT_EXPECT_FALSE(test, fake_l3.mon.mbm_cntr_assignable);
+	KUNIT_EXPECT_FALSE(test, fake_l3.mon.mbm_assign_on_mkdir);
+
+	/* ABMC on, CDP off */
+	l3_num_allocated_mbwu = 4;
+	mpam_resctrl_monitor_sync_abmc_vals(&fake_l3);
+	KUNIT_EXPECT_EQ(test, fake_l3.mon.num_mbm_cntrs, 4);
+	KUNIT_EXPECT_TRUE(test, fake_l3.mon.mbm_cntr_assignable);
+	KUNIT_EXPECT_TRUE(test, fake_l3.mon.mbm_assign_on_mkdir);
+
+	cdp_enabled = true;
+
+	/* ABMC off, CDP on */
+	l3_num_allocated_mbwu = resctrl_arch_system_num_rmid_idx();
+	mpam_resctrl_monitor_sync_abmc_vals(&fake_l3);
+
+	/* (value not consumed by resctrl) */
+	KUNIT_EXPECT_EQ(test, fake_l3.mon.num_mbm_cntrs, resctrl_arch_system_num_rmid_idx() / 2);
+
+	KUNIT_EXPECT_FALSE(test, fake_l3.mon.mbm_cntr_assignable);
+	KUNIT_EXPECT_FALSE(test, fake_l3.mon.mbm_assign_on_mkdir);
+
+	/* ABMC on, CDP on */
+	l3_num_allocated_mbwu = 4;
+	mpam_resctrl_monitor_sync_abmc_vals(&fake_l3);
+	KUNIT_EXPECT_EQ(test, fake_l3.mon.num_mbm_cntrs, 2);
+	KUNIT_EXPECT_TRUE(test, fake_l3.mon.mbm_cntr_assignable);
+	KUNIT_EXPECT_TRUE(test, fake_l3.mon.mbm_assign_on_mkdir);
+
+	/* ABMC 'on', CDP on - but not enough counters */
+	l3_num_allocated_mbwu = 1;
+	mpam_resctrl_monitor_sync_abmc_vals(&fake_l3);
+	KUNIT_EXPECT_EQ(test, fake_l3.mon.num_mbm_cntrs, 0);
+	KUNIT_EXPECT_FALSE(test, fake_l3.mon.mbm_cntr_assignable);
+	KUNIT_EXPECT_FALSE(test, fake_l3.mon.mbm_assign_on_mkdir);
+
+	/* Restore global variables that were messed with */
+	l3_num_allocated_mbwu = orig_l3_num_allocated_mbwu;
+	mpam_partid_max = orig_mpam_partid_max;
+	mpam_pmg_max = orig_mpam_pmg_max;
+	cdp_enabled = orig_cdp_enabled;
+}
+
 static struct kunit_case mpam_resctrl_test_cases[] = {
 	KUNIT_CASE(test_get_mba_granularity),
 	KUNIT_CASE_PARAM(test_mbw_max_to_percent, test_percent_value_gen_params),
@@ -301,6 +362,7 @@ static struct kunit_case mpam_resctrl_test_cases[] = {
 	KUNIT_CASE(test_percent_to_max_rounding),
 	KUNIT_CASE_PARAM(test_percent_max_roundtrip_stability,
 			 test_all_bwa_wd_gen_params),
+	KUNIT_CASE(test_num_assignable_counters),
 	{}
 };
 
-- 
2.39.5


