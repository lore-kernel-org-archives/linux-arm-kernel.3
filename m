Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABBCFD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 20:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QW6AlhejLviX/hFwvrmERR5NEYXPY6Z39JX3HPakhs=; b=zNn/6HFAu4Q2u7OEDAw/c8fJkw
	kQusNzTDRdlq81TIEjwsY29qbtPmyp+gGC/q+9DJUZ3s6CdTVcgn24dKvbdA6Uw9QgNqbRT4GFLwk
	VH+e64bmEifJpxs+DDJxWDQvEcXYELmGwuAq7b7knIhzarRDFleVQb3rFX86lYyz0UwrzZkxQM0vG
	we/mvRqUQ837oN9nxexpCUsv7o3YA9yigccztn5poVO/eWXJGf5vx71RwNwq6PDTPyyC4w+IDSw6S
	3DDdV2Mo3GSTVpStIRGq9Pjs/lQwNfb6hX2qhgfvNEn4LbZhu7hnE3VggomDfI/tvw8wR6FycI09q
	9QLNAmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLuS-00000004sfn-3gD9;
	Wed, 25 Feb 2026 20:55:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLuO-00000004seK-3k4X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 20:55:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C10481758;
	Wed, 25 Feb 2026 12:54:52 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8DF943F73B;
	Wed, 25 Feb 2026 12:54:55 -0800 (PST)
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
	zengheng4@huawei.com
Subject: [RFC PATCH v1 2/4] arm_mpam: resctrl: Add kunit test for ABMC/CDP interactions
Date: Wed, 25 Feb 2026 20:54:34 +0000
Message-ID: <20260225205436.3571756-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225205436.3571756-1-ben.horgan@arm.com>
References: <20260225205436.3571756-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_125501_052176_9DB22429 
X-CRM114-Status: GOOD (  12.39  )
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

From: James Morse <james.morse@arm.com>

ABMC exposes a fun corner case where a platform with one monitor can use
ABMC for assignable counters - but not when CDP is enabled.

Add some tests.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/test_mpam_resctrl.c | 62 +++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/resctrl/test_mpam_resctrl.c b/drivers/resctrl/test_mpam_resctrl.c
index a20da161d965..fd63f7bbb147 100644
--- a/drivers/resctrl/test_mpam_resctrl.c
+++ b/drivers/resctrl/test_mpam_resctrl.c
@@ -344,6 +344,67 @@ static void test_rmid_idx_encoding(struct kunit *test)
 	mpam_pmg_max = orig_mpam_pmg_max;
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
@@ -353,6 +414,7 @@ static struct kunit_case mpam_resctrl_test_cases[] = {
 	KUNIT_CASE_PARAM(test_percent_max_roundtrip_stability,
 			 test_all_bwa_wd_gen_params),
 	KUNIT_CASE_PARAM(test_rmid_idx_encoding, test_rmid_idx_gen_params),
+	KUNIT_CASE(test_num_assignable_counters),
 	{}
 };
 
-- 
2.43.0


