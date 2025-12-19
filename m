Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1301CD7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEfJqd25ja4+dmPfnVyfyC3KxtRaMu+sADNNwhmjIE4=; b=sZKk2daQq+ViNpZQke1Yzrdwtn
	z63KuaW168N3VuPOjJnTZBugyWD08GLk4kCyJSR0mWkW55+O98VXf7XUKEeYce24UX29hDFLVnwB5
	TqrbiUKvudwWMbFvcccbKK7rSRFCkLCkVUFiB8pploxnOU8aMmRXgCBh6TncCqwmmlb34LWlvopox
	VZZ7x2EkVQOwCm7mXBxnaq1/Jjn5hpna8PYrtw0LURwYmuj6/9qYATpUAlV4fa2q7cfLGoivBDOVr
	q/wNa2XJiciu1rWiN9IFjwanjwn7QFTDe86Znti5bTZJzVv1H1L6KbOr7Mi83bJ4moD11j5nXzk2R
	k2ntrTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWezz-0000000AnFz-0nP0;
	Fri, 19 Dec 2025 18:14:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWezn-0000000Amt8-2akp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:14:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0D061684;
	Fri, 19 Dec 2025 10:14:23 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 601D73F5CA;
	Fri, 19 Dec 2025 10:14:26 -0800 (PST)
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
	kvmarm@lists.linux.dev
Subject: [PATCH v2 31/45] arm_mpam: resctrl: Add kunit test for ABMC/CDP interactions
Date: Fri, 19 Dec 2025 18:11:33 +0000
Message-ID: <20251219181147.3404071-32-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101431_827825_A6B2BBCF 
X-CRM114-Status: GOOD (  11.89  )
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
2.43.0


